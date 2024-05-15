provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "test_user" {
  name = "test_user"
}

resource "aws_iam_access_key" "test_user_key" {
  user = aws_iam_user.test_user.name
}

resource "aws_iam_user_policy" "test_user_policy" {
  name = "test_user_policy"
  user = aws_iam_user.test_user.name

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "*",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_group" "test_group" {
  name = "test_group"
}

resource "aws_iam_group_policy" "test_group_policy" {
  name  = "test_group_policy"
  group = aws_iam_group.test_group.name

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "*",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role" "test_role" {
  name = "test_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "test_policy" {
  name   = "test_policy"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "*",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "test_instance_profile" {
  name = "test_instance_profile"
  role = aws_iam_role.test_role.name
}

resource "aws_iam_role_policy_attachment" "test_attach" {
  role       = aws_iam_role.test_role.name
  policy_arn = aws_iam_policy.test_policy.arn
}

resource "aws_iam_user_policy_attachment" "test_user_attach" {
  user       = aws_iam_user.test_user.name
  policy_arn = aws_iam_policy.test_policy.arn
}

resource "aws_iam_group_policy_attachment" "test_group_attach" {
  group      = aws_iam_group.test_group.name
  policy_arn = aws_iam_policy.test_policy.arn
}