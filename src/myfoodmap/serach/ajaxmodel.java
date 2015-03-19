package myfoodmap.serach;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import org.json.*;

public class ajaxmodel {
	public JSONArray srn(String USID,String Order,String dburl) {
		System.out.println("Model Start:\tUSID:"+USID+"\tFrom:"+dburl);
		Connection c=null;
		JSONArray jsonR=new JSONArray ();
		JSONArray jsonR2=new JSONArray ();
		String proc="";
		
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
			c = DriverManager.getConnection(dburl+";user=sa;password=111");

			String result=" <form id=\"target\" action=\"result.jsp\" method=\"post\"><input type=\"hidden\" id=\"input\" name=\"RSID\" value=\"7\"></form>";	
			Statement s =c.createStatement();
			System.out.println(Order);
			if(Order.equals("tup"))
			proc="sp_MPAT "+USID;
			if(Order.equals("tdown"))
			proc="sp_MPDC "+USID;
			ResultSet rs=s.executeQuery(proc);
			

			while (rs.next()){
				String CoorXY="'"+rs.getString("RCoorX")+","+rs.getString("RCoorY")+"'";
				JSONObject jsonresult=new JSONObject();
				jsonresult.put("text",rs.getString("RName")+"<br/>"+rs.getString("RTel")+"<br/>"+rs.getString("RRuntime"));
				jsonresult.put("addr",rs.getString("RCoorX")+","+rs.getString("RCoorY"));
				jsonresult.put("label",rs.getString("RName"));
				result+="<div id=\"resultls\" onclick=\"panto("+CoorXY+");\"><table>\n<tr><td width=\"50%\">店名:"+rs.getString("RName")+"</td><td width=\"50%\">電話:"+rs.getString("RTel")+"</td><tr><tr><td width=\"100%\" colspan=\"2\">用餐紀錄:"+((rs.getString("EatTimeT").equals("1900-01-01"))?"尚未品嘗":rs.getString("EatTimeT"))+"</td></tr>"
						+ "<tr><tr><td width=\"100%\" colspan=\"2\">加入地圖時間:"+rs.getString("EatTimeW").replace(".0", "")+"</td></tr>\n<tr><td colspan=\"2\"><a href=\"#\"  onclick=\"submit("+rs.getString("RSID")+");\">詳細資料</a></td><tr></table></div>";
				jsonR.put(jsonresult);		 
				System.out.println(rs.getString("EatTimeW").replace(".0", ""));
			}
			JSONObject jsonresult=new JSONObject();
			JSONArray jsonR3=new JSONArray ();
			jsonresult.put("result",result);
			jsonR3.put(jsonresult);
			jsonR2.put(jsonR);
			jsonR2.put(jsonR3);
		} catch (Exception e) {

			e.printStackTrace();
		} 
		return jsonR2;
	}
	public JSONArray srn(String serch,String dburl,String Type,String Coor) {
		System.out.println("Model Start:\tSerch:"+serch+"\tFrom:"+dburl+"\tType:"+Type+"\tCoor:"+Coor);
		Connection c=null;
		JSONArray jsonR=new JSONArray ();
		JSONArray jsonR2=new JSONArray ();
		String proc="";
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
			c = DriverManager.getConnection(dburl+";user=sa;password=111");
			if(Type.equals("1")){
				System.out.println("Type1");
				proc="sp_SRD1 "+Coor;}
			else if(Type.equals("2")){
				System.out.println("Type2");
				proc="sp_SRD5 "+Coor;}
			else{
				System.out.println("Type0");
				proc="sp_SRN "+serch;}

			String result=" <form id=\"target\" action=\"result.jsp\" method=\"post\"><input type=\"hidden\" id=\"input\" name=\"RSID\" value=\"7\"></form>";	
			Statement s =c.createStatement();
			ResultSet rs=s.executeQuery(proc);

			while (rs.next()){
				String CoorXY="'"+rs.getString("RCoorX")+","+rs.getString("RCoorY")+"'";
				JSONObject jsonresult=new JSONObject();
				//			      jsonresult.put("RSID",rs.getInt("RSID"));
				jsonresult.put("text",rs.getString("RName")+"<br/>"+rs.getString("RTel")+"<br/>"+rs.getString("RRuntime"));
				//			      jsonresult.put("RAddr",rs.getString("RAdd"));
				jsonresult.put("addr",rs.getString("RCoorX")+","+rs.getString("RCoorY"));
				jsonresult.put("label",rs.getString("RName"));
				result+="<div id=\"resultls\" onclick=\"panto("+CoorXY+");\"><table>\n<tr><td width=\"50%\">店名:"+rs.getString("RName")+"</td><td width=\"50%\">電話:"+rs.getString("RTel")+"</td><tr><tr><td width=\"100%\" colspan=\"2\">營業時間:"+rs.getString("RRuntime")+"</td></tr>\n<tr><td colspan=\"2\"><a href=\"#\"  onclick=\"submit("+rs.getString("RSID")+");\">詳細資料</a></td><tr></table></div>";
				//			      jsonresult.put("RTel",rs.getString("RTel"));
				//			      jsonresult.put("RRun",rs.getString("RRuntime"));
				//			      jsonresult.put("RMeau",rs.getString("RMeautime"));
				//			      jsonresult.put("RWeb",rs.getString("RWeb"));
				//			      jsonresult.put("RInfo",rs.getString("RInfo"));
				jsonR.put(jsonresult);		 
			}
			JSONObject jsonresult=new JSONObject();
			JSONArray jsonR3=new JSONArray ();
			jsonresult.put("result",result);
			jsonR3.put(jsonresult);
			jsonR2.put(jsonR);
			jsonR2.put(jsonR3);
		} catch (Exception e) {

			e.printStackTrace();
		} 
		return jsonR2;
	}
}
