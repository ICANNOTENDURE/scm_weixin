/*
Navicat MySQL Data Transfer

Source Server         : mysql_localhost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : sci

Target Server Type    : MYSQL
Target Server Version : 50699
File Encoding         : 65001

Date: 2016-01-20 15:36:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` (`id`, `title`, `content`) VALUES ('1', 'JFinal Demo Title here', 'JFinal Demo Content here'), ('2', 'test 1', 'test 1'), ('3', 'test 2', 'test 2'), ('4', 'test 3', 'test 3'), ('5', 'test 4', 'test 4');

-- ----------------------------
-- Records of t_app_log
-- ----------------------------

-- ----------------------------
-- Records of t_app_log_audit
-- ----------------------------

-- ----------------------------
-- Records of t_cat_druggroup
-- ----------------------------

-- ----------------------------
-- Records of t_cat_druggroupitm
-- ----------------------------

-- ----------------------------
-- Records of t_cat_group
-- ----------------------------

-- ----------------------------
-- Records of t_cat_groupproperty
-- ----------------------------

-- ----------------------------
-- Records of t_cat_property
-- ----------------------------

-- ----------------------------
-- Records of t_hop_ctloc
-- ----------------------------

-- ----------------------------
-- Records of t_hop_elesub
-- ----------------------------

-- ----------------------------
-- Records of t_hop_evalute
-- ----------------------------

-- ----------------------------
-- Records of t_hop_inc
-- ----------------------------

-- ----------------------------
-- Records of t_hop_inc_loc
-- ----------------------------

-- ----------------------------
-- Records of t_hop_inc_news
-- ----------------------------
INSERT INTO `t_hop_inc_news` (`INCNEWS_ID`, `INCNEWS_TITLE`, `INCNEWS_USERID`, `INCNEWS_PATH`, `INCNEWS_DATE`, `INCNEWS_TYPE`, `INCNEWS_READCOUNT`, `INCNEWS_CONTENT`) VALUES ('1', '东华医疗供应链', '67', null, '2016-01-20 14:04:26', '2', '4', '<h2 style=\"font-size:1.75em;color:#333333;font-family:\'Helvetica Neue\', Helvetica, \'Segoe UI\', Arial, freesans, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\';background-color:#FFFFFF;\">\r\n	layout\r\n</h2>\r\n<p style=\"color:#333333;font-family:\'Helvetica Neue\', Helvetica, \'Segoe UI\', Arial, freesans, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\';font-size:16px;background-color:#FFFFFF;\">\r\n	以Activity或Fragment class名开头\r\n</p>\r\n<pre>AccountActivity 的布局-&gt; R.layout.accountactivity_layout\r\n\r\nAccountActivity 滑动菜单的布局 -&gt; R.layout.accountactivity_menu_left_layout</pre>\r\n<p style=\"color:#333333;font-family:\'Helvetica Neue\', Helvetica, \'Segoe UI\', Arial, freesans, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\';font-size:16px;background-color:#FFFFFF;\">\r\n	对于公用的布局，看情况，比如\r\n</p>\r\n<pre>R.layout.viewpager_layout</pre>\r\n<h2 style=\"font-size:1.75em;color:#333333;font-family:\'Helvetica Neue\', Helvetica, \'Segoe UI\', Arial, freesans, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\';background-color:#FFFFFF;\">\r\n	<a id=\"user-content-id-资源\" class=\"anchor\" href=\"https://github.com/qii/weiciyuan/wiki/Code-style#id-%E8%B5%84%E6%BA%90\"><span class=\"octicon octicon-link\" style=\"font-weight:normal;font-size:16px;line-height:1;font-family:octicons;color:#000000;vertical-align:middle;\"></span></a>id 资源\r\n</h2>\r\n<p style=\"color:#333333;font-family:\'Helvetica Neue\', Helvetica, \'Segoe UI\', Arial, freesans, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\';font-size:16px;background-color:#FFFFFF;\">\r\n	2个词之间以_分割\r\n</p>\r\n<ul style=\"color:#333333;font-family:\'Helvetica Neue\', Helvetica, \'Segoe UI\', Arial, freesans, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\';font-size:16px;background-color:#FFFFFF;\">\r\n	<li>\r\n		控件的id\r\n	</li>\r\n</ul>\r\n<p style=\"color:#333333;font-family:\'Helvetica Neue\', Helvetica, \'Segoe UI\', Arial, freesans, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\';font-size:16px;background-color:#FFFFFF;\">\r\n	因为Android这里是强转的，编译器无法发现类型错误，所以用类似匈牙利系统命名法\r\n</p>\r\n<pre>TextView -&gt; R.id.tv_xxx\r\n\r\nButton -&gt; R.id.btn_xxx</pre>\r\n<ul style=\"color:#333333;font-family:\'Helvetica Neue\', Helvetica, \'Segoe UI\', Arial, freesans, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\';font-size:16px;background-color:#FFFFFF;\">\r\n	<li>\r\n		菜单的id\r\n	</li>\r\n</ul>\r\n<p style=\"color:#333333;font-family:\'Helvetica Neue\', Helvetica, \'Segoe UI\', Arial, freesans, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\';font-size:16px;background-color:#FFFFFF;\">\r\n	全部以menu_开头，比如\r\n</p>\r\n<pre>R.id.menu_save\r\n\r\nR.id.menu_close</pre>\r\n<h1 style=\"font-size:2.25em;color:#333333;font-family:\'Helvetica Neue\', Helvetica, \'Segoe UI\', Arial, freesans, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\';background-color:#FFFFFF;\">\r\n	<a id=\"user-content-菜单\" class=\"anchor\" href=\"https://github.com/qii/weiciyuan/wiki/Code-style#%E8%8F%9C%E5%8D%95\"><span class=\"octicon octicon-link\" style=\"font-weight:normal;font-size:16px;line-height:1;font-family:octicons;color:#000000;vertical-align:middle;\"></span></a>菜单\r\n</h1>\r\n<p style=\"color:#333333;font-family:\'Helvetica Neue\', Helvetica, \'Segoe UI\', Arial, freesans, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\';font-size:16px;background-color:#FFFFFF;\">\r\n	/res/menu 文件夹下面，分别是这样：\r\n</p>\r\n<pre>R.menu.actionbar_menu_xxx\r\n\r\nR.menu.contextual_menu_xxx\r\n\r\nR.menu.popup_menu_xxx</pre>\r\n<blockquote style=\"color:#777777;font-family:\'Helvetica Neue\', Helvetica, \'Segoe UI\', Arial, freesans, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\';font-size:16px;background-color:#FFFFFF;\">\r\n	<p>\r\n		floating menu全部会以 DialogFragment 的形式实现，所以不需要&nbsp;\r\n	</p>\r\n</blockquote>\r\n<h2 style=\"font-size:1.75em;color:#333333;font-family:\'Helvetica Neue\', Helvetica, \'Segoe UI\', Arial, freesans, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\';background-color:#FFFFFF;\">\r\n	<a id=\"user-content-图片资源\" class=\"anchor\" href=\"https://github.com/qii/weiciyuan/wiki/Code-style#%E5%9B%BE%E7%89%87%E8%B5%84%E6%BA%90\"><span class=\"octicon octicon-link\" style=\"font-weight:normal;font-size:16px;line-height:1;font-family:octicons;color:#000000;vertical-align:middle;\"></span></a>图片资源\r\n</h2>\r\n<p style=\"color:#333333;font-family:\'Helvetica Neue\', Helvetica, \'Segoe UI\', Arial, freesans, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\';font-size:16px;background-color:#FFFFFF;\">\r\n	/res/drawable 里面存放 xml 格式的图片\r\n</p>\r\n<p style=\"color:#333333;font-family:\'Helvetica Neue\', Helvetica, \'Segoe UI\', Arial, freesans, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\';font-size:16px;background-color:#FFFFFF;\">\r\n	亮色系图片&nbsp;R.drawable.xxx_light&nbsp;暗色系图片&nbsp;R.drawable.xxx_dark\r\n</p>\r\n<h2 style=\"font-size:1.75em;color:#333333;font-family:\'Helvetica Neue\', Helvetica, \'Segoe UI\', Arial, freesans, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\';background-color:#FFFFFF;\">\r\n	<a id=\"user-content-字符串\" class=\"anchor\" href=\"https://github.com/qii/weiciyuan/wiki/Code-style#%E5%AD%97%E7%AC%A6%E4%B8%B2\"><span class=\"octicon octicon-link\" style=\"font-weight:normal;font-size:16px;line-height:1;font-family:octicons;color:#000000;vertical-align:middle;\"></span></a>字符串\r\n</h2>\r\n<p style=\"color:#333333;font-family:\'Helvetica Neue\', Helvetica, \'Segoe UI\', Arial, freesans, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\';font-size:16px;background-color:#FFFFFF;\">\r\n	string 资源，2个词之间以_分割\r\n</p>\r\n<pre>&lt;string name=\"add_topic\"&gt;添加话题&lt;/string&gt;\r\n  &lt;string name=\"add_topic_hint\"&gt;不需要#号&lt;/string&gt;</pre>\r\n<h2 style=\"font-size:1.75em;color:#333333;font-family:\'Helvetica Neue\', Helvetica, \'Segoe UI\', Arial, freesans, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\';background-color:#FFFFFF;\">\r\n	<a id=\"user-content-样式\" class=\"anchor\" href=\"https://github.com/qii/weiciyuan/wiki/Code-style#%E6%A0%B7%E5%BC%8F\"><span class=\"octicon octicon-link\" style=\"font-weight:normal;font-size:16px;line-height:1;font-family:octicons;color:#000000;vertical-align:middle;\"></span></a>样式\r\n</h2>\r\n<p style=\"color:#333333;font-family:\'Helvetica Neue\', Helvetica, \'Segoe UI\', Arial, freesans, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\';font-size:16px;background-color:#FFFFFF;\">\r\n	style 资源，首字母小写，后面词首字母大写\r\n</p>\r\n<h2 style=\"font-size:1.75em;color:#333333;font-family:\'Helvetica Neue\', Helvetica, \'Segoe UI\', Arial, freesans, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\';background-color:#FFFFFF;\">\r\n	<a id=\"user-content-preference-设置的资源\" class=\"anchor\" href=\"https://github.com/qii/weiciyuan/wiki/Code-style#preference-%E8%AE%BE%E7%BD%AE%E7%9A%84%E8%B5%84%E6%BA%90\"><span class=\"octicon octicon-link\" style=\"font-weight:normal;font-size:16px;line-height:1;font-family:octicons;color:#000000;vertical-align:middle;\"></span></a>Preference 设置的资源\r\n</h2>\r\n<p style=\"color:#333333;font-family:\'Helvetica Neue\', Helvetica, \'Segoe UI\', Arial, freesans, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\';font-size:16px;background-color:#FFFFFF;\">\r\n	string，title 是 pref_xxx_title 这样的形式，summary 是 pref_xxx_summary\r\n</p>\r\n<h2 style=\"font-size:1.75em;color:#333333;font-family:\'Helvetica Neue\', Helvetica, \'Segoe UI\', Arial, freesans, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\';background-color:#FFFFFF;\">\r\n	<a id=\"user-content-activity和fragment的命名\" class=\"anchor\" href=\"https://github.com/qii/weiciyuan/wiki/Code-style#activity%E5%92%8Cfragment%E7%9A%84%E5%91%BD%E5%90%8D\"><span class=\"octicon octicon-link\" style=\"font-weight:normal;font-size:16px;line-height:1;font-family:octicons;color:#000000;vertical-align:middle;\"></span></a>Activity和Fragment的命名\r\n</h2>\r\n<p style=\"color:#333333;font-family:\'Helvetica Neue\', Helvetica, \'Segoe UI\', Arial, freesans, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\';font-size:16px;background-color:#FFFFFF;\">\r\n	动词+名词+Activity或者Fragment\r\n</p>\r\n<p style=\"color:#333333;font-family:\'Helvetica Neue\', Helvetica, \'Segoe UI\', Arial, freesans, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\';font-size:16px;background-color:#FFFFFF;\">\r\n	名词+Activity\r\n</p>\r\n<p style=\"color:#333333;font-family:\'Helvetica Neue\', Helvetica, \'Segoe UI\', Arial, freesans, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\';font-size:16px;background-color:#FFFFFF;\">\r\n	如果是 Dialog，可以省略 Fragment 或者 Activity\r\n</p>\r\n<pre>UpdateRemarkDialog\r\n SearchUserFragment</pre>\r\n<h2 style=\"font-size:1.75em;color:#333333;font-family:\'Helvetica Neue\', Helvetica, \'Segoe UI\', Arial, freesans, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\';background-color:#FFFFFF;\">\r\n	<a id=\"user-content-class-view-变量\" class=\"anchor\" href=\"https://github.com/qii/weiciyuan/wiki/Code-style#class-view-%E5%8F%98%E9%87%8F\"><span class=\"octicon octicon-link\" style=\"font-weight:normal;font-size:16px;line-height:1;font-family:octicons;color:#000000;vertical-align:middle;\"></span></a>class View 变量\r\n</h2>\r\n<p style=\"color:#333333;font-family:\'Helvetica Neue\', Helvetica, \'Segoe UI\', Arial, freesans, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\';font-size:16px;background-color:#FFFFFF;\">\r\n	Activity或者Fragment需要牵扯到的控件变量超过5个时候，建个Layout的private class，在里面设置好需要的变量，然后链接上去，以后从 layout.xxx 来获得 控件\r\n</p>\r\n<p>\r\n	<img src=\"http://127.0.0.1:8080/scm/js/kindeditor/plugins/emoticons/images/2.gif\" border=\"0\" alt=\"\" />\r\n</p>\r\n<span id=\"__kindeditor_bookmark_start_0__\"></span>');

-- ----------------------------
-- Records of t_hop_inc_pic
-- ----------------------------

-- ----------------------------
-- Records of t_hop_incalias
-- ----------------------------

-- ----------------------------
-- Records of t_hop_manf
-- ----------------------------

-- ----------------------------
-- Records of t_hop_vendor
-- ----------------------------
INSERT INTO `t_hop_vendor` (`H_VENID`, `H_CODE`, `H_NAME`, `H_PARENTID`, `H_ADDRESS`, `H_FAX`, `H_TEL`, `H_ACCOUNT`, `H_CONTACT`, `H_VENDORID`, `H_ALIAS`, `H_HOPID`, `H_TYPE`, `H_EMAIL`, `H_SEND`, `H_AUDITFLAG`) VALUES ('1', 'ven123', '东华测试供应商', null, null, null, null, null, null, '1', 'dhcsgys', '7', '', null, null, 'Y');

-- ----------------------------
-- Records of t_log_configure
-- ----------------------------

-- ----------------------------
-- Records of t_ord_exestate
-- ----------------------------

-- ----------------------------
-- Records of t_ord_label
-- ----------------------------

-- ----------------------------
-- Records of t_ord_ord
-- ----------------------------

-- ----------------------------
-- Records of t_ord_order
-- ----------------------------

-- ----------------------------
-- Records of t_ord_orderdetail
-- ----------------------------

-- ----------------------------
-- Records of t_ord_orderdetailsub
-- ----------------------------

-- ----------------------------
-- Records of t_ord_orderitm
-- ----------------------------

-- ----------------------------
-- Records of t_ord_plan
-- ----------------------------

-- ----------------------------
-- Records of t_ord_shopping
-- ----------------------------

-- ----------------------------
-- Records of t_ord_state
-- ----------------------------
INSERT INTO `t_ord_state` (`STATE_ID`, `STATE_CODE`, `STATE_NAME`, `STATE_SEQ`) VALUES ('1', '新建', '新建', '1'), ('2', '确认订单/下载订单', '确认订单/下载订单', '2'), ('3', '发货/上传发票', '发货/上传发票', '3'), ('4', '收货', '收货', '4'), ('5', '退货申请', '退货申请', '6'), ('6', '退货审核通过', '退货审核通过', '7'), ('7', '交易关闭', '交易关闭', '9'), ('8', '采购科审核', '采购科审核', '-2'), ('9', '计划科审核', '计划科审核', '-3'), ('10', '主任审核', '主任审核', '-4');

-- ----------------------------
-- Records of t_sys_app_param
-- ----------------------------
INSERT INTO `t_sys_app_param` (`APP_CODE`, `APP_DESCRIPTION`, `APP_HOSPID`, `APP_VALUE`, `APP_ID`) VALUES ('INSERTHIS', '插入his中间表\n没有值则表示护士确认收货时候插入中间表\n1：供应商发货的时候\n2: 药库pda扫码入库的时候\n3: 护士确认收货的时候\n其他:不插', '7', '0', '150'), ('TEST', '护士请领单是否需要审核:\n空:不需要审核\n-4:科主任审核(只能审核本病区的订单)\n-3:计划科审核\n-2:采购科审核\n\nORDER_AUDIT', '7', ' ', '200');

-- ----------------------------
-- Records of t_sys_appno
-- ----------------------------

-- ----------------------------
-- Records of t_sys_ctloc
-- ----------------------------
INSERT INTO `t_sys_ctloc` (`CTLOC_ID`, `CTLOC_CODE`, `CTLOC_NAME`, `CTLOC_HOSPID`, `CTLOC_HISID`, `CTLOC_TYPE`, `CTLOC_DEST`) VALUES ('62', '2100670', '采购科', '7', null, '3', null), ('63', 'X&', '试剂中心', '7', null, '3', null), ('112', '2100171', '病区产科', '7', null, '3', null), ('113', '2100175', '1.2300-外宾药房(药剂科)', '7', null, '3', null), ('114', '2100176', '1.2200-急诊药房(药剂科)', '7', null, '3', null), ('115', '2100177', '1.2600-病房药房(药剂科)', '7', null, '3', null), ('116', '2100179', '1.2400-特需药房(药剂科)', '7', null, '3', null), ('117', '2100180', '6.2100-门诊药房(药剂科)(西院)', '7', null, '3', null), ('118', '2100181', '6.2600-病房药房(药剂科)(西院)', '7', null, '3', null), ('119', '2100183', 'GBYF(YJK)(XY)-干部药房(药剂科)(西院)', '7', null, '3', null), ('120', '2100184', '6.2200-急诊药房(药剂科)(西院)', '7', null, '3', null), ('121', '2100185', '6.2700-输液库(药剂科)(西院)', '7', null, '3', null), ('122', '2100178', '1.2700-输液库(药剂科)', '7', null, '3', null), ('123', '2100172', '(TY)MZECYF-(停用)门诊二层药房', '7', null, '3', null), ('124', '2100173', '(TY)MZSCYF-(停用)门诊三层药房', '7', null, '3', null), ('125', '2100174', '(TY)MZEKYF-(停用)门诊儿科药房', '7', null, '3', null), ('126', '2100182', '(TY)BLXYF-(停用)北楼西药房', '7', null, '3', null), ('127', '2100270', '(TY)ZYF-(停用)中药房', '7', null, '3', null), ('128', '2100271', '(TY)MZZYF-(停用)门诊中药房', '7', null, '3', null), ('129', '2100272', '(TY)WBZYF-(停用)外宾中药房', '7', null, '3', null), ('130', '2100275', '(TY)BLZYF-(停用)北楼中药房', '7', null, '3', null), ('131', '2100276', '(TY)TXZYF-(停用)特需中药房', '7', null, '3', null), ('132', '2100278', '(TY)MZZCYF(XY)-(停用)门诊中草药房(西院)', '7', null, '3', null), ('133', '2100279', '(TY)MZZYF(XY)-(停用)门诊中药房(西院)', '7', null, '3', null), ('134', '2100280', '(TY)GBZYF(XY)-(停用)干部中药房(西院)', '7', null, '3', null), ('135', '2100281', '(TY)ZYZYF(XY)-(停用)住院中药房(西院)', '7', null, '3', null), ('136', '2100282', '(TY)ZYZYF-(停用)住院中药房', '7', null, '3', null), ('137', '2100900', 'YJKPYZX-药剂科配液中心', '7', null, '3', null), ('138', '2109999', 'TRTYF-同仁堂中草药房', '7', null, '3', null), ('139', 'PUSURG', 'JBWKYZNYG-基本外科一智能药柜', '7', null, '3', null), ('140', 'PUHEMA', 'XYNKYZNYG-血液内科一智能药柜', '7', null, '3', null), ('141', 'PUICU', 'ZZYXKZNYK-重症医学科智能药柜', '7', null, '3', null), ('142', '8661520', '1.2900-帅府药房(药剂科)', '7', null, '3', '123'), ('143', '30', 'NSKYBQ-内三科一病区', '7', null, '3', '121'), ('144', '2100004', 'ZLS(YJK)-资料室(药剂科)', '7', null, '3', null), ('145', '2100005', '病区神内血液肾内', '7', null, '3', null), ('146', '2100006', '病区神内血液肾内', '7', null, '3', null), ('147', '2100008', 'YSGZZ(YJK)-医生工作站(药剂科)', '7', null, '3', null), ('148', '2100470', 'YJS(YJK)-药检室(药剂科)', '7', null, '3', null), ('149', '2100560', 'SYS(YJK)-实验室(药剂科)', '7', null, '3', null), ('150', '2100000', 'YJK-药剂科', '7', null, '3', null), ('151', '2100001', 'YJKBGS-药剂科办公室', '7', null, '3', null), ('152', '2100002', 'YJKBGS(XY)-药剂科办公室(西院)', '7', null, '3', null), ('153', '2100370', 'ZJYK-制剂药库(药剂科)', '7', null, '3', null), ('155', '2100677', '6.1100-药库(药剂科)(西院)', '7', null, '3', null), ('156', '2100771', '1.1300-试剂库(药剂科)', '7', null, '3', null), ('157', '2100870', 'YPHJS(YJK)-药品会计室(药剂科)', '7', null, '3', null), ('161', '71', 'PFXBMZYF-皮肤性病门诊药房', '7', null, '3', null), ('162', '98', 'ZXYF-中心药房', '7', null, '3', null), ('163', '99', 'MZZYF-门诊中药房', '7', null, '3', null), ('164', '105', '病区呼吸内', '7', null, '3', null), ('165', '105', '病区呼吸内', '7', null, '3', null), ('166', '102', 'XYK-西药库', '7', null, '3', null), ('167', '103', '病区五官', '7', null, '3', '161'), ('168', '274', 'XYK-西药库01', '7', null, '3', null), ('181', '132	', '泌尿外科', '7', null, null, '184');

-- ----------------------------
-- Records of t_sys_ctloc_destination
-- ----------------------------

-- ----------------------------
-- Records of t_sys_dict
-- ----------------------------
INSERT INTO `t_sys_dict` (`DIC_ID`, `DIC_NAME`, `DIC_TYPE`, `DIC_VALUE`) VALUES ('1', '使用', 'useState', '1'), ('2', '停用', 'useState', '2'), ('5', '男', 'gender', '1'), ('6', '女', 'gender', '2'), ('29', '秒', 'taskTimeType', '1'), ('30', '分种', 'taskTimeType', '2'), ('32', '小时', 'taskTimeType', '3'), ('33', '天', 'taskTimeType', '4'), ('49', '未审批', 'useState', '3');

-- ----------------------------
-- Records of t_sys_func
-- ----------------------------
INSERT INTO `t_sys_func` (`FUNC_ID`, `SEQ`, `IMGURL`, `NAME`, `PARENTID`, `LEAF`, `FUNC`, `URL`, `BACKCOLOR`, `USESTATE`) VALUES ('2', '202', 'fa-user', '角色管理', '7', '1', 'xx', 'role/roleCtrl!roleMain.htm', '#5B3AB6', '1'), ('3', '201', 'fa-lock', '权限管理', '7', '1', 'xx', 'func/funcCtrl!funcMain.htm', '#B51C44', '1'), ('7', '2', 'fa-users', '用户中心', '0', '0', null, 'userManage/userManageCtrl!userManageMain.htm', null, '1'), ('8', '3', 'fa-th-large', '日志管理', '0', '0', null, '#', null, '1'), ('11', '4', 'fa-cogs', '平台维护', '0', '0', null, 'sys/sysDictCtrl!listMain.htm', '#9d3c25', '1'), ('12', '203', 'fa-group', '用户管理', '7', '1', null, 'normalAccount/normalAccountCtrl!normalAccountMain.htm', '#009600', '1'), ('24', '5', 'fa-hospital-o', '医院维护', '0', '0', null, 'hop/hospitalCtrl!listMain.htm', '#861da9', '1'), ('28', '401', 'fa-book', '字典维护', '11', '1', null, 'sys/sysDictCtrl!listMain.htm', '#5B3AB6', '1'), ('43', '501', 'fa-hospital-o', '医院信息维护', '24', '1', null, 'hop/hospitalCtrl!listMain.htm', '#A300AA', '1'), ('46', '301', 'fa-pencil', '日志配置', '8', '1', null, 'logConfig/logConfigCtrl!main.htm', '#A300AA', '1'), ('56', '402', 'fa-columns', '供应商资质字典', '11', '1', null, 'ven/venQualifTypeCtrl!listMain.htm', '#009600', '1'), ('59', '504', 'fa-building', '厂商维护', '24', '1', null, 'manf/hopManfCtrl!listMain.htm', '#0093A8', '1'), ('61', '505', 'fa-medkit', '商品信息维护', '24', '1', null, 'hop/hopIncCtrl!listMain.htm', '#009600', '1'), ('64', '100', 'fa-shopping-cart', '订单', '0', '0', null, 'xxx', null, '1'), ('66', '502', 'fa-columns', '科室信息', '24', '1', null, 'hop/hopCtlocCtrl!listMain.htm', '#5B3AB6', '1'), ('68', '503', 'fa-medkit', '收货信息', '24', '1', null, 'hop/hopCtlocDestinationCtrl!list.htm', '#B51C44', '1'), ('70', '506', 'fa-picture', '药品图片维护', '24', '1', null, 'hop/hopIncPicCtrl!listMain.htm', '#CE4B27', '2'), ('73', '45', 'fa-building', '供应商维护', '0', '0', null, 'xx', '#861da9', '1'), ('74', '46', 'fa-building', '供应商信息维护', '73', '1', null, 'ven/vendorCtrl!listMain.htm', '#A300AA', '1'), ('75', '47', 'fa-medkit', '药品信息维护', '73', '1', null, 'ven/venIncCtrl!listMain.htm', '#009600', '1'), ('76', '48', 'fa-book', '大类维护', '73', '1', null, 'cat/catGroupCtrl!group.htm', '#0093A8', '1'), ('77', '101', 'fa-file-alt', '新建订单', '64', '1', null, 'ord/orderCtrl!listMain.htm', '#A300AA', '1'), ('78', '102', 'fa-search', '订单查询', '64', '1', null, 'ord/orderStateCtrl!listMain.htm', '#0093A8', '1'), ('79', '403', 'fa-road', '订单状态维护', '11', '1', null, 'ord/stateCtrl!listMain.htm', '#CE4B27', '1'), ('80', '104', 'fa-briefcase', '选购药品', '64', '1', null, 'ord/orderCtrl!listInc.htm', '#009600', '1'), ('83', '408', 'fa-envelope', '发送邮件', '11', '1', null, 'sys/sendMailCtrl!listMain.htm', '#5B3AB6', '1'), ('84', '106', 'fa-exchange', '商品对照', '73', '1', null, 'ven/vendorCtrl!contranstInc.htm', '#CE4B27', '1'), ('85', '406', 'fa-sign-in', '导入模板维护', '11', '1', null, 'sys/sysImpModelCtrl!listMain.htm', '#A300AA', '1'), ('103', '507', 'fa-building', '医院供应商', '24', '1', null, 'hop/hopVendorCtrl!listMain.htm', '#336666', '1'), ('104', '109', 'fa-exchange', '供应商对照', '73', '1', null, 'ven/vendorCtrl!ContranstVendor.htm', '#B51C44', '1'), ('106', '110', 'fa-tasks', '供应商开票', '0', '0', null, 'xx', null, '1'), ('107', '111', 'fa-truck', '确认订单', '106', '1', null, 'ord/orderStateCtrl!vendorReciveOrd.htm', '#B51C44', '1'), ('108', '112', 'fa-money', '录入发票', '106', '1', 'ven/venDeliverCtrl!deliver.htm', 'ord/orderStateCtrl!vendorSendOrd.htm', '#5B3AB6', '1'), ('109', '113', 'fa-barcode', '打印条码', '106', '1', null, 'ven/venDeliverCtrl!printLabel.htm', '#009600', '1'), ('110', '114', 'fa-screenshot', '订单追踪', '106', '1', null, 'ven/venDeliverCtrl!TrackDeliver.htm', '#0093A8', '1'), ('111', '115', 'fa-signin', '导入发票', '106', '1', null, 'ven/venDeliverCtrl!importInv.htm', '#CE4B27', '1'), ('123', '407', 'fa-tasks', '任务管理', '11', '1', null, 'sys/TaskConfigCtrl!listMain.htm', '#B51C44', '1'), ('124', '302', 'fa-twitter', '日志', '8', '1', null, 'sys/LogCtrl!listMain.htm', '#009600', '1'), ('125', '118', 'fa-sign-in', '导入发票(2)', '106', '1', null, 'ven/venDeliverCtrl!importInvByOrderItm.htm', '#CE4B27', '1'), ('143', '508', 'fa-bar-chart', '供应商明细', '24', '1', null, 'hop/hopVendorCtrl!listDetail.htm', '#1472CF', '1'), ('144', '120', 'fa-sign-in', '导入订单', '64', '1', null, 'ord/ordCtrl!listMain.htm', '#B51C44', '1'), ('163', '49', 'fa-columns', '类组,小类维护', '73', '1', null, 'cat/catGroupCtrl!listMain.htm', '#009600', '1'), ('183', '123', 'fa-book', '商品属性', '73', '1', null, 'cat/catPropertyCtrl!listMain.htm', '#0093A8', '1'), ('223', '404', 'fa-desktop', '系统参数', '11', '1', null, 'sys/sysAppParamCtrl!listMain.htm', '#00b38a', '1'), ('225', '101102', 'am-icon-book', '我的订单', '21225', '0', null, 'nur/nurseCtrl!nurseOrder.htm', null, '1'), ('226', '101103', 'am-icon-calculator', '购物车结算', '21225', '0', null, 'nur/nurseCtrl!nursePay.htm', null, '1'), ('227', '1041', 'am-icon-line-chart', '报表', '0', '0', null, '2', null, '1'), ('228', '104101', 'am-icon-tag', '科室采购分类', '227', '1', null, 'chart/chartCtrl!listLocGroupAmt.htm', null, '1'), ('229', '104102', 'am-icon-tag', '科室采购商品汇总', '227', '1', null, 'chart/chartCtrl!listLocIncAmt.htm', null, '1'), ('230', '104103', 'am-icon-tag', '全院科室采购金额', '227', '1', null, 'chart/chartCtrl!hopLocAmt.htm', null, '1'), ('231', '104104', 'am-icon-tag', '全院科室单品采购均价', '227', '1', null, 'chart/chartCtrl!hopLocIncPrice.htm', null, '1'), ('232', '104105', 'am-icon-tag', '全院科室采购金额环比', '227', '1', null, 'chart/chartCtrl!listLocAmtGrpByDate.htm', null, '1'), ('233', '104106', 'am-icon-tag', '全院科室采购单价环比', '227', '1', null, 'chart/chartCtrl!listLocPriceGrpByDate.htm', null, '1'), ('234', '1051', 'am-icon-bars', '常用', '0', '0', null, '2', null, '1'), ('235', '105101', 'am-icon-comments-o', '供应商商品牌评价', '234', '1', null, 'comment/CommentCtrl!venIncEval.htm', null, '1'), ('236', '105102', 'am-icon-comment-o', '供应商评价', '234', '1', null, 'comment/CommentCtrl!venEval.htm', null, '1'), ('237', '105103', 'am-icon-newspaper-o', '新闻发布', '234', '1', null, 'hop/hopIncNewsCtrl!listMain.htm', null, '1'), ('238', '105104', 'am-icon-bars', '查看新闻', '234', '1', null, 'hop/hopIncNewsCtrl!listNewsMain.htm', null, '1'), ('239', '105105', 'am-icon-user', '个人信息', '234', '1', null, 'nur/nurseCtrl!nurseInfomation.htm', null, '1'), ('240', '105106', 'am-icon-cubes', '科室库存', '234', '1', null, 'hop/hopIncLocCtrl!listMain.htm', null, '1'), ('241', '105107', 'am-icon-eyedropper', '采购计划', '234', '1', null, 'ord/orderPlanCtrl!listMain.htm', null, '1'), ('242', '1061', null, '订单审核', '0', '0', null, '2', null, '1'), ('243', '106101', null, '科主任审核', '242', '1', null, 'nur/nurseCtrl!auditOrd.htm?dto.ordState=-4', null, '1'), ('244', '106102', null, '计划科审核', '242', '1', null, 'nur/nurseCtrl!auditOrd.htm?dto.ordState=-3', null, '1'), ('245', '106103', null, '采购科审核', '242', '1', null, 'nur/nurseCtrl!auditOrd.htm?dto.ordState=-2', null, '1'), ('263', '1', 'fa-home', '首页', '0', '0', null, '#', null, '1'), ('283', '11301', 'fa-barcode', '打印', '109', '1', null, 'ven/venDeliverCtrl!printLabel.htm', null, '1'), ('284', '405', 'fa-table', '数据库维护', '11', '1', null, 'setup/propertiesCtrl!config.htm', null, '1'), ('300', '101101', 'am-icon-upload', '上传订单', '21225', '0', null, 'nur/nurseCtrl!nurOrdImp.htm', null, '1'), ('499', '6', 'fa fa-weixin', '微信', '0', '0', null, 'weixin/wxMessageCtrl!list.htm', null, '1'), ('725', '601', 'fa fa-send', '发送消息', '499', '1', null, 'weixin/wxMessageCtrl!listMain.htm', null, '1'), ('10725', '602', 'fa fa-group', '微信通讯录', '499', '1', null, 'weixin/wxDepartCtrl!listMain.htm', null, '1'), ('20725', '105108', 'am-icon-barcode', '打印条码', '234', '1', null, 'nur/nurseCtrl!nurPrint.htm', null, '1'), ('21225', '1011', 'am-icon-book', '护士订单', '0', '0', null, '#', null, '1');

-- ----------------------------
-- Records of t_sys_func_role
-- ----------------------------
INSERT INTO `t_sys_func_role` (`FUNC_ID`, `ROLE_ID`) VALUES ('7', '25'), ('3', '25'), ('2', '25'), ('12', '25'), ('8', '25'), ('124', '25'), ('46', '25'), ('11', '25'), ('79', '25'), ('284', '25'), ('83', '25'), ('85', '25'), ('123', '25'), ('28', '25'), ('56', '25'), ('223', '25'), ('24', '25'), ('43', '25'), ('66', '25'), ('68', '25'), ('70', '25'), ('59', '25'), ('103', '25'), ('61', '25'), ('143', '25'), ('73', '25'), ('84', '25'), ('163', '25'), ('74', '25'), ('75', '25'), ('76', '25'), ('104', '25'), ('183', '25'), ('263', '25'), ('499', '25'), ('10725', '25'), ('725', '25'), ('227', '65'), ('230', '65'), ('232', '65'), ('231', '65'), ('233', '65'), ('228', '65'), ('229', '65'), ('234', '65'), ('240', '65'), ('241', '65'), ('239', '65'), ('236', '65'), ('235', '65'), ('238', '65'), ('237', '65'), ('20725', '65'), ('242', '65'), ('245', '65'), ('244', '65'), ('243', '65'), ('21225', '65'), ('300', '65'), ('225', '65'), ('226', '65');

-- ----------------------------
-- Records of t_sys_hospital
-- ----------------------------
INSERT INTO `t_sys_hospital` (`HOSPITAL_ID`, `HOSPITAL_CODE`, `HOSPITAL_NAME`, `HOSPITAL_HISDR`, `HOSPITAL_DESTINATION`) VALUES ('7', 'bjxh', '中国石油中心医院', '3.000000000000000000000000000000', '中国石油中心医院');

-- ----------------------------
-- Records of t_sys_impmodel
-- ----------------------------
INSERT INTO `t_sys_impmodel` (`IMPMODEL_ID`, `IMPMODEL_TYPE`, `IMPMODEL_NAME`, `IMPMODEL_SEQ`, `IMPMODEL_CODE`) VALUES ('1', 'VENINV', '供应商药品代码', '0', null), ('2', 'VENINV', '发票', '1', null), ('3', 'VENINV', '数量', '2', null), ('4', 'VENINV', '批号', '3', null), ('5', 'VENINV', '效期', '4', null), ('6', 'VENINV', '进价', '5', null), ('7', 'VENINVBYORDER', '订单号', '0', null), ('8', 'VENINVBYORDER', '供应商药品代码', '1', null), ('9', 'VENINVBYORDER', '发票', '2', null), ('10', 'VENINVBYORDER', '数量', '3', null), ('11', 'VENINVBYORDER', '批号', '4', null), ('12', 'VENINVBYORDER', '效期', '5', null), ('13', 'VENINVBYORDER', '进价', '6', null), ('22', 'IMPBYORDERITEM', '订单明细ID', '0', null), ('23', 'IMPBYORDERITEM', '供应商药品代码', '1', null), ('24', 'IMPBYORDERITEM', '发票号', '2', null), ('25', 'IMPBYORDERITEM', '数量', '3', null), ('26', 'IMPBYORDERITEM', '进价', '4', null), ('27', 'IMPBYORDERITEM', '进价金额', '5', null), ('28', 'IMPBYORDERITEM', '批号', '6', null), ('29', 'IMPBYORDERITEM', '效期', '7', null), ('230', 'INC', '代码', '0', null), ('231', 'INC', '名称', '1', null), ('232', 'INC', '规格', '2', null), ('233', 'INC', '入库单位', '3', null), ('234', 'INC', '进价', '4', null), ('235', 'INC', '售价', '5', null), ('236', 'INC', '产地', '6', null), ('237', 'INC', '库存分类', '7', null), ('238', 'INC', '最小单位系数', '8', null), ('239', 'INC', '别名', '9', null), ('249', 'HOPVENDOR', '代码', '0', 'HOPEVENDOR_CODE'), ('250', 'HOPVENDOR', '名称', '1', 'HOPEVENDOR_NAME'), ('251', 'HOPVENDOR', '类别', '2', 'HOPEVENDOR_CAT'), ('252', 'HOPVENDOR', '别名', '3', 'HOPEVENDOR_ALIAS'), ('253', 'HOPVENDOR', '地址', '4', 'HOPEVENDOR_ADDRESS'), ('254', 'HOPVENDOR', '电话', '5', 'HOPEVENDOR_TELPHONE'), ('255', 'HOPVENDOR', '登录名', '6', 'HOPEVENDOR_USERNAME'), ('256', 'HOPVENDOR', '邮箱', '7', 'HOPEVENDOR_EMALI'), ('257', 'HOPVENDOR', '同步标志', '8', 'HOPEVENDOR_SYNFLAG'), ('301', 'VENINC', '药品代码', '0', null), ('302', 'VENINC', '药品名称', '1', null), ('303', 'VENINC', '单位描述', '2', null), ('304', 'VENINC', '生产厂家', '3', null), ('305', 'VENINC', '进价', '4', null), ('306', 'VENINC', '规格', '5', null), ('401', 'ORDER', '自然序号', '0', null), ('402', 'ORDER', 'HIS药品代码', '1', null), ('403', 'ORDER', '定价单位', '2', null), ('404', 'ORDER', '药品名称', '3', null), ('405', 'ORDER', '规格', '4', null), ('406', 'ORDER', '剂型', '5', null), ('407', 'ORDER', '数量', '6', null), ('408', 'ORDER', '进价', '7', null), ('409', 'ORDER', '效期', '8', null), ('410', 'ORDER', '类别', '9', null), ('411', 'ORDER', '供应商代码', '10', null), ('412', 'ORDER', '供应商名称', '11', null), ('413', 'ORDER', '生产厂家编码', '12', null), ('414', 'ORDER', '生产厂家名称', '13', null), ('415', 'ORDER', '订单号', '14', null), ('416', 'ORDER', '接收院区', '15', null), ('417', 'ORDER', '收货地址', '16', null), ('418', 'ORDER', '入库科室', '17', null), ('419', 'ORDER', '采购日期', '18', null), ('420', 'ORDER', '要求送货时间', '19', null), ('421', 'ORDER', '是否加急', '20', null);

-- ----------------------------
-- Records of t_sys_log
-- ----------------------------

-- ----------------------------
-- Records of t_sys_normal_account
-- ----------------------------
INSERT INTO `t_sys_normal_account` (`ACCOUNT_ID`, `NAME`, `ALIAS`, `PASSWORD`, `SESSIONKEY`, `DESCRIPTION`, `USESTATE`, `ONLINESTATE`, `REGTIME`, `UPDATETIME`, `LOGINTIME`, `LOGNUM`, `USER_ID`) VALUES ('1', 'system', 'system', '1', null, null, '1', null, '1970-01-01 00:00:00.000000', '1970-01-01 00:00:00.000000', '1970-01-01 00:00:00.000000', null, '11'), ('310', '1453273547027', 'nur123', '1', '', '', '1', '', '2016-01-20 00:00:00.000000', '1970-01-01 00:00:00.000000', '1970-01-01 00:00:00.000000', '', '315'), ('311', '1453275076292', 'ven123', '1', null, null, '1', null, '2016-01-20 00:00:00.000000', null, null, null, '316');

-- ----------------------------
-- Records of t_sys_normal_user
-- ----------------------------
INSERT INTO `t_sys_normal_user` (`USER_ID`, `REALNAME`, `SEX`, `NATION`, `ADDRESS`, `BIRTH`, `TEL`, `EMAIL`, `TYPE`, `VENDORID`, `LOCID`, `REGTIME`, `UPDTIME`, `USESTATE`, `CARDID`, `DESCRIPT`, `FACCOUNT_ID`) VALUES ('11', '\'\';drop scm', '1', null, null, '2013-04-17 00:00:00.000000', '13919007855', 'zhouzhoumanman@gmail.com', '1', null, '62', '1970-01-01 00:00:00.000000', '1970-01-01 00:00:00.000000', '1', null, null, null), ('315', '张护士', '2', '女真', '', '1977-03-16 00:00:00.000000', '', '', '3', null, '112', '2016-01-20 00:00:00.000000', '1970-01-01 00:00:00.000000', '1', '', '', null), ('316', '周鑫', null, null, null, null, '13919007855', '908067886@qq.com', '2', '1', null, '2016-01-20 00:00:00.000000', null, '1', null, null, null);

-- ----------------------------
-- Records of t_sys_normalaccount_role
-- ----------------------------
INSERT INTO `t_sys_normalaccount_role` (`ACCOUNT_ID`, `ROLE_ID`) VALUES ('1', '25'), ('310', '65');

-- ----------------------------
-- Records of t_sys_role
-- ----------------------------
INSERT INTO `t_sys_role` (`DESCRIPTION`, `CODE`, `NAME`, `ROLE_ID`, `USESTATE`, `CREATETIME`) VALUES ('系统管理员', '1000', 'system', '25', '1', '2014-05-13 10:40:03.000000'), ('医院采购发订单使用', 'H001', '医院采购(药品)', '46', '1', '2014-06-10 00:00:00.000000'), ('供应商接收订单，回传电子发票', 'S001', '供应商开票', '47', '1', '2014-06-10 09:34:03.000000'), (null, 'H002', '医院采购(试剂)', '48', '1', '2014-06-12 11:30:04.000000'), ('护士选购病区消耗品', '护士采购', '护士采购', '65', '1', '2015-06-23 10:46:01.000000'), ('审核订单使用', '病区科主任', '病区科主任', '66', '1', '2015-06-23 11:48:01.000000'), ('审核订单使用', '计划科', '计划科', '67', '1', '2015-06-23 11:49:00.000000'), ('审核订单使用', '采购科', '采购科', '68', '1', '2015-06-23 11:49:03.000000');

-- ----------------------------
-- Records of t_sys_role_loc
-- ----------------------------

-- ----------------------------
-- Records of t_sys_taskconfig
-- ----------------------------

-- ----------------------------
-- Records of t_sys_user
-- ----------------------------
INSERT INTO `t_sys_user` (`user_id`, `user_name`, `user_email`) VALUES ('1', 'ccc333', null), ('3', 'fffffffff', null), ('4', '222', null), ('5', '222', null), ('6', '2', null), ('7', '2', null), ('8', '222', null), ('9', '123213123', null), ('10', '123213123', null), ('11', '让幅度十分大方地说', null), ('12', '让幅度十分大方地说', null), ('13', '123213333', null), ('24', '22312321', null), ('25', '4肉 ', null), ('26', '22', null), ('27', '3', null), ('28', '2222', null), ('29', '444', null), ('30', '3333', null), ('31', '3333', null), ('32', '3333', null), ('33', '8', null), ('34', '222', '22@qq.com'), ('35', '123321', '908067886@qq.com'), ('36', '/', '////@q.j'), ('37', null, null), ('38', null, null), ('39', null, null), ('40', null, null), ('41', null, null), ('42', null, null), ('43', null, null), ('44', null, null), ('45', '123', '123@11.com'), ('46', '123', '123@11.com'), ('47', '123', '123@11.com'), ('48', '123', '22@11.com');

-- ----------------------------
-- Records of t_sys_ven_role
-- ----------------------------

-- ----------------------------
-- Records of t_ven_deliver
-- ----------------------------

-- ----------------------------
-- Records of t_ven_deliveritm
-- ----------------------------

-- ----------------------------
-- Records of t_ven_delv
-- ----------------------------

-- ----------------------------
-- Records of t_ven_hop_inc
-- ----------------------------

-- ----------------------------
-- Records of t_ven_inc
-- ----------------------------

-- ----------------------------
-- Records of t_ven_inc_advice
-- ----------------------------

-- ----------------------------
-- Records of t_ven_inc_pic
-- ----------------------------

-- ----------------------------
-- Records of t_ven_inc_property
-- ----------------------------

-- ----------------------------
-- Records of t_ven_qualif
-- ----------------------------

-- ----------------------------
-- Records of t_ven_qualif_pic
-- ----------------------------

-- ----------------------------
-- Records of t_ven_qualif_type
-- ----------------------------
INSERT INTO `t_ven_qualif_type` (`VENQUALIFTYPE_ID`, `NAME`, `CODE`, `SEQ`, `TYPE`) VALUES ('1', 'GMP认证', 'GMP认证', '1', '日期'), ('2', 'ISO9000认证', 'ISO9000认证', '2', '日期');

-- ----------------------------
-- Records of t_ven_qualification
-- ----------------------------
INSERT INTO `t_ven_qualification` (`QUALIFICATION_ID`, `VENDOR_ID`, `REGDATE`, `EXPDATE`, `QUALIFY_TYPE_ID`, `QUALIFY_DESCRIPTION`) VALUES ('1', '1', null, '2016-01-22 00:00:00.000000', '1', null), ('2', '1', null, '2016-01-28 00:00:00.000000', '2', null);

-- ----------------------------
-- Records of t_ven_vendor
-- ----------------------------
INSERT INTO `t_ven_vendor` (`VEN_ID`, `CODE`, `NAME`, `PARENTID`, `ADDRESS`, `FAX`, `TEL`, `ACCOUNT`, `CONTACT`, `HISID`, `ALIAS`, `EMAIL`, `TAXATION`) VALUES ('1', 'ven123', 'ven123', null, '甘肃省兰州市城关区西关十字', '13919007855', '13919007855', 'ven123', '周鑫', null, 'ven123', '908067886@qq.com', 'ven123');

-- ----------------------------
-- Records of t_ven_vendor_log
-- ----------------------------
INSERT INTO `t_ven_vendor_log` (`ID`, `VENDORID`, `OPERATEID`, `OPERATEDATE`, `OPERATETYPE`, `OPERATEIP`, `OPERATENAME`, `OPCONTENT`, `OPUSERNAME`, `OPTITLE`) VALUES ('2c905762525dd8fc01525df1d7d80000', '1', null, '2016-01-20 15:31:16.000000', '增加', '127.0.0.1', null, ' GMP认证:2016-01-22 ISO9000认证:2016-01-28', 'ven123', null);

-- ----------------------------
-- Records of t_wx_depart
-- ----------------------------

-- ----------------------------
-- Records of t_wx_message
-- ----------------------------

-- ----------------------------
-- Records of t_wx_message_pic
-- ----------------------------

-- ----------------------------
-- Records of t_wx_user
-- ----------------------------
