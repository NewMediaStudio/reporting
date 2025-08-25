#!/bin/bash

echo "🚀 Starting Metabase Dashboard Prototype..."
echo ""

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo "❌ Docker is not running. Please start Docker and try again."
    exit 1
fi

# Check if ports are available
if lsof -Pi :3000 -sTCP:LISTEN -t >/dev/null ; then
    echo "⚠️  Port 3000 is already in use. Please free up the port and try again."
    exit 1
fi

if lsof -Pi :5432 -sTCP:LISTEN -t >/dev/null ; then
    echo "⚠️  Port 5432 is already in use. Please free up the port and try again."
    exit 1
fi

echo "✅ Ports are available"
echo ""

# Start the services
echo "📦 Starting Docker services..."
docker-compose up -d

echo ""
echo "⏳ Waiting for services to start up..."
sleep 10

# Check if services are running
if docker-compose ps | grep -q "Up"; then
    echo ""
    echo "🎉 Services are running successfully!"
    echo ""
    echo "📊 Metabase is available at: http://localhost:3000"
    echo "🗄️  PostgreSQL is available at: localhost:5432"
    echo ""
    echo "📋 Next steps:"
    echo "1. Open http://localhost:3000 in your browser"
    echo "2. Wait for Metabase to finish initializing (2-3 minutes)"
    echo "3. Complete the setup wizard"
    echo "4. Connect to the sample database using:"
    echo "   - Host: postgres"
    echo "   - Port: 5432"
    echo "   - Database: sample_data"
    echo "   - Username: metabase"
    echo "   - Password: metabase123"
    echo ""
    echo "🛑 To stop services, run: docker-compose down"
    echo "📖 For more info, see README.md"
else
    echo "❌ Failed to start services. Check logs with: docker-compose logs"
    exit 1
fi
