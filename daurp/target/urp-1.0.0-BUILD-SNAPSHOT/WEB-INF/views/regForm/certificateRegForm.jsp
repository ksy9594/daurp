<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script type="text/javascript">
    $(document).ready(function () {
        $('input[type="checkbox"]').prop('checked', false);
    });

    function chk() {
        var privacyReq = $('input:checkbox[id="privacyReq"]:checked').val();
        var thirdPartyReq = $('input:checkbox[id="thirdPartyReq"]:checked').val();

        console.log("REQ1------------------------"+privacyReq);
        console.log("REQ2------------------------"+thirdPartyReq);

        if(privacyReq != 'on' || thirdPartyReq != 'on'){
            alert("개인정보 수집 이용에 동의하셔야 합니다.");
            return false;
        } else {
        }
    }
</script>

<div>
    <form action="${pageContext.request.contextPath} /certificate/certificateEnroll" onsubmit="return chk()" method="post">
        <table width = "1400" height="650">
            <tr>
                <td width="60%" align="center">
                    <hr><br>
                    <p align="left">
                        <b>개인정보 수집 및 이용 동의</b>
                    </p>
                    <br>
                    <textarea rows="20" cols="150" readonly>동아대학교 산학연연구단지조성사업단에서는 스마트팩토리 운영관리사 자격시험과 관련하여
    귀하의 개인정보를 아래와 같이 수집 · 이용 · 제3자 제공을 하고자 합니다.
    다음의 사항에 대해 충분히 읽어보신 후 동의 여부를 체크, 서명하여 주시기 바랍니다.

    수집·이용하려는 개인정보의 항목 : 성명, 연락처, 생년월일, 주소, 이메일, 최종학력, 학교/전공, 기업명/담당업무
    개인정보의 수집·이용 목적 :  본인식별절차 및 운영관리사 자격시험
    개인정보 이용기간 및 보유기간 : 교육 신청일로부터 약 5개월 간

    ※ 귀하께서는 개인정보 제공 및 활용에 거부할 권리가 있습니다.
    ☞ 거부에 따른 불이익 : 위 제공사항은 동아대학교 산학연연구단지조성사업단에서 관리하는
    스마트팩토리 운영관리사 자격시험에 반드시 필요한 사항으로
    거부하실 경우 양성과정 신청이 불가함을 알려드립니다.
                    </textarea>
                    <p>
                        <input type="checkbox" id="privacyReq"> <label for="privacyReq">개인정보 수집 및 이용에 동의합니다.</label>
                    </p>
                </td>
            </tr>
            <tr>
                <td width="60%" align="center">
                    <hr>
                    <p align="left">
                        <b>개인정보의 제3자 제공 동의 </b>
                    </p>
                    <textarea rows="20" cols="150" readonly>개인정보를 제공받는자 : 동아대학교 산학연연구단지조성사업단
    제공하는 개인정보의 항목 : 성명, 연락처, 생년월일, 주소, 이메일, 최종학력, 학교/전공, 기업명/담당업무
    개인정보를 제공받는 자의 개인정보 이용목적 : 스마트 팩토리 운영관리사 자격시험

    ※ 귀하께서는 개인정보 제공 및 활용에 거부할 권리가 있습니다.
    ☞ 거부에 따른 불이익 : 위 제공사항은 동아대학교 산학연연구단지조성사업단에서 관리하는 스마트 팩토리 운영관리사
    자격시험에 반드시 필요한 사항으로 거부하실 경우 양성과정 신청이 불가함을 알려드립니다.
                    </textarea>
                    <p>
                        <input type="checkbox" id="thirdPartyReq">
                        <label for="thirdPartyReq">본인은 본 『개인정보의 수집 · 이용 · 제3자 제공 동의서』 내용을 읽고 명확히 이해하였으며, 이에 동의합니다.</label>
                    </p>
                    <hr>
                </td>
            </tr>
            <tr>
                <td align="center" valign="top">
                    <button type="submit">동의</button>
                </td>
            </tr>
        </table>
    </form>
</div>