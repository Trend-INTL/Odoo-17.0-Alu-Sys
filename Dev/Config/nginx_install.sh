
sudo nano /etc/nginx/sites-available/selaimy.conf
##################################################################
#odoo 17.0 server
upstream selaimy {
server 127.0.0.1:8088;
}
upstream selaimychat {
server 127.0.0.1:8072;
}


server {
listen 80;
server_name server_name selaimy.trend-ai.tech www.selaimy.trend-ai.tech;

proxy_read_timeout 720s;
proxy_connect_timeout 720s;
proxy_send_timeout 720s;


# Add Headers for odoo proxy mode
proxy_set_header X-Forwarded-Host $host;
proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
proxy_set_header X-Forwarded-Proto $scheme;
proxy_set_header X-Real-IP $remote_addr;

# log
access_log /var/log/nginx/slm.access.log;
error_log /var/log/nginx/slm.error.log;

# Redirect requests to odoo backend server
location / {
proxy_redirect off;
proxy_pass http://selaimy;
}
location /longpolling {
proxy_pass http://selaimychat;
}

# common gzip
gzip_types text/css text/less text/plain text/xml application/xml application/json application/javascript;
gzip on;


client_body_in_file_only clean;
client_body_buffer_size 32K;
client_max_body_size 500M;
sendfile on;
send_timeout 600s;
keepalive_timeout 300;
}
#####################################################

sudo ln -s /etc/nginx/sites-available/selaimy.conf /etc/nginx/sites-enabled/selaimy.conf
sudo nginx -t
sudo systemctl reload nginx
sudo service slm restart
sudo systemctl reload nginx

sudo certbot
Required Email: trenders.intl@gmail.com


===================================================================================================================
8- TO ENABLE FIREWALL ON YOUR DOMAIN FOR ODOO SERVER
===================================================================================================================

sudo ufw allow 'Nginx Full'
sudo ufw delete allow 'Nginx HTTP'
