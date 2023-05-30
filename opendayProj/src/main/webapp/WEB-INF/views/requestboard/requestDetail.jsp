<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
    let participateCount = 0;
    
    function participate() {
        if (participateCount === 0) {
            participateCount++;
            document.getElementById("participationButton").textContent = "참여("+participateCount+")";
        }
    }
</script>

<style>
    * {
        padding: 0;
        margin: 0;
    }
    
    #wrap {
        width: 1280px;
    }
    
    h1 {
        font-family: Gothic;
        font-size: 24px;
        color: #5A2ECE;
    }

    table {
        width: 50%;
        margin: 0 auto;
    }

    th {
        text-align: left;
        vertical-align: top;
        font-weight: normal;
        font-size: 14px;
        color: #D9D9D9;
    }

    td {
        vertical-align: top;
    }

    label {
        display: block;
        font-weight: normal;
        font-size: 14px;
        color: #D9D9D9;
        margin-bottom: 5px;
    }

    input[type="text"] {
        width: 100%;
        padding: 5px;
        font-size: 14px;
        border: 1px solid #D9D9D9;
    }
    
    textarea {
        width: 100%;
        height: 300px;
        padding: 5px;
        font-size: 14px;
        border: 1px solid #D9D9D9;
    }
    
    .main-con {
        width: 1000px;
        margin: 0 auto;
    }
    
    .form-container {
        display: flex;
        justify-content: flex-end;       
    }
    
    .submit-button {
        width: 105px;
    }
    
    .participation-button {
    	width: 60px; 
    }
    
    input[type="submit"] {
        background-color: #5A2ECE;
        color: white;
        font-size: 14px;
        padding: 5px 15px;
        border-radius: 5px;
        border: none;
        cursor: pointer;
    }
    
    Button[type="button"] {
    	background-color: white;
    	color: #FF99B8;
    	font-size: 14px;
    	padding: 5px 15px;
    	border-radius: 5px;
    	border: 1px solid #FF99B8;
    }
    
    .buttons {
    	display: flex;
    	width: 435px;
    	margin: 0 auto;
    	flex-direction: row-reverse;
    	justify-content: space-between;
    	position: relative;  
    	left :45px;
    }
    
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function() {
	if('\${partpaYN}'==1) {
		$("#participationBtn").css('backgroundColor','red');
	} else {
		$("#participationBtn").css('backgroundColor','');
	}
	
	$("#modifyBtn").click(function(e){
		e.preventDefault();
		$.ajax({
			url:"modrequest",
			method:"POST",
			async:true,
			data:{
				reqId:$("#reqId").val(),
				reqLocation:$("#reqLocation").val(),
				reqTitle:$("#reqTitle").val(),
				reqContent:$("#reqContent").val()
			},
			success:function(result) {
				alert(result.responseText);
			},
			error:function(result) {
				alert(result.responseText);
			}
		})
	});
	
	$("#deleteBtn").click(function(e){
		var frm=$(document.forms[0]);
		frm.attr("action", "delrequest");	
		frm.attr("method", "GET");
		frm.submit();
		
	});
	
	$("#participationBtn").click(function(e) {
		$.ajax({
			url:'participation',
			method:'POST',
			async:true,
			data:{reqId:$("#reqId").val()},
			success:function(result) {
				if(result==="true") {	
					$("#participationCnt").text(+$("#participationCnt").text()+1);
					$("#participationBtn").css('backgroundColor','#FF99B8');
					$("#participationBtn").css('color','white');
				} else {
					$("#participationCnt").text(+$("#participationCnt").text()-1);
					$("#participationBtn").css('backgroundColor','white');
					$("#participationBtn").css('color','#FF99B8');
				}
			},
			error:function(result) {
				
			}
		})
	})
})
</script>
</head>
<body>
    <div id="wrap">
    
    <form method="get">
    <div class="main-con">
    <h1 >클래스 개설 요청</h1>&nbsp;&nbsp;
    <input type="hidden" id="reqId" name="reqId" value="${request.reqId }"/>
        <table>
            <tr>
                <td>위치</td>
                <td><input name="reqLocation" type="text" id="reqLocation" value="${request.reqLocation }"/></td>
            </tr>
            <tr>
                <td>제목</td>
                <td><input name="reqTitle" type="text" id="reqTitle" value="${request.reqTitle }"/></td>
            </tr>
            <tr>
                <td>내용</td>
                <td><textarea name="reqContent" id="reqContent">${request.reqContent }</textarea></td>
            </tr>            
        </table>
        &nbsp;&nbsp;
        <div class="buttons">
        	<c:choose>
        		<c:when test="${user.authority eq '2'}">
	        		<div class="form-container">
        	    	<input type="submit" onclick="window.location.href='/createclass'" value="클래스 개설" class="submit-button"/>
        			</div>
        		</c:when>
        		<c:otherwise>
        			<c:if test="${user.userId eq request.userId }">
	        		<div class="form-container">
     	       		<input type="submit" id="modifyBtn" value="수정" class="submit-button" style="margin-right: 10px;">
        	   		<input type="submit" id="deleteBtn" value="삭제" class="submit-button"/></div>
        	   		</c:if>        		
        		</c:otherwise>
        	</c:choose>
        	<div class="participation-button">
        		<button type="button" id="participationBtn" >참여<span id="participationCnt">${partpaCnt }</span></button>
        	</div>
        </div>
    </div>
    </form>
    </div>
</body>
</html>