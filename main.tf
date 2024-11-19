# terraform init
# terraform fmt
# terraform validate
# terraform plan
# terraform apply
# terraform destroy
# terraform show
# terraform output

# terraform state show aws_sqs_queue.rob_fila_sqs
# terraform taint aws_sqs_queue.rob_fila_sqs
# terraform untaint aws_sqs_queue.rob_fila_sqs
# terraform import aws_sqs_queue.rob_fila_sqs https://sqs.us-east-1.amazonaws.com/123456789012/rob-fila-sqs-queue
# terraform refresh
# terraform state rm aws_sqs_queue.rob_fila_sqs
# terraform state mv aws_sqs_queue.rob_fila_sqs aws_sqs_queue.rob_fila_sqs_new
# terraform state push
# terraform state pull
# terraform state list
# terraform state show aws_sqs_queue.rob_fila_sqs
# terraform state rm aws_sqs_queue.rob_fila_sqs
# terraform state mv aws_sqs_queue.rob_fila_sqs aws_sqs_queue.rob_fila_sqs_new
# terraform state push


terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

resource "aws_sqs_queue" "rob_fila_sqs" {
  name                       = "rob_fila_sqs.fifo"
  fifo_queue                 = true
  delay_seconds              = 0
  visibility_timeout_seconds = 30
  max_message_size           = 2048
  message_retention_seconds  = 86400
  receive_wait_time_seconds  = 2
  sqs_managed_sse_enabled    = true
}


# saida queue url
output "queue_url" {
  value = aws_sqs_queue.rob_fila_sqs.url
}

