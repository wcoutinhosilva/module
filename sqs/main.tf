locals {
  fila_nome = var.fifo_queue ? format("%s-%s-%s.fifo", var.produto, var.nome_da_fila, var.ambiente) : format("%s-%s-%s", var.produto, var.nome_da_fila, var.ambiente)
}

resource "aws_sqs_queue" "main" {
  name                        = local.fila_nome
  tags                        = var.tags
  delay_seconds               = var.delay_seconds
  max_message_size            = var.maximum_message_size
  message_retention_seconds   = var.message_retention_seconds
  visibility_timeout_seconds  = var.visibility_timeout_seconds
  receive_wait_time_seconds   = var.receive_wait_time_seconds
  fifo_queue                  = var.fifo_queue
  content_based_deduplication = var.content_based_deduplication

  redrive_policy = var.sqs_dlq ? jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dlq[0].arn
    maxReceiveCount     = 5
  }) : null
}

resource "aws_sqs_queue" "dlq" {
  count      = var.sqs_dlq ? 1 : 0
  name       = var.fifo_queue ? replace(local.fila_nome, ".fifo", "-dlq.fifo") : "${local.fila_nome}-dlq"
  fifo_queue = var.fifo_queue
  tags       = var.tags
}
