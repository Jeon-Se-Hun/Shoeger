package aaa.service;

import java.util.HashMap;
import org.json.simple.JSONObject;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class CertificationService {

	public void certifiedPhoneNumber(String phoneNumber, String cerNum) {

        String api_key = "NCSRXI2AFODZMRDL";
        String api_secret = "FE4AMNJAQKQEVNNAKJ09L1SWLHANYABJ";
        Message coolsms = new Message(api_key, api_secret);

        HashMap<String, String> params = new HashMap<String, String>();
        
        params.put("to", phoneNumber);    // 수신전화번호
        
        params.put("from", "010-4629-1085");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
        params.put("type", "SMS");
        params.put("text", "Shoeger 휴대폰인증 메시지 : 인증번호는" + "["+cerNum+"]" + "입니다.");
        params.put("app_version", "test app 1.2"); // application name and version

        try {
        	JSONObject obj = (JSONObject) coolsms.send(params);
            System.out.println(obj.toString());
        } catch (CoolsmsException e) {
            System.out.println(e.getMessage());
            System.out.println(e.getCode());
        }

    }
}
