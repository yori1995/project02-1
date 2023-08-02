resource "aws_iam_policy" "project02-cdec2-policy" {
  name        = "project02-code-deploy-ec2-policy"
  description = "project02-code-deploy-ec2-policy"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "s3:Get*",
          "s3:List*"
        ],
        "Resource" : "*"
      }
    ]
  })
}

resource "aws_iam_policy" "project02-cdecr-policy" {
  name        = "project02-code-deploy-ecr-policy"
  description = "project02-code-deploy-ecr-policy"

  policy = jsonencode({

    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "ListImagesInRepository",
        "Effect" : "Allow",
        "Action" : [
          "ecr:ListImages"
        ],
        "Resource" : "arn:aws:ecr:ap-northeast-2:257307634175:repository/*"
      },
      {
        "Sid" : "GetAuthorizationToken",
        "Effect" : "Allow",
        "Action" : [
          "ecr:GetAuthorizationToken"
        ],
        "Resource" : "*"
      },
      {
        "Sid" : "ManageRepositoryContents",
        "Effect" : "Allow",
        "Action" : [
          "ecr:GetAuthorizationToken",
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetDownloadUrlForLayer",
          "ecr:GetRepositoryPolicy",
          "ecr:DescribeRepositories",
          "ecr:ListImages",
          "ecr:DescribeImages",
          "ecr:BatchGetImage",
          "ecr:InitiateLayerUpload",
          "ecr:UploadLayerPart",
          "ecr:CompleteLayerUpload",
          "ecr:PutImage"
        ],
        "Resource" : "arn:aws:ecr:ap-northeast-2:257307634175:repository/*"
      }
    ]
  })
}

resource "aws_iam_policy" "project02-cds-policy" {
  name        = "project02-code-deploy-service-policy"
  description = "project02-code-deploy-service-policy"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "autoscaling:CompleteLifecycleAction",
          "autoscaling:DeleteLifecycleHook",
          "autoscaling:DescribeAutoScalingGroups",
          "autoscaling:DescribeLifecycleHooks",
          "autoscaling:PutLifecycleHook",
          "autoscaling:RecordLifecycleActionHeartbeat",
          "autoscaling:CreateAutoScalingGroup",
          "autoscaling:CreateOrUpdateTags",
          "autoscaling:UpdateAutoScalingGroup",
          "autoscaling:EnableMetricsCollection",
          "autoscaling:DescribePolicies",
          "autoscaling:DescribeScheduledActions",
          "autoscaling:DescribeNotificationConfigurations",
          "autoscaling:SuspendProcesses",
          "autoscaling:ResumeProcesses",
          "autoscaling:AttachLoadBalancers",
          "autoscaling:AttachLoadBalancerTargetGroups",
          "autoscaling:PutScalingPolicy",
          "autoscaling:PutScheduledUpdateGroupAction",
          "autoscaling:PutNotificationConfiguration",
          "autoscaling:PutWarmPool",
          "autoscaling:DescribeScalingActivities",
          "autoscaling:DeleteAutoScalingGroup",
          "ec2:DescribeInstances",
          "ec2:DescribeInstanceStatus",
          "ec2:TerminateInstances",
          "tag:GetResources",
          "sns:Publish",
          "cloudwatch:DescribeAlarms",
          "cloudwatch:PutMetricAlarm",
          "elasticloadbalancing:DescribeLoadBalancers",
          "elasticloadbalancing:DescribeInstanceHealth",
          "elasticloadbalancing:RegisterInstancesWithLoadBalancer",
          "elasticloadbalancing:DeregisterInstancesFromLoadBalancer",
          "elasticloadbalancing:DescribeTargetGroups",
          "elasticloadbalancing:DescribeTargetHealth",
          "elasticloadbalancing:RegisterTargets",
          "elasticloadbalancing:DeregisterTargets"
        ],
        "Resource" : "*"
      }
    ]
  })
}
