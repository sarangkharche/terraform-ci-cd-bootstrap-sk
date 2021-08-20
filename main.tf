# Step 1: Create IAM user in aws with progamatic access and admin policy

# Step 2: Get the access key ID, secret key, region and add it to you local env variables (on local terminal) as below:
# export AWS_ACCESS_KEY_ID=your_access_key
# export AWS_SECRET_ACCESS_KEY=your_secret_access_key
# export AWS_DEFAULT_REGION="us-east-1"

# Setp 3: terraform init the current config

# Step 4: Remove the comments from S3 backend and terrafon init & terraform apply
# Note: You might have to change the S3 bucket name

# Require TF version to be same as or greater than 0.12.13
terraform {

  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  required_version = ">=0.12.13"
  # uncommnet the below with cmd + k + u in vs code
  # backend "s3" {
  #  bucket         = "terraform-sk-bucket"
  #  key            = "terraform.tfstate"
  #  region         = "us-east-1"
  #  encrypt        = true
  # }

  
}

# Download any stable version in AWS provider of 2.36.0 or higher in 2.36 train
provider "aws" {

}

# Call the seed_module to build our ADO seed info
module "bootstrap" {
  source                      = "./modules/bootstrap"
  name_of_s3_bucket           = "terraform-sk-bucket"
  dynamo_db_table_name        = "aws-locks"
}
