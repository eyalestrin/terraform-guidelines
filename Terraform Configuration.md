# Terraform Configuration

## Terraform on Windows Platform

1. Login to a machine with privileged account

2. Create a new folder for the Terraform binary

   `mkdir C:\Terraform`

3. Download the Terraform binary from:

   https://www.terraform.io/downloads.html

4. Extract the Terraform binary into C:\Terraform

5. Add the Terraform folder to the PATH:

   Control Panel -> System -> Advanced system settings -> Advanced tab -> Environment Variables -> under System variables, locate Path -> click on Edit -> add C:\Terraform to the Path and click OK 3 times and close the Control Panel



## Terraform on Linux Platform

1. Login to a Linux machine

2. Create a new folder for the Terraform binary

   `mkdir ~/terraform`

3. Download the Terraform binary from:

   https://www.terraform.io/downloads.html

4. Extract the Terraform binary into ~/terraform

5. Edit the file ~/.bashrc and add the following lines to the end of the file:

   `export PATH=$PATH:${HOME}/terraform`

6. Save the file 

7. Run the command below to update the PATH:

   `source ~/.bashrc`