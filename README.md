<p align="center"> <img src="https://user-images.githubusercontent.com/50652676/62349836-882fef80-b51e-11e9-99e3-7b974309c7e3.png" width="100" height="100"></p>


<h1 align="center">
    Terraform AWS EKS WP
</h1>

<p align="center" style="font-size: 1.2rem;"> 
    Terraform to create EKS Cluster on AWS for Wordpress and RDS(MySQL).
     </p>

<p align="center">

<a href="https://www.terraform.io">
  <img src="https://img.shields.io/badge/Terraform-v0.13-green" alt="Terraform">
</a>
<a href="LICENSE.md">
  <img src="https://img.shields.io/badge/License-MIT-blue.svg" alt="Licence">
</a>


</p>
<p align="center">

</p>
<hr>

### EKS in AWS for Wordpress with Terraform


1. VPC File:
> It creates 1 VPC, 2 Subnet, Internet gateway and a Routing table attached with Internet gateway and associated with both subnets.

2. EKS-Cluster File:
> It creates an IAM Role to allow EKS service to manage other AWS services. A security group attached our VPC and allow 443(https) and creates an EKS-Cluster.

3. EKS-Worker-node File:
> Creates IAM role allowing Kubernetes actions to access other AWS services and a EKS Node Group with 2 nodes with AMI AL2_x86_64 and t2.micro attached with a key for ssh.

4. RDS File:
> It creates a Database Instance of MySQL with username and password. These credentials are stored in a var.tf file.

5. Update KubeConfig File:
> This file will update the Kube Configuration file with the AWS EKS cluster name.

6. Kubernetes Configuration File:
> It creates a PVC for our deployment and then deploys a WordPress container linked with RDS as Database and a LoadBalancer service exposed at port 80.

### Let Run Them!
`Terraform init` → this will install requiered Plugins

`Terraform Plan` → To check resources to be created.

`Terraform apply` → Execute every task.

`Terraform destroy` → Destroy all AWS resources created by this repo.
