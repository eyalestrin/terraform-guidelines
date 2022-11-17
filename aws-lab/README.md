# Goal
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
