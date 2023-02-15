#local variables
variable "cpname" { default = "tfcp-v0" } 
variable "repo" { default = "ccuse1" } 
variable "branch" { default = "master" } 
variable "deploys3objectkey" { default = "tfbuild.zip" } 
variable "cbnamev0" { default = "tfcb-v0" } 
variable "cpbucket" { default = "tfcpcbv0" } 
variable "cprole" { default = "tfcpv0-role" } 
variable "cbrole" { default = "tfcbv0-role" } 
variable "cbnamev1" { default = "tfcb-v1" } 
variable "approve_sns_arn" { default = "arn:aws:sns:us-east-1:272099525906:tv0" } 
variable "lambda2update" { default = "v0" } 

