<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div>
    <p>성명 :      ${student.LEC_NAME}</p>
    <p>생년월일 :  ${student.LEC_BIRTHDAY}</p>
    <p>${student.LEC_RECEIPTDATE}에 동아대학교 산학연구단지조성사업단의 ${student.lecture_name}에
        신청하였음을 확인합니다.</p>
    <p>${student.LEC_RECEIPTDATE}</p>
</div>
