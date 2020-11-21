#!/bin/bash

#Sebastian Gonzalez Medellin
#Este escrip envia un correo a los correos que el usuario asigne
Correo=$1
function py { python3 -c "$1" ; }


for i in $(cat $Correo)
do 
    py "
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
import smtplib
import json

data = {}
with open('pass.json') as f:
     data = json.load(f)
# create message object instance
msg = MIMEMultipart()

message = 'Hola amigo, quieres jugar Amongus'

# setup the parameters of the message
msg['From'] = data['user']

msg['To'] = '$i'
msg['Subject'] = 'Correo mandado por python'

# add in the message body
msg.attach(MIMEText(message, 'plain'))

#create server
server = smtplib.SMTP('smtp.office365.com:587')
server.starttls()

# Login Credentials for sending the mail
print(data['user'])
server.login(data['user'], data['pass'])

# send the message via the server.
server.sendmail(msg['From'], msg['To'], msg.as_string())

server.quit()

print('successfully sent email to %s:' % (msg['To']))
    "
done 