# EKS

## Build

### Apply terraform
Build an EKS cluster using the terraform provided:

```
export AWS_ACCESS_KEY_ID=xxxx
export AWS_SECRET_ACCESS_KEY=xxxxx
export AWS_SESSION_TOKEN=xxxxx

terraform init
terraform apply
```

Note: This can take about 10 minutes.

### Check the cluster

Configure kubectl so we can interogate our cluster

```
aws eks --region $(terraform output -raw region) \
    update-kubeconfig \ 
    --name $(terraform output -raw cluster_name)
```

See if we are running, with nodes attached.

```
kubectl cluster-info
kubectl get nodes
```

 
