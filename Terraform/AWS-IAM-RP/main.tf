provider "aws" {
  region = "us-west-2"
  access_key = "AKIA3NSUQQ7NUWFOJM54" 
  secret_key = "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"

}


resource "aws_iam_user" "admin-user" {
  name = "biemislam"
  tags = {
    Description = "Technical Team Lead"
  }
}

resource "aws_iam_policy" "adminPolicy" {
  name = "AdminPolicy"
  policy = file("admin-policy.json")
}

resource "aws_iam_user_policy_attachment" "biemislam-admin-access" {
  user = aws_iam_user.admin-user.name
  policy_arn = aws_iam_policy.adminPolicy.arn
}

resource "aws_iam_group" "finance-analysts" {
  name = "finance-analysts"
}

resource "aws_iam_user_group_membership" "finance-analyst" {
  user = aws_iam_user.admin-user.name
  groups = [
    aws_iam_group.finance-analysts.name
  ]
}
