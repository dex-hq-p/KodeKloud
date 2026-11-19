# Architecture

```text
Kiro
├── agents/       WHO: vai trò và trách nhiệm
├── steering/     WHAT: luật chung luôn áp dụng
└── settings/     HOW: kết nối MCP

skills/           Hướng dẫn chuyên môn
workflows/        Chuỗi vai theo loại công việc
integrations/     Cấu hình và vận hành hệ thống ngoài
hooks/            Trigger tự động hóa
examples/         Ví dụ tối thiểu
```

`.kiro/steering` là policy baseline. `agents` mô tả ownership. `skills` và
`workflows` hướng dẫn execution nhưng không được vượt qua security policy.
