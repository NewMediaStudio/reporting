#!/bin/bash

echo "🚀 Starting simple HTTP server..."
echo "📁 Open http://localhost:8000/test-embed.html in your browser"
echo "🛑 Press Ctrl+C to stop the server"
echo ""

python3 -m http.server 8000
