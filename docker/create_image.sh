DOCKERFILE_PATH=docker/Dockerfile
ENTRYPOINT_PATH=docker/entrypoint.sh
ODOO_CONF_PATH=docker/odoo.conf
ODOO_BASE_DIR_PATH=odoo_base

exit_if_file_not_exists() {
	if [ -z "$1" ]
	then
		echo "'$1' does not exist. Termination..."
		exit 1
	fi
}

exit_if_dir_is_empty() {
	if [ ! -d "$1" ]
	then
		echo "'$1' dir not exist. Termination..."
		exit 1
	fi

	if [ -z "$(ls -A $1)" ]
	then
		echo "$1 is Empty"
		exit 1
	fi
}

exit_if_file_not_exists $DOCKERFILE_PATH
exit_if_file_not_exists $ENTRYPOINT_PATH
exit_if_file_not_exists $ODOO_CONF_PATH
exit_if_dir_is_empty $ODOO_BASE_DIR_PATH

docker build -f docker/Dockerfile -t mlgmag/odoo-docker:latest .

