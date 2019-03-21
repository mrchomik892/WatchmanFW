# follow.py
#
# Follow a file like tail -f.

import smtplib
from email.mime.text import MIMEText

config = {
    'SRCMAIL': "security@menel.tkruk.it",
    'HOSTNAME': "localhost"
    }


def sndmail(subject, dstmail, content="no content"):
        msg = MIMEText(content)
        msg['Subject'] = subject
        msg['From'] = config['SRCMAIL']
        msg['To'] = dstmail
        s = smtplib.SMTP(config['HOSTNAME'])
        s.sendmail(config['SRCMAIL'], dstmail, msg.as_string())
        s.quit()

def sndmail1(subject, dstmail, content="no content"):
	print(subject)
