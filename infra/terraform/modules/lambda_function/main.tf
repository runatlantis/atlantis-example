data "archive_file" "hello_world" {
  type        = "zip"
  source_dir  = "${path.module}/hello_world"
  output_path = "/tmp/hello_world.zip"
}

resource "aws_lambda_function" "hello_world" {
  filename         = "/tmp/hello_world.zip"
  source_code_hash = "${data.archive_file.hello_world.output_base64sha256}"
  function_name    = "atlantis_hello_world"
  role             = "${aws_iam_role.hello_world.arn}"
  handler          = "hello_handler"
  runtime          = "python3.6"
  timeout          = 300
  depends_on       = ["data.archive_file.hello_world"]

  environment {
      variables = {
          SENSITIVE = "secret"
      }
  }
}

data "aws_iam_policy_document" "hello_world" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    effect = "Allow"
  }
}

resource "aws_iam_role" "hello_world" {
  name               = "atlantis_hello_world_lambda"
  assume_role_policy = "${data.aws_iam_policy_document.hello_world.json}"
}
