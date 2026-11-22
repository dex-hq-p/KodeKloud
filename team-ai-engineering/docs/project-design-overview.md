# Project Design Overview

## 1. Mục tiêu

`team-ai-engineering` là bộ quy tắc, agent, workflow và template dùng chung để hỗ trợ vòng đời phát triển phần mềm theo AIDLC. Thiết kế ưu tiên kiểm soát của developer, dấu vết quyết định và khả năng tùy chỉnh theo team.

## 2. Kiến trúc thành phần

```text
Developer
   |
   v
Orchestrator ----> Task Coordinator (approval, notes, delivery)
   |
   +----> Solution Architect / DBA
   +----> Backend / Frontend / Full-stack
   +----> DevOps
   +----> Code Reviewer
   |
   +----> Steering + Workflows + Skills + Templates
   |
   +----> project-ai-context (read on demand)
   |
   +----> MCP integrations (only when configured and approved)
```

- **Agents** xác định vai trò, phạm vi và quyền công cụ.
- **Steering** quy định chính sách áp dụng xuyên suốt.
- **Workflows** trình bày thứ tự công việc và điểm cần developer xác nhận.
- **Skills** cung cấp quy trình chuyên môn theo yêu cầu.
- **Templates** chuẩn hóa artifact và ghi chú.
- **Profiles** cho phép bổ sung quy ước riêng mà không làm lệch chính sách chung.
- **Integrations** hướng dẫn cấu hình hệ thống ngoài; credential không nằm trong repo.

## 3. Vòng đời AIDLC

1. **Analyze:** xác nhận Task ID, phạm vi và điều kiện chấp nhận; tạo analysis note.
2. **Design:** đề xuất giải pháp, pattern, trade-off và tác động; chưa sửa code.
3. **Approve:** developer xem xét và xác nhận solution rõ ràng trước khi implement.
4. **Implement:** agent chuyên môn thực hiện thay đổi nhỏ, có kiểm thử liên quan.
5. **Verify:** chạy kiểm tra phù hợp, review diff và ghi nhận kết quả.
6. **Deliver:** hỏi riêng về nơi lưu tài liệu và quyền push code; không tự ý push.
7. **Audit:** lưu quyết định, trạng thái approval và kết quả bàn giao vào note hoặc hệ thống đích đã được xác nhận.

Checkpoint có thể dừng task. Im lặng, thiếu Task ID, thiếu link/topic hoặc thiếu branch không được xem là approval.

## 4. Kiểm soát push và lưu note

- **Tài liệu:** hỏi developer có muốn push không; nếu có, bắt buộc nhận link/topic đích và xác nhận hành động. Nếu không, lưu vào `notes/<TASK-ID>/`.
- **Code:** hỏi remote và branch cụ thể, đồng thời xin quyền thực hiện `git push`. Chỉ câu trả lời rõ ràng cho task và đích hiện tại mới là approval.
- `.kiro/hooks/before-git-push.json` kiểm tra lệnh shell push theo approval cục bộ một lần; approval phải khớp remote/branch và được tiêu thụ khi dùng.
- Hook là guardrail kỹ thuật, không thay thế review quyền, quy trình bảo vệ branch, hoặc xác nhận của developer.
- Không push Confluent, Git, Bitbucket hay tạo PR nếu thiếu đích cụ thể và đồng ý rõ ràng.

## 5. Tích hợp `project-ai-context`

`project-ai-context` là nguồn context nghiệp vụ/vận hành bên ngoài repo này. Đọc theo task:

1. Tài liệu `_shared/architecture-overview.md` nếu cần hiểu kiến trúc tổng thể.
2. `CONTEXT.md` của domain/service/job liên quan.
3. `rules.md` hoặc runbook chi tiết chỉ khi task chạm tới phạm vi đó.

Đường dẫn có thể khác theo workspace; xác nhận vị trí thực tế thay vì giả định. Không sao chép secret hay context không liên quan vào note.

## 6. Mở rộng đa team

- Chính sách chung ở `.kiro/steering/` là baseline.
- Team thêm override có phạm vi trong `profiles/<team>/`; không sửa ngầm chính sách bảo mật hoặc approval.
- Mỗi profile cần ghi owner, phạm vi áp dụng và các khác biệt.
- Thay đổi agent/workflow có ảnh hưởng chung cần cập nhật version và changelog.

## 7. Ranh giới và giả định

- Đây là scaffold; endpoint MCP, quyền, lệnh lint và quy trình release cần được cấu hình/kiểm chứng tại môi trường từng team.
- Agent không được tự nhận đã approve, chạy production operation, hoặc suy diễn dữ liệu còn thiếu.
- Lỗi nghiệp vụ thuộc owner domain; DBA, DevOps và agent phát triển phối hợp theo phạm vi chuyên môn.
