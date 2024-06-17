FROM quay.io/nginx/nginx-unprivileged:latest

ENV BACKEND_URL=${BACKEND_URL:-default-backend-url}

COPY nginx.conf.template /etc/nginx/nginx.conf.template

RUN envsubst '${BACKEND_URL}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

RUN echo "${BACKEND_URL}"; \
    cat /etc/nginx/nginx.conf

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;", "-c", "/etc/nginx/nginx.conf"]


