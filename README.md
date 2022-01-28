<p align="center"> <img src="https://user-images.githubusercontent.com/50652676/62349836-882fef80-b51e-11e9-99e3-7b974309c7e3.png" width="100" height="100"></p>


<h1 align="center">
    Terraform AWS EKS
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

<a href='https://facebook.com/sharer/sharer.php?u=https://github.com/devops4mecode/terraform-aws-eks-wp-rds'>
  <img title="Share on Facebook" src="https://user-images.githubusercontent.com/50652676/62817743-4f64cb80-bb59-11e9-90c7-b057252ded50.png" />
</a>
<a href='https://www.linkedin.com/shareArticle?mini=true&title=Terraform+AWS+EKS&url=https://github.com/devops4mecode/terraform-aws-eks-wp-rds'>
  <img title="Share on LinkedIn" src="https://user-images.githubusercontent.com/50652676/62817742-4e339e80-bb59-11e9-87b9-a1f68cae1049.png" />
</a>
<a href='https://twitter.com/intent/tweet/?text=Terraform+AWS+EKS&url=https://github.com/devops4mecode/terraform-aws-eks-wp-rds'>
  <img title="Share on Twitter" src="https://user-images.githubusercontent.com/50652676/62817740-4c69db00-bb59-11e9-8a79-3580fbbf6d5c.png" />
</a>

</p>
<hr>

### EKS in AWS for Wordpress 


1. VPC File:
>>It Creates 1 VPC, 2 Subnet, Internet gateway and a Routing table attached with Internet gateway and associated with both the subnet.

2. EKS-Cluster File:
>>It first creates an IAM Role to allow EKS service to manage other AWS services. A security Group attracted our VPC and allow 443(https) and Creates an EKS-Cluster.

3. EKS-Worker-node File:
>>Creates IAM role allowing Kubernetes actions to access other AWS services and A EKS Node Group with 2 nodes with AMI AL2_x86_64 and t2.micro attracted with key for ssh.

4. RDS File:
>> It Creates a Database Instance of MySQL with username and password. These Credentials are stored in Var.tf file.

5. Update KubeConfig File:
>> This File Will update The Kube Configuration File with AWS EKS Cluster.

6. Kubernetes Configuration File:
>> It Creates a PVC For Our Deployment and then Deploys a WordPress Container linked with RDS as Database and has a LoadBlancer Service Exposed at port 80.

### Let Run Them!
`Terraform init` → this will install requiered Plugins

`Terraform Plan` → To Check Resources to be Created.

`Terraform apply` → Execute Every Task.

`Terraform destroy` → Destroy all AWS resources created by this repo.
