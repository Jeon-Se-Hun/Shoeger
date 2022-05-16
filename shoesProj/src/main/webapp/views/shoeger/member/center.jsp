<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
 
    <div class="center">
        <ul>
            <li>
                <h3>고객센터</h3>
            </li>
            <li><a href='<c:url value="/shoeger/member/center/notice/list"/>'>공지사항</a></li>
            <li><a href='<c:url value="/shoeger/member/center/qna/list"/>'>QnA</a></li>
            <li><a href='<c:url value="/shoeger/member/center/fnq/list"/>'>자주 묻는 질문</a></li>
            <li><a href='<c:url value="/shoeger/member/center/info/list"/>'>안내</a></li>
        </ul>
    </div>
    
    <div class="ppp">
	    <jsp:include page="../${PPPData2.cate }/${PPPData2.service}.jsp"></jsp:include>
    </div>
	