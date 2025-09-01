ARG NETBOX_VERSION=v4.3.7

FROM netboxcommunity/netbox:${NETBOX_VERSION}

COPY plugin_requirements.txt /opt/netbox/
RUN /usr/local/bin/uv pip install -r /opt/netbox/plugin_requirements.txt

COPY configuration/plugins.py /etc/netbox/config/plugins.py
COPY configuration/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY entrypoint.sh /opt/netbox/entrypoint.sh

CMD ["/opt/netbox/entrypoint.sh"]
