$(document).ready(() => {
	const ITEMS_PER_PAGE = 100;
	let currentPage = 1;
	
    // 로그 로드 함수
    function loadLogs(keyword = '', page = 1) {
        $.ajax({
            url: "socData.jsp",
            method: "POST",
            data: {
                keyword: keyword,
				page: page,
				itemsPerPage: ITEMS_PER_PAGE
            },
            success: function (response) {
                const logs = response.logs;
				const totalPages = response.totalPages;

                const tableBody = $('#logContainer tbody');
                tableBody.empty();

                if (logs && logs.length > 0) {
                    logs.forEach((log, index) => {
                        const logTimeStamp = log.match(/TimeStamp: (.+?)\n/);
                        const timeStamp = logTimeStamp ? logTimeStamp[1] : "Unknown";

                        tableBody.append(`
                            <tr>
								<td>${(page - 1) * ITEMS_PER_PAGE + index + 1}</td>
                                <td>${timeStamp}</td>
                                <td><pre>${log}</pre></td>
                            </tr>    
                        `);
                    });
                } else {
                    $('#logContainer tbody').html('<tr><td colspan="3" class="text-center text-danger">No logs found.</td></tr>');
                }
				
				renderPagination(totalPages, page);
            },
            error: function (error) {
                console.error("Error loading logs:", error);
                $('#logContainer').html(`<p class="text-center text-danger">Failed to load logs.</p>`);
            }
        });
    }

    // 검색 버튼 클릭 이벤트
    $('#searchBtn').on('click', () => {
		currentPage = 1;
        const keyword = $('#searchKeyword').val();
        loadLogs(keyword, currentPage);
    });
	
	function renderPagination(totalPages, currentPage) {
		const paginationContainer = $('#pagination');
		paginationContainer.empty();
		
		if (totalPages > 1) {
			for (let i = 1; i <= totalPages; i++) {
				paginationContainer.append(`
					<button class="btn btn-sm ${i === currentPage ? 'btn-primary' : 'btn-secondary'}" data-page="${i}">
						${i}
					</button>
				`)
			}
		}
		
		paginationContainer.find('button').on('click', function () {
			const page = $(this).data('page');
			loadLogs($('#searchKeyword').val(), page);
		});
	}

    // 초기 로그 로드
    loadLogs();
});