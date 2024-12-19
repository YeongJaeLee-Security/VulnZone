// 입력값 검증 함수
 function validateForm() {
	const userID = document.querySelector('input[name="userID"]').value;
    const userPassword = document.querySelector('input[name="userPassword"]').value;
    const userName = document.querySelector('input[name="userName"]').value;

    // 아이디 검증: 영문 대소문자, 숫자, 길이 5~20
	const idRegex = /^(?=.*[a-z])(?=.*\d)[a-z0-9]{5,20}$/;
    if (!idRegex.test(userID)) {
        alert("아이디는 알파벳 소문자와 숫자로 구성된 5~20 글자여야 합니다.");
        return false;
    }

    // 비밀번호 검증: 영문 대소문자, 숫자, 특수문자 포함, 길이 8~20
    const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_])[a-zA-Z\d\W_]{8,20}$/;
    if (!passwordRegex.test(userPassword)) {
        alert("비밀번호는 알파벳 대소문자, 숫자, 특수문자를 포함한 8~20 글자여야 합니다.");
        return false;
    }

    // 이름 검증: 한글 또는 영문 대소문자, 2~20
    const nameRegex = /^[가-힣a-zA-Z]{2,20}$/;
    if (!nameRegex.test(userName)) {
        alert("이름은 한글 또는 알파벳 대소문자로 구성된 2~20 글자여야 합니다.");
        return false;
    }

    return true;
}