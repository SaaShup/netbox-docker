ARG NETBOX_VERSION=v4.2.3

FROM netboxcommunity/netbox:${NETBOX_VERSION}

RUN mkdir /opt/netbox/plugins
COPY requirements.txt /opt/netbox/plugins
COPY configuration/plugins.py /etc/netbox/config/plugins.py
COPY configuration/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY entrypoint.sh /opt/netbox/entrypoint.sh

RUN pip install -r /opt/netbox/plugins/requirements.txt

RUN rm -rf /opt/netbox/plugins

CMD ["/opt/netbox/entrypoint.sh"]
