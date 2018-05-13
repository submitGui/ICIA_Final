<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경매 입찰</title>
<script type="text/javascript">
    function cal(num){
    	
    	myform.member_point.value = Number(myform.member_point.value)+Number(num);
    }
 
    function answer(){
        try{
            myform.member_point.value = eval(document.myform.member_point.value);
        }catch(e){alert('오류')}
    }
 
    function clearcal(){
        myform.member_point.value = "";
    }
</script>

<script type="text/javascript">
function pointch(){
    var price = ${param.price};//최대금액
    var member_point = document.getElementById("member_point").value;//입찰금
	var pt = ${param.member_point};//현재 최대 입찰금.
	var mypoint = ${param.mypoint}; //내가 가진 포인트
    if(member_point > price) {
       alert('최대 금액보다 입찰 금액이 큽니다');
       return false;
    }
    else if(member_point <= pt){
    	alert('현재 입찰가보다 입찰 금액이 같거나 낮습니다.');
    	return false;
    }
    else if(mypoint<member_point){
    	alert('포인트가 부족합니다')
    	return false;
    }
    else{
    	alert('입찰이 완료되었습니다. 입찰하신 금액은 '+member_point+'입니다.');
    	// 데이터 전송
    	opener.name = "myform";
    	
    	price.target = opener.name;
    	member_point.target = opener.name;
    	pt.target = opener.name;
    	mypoint.target = opener.name;
    	
    	price.submit();
    	member_point.submit();
    	pt.submit();
    	mypoint.submit();
    	
    	self.close();
    }
  }
</script>
<style type="text/css">

  .btn{font-weight:bold; font-size:9pt; background-color:white; padding-top:3px;width:40}
</style>
</head>
<body>
<form action="/shop/product/insertAuction.do" method="post" name="myform">
<table border="0" bgcolor="#eeeeee" cellspacing="10"
style="border-width:1px; border-color:black; border-style:solid;" align="center">
    <tr>
    <td height="0" bgcolor="#D8C3C2">
    <input type="hidden" name="product_id" value="${param.product_id}">
 	   최대 금액 :  ${param.price} <br>
 	   현재 입찰가 :${param.member_point}<br> 
 	   내 포인트 :  ${param.mypoint}
    <td><input type="hidden" name="userid" id="userid" value="${userid}"><td>
    <input type="text" name="member_point" size="25" id="member_point"> 
    <input type="submit" value="입찰" onclick="return pointch()">
    </td>
    </tr>
    <tr>
    <td>

    <input type="button" value=" 10만원 " onclick="cal(100000)" class="btn">
    <input type="button" value=" 20만원 " onclick="cal(200000)" class="btn">
    <input type="button" value=" 50만원 " onclick="cal(500000)" class="btn">
    <input type="button" value=" 100만원 " onclick="cal(1000000)" class="btn">
    <input type="button" value=" 200만원 " onclick="cal(2000000)" class="btn">
    
    <input type="button" value=" C " onclick="clearcal()" class="btn">

    </td>
    </tr>
</table>
</form>
 
</body>
</html>