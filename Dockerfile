FROM nicolaka/netshoot
RUN apk add nginx && \
 sed -i 's/return 404/return 200/' /etc/nginx/http.d/default.conf
