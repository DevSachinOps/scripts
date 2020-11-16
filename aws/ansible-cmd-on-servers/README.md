### About the Script

This script will run the command specified in the argument on all the servers present in the inventory file.
To create inventory file, we can use https://github.com/DevSachinOps/scripts/tree/master/aws/ansible-inventory-asg-elb OR
https://github.com/DevSachinOps/scripts/tree/master/aws/ansible-inventory-asg-tg as per you required.

#### Pre-reuisite
Ansible

#### Steps to run the Script

> open the terminal

> run command

> ansible-playbook command_on_servers.sh -i inventory.ini --private-key key_path/key.pem --extra-vars cmd_to_run="command to run on instances"


#### Result
It will run all the command specified in the argument
