#project02-role-web
resource "aws_iam_role" "project02-role-web" {
  name               = "project02-role-web"
  path               = "/"
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

resource "aws_iam_role_policy_attachment" "project02-s3" {
  role       = aws_iam_role.project02-role-web.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_role_policy_attachment" "project02-cd" {
  role       = aws_iam_role.project02-role-web.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole"
}

#project02-code-deploy-service-role
resource "aws_iam_role" "project02-cds-role" {
  name               = "project02-code-deploy-service-role"
  path               = "/"
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "codedeploy.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "project02-cds" {
  role       = aws_iam_role.project02-cds-role.name
  policy_arn = aws_iam_policy.project02-cds-policy.arn
}

#project02-code-deploy-ec2-role
resource "aws_iam_role" "project02-cde-role" {
  name               = "project02-code-deploy-ec2-role"
  path               = "/"
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

resource "aws_iam_role_policy_attachment" "project02-cdec2" {
  role       = aws_iam_role.project02-cde-role.name
  policy_arn = aws_iam_policy.project02-cdec2-policy.arn
}

resource "aws_iam_role_policy_attachment" "project02-cdecr" {
  role       = aws_iam_role.project02-cde-role.name
  policy_arn = aws_iam_policy.project02-cdecr-policy.arn
}
