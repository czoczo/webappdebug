FROM nicolaka/netshoot

WORKDIR /app/

COPY init_container.sh /app/
COPY sshd_config /etc/ssh/

# Start and enable SSH
RUN apk add nginx && \
 sed -i 's/return 404/return 200/' /etc/nginx/http.d/default.conf && \
 echo "root:Docker!" | chpasswd && \
 chmod +x /app/init_container.sh && \
 cd /etc/ssh/ && \
 ssh-keygen -A

EXPOSE 80 2222

ENTRYPOINT [ "/app/init_container.sh" ]
