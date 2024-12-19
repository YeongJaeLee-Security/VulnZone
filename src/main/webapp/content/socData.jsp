<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.text.SimpleDateFormat, java.io.BufferedReader, java.io.FileReader, java.util.*, java.io.*, java.util.stream.Collectors"%>
<%@ page import="logUtil.LogUtil"%>
<%
final int MAX_LOG_COUNT = 3000; // 로그 최대 개수 설정, 이 개수를 계속 유지

// 로그 가져오기
LogUtil logUtil = new LogUtil();
List<String> logs = new LinkedList<>(); // LinkedList 사용으로 삽입/삭제 성능 최적화

String logDirPath = logUtil.getLogPath();
File logDir = new File(logDirPath);

if (!logDir.isDirectory()) {
	response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "");
	return;
}

File[] logFiles = logDir.listFiles((dir, name) -> name.endsWith(".log"));

if (logFiles != null) {
	for (File logFile : logFiles) {
		try (BufferedReader reader = new BufferedReader(new FileReader(logFile))) {
			if (!logFile.getCanonicalPath().startsWith(logDirPath)) {
				throw new SecurityException("Unauthorized file access attempt.");
			}
			
			StringBuilder logEntry = new StringBuilder();
			String line;
			
			while ((line = reader.readLine()) != null) {
				if (line.trim().isEmpty()) {
					// 로그 추가 전에 최대 개수 초과 여부 확인
					if (logs.size() >= MAX_LOG_COUNT) {
						logs.remove(0); // 가장 오래된 로그 제거
					}
					logs.add(logEntry.toString());
					logEntry = new StringBuilder();
				} else {
					logEntry.append(line).append("\n");
				}
			}
			
			// 다 쓰고도 남았다면 마지막 처리
			if (logEntry.length() > 0) {
				if (logs.size() >= MAX_LOG_COUNT) {
					logs.remove(0);
				}
				logs.add(logEntry.toString().trim());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
} else {
	response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "");
	return;
}
%>

<%
// 로그 내보내기
if (!"POST".equalsIgnoreCase(request.getMethod())) {
	response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "");
	return;
}

// 최신 로그가 상단에 표시되도록 순서 반전
Collections.reverse(logs);

try {
    String keyword = request.getParameter("keyword");

    if (keyword != null && !keyword.trim().isEmpty()) {
        logs.removeIf(log -> !log.contains(keyword)); // 조건에 맞지 않는 항목 제거
    }
} catch (Exception e) {
    e.printStackTrace();
}

response.setContentType("application/json");
response.setCharacterEncoding("UTF-8");

StringBuilder jsonBuilder = new StringBuilder();
jsonBuilder.append("{");
jsonBuilder.append("\"logs\": [");

for (int i = 0; i < logs.size(); i++) {
	String escapedLog = logs.get(i)
			.replace("\\", "\\\\")
			.replace("\"", "\\\"")
			.replace("\n", "\\n")
			.replace("\r", "\\r");
	
	jsonBuilder.append("\"").append(escapedLog).append("\"");

	if (i < logs.size() - 1) {
		jsonBuilder.append(", ");
	}
}

jsonBuilder.append("]");
jsonBuilder.append("}");

response.getWriter().write(jsonBuilder.toString());
response.getWriter().flush();
%>
