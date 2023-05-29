module "s3" {
    source = "./S3"    
    bucket_name = "terraform-s3-apache-bucket"       
}

output "apache_user_arn" {
  value = "${module.s3.iam_user}"
}
