cluster_name = "dev_cluster"
k8s_version  = "1.31.1"
region       = "fr-par"
node_type    = "DEV1-S"
node_count   = 1
autohealing  = true
autoscaling  = true
min_size     = 1
max_size     = 1
pool_name    = "dev-pool"

github_organization = "trungleduc"
repository          = "nginx-k8s"