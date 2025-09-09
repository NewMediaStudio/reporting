#!/usr/bin/env python3
"""
Simple HTTP server to serve the HTML file and fix localhost iframe issues.
Run this script and then open http://localhost:8000/test-embed.html
"""

import http.server
import socketserver
import os

PORT = 8000

class MyHTTPRequestHandler(http.server.SimpleHTTPRequestHandler):
    def end_headers(self):
        # Add CORS headers to allow iframe embedding
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS')
        self.send_header('Access-Control-Allow-Headers', 'Content-Type')
        super().end_headers()

if __name__ == "__main__":
    with socketserver.TCPServer(("", PORT), MyHTTPRequestHandler) as httpd:
        print(f"🚀 Server running at http://localhost:{PORT}")
        print(f"📁 Open http://localhost:{PORT}/test-embed.html in your browser")
        print(f"🛑 Press Ctrl+C to stop the server")
        try:
            httpd.serve_forever()
        except KeyboardInterrupt:
            print("\n👋 Server stopped")
