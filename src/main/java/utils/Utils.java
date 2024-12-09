package utils;

import java.io.PrintWriter;

public class Utils {
	public static void presentAlert(PrintWriter script, String message) {
		script.println("<script>");
		script.println("alert('" + message + "');");
		script.println("</script>");
	}
	
	public static void location(PrintWriter script, String dest) {
		script.println("<script>");
        script.println("location.href = '" + dest + "';");
        script.println("</script>");
	}
}