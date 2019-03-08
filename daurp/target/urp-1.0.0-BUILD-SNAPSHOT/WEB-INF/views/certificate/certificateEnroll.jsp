<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String cer_num = request.getParameter("cer_num");
%>
<script type="text/javascript">
    var checkval = 0;
    var telPattern = /^\d{3}\d{3,4}\d{4}$/;
    var fileChk = new Array(".jpg",".gif",".png",".jpeg");

    $(document).ready(function () {
        console.log('document ready:');
        $('input[type="text"], input[type="date"], select').val('');
    });

    function submitAction() {
        var mailPattetn = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
        var imageFile = $('#Image').val();
        var imgChk = false;

        if($('#Name').val() == ''){
                alert('성명을 입력해 주시기 바랍니다.');
                return false;
            }if($('#Image').val() == ''){
                alert('사진을 첨부해 주시기 바랍니다.');
                return false;
            }if($('#Tel').val() == ''){
                alert('휴대폰 앞자리를 입력해 주시기 바랍니다.');
                return false;
            } if($('#Birth').val() == ''){
                alert('생년월일을 입력해 주시기 바랍니다.');
                return false;
            }if($('#zipNo').val() == ''){
                alert('도로명 주소를 입력해 주시기 바랍니다.');
                return false;
            }if($('#roadAddrPart1').val() == ''){
                alert('주소를 입력해 주시기 바랍니다.');
                return false;
            }if($('#addrDetail').val() == ''){
                alert('상세주소를 입력해 주시기 바랍니다.');
                return false;
            }if($('#Email').val() == ''){
                alert('이메일을 입력해 주시기 바랍니다.');
                return false;
            }if($('#Spec').val() == ''){
                alert('최종합력을 입력해 주시기 바랍니다.');
                return false;
            }if($('#College').val() == ''){
                alert('학교명을 입력해 주시기 바랍니다.');
                return false;
            }if($('#Major').val() == ''){
                alert('전공을 입력해 주시기 바랍니다.');
                return false;
            } if(!mailPattetn.test($('#Email').val())){
                alert("메일주소를 정확하게 입력해 주시기 바랍니다.");
                return false;
            } if (checkval == 0) {
                alert('신청정보 중복체크를 해주시기 바랍니다.');
                return false;
            } else if(checkval == 1){
                alert('이미 등록된 정보입니다.')
                return false;
            } else if(checkval == 2){
                alert('휴대폰 형식에 맞지 않습니다.(특수문자 및 문자 미포함, 휴대폰 11자리)');
                return false;
            } else if(checkval == 3){
                alert('연락처를 입력해 주시기 바랍니다.');
                return false;
            }

            while(imageFile.indexOf("/") != -1)
                imageFile = imageFile.substring(imageFile.indexOf("/") + 1);
                ext = imageFile.substring(imageFile.indexOf(".")).toLowerCase();

                for(var i = 0; i< fileChk.length; i++){
                    if(fileChk[i] == ext){
                        imgChk = true;
                        break;
                    }
                } if(imgChk == false) {
                    alert("이미지 파일(img, gif, png)만 업로드가 가능합니다.");
                    return false;
                }
       }
    /*주소찾기 script*/
    function goPopup(){
        // 주소검색을 수행할 팝업 페이지를 호출합니다.
        // 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
        var pop = window.open("${pageContext.request.contextPath}/jusoapi/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes");

    }
    function jusoCallBack(roadAddrPart1, addrDetail, zipNo){
        // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
        $('#roadAddrPart1').val(roadAddrPart1);
        $('#addrDetail').val(addrDetail);
        $('#zipNo').val(zipNo);
    }
    function check() {
        jQuery.ajaxSettings.traditional = true;

        checklist = $('#Tel').val();

        $.ajax({
            type: "POST",
            url: '${pageContext.request.contextPath}/certificate/certificateEnroll/check',
            data: {
                cerParam : checklist
            },
            success: function (result){
                console.log("result : " + result.cnt);
                console.log("checkval" + checkval);
                if(result.cnt > 0){
                    // $('#membercheck').html('<b style="font-size:14px; color:red">이미 등록된 정보입니다.</b>');
                    // checkval = 0;
                    checkval = 1;
                }  else {
                    if(!telPattern.test($('#Tel').val())){
                        // $('#membercheck').html('<b style="font-size:14px; color:red">휴대폰 형식에 맞지 않습니다.</b>');
                        // console.log("형식에 안맞음");
                        // checkval = 0;
                        checkval = 2;
                    } else {
                        // $('#membercheck').html('<b style="font-size:14px; color:blue">사용가능합니다.</b>');
                        // console.log("형식에 맞음");
                        // checkval = 1
                        checkval = 4;
                    }
                }
            },
            error : function (xhr, stat, error) {
                // $('#membercheck').html('<b style="font-size:14px; color:red">연락처를 입력해 주세요.</b>');
                // return false;
                checkval = 3;
            }
        });
    }
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                $('#zipNo').val(data.zonecode);
                $('#roadAddrPart1').val(roadAddr);

            }
        }).open();
    }
</script>
<form action="${pageContext.request.contextPath}/certificate/certificateEnroll/add/" onsubmit="return submitAction()"
      method="post" enctype="multipart/form-data">
    <input type="hidden" id="lectureName" name="lectureName" value="${result}">
    <div>
        <label for="Name">성명</label>
        <input type="text" name="NAME" id="Name" value=""/>
    </div>
    <div>
        <label for="image">사진등록</label>
        <input type="file" name="IMAGE" id="Image" accept=".gif, .jpg, .png">
    </div>
    <div>
        <label for="Tel">연락처</label>
        <input type="text" name="TEL" id="Tel" title="전화번호 첫 번째 자리" onkeyup="check()"/>
    </div>
    <%--<div>--%>
        <%--<span id="membercheck"></span>--%>
    <%--</div>--%>
    <div>
        <label for = "Email">이메일</label>
        <input type="text" name="EMAIL" id="Email">
    </div>
    <div>
        <label for="Birth">생년월일</label>
        <input type="date" name="BIRTH" id="Birth"/>
    </div>
    <div>
        <label for="zipNo">주소</label>
        <input type="text" name="ZIPCODE" size="15" id="zipNo" title="우편번호" readonly/>
        <button type="button" onclick="execDaumPostcode()">주소찾기</button>
        <div>
            <input type="text" name="ADDRESS1" id="roadAddrPart1" title="주소" readonly/>
            <input type="text" name="ADDRESS2" id="addrDetail" title="상세 주소"/>
        </div>
    </div>
    <div>
        <label for = "Spec">최종학력</label>
        <select name="SPEC" id="Spec">
            <option value="" selected>선택</option>
            <option value="중졸">중졸</option>
            <option value="고졸">고졸</option>
            <option value="대학재학중">대학재학중</option>
            <option value="대졸">대졸</option>
        </select>
    </div>
    <div>
        <label for="College">학교/전공</label>
        <input type="text" name="COLLEGE" id="College" title="학교">학교<input type="text" name="MAJOR" id="Major" title="전공학과">과
    </div>
    <div>
        <label for="EnterpriseName">기업명</label>
        <input type="text" name="ENTERPRISENAME" id="EnterpriseName">
        <label for="EnterpriseWork">담당업무</label>
        <input type="text" name="ENTERPRISEWORK" id="EnterpriseWork">
    </div>
    <div>
        <button type="submit">교육 신청</button>
        <button>취소</button>
    </div>
</form>