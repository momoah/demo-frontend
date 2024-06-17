FROM quay.io/nginx/nginx-unprivileged:latest

COPY --chown=1001:0 entrypoint.sh /entrypoint.sh

COPY nginx.conf.template /etc/nginx/nginx.conf.template

EXPOSE 8080

USER 1001

# Run entrypoint script
ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;", "-c", "/etc/nginx/nginx.conf"]


