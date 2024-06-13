FROM registry.access.redhat.com/ubi8/nodejs-18:latest


WORKDIR /opt/app-root/

COPY --chown=1001:1001 package*.json ./
COPY --chown=1001:1001  . .

RUN cd /opt/app-root/; \
    mkdir -p /opt/app-root/src/.npm-global/lib ;\
    npm run build

EXPOSE 3000
CMD ["npx", "serve", "-s", "build"]
