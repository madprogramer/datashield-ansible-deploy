# DataSHIELD Ansible Deploy

Ansible Playbook for Installing/Updating DataSHIELD ([Opal](https://www.obiba.org/pages/products/opal/)) servers.

## Minimum Set-up

1. Clone [this repository](https://github.com/madprogramer/datashield-ansible-deploy).
2. [Install](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html), if you do not already have it.
3. Next, install dependencies by running `$ansible-galaxy install -r requirements.yml`.
4. This playbook assumes a [host group](https://docs.ansible.com/ansible/latest/getting_started/get_started_inventory.html) called DSServer (abbreviation for DataSHIELD Server). 
5. Copy the `inventory/hosts.template` file into a new **`inventory/hosts`** file and modify to add in your own hosts.
  * There should be **no** file extension at the end of **`inventory/hosts`**. Make sure not to save as **`inventory/hosts.txt`**
6. Copy the `inventory/group_vars/DSservers.template.yml` file into a new **`inventory/group_vars/DSservers.template.yml`** and make sure to modify variables to your own liking.
7. Run with `playbooks/setup.yml -i inventory -K` from inside `datashield-ansible-deploy`.
8. Enter root password when prompted with `BECOME:` by requesting it from your IT admin.
9. **IMPORTANT: Ensure that your Database is registered to Opal once installation completes. [See discussion here.](https://datashield.discourse.group/t/cannot-add-table-to-project-on-opal/309/4)**

## Recommended Set-up

Ansible can run on virtually anything modern, but it is important that your host machines are configured properly.
* Ansible-core >=2.11

### Recommended System Specifications (for Hosts)
* Ubuntu 20 server.
* **x86 Architecture.**
* \>=4GB RAM (>8 GB ideal)

### SSH set-up
* If you would like to use hosts with aliases you should modify your ssh config file. This is a file on the machine **you run Ansible from**, not on your hosts.
* Add the following to your [`~/.ssh/config`](https://docs.digitalocean.com/glossary/ssh-config/) directory.
```
Host [Alias]
  HostName [ADDRESS]
  Port [PORT]
  User [USER]
  PubkeyAuthentication yes
  IdentityFile ~/.ssh/id_rsa
```
(or possibly some different IdentityFile)

### Troubleshooting and Suggestions
To report a bug or make a suggestion you can [open issues](https://github.com/madprogramer/datashield-ansible-deploy/issues) on GitHub.
