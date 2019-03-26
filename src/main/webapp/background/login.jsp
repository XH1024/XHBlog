<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>登录--layui后台管理模板</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/background/lib/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/background/css/login.css" media="all" />
</head>
<style type="text/css">
    body{
        background:url("${pageContext.request.contextPath}/static/background/images/login_bg.jpg") no-repeat 60% 1px;
    }
</style>
<body>
<div class="login">
    <h1>layuiCMS-管理登录</h1>
    <form class="layui-form">
        <div class="layui-form-item">
            <input class="layui-input" name="username" placeholder="用户名" lay-verify="required" type="text" autocomplete="off">
        </div>
        <div class="layui-form-item">
            <input class="layui-input" name="password" placeholder="密码" lay-verify="required" type="password" autocomplete="off">
        </div>
        <div class="layui-form-item form_code">
            <input class="layui-input" name="code" placeholder="验证码"  type="text" autocomplete="off">
            <div class="code"><img src="../../images/code.jpg" width="116" height="36"></div>
        </div>
        <button class="layui-btn login_btn" lay-submit="" lay-filter="login">登录</button>
    </form>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/background/lib/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/background/js/login.js"></script>>
</body>
</html>