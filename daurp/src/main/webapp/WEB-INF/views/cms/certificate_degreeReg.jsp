<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div>
    <form>
        <div>
            <select name="subject_code" id="subject_code">
                <option value="" selected>선택</option>
                <option value="스마트팩토리 운영관리사 1급">스마트팩토리 운영관리사 1급</option>
                <option value="스마트팩토리 운영관리사 2급">스마트팩토리 운영관리사 2급</option>
            </select>
        </div>
        <div>
            <label for="certificate_degreeNm">회차명</label>
            <input type="text" id="certificate_degreeNm" name="certificate_degreeNm">
        </div>
        <div>
            <label for="cer_location">시험장소</label>
            <input type="text" name="cer_location" id="cer_location">
        </div>
        <div>
            <label for="certificate_date">시험일</label>
            <input type="date" name="certificate_date" id="certificate_date">
        </div>
        <div>
            <label for="receipt_date">접수종료일</label>
            <input type="datetime-local" name="receipt_date" id="receipt_date">
        </div>
        <div>
            <button type="submit">등록</button>
            <button>닫기</button>
        </div>
    </form>
</div>