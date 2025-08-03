variable "produto" {
  description = "Nome do produto"
  type        = string
}

variable "nome_da_fila" {
  description = "Nome base da fila"
  type        = string
}

variable "ambiente" {
  description = "Ambiente (dev, prod, etc)"
  type        = string
}

variable "sqs_dlq" {
  description = "Se true, cria uma DLQ para a fila principal"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags para os recursos"
  type        = map(string)
  default     = {}
}

variable "delay_seconds" {
  description = "Tempo de atraso para entrega das mensagens (em segundos)"
  type        = number
  default     = 0
}

variable "maximum_message_size" {
  description = "Tamanho máximo permitido para cada mensagem (em bytes)"
  type        = number
  default     = 262144
}

variable "message_retention_seconds" {
  description = "Tempo de retenção das mensagens na fila (em segundos)"
  type        = number
  default     = 345600
}

variable "visibility_timeout_seconds" {
  description = "Tempo que a mensagem fica invisível após ser lida (em segundos)"
  type        = number
  default     = 30
}

variable "receive_wait_time_seconds" {
  description = "Tempo de espera para long polling (em segundos)"
  type        = number
  default     = 0
}

variable "fifo_queue" {
  description = "Define se a fila é FIFO (true) ou padrão (false)"
  type        = bool
  default     = false
}

variable "content_based_deduplication" {
  description = "Para FIFO: ativa deduplicação baseada no conteúdo da mensagem"
  type        = bool
  default     = false
}
