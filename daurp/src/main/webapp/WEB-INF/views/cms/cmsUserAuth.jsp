<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="pull-right">
    <div class="btn-group">
        <button id="btnAddRow" type="button" class="btn btn-default btn-ssm" onclick="addUserRow()" disabled> 행추가</button>
        <button id="btnDelRow" type="button" class="btn btn-default btn-ssm" onclick="delUserRow()" disabled>행삭제</button>
        <button type="button" id = "SelSaveRow" class="btn btn-default btn-ssm" onclick="saveUserRow()" disabled>저장</button>
        <button type="button" id= "SelDelRow" name = "SelDelRow" class="btn btn-default btn-ssm" disabled>삭제</button>
    </div>
</div>
<div class="row">
    <div class="col-md-4">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <span class="title">권한 목록</span>
            </div>
            <table class="table-bordered table-hover text-left">
                <thead>
                    <th></th>
                    <th>권한명</th>
                    <th>설명</th>
                </thead>
                <tbody id="grdAuthList">

                </tbody>
            </table>
        </div>
    </div>
    <div class="col-md-8">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <span class="title">사용자 목록</span>
            </div>
            <table class="table-bordered table-hover text-left">
                <thead>
                    <th></th>
                    <th>
                        <input type="checkbox" id="totalUserCol">
                    </th>
                    <th>ID</th>
                    <th>PW</th>
                    <th>성명</th>
                    <th>이메일</th>
                    <th>사용여부</th>
                    <th>수정일</th>
                </thead>
                <tbody id="grdUserAuth">

                </tbody>
            </table>
        </div>
    </div>
    <div id="debug"></div>
</div>

<script type="text/javascript">
    var authListIndex = 1;
    var userAuthIndex = 1;
    var authCode;

    function searchAuthList() {
        $.ajax({
            url: '${pageContext.request.contextPath} /cms/cmsAuthList/select',
            data: {},
            success: function (data) {
                console.log(data);

                $('#grdAuthList').html('');

                for (var i = 0; i < data.length; i++) {
                    var row = '';
                    row += '<tr onclick="userList(\'' + data[i].AUTH_CODE + '\');">\n';
                    row += '<td>' + (i + 1) + '</td>\n';
                    row += '<td>' + data[i].AUTH_NAME + '</td>\n';
                    row += '<td>' + data[i].AUTH_COMMENT + '</td>\n';
                    row += '</tr>';

                    $('#grdAuthList').append(row);
                    authListIndex = data.length + 1;
                }
            },
            error: function (xhr, stat, err) {
                console.error(err);
            }
        });
    }
    function userList(code) {
        authCode = code;

        $("#btnAddRow").prop("disabled", false);
        $("#btnDelRow").prop("disabled", false);
        $("#SelSaveRow").prop("disabled", false);
        $("#SelDelRow").prop("disabled", false);

        $.ajax({
            url : '${pageContext.request.contextPath} /cms/cmsUserAuth/select',
            data : {
                authCode : authCode
            },
            success : function (data) {
                console.log("Code :    "+ code);
                $('#grdUserAuth').html('');

                for(var i=0; i < data.length; i++){
                    var row = '';
                    row += '<tr>\n';
                    row += '<td>'+(i+1)+'</td>\n';
                    row += '<td><input type="checkbox" name="colUserSelected"></td>\n';
                    row += '<td><input type="text" id="userId" name="userId" value="'+data[i].USER_ID+'"></td>\n';
                    row += '<td><input type="password" id="userPw" name="userPw" value="'+data[i].USER_PW+'"></td>\n';
                    row += '<td><input type="text" id="userNm" name="userNm" value="'+data[i].USER_NAME+'"></td>\n';
                    row += '<td><input type="text" id="userEmail" name="userEmail" value="'+data[i].USER_EMAIL+'"></td>\n';
                    row += '<td>\n';
                    row += '<select id="enabled" name="enabled">\n';
                    row += '<option value="0" data[i].enbled ? selected : "">미사용</option>';
                    row += '<option value="1" data[i].enbled ? selected : "">사용</option>';
                    row += '</select>';
                    row += '</td>\n';
                    row += '<td>'+data[i].LAST_MODIFY_DATE +'</td>';
                    row += '<td><input type="hidden" id="colStatus" name="colStatus" value="select"></td>\n';
                    row += '<td><input type="hidden" id="userSeq" name="userSeq" value="'+data[i].SEQ+'"></td>';
                    row += '</tr>';

                    $('#grdUserAuth').append(row);
                    userAuthIndex = data.length + 1;
                }
            }
        });
    }
    function saveUserRow() {
        var addUserCol = $('#grdUserAuth tr td input[value="insert"]').length;

        if(confirm("저장하시겠습니까?")){
            for(var i=0; i < addUserCol; i++){
                var userInfo = {
                    "userID" : $("#grdUserAuth tr:eq("+i+") td input").eq(1).val(),
                    "userPW" : $("#grdUserAuth tr:eq("+i+") td input").eq(2).val(),
                    "userNm" : $("#grdUserAuth tr:eq("+i+") td input").eq(3).val(),
                    "userEmail" : $("#grdUserAuth tr:eq("+i+") td input").eq(4).val(),
                    "enabled" : $("#grdUserAuth tr:eq("+i+") td option").eq(1).val(),
                    "authCode" : authCode
                };
                $.ajax({
                   url : '${pageContext.request.contextPath} /cms/cmsUserAuth/add',
                   data : userInfo,
                   success : function(){
                       console.log("성공");
                       userList(authCode);
                   },
                    error : function (xhr,stat,err) {
                        console.log(err);
                    }
                });
            }
        }
    }

    function addUserRow(){
        var table = document.getElementById('grdUserAuth');
        var row = table.insertRow(0);
        var seq = row.insertCell(0);
        seq.innerHTML = userAuthIndex;

        var rowCheck = row.insertCell(1);
        var rowCheckType = document.createElement("input");
        rowCheckType.type = "checkbox";
        rowCheck.appendChild(rowCheckType);

        var userId = row.insertCell(2);
        var userIdType = document.createElement("input");
        userIdType.id = "userId";
        userIdType.name = "userId";
        userIdType.title = "ID";
        userId.appendChild(userIdType);

        var userPw = row.insertCell(3);
        var userPwType = document.createElement("input");
        userPwType.type = "password";
        userPwType.id = "userPw";
        userPwType.name = "userPw";
        userPwType.title = "패스워드";
        userPw.appendChild(userPwType);

        var userNm = row.insertCell(4);
        var userNmType = document.createElement("input");
        userNmType.id = "userNm";
        userNmType.name = "userNm";
        userNmType.title = "성명";
        userNm.appendChild(userNmType);

        var userEmail = row.insertCell(5);
        var userEmailType = document.createElement("input");
        userEmailType.id = "userEmail";
        userEmailType.name = "userEmail";
        userEmailType.title = "이메일";
        userEmail.appendChild(userEmailType);

        var enabled = row.insertCell(6);
        enabled.innerHTML += '<select id="enabled" name="enabled">'
                          + '<option value="0">미사용</option>'
                          + '<option value="1">사용</option>'
                          + '</select>';

        var colStatus = row.insertCell(7);
        var colStatusType = document.createElement("input");
        colStatusType.type = "hidden";
        colStatusType.id = "colStatus";
        colStatusType.name = "colStatus";
        colStatusType.value = "insert";
        colStatus.appendChild(colStatusType);
    }
    $(document).ready(function() {
        searchAuthList();

    });
</script>