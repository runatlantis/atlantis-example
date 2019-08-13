resource "aws_cloudwatch_event_rule" "event_rule" {
  name                = "${var.event_rule_name}"
  description         = "${var.event_rule_description}"
  schedule_expression = "${var.event_rule_schedule_expression}"
}

resource "aws_cloudwatch_event_target" "event_target" {
  rule      = "${aws_cloudwatch_event_rule.event_rule.name}"
  target_id = "${var.function_name}"
  arn       = "${var.function_arn}"
  input     = "${var.input}"
}

resource "aws_lambda_permission" "function_permission" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = "${var.function_name}"
  principal     = "events.amazonaws.com"
  source_arn    = "${aws_cloudwatch_event_rule.event_rule.arn}"
}
