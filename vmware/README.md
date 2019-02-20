Role Name
=========

Role clones VM and assign IPs.
- 3x CentOS 7 (CIM, PUMP, vTSI)
- 1x Win2k16 (MDB)

Requirements
------------

Same as for Ansible "vmware_guest" module.
Access with proper rights to vcenter_host

Role Variables
--------------

A description of the settable variables for this role should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read from other roles and/or the global scope (ie. hostvars, group vars, etc.) should be mentioned here as well.

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

cd /home/kamil/ansible-vmware
ansible-playbook -i inventory site.yml -e "vmwarepassword=<password> vmstate=poweredon project=test_auto6"


License
-------

BSD

Author Information
------------------

Kamil Monticolo
