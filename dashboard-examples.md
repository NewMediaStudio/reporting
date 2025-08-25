# Dashboard Examples for Metabase Prototype

This document provides specific examples of dashboards you can create with the sample data, including the SQL queries and visualization types.

## 🎯 Example 1: Sales Overview Dashboard

### Dashboard Layout
Create a dashboard with 4-6 cards arranged in a grid:

1. **Total Revenue** (Number card)
2. **Total Orders** (Number card)
3. **Revenue by Month** (Line chart)
4. **Top Products by Revenue** (Bar chart)
5. **Sales by Category** (Pie chart)
6. **Recent Orders** (Table)

### SQL Queries

#### Total Revenue
```sql
SELECT SUM(total_amount) as total_revenue
FROM orders
WHERE status = 'completed';
```

#### Total Orders
```sql
SELECT COUNT(*) as total_orders
FROM orders
WHERE status = 'completed';
```

#### Revenue by Month
```sql
SELECT 
    DATE_TRUNC('month', order_date) as month,
    SUM(total_amount) as revenue
FROM orders
WHERE status = 'completed'
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY month;
```

#### Top Products by Revenue
```sql
SELECT 
    p.product_name,
    SUM(oi.quantity * oi.unit_price) as revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.status = 'completed'
GROUP BY p.product_id, p.product_name
ORDER BY revenue DESC
LIMIT 10;
```

#### Sales by Category
```sql
SELECT 
    p.category,
    SUM(oi.quantity * oi.unit_price) as revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.status = 'completed'
GROUP BY p.category
ORDER BY revenue DESC;
```

## 🎯 Example 2: Customer Analytics Dashboard

### Dashboard Layout
1. **Total Customers** (Number card)
2. **New Customers This Month** (Number card)
3. **Customer Acquisition Over Time** (Line chart)
4. **Customers by Country** (Map/Bar chart)
5. **Top Customers by Revenue** (Table)
6. **Customer Lifetime Value** (Bar chart)

### SQL Queries

#### Total Customers
```sql
SELECT COUNT(*) as total_customers
FROM customers;
```

#### New Customers This Month
```sql
SELECT COUNT(*) as new_customers
FROM customers
WHERE DATE_TRUNC('month', created_date) = DATE_TRUNC('month', CURRENT_DATE);
```

#### Customer Acquisition Over Time
```sql
SELECT 
    DATE_TRUNC('month', created_date) as month,
    COUNT(*) as new_customers
FROM customers
GROUP BY DATE_TRUNC('month', created_date)
ORDER BY month;
```

#### Customers by Country
```sql
SELECT 
    country,
    COUNT(*) as customer_count
FROM customers
GROUP BY country
ORDER BY customer_count DESC;
```

#### Top Customers by Revenue
```sql
SELECT 
    c.first_name || ' ' || c.last_name as customer_name,
    c.company,
    c.country,
    SUM(o.total_amount) as total_revenue,
    COUNT(o.order_id) as order_count
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.status = 'completed'
GROUP BY c.customer_id, c.first_name, c.last_name, c.company, c.country
ORDER BY total_revenue DESC
LIMIT 10;
```

## 🎯 Example 3: Product Performance Dashboard

### Dashboard Layout
1. **Total Products** (Number card)
2. **Average Product Price** (Number card)
3. **Profit Margin by Product** (Bar chart)
4. **Products by Category** (Pie chart)
5. **Supplier Performance** (Bar chart)
6. **Product Sales Volume** (Table)

### SQL Queries

#### Total Products
```sql
SELECT COUNT(*) as total_products
FROM products;
```

#### Average Product Price
```sql
SELECT AVG(price) as avg_price
FROM products;
```

#### Profit Margin by Product
```sql
SELECT 
    product_name,
    price,
    cost,
    ROUND(((price - cost) / price * 100), 2) as profit_margin_percent
FROM products
ORDER BY profit_margin_percent DESC;
```

#### Products by Category
```sql
SELECT 
    category,
    COUNT(*) as product_count
FROM products
GROUP BY category
ORDER BY product_count DESC;
```

#### Supplier Performance
```sql
SELECT 
    p.supplier,
    COUNT(p.product_id) as product_count,
    AVG(p.price) as avg_price,
    SUM(oi.quantity * oi.unit_price) as total_revenue
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
LEFT JOIN orders o ON oi.order_id = o.order_id AND o.status = 'completed'
GROUP BY p.supplier
ORDER BY total_revenue DESC NULLS LAST;
```

## 🎯 Example 4: Executive Summary Dashboard

### Dashboard Layout
1. **Key Metrics Row** (4 Number cards in a row)
2. **Revenue Trends** (Line chart)
3. **Performance Comparison** (Bar chart)
4. **Geographic Overview** (Map)
5. **Action Items** (Text card)

### Key Metrics SQL
```sql
-- Combined query for all key metrics
SELECT 
    COUNT(DISTINCT c.customer_id) as total_customers,
    COUNT(DISTINCT o.order_id) as total_orders,
    SUM(o.total_amount) as total_revenue,
    ROUND(AVG(o.total_amount), 2) as avg_order_value
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id AND o.status = 'completed';
```

## 🔧 Dashboard Setup Tips

### 1. Use Filters
- Add date range filters for time-based analysis
- Add category filters for product analysis
- Add country filters for geographic analysis

### 2. Visual Best Practices
- Use consistent colors across related charts
- Keep dashboards focused (max 6-8 visualizations)
- Use appropriate chart types for your data
- Add meaningful titles and descriptions

### 3. Performance Optimization
- Limit large datasets with appropriate filters
- Use aggregations when possible
- Consider caching for frequently accessed dashboards

### 4. Sharing and Scheduling
- Set up automated email reports
- Share dashboards with team members
- Export data to CSV/Excel when needed

## 📊 Sample Dashboard Screenshots

Once you have Metabase running, you can:
1. Create these dashboards step by step
2. Customize colors and layouts
3. Add filters and drill-down capabilities
4. Schedule regular reports
5. Share with stakeholders

## 🚀 Next Steps

After creating these example dashboards:
1. **Customize**: Modify queries for your specific needs
2. **Expand**: Add more complex analytics and KPIs
3. **Integrate**: Connect to your real data sources
4. **Automate**: Set up scheduled reports and alerts
5. **Collaborate**: Share insights with your team
