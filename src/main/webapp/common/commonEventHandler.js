// soc 페이지 enter 검색
document.addEventListener('DOMContentLoaded', () => {
	const searchKeywordInput = document.getElementById('searchKeyword');
	const searchButton = document.getElementById('searchBtn');
	const handleKeyDown = (event) => {
		if (event.key === 'Enter') {
			event.preventDefault();
			searchButton.click();
		}
	}
			
	searchKeywordInput.addEventListener('keydown', handleKeyDown);
	
	window.addEventListener('unload', () => {
		searchKeywordInput.removeEventListener('keydown', handleKeyDown)
	})
});