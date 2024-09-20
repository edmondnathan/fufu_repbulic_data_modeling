# Fufu Republic Data Warehouse

## Overview

Fufu Republic is a popular restaurant chain in Nigeria with multiple outlets nationwide. This repository contains the SQL scripts and documentation for the dimensional model designed to address the business needs for data-driven decision-making.

## Business Objectives

Fufu Republic aims to leverage data to:
- Understand sales trends across locations, payment methods, and dining options (dine-in, take-out, online).
- Manage stock levels efficiently, reducing waste and ensuring availability.
- Enhance customer experience by analyzing purchasing habits and tailoring promotions accordingly.

## Dimensional Model

### Entities

1. **Customer**
   - `customer_id`: Primary Key
   - `first_name`
   - `last_name`
   - `email`
   - `phone`
   - `loyalty_program`
   - `region`

2. **Order**
   - `order_id`: Primary Key
   - `branch_id`
   - `customer_id`
   - `payment_method_id`
   - `order_date`
   - `total_amount`
   - `discount_applied`
   - `net_sales_amount`

3. **Branch**
   - `branch_id`: Primary Key
   - `name`
   - `location`
   - `city`
   - `state`
   - `region`
   - `manager`

4. **Menu Item**
   - `menu_item_id`: Primary Key
   - `name`
   - `description`
   - `category`
   - `price`

5. **Order Detail**
   - `order_detail_id`: Primary Key
   - `order_id`
   - `menu_item_id`
   - `quantity`
   - `unit_price`

6. **Inventory**
   - `inventory_id`: Primary Key
   - `branch_id`
   - `menu_item_id`
   - `stock_level`
   - `reorder_level`

7. **Payment Method**
   - `payment_method_id`: Primary Key
   - `payment_type`

8. **Date**
   - `datekey`: Primary Key
   - `date`
   - `month`
   - `quarter`
   - `year`
   - `weekday`
   - `holiday_indicator`

### Relationships

- Each sales transaction is linked to a specific date, location, payment method, order type, product, and customer.
- The fact table will have foreign keys referencing the primary keys of the dimension tables.

### Constraints

- Ensure referential integrity between fact and dimension tables.

