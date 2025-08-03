output "main_queue_url" {
  value = aws_sqs_queue.main.url
}

output "dlq_queue_url" {
  value = var.sqs_dlq ? aws_sqs_queue.dlq[0].url : null
}
