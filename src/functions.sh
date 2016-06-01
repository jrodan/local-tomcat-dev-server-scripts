startMysql() { 
   mysql.server start
}

#mail.session.mail.transport.protocol=smtp
#mail.session.mail.smtp.host=macci
#mail.session.mail.smtp.password=
#mail.session.mail.smtp.user=
#mail.session.mail.smtp.port=9105
#mail.session.mail.smtp.auth=false


startSmtpServer() {
	## java -jar $JR_SCRIPTS_BASE/lib/fakeSMTP-2.0.jar -m -p 9105 > /dev/null 2>&1 &
	java -jar $1/lib/fakeSMTP-2.0.jar -m -p 9105 > /dev/null 2>&1 &
}