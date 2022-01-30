resource "null_resource" "kube_configuration" {
    provisioner "local-exec" {
    command = "aws eks --region eu-west-1 update-kubeconfig --name ${var.cluster-name}"
  }
}