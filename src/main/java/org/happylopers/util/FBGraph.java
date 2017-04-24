package org.happylopers.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import org.json.JSONObject;
import org.springframework.stereotype.Component;

@Component
public class FBGraph {

	public String getFBGraph(String accessToken) {
		String graph = null;
		try {
			String g = "https://graph.facebook.com/me?fields=email,id,name&" + accessToken;
			URL u = new URL(g);
			URLConnection c = u.openConnection();
			BufferedReader in = new BufferedReader(new InputStreamReader(
					c.getInputStream()));
			String inputLine;
			StringBuffer b = new StringBuffer();
			while ((inputLine = in.readLine()) != null)
				b.append(inputLine + "\n");
			in.close();
			graph = b.toString();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("ERROR in getting FB graph data. " + e);
		}
		return graph;
	}
	
	public JSONObject getGraphJsonData(String fbGraph) {
		return new JSONObject(fbGraph);
	}	
	
}
