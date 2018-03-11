#/usr/bin/env bash

# copy the common application variables
GROUP_VAR_DIRS=$(find ../../../applications -type d -name "all" | grep "inventory\/group_vars")
for DIR in ${GROUP_VAR_DIRS}; do
	echo "Copying the common application variables to ${DIR}"
	#echo "cp ../../../common/environments/inventory/group_vars/all/000_cross_env_vars.yml ${DIR}/."
	cp ../../../common/environments/inventory/group_vars/all/000_common* ${DIR}/.
done

# copy the common inventory definitions
INVENTORY_DIRS=$(find ../../../applications -type d -name "inventory" )
for DIR in ${INVENTORY_DIRS}; do
	echo "Copying the common inventory definition to ${DIR}"
	#echo "cp ../../../common/environments/inventory/000_cross_env_inventory ${DIR}/."
	cp ../../../common/environments/inventory/000_common* ${DIR}/.
done
