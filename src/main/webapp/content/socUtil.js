$(document).ready(function () {
	
	$('#searchBtn').on('click', function () {
		const keyword = $('#searchKeyword').val();
		loadLogs(keyword);
	})
	
	function loadLogs(keyword = '') {
		$.ajax({
			url: "socData.jsp",
			method: "POST",
			data: {
				keyword: keyword
			},
			success: function (response) {
				const logs = response.logs;
				
				const tableBody = $('#logContainer tbody');
				tableBody.empty();
				
				if (logs.length > 0) {
					logs.forEach((log, index) => {
						const logTimeStamp = log.match(/TimeStamp: (.+?)\n/);
						const timeStamp = logTimeStamp ? logTimeStamp[1] : "Unknown";
						
						tableBody.append(`
							<tr>
								<td>${index + 1}</td>
								<td>${timeStamp}</td>
								<td><pre>${log}</pre></td>
							</tr>	
						`);
					});
				} else {
					 $('#logContainer tbody').html('<tr><td colspan="3" class="text-center text-danger">Failed to load logs.</td></tr>');
				}
			},
			
			error: function (error) {
				console.error(error)
				$('#logContainer').html(`<p class="text-center text-danger">Failed to load logs.</p>`);
			}
		})
	}
	
	loadLogs();
})