# How to use Terraform for configuring resources in AWS

## Create EC2 instance

1. Login to a machine using command line

2. Create folder for the scripts

   `mkdir scripts`

3. Move to the scripts folder

   `cd scripts`

4. Run the command below to prepare the working folder:

   `terraform init`

5. Create sample script called "create_ec2_instance.tf" with the following contents:

   **provider "aws" {**
     **region                  = "eu-west-1"**
     **shared_credentials_file = "/home/eyal/.aws/credentials"**
     **profile                 = "default"**
   **}**

   **resource "aws_instance" "example" {**
     **ami           = "ami-0ea3405d2d2522162"**
     **instance_type = "t2.micro"**
   **}**

6. Run the command below to apply the configuration from the terraform script:

   `terraform apply`

   Note: Review the changes and write "yes" to approve making the changes from the terraform script

7. Run the command below to review the changes performed by the terraform script:

   `terraform show`

8. To remove all resources created by the script configuration, run the command below:

   `terraform destroy`

   Note: There is no undo to this process. If you agree, write "yes" to continue with the operations