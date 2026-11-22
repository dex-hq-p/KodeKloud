import json
import re
import shlex
import sys
from datetime import datetime, timedelta, timezone
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
APPROVAL_FILE = ROOT / ".kiro" / "local" / "push-approval.json"


def deny(message: str) -> None:
    print(message, file=sys.stderr)
    raise SystemExit(2)


try:
    event = json.load(sys.stdin)
except (json.JSONDecodeError, UnicodeDecodeError):
    deny("Push guard could not read the hook event; command blocked.")

if not isinstance(event, dict):
    deny("Push guard received an invalid hook event; command blocked.")

tool_input = event.get("tool_input", {})
command = tool_input.get("command", "") if isinstance(tool_input, dict) else ""
if not isinstance(command, str):
    deny("Push guard could not identify the shell command; command blocked.")

if not re.search(r"(?<![A-Za-z0-9_-])git(?=\s)", command) or not re.search(
    r"(?<![A-Za-z0-9_-])push(?=\s|$)", command
):
    raise SystemExit(0)

if any(char in command for char in ";&|`$()<>\n\r"):
    deny("Push guard only permits a single plain `git push <remote> <branch>` command.")

try:
    parts = shlex.split(command)
except ValueError:
    deny("Push guard could not parse the shell command; command blocked.")

if len(parts) != 4 or parts[:2] != ["git", "push"]:
    deny("Push guard only permits `git push <remote> <branch>`.")

remote, branch = parts[2], parts[3]
try:
    approval = json.loads(APPROVAL_FILE.read_text())
except (OSError, json.JSONDecodeError):
    deny("No valid one-time push approval found. Ask the developer for explicit approval.")

if not isinstance(approval, dict):
    deny("Push approval has an invalid format.")

if not all(
    isinstance(approval.get(field), str) and approval[field].strip()
    for field in ("task_id", "approved_by", "approved_at", "expires_at")
):
    deny("Push approval is missing its task/audit details.")

try:
    approved_at = datetime.fromisoformat(approval["approved_at"].replace("Z", "+00:00"))
    expires_at = datetime.fromisoformat(approval["expires_at"].replace("Z", "+00:00"))
except ValueError:
    deny("Push approval timestamps must be ISO-8601 values.")

now = datetime.now(timezone.utc)
if (
    approved_at.tzinfo is None
    or expires_at.tzinfo is None
    or approved_at > now
    or expires_at <= now
    or expires_at > approved_at + timedelta(minutes=10)
):
    deny("Push approval is expired, invalid, or lasts longer than 10 minutes.")

if approval.get("remote") != remote or approval.get("branch") != branch:
    deny("Push target does not match the approved remote and branch.")

try:
    APPROVAL_FILE.unlink()
except OSError:
    deny("Could not consume the one-time approval; push blocked.")
