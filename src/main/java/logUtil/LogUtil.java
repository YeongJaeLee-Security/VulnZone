package logUtil;

import java.io.FileWriter;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import java.util.*;


public class LogUtil {
	private Properties properties = new Properties();
	private String logPath;
	private String splunkCollectUrl;
	private String splunkUrl;
	private String splunkToken;

	public LogUtil() {
		try {
			InputStream inputStream = LogUtil.class.getClassLoader().getResourceAsStream("config.properties");
			properties.load(inputStream);

			logPath = properties.getProperty("log.file.path");
			splunkCollectUrl = properties.getProperty("splunk.collect.url");
			splunkUrl = properties.getProperty("splunk.url");
			splunkToken = properties.getProperty("splunk.hec.token");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String getLogPath() {
		return this.logPath;
	}

	public String getSplunkUrl() {
		return this.splunkUrl;
	}

	public void writeLog(HttpServletRequest request) {
		Date now = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String formattedDate = simpleDateFormat.format(now);
		String path = logPath + formattedDate + "_log.log";

		try (PrintWriter writer = new PrintWriter(new FileWriter(path, true))) {
			StringBuilder logEntry = new StringBuilder();

			logEntry.append("TimeStamp: ").append(now).append("\n");
			logEntry.append("IP: ").append(request.getRemoteAddr()).append("\n");
			logEntry.append("URL: ").append(request.getRequestURL()).append("\n");
			logEntry.append("Method: ").append(request.getMethod()).append("\n");

			logEntry.append("Headers:\n");
			Enumeration<String> headerNames = request.getHeaderNames();
			while (headerNames.hasMoreElements()) {
				String headerName = headerNames.nextElement();
				logEntry.append("  ").append(headerName).append(": ").append(request.getHeader(headerName)).append("\n");
			}

			logEntry.append("Query Parameters:\n");
			Enumeration<String> paramNames = request.getParameterNames();
			while (paramNames.hasMoreElements()) {
				String paramName = paramNames.nextElement();
				logEntry.append("  ").append(paramName).append(": ").append(request.getParameter(paramName)).append("\n");
			}

			logEntry.append("Threat Detection: ").append(detectThreat(request)).append("\n");
			logEntry.append("------------------------------------------------------------\n");

			writer.println(logEntry.toString());
			sendLogToSplunk(logEntry.toString());

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private String detectThreat(HttpServletRequest request) {
		String url = request.getRequestURL().toString();
		String allParams = request.getQueryString() != null ? request.getQueryString() : "";

		// SQL injection Detect
		if (url.matches(".*(['\";\\-\\-]+).*") || allParams.matches(".*(['\";\\-\\-]+).*")) {
			return "SQL Injection Attempt";
		}

		// XSS 탐지
		if (url.toLowerCase().contains("<script>") || allParams.toLowerCase().contains("<script>")) {
			return "XSS Attempt";
		}

		// 추가 공격에 대한 탐지는 아래에 작성...

		return "No Threat Detected";
	}

	private void sendLogToSplunk(String logMessage) {
	    try {
	        HttpClient client = HttpClient.newBuilder().build();

	        // 로그 메시지를 개별 항목으로 분리
	        String[] logEntries = logMessage.split("------------------------------------------------------------");
	        List<String> sanitizedLogEntries = new ArrayList<>();

	        // 각 로그 항목을 JSON 형식으로 변환
	        for (String logEntry : logEntries) {
	            if (!logEntry.trim().isEmpty()) {
	                String sanitizedLogEntry = logEntry
	                    .replace("\\", "\\\\") // 백슬래시 이스케이프
	                    .replace("\"", "\\\"") // 따옴표 이스케이프
	                    .replace("\n", "\\n") // 줄바꿈 이스케이프
	                    .replace("\r", "\\r"); // 캐리지 리턴 이스케이프

	                sanitizedLogEntries.add(sanitizedLogEntry.trim());
	            }
	        }

	        // 각 로그 항목을 개별적으로 splunk로 전송
	        for (String logEntry : sanitizedLogEntries) {
	            String jsonPayload = String.format(
	                "{\"event\": \"%s\", \"sourcetype\": \"_raw\", \"host\": \"localhost\", \"source\": \"VulnZone\", \"index\": \"main\"}",
	                logEntry
	            );

	            HttpRequest request = HttpRequest.newBuilder()
	                .uri(URI.create(splunkCollectUrl))
	                .header("Authorization", "Splunk " + splunkToken)
	                .header("Content-Type", "application/json")
	                .POST(HttpRequest.BodyPublishers.ofString(jsonPayload, StandardCharsets.UTF_8))
	                .build();

	            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

	            if (response.statusCode() == 200) {
	            	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
	                System.out.println("Log sent successfully: " + response.body() + " - " + dateFormat.format(new Date()));
	            } else {
	                System.err.println("Failed to send log. Response code: " + response.statusCode());
	                System.err.println("Response body: " + response.body());
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
}