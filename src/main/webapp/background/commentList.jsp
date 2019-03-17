<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/background/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/background/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/background/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/background/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body class="layui-anim layui-anim-up">
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a>
          <cite>评论列表</cite></a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
    <span class="x-right" style="line-height:40px">共有数据：88 条</span>
</div>
<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so">
            <input class="layui-input" placeholder="开始日" name="start" id="start">
            <input class="layui-input" placeholder="截止日" name="end" id="end">
            <input type="text" name="username"  placeholder="请输入用户名" autocomplete="off" class="layui-input">
            <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>
    <table class="layui-table">
        <thead>
        <tr>
            <th>ID</th>
            <th>评论文章</th>
            <th>评论人</th>
            <th>评论内容</th>
            <th>评论时间</th>
            <th>状态</th>
            <th>操作</th>
        </thead>
        <tbody class="x-cate">
        <tr cate-id='1' fid='0' >
            <td>1</td>
            <td>
                <i class="layui-icon x-show" status='true'>&#xe623;</i>新闻
            </td>
            <td>1</td>
            <td>2018-09-12 16:32:33</td>
            <td>1</td>
            <td class="td-status">
                <span class="layui-btn layui-btn-normal layui-btn-xs">已显示</span></td>
            <td class="td-manage">
                <a onclick="member_stop(this,'10001')" href="javascript:;"  title="隐藏">
                    <i class="layui-icon">&#xe601;</i>
                </a>
                <a title="删除" onclick="member_del(this,'要删除的id')" href="javascript:;">
                    <i class="layui-icon">&#xe640;</i>
                </a>
            </td>
        </tr>
        <tr cate-id='2' fid='1' >
            <td>2</td>
            <td>
                &nbsp;&nbsp;&nbsp;&nbsp;
                ├国内新闻
            </td>
            <td>1</td>
            <td>1</td>
            <td>2018-09-12 16:32:33</td>
            <td>
                <span class="layui-btn layui-btn-normal layui-btn-xs">已显示</span></td>
            </td>
            <td class="td-manage">
                <a onclick="member_stop(this,'10001')" href="javascript:;"  title="隐藏">
                    <i class="layui-icon">&#xe601;</i>
                </a>
                <a title="删除" onclick="member_del(this,'要删除的id')" href="javascript:;">
                    <i class="layui-icon">&#xe640;</i>
                </a>
            </td>
        </tr>
        <tr cate-id='3' fid='1' >
            <td>3</td>
            <td>
                &nbsp;&nbsp;&nbsp;&nbsp;
                ├国外新闻
            </td>
            <td>1</td>
            <td>1</td>
            <td>2018-09-12 16:32:33</td>
            <td>
                <span class="layui-btn layui-btn-normal layui-btn-xs">已显示</span></td>
            </td>
            <td class="td-manage">
                <a onclick="member_stop(this,'10001')" href="javascript:;"  title="隐藏">
                    <i class="layui-icon">&#xe601;</i>
                </a>
                <a title="删除" onclick="member_del(this,'要删除的id')" href="javascript:;">
                    <i class="layui-icon">&#xe640;</i>
                </a>
            </td>
        </tr>
        </tbody>
    </table>
    <div class="page">
        <div>
            <a class="prev" href="">&lt;&lt;</a>
            <a class="num" href="">1</a>
            <span class="current">2</span>
            <a class="num" href="">3</a>
            <a class="num" href="">489</a>
            <a class="next" href="">&gt;&gt;</a>
        </div>
    </div>

</div>
<script>
    layui.use('laydate', function(){
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#end' //指定元素
        });
    });

    /*用户-停用*/
    function member_stop(obj,id){

        if($(obj).attr('title')=='隐藏'){
            layer.confirm('确认要隐藏吗？',function(index){
                //发异步把用户状态进行更改
                $(obj).attr('title','显示')
                $(obj).find('i').html('&#xe62f;');

                $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已隐藏');
                layer.msg('已隐藏!',{icon: 5,time:1000});
            });
        }else{
            layer.confirm('确认要显示吗？',function(index){
                $(obj).attr('title','隐藏')
                $(obj).find('i').html('&#xe601;');

                $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已显示');
                layer.msg('已显示!',{icon: 6,time:1000});
            });
        }
    }

    /*用户-删除*/
    function member_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            //发异步删除数据
            $(obj).parents("tr").remove();
            layer.msg('已删除!',{icon:1,time:1000});
        });
    }
</script>
<script>var _hmt = _hmt || []; (function() {
    var hm = document.createElement("script");
    hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(hm, s);
})();</script>
</body>

</html>