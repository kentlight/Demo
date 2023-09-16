
resource "kubectl_manifest" "kind-app-deployment" {
  yaml_body = file("${path.module}/../k8s/deployment.yml")
}

resource "kubectl_manifest" "kind-app-service" {
  yaml_body = file("${path.module}/../k8s/service.yml")
}

