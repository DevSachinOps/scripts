### About the Script

This script help us in creating the inventory file with all the instances present under that ASG's ELB.

#### Pre-reuisite
AWS Cli

#### Steps to run the Script

> open the terminal

> run command

> bash inventory.sh "ELB_NAME" "path_of_inventory_file.ini"


#### Result
It will create a file at the path specied in the cmd args like this

[ASG]</br>
10.0.12.12</br>
10.0.12.13</br>
