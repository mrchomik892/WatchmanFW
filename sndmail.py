# sndmail.py
#
# Sending mails

#Importing modules
import smtplib
from email.mime.text import MIMEText

#Script
def sndmail(hostname,sender,reciever,subject,content="no content"):
        msg = MIMEText(content)
        msg['Subject'] = subject
        msg['From'] = sender
        msg['To'] = reciever
        s = smtplib.SMTP(hostname)
        s.sendmail(sender, reciever, msg.as_string())
        s.quit()
