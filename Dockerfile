from node:11-alpine as build

run npm install -g grunt-cli

copy . /opt/CyberChef

run \
        cd /opt/CyberChef; \
        npm install; \
        grunt prod

entrypoint sh

from httpd:2.4-alpine

run rm -fv $HTTPD_PREFIX/htdocs/*
copy --from=build /opt/CyberChef/build/prod/ $HTTPD_PREFIX/htdocs

