# Advanced SQL Queries and Aggregations

## Project Overview

This project demonstrates the use of advanced SQL queries and aggregate functions to retrieve, summarize, group, and sort data from a MySQL database.

The assignment uses the `payments`, `customers`, and `orderdetails` tables to perform calculations and organize query results.

## Learning Objectives

- Understand aggregate functions such as `SUM()`, `AVG()`, and `MAX()`.
- Use `GROUP BY` to group records based on specified columns.
- Apply `ORDER BY` to sort query results.
- Use `LIMIT` to restrict the number of returned rows.
- Calculate total product prices using quantity and unit price.

## Technologies Used

- **Database:** MySQL
- **Language:** SQL
- **Editor:** MySQL Workbench or Visual Studio Code

## Project Structure

```text
advanced-sql-queries/
├── answers.sql
└── README.md
```

## Assignment Questions and Solutions

### Question 1: Total Payments by Date

Calculate the total payment amount for each payment date.

**Requirements:**
- Display the payment date and total amount.
- Group records by payment date.
- Sort dates in descending order.
- Display only the five latest payment dates.

**SQL Concepts:** `SUM()`, `GROUP BY`, `ORDER BY`, `DESC`, and `LIMIT`.

### Question 2: Average Credit Limit by Customer

Calculate the average credit limit for each customer.

**Requirements:**
- Display customer name, country, and average credit limit.
- Group results by customer name and country.

**SQL Concepts:** `AVG()` and `GROUP BY`.

### Question 3: Total Price of Products Ordered

Calculate the total price of ordered products.

**Requirements:**
- Display product code, quantity ordered, and total price.
- Group results by product code and quantity ordered.
- Calculate the total price using quantity ordered multiplied by unit price.

**SQL Concepts:** `SUM()`, arithmetic operations, and `GROUP BY`.

### Question 4: Highest Payment by Check Number

Find the highest payment amount associated with each check number.

**Requirements:**
- Display the check number and highest payment amount.
- Group results by check number.

**SQL Concepts:** `MAX()` and `GROUP BY`.

## How to Run the Queries

1. Install and open MySQL Workbench or another MySQL-compatible SQL editor.
2. Connect to your MySQL database.
3. Select the database containing the required tables.
4. Open `answers.sql`.
5. Execute each query.
6. Review the results to confirm that the queries work correctly.

For the MySQL Classic Models sample database, you can select the database using:

```sql
USE classicmodels;
```

## Expected Outcome

After completing this assignment, the queries should:

- Identify the five latest payment dates and their total payments.
- Calculate the average credit limit for each customer and country.
- Calculate total product prices for each product and ordered quantity.
- Identify the highest payment amount for each check number.

## Author

**Name:** [Your Name]

## Conclusion

This assignment provides practical experience with SQL aggregation, grouping, sorting, and result limiting. These techniques are essential for analyzing structured data and generating useful database reports.
