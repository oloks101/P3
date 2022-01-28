resource "null_resource" "kube_configuration" {
    provisioner "local-exec" {
    command = "aws eks --region ap-southeast-1 update-kubeconfig --name ${var.cluster-name}"
  }
}