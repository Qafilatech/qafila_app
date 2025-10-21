#!/bin/sh
# Docker entrypoint script to inject environment variables

set -e

# Replace environment variables in JavaScript files at runtime
# This allows you to change API_BASE_URL without rebuilding
if [ -n "$API_BASE_URL" ]; then
  echo "Injecting API_BASE_URL: $API_BASE_URL"
  # Note: For Flutter web, you'd need to implement runtime config
  # This is a placeholder for the approach
fi

# Execute the main container command
exec "$@"

