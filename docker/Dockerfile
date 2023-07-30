FROM python:3.11.4-bookworm

# Generate locale C.UTF-8 for postgres and general locale data
ENV LANG C.UTF-8

# Set odoo version
ENV ODOO_VERSION 16.0

# Set the default config file
ENV ODOO_RC /etc/odoo/odoo.conf

# Expose Odoo services
EXPOSE 8069 8071 8072

# Set default user when running the container
USER root

COPY odoo_base /opt/odoo/odoo
COPY docker/odoo.conf /etc/odoo/odoo.conf
COPY docker/entrypoint.sh /entrypoint.sh

RUN sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt bookworm-pgdg main" > /etc/apt/sources.list.d/pgdg.list' && \
	wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
	apt-get update && \
	apt-get install -y --no-install-recommends postgresql-client-15 && \
	apt-get install -y --no-install-recommends \
		python3 \
		python3-pip \
		libldap2-dev \
		libsasl2-dev \
		libpq-dev \
		npm && \
	npm install -g rtlcss && \
	curl -o /opt/odoo/wkhtmltox.deb -sSL https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6.1-3/wkhtmltox_0.12.6.1-3.bookworm_amd64.deb && \
	apt-get install -y --no-install-recommends /opt/odoo/wkhtmltox.deb && \
	rm /opt/odoo/wkhtmltox.deb && \	
	mkdir -p \
		/opt/odoo \
		/opt/odoo/odoo \
		/opt/odoo/data_dir \
		/opt/odoo/log \
		/etc/odoo \
		/mnt/odoo/addons && \
	pip install -r /opt/odoo/odoo/requirements.txt && \
	pip install /opt/odoo/odoo/.


VOLUME ["/opt/odoo/odoo", "/opt/odoo/data_dir", "/opt/odoo/log", "/etc/odoo", "mnt/odoo"]

SHELL ["/bin/bash", "-xo", "pipefail", "-c"]

ENTRYPOINT ["/bin/bash"]

CMD ["/entrypoint.sh"]

