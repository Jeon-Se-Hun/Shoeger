<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
   $(function(){
      $("#propose").click(function(){
         
         
         var file1 = $("#file1").val()
         var file2 = $("#file2").val()
         var file3 = $("#file3").val()
         
         if(file1 == "" || file2 == "" || file3 == ""){
            alert("모든이미지를 추가해주세요")
         }else{
            frm.submit();                     
         }
         
      })
      

      
         
      $(".inGo").click(function(){
         frm1.action = "orderDeReg"
         frm1.submit()
      })
      
      $("#can").click(function(){
         $("#state").val("취소")
         $("#kind").val("${mainData.ooDTO.kind}")
         frm1.action = "orderDeReg"
         frm1.submit()
      })
      
      
      $("#back").click(function(){
         $("#state").val("${param.state}")
         frm1.action = $("#service").val()
         frm1.submit();
      })
      
      
      
   })
   
   function readURL1(input) {
         if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
               $('#blah1').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
         }
   }
   
   function readURL2(input) {
        if (input.files && input.files[0]) {
           var reader = new FileReader();
           reader.onload = function(e) {
              $('#blah2').attr('src', e.target.result);
           }
           reader.readAsDataURL(input.files[0]);
        }
   }
   
   function readURL3(input) {
        if (input.files && input.files[0]) {
           var reader = new FileReader();
           reader.onload = function(e) {
              $('#blah3').attr('src', e.target.result);
           }
           reader.readAsDataURL(input.files[0]);
        }
   }
      
</script>

<form action="" id= "frm1">
<input type="hidden" name="page" value="${param.page }" />
<input type="hidden" name="tradeid" value="${param.tradeid }" />
<input type="hidden" id="kind" name="kind" value="${param.kind }" />
<input type="hidden" name="sdateStr" value="${param.sdateStr }" />
<input type="hidden" name="edateStr" value="${param.edateStr }" />
<input type="hidden" name="skind" value="${param.skind }" />
<input type="hidden" name="sch" value="${param.sch }" />
<input type="hidden" name="service" id="service" value="${param.service }" />
<div id="table1">
   <c:if test="${mainData.ooDTO.kind == '매입' }">
      <h3>검수 상태</h3>
   </c:if>
   <c:if test="${mainData.ooDTO.kind == '매출' }">
      <h3>거래 정보</h3>
   </c:if>
   <c:if test="${mainData.ooDTO.kind == '취소' }">
      <h3>취소 정보</h3>
   </c:if>
   
   <h4>상품 정보</h4>
   <div class="ootitle">
      <div>종류</div>
      <div>거래번호</div>
      <div>상품명</div>
      <div>상품가격</div>
      <div>포인트</div>   
      <div>주문 상태</div>   
   </div>
   <div>
      <div>${mainData.ooDTO.kind }</div>
      <div>${mainData.ooDTO.tradeid }</div>
      <div>${mainData.ooDTO.model }</div>
      <div>${mainData.ooDTO.price }</div>
      <div>${mainData.ooDTO.pointuse }</div>
      <div>
         <c:if test="${mainData.ooDTO.kind == '매입' }">
            <c:choose>
               <c:when test="${mainData.ooDTO.state == '완료' or mainData.ooDTO.state == '취소' }">
                  <input type="text" id="state" value="검수${mainData.ooDTO.state }" readonly="readonly"/>
               </c:when>
               <c:when test="${mainData.ooDTO.state == '검수중'}">
                  <input type="text" id="state" name="state" value="${mainData.ooDTO.state }" readonly="readonly"/>
               </c:when>
               <c:otherwise>
                  <select class="state" name="state" id="state">
                     <option value="미수령" <c:if test="${mainData.ooDTO.state == '미수령' }">selected="selected"</c:if>>미수령</option>
                     <option value="수령" <c:if test="${mainData.ooDTO.state == '수령' }">selected="selected"</c:if>>수령</option>
                     <option value="검수중" <c:if test="${mainData.ooDTO.state == '검수중' }">selected="selected"</c:if>>검수중</option>
                  </select>
                  <input type="button" class="inGo" value="적용">
               </c:otherwise>
            </c:choose>
         </c:if>
         <c:if test="${mainData.ooDTO.kind == '매출' }">
            <c:choose>
               <c:when test="${mainData.ooDTO.state == '완료'}">
                  <input type="text" id="state" value="배송${mainData.ooDTO.state }" readonly="readonly"/>
               </c:when>
               <c:otherwise>
                  <select class="state" name="state" id="state">
                     <option value="주문접수" <c:if test="${mainData.ooDTO.state == '주문접수' }">selected="selected"</c:if>>주문접수</option>
                     <option value="배송준비중" <c:if test="${mainData.ooDTO.state == '배송준비중' }">selected="selected"</c:if>>배송준비중</option>      
                     <option value="완료" <c:if test="${mainData.ooDTO.state == '완료' }">selected="selected"</c:if>>배송완료</option>      
                  </select>
                  <input type="button" class="inGo" value="적용">
               </c:otherwise>
            </c:choose>
         </c:if>
         <c:if test="${mainData.ooDTO.kind == '취소' }">
            <c:choose>
               <c:when test="${mainData.ooDTO.state == '완료'}">
                  <input type="text" id="state" value="취소${mainData.ooDTO.state }" readonly="readonly"/>
               </c:when>
               <c:otherwise>
                  <select class="state" name="state" id="state">
                     <option value="취소요청" <c:if test="${mainData.ooDTO.state == '취소요청' }">selected="selected"</c:if>>취소요청</option>      
                     <option value="완료" <c:if test="${mainData.ooDTO.state == '완료' }">selected="selected"</c:if>>취소완료</option>      
                  </select>
                  <input type="button" class="inGo" value="적용">
               </c:otherwise>
            </c:choose>
         </c:if>
         <c:if test="${mainData.ooDTO.kind == '환불' }">
            <c:choose>
               <c:when test="${mainData.ooDTO.state == '완료'}">
                  <input type="text" id="state" value="환불${mainData.ooDTO.state }" readonly="readonly"/>
               </c:when>
               <c:otherwise>
                  <select class="state" name="state" id="state">
                     <option value="취소요청" <c:if test="${mainData.ooDTO.state == '환불요청' }">selected="selected"</c:if>>환불요청</option>      
                     <option value="완료" <c:if test="${mainData.ooDTO.state == '완료' }">selected="selected"</c:if>>환불완료</option>      
                  </select>
                  <input type="button" class="inGo" value="적용">
               </c:otherwise>
            </c:choose>
         </c:if>
      </div>
   </div>
    
</div>
 </form>
<div id="table2">
   <h4>주문자 정보</h4>
   <div>
      <div>이름</div>
      <div>${mainData.ccDTO.pname }</div>
      <div>전화번호</div>
      <div>${mainData.ccDTO.phone }</div>
      <div>이메일</div>
      <div>${mainData.ccDTO.email }</div>
      <div>주소</div>
      <div>${mainData.ccDTO.maddress }</div>
   </div>
   
   <c:if test="${mainData.ooDTO.kind != '매입' or (mainData.ooDTO.kind == '매입' and (mainData.ooDTO.state != '검수중' and  mainData.ooDTO.state != '완료') )}">
   
      <input type="button" value="목록" id="back"/>
   </c:if>
   
</div>

<c:if test="${mainData.ooDTO.kind == '매입' and (mainData.ooDTO.state == '검수중' or  mainData.ooDTO.state == '완료' )}">

<form action="orderProReg" method="post" enctype="Multipart/form-data" id="frm">

<input type="hidden" name="pid" value="${mainData.ccDTO.pid }"/>
<input type="hidden" name="psize" value="${mainData.ooDTO.psize }"/>
<input type="hidden" name="model" value="${mainData.ooDTO.model }"/>
<input type="hidden" name="point" value="${mainData.ooDTO.pointuse }"/>
<input type="hidden" name="tradeid" value="${param.tradeid }" />


 <input type="hidden" name="page" value="${param.page }" />
<input type="hidden" name="kind" value="${param.kind }" />
<input type="hidden" name="sdateStr" value="${param.sdateStr }" />
<input type="hidden" name="edateStr" value="${param.edateStr }" />
<input type="hidden" name="skind" value="${param.skind }" />
<input type="hidden" name="sch" value="${param.sch }" />
<input type="hidden" name="service" id="service" value="${param.service }" />

   <div id = table3>
      <h4>검수 현황</h4>
      <c:choose>
         <c:when test="${(mainData.ooDTO.content == null or mainData.ooDTO.content == '') and mainData.ooDTO.state == '검수중' }">
            <div class="inspection">
               <div class ="category">
                  <div>등급제시</div>
                  <div>이미지 1</div>
                  <div>이미지 2</div>
                  <div>이미지 3</div>
               </div>
               <div class ="Detail">
                  <div>
                     <select name="grade">
                        <option value="S" <c:if test="${mainData.ooDTO.content == 'S' }">selected="selected"</c:if>>S (원가의 80%)</option>
                        <option value="A" <c:if test="${mainData.ooDTO.content == 'A' }">selected="selected"</c:if>>A (원가의 70%)</option>            
                        <option value="B" <c:if test="${mainData.ooDTO.content == 'B' }">selected="selected"</c:if>>B (원가의 60%)</option>            
                     </select>
                  </div>
                  <div><img id="blah1"/></div>
                  <div><img id="blah2"/></div>
                  <div><img id="blah3"/></div>
               </div>
               
               <div class="upfileButton">
                  <input type="file" id="file1" name="file1" value="" onchange="readURL1(this);" accept="image/gif, image/jpeg, image/png"/>
                  <input type="file" id="file2" name="file2" value="" onchange="readURL2(this);" accept="image/gif, image/jpeg, image/png"/>
                  <input type="file" id="file3" name="file3" value="" onchange="readURL3(this);" accept="image/gif, image/jpeg, image/png"/>
               </div>
            </div>
            <input type="button" id="propose" value="검수완료" />
            <input type="button" id="can" value="검수취소" />
            <input type="button" value="목록" id="back"/>
         </c:when>
         <c:otherwise>
            <div class="inspection">
               <div class ="category">
                  <div>등급</div>
                  <div>이미지1</div>
                  <div>이미지2</div>
                  <div>이미지3</div>
               </div>
               
               <div class ="Detail">
                  <div>${mainData.ssDTO.grade }</div>
                  <div><img src="<c:url value="/resources/up/used/${mainData.ssDTO.img1 }"/>"></div>
                  <div><img src="<c:url value="/resources/up/used/${mainData.ssDTO.img2 }"/>"></div>
                  <div><img src="<c:url value="/resources/up/used/${mainData.ssDTO.img3 }"/>"></div>
               </div>
            </div>
            <input type="button" value="목록" id="back"/>
         </c:otherwise>
      </c:choose>
   </div>

</form>
</c:if>