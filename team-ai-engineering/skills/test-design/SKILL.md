# Test Design Skill

- Bắt đầu từ behavior và risk, không bắt đầu từ implementation.
- Bao phủ happy path, boundary, invalid input, authorization, retry và failure.
- Dùng test pyramid: unit nhiều, integration vừa đủ, end-to-end cho critical journey.
- Test phải deterministic, cô lập và cleanup tài nguyên.
- Mỗi bug fix cần regression test tái hiện lỗi trước khi sửa.
