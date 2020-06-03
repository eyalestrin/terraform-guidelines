# How to configure Terraform for AWS provider

## How to configure AWS Account and Access Keys

1. Login to the IAM Console:

   https://console.aws.amazon.com/iam/

2. From the left pane, click on Users -> click on “Add user” -> specify the user name -> access type: “Programmatic access” -> do not select “AWS Management Console access” -> click “Next: Permissions”

3. From the “add user to group”, either select existing group or click on “Create group” -> click “Next: Review” -> click on “Create user”

4. Download the CSV file with the “Access key ID” and “Secret access key” and save the CSV file in a secure location

5. Click Close

6. Log off the AWS console

   

## Installing AWS CLI

1. Login to the machine using privileged account.

2. Download the latest build of AWS CLI.

   + Windows download instruction and location:

     https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-windows.html

   + Linux download instruction and location:

     https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html



## Configuring the AWS CLI

1. Login to the IAM Console:

2. Run the command below in-order to configure AWS CLI:

   `aws configure –profile <profile_name>`

   + **Profile name** – set relevant target profile name

   + **AWS Access Key ID** – Specify the value from the CSV of the previously created IAM user

   + **AWS Secret Access Key** – Specify the value from the CSV of the previously created IAM user

   + **Default region name** – specify a region such as eu-west-1

     Full list:

     https://docs.aws.amazon.com/general/latest/gr/rande.html

   + **Default output format:** JSON

3. By default, the credentials file is stored here:
   + On Windows: **C:\Users\username.aws\credentials**
   + On Linux: **~/.aws/credentials**



## Using the AWS shared credentials file

Each Terraform configuration file (*.tf) for using the AWS provider must contain the following code at the beginning of the configuration file:

`provider "aws" {
  region                  = "us-west-2"
  shared_credentials_file = "/home/my_user/.aws/credentials"
  profile                 = "customprofile"
}`

Note 1: Replace "us-west-2" with the target region code, from the list below:

https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html#concepts-available-regions

Note 2: Replace **/home/my_user/.aws/credentials** with the relevant location of the credentials files

Note 3: Replace **customeprofile** with the target AWS configuration profile name