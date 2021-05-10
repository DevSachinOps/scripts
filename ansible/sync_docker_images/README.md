
## Overview
- Ansible Role tasks
    * Skopeo login for different docker registries
    * Iterate over variable yaml dictionary and create registries (if not present), if prefix is ECR
    * Iterate of variable yaml dictionary and run skopeo copy command

- Run the ansible playbook `ansible-playbook sync_registries.yml`


## Pre-requisites
* jq, Ansible (with Jinja2), Ansible Lint, AWS CLI, gcloud command line and skopeo
- Set Environment Variables
    * DOCKERHUB_USER
    * DOCKERHUB_PASS
    * AWS_ACCESS_KEY_ID
    * AWS_SECRET_ACCESS_KEY
    * AWS_DEFAULT_REGION
* gcr_creds.json should be in the same dir, from where you are running the playbook.
* Update `.roles/vars/main.yml` as per your requirements.

## Run the skopeo commands with environment variables and mount folders as volumes
* This command will run the ansible playbook.
* `ansible-playbook sync_registries.yml -v`

## Tools Used
- Ansible
    * Input a dictionary with a list of registries and some variables

- Ansiblelint
    * To check and fix basic Ansible linting issues

- Jinja2
    * To loop over variables and create skopeo copy commands

- Docker
- Docker Registries
    * DockerHub
        - Credential of DockerHub
    * ECR (AWS)
        - Assume role from one account to another
    * GCR (GCP)
- https://github.com/containers/skopeo
    * Copy (or pull and push) images from one docker registry to another