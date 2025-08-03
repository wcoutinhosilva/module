locals {
  produto                     = "nome do produto" # OBRIGATÓRIO
  nome_da_fila                = "nome da fila"    # OBRIGATÓRIO
  ambiente                    = "dev/prd/hml"     # OBRIGATÓRIO
  delay_seconds               = 0                 # OPCIONAL
  maximum_message_size        = 262144            # OPCIONAL
  message_retention_seconds   = 345600            # OPCIONAL
  visibility_timeout_seconds  = 30                # OPCIONAL
  receive_wait_time_seconds   = 0                 # OPCIONAL
  fifo_queue                  = false             # OPCIONAL
  content_based_deduplication = false             # OPCIONAL
  sqs_dlq                     = true              # OPCIONAL
  tags = {
    Produto    = local.produto
    NomeDaFila = local.nome_da_fila
    Ambiente   = local.ambiente
  }
}

module "sqs" {
  source                      = "../"
  produto                     = local.produto
  nome_da_fila                = local.nome_da_fila
  ambiente                    = local.ambiente
  sqs_dlq                     = local.sqs_dlq
  tags                        = local.tags
  delay_seconds               = local.delay_seconds
  maximum_message_size        = local.maximum_message_size
  message_retention_seconds   = local.message_retention_seconds
  visibility_timeout_seconds  = local.visibility_timeout_seconds
  receive_wait_time_seconds   = local.receive_wait_time_seconds
  fifo_queue                  = local.fifo_queue
  content_based_deduplication = local.content_based_deduplication
}
