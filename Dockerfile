ARG NETBOX_VERSION=v4.4.5

FROM netboxcommunity/netbox:${NETBOX_VERSION}

COPY plugin_requirements.txt /opt/netbox/
RUN /usr/local/bin/uv pip install -r /opt/netbox/plugin_requirements.txt

COPY configuration/plugins.py /etc/netbox/config/plugins.py
COPY configuration/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY entrypoint.sh /opt/netbox/entrypoint.sh

LABEL internal_version="4.4.5.1"

CMD ["/opt/netbox/entrypoint.sh"]
