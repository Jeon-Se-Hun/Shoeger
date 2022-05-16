<%@page import="javax.swing.text.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<h3 class="signboard">안내</h3>

	<h1>${bDTO.title }</h1>
   
    <form action="" name="frm">
        <input type="hidden" name="page" id="pageIN" value="${data.pdto.page }" />
        <input type="hidden" name="id" id="detailId" />
        <input type="hidden" name="sch" id="sch" value="${param.sch}"/>
       <input type="hidden" name="kind" id="kind" value="${param.kind}"/>

		<div class="total">

			<div align="center">
				<hr style="height: 3px; border:none; background-color: #505050;">
			</div>

			<c:forEach items="${data.bbs }" var="bDTO" varStatus="no">
				<div class="list">
					<%--  <td>${data.pdto.start+no.index }</td> --%>
					<div class="title">
						<a href="detail?id=${bDTO.id }&page=${data.pdto.page}&sch=${param.sch}&kind=${param.kind}">${bDTO.title}</a>
					</div>
					<div class="writer">${bDTO.pid }</div>
					<div class="date"><fmt:formatDate value="${bDTO.reg_date }"  pattern="yyyy-MM-dd" /> </div>
					<div class="viewcnt">${bDTO.cnt }</div>
				</div>
			</c:forEach>

			<div style="height: 15px;">
				<div></div>
			</div>

			<div>
				<div align="center">
					<c:if test="${data.pdto.startPage > 1 }">
						<input type="button" class="btn" dd="${data.pdto.startPage-1 }" value="◀" />
					</c:if>
					<c:forEach begin="${data.pdto.startPage }" end="${data.pdto.endPage }" step="1" var="i">
						<c:choose>
							<c:when test="${i == pDTO.page }">
                                [${i }]
                            </c:when>

							<c:otherwise>
								<input type="button" class="btn" dd="${i }" value="${i }" />
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:if test="${data.pdto.endPage < data.pdto.total }">

						<input type="button" class="btn" dd="${data.pdto.endPage+1 }" value="▶" />
					</c:if>
				</div>
				
			</div>

			<div class="seaech">
				<div align="right">

					<select id="kind1">
						<option value="title"
							<c:if test="${data.bdto.kind=='title'}">selected="selected"</c:if>>제목</option>
						<option value="pid"
							<c:if test="${data.bdto.kind=='pid'}">selected="selected"</c:if>>작성자</option>
					</select> 
					
					<input type="text" id="sch1" placeholder="검색어를 입력하세요" value="${data.bdto.sch }" />
					<input type="button" value="검색" id="schBtn" />

				</div>
			</div>

		</div>
	</form>