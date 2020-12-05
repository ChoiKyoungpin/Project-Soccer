package mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTPAuthenticator extends Authenticator{

	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		// TODO Auto-generated method stub
		return new PasswordAuthentication("choikb22@naver.com","m+cc632045");
	}

	
	
}
