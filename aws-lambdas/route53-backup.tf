module "route53_backup_function" {
  source  = "claranet/lambda/aws"
  version = "0.11.4"

  function_name                  = "route53_backup"
  handler                        = "route53_backup.lambda_handler"
  memory_size                    = 512
  reserved_concurrent_executions = -1
  runtime                        = "python3.7"
  timeout                        = 60
  source_path                    = "${path.module}/lambda-codes/route53_backup.py"
  build_paths                    = ["build.py", "built.py", "hash.py"]
  policy                         = "${data.aws_iam_policy_document.route53_backup_policy.json}"
  attach_policy                  = true
}

data "aws_iam_policy_document" "route53_backup_policy" {
  statement {
    actions = [
      "s3:PutObject",
      "route53:ListResourceRecordSets",
    ]

    resources = [
      "arn:aws:s3:::258772036713-route53-backup/*",
      "arn:aws:route53:::hostedzone/*",
    ]
  }

  statement {
    actions = [
      "route53:ListHostedZones",
    ]

    resources = [
      "*",
    ]
  }
}

module "route53_backup_event_rule" {
  source = "modules/cloudwatch-event-rule/schedule-expression"

  event_rule_name                = "Route53-S3-Backup"
  event_rule_description         = "cron(0 9 ? * * *) - Saves all Route53 DNS entries to S3 bucket"
  event_rule_schedule_expression = "cron(0 9 ? * * *)"
  function_name                  = "route53_backup"
  function_arn                   = "${module.route53_backup_function.function_arn}"
}
