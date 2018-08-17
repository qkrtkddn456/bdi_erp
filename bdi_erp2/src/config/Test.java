package config;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class Test {

	public static void main(String[] args) {
		String path ="/config/db.properties";
		InputStream is = Test.class.getResourceAsStream(path);
		Properties prop = new Properties();
		
		try {
			prop.load(is);
			System.out.println(prop.getProperty("test"));
			System.out.println(prop.getProperty("dr"));
			System.out.println(prop.getProperty("uu"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
