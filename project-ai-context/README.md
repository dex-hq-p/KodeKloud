# Project AI Context

Kho tài liệu ngữ cảnh để AI và thành viên dự án tra cứu theo đúng phạm vi công việc. Bắt đầu từ `CONTEXT.md` của repo tương ứng, sau đó chỉ mở các tài liệu chi tiết liên quan đến task.

## Cách sử dụng

1. Xác định loại tài liệu: domain, service điều phối, job nền, hay hạ tầng.
2. Đọc `CONTEXT.md` trong thư mục tương ứng.
3. Mở các tài liệu được liên kết trong đó, giới hạn ở domain/sub-domain hoặc job đang làm.
4. Khi cập nhật code làm thay đổi API, nghiệp vụ, dependency hay lịch chạy, cập nhật tài liệu liên quan cùng lúc.
5. Dùng `_templates/` để khởi tạo context cho repo mới; thay nội dung hướng dẫn bằng thông tin đã xác minh từ code và chủ sở hữu hệ thống.

## Danh mục

### Tài liệu dùng chung

- [_shared/architecture-overview.md](./_shared/architecture-overview.md): luồng tổng quan giữa Nginx, Gateway, Aggregation và Domain.
- [_shared/global-glossary.md](./_shared/global-glossary.md): thuật ngữ dùng chung.
- [_shared/security-headers.md](./_shared/security-headers.md): header định danh và tenant cần được xác minh tại biên tin cậy.

### Templates

- [_templates/domain-template/](./_templates/domain-template/): domain và sub-domain.
- [_templates/service-template/](./_templates/service-template/): service điều phối.
- [_templates/job-template/](./_templates/job-template/): worker chạy nền.

### Domains

- [domains/benefit/](./domains/benefit/): domain phúc lợi nhân viên.
  - [sub-benefits/coupon/](./domains/benefit/sub-benefits/coupon/): mã giảm giá/voucher.
  - [sub-benefits/birth/](./domains/benefit/sub-benefits/birth/): hỗ trợ sinh con.
  - [sub-benefits/family-event/](./domains/benefit/sub-benefits/family-event/): kết hôn, tang chế.
  - [sub-benefits/childcare/](./domains/benefit/sub-benefits/childcare/): hỗ trợ gửi trẻ.

### Services

- [services/aggregation/](./services/aggregation/): BFF điều phối dữ liệu cho frontend.

### Jobs

- [jobs/jobs-benefit/](./jobs/jobs-benefit/): worker batch cho Benefit.

### Infrastructure

- [infrastructure/](./infrastructure/): runbook và context vận hành cho AWS, pipeline/cluster và known issues.
  - [_templates/infrastructure-template/runbook-template.md](./_templates/infrastructure-template/runbook-template.md): khuôn runbook cho một sự cố.
  - [aws-services/](./infrastructure/aws-services/): tài liệu AWS.
  - [devops-pipeline/](./infrastructure/devops-pipeline/): Kubernetes, CI/CD và pipeline.
  - [server-issues/known-issues.md](./infrastructure/server-issues/known-issues.md): mục lục sự cố đã xác minh.

## Nguyên tắc duy trì

- Không suy đoán hợp đồng API, cấu trúc DB, quyền truy cập hoặc quy tắc nghiệp vụ; ghi rõ mục nào cần xác minh.
- Giữ luật nghiệp vụ trong domain sở hữu luật đó. Service điều phối không thay thế domain để quyết định nghiệp vụ cốt lõi.
- Chỉ đưa thông tin tổng quan vào `CONTEXT.md`; chuyển chi tiết theo nghiệp vụ vào tài liệu được liên kết.
- Không đưa secret, token, dữ liệu cá nhân hoặc thông tin production nhạy cảm vào kho context.
