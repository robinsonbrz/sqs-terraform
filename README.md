# Enviando e recebendo mensagens fila AWS Sqs

Passos para implementação

Pré requisitos:

1 - Python 3.10

2 - aws-cli

___

1 - Configurando aws para conexão Terraform

```aws configure```

    Access Key

    Secret Access Key

2 - Inicializando o Terraform

```terraform init```

3 - ```terraform validate``` Opcional

4 - Verificando tf files

```terraform plan```

6 - Aplicando as configurações

```terraform apply```

-> yes

7 - Criando o ambiente python

```python -m venv .venv```

8 - ```source .venv/bin/activate```

9 - ```pip install boto3```

9 - ```pip install --upgrade botocore```

10 - Exemplo de envio de mensagens

```python main.py```

11 - Exemplo de recebimento de mensagens


## Recursos extra e base de conhecimento



Como criar comando pra mandar mensagem no SQS através de Command Line?
https://www.youtube.com/watch?v=L6DN29a31cY

aws sqs send-message --queue-url https://sqs.us-east-1.amazonaws.com/531974639494/rob_fila_sqs.fifo --message-body "Hello from the CLI!"


###

Enviando message attributes

Criando um json file

attributes.json

```
{
  "AttributeName1": {
    "DataType": "String",
    "StringValue": "Robinson"
  },
  "AttributeName2": {
    "DataType": "Number",
    "StringValue": "777" 
  }
}
```

aws sqs send-message --queue-url https://sqs.us-east-1.amazonaws.com/531974639494/rob_fila_sqs.fifo --message-body "From the CLI with attributes" --message-attributes file://attributes.json


You can have a maximum of 10 message attributes in a single Amazon SQS message. 
This limit applies regardless of whether you set the attributes individually or from a JSON file.

Key Points to Remember:

Total Size Limit: The total size of all message attributes in a message (including attribute names, data types, and values) cannot exceed 256 KB.

Attribute Name Limits:

Maximum length: 256 characters

Valid characters: Alphanumeric characters (a-z, A-Z, 0-9), hyphens (-), underscores (_), and periods (.)

Data Type Limits:

"String": Maximum length of 8 KB.

"Number": Must be a string representation of a number that can be represented as a 64-bit signed integer.

"Binary": Maximum size of 4 KB after Base64 encoding.
