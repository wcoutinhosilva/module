locals {
  produto        = "antifraude"
  nome_do_topico = "notificacoes"
  ambiente       = "dev"
  sqs_queue_arn  = "arn:aws:sqs:us-east-1:123456789012:minha-fila" # OPCIONAL: ARN da fila SQS
  tags = {
    Produto  = local.produto
    Topico   = local.nome_do_topico
    Ambiente = local.ambiente
  }
}

module "sns" {
  source         = "../"
  produto        = local.produto
  nome_do_topico = local.nome_do_topico
  ambiente       = local.ambiente
  tags           = local.tags
  sqs_queue_arn  = local.sqs_queue_arn # OPCIONAL
}
