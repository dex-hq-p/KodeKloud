# Spring Boot Development Skill

- Tổ chức theo controller, service/domain, repository và integration boundary.
- Dùng DTO cho API, Bean Validation cho input và error response thống nhất.
- Dùng constructor injection; giới hạn transaction ở service boundary.
- Test bằng unit test cho logic và integration test cho database/message boundary.
- External call phải có timeout, retry có giới hạn và correlation id.
