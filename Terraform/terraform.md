## terraform
   1. infra as a code
   2. install terraform 
      ```
      choco install terraform
      ``` 
   3. terraform from hacicorp
   4. terraform developed in go language
   5. terraform is folder level 
   6. terraform file we write in json or terraform DSL
## building Blocks of terraform 
   1. provider: where do you want to create infra 
      1. eg: aws , azure , gcp ,openstack 
   2. variable: avoid hard coding
   3. resources: vpc , ec2 
   4. provisioners: run any commands in vm's 
   5. output: display result in terminal 

## write terraform file for creating vpc 
   1. provider 
      ```
     provider "aws" {
        region     = "us-west-2"
        access_key = "AKIAZ7Z2Z7W6RLMHKXMQ"
        secret_key = "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"
        }
     ```  
   2. resource 
      ``` 
      resource "aws_vpc" "myvpc" {
        cidr_block       = "192.168.0.0/16"
        instance_tenancy = "default"
        enable_dns_hostnames = true 

        tags = {
            Name = "network"
        }
      } 
     resource "aws_internet_gateway" "gw" {
        vpc_id = aws_vpc.myvpc.id

        tags = {
            Name = "main"
        }
        }
      ``` 
