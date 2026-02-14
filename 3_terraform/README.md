# Task 3: Terraform — GCP Infrastructure

## Approach

GCP was chosen over AWS because GKE provides a more integrated Kubernetes experience (automatic control plane management, native Workload Identity, simpler networking defaults).

The infrastructure follows a defense-in-depth model:

```
Internet => Firewall (HTTP/S only) => Cloud NAT => Private GKE Nodes => Pods
```

Key architectural decisions:

- **Private cluster**: nodes have no public IPs. Outbound internet access (for pulling images, OS updates) goes through Cloud NAT. This eliminates a class of direct-access attacks.
- **VPC-native networking**: pods and services get their own IP ranges via secondary subnet ranges, enabling native GCP firewall rules on pod traffic.
- **Workload Identity**: maps Kubernetes service accounts to GCP IAM, so pods never need static service account keys (except fo some rare cases like `vertexai.user` which sometimes require SA key mounting).

## Prerequisites

Enable `Kubernetes Engine API` on Cloud Console.
Make sure to fill `project_id` default value (or use `-var="project_id=FIXME` flag on plan and apply).

## Usage

```bash
terraform init
terraform plan
terraform apply

gcloud container clusters get-credentials hello-world --region europe-west3 --project FIXME
```

## What's NOT included (and why)

- **Remote state backend**: production Terraform uses a remote state (GCP Bucket, AWS S3, etc). Omitted here so anyone can run this without pre-creating a bucket.
- **Node pool autoscaler**: the task specifies exactly 4 nodes. In production, you'd set `min_node_count`/`max_node_count` on the node pool.
