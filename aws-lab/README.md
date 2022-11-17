## Goal
* Build a multi server (cluster)  
* Connect the servers to a LoadBalancer  
* Expose the LB to the world (create a custom Security group to expose port 80 to 0.0.0.0)  
* EC2 instance details:  
  * Region = **us-east-1**  
  * AMI: **ami-09d3b3274b6c5d4aa**  
  * Instance size: **t2.micro**  
  * User data:  
    **<code>sudo yum update -y</code>**  
    **<code>sudo amazon-linux-extras install nginx1 -y</code>**  
    **<code>sudo systemctl start nginx</code>**  

## Terraform installation
1. Follow the instructions below to install Terraform:  
  https://github.com/eyalestrin/terraform-guidelines/blob/master/Terraform%20Configuration.md  
2. Create customer IAM policy, using the instructions below:  
  https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-create-and-attach-iam-policy.html  
  Note: Use the content of the following JSON file, when creating the IAM policy:  
  https://github.com/eyalestrin/terraform-guidelines/blob/master/aws-lab/Custom_Create_EC2_Instance.json  
3. Folloe the instructions below to configure Terraform for AWS provider:  
  https://github.com/eyalestrin/terraform-guidelines/blob/master/How%20to%20configure%20Terraform%20for%20AWS%20provider.md  

## Terraform project configuration
1. Copy the files below to a local terraform folder:  
  https://github.com/eyalestrin/terraform-guidelines/blob/master/aws-lab/alb.tf  
  https://github.com/eyalestrin/terraform-guidelines/blob/master/aws-lab/auto_scaling_group.tf  
  https://github.com/eyalestrin/terraform-guidelines/blob/master/aws-lab/aws_lb_listener.tf  
  https://github.com/eyalestrin/terraform-guidelines/blob/master/aws-lab/aws_lb_listener_rule.tf  
  https://github.com/eyalestrin/terraform-guidelines/blob/master/aws-lab/launch_configuration.tf  
  https://github.com/eyalestrin/terraform-guidelines/blob/master/aws-lab/provider.tf  
  https://github.com/eyalestrin/terraform-guidelines/blob/master/aws-lab/security_group.tf  
2. Edit the file **launch_configuration.tf** and update the data of the value **key_name** according to your target key pair name.  
  Note: For further instructions about creating a key pair, see:  
  https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/create-key-pairs.html  

## Running Terraform commands
1. Move the Terraform scripts folder.  
2. Run the command below to initialize the Terraform:  
  **<code>terraform init</code>**  
3. Run the command below to check your scripts before making changes to your infrastructure:  
  **<code>terraform plan</code>**  
4. Run the command below to run the Terraform scripts:  
  **<code>terraform apply</code>**  

## Cleanup phase
1. Move the Terraform scripts folder.  
2. Run the command below to delete all changes done using the Terraform scripts:  
  **<code>terraform destroy</code>**  

## Troubleshooting
1. In case you would like to troubleshoot and login to the EC2 instances, edit the file **security_group.tf**.
2. Uncheck the **ingress** section related to inbound port 22.
3. Save the **security_group.tf** file.
4. Run the command below to apply the changes:  
  **<code>terraform apply</code>**  
5. Login to the EC2 console:  
  https://console.aws.amazon.com/ec2/  
6. Locate one of the EC2 instances, copy it's public IP address and try to login using your private key.
