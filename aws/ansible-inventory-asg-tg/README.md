### About the Script

This script help us in creating the inventory file with all the instances present under that ASG's Target Group.

#### Pre-reuisite
AWS Cli 

#### Steps to run the Script

> open the terminal

> run command

> bash inventory.sh "Target_Group_ARN" "path_of_inventory_file.ini"


#### Result
It will create a file at the path specied in the cmd args like this

[ASG]</br>
10.0.12.12</br>
10.0.12.13</br>
