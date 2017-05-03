package com.woyee.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;


public class FileUtil {

	public static boolean inPut(String fname,String importdate) {
		boolean isSuccessflag = false;
		String command= "" ;
		command = "import_acoma"+" "+fname+" "+importdate;
		try {
			Process ps=Runtime.getRuntime().exec(command);
			BufferedReader br = new BufferedReader(new InputStreamReader(ps.getInputStream()));
			StringBuffer sb = new StringBuffer();
			String line;
			while((line=br.readLine())!=null){
				sb.append(line).append("\n");
			}
			String result = sb.toString().trim();
			int len = 0;
			if(result.length()>2){
				len = result.length()-2;
				br.close();
				ps.destroy();
				ps=null;
				if(result.substring(len,len+2).equals("00")){
					 isSuccessflag=true;
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
			return isSuccessflag;
		}
		return isSuccessflag;
	}
}
