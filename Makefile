.PHONY: get_odoo_base

ODOO_BASE_DIR = $(PWD)/odoo_base

get_odoo_base:
ifeq ($(wildcard $(ODOO_BASE_DIR)),)
	git clone https://github.com/odoo/odoo.git "$(ODOO_BASE_DIR)" --branch 16.0 --depth 1
else
	@echo "Directory '$(ODOO_BASE_DIR)' already exists"
endif

create_image:
	bash docker/create_image.sh

