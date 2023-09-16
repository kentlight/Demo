provider "kubernetes" {
  config_path = "~/.kube/config"  # Path to your kubeconfig file
  config_context = "kind-my-kind-cluster" # The Kubernetes context you want to use
}

resource "kubectl_manifest" "kind-app-deployment" {
  yaml_body = <<-YAML
    apiVersion: apps/v1
    kind: Deployment
    metadata:
      name: kind-app-deployment
    spec:
      replicas: 2
      selector:
        matchLabels:
          app: kind-app-deployment
      template:
        metadata:
          labels:
            app: kind-app-deployment
        spec:
          containers:
            - name: kind-app-deployment
              image: maiempire/kind-app:latest
              ports:
                - containerPort: 3000
                  name: kind-app-deployment
    YAML
}

resource "kubectl_manifest" "kind-app-service" {
  yaml_body = <<-YAML
    apiVersion: v1
    kind: Service
    metadata:
      name: kind-app-service
    spec:
      type: LoadBalancer
      selector:
        app: kind-app-deployment
      ports:
        - name: kind-app-deployment
          protocol: TCP
          port: 3000
          targetPort: 3000
    YAML
}
