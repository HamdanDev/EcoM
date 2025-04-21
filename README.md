# ECommerce Platform

## Project Overview
The ECommerce Platform is a microservices-based application designed to handle various aspects of an e-commerce system. It includes services for product catalog management, inventory tracking, order processing, payment handling, notifications, analytics, and a frontend user interface.

## Project Structure
The solution consists of the following services:

- **ProductCatalogService**: Manages product information.
- **InventoryService**: Tracks inventory levels.
- **OrderService**: Handles order processing.
- **PaymentService**: Manages payment transactions.
- **NotificationService**: Sends notifications to users.
- **AnalyticsService**: Provides analytics and reporting.
- **FrontendUI**: The user interface for the platform.

## Setup Instructions
The following commands were used to create and set up this project:

1. **Create the Solution**:
   ```bash
   dotnet new sln -n ECommercePlatform
   ```

2. **Create Each Service**:
   ```bash
   dotnet new webapi -n ProductCatalogService
   dotnet new webapi -n InventoryService
   dotnet new webapi -n OrderService
   dotnet new webapi -n PaymentService
   dotnet new webapi -n NotificationService
   dotnet new webapi -n AnalyticsService
   ```

3. **Create the Frontend**:
   ```bash
   dotnet new blazorserver -n FrontendUI
   ```

4. **Add Projects to the Solution**:
   ```bash
   dotnet sln add ProductCatalogService/ProductCatalogService.csproj
   dotnet sln add InventoryService/InventoryService.csproj
   dotnet sln add OrderService/OrderService.csproj
   dotnet sln add PaymentService/PaymentService.csproj
   dotnet sln add NotificationService/NotificationService.csproj
   dotnet sln add AnalyticsService/AnalyticsService.csproj
   dotnet sln add FrontendUI/FrontendUI.csproj
   ```

5. **Restore Dependencies**:
   ```bash
   dotnet restore
   ```

## Packages Used
The following packages are used across the services in this solution:

### Common Packages
- **Microsoft.AspNetCore.OpenApi** (Version 9.0.3): Provides OpenAPI/Swagger support for API documentation.

### Service-Specific Packages
- **Npgsql.EntityFrameworkCore.PostgreSQL** (Version 9.0.4): Used in `ProductCatalogService`, `PaymentService`, `OrderService`, and `InventoryService` for PostgreSQL database integration with Entity Framework Core.
- **RabbitMQ.Client** (Version 7.1.2): Used in `OrderService` and `NotificationService` for RabbitMQ messaging.

## Usage
To run the solution, use the following command:
```bash
dotnet run --project <ProjectName>/<ProjectName>.csproj
```
Replace `<ProjectName>` with the name of the service you want to run.

## Contributing
Contributions are welcome! Please follow these steps:
1. Fork the repository.
2. Create a new branch for your feature or bugfix.
3. Commit your changes and push the branch.
4. Submit a pull request.

## License
This project is licensed under the MIT License. See the LICENSE file for details.