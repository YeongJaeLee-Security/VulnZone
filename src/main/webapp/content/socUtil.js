$(document).ready(() => {
    // 로그 로드 함수
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

                if (logs && logs.length > 0) {
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
                    $('#logContainer tbody').html('<tr><td colspan="3" class="text-center text-danger">No logs found.</td></tr>');
                }
            },
            error: function (error) {
                console.error("Error loading logs:", error);
                $('#logContainer').html(`<p class="text-center text-danger">Failed to load logs.</p>`);
            }
        });
    }

    // 검색 버튼 클릭 이벤트
    $('#searchBtn').on('click', () => {
        const keyword = $('#searchKeyword').val();
        loadLogs(keyword);
    });

    // 초기 로그 로드
    loadLogs();
});
		