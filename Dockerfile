ARG NETBOX_VERSION=v4.6.2

FROM netboxcommunity/netbox:${NETBOX_VERSION}

COPY plugin_requirements.txt /opt/netbox/
RUN /usr/local/bin/uv pip install -r /opt/netbox/plugin_requirements.txt

COPY configuration/plugins.py /etc/netbox/config/plugins.py
COPY configuration/base_path.py /etc/netbox/config/base_path.py
COPY configuration/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY docker/entrypoint.sh /opt/netbox/entrypoint.sh
COPY docker/launch-netbox.sh /opt/netbox/launch-netbox.sh

LABEL internal_version="4.6.2.0"
LABEL prometheus_scrape="true"
LABEL prometheus_address="netbox:8080"

CMD ["/opt/netbox/entrypoint.sh"]
