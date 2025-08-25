FROM metabase/metabase:latest

# Set environment variable to bind to all interfaces
ENV MB_JETTY_HOST=0.0.0.0

# Expose port 3000
EXPOSE 3000

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
  CMD curl -f http://localhost:3000/api/health || exit 1
