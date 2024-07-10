#!/bin/bash
################################################################################

# Create PostgreSQL user for Odoo
sudo service erp stop
sudo -u postgres psql -c "drop database erpdb;"
sudo -u postgres psql -c "drop role erp;"
sudo -u postgres createuser -d -R -S $USER
sudo service postgresql restart

# Create Odoo directory
sudo rm -rf /opt/odoo16/erp
sudo mkdir /opt/odoo16/erp
sudo chmod +x /opt/odoo16/erp
sudo chown $USER:$USER /opt/odoo16/erp

# Clone Odoo repository
git clone https://www.github.com/odoo/odoo --branch 16.0 --depth 1 /opt/odoo16/erp/odoo

# Change Odoo Directory Own and Conf:
sudo chmod +x /opt/odoo16/erp/odoo
sudo chown $USER:$USER /opt/odoo16/erp/odoo

# Create Python virtual environment in Odoo directory
python3.10 -m venv /opt/odoo16/erp/odoo/venv

# Activate the virtual environment
source /opt/odoo16/erp/odoo/venv/bin/activate

# Install required Python packages for Odoo
# pip install -r /opt/odoo16/erp/odoo/requirements.txt

sudo apt install python3-pip
sudo apt install python3-pip --reinstall
pip install --upgrade pip


# Install Python dependencies with resolved versions
pip install \
    Babel==2.9.1 \
    chardet==4.0.0 \
    cryptography==3.4.8 \
    decorator==4.4.2 \
    docutils==0.16 \
    ebaysdk==2.1.5 \
    freezegun==1.1.0 \
    geoip2==2.9.0 \
    gevent==22.10.2 \
    greenlet==2.0.2 \
    idna==2.10 \
    libsass==0.20.1 \
    lxml==5.2.1 \
    lxml_html_clean \
    Jinja2 \
    MarkupSafe==2.1.2 \
    num2words==0.5.10 \
    ofxparse==0.21 \
    passlib==1.7.4 \
    Pillow==9.4.0 \
    polib==1.1.1 \
    psutil==5.9.4 \
    psycopg2-binary \
    pydot==1.4.2 \
    pyopenssl==21.0.0 \
    PyPDF2 \
    pyserial==3.5 \
    python-dateutil==2.8.1 \
    python3-ldap \
    python-stdnum==1.16 \
    pyusb==1.2.1 \
    qrcode==7.3.1 \
    reportlab==3.6.12 \
    requests==2.25.1 \
    rjsmin==1.1.0 \
    urllib3==1.26.5 \
    vobject==0.9.6.1 \
    Werkzeug==2.0.2 \
    xlrd==1.2.0 \
    XlsxWriter==3.0.2 \
    xlwt==1.3.* \
    zeep==4.1.0

# Install system dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       python3-pip \
       python3-dev \
       build-essential \
       wget \
       curl \
       git \
       libxml2-dev \
       libxslt1-dev \
       zlib1g-dev \
       libsasl2-dev \
       libldap2-dev \
       libssl-dev \
       libjpeg-dev \
       libpq-dev \
       node-less \
       nodejs \
       npm \
       libldap2-dev \
       libssl-dev \
       libffi-dev \
       libmysqlclient-dev \
       build-essential \
       libssl-dev \
       libffi-dev \
       python3-setuptools \
       python3-pil \
       python3-lxml \
       python3-openssl \
       python3-dateutil \
       python3-tz \
       python3-requests \
       python3-psycopg2 \
       python3-pypdf2 \
       python3-decorator \
       python3-gevent \
       python3-phonenumbers \
       python3-pyparsing \
       python3-reportlab \
       python3-simplejson \
       python3-stdnum \
       python3-vobject \
       python3-watchdog \
       python3-werkzeug \
       python3-yaml \
       python3-ldap3 \
       python3-num2words \
       python3-qrcode \
       python3-passlib \
       python3-markupsafe \
       python3-markdown \
       python3-gdata \
       python3-openid \
       python3-netifaces \
       python3-serial \
       python3-lxml \
       python3-usb \
       python3-dbus \
       python3-pillow \
       python3-odoo.addons \
       python3-docutils \
       python3-reportlab-accel \
       python3-jinja2 \
       python3-mako \
       python3-pychart \
       python3-pydot \
       python3-pyparsing \
       python3-simplejson \
       python3-soappy \
       python3-pysftp \
       python3-geoip \
       python3-suds \
       python3-xlrd \
       python3-xlwt \
       python3-psutil \
       python3-paramiko \
       python3-mock \
       python3-pytest \
       python3-unittest2 \
       python3-tz \
       python3-requests \
       python3-oauthlib \
       python3-geojson \
       python3-sqlparse \
       python3-polib \
       python3-babel \
       python3-feedparser \
       python3-docutils \
       python3-jinja2 \
       python3-ldap \
       python3-libxslt1 \
       python3-lxml \
       python3-mako \
       python3-mock \
       python3-openssl \
       python3-passlib \
       python3-pil \
       python3-psutil \
       python3-psycopg2 \
       python3-pydot \
       python3-pyparsing \
       python3-pyPdf \
       python3-pypdf2 \
       python3-pypng \
       python3-pytils \
       python3-reportlab \
       python3-requests \
       python3-serial \
       python3-setuptools \
       python3-simplejson \
       python3-suds \
       python3-tz \
       python3-vatnumber \
       python3-vobject \
       python3-werkzeug \
       python3-xlwt \
       python3-yaml \
       python3-webdav \
       python3-qrcode \
       python3-phonenumbers \
       python3-num2words \
       python3-matplotlib \
       python3-flake8 \
       libpq-dev \
       libjpeg-dev \
       node-less \
       nodejs \
       npm \
       python3-babel \
       python3-ldap \
       python3-libxslt1 \
       python3-lxml \
       python3-mako \
       python3-mock \
       python3-openssl \
       python3-passlib \
       python3-pil \
       python3-psutil \
       python3-psycopg2 \
       python3-pydot \
       python3-pyparsing \
       python3-pyPdf \
       python3-pypdf2 \
       python3-pypng \
       python3-pytils \
       python3-reportlab \
       python3-requests \
       python3-serial \
       python3-setuptools \
       python3-simplejson \
       python3-suds \
       python3-tz \
       python3-vatnumber \
       python3-vobject \
       python3-werkzeug \
       python3-xlwt \
       python3-yaml \
       python3-webdav \
       python3-qrcode \
       python3-phonenumbers \
       python3-num2words \
       python3-matplotlib \
       python3-flake8 \
       python3-libxslt1 \
       python3-lxml \
       python3-mako \
       python3-mock \
       python3-openssl \
       python3-passlib \
       python3-pil \
       python3-psutil \
       python3-psycopg2 \
       python3-pydot \
       python3-pyparsing \
       python3-pyPdf \
       python3-pypdf2 \
       python3-pypng \
       python3-pytils \
       python3-reportlab \
       python3-requests \
       python3-serial \
       python3-setuptools \
       python3-simplejson \
       python3-suds \
       python3-tz \
       python3-vatnumber \
       python3-vobject \
       python3-werkzeug \
       python3-xlwt \
       python3-yaml \
       python3-webdav \
       python3-qrcode \
       python3-phonenumbers \
       python3-num2words \
       python3-matplotlib \
       python3-flake8 \
       python3-ldap \
       python3-libxslt1 \
       python3-lxml \
       python3-mako \
       python3-mock \
       python3-openssl \
       python3-passlib \
       python3-pil \
       python3-psutil \
       python3-psycopg2 \
       python3-pydot \
       python3-pyparsing \
       python3-pyPdf \
       python3-pypdf2 \
       python3-pypng \
       python3-pytils \
       python3-reportlab \
       python3-requests \
       python3-serial \
       python3-setuptools \
       python3-simplejson \
       python3-suds \
       python3-tz \
       python3-vatnumber \
       python3-vobject \
       python3-werkzeug \
       python3-xlwt \
       python3-yaml \
       python3-webdav \
       python3-qrcode \
       python3-phonenumbers \
       python3-num2words \
       python3-matplotlib \
       python3-flake8 \
       python3-ldap \
       python3-libxslt1 \
       python3-lxml \
       python3-mako \
       python3-mock \
       python3-openssl \
       python3-passlib \
       python3-pil \
       python3-psutil \
       python3-psycopg2 \
       python3-pydot \
       python3-pyparsing \
       python3-pyPdf \
       python3-pypdf2 \
       python3-pypng \
       python3-pytils \
       python3-reportlab \
       python3-requests \
       python3-serial \
       python3-setuptools \
       python3-simplejson \
       python3-suds \
       python3-tz \
       python3-vatnumber \
       python3-vobject \
       python3-werkzeug \
       python3-xlwt \
       python3-yaml \
       python3-webdav \
       python3-qrcode \
       python3-phonenumbers \
       python3-num2words \
       python3-matplotlib \
       python3-flake8 \
       && apt-get clean

# Deactivate the virtual environment
deactivate

# Create Odoo configuration file
sudo rm -rf /var/log/odoo16/erp.log
sudo rm -rf /etc/erp.conf
sudo tee /etc/erp.conf > /dev/null <<EOF
[options]
; This is the password that allows database operations:
; admin_passwd = 123456
db_host = False
db_port = False
; db_user = erp
db_password = False
addons_path = /opt/odoo16/erp/odoo/addons, /opt/odoo16/addons
logfile = /var/log/odoo16/erp.log
xmlrpc_port = 8077
worker = 5
proxy_mode = True
EOF

# Change Conf File Own and Conf:
sudo chmod +x /etc/erp.conf
sudo chown $USER:$USER /etc/erp.conf

# Create systemd service file for Odoo
sudo rm -rf /etc/systemd/system/erp.service
sudo tee /etc/systemd/system/erp.service > /dev/null <<EOF
[Unit]
Description=Odoo 16.0 for erp
Documentation=https://www.odoo.com
[Service]
# Ubuntu/Debian convention:
Type=simple
User=$USER
ExecStart=/opt/odoo16/erp/odoo/venv/bin/python3 /opt/odoo16/erp/odoo/odoo-bin -c /etc/erp.conf -l /var/log/odoo16/erp.log
[Install]
WantedBy=default.target
EOF

# Change Service File Own and Conf:
sudo chmod +x /etc/systemd/system/erp.service
sudo chown $USER:$USER /etc/systemd/system/erp.service

# Start and enable Odoo service
sudo systemctl daemon-reload
sudo systemctl start erp.service
sudo systemctl enable erp.service
sudo systemctl restart erp.service
sudo service erp restart
#######################################################################################################