<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="pull-right">
    <div class="btn-group">
        <button type="button" id="btnAddRow" class="btn btn-default btn-ssm" onclick="addUrlRow()" disabled> 행추가
        </button>
        <button type="button" id="btnDelRow" class="btn btn-default btn-ssm" onclick="delUrlRow()" disabled>행삭제</button>
    </div>
    <div class="btn-group">
        <button type="button" id="SelSaveRow" class="btn btn-default btn-ssm" onclick="saveUrlRow()" disabled>저장
        </button>
        <button type="button" id="SelDelRow" class="btn btn-default btn-ssm" disabled>삭제</button>
    </div>
</div>

<div class="row">
    <div class="col-md-4">
        <div id="divGrdMaster" class="panel panel-primary">
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
        <div id="divGrdSlave" class="panel panel-primary">
            <div class="panel-heading">
                <span class="title">페이지 목록</span>
            </div>
            <table class="table-bordered table-hover text-left">
                <thead>
                <th></th>
                <th>
                    <input type="checkbox" id="totalUrlCol">
                </th>
                <th>페이지명</th>
                <th>URL</th>
                <th>페이지 설명</th>
                <th>수정일</th>
                </thead>
                <tbody id="grdUrlList">

                </tbody>
            </table>
        </div>
    </div>
    <div id="debug"></div>
</div>

<script type="text/javascript">
    var authListIndex = 1;
    var urlListIndex = 1;
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
                    row += '<tr onclick="urlList(\'' + data[i].AUTH_CODE + '\');">\n';
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

    function urlList(code) {
        authCode = code;

        $("#btnAddRow").prop("disabled", false);
        $("#btnDelRow").prop("disabled", false);
        $("#SelSaveRow").prop("disabled", false);
        $("#SelDelRow").prop("disabled", false);

        $.ajax({
            url: '${pageContext.request.contextPath} /cms/cmsUrlList/select',
            data: {
                authCode: authCode
            },
            success: function (data) {
                console.log("Code      :    " + code);
                $("#grdUrlList").html('');

                for (var i = 0; i < data.length; i++) {
                    var row = '';
                    row += '';
                    row += '<tr>\n';
                    row += '<td>' + (i + 1) + '</td>\n';
                    row += '<td><input type="checkbox" name="colUrlSelected"></td>\n';
                    row += '<td>\n';
                    row += '<input type="text" id="urlName" name="urlName" value="' + data[i].URL_NAME + '">\n';
                    row += '</td>\n';
                    row += '<td>\n';
                    row += '<input type="text" id="urlPath" name="urlPath" value="' + data[i].URL_PATH + '">\n';
                    row += '</td>\n';
                    row += '<td>\n';
                    row += '<input type="text" id="urlComment" name="urlComment" value="' + data[i].URL_COMMENT + '">\n';
                    row += '</td>\n';
                    row += '<td>' + data[i].URL_MODIFY_DATE + '</td>\n';
                    row += '<td><input type="hidden" id="colStatus" name="colStatus" value="select"></td>\n';
                    row += '<td><input type="hidden" id="urlSeq" name="urlSeq" value="' + data[i].SEQ + '"></td>\n';
                    row += '</tr>';

                    $('#grdUrlList').append(row);
                    urlListIndex = data.length + 1;
                    console.log(data);
                    console.log("seq    " + urlSeq);
                }
            }
        });
    }

    function addUrlRow() {
        urlListIndex = 1;

        var table = document.getElementById('grdUrlList');
        var row = table.insertRow(0);
        var seq = row.insertCell(0);
        seq.innerHTML = urlListIndex;

        var rowCheck = row.insertCell(1);
        var rowCheckType = document.createElement("input");
        rowCheckType.type = "checkbox";
        rowCheck.appendChild(rowCheckType);

        var urlName = row.insertCell(2);
        var urlNameType = document.createElement("input");
        urlNameType.id = "urlName";
        urlNameType.name = "urlName";
        urlNameType.title = "페이지명";
        urlName.appendChild(urlNameType);

        var urlPath = row.insertCell(3);
        var urlPathType = document.createElement("input");
        urlPathType.id = "urlPath";
        urlPathType.name = "urlPath";
        urlPathType.title = "URL";
        urlPath.appendChild(urlPathType);

        var urlComment = row.insertCell(4);
        var urlCommentType = document.createElement("input");
        urlCommentType.id = "urlComment";
        urlCommentType.name = "urlComment";
        urlCommentType.title = "페이지 설명";
        urlComment.appendChild(urlCommentType);

        var colStatus = row.insertCell(5);
        var colStatusType = document.createElement("input");
        colStatusType.type = "hidden";
        colStatusType.id = "colStatus";
        colStatusType.name = "colStatus";
        colStatusType.value = "insert";
        colStatus.appendChild(colStatusType);

        urlListIndex++;
    }

    function delUrlRow() {

    }

    function saveUrlRow() {
        var addUrlCol = $('#grdUrlList tr td input[value="insert"]').length;

        if (confirm("저장하시겠습니까?")) {

            for (var i = 0; i < addUrlCol; i++) {
                var urlInfo = {
                    "urlName": $("#grdUrlList tr:eq(" + i + ") td input").eq(1).val(),
                    "urlPath": $("#grdUrlList tr:eq(" + i + ") td input").eq(2).val(),
                    "urlComment": $("#grdUrlList tr:eq(" + i + ") td input").eq(3).val(),
                    "authCode": authCode
                };
                $.ajax({
                    url: '${pageContext.request.contextPath} /cms/cmsUrlList/add',
                    data: urlInfo,
                    success: function () {
                        console.log("성공");
                        urlList(authCode);
                    },
                    error: function (xhr, stat, err) {
                        console.error(err);
                    }
                });
            }
        }
    }

    $(document).ready(function () {
        searchAuthList();

        $('#totalUrlCol').click(function () {
            if ($('#totalUrlCol').prop("checked")) {
                $("input[name=colUrlSelected]").prop("checked", true);
            } else {
                $("input[name=colUrlSelected]").prop("checked", false);
            }
        });

        $('#SelDelRow').click(function () {
            var rowData = new Array();
            var tdArr = new Array();

            var checkboxCol = $("input[name=colUrlSelected]:checked");

            console.log("checkboxbol length     " + checkboxCol.length);

            if (checkboxCol.length == "") {
                alert("삭제할 컬럼을 체크해주세요.");
                return false;
            } else {
                if (confirm("삭제하시겠습니까?")) {
                    checkboxCol.each(function (i) {

                        var tr = checkboxCol.parent().parent().eq(i);
                        var td = tr.children();

                        rowData.push(tr.text());

                        var urlSeq = td.eq(7).find('input[type="hidden"]').val();
                        tdArr.push(urlSeq);

                        $.ajaxSettings.traditional = true;

                        $.ajax({
                            url: '${pageContext.request.contextPath} /cms/cmsUrlList/delete',
                            data: {
                                param: urlSeq
                            },
                            success: function () {
                                console.log("삭제 성공");
                                urlList(authCode);
                            },
                            error: function (xhr, stat, err){
                                console.error(err);
                            }
                        });
                        console.log("tdArr      :     " + tdArr);
                        tdArr = [];
                    });
                }
            }
        });
    });
</script>