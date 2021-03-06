﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rechargetj.aspx.cs" Inherits="autosell_center.main.member.rechargetj" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="shortcut icon" href="/main/public/images/favicon.ico" />
    <link href="/main/public/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="/main/public/css/common.css" rel="stylesheet" type="text/css" />
    <link href="/main/public/css/style.css" rel="stylesheet" type="text/css" />
    <script src="/main/public/script/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="/main/public/script/Titlelist.js" type="text/javascript"></script>
     <link  href="../../scripts/skin/jedate.css" rel="stylesheet" type="text/css"/>
    <script src="../../scripts/jedate.js" type="text/javascript"></script>
    <script src="../../scripts/jedate.min.js"></script>
     <script type="text/javascript">
         window.onload = function () {
            
         }
    </script>
    <style>
        .jiqlistseach {
            margin-bottom: 30px;
        }
        .memberlist li .membname{
            width:16%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="header"></div>
    <div class="main">
        <div class="main_list">
            <div class="common_title">
                <h4>
                    <i class="fa fa-cubes"></i>
                    <span>订单管理</span>
                </h4>
            </div>
            <div class="common_main">
                <div class="navlist">
                    <dl>
                        <dt>订单管理<em class="fa fa-cog"></em></dt>
                        <dd>
                                <a class="change " href="#" onclick="qx_judge('hylb')" ><i class="change  fa fa-user"></i>会员列表</a>
                        </dd>
                       
                         <dd>
                                <a class="change " href="#" onclick="qx_judge('hyczjl')"><i class="change  fa fa-file-text"></i>会员充值记录</a>
                         </dd>
                         <dd>
                                <a class="change acolor" href="#" onclick="qx_judge('hycztj')"><i class="change icolor fa fa-file-text"></i>收入统计</a>
                         </dd>
                    </dl>
                </div>
                <section class="jiqlist">
                    <dl class="jiqlistTab">
                        <dd class="change ddcolor"><b>订单列表</b></dd>
                    </dl>
                    <ul class="jiqlistseach">
                         <li>
                           <asp:DropDownList ID="companyList" runat="server"></asp:DropDownList>
                        </li>
                        <li> 
                             <input name="act_stop_timeks" type="text" id="start"   runat="server"  class="input" value="" placeholder="开始时间"  readonly="true"  />
                        </li>
                        <li>
                             <input name="act_stop_timeks" type="text" id="end"   runat="server"  class="input" value="" placeholder="结束时间"  readonly="true"  />
                        </li>
                        <li>
                            <input type="button" value="查询" class="seachbtn" onclick="getOrderList()" />
                        </li>
                         <li>
                            <asp:Button  ID="excel" runat="server" OnClick="excel_Click"  Text="导出Excel" CssClass="seachbtn"/>
                         </li>
                    </ul>
                    <ul class="memberlist" id="memberList">
                       
                    </ul>
                   <div class="commonPage">
                       <a class="change" onclick="getPage('first')">首页</a>
                       <a class="change" onclick="getPage('up')">上一页</a>
                       <a class="change" onclick="getPage('down')">下一页</a>
                       <a class="change" onclick="getPage('end')">尾页</a>
                       <select id="pageSel" onchange="pageChg()">
                           
                       </select>
                   </div>
                </section>
            </div>
        </div>
    </div>
        <input id="pageCurrentCount" runat="server" type="hidden" value="1"/>
         <input id="pageTotalCount" runat="server" type="hidden" value="1"/>
        <input id="companyID" runat="server" type="hidden"/>
    </form>
</body>
</html>
<script>
    $(function () {
        //qx_judge('hyddgl');
        jeDate({
            dateCell: "#start", //isinitVal:true,
            //format: "YYYY-MM-DD",
            isTime: false, //isClear:false,
            choose: function (val) { },
            minDate: "2014-09-19 00:00:00"
        });
        jeDate({
            dateCell: "#end",
            isinitVal: true,
            isTime: true, //isClear:false,
            minDate: "2014-09-19 00:00:00"
        });
        $("#li1").find("a").addClass("aborder");
        getOrderList();
    })
    function getPage(val)
    {
        if (val == "first")
        {
            $("#pageCurrentCount").val("1");
        } else if (val == "up")
        {
            var index = parseInt($("#pageCurrentCount").val()) - 1;
            
            if(index>=1)
            {
                $("#pageCurrentCount").val(index);
            }
           
        } else if (val == "down") {
            var index = parseInt($("#pageCurrentCount").val()) + 1;
            if (index <=parseInt($("#pageTotalCount").val()))
            {
              $("#pageCurrentCount").val(index);
            }
          
        } else if (val == "end") {
            $("#pageCurrentCount").val($("#pageTotalCount").val());
        }
        getOrderList();
    }
    function pageChg()
    {
        $("#pageCurrentCount").val($("#pageSel").val());
        getOrderList();
    }
    function getOrderList() {
        $("#memberList").empty();
        $(" <li>"
               + " <label style='width:14.2%'>时间</label>"
               + " <label style='width:14.2%'>零售(非钱包)</label>"
               + " <label style='width:14.2%'>零售(钱包)</label>"
               + " <label style='width:14.2%'>订购</label>"
               + " <label style='width:14.2%'>充值</label>"
               + " <label style='width:14.2%'>退款</label>"
               + " <label style='width:14.2%'>总收入</label>"

       + "  </li>").appendTo("#memberList");
        $.ajax({
            type: "post",
            url: "rechargetj.aspx/getSear",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            data: "{start:'" + $("#start").val() + "',end:'" + $("#end").val() + "',pageCurrentCount:'" + $("#pageCurrentCount").val() + "',companyID:'" + $("#companyList").val() + "'}",
            success: function (data) {
                
                var count = data.d.split('@')[0];
                if(parseInt(count)>=0)
                {
                    $("#pageSel").empty();
                    for (var k = 1; k <=parseInt(count) ;k++)
                    {
                        $("<option value='" + k + "'>" + k + "</option>").appendTo("#pageSel");
                    }
                }
                var serverdata = $.parseJSON(data.d.split('@')[1]);
                $("#pageTotalCount").val(count);
                var serverdatalist = serverdata.length;
                $(" <li style = 'background-color:#ff6a00'>"
                       + "   <span style='width:14.2%'>总计</span>"
                       + "   <span style='width:14.2%'>" + data.d.split('@')[2] + "</span>"
                       + "   <span style='width:14.2%'>" + data.d.split('@')[3] + "</span>"
                       + "   <span style='width:14.2%'>" + data.d.split('@')[4] + "</span>"
                       + "   <span style='width:14.2%'>" + data.d.split('@')[5] + "</span>"
                       + "   <span style='width:14.2%'>" + data.d.split('@')[6] + "</span>"
                       + "   <span style='width:14.2%'>" + data.d.split('@')[7] + "</span>"
                       + "</li>").appendTo("#memberList");
                for (var i = 0; i < serverdatalist; i++) {
                    $(" <li>"
                         + "   <span style='width:14.2%'>" + serverdata[i].time + "</span>"
                         + "   <span style='width:14.2%'>" + serverdata[i].lsMoney + "</span>"
                         + "   <span style='width:14.2%'>" + serverdata[i].lsMoneyAvai + "</span>"
                         + "   <span style='width:14.2%'>" + serverdata[i].dgMoney + "</span>"
                         + "   <span style='width:14.2%'>" + serverdata[i].czMoney + "</span>"
                         + "   <span style='width:14.2%'>" + serverdata[i].tkMoney + "</span>"
                         + "   <span style='width:14.2%'>" + serverdata[i].totalMoney + "</span>"
                         + "</li>").appendTo("#memberList");
                }
            }
        })
    }
    function qx_judge(menuID) {

        //首先验证账号和密码正确
        $.ajax({
            url: "../../../ashx/asm.ashx",
            type: 'post',
            dataType: 'json',
            timeout: 10000,
            data: {
                action: "qx_judge",
                menu: menuID
            },
            success: function (resultData) {
                if (resultData.result == "ok")//允许查看跳转
                {
                    if (menuID == 'hylb') {//会员列表
                        location.href = "memberlist.aspx";
                    }
                    if (menuID == 'hyczjl') {//会员充值记录
                        location.href = "rechargelist.aspx";
                    }
                   
                     
                    if (menuID == 'hyddgl') {//会员订单管理
                     
                        location.href = "../order/order.aspx";
                    }
                    if (menuID == 'cpddtj') {//产品订单统计

                        location.href = "../order/Productform.aspx";
                    }
                    if (menuID == 'tjcp') {//添加产品

                        location.href = "../product/productadd.aspx";
                    }
                    if (menuID == 'gmjl') {//购买记录

                        location.href = "../equipment/orderlist.aspx";
                    }
                    if (menuID == 'cplb') {//产品列表
                        location.href = "../product/productlist.aspx";
                    }
                    if (menuID == 'sblb') {//设备管理
                        location.href = "../equipment/equipmentlist.aspx";
                    }
                    if (menuID == 'glygl') {//管理员管理
                        location.href = "../Administrators/adminlist.aspx";
                    }
                    if (menuID == 'jsgl') {//角色管理
                        location.href = "../Administrators/rolelist.aspx";
                    }
                    if (menuID == 'szhd') {//活动管理
                        location.href = "../activity/activity.aspx";
                    }
                    if (menuID == 'spgl') {//广告管理
                        location.href = "../Advertisement/video.aspx";
                    }
                    if (menuID == 'jqtjsp') {//机器添加视频
                        location.href = "../Advertisement/Jurisdiction.aspx";
                    }
                    if (menuID == 'gzhsz') {//公众号管理
                        location.href = "../enterprise/Thepublicjb.aspx";
                    }
                    if (menuID == 'mbxx') {//模板消息
                        location.href = "../enterprise/Distributor.aspx";
                    }
                    if (menuID == 'sjdp') {//数据大屏
                        window.open("/main/Big_screen/big_screen.aspx");
                    }
                    if (menuID == 'zhcx') {//数据统计与查询
                        location.href = "../datatj/Statisticalquery.aspx";
                    }
                } else if (resultData.result == "notLogin")//没有查看权限
                {

                    $(".jiqlist").empty();
                    $(".jiqlist").html("<p class='noquanxian'>当前没有权限</p>").css({ "background": "#ddd" });
                }
                else if (resultData.result == "1")//请联系管理员给当前登录角色赋值权限
                {
                    alert("请联系管理员给当前登录角色赋值权限");
                }
                else if (resultData.result == "2")//跳转重新登录
                {
                    location.href = "../../../../index.aspx";
                }

            }
        })
    }
</script>
