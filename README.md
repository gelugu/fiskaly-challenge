# Challenge from Fiskaly

## 1. Docker – “Hello World” Web App

> Create a simple Dockerfile that builds a containerized web app responding with "Hello World" to HTTP requests on port 8080.
> 
> Use a language of your choice (e.g., TypeScript or Python).
> 
> You can write your own app or use a simple containerized server (e.g., nginx, Apache, lighttpd + static HTML).
> 
> Include a docker run command that launches the container.
> 
> The service should be accessible from your local machine and ideally from other devices on the same network (firewall configs can be skipped).

Find the solution in [1_docker](./1_docker) folder. The reasoning can be found in [1_docker/README.md](./1_docker/README.md) file.

## 2. Kubernetes Deployment

> Using the web app from Task 1:
>
> Create Kubernetes deployment manifests that:
>
> Deploy at least 2 replicas (scale up to 4 under higher load)
>
> Use nginx as a load balancer
>
> Include resource configurations and basic security settings
>
> Optional: Suggest any alternatives to nginx for load balancing and explain when you’d use them.

Find the solution in [2_kubernetes](./2_kubernetes) folder. The reasoning can be found in [2_kubernetes/README.md](./2_kubernetes/README.md) file.

## 3. Infrastructure as Code (IaC)

> Use Terraform (preferred) or another IaC tool to define a simple infrastructure setup in GCP or AWS:
>
> A VPC with subnets
>
> A Kubernetes cluster with 4 nodes (GKE or EKS) capable of hosting the app from Task 2
>
> A network security configuration that only allows necessary traffic
>
> We’d like to see how you structure infrastructure and make decisions around cloud architecture.

Find the solution in [3_terraform](./3_terraform) folder. The reasoning can be found in [3_terraform/README.md](./3_terraform/README.md) file.

## 4. Ansible Playbook

> Write a playbook that does the following across a fleet of Linux servers (Ubuntu + RedHat):
>
> Gather system facts
>
> Update package repositories
>
> Upgrade packages
>
> On Ubuntu only:
>
> Ensure Apache is installed
>
> Serve a static HTML page with "Hello World"
>
> Restart Apache after config changes
>
> On RedHat only:
>
> Ensure MariaDB is installed
>
> Enable and start MariaDB

Find the solution in [4_ansible](./4_ansible) folder. The reasoning can be found in [4_ansible/README.md](./4_ansible/README.md) file.
