FROM nginx:1.21.1
LABEL maintainer="Pierre"
RUN apt-get update \
    && apt-get install git -y \
    && cd /usr/share/nginx/html/ \
    && rm -fr *
RUN cd /usr/share/nginx/html/ \
    && git clone https://github.com/diranetafen/static-website-example.git .
COPY nginx.conf /etc/nginx/conf.d/default.conf
CMD sed -i -e 's/$PORT/'"$PORT"'/g' /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'
