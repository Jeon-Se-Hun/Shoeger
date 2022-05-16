<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="modal fade" data-backdrop="static" data-keyboard="false" id="phoneModal">
	<div class="modal-dialog">
		<div class="modal-content"></div>
	</div>
</div>

<c:forEach end="3" step="1" begin="1" var="i">
	<div class="modal fade" data-backdrop="static" data-keyboard="false" id='terms${i}'>
		<div class="modal-dialog">
			<div class="modal-content"></div>
		</div>
	</div>
</c:forEach>

<div id="wrapper">
	<form action="joinReg" method="post" name="frm">
		<input type="hidden" name="kind" value="개인"> 
		<input type="hidden" name="address1" id="address1"> 
		<input type="hidden" name="birthYear" id="birthYear"> 
		<input type="hidden" name="birthDay" id="birthDay">

		<div id="content">
			<div>
				<h3 class="join_title">
					<label for="id">아이디</label>
				</h3>
				<span class="box"> <input type="text" name="pid" class="int"
					maxlength="12" placeholder="영문으로 시작하는 6~12자의 영문, 숫자 조합" id="pid">
				</span>

				<div id="id_check"></div>

			</div>

			<div>
				<h3 class="join_title">
					<label for="pswd1">비밀번호</label>
				</h3>
				<span class="box"> 
				<input type="password" name="pw" class="int" maxlength="20" placeholder="숫자,영문(대,소문자),특수문자 조합 최소 8자"
					id="pw">
				</span>
				<div id="pw_check"></div>
			</div>

			<div>
				<h3 class="join_title">
					<label for="pswd2">비밀번호 재확인</label>
				</h3>
				<span class="box"> <input type="password" id="pw2" class="int" maxlength="20">
				</span>
				<div id="pw2_check"></div>
			</div>

			<div>
				<h3 class="join_title">
					<label for="name">이름</label>
				</h3>
				<span class="box"> <input type="text" name="pname" class="int" maxlength="4" id="pname">
				</span>
				<div id="name_check"></div>
			</div>

			<div>
				<h3 class="join_title">
					<label for="yy">생년월일</label>
				</h3>

				<div id="bir_wrap">
					<div id="bir_yy">
						<span class="box"> 
						<input type="text" id="year" class="int" maxlength="4" placeholder="년(4자)">
						</span>
					</div>

					<div id="bir_mm">
						<span class="box"> 
						<select id="month" class="sel">
								<option>월</option>
								<option value="01">1</option>
								<option value="02">2</option>
								<option value="03">3</option>
								<option value="04">4</option>
								<option value="05">5</option>
								<option value="06">6</option>
								<option value="07">7</option>
								<option value="08">8</option>
								<option value="09">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
						</select>
						</span>
					</div>

					<div id="bir_dd">
						<span class="box"> <input type="text" id="day" class="int"
							maxlength="2" placeholder="일">
						</span>
					</div>
				</div>
				<div>
					<span id="year_check"></span> <span id="month_check"></span> 
					<span id="day_check"></span>
				</div>
			</div>

			<div>
				<h3 class="join_title">
					<label for="email">이메일</label>
				</h3>
				<span class="box"> <input type="text" name="email"
					class="int" maxlength="100" id="email">
				</span>
				<div id="email_check"></div>
			</div>

			<div>
				<h3 class="join_title">
					<label for="phoneNo">휴대전화(하이폰 포함 13자리)</label>
				</h3>
				<span class="box int_mobile"> 
				<input type="tel" name="phone" class="int" maxlength="13" placeholder="전화번호 입력" id="phone">
				</span>
				<div id="phone_check"></div>
			</div>

			<div class="btn_phone">
				<button type="button" id="sendPhoneNumber" onclick="sendPhone();" disabled="disabled" data-target="#phoneModal">
					<span>휴대폰 인증</span>
				</button>
			</div>

			<h3 class="join_title">
				<label for="address">주소</label>
			</h3>

			<div>
				<input placeholder="우편번호" id="mem_oaddress" type="text"
					readonly="readonly" class="add">
				<button type="button" onclick="execPostCode();" class="add">우편번호
					찾기</button>
			</div>

			<div>
				<input placeholder="도로명 주소" id="mem_address" type="text"
					readonly="readonly" class="add" /> <input placeholder="상세주소"
					id="detailaddress" type="text" class="add" />
			</div>

			<div class="checkbox_group">
				<div>
					<input type="checkbox" id="check_all"> 
					<label for="check_all"><div class="chkBox"></div>전체 동의</label>
				</div>

				<div>
					<input type="checkbox" id="check_1" class="normal"> 
					<label for="check_1"><div class="chkBox"></div>개인정보 처리방침 동의</label> 
					<a class="yy" onclick="terms(this.id);" id="terms1" data-target="#terms1">약관보기</a>
				</div>

				<div>
					<input type="checkbox" id="check_2" class="normal"> 
					<label for="check_2"><div class="chkBox"></div>서비스 이용약관 동의</label> 
					<a class="yy" onclick="terms(this.id);" id="terms2" data-target="#terms2">약관보기</a>
				</div>
				<div>
					<input type="checkbox" id="check_3" class="normal"> 
					<label for="check_3"><div class="chkBox"></div>마케팅 수신 동의</label> 
					<a class="yy" onclick="terms(this.id);" id="terms3" data-target="#terms3">약관보기</a>
				</div>
			</div>

			<div class="btn_area">
				<button type="button" id="btnJoin">
					<span>가입하기</span>
				</button>
			</div>

		</div>
	</form>
</div>
