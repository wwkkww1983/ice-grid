﻿using autosell_center.util;
using Consumer.cls;
using DBUtility;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace autosell_center.main.enterprise
{
    public partial class hblist : System.Web.UI.Page
    {
        public string comID = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            comID = OperUtil.Get("companyID");
            this._operaID.Value = OperUtil.Get("operaID");
            if (string.IsNullOrEmpty(comID))
            {
                Response.Write("<script>alert('您尚未登录或已长时间未进行操作，请重新登录!');top.location.href='../../index.aspx';</script>");
                return;
            }
            this.companyID.Value = comID;
        }
        [WebMethod]
        public static object judge(string operaID, string menuID)
        {
            Boolean b = Util.judge(operaID, menuID);
            if (b)
            {
                return new { code = 200 };
            }
            else
            {
                return new { code = 500 };
            }
        }
        [WebMethod]
        public static string getList(string companyID)
        {
            string sql = "select * from asm_zfbhb where companyID="+companyID;
            DataTable dt = DbHelperSQL.Query(sql).Tables[0];
            if (dt.Rows.Count > 0)
            {
                return OperUtil.DataTableToJsonWithJsonNet(dt);
            }
            else {
                return "";
            }
        }
        [WebMethod]
        public static object del(string id)
        {
            string sql = "select * from asm_zfbhb where id="+id;
            DataTable dd = DbHelperSQL.Query(sql).Tables[0];
            if (dd.Rows.Count > 0)
            {
                string sql1 = "select * from asm_mechine where hbID="+id;
                DataTable d1 = DbHelperSQL.Query(sql1).Tables[0];
                if (d1.Rows.Count>0)
                {
                    return new { code=200,msg="当前红包正在使用无法删除"};
                }else
                {
                    //可删除
                    string sql2 = "delete from asm_zfbhb where id="+id;
                    int a= DbHelperSQL.ExecuteSql(sql2);
                    if (a > 0)
                    {
                        return new { code = 200, msg = "删除成功" };
                    }
                    else {
                        return new { code=200,msg="删除失败"};
                    }
                }
            } else {
                return new { code = 200, msg = "当前支付宝红包不存在" };
            }
        }
    }
}