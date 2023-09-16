terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.0.0"
    }
  }
}

provider "kubernetes" {
  config_path   = "~/.kube/config"
  config_context = "kind-my-kind-cluster"
}

resource "kubectl_manifest" "kind-app-deployment" {
  yaml_body = file("${path.module}../k8s/deployment.yml")
}

resource "kubectl_manifest" "kind-app-service" {
  yaml_body = file("${path.module}../k8s/service.yml")
}
