# Nursery Management Project

## Overview

The Nursery Management Project is a comprehensive solution designed to manage nursery operations effectively. Built with Microsoft SQL Server, this project encompasses database design and management, including inventory management, schema creation, and various database functions and procedures. It provides a robust backend to support a nursery management system, handling everything from data storage to complex operations.

## Features

- **Database Schema Creation:** Includes Data Definition Language (DDL) scripts for setting up the database schema.
- **Data Management:** Data Manipulation Language (DML) scripts for populating and managing data within the database.
- **Stored Procedures:** Encapsulates logic for common operations, enhancing performance and security.
- **Functions and Triggers:** Implements business logic and automatic actions within the database.
- **Inventory Management:** Manages nursery inventory, including supplies and equipment.

## Technologies Used

- Microsoft SQL Server
- T-SQL (Transact-SQL)

## Project Structure

- **DDL Scripts:** Define the database structure, including tables, indexes, and relationships.
- **DML Scripts:** Handle data insertion, updates, and deletions.
- **Stored Procedures:** Implement reusable SQL code for performing operations.
- **Functions:** Provide custom computations and data processing.
- **Triggers:** Automatically execute predefined actions in response to specific events.

## Getting Started

### Prerequisites

- Microsoft SQL Server
- SQL Server Management Studio (SSMS) or similar SQL client

### Installation

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/TausifImtiaz/Nusery-Management_Project_MSSQLServer.git
   ```

2. **Open SQL Server Management Studio (SSMS):**
   - Connect to your SQL Server instance.

3. **Run DDL Scripts:**
   - Navigate to the `ddl` directory.
   - Execute the `CreateDatabase.sql` script to create the database.
   - Execute other DDL scripts to create schemas, tables, indexes, etc.

4. **Run DML Scripts:**
   - Navigate to the `dml` directory.
   - Execute the `InsertData.sql` script to populate the database with initial data.

5. **Execute Additional Scripts:**
   - Run scripts for stored procedures, functions, and triggers as needed to complete the setup.

## Usage

1. **Database Access:**
   - Use SSMS or another SQL client to connect to the database and perform queries.

2. **Manage Inventory:**
   - Utilize the provided procedures and functions to manage and track inventory items.

3. **View Data:**
   - Query the database to view and analyze data using pre-defined queries or custom SQL.

4. **Maintain Database:**
   - Use triggers and procedures to automate routine tasks and ensure data integrity.

## Code Example

### Sample DDL Script

```sql
-- Create table for storing nursery items
CREATE TABLE NurseryItems (
    ItemID INT PRIMARY KEY IDENTITY,
    ItemName NVARCHAR(100) NOT NULL,
    Quantity INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    DateAdded DATETIME DEFAULT GETDATE()
);
```

### Sample Stored Procedure

```sql
-- Stored procedure to add a new nursery item
CREATE PROCEDURE AddNurseryItem
    @ItemName NVARCHAR(100),
    @Quantity INT,
    @Price DECIMAL(10, 2)
AS
BEGIN
    INSERT INTO NurseryItems (ItemName, Quantity, Price)
    VALUES (@ItemName, @Quantity, @Price);
END
```

## Contributing

Contributions are welcome! To contribute:
- Fork the repository.
- Create a feature branch.
- Commit your changes.
- Push to the branch.
- Open a pull request with a description of your changes.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgements

- Microsoft SQL Server documentation
- T-SQL language resources

## Contact

For any questions or support, please contact [Tausif Imtiaz](mailto:tausifimtiaz@gmail.com).
