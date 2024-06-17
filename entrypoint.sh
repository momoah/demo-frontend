#!/bin/sh

# Substitute environment variables in the template
envsubst '${BACKEND_URL}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

# Execute the provided command
exec "$@"

