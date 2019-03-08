<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form>
    <table>
        <tr>
            <td>
                <label for="name">성명</label>
                <input type="text" name="name" id="name" readonly>
            </td>
        </tr>
        <tr>
            <td>
                <label for="tel">연락처</label>
                <input type="text" name="tel" id="tel" readonly>
            </td>
        </tr>
        <tr>
            <td>
                <label for="birth">생년월일</label>
                <input type="text" name="birth" id="birth" readonly>
            </td>
        </tr>
        <tr>
            <td align="center">
                <label for="lectureName"></label>
                <input type="text" name="lectureName" id="lectureName" readonly>
            </td>
        </tr>
    </table>
</form>