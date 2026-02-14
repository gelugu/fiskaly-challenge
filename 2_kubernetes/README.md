# Task 2: Kubernetes Deployment

## Approach

The manifests are split into single-responsibility files rather than one large YAML.
This makes them individually applicable, reviewable, and composable with tools like Helm or Kustomize.

The architecture is:

```
Internet => nginx Ingress Controller => Service (ClusterIP) => Pods (2-4 replicas)
```

## Scaling

An HPA watches CPU utilization and scales between 2 and 4 replicas. The 70% CPU  threshold gives headroom before pods become saturated.
**Assumption**: a metrics server is installed for HPA to function (standard in managed K8s like GKE/EKS).

## Security

Layered at multiple levels:
- **Pod**: runs as non-root (UID 65534/nobody), read-only root filesystem, all Linux capabilities dropped, seccomp profile set to RuntimeDefault, service account token not mounted.
- **Network**: a NetworkPolicy restricts ingress to only the `ingress-nginx` namespace, so pods aren't directly reachable from other namespaces or the internet.

## Prerequisites

Make sure nginx ingress controller installed in the cluster

## Usage

```bash
kubectl apply -f ./manifests

kubectl -n hello-world rollout status deployment/hello-world
```

## Nginx Alternatives for Load Balancing

**Traefik** — Auto-discovers services via annotations, simpler configuration through CRDs, built-in Let's Encrypt.
Best for smaller clusters or teams that want less YAML.
Downside: lower raw throughput than nginx at very high scale.

**Envoy / Istio** — Full service mesh with mTLS between services, distributed tracing, circuit breaking, and fine-grained traffic policies.
Use when you have many microservices that need observability and security between them.
Significant operational overhead.

**Cloud-native ingress** (GKE Ingress, AWS ALB Controller) — Provisions the cloud provider's load balancer directly.
Less operational overhead, integrates with cloud IAM and certs.
Downsides: vendor lock-in and slower to provision/update than in-cluster controllers; usually less cost optimized.

**HAProxy** — High-performance TCP/HTTP load balancer. Strong choice for raw performance and advanced TCP routing.
Less Kubernetes-native than nginx or Traefik.
