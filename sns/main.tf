locals {
  topico_nome = format("%s-%s-%s", var.produto, var.nome_do_topico, var.ambiente)
}

resource "aws_sns_topic" "main" {
  name = local.topico_nome
  tags = var.tags
}

resource "aws_sns_topic_subscription" "sqs" {
  count     = var.sqs_queue_arn != null && var.sqs_queue_arn != "" ? 1 : 0
  topic_arn = aws_sns_topic.main.arn
  protocol  = "sqs"
  endpoint  = var.sqs_queue_arn
}
