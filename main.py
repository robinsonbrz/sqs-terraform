from send import SqsManager
import uuid


for i in range(3):
    four_digits =str(uuid.uuid4())[0:4]
    sqs = SqsManager('rob_fila_sqs.fifo')
    message_attributes={
        'Author': {
            'StringValue': f'Robinson {four_digits}',
            'DataType': 'String'
        },
        'LastName': {
            'StringValue': f'Silva {four_digits}',
            'DataType': 'String'
        }
    }

    sqs.send_message(f'Hello, {four_digits}', 'group1', message_attributes)
