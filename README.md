# Warehouse Management System

A sample Warehouse Management System implemented with Spring Boot (Java). This project demonstrates a simple backend for managing warehouses, products, stock, users, orders, and inventory logs. It was built as part of an applied software development course project.

## Highlights

- Spring Boot application with layered architecture (controllers, services, repositories).
- REST API endpoints for managing Users, Products, Warehouses, Stock, and Orders.
- DTOs and mappers for separating entity and API models.
- Seed data available in `src/main/resources/data.sql` for quick startup.

## Quick facts

- Project artifact: Java + Spring Boot
- Package: `edu.miu.cs489.project.wms`
- Main class: `WarehouseManagementSystemApplication` (`src/main/java/.../WarehouseManagementSystemApplication.java`)

## Requirements

- Java 11 or later (check `pom.xml` for target Java version).
- Maven (the repo includes the Maven wrapper so you can use `mvnw.cmd` on Windows).

## Run locally (Windows PowerShell)

1. Build and run with the included Maven wrapper:

```powershell
.\mvnw.cmd spring-boot:run
```

2. Or build the JAR and run it:

```powershell
.\mvnw.cmd clean package
java -jar target\*.jar
```

The app will start on port 8080 by default. Check `src/main/resources/application.properties` to change configuration.

## API Overview

The project exposes REST controllers located under `src/main/java/edu/miu/cs489/project/wms/controller/`.

Key controllers:

- `AuthController` — authentication endpoints (login/register) if implemented.
- `UserController` — manage users.
- `ProductController` — manage products and product data.
- `WarehouseController` — manage warehouses.
- `StockController` — manage stock entries and stock operations.
- `OrderController` — manage orders and order processing.

Use a tool like Postman or curl to interact with the endpoints. If the project includes OpenAPI/Swagger configuration (`OpenAPIConfig`), Swagger UI may be available at `/swagger-ui.html` or `/swagger-ui/index.html` when the app is running.

## Seed data

This repository contains `src/main/resources/data.sql` which inserts sample data on application startup (check `application.properties` for the datasource settings and whether data.sql runs on startup).

## Tests

Run tests with Maven:

```powershell
.\mvnw.cmd test
```

Unit/integration tests (if present) are in `src/test/java`.

## Project structure (important files)

- `src/main/java/.../controller/` — REST controllers
- `src/main/java/.../service/` — business logic
- `src/main/java/.../repository/` — data access
- `src/main/java/.../dto/` — DTOs for API payloads
- `src/main/java/.../entity/` — JPA entities
- `src/main/resources/application.properties` — configuration
- `src/main/resources/data.sql` — optional seed data

## Notes & next steps

- If you plan to run this in a production-like environment, externalize configuration (database, credentials) and do not use `data.sql` for production data.
- Add more API documentation (Swagger/OpenAPI) and example Postman collections to make the API easier to test.

## Contributing

Contributions are welcome. Create a new branch, add tests for new features/bug fixes, and open a pull request describing the change.

## License

Specify your license here (e.g., MIT) or add a `LICENSE` file at the repository root.

---

If you'd like, I can: add a Postman collection, expand the README with example requests/responses, or wire up Swagger UI and screenshots. Tell me which you'd prefer next.
