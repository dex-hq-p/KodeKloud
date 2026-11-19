# Spring Boot Example

Ví dụ này mô tả cấu trúc tối thiểu được khuyến nghị:

```text
src/main/java/.../feature/
├── FeatureController.java
├── FeatureService.java
└── FeatureResponse.java
```

API nên có validation, error model, test cho service và integration test cho
boundary bên ngoài.
