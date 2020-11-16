---
-
  hosts: all
  remote_user: ubuntu
  serial: 4
  gather_facts: no
  name: "Perform PM2 operations"
  tasks:
    - name: "Restart sanctuary"
      shell: "{{cmd_to_run}}"
      args:
        executable: /bin/bash
      register: result

    - debug: var=result.stdout_lines
