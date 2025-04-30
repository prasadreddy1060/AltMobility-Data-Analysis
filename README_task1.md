
# Alt Mobility Data Analysis Project

## 📊 Task 1: Order and Sales Analysis

This task focuses on analyzing order fulfillment and revenue trends using the `customer_orders` dataset.

### 🔍 Objective

- Understand the breakdown of order statuses (e.g., delivered, pending, shipped).
- Analyze overall sales revenue and order volume.
- Identify patterns in monthly sales and revenue.
- Evaluate average order values across different order statuses.

---

### ✅ SQL Queries

- **Total Orders & Revenue**:
  Calculates the overall number of orders and total revenue.

- **Orders by Status**:
  Provides insights into how many orders fall under each status and the revenue generated.

- **Monthly Revenue Trend**:
  Shows how revenue and order volume change month by month.

- **Average Order Value by Status**:
  Reveals how much customers typically spend based on the status of the order.

All queries are located in the file:
```
sql_queries/1_order_sales_analysis.sql
```

---

### 🧠 Expected Insights

- Delivered orders are likely the highest revenue generators.
- Average order value may vary across statuses.
- Revenue trends can highlight peak periods and growth over time.

---

## 👥 Task 2: Customer Analysis

This task analyzes customer behavior based on ordering history in the `customer_orders` dataset.

### 🔍 Objective

- Distinguish between one-time and repeat customers.
- Segment customers based on their order frequency.
- Track customer activity over time.

---

### ✅ SQL Queries

- **Repeat vs. One-Time Customers**  
  Identifies how many customers placed only one order vs. multiple orders.

- **Customer Segmentation by Order Count**  
  Groups customers based on how many orders they've placed (e.g., 1, 2, 3+ orders).

- **Monthly Active Customers**  
  Shows how many unique customers placed orders each month.

---

### 🧠 Expected Insights

- A large proportion of one-time customers may indicate a retention issue.
- Monthly active customers reveal seasonality or growth trends.

