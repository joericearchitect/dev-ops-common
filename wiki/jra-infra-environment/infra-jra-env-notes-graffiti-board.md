 ## Overview
 
 Just somee random notes in planning out JRA infra.  just to capture stuff
 
 go back and comb through all this and make formal docs
 
# Overview Notes on Environments

## Tools used in Environments

| Tool | Used for | Notes |
| ----- |  -----   | -----  | 
| Terraform | Create & Destroy Environment Networking & Machine Resources | |
| Ansible | Provision Environment and Deploy Apps | |
| Docker Swarm |  | |
| JRA Infra CLI (Python Script) | Command Line Interface to 1) create, configure, refresh, and destroy environments, 2) Get Inforation & Metadata about Environments, 3) deploy resources into environments, 4) validate environments  | JRA CLI will be used by both humans and automation tools. The CLI calls teraform, ansible, docker swarm, and the JRA Infra API to automate. | 
| JRA Infra Admin Docker Image | Make it easy to execute JRA CLI commands without having to set up a machine or environment.  Docker is only prerequisite.  | | 
| JRA Jenkins CI / CD Pipeline | manage environments through CI / CD pipelines.  Automated and Manual Push-button.  The only interface non-ops users use to interact with environments  | | 


## Environments


  -  
     