<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row">
    <div class="col-md-4">
        <div id="divGrdMaster" class="panel panel-primary">
            <div class="panel-heading">
                <span class="title">권한 목록</span>
            </div>
            <table id="grdMaster" class="grid"></table>
        </div>
    </div>
    <div class="col-md-8">
        <div id="divGrdSlave" class="panel panel-primary">
            <div class="panel-heading">
                <span class="title">부서 목록</span>
            </div>
            <table id="grdSlave" class="grid"></table>
        </div>
    </div>
    <div id="debug"></div>
</div>