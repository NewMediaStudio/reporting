# Metabase Dashboard Prototype

This project sets up a complete Metabase instance with sample data for prototyping business intelligence dashboards. Metabase is a free, open-source business intelligence tool that allows you to explore and visualize your data.

## 🚀 Quick Start

### Prerequisites
- Docker and Docker Compose installed
- At least 4GB of available RAM
- Ports 3000 and 5432 available

### 1. Start the Services
```bash
./start.sh
```

### 2. Access Metabase
- Open your browser and go to: http://localhost:3000
- Wait for Metabase to finish initializing (this may take 2-3 minutes on first run)
- Complete the initial setup wizard

### 3. Connect to Sample Database
During setup, use these credentials:
- **Database Type**: PostgreSQL
- **Host**: postgres
- **Port**: 5432
- **Database Name**: sample_data
- **Username**: metabase
- **Password**: metabase123

## 📊 Sample Data Structure

The prototype includes a complete e-commerce dataset with:

- **Customers**: 8 sample customers with company and location data
- **Products**: 8 products across different categories (Electronics, Furniture, Office Supplies, etc.)
- **Orders**: 18 sample orders with realistic amounts and dates
- **Order Items**: Detailed line items for each order

## 🎯 Dashboard Ideas

### 1. Sales Overview Dashboard
- Total revenue and order count
- Revenue by month/date
- Top performing products
- Sales by customer location

### 2. Customer Analytics Dashboard
- Customer acquisition over time
- Customer lifetime value
- Geographic distribution
- Company size analysis

### 3. Product Performance Dashboard
- Product category performance
- Profit margin analysis
- Supplier performance
- Inventory turnover

### 4. Executive Summary Dashboard
- KPI overview
- Trend analysis
- Comparative metrics
- Actionable insights

## 🌐 Embedding Your Dashboards

### Quick Embed Test
1. **Start the HTTP server**: `./serve-simple.sh`
2. **Open**: http://localhost:8000/test-embed.html
3. **See**: Your logo + embedded dashboard

### Customize the Embed
- **Logo**: Replace `logo.png` with your own logo
- **Dashboard URL**: Update the iframe src in `test-embed.html`
- **Styling**: Modify CSS in the HTML file

### Generate Signed URLs (Advanced)
For production use, generate signed JWT tokens:

```javascript
const jwt = require("jsonwebtoken");

const METABASE_SITE_URL = "http://localhost:3000";
const METABASE_SECRET_KEY = "YOUR_SECRET_KEY";

const payload = {
  resource: { dashboard: 1 },
  params: {},
  exp: Math.round(Date.now() / 1000) + (10 * 60)
};

const token = jwt.sign(payload, METABASE_SECRET_KEY);
const iframeUrl = METABASE_SITE_URL + "/embed/dashboard/" + token;
```

## 🔧 Configuration

### Environment Variables
- `MB_DB_TYPE`: Database type for Metabase (h2 for embedded, postgres for production)
- `MB_DB_FILE`: Path to Metabase database file
- `POSTGRES_DB`: Sample database name
- `POSTGRES_USER`: Database username
- `POSTGRES_PASSWORD`: Database password

### Ports
- **Metabase**: 3000 (Web interface)
- **PostgreSQL**: 5432 (Database access)
- **HTTP Server**: 8000 (For testing embeds)

## 📈 Creating Your First Dashboard

1. **Explore Data**: Use Metabase's data browser to understand your tables
2. **Create Questions**: Build individual visualizations (charts, tables, etc.)
3. **Combine into Dashboard**: Add multiple questions to create comprehensive dashboards
4. **Add Filters**: Implement interactive filters for date ranges, categories, etc.
5. **Schedule Reports**: Set up automated email reports

## 🔄 Future Integration

When you're ready to connect to your internal data source:

1. **Update Connection**: Replace the sample database with your production database
2. **Modify Queries**: Update any hardcoded sample data references
3. **Add Authentication**: Configure your database's security settings
4. **Scale Up**: Consider using PostgreSQL for Metabase's own database in production

## 🛠️ Development Commands

```bash
# Start services
./start.sh

# Start HTTP server for testing embeds
./serve-simple.sh

# View logs
docker-compose logs -f metabase

# Stop services
docker-compose down

# Reset everything (removes all data)
docker-compose down -v
docker-compose up -d

# Access PostgreSQL directly
docker exec -it metabase-postgres psql -U metabase -d sample_data
```

## 📚 Resources

- [Metabase Documentation](https://www.metabase.com/docs/latest/)
- [Metabase Community](https://discourse.metabase.com/)
- [Sample Dashboard Templates](https://www.metabase.com/learn/getting-started/example-databases)

## 🚨 Troubleshooting

### Metabase won't start
- Check if ports 3000 and 5432 are available
- Ensure Docker has enough memory allocated
- Check logs: `docker-compose logs metabase`

### Can't connect to database
- Verify PostgreSQL is running: `docker-compose ps`
- Check database logs: `docker-compose logs postgres`
- Ensure sample data was loaded correctly

### Iframe connection issues
- Use the HTTP server: `./serve-simple.sh`
- Open http://localhost:8000/test-embed.html instead of file://
- Check that Metabase embedding is enabled in Admin → Settings

### Performance issues
- Increase Docker memory allocation
- Consider using PostgreSQL for Metabase's own database
- Optimize database queries and indexes

## 📝 License

This project uses Metabase, which is licensed under the [GNU Affero General Public License v3.0](https://github.com/metabase/metabase/blob/master/LICENSE.txt).
