﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ZTreeDemo
{
    /// <summary>
    /// 节点类
    /// </summary>
    public class Node
    {

        #region 必须属性

        /// <summary>
        /// 节点id（如果重复，下面指定的父节点id时，将会认为后面那个id才是父节点）
        /// </summary>
        public string id { get; set; }

        /// <summary>
        /// 父节点id
        /// </summary>
        public string pId { get; set; }

        /// <summary>
        /// 节点显示出来的文字
        /// </summary>
        public string name { get; set; }

        #endregion

        #region 可选属性

        /// <summary>
        /// 是否展开该节点
        /// </summary>
        public string open { get; set; }

        /// <summary>
        /// 点击节点打开链接（默认路径是从本站点根目录往下找，要访问外网要这样写“http://www.baidu.com”）
        /// </summary>
        public string url { get; set; }

        /// <summary>
        /// 点击链接时打开方式（"_blank", "_self" 或 其他指定窗口名称是name，如果开窗口不存在，则打开新窗口，默认也是打开新窗口）
        /// </summary>
        public string target { get; set; }

        /// <summary>
        /// 节点层级（从1开始）
        /// </summary>
        public int level { get; set; }

        /// <summary>
        /// 节点类型（可以再获取选中节点时使用）
        /// </summary>
        public string type { get; set; }

        /// <summary>
        /// 是否是父节点，主要用于异步加载子节点
        /// </summary>
        public string  isParent { get; set; }

        #endregion
    }
}