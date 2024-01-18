//terraform {

//  backend "s3" {
//    bucket         = "gehc-pia-reli-tfstates3" ###name of backend s3 manually created
//    encrypt        = true
    #dynamodb_table = "gehc-pia-uat-wewpqz-dynamodb" #####dynamodb table manually created
//    key            = "romii/final/preprod/terraform.tfstate"
//    region         = "us-east-1"
//    profile = "gehealthcloud306" 
//    role_arn = "arn:aws:iam::444929565854:role/gehc-devopsbot"
//  }
//}

# terraform {
#   backend "local" {
#     path = "terraform.tfstate"
#   }
# }