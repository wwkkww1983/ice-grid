﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="updateProduct.aspx.cs" Inherits="autosell_center.main.product.updateProduct" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>购买类型-自动售卖终端中心控制系统</title>
    <meta charset="utf-8" />
    <link rel="shortcut icon" href="/main/public/images/favicon.ico" />
    <link href="/main/public/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="/main/public/css/common.css" rel="stylesheet" type="text/css" />
    <link href="/main/public/css/style.css" rel="stylesheet" type="text/css" />
    <script src="/main/public/script/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="/main/public/script/Titlelist.js" type="text/javascript"></script>
    <script src="../public/script/jquery.form.js" type="text/javascript"></script>
    <style>
        .firmbtn {
            margin-left: 30px;
        }
          .drop {
            width: 60%;
            min-width: 400px;
            max-width: 800px;
            padding-left: 2%;
            height: 36px;
            border-radius: 6px;
            border: 1px solid #ddd;
       }
    </style>
</head>
<body>
    <div class="header"></div>
    <form runat="server" id="ImageForm" method="post" enctype="multipart/form-data">
        <div class="main">
    <div class="addDiv change">
        <h4>添加分类</h4>
        <ul>
            <li>
                <label>分类名称</label>
                <input type="text" value="" placeholder="填写分类名称"/>
            </li>
            
            <li>
                <label></label>
                <input type="button" value="确认添加" class="btnok"/>
                <input type="button" value="取消" class="btnoff" onclick="divOff()" />
            </li>
        </ul>
    </div>
    <div class="popupbj"></div>
    <div class="main_list">
        <div class="common_title">
            <h4>
                <i class="fa fa-cubes"></i>
                <span>商品管理</span>
            </h4>
        </div>
        <div class="common_main">
            <div class="navlist">
                <dl>
                    <dt>商品信息<em class="fa fa-cog"></em></dt>
                    <dd>
                        <a class="change" href="productlist.aspx"><i class="change fa fa-cube"></i>商品列表</a>
                    </dd>
                  
                    <dd>
                        <a class="change acolor"><i class="change icolor fa fa-plus-square"></i>添加商品</a>
                    </dd>
                   <dd>
                        <a class="change" href="brandList.aspx"><i class="change fa fa-window-restore"></i>品牌列表</a>
                    </dd>
                </dl>
            </div>
            <div class="jiqadd">
                <section class="addnaiq">
                    <h4 class="commonfut"><a class="change" href="productlist.aspx"><i class="change fa fa-angle-left"></i>商品列表</a>/修改商品</h4>
                    <ul class="addnaiqdata" id="addnaiqdata1" style="display: block;">
                        <li>
                            <label>商品名称</label>
                            <div>
                                <input type="text" value=""   id="name" runat="server" placeholder="便于商品显示，请保证名称10字以内">
                                <p>商品的名称</p>
                            </div>
                        </li>
                          <li>
                            <label>商品简称</label>
                            <div>
                                <input type="text" value="" runat="server" placeholder="便于商品显示，请保证名称3字以内" id="shortname">
                            </div>
                        </li>
                         <li>
                            <label>商品标签</label>
                            <div>
                                <input type="text" value="" placeholder="多个标签用‘|’隔开，例如 热卖品|全程冷链" id="tag" runat="server">
                            </div>
                        </li>
                         <li>
                            <label>类型</label>
                            <div>
                                <asp:DropDownList ID="type" runat="server" CssClass="drop">
                                   <asp:ListItem Value="1">订购</asp:ListItem>
                                   <asp:ListItem Value="2">零售</asp:ListItem>
                                   <asp:ListItem Value="3">订购+零售</asp:ListItem>
                               </asp:DropDownList>
                            </div>
                        </li>
                          <li>
                            <label>商品权重</label>
                            <div>
                                <input type="text" value="" placeholder="权重数字越高，排序越靠前" id="weight" runat="server">
                            </div>
                        </li>
                        <li>
                            <label>首送日期</label>
                            <div>
                                <input type="text" value="" placeholder="订购商品 距离下单N天后开始派送" id="startSend" runat="server">
                            </div>
                        </li>
                         <li>
                            <label>商品条码</label>
                            <div>
                                <input type="text" value="" runat="server" placeholder="" id="bh">
                            </div>
                        </li>
                          <li>
                            <label>品牌</label>
                            <div>
                                <asp:DropDownList ID="brandlist" runat="server"  CssClass="drop">
                                     
                                </asp:DropDownList>
                            </div>
                        </li>
                        <li>
                           <label>包装</label>
                            <div>
                                <asp:DropDownList ID="ztList" runat="server"  CssClass="drop">
                                    <asp:ListItem Value="1">盒</asp:ListItem>
                                    <asp:ListItem Value="2">袋</asp:ListItem>
                                    <asp:ListItem Value="3">杯</asp:ListItem>
                                    <asp:ListItem Value="4">瓶</asp:ListItem>
                                    <asp:ListItem Value="5">个</asp:ListItem>
                                    <asp:ListItem Value="6">包</asp:ListItem>
                                </asp:DropDownList>
                               
                            </div>
                        </li>
                        <li>
                            <label>商品类别</label>
                            <div>
                                <asp:DropDownList ID="typeLB" runat="server" CssClass="drop"></asp:DropDownList>
                              
                            </div>
                        </li>
                         <li>
                            <label>零售价格</label>
                            <div>
                              <input id="price0" runat="server" />
                                <p>零售价格</p>
                            </div>
                        </li>
                          <li>
                            <label>普通价格</label>
                            <div>
                              <input id="price1" runat="server" />
                                <p>普通会员等级价格</p>
                            </div>
                        </li>
                           <li>
                            <label>白银价格</label>
                            <div>
                              <input id="price2" runat="server"/>
                                <p>白银会员等级价格</p>
                            </div>
                        </li>
                         <li>
                            <label>黄金价格</label>
                            <div>
                              <input id="price3" runat="server"/>
                                <p>黄金会员等级价格</p>
                            </div>
                        </li>
                        <li>
                            <label>保质期</label>
                            <div>
                              <input id="bzqDay" runat="server" />
                                
                            </div>
                        </li>
                         <li>
                            <label>商品规格</label>
                            <div>
                               <input id="progg" runat="server" placeholder="例如:250ml"/>
                               
                            </div>
                        </li>
                        <li>
                            <label>商品介绍</label>
                            <div>
                              <input id="description" runat="server" maxlength="30"/>
                               
                            </div>
                        </li>
                        <li>
                            <label>选择商品封面</label>
                             <div>
                                   <img id="pic" src="~/img/20180313104249.jpg" alt=""  runat="server"/>
                                   <input type="file" id="upload" name="file" value="" style="display: none;" />
                              </div>
                        </li>
                        <li>
                            <input class="firmbtn" type="button" value="确定修改" onclick="addok()">
                        </li>
                    </ul>
                </section>
            </div>
        </div>
    </div>
</div>
        <input  id="companyID"  runat="server" type="hidden"/>
        <input id="product_id" runat="server" type="hidden"/>
    </form>
   
</body>
</html>
<script>
    function checkRate(input) { 
        var re = /^[0-9]+.?[0-9]*/;//判断字符串是否为数字//判断正整数/[1−9]+[0−9]∗]∗/ 
        if (!re.test(input)) {
            return false;
        }
        return true;
    }
    function addok() {
        var str = $("#upload").val();
        var arr = str.split('\\');//注split可以用字符或字符串分割 
        var yyzz = arr[arr.length - 1].split('.')[1];//这就是要取得的图片名称 
       
        if ($("#name").val() == "") {
            alert("请输入商品名称");
            return;
        }
        if ($("#name").val().length >= 10) {
            alert("商品名称过长");
            return;
        }
        if ($("#type").val() == "1" || $("#type").val() == "3") {
            if (!checkRate($("#startSend").val())) {
                alert("请填写正确的首送日期");
                return;
            }
        }
       
        if ($("#shortname").val() == "") {
            alert("商品简称不能为空");
            return;
        }
        if ($("#shortname").val().length >= 4) {
            alert("商品简称过长");
            return;
        }
        if ($("#bh").val() == "") {
            alert("商品编号不能为空");
            return;
        }
        
        if (!checkRate($("#price0").val()) || $("#price0").val().indexOf('。') > -1) {
            alert("请输入正确的零售价格");
            return;
        }
        //if (!checkRate($("#price1").val()) || $("#price1").val().indexOf('。')>-1)
        //{
        //    alert("请输入正确的金额");
        //    return;
        //}
        //if (!checkRate($("#price2").val()) || $("#price2").val().indexOf('。') > -1) {
        //    alert("请输入正确的会员金额");
        //    return;
        //}
        //if (!checkRate($("#price3").val()) || $("#price3").val().indexOf('。') > -1) {
        //    alert("请输入正确的会员金额");
        //    return;
        //}
        if($("#des").val()=="")
        {
            alert("请输入商品介绍");
            return;
        }
        if ($("#bzq").val() == "") {
            alert("请输入商品保质期");
            return;
        }
       
        //验证是否重名
        upload();
       
    }
    function upload() {
        var u = "";
        var options = {
            url: "../../ashx/asm.ashx",//处理程序路径  
            type: "post",
            dataType: 'json',
            data: {
                action: "updateProduct",
                //name: $("#name").val(),
                lb: $("#typeLB").val(),
                des: $("#description").val(),
                ls_price: $("#price0").val(),
                pt_price: $("#price1").val(),
                by_price: $("#price2").val(),
                hj_price: $("#price3").val(),
                bzq: $("#bzqDay").val(),
                zt: $("#ztList").val(),
            
                brandID: $("#brandlist").val()
             
            },
            success: function (res) {
                //回调函数--请求成功  
                if (res.code == "200") {
                    alert("修改成功");
                } else {
                    alert(res.msg);
                }
            }
            
        };
        //将options传给ajaxForm  
        $('#ImageForm').ajaxSubmit(options);
    }
    $(function () {
        $("#pic").click(function () {
            $("#upload").click(); //隐藏了input:file样式后，点击头像就可以本地上传
            $("#upload").on("change", function () {
                var objUrl = getObjectURL(this.files[0]); //获取图片的路径，该路径不是图片在本地的路径
                if (objUrl) {
                    $("#pic").attr("src", objUrl); //将图片路径存入src中，显示出图片
                }
            });
        });

        $("#piclogo").click(function () {
            $("#uploadlogo").click(); //隐藏了input:file样式后，点击头像就可以本地上传
            $("#uploadlogo").on("change", function () {
                var objUrl = getObjectURL(this.files[0]); //获取图片的路径，该路径不是图片在本地的路径
                if (objUrl) {
                    $("#piclogo").attr("src", objUrl); //将图片路径存入src中，显示出图片
                }
            });
        });
    });
    //建立一個可存取到該file的url
    function getObjectURL(file) {
        var url = null;
        if (window.createObjectURL != undefined) { // basic
            url = window.createObjectURL(file);
        } else if (window.URL != undefined) { // mozilla(firefox)
            url = window.URL.createObjectURL(file);
        } else if (window.webkitURL != undefined) { // webkit or chrome
            url = window.webkitURL.createObjectURL(file);
        }
        return url;
    }
</script>
<script>
    $(function () {
        $("#li3").find("a").addClass("aborder");
        
    })
     
</script>