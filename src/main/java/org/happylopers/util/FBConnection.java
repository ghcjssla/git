package org.happylopers.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

import org.springframework.stereotype.Component;

@Component
public class FBConnection {
	public static final String FB_APP_ID = "1796197107284136";
	public static final String FB_APP_SECRET = "29842faca997daa91b0bb739586b6a0f";
	/*public static final String REDIRECT_URI = "http://www.happylopers.com/springBoard/user/fbLogin";*/
	//public static final String REDIRECT_URI = "http://localhost/springBoard/user/fbLogin";

	public String getFBAuthUrl(String redirectURI) {
		String fbLoginUrl = "";
		try {
			fbLoginUrl = "http://www.facebook.com/dialog/oauth?" + "client_id="
					+ FBConnection.FB_APP_ID + "&redirect_uri="
					+ URLEncoder.encode(redirectURI, "UTF-8")
					+ "&scope=email";
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return fbLoginUrl;
	}

	public String getFBGraphUrl(String code,String redirectURI) {
		String fbGraphUrl = "";
		try {
			fbGraphUrl = "https://graph.facebook.com/oauth/access_token?"
					+ "client_id=" + FBConnection.FB_APP_ID + "&redirect_uri="
					+ URLEncoder.encode(redirectURI, "UTF-8")
					+ "&client_secret=" + FB_APP_SECRET + "&code=" + code;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return fbGraphUrl;
	}

	public String getAccessToken(String code, String redirectURI) {
		String accessToken = "";
		if ("".equals(accessToken)) {
			URL fbGraphURL;
			try {
				fbGraphURL = new URL(getFBGraphUrl(code, redirectURI));
			} catch (MalformedURLException e) {
				e.printStackTrace();
				throw new RuntimeException("Invalid code received " + e);
			}
			URLConnection fbConnection;
			StringBuffer b = null;
			try {
				fbConnection = fbGraphURL.openConnection();
				BufferedReader in;
				in = new BufferedReader(new InputStreamReader(
						fbConnection.getInputStream()));
				String inputLine;
				b = new StringBuffer();
				while ((inputLine = in.readLine()) != null)
					b.append(inputLine + "\n");
				in.close();
			} catch (IOException e) {
				e.printStackTrace();
				throw new RuntimeException("Unable to connect with Facebook "
						+ e);
			}

			String accessTokenJsonConvertToString = b.toString();
			accessTokenJsonConvertToString = accessTokenJsonConvertToString.replace("{", "");
			accessTokenJsonConvertToString = accessTokenJsonConvertToString.replace("}", "");
			accessTokenJsonConvertToString = accessTokenJsonConvertToString.replace("\"", "");
			accessTokenJsonConvertToString = accessTokenJsonConvertToString.replace(":", "=");
			accessTokenJsonConvertToString = accessTokenJsonConvertToString.replace(",", "&");
			accessToken = accessTokenJsonConvertToString;
			
			if (accessToken.startsWith("{")) {
				throw new RuntimeException("ERROR: Access Token Invalid: "
						+ accessToken);
			}
		}
		return accessToken;
	}
}
