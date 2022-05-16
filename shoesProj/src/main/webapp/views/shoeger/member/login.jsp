<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <div class="login">
        <h2>로그인</h2>

        <form action="" method="post" name="frm" id="form">
            <input type="text" name="pid" placeholder="아이디" id="pid">
            <div id="pid_check"></div>
            <input type="password" name="pw" placeholder="비밀번호" id="pw">
            <div id="pw_check"></div>
            <input type="submit" value="로그인" disabled="disabled" id="login">
        </form>

        <div class="aTag">
            <a href="/shoeger/member/join">회원가입</a> |
            <a href="/shoeger/member/findForm?find=id">아이디</a> |
            <a href="/shoeger/member/findForm?find=pw">비밀번호 찾기</a>
        </div>
        <a href="/shoeger/naver_login">
            <img src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" />
        </a>
    </div>
