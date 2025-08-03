variable "produto" {
  description = "Nome do produto"
  type        = string
}

variable "nome_do_topico" {
  description = "Nome base do tópico SNS"
  type        = string
}

variable "ambiente" {
  description = "Ambiente (dev, prod, etc)"
  type        = string
}

variable "tags" {
  description = "Tags para os recursos"
  type        = map(string)
  default     = {}
}

variable "sqs_queue_arn" {
  description = "ARN da fila SQS para subscrição"
  type        = string
  default     = null
}

