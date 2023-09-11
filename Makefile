# The following Makefile is specifically designed for GitHub actions
# You are welcome to take inspiration from it, but you will likely
# not be able to run this on your machine due to secrets.

# Create hosts
inventory/hosts: inventory/hosts.template
	cp inventory/hosts.template inventory/hosts
	# Add Secrets
	echo '\n$\{{ secrets.TEST_HOST }} # Test Host supplied by secrets in GitHub Actions' >>inventory/hosts

# Create DSservers.yml
inventory/group_vars/DSservers.yml: inventory/group_vars/DSservers.template.yml
	cp inventory/group_vars/DSservers.template.yml inventory/group_vars/DSservers.yml
	# Add Secrets