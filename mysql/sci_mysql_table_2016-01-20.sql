/*
Navicat MySQL Data Transfer

Source Server         : mysql_localhost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : sci

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-01-20 15:35:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_app_log
-- ----------------------------
DROP TABLE IF EXISTS `t_app_log`;
CREATE TABLE `t_app_log` (
  `LOG_ID` int(11) NOT NULL AUTO_INCREMENT,
  `AUDIT_ROOT_DEAL_CODE` varchar(250) DEFAULT NULL,
  `CURRENT_DEAL_CODE` varchar(250) DEFAULT NULL,
  `DEAL_END_TIME` datetime(6) DEFAULT NULL,
  `DEAL_MODE` varchar(50) DEFAULT NULL,
  `DEAL_START_TIME` datetime(6) DEFAULT NULL,
  `DEAL_STATUS` varchar(50) DEFAULT NULL,
  `INPUT_CONTENT` text,
  `LOG_END_TIME` datetime(6) DEFAULT NULL,
  `LOG_START_TIME` datetime(6) DEFAULT NULL,
  `LOG_TYPE` varchar(100) DEFAULT NULL,
  `OPERATE_ACCOUNT` text,
  `OPERATE_DESCRIPTION` text,
  `OPERATE_GATEWAY_ID` varchar(64) DEFAULT NULL,
  `OPERATE_IP` varchar(64) DEFAULT NULL,
  `OPERATE_ORG_CODE` varchar(64) DEFAULT NULL,
  `OPERATE_ROLE` varchar(64) DEFAULT NULL,
  `OPERATE_TABLE` varchar(64) DEFAULT NULL,
  `OUTPUT_CONTENT` varchar(64) DEFAULT NULL,
  `PARENT_DEAL_CODE` varchar(64) DEFAULT NULL,
  `RECORD_GATEWAY_ID` varchar(64) DEFAULT NULL,
  `ROOT_DEAL_CODE` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`LOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_app_log_audit
-- ----------------------------
DROP TABLE IF EXISTS `t_app_log_audit`;
CREATE TABLE `t_app_log_audit` (
  `AUDIT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DEAL_END_TIME` datetime(6) DEFAULT NULL,
  `DEAL_START_TIME` datetime(6) DEFAULT NULL,
  `DEAL_STATUS` varchar(255) DEFAULT NULL,
  `LOG_NUM` varchar(250) DEFAULT NULL,
  `LOG_TYPE` varchar(250) DEFAULT NULL,
  `OPERATE_ACCOUNT` varchar(250) DEFAULT NULL,
  `OPERATE_DESCRIPTION` varchar(250) DEFAULT NULL,
  `OPERATE_IP` varchar(250) DEFAULT NULL,
  `OPERATE_ORG_CODE` varchar(250) DEFAULT NULL,
  `OPERATE_ROLE` varchar(250) DEFAULT NULL,
  `ROOT_DEAL_CODE` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`AUDIT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_cat_druggroup
-- ----------------------------
DROP TABLE IF EXISTS `t_cat_druggroup`;
CREATE TABLE `t_cat_druggroup` (
  `SDG_CODE` varchar(200) DEFAULT NULL,
  `SDG_DESC` varchar(200) DEFAULT NULL,
  `SDG_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SDG_PARREF_ID` int(11) NOT NULL,
  PRIMARY KEY (`SDG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_cat_druggroupitm
-- ----------------------------
DROP TABLE IF EXISTS `t_cat_druggroupitm`;
CREATE TABLE `t_cat_druggroupitm` (
  `SDGI_ID` decimal(65,30) NOT NULL,
  `SDGI_PARREF_ID` decimal(65,30) DEFAULT NULL,
  `SDGI_CODE` varchar(200) DEFAULT NULL,
  `SDGI_DESC` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`SDGI_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_cat_group
-- ----------------------------
DROP TABLE IF EXISTS `t_cat_group`;
CREATE TABLE `t_cat_group` (
  `SG_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SG_CODE` varchar(200) DEFAULT NULL,
  `SG_DESC` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`SG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_cat_groupproperty
-- ----------------------------
DROP TABLE IF EXISTS `t_cat_groupproperty`;
CREATE TABLE `t_cat_groupproperty` (
  `GRP_PRO_ID` int(11) NOT NULL AUTO_INCREMENT,
  `GRP_PARREFID` decimal(65,30) DEFAULT NULL,
  `GRP_PRO_DESC` varchar(200) DEFAULT NULL,
  `GRP_PRO_PARREFID` int(11) DEFAULT NULL,
  PRIMARY KEY (`GRP_PRO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_cat_property
-- ----------------------------
DROP TABLE IF EXISTS `t_cat_property`;
CREATE TABLE `t_cat_property` (
  `PRO_ID` tinyint(4) NOT NULL AUTO_INCREMENT,
  `PRO_CODE` varchar(200) DEFAULT NULL,
  `PRO_NAME` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`PRO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_hop_ctloc
-- ----------------------------
DROP TABLE IF EXISTS `t_hop_ctloc`;
CREATE TABLE `t_hop_ctloc` (
  `ID` smallint(6) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(50) DEFAULT NULL COMMENT 'code',
  `NAME` varchar(50) DEFAULT NULL COMMENT 'name',
  `HOSPID` decimal(65,30) DEFAULT NULL COMMENT '医院Id',
  `HISID` decimal(65,30) DEFAULT NULL COMMENT 'his里科室Id',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科室';

-- ----------------------------
-- Table structure for t_hop_elesub
-- ----------------------------
DROP TABLE IF EXISTS `t_hop_elesub`;
CREATE TABLE `t_hop_elesub` (
  `ELE_ORD_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ELE_PROPERTY_ID` int(11) DEFAULT NULL,
  `ELE_SUB_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ELE_ORD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_hop_evalute
-- ----------------------------
DROP TABLE IF EXISTS `t_hop_evalute`;
CREATE TABLE `t_hop_evalute` (
  `ELE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ELE_HOSPID` tinyint(4) DEFAULT NULL COMMENT '医院Id',
  `ELE_ORDERID` int(11) DEFAULT NULL COMMENT '订单Id',
  `ELE_DATE` datetime(6) DEFAULT NULL COMMENT '评价时间',
  `ELE_USERID` int(11) DEFAULT NULL COMMENT '评价人',
  `ELE_VENDORID` int(11) DEFAULT NULL COMMENT '评价供应商',
  `ELE_RESULT` char(1) DEFAULT NULL COMMENT '评价结果(1:好评，2：一般，3：差评)',
  `ELE_CONTENT` text COMMENT '评价内容',
  `ELE_DESCRIPTION` char(1) DEFAULT NULL COMMENT '付款速度',
  `ELE_SPEED` char(1) DEFAULT NULL COMMENT '收货速度',
  `ELE_VENINCID` int(11) DEFAULT NULL,
  `ELE_SERVICE` char(1) DEFAULT NULL,
  PRIMARY KEY (`ELE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='医院评价表';

-- ----------------------------
-- Table structure for t_hop_inc
-- ----------------------------
DROP TABLE IF EXISTS `t_hop_inc`;
CREATE TABLE `t_hop_inc` (
  `INC_CODE` varchar(50) DEFAULT NULL COMMENT '代码',
  `INC_NAME` varchar(250) DEFAULT NULL COMMENT '名称',
  `INC_UOMCODE` varchar(100) DEFAULT NULL COMMENT '单位代码',
  `INC_UOMNAME` varchar(100) DEFAULT NULL COMMENT '单位名称',
  `INC_BUOMCODE` varchar(100) DEFAULT NULL COMMENT '小单位代码',
  `INC_BUOMNAME` varchar(100) DEFAULT NULL COMMENT '小单位名称',
  `INC_FAC` float(11,4) DEFAULT NULL COMMENT '系数',
  `INC_MANFID` int(11) DEFAULT NULL COMMENT '厂商Id',
  `INC_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `INC_HISSYSID` int(11) DEFAULT NULL COMMENT 'his系统药品ID',
  `INC_HOSPID` tinyint(4) DEFAULT NULL COMMENT '医院ID',
  `INC_RP` float(11,4) DEFAULT NULL COMMENT '进价',
  `INC_SPEC` varchar(100) DEFAULT NULL COMMENT '规格',
  `INC_CAT` varchar(100) DEFAULT NULL COMMENT '库存分类',
  `INC_SP` float(11,4) DEFAULT NULL COMMENT '售价',
  `INC_AUDITFLAG` char(1) DEFAULT NULL,
  PRIMARY KEY (`INC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='医院药品信息';

-- ----------------------------
-- Table structure for t_hop_incalias
-- ----------------------------
DROP TABLE IF EXISTS `t_hop_incalias`;
CREATE TABLE `t_hop_incalias` (
  `INCALIAS_ID` char(32) NOT NULL,
  `INCALIAS_TEXT` varchar(50) DEFAULT NULL,
  `INCALIAS_INCID` int(11) DEFAULT NULL,
  PRIMARY KEY (`INCALIAS_ID`),
  KEY `FK_INCALIAS_TEXT` (`INCALIAS_TEXT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_hop_inc_loc
-- ----------------------------
DROP TABLE IF EXISTS `t_hop_inc_loc`;
CREATE TABLE `t_hop_inc_loc` (
  `INCLOC_PARREFID` int(11) DEFAULT NULL,
  `INCLOC_LOCID` int(11) DEFAULT NULL,
  `INCLOC_ID` int(11) NOT NULL AUTO_INCREMENT,
  `INCLOC_QTY` decimal(11,2) DEFAULT NULL,
  `INCLOC_MAXQTY` decimal(11,2) DEFAULT NULL,
  `INCLOC_MINQTY` decimal(11,2) DEFAULT NULL,
  `INCLOC_STANDQTY` decimal(11,2) DEFAULT NULL,
  PRIMARY KEY (`INCLOC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_hop_inc_news
-- ----------------------------
DROP TABLE IF EXISTS `t_hop_inc_news`;
CREATE TABLE `t_hop_inc_news` (
  `INCNEWS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `INCNEWS_TITLE` varchar(200) DEFAULT NULL,
  `INCNEWS_USERID` int(11) DEFAULT NULL,
  `INCNEWS_PATH` varchar(200) DEFAULT NULL,
  `INCNEWS_DATE` datetime DEFAULT NULL,
  `INCNEWS_TYPE` char(1) DEFAULT NULL,
  `INCNEWS_READCOUNT` int(11) DEFAULT NULL,
  `INCNEWS_CONTENT` longtext,
  PRIMARY KEY (`INCNEWS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_hop_inc_pic
-- ----------------------------
DROP TABLE IF EXISTS `t_hop_inc_pic`;
CREATE TABLE `t_hop_inc_pic` (
  `INC_PIC_ID` int(11) NOT NULL AUTO_INCREMENT,
  `INC_PIC_INCID` decimal(10,0) DEFAULT NULL COMMENT '父表Id',
  `INC_PIC_PATH` int(255) DEFAULT NULL COMMENT '路径',
  `INC_PIC_SEQ` int(11) DEFAULT NULL COMMENT '显示顺序',
  PRIMARY KEY (`INC_PIC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='药品图片表';

-- ----------------------------
-- Table structure for t_hop_manf
-- ----------------------------
DROP TABLE IF EXISTS `t_hop_manf`;
CREATE TABLE `t_hop_manf` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(50) DEFAULT NULL COMMENT '代码',
  `NAME` varchar(50) DEFAULT NULL COMMENT '名称',
  `HISID` decimal(65,30) DEFAULT NULL COMMENT 'his里厂商Id',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='厂商Id';

-- ----------------------------
-- Table structure for t_hop_vendor
-- ----------------------------
DROP TABLE IF EXISTS `t_hop_vendor`;
CREATE TABLE `t_hop_vendor` (
  `H_VENID` int(11) NOT NULL AUTO_INCREMENT,
  `H_CODE` varchar(150) DEFAULT NULL,
  `H_NAME` varchar(150) DEFAULT NULL,
  `H_PARENTID` int(11) DEFAULT NULL,
  `H_ADDRESS` varchar(255) DEFAULT NULL,
  `H_FAX` varchar(50) DEFAULT NULL,
  `H_TEL` varchar(50) DEFAULT NULL,
  `H_ACCOUNT` varchar(50) DEFAULT NULL,
  `H_CONTACT` varchar(50) DEFAULT NULL,
  `H_VENDORID` int(11) DEFAULT NULL,
  `H_ALIAS` varchar(150) DEFAULT NULL COMMENT '别名',
  `H_HOPID` int(11) DEFAULT NULL COMMENT '医院ID',
  `H_TYPE` varchar(50) DEFAULT NULL COMMENT '供应商类别',
  `H_EMAIL` varchar(150) DEFAULT NULL COMMENT '邮箱',
  `H_SEND` varchar(255) DEFAULT NULL COMMENT '发货地点',
  `H_AUDITFLAG` char(1) DEFAULT NULL,
  PRIMARY KEY (`H_VENID`),
  KEY `FK_VENDORID` (`H_VENDORID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_log_configure
-- ----------------------------
DROP TABLE IF EXISTS `t_log_configure`;
CREATE TABLE `t_log_configure` (
  `LOG_ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOG_TITLE` varchar(100) DEFAULT NULL,
  `LOG_METHOD` text,
  `LOG_ARGS` text,
  `LOG_UPDATEDATE` datetime(6) DEFAULT NULL,
  `LOG_INSERTDATE` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`LOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_ord_exestate
-- ----------------------------
DROP TABLE IF EXISTS `t_ord_exestate`;
CREATE TABLE `t_ord_exestate` (
  `EXESTATE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ORD_ID` int(11) DEFAULT NULL COMMENT '订单id(t_ord_order)',
  `STATE_ID` int(11) DEFAULT NULL COMMENT '状态id(t_ord_state)',
  `EXEDATE` datetime(6) DEFAULT NULL COMMENT '操作日期',
  `USER_ID` int(11) DEFAULT NULL COMMENT '操作人',
  `TEL` varchar(255) DEFAULT NULL COMMENT '联系电话',
  `REMARK` text COMMENT '备注',
  `DELIVER_ID` int(11) DEFAULT NULL COMMENT '发货单ID',
  PRIMARY KEY (`EXESTATE_ID`),
  KEY `FK_ORD_ID` (`ORD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单执行表';

-- ----------------------------
-- Table structure for t_ord_label
-- ----------------------------
DROP TABLE IF EXISTS `t_ord_label`;
CREATE TABLE `t_ord_label` (
  `LABEL_ID` char(32) NOT NULL,
  `LABEL_PARENT_ID` char(32) DEFAULT NULL,
  `LABEL_STATUS` char(1) DEFAULT NULL,
  `LABEL_INGDREC_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`LABEL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_ord_ord
-- ----------------------------
DROP TABLE IF EXISTS `t_ord_ord`;
CREATE TABLE `t_ord_ord` (
  `ORD_ID` varchar(32) DEFAULT NULL,
  `ORD_DATE` datetime(6) DEFAULT NULL,
  `ORD_HOP_ID` decimal(65,30) DEFAULT NULL,
  `ORD_LOC_ID` decimal(65,30) DEFAULT NULL,
  `ORD_NO` varchar(100) DEFAULT NULL,
  `ORD_CMPFLAG` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_ord_order
-- ----------------------------
DROP TABLE IF EXISTS `t_ord_order`;
CREATE TABLE `t_ord_order` (
  `ORDER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `HOP_ID` tinyint(4) DEFAULT NULL,
  `ORDER_NO` varchar(250) DEFAULT NULL,
  `EMFLAG` varchar(50) DEFAULT NULL,
  `PLANARRDATE` datetime(6) DEFAULT NULL,
  `DELIVERYDATE` datetime(6) DEFAULT NULL,
  `VENDOR_ID` int(11) DEFAULT NULL,
  `PLANDATE` datetime(6) DEFAULT NULL,
  `REMARK` text,
  `EXESTATE_ID` int(11) DEFAULT NULL,
  `RECLOC` int(11) DEFAULT NULL COMMENT '收货科室',
  `RECDESTINATION` int(11) DEFAULT NULL COMMENT '收货地址',
  `CREATEUSER` int(11) DEFAULT NULL COMMENT '建单人',
  `PURLOC` int(11) DEFAULT NULL COMMENT '采购科室',
  `ORD_FLAG` decimal(65,30) DEFAULT NULL COMMENT '1:部分发货,2:全部发货',
  `SENDFLAG` varchar(5) DEFAULT NULL COMMENT '1,已发送',
  `ORDER_SERIAL` varchar(250) DEFAULT NULL COMMENT '订单流水号',
  PRIMARY KEY (`ORDER_ID`),
  KEY `PK_ORDER_HOP` (`HOP_ID`),
  KEY `PK_ORDER_VENDOR` (`VENDOR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单主表';

-- ----------------------------
-- Table structure for t_ord_orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `t_ord_orderdetail`;
CREATE TABLE `t_ord_orderdetail` (
  `ORDER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ORDER_HOP_ID` int(11) DEFAULT NULL,
  `ORDER_NO` varchar(100) DEFAULT NULL,
  `ORDER_VEN_ID` int(11) DEFAULT NULL,
  `ORDER_HOP_INC_ID` int(11) DEFAULT NULL,
  `ORDER_VEN_INC_ID` int(11) DEFAULT NULL,
  `ORDER_HOP_UOM` varchar(10) DEFAULT NULL,
  `ORDER_VEN_UOM` varchar(10) DEFAULT NULL,
  `ORDER_HOP_QTY` decimal(11,4) DEFAULT NULL,
  `ORDER_VEN_QTY` decimal(11,4) DEFAULT NULL,
  `ORDER_REC_QTY` decimal(11,4) DEFAULT NULL,
  `ORDER_RP` decimal(11,4) DEFAULT NULL,
  `ORDER_RECLOC` int(11) DEFAULT NULL,
  `ORDER_RECDESTINATION` int(11) DEFAULT NULL,
  `ORDER_USER_ID` int(11) DEFAULT NULL,
  `ORDER_ODATE` datetime(6) DEFAULT NULL,
  `ORDER_FAC` double DEFAULT NULL,
  `ORDER_STATE` int(11) DEFAULT NULL,
  `ORDER_HISNO` varchar(100) DEFAULT NULL,
  `ORDER_EMFLAG` char(1) DEFAULT NULL,
  `ORDER_IMP_ID` varchar(100) DEFAULT NULL,
  `ORDER_PUR_LOC` decimal(65,30) DEFAULT NULL,
  `ORDER_SENDFLAG` char(1) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_ord_orderdetailsub
-- ----------------------------
DROP TABLE IF EXISTS `t_ord_orderdetailsub`;
CREATE TABLE `t_ord_orderdetailsub` (
  `ORDSUB_ID` char(32) NOT NULL,
  `ORDSUB_DETAIL_ID` int(11) DEFAULT NULL,
  `ORDSUB_INVNO` varchar(200) DEFAULT NULL,
  `ORDSUB_BATNO` varchar(200) DEFAULT NULL,
  `ORDSUB_EXPDATE` datetime(6) DEFAULT NULL,
  `ORDSUB_USERID` int(65) DEFAULT NULL,
  `ORDSUB_DATE` datetime(6) DEFAULT NULL,
  `ORDSUB_STATUS` char(1) DEFAULT NULL,
  `ORDSUB_QTY` decimal(11,4) DEFAULT NULL,
  `ORDSUB_RP` decimal(11,4) DEFAULT NULL,
  `ORDSUB_PRINTFLAG` char(1) DEFAULT NULL,
  `ORDSUB_RPAMT` decimal(11,4) DEFAULT NULL,
  `ORDSUB_HIS_QTY` decimal(11,4) DEFAULT NULL,
  `ORDSUB_HIS_RP` decimal(11,4) DEFAULT NULL,
  `ORDSUB_IMP_ID` varchar(100) DEFAULT NULL,
  `ORDSUB_INGDREC_DATE` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`ORDSUB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_ord_orderitm
-- ----------------------------
DROP TABLE IF EXISTS `t_ord_orderitm`;
CREATE TABLE `t_ord_orderitm` (
  `ORDERITM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ORD_ID` int(11) DEFAULT NULL,
  `INC_ID` int(11) DEFAULT NULL,
  `UOM` varchar(255) DEFAULT NULL COMMENT '单位',
  `REQQTY` decimal(11,4) DEFAULT NULL COMMENT '请求数量',
  `DELIVERQTY` decimal(11,4) DEFAULT NULL COMMENT '以发货数量',
  `RP` decimal(11,4) DEFAULT NULL COMMENT '进价',
  `RECLOC` int(11) DEFAULT NULL COMMENT '收货科室',
  `RECDESTINATION` int(65) DEFAULT NULL COMMENT '收货地址',
  `FLAG` decimal(65,30) DEFAULT NULL COMMENT '1,部分发货,2，全部发货',
  `VENUOM` varchar(50) DEFAULT NULL COMMENT '供应商药品单位',
  `VENUOMREQQTY` decimal(11,4) DEFAULT NULL COMMENT '供应商单数数量',
  `VENUOMRP` decimal(11,4) DEFAULT NULL COMMENT '供应商单位进价',
  `FAC` decimal(11,4) DEFAULT NULL COMMENT '供应商单位到医院单位系数',
  PRIMARY KEY (`ORDERITM_ID`),
  KEY `FK_ORDER_ID` (`ORD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单明细表';

-- ----------------------------
-- Table structure for t_ord_plan
-- ----------------------------
DROP TABLE IF EXISTS `t_ord_plan`;
CREATE TABLE `t_ord_plan` (
  `PLAN_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PLAN_DATE` datetime(6) DEFAULT NULL,
  `PLAN_FLAG` char(1) DEFAULT NULL,
  `PLAN_NO` varchar(200) DEFAULT NULL,
  `PLAN_CTLOC` int(11) DEFAULT NULL,
  `PLAN_USERID` int(11) DEFAULT NULL,
  `PLAN_INCID` int(11) DEFAULT NULL,
  `PLAN_VENINCID` int(11) DEFAULT NULL,
  `PLAN_VENDORID` int(11) DEFAULT NULL,
  `PLAN_QTY` decimal(11,4) DEFAULT NULL,
  PRIMARY KEY (`PLAN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_ord_shopping
-- ----------------------------
DROP TABLE IF EXISTS `t_ord_shopping`;
CREATE TABLE `t_ord_shopping` (
  `SHOP_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SHOP_HOP_INCID` int(65) DEFAULT NULL,
  `SHOP_QTY` decimal(10,4) DEFAULT NULL,
  `SHOP_UOM` varchar(50) DEFAULT NULL,
  `SHOP_USERID` int(11) DEFAULT NULL,
  `SHOP_CHECKFLAG` int(11) DEFAULT NULL,
  `SHOP_VEN_INCID` int(11) DEFAULT NULL,
  `SHOP_RP` decimal(10,4) DEFAULT NULL,
  `SHOP_NAME` varchar(100) DEFAULT NULL,
  `SHOP_VENDORID` int(11) DEFAULT NULL,
  PRIMARY KEY (`SHOP_ID`),
  KEY `PK_ORD_SHOPUSER` (`SHOP_USERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车';

-- ----------------------------
-- Table structure for t_ord_state
-- ----------------------------
DROP TABLE IF EXISTS `t_ord_state`;
CREATE TABLE `t_ord_state` (
  `STATE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `STATE_CODE` varchar(255) DEFAULT NULL,
  `STATE_NAME` varchar(255) DEFAULT NULL,
  `STATE_SEQ` int(11) DEFAULT NULL,
  PRIMARY KEY (`STATE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='订单状态表';

-- ----------------------------
-- Table structure for t_sys_appno
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_appno`;
CREATE TABLE `t_sys_appno` (
  `APPNO_PRE` varchar(20) DEFAULT NULL,
  `APPNO_ID` int(11) NOT NULL AUTO_INCREMENT,
  `APPNO_COUNT` int(11) DEFAULT NULL,
  `APPNO_DATE` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`APPNO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_sys_app_param
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_app_param`;
CREATE TABLE `t_sys_app_param` (
  `APP_CODE` varchar(200) DEFAULT NULL,
  `APP_DESCRIPTION` text,
  `APP_HOSPID` int(11) DEFAULT NULL,
  `APP_VALUE` varchar(50) DEFAULT NULL,
  `APP_ID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`APP_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_sys_ctloc
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_ctloc`;
CREATE TABLE `t_sys_ctloc` (
  `CTLOC_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CTLOC_CODE` varchar(150) DEFAULT NULL COMMENT 'code',
  `CTLOC_NAME` varchar(150) DEFAULT NULL COMMENT 'name',
  `CTLOC_HOSPID` int(11) DEFAULT NULL COMMENT '医院Id',
  `CTLOC_HISID` int(11) DEFAULT NULL COMMENT 'his里科室Id',
  `CTLOC_TYPE` varchar(50) DEFAULT NULL COMMENT '1:入库科室，2:收货科室,3:全部',
  `CTLOC_DEST` int(11) DEFAULT NULL COMMENT '默认收货地址',
  PRIMARY KEY (`CTLOC_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=utf8 COMMENT='科室';

-- ----------------------------
-- Table structure for t_sys_ctloc_destination
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_ctloc_destination`;
CREATE TABLE `t_sys_ctloc_destination` (
  `CTLOCDES_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CTLOCDES_CTLOCDR` int(11) DEFAULT NULL COMMENT '科室Id',
  `CTLOCDES_DESTINATION` text COMMENT '收货地点',
  `CTLOCDES_TEL` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `CTLOCDES_MAIL` text,
  `CTLOCDES_CONTACT` int(11) DEFAULT NULL COMMENT '联系人t_sys_normal_user',
  `CTLOCDES_CONTACT2` varchar(10) DEFAULT NULL,
  `CTLOCDES_CODE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CTLOCDES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科室收货地点';

-- ----------------------------
-- Table structure for t_sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_dict`;
CREATE TABLE `t_sys_dict` (
  `DIC_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DIC_NAME` varchar(100) DEFAULT NULL,
  `DIC_TYPE` varchar(100) DEFAULT NULL,
  `DIC_VALUE` int(11) DEFAULT NULL,
  PRIMARY KEY (`DIC_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COMMENT='系统字典表';

-- ----------------------------
-- Table structure for t_sys_func
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_func`;
CREATE TABLE `t_sys_func` (
  `FUNC_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SEQ` int(11) DEFAULT NULL,
  `IMGURL` varchar(200) DEFAULT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `PARENTID` int(11) DEFAULT NULL,
  `LEAF` char(1) DEFAULT NULL,
  `FUNC` varchar(100) DEFAULT NULL,
  `URL` varchar(200) DEFAULT NULL,
  `BACKCOLOR` varchar(100) DEFAULT NULL,
  `USESTATE` int(11) DEFAULT NULL COMMENT '使用状态',
  PRIMARY KEY (`FUNC_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21226 DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Table structure for t_sys_func_role
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_func_role`;
CREATE TABLE `t_sys_func_role` (
  `FUNC_ID` int(11) DEFAULT NULL,
  `ROLE_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_sys_hospital
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_hospital`;
CREATE TABLE `t_sys_hospital` (
  `HOSPITAL_ID` int(11) NOT NULL AUTO_INCREMENT,
  `HOSPITAL_CODE` varchar(50) DEFAULT NULL COMMENT 'code',
  `HOSPITAL_NAME` varchar(50) DEFAULT NULL COMMENT 'name',
  `HOSPITAL_HISDR` decimal(65,30) DEFAULT NULL COMMENT 'his中的医院id',
  `HOSPITAL_DESTINATION` text COMMENT '地址',
  PRIMARY KEY (`HOSPITAL_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='医院';

-- ----------------------------
-- Table structure for t_sys_impmodel
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_impmodel`;
CREATE TABLE `t_sys_impmodel` (
  `IMPMODEL_ID` int(11) NOT NULL AUTO_INCREMENT,
  `IMPMODEL_TYPE` varchar(50) DEFAULT NULL,
  `IMPMODEL_NAME` varchar(250) DEFAULT NULL,
  `IMPMODEL_SEQ` tinyint(11) DEFAULT NULL,
  `IMPMODEL_CODE` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`IMPMODEL_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=422 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_sys_log
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_log`;
CREATE TABLE `t_sys_log` (
  `ID` varchar(32) NOT NULL COMMENT 'id',
  `OPUSER` varchar(100) DEFAULT NULL COMMENT '操作人',
  `OPTYPE` varchar(100) DEFAULT NULL COMMENT '操作类型',
  `OPDATE` datetime(6) DEFAULT NULL COMMENT '操作时间',
  `OPIP` varchar(100) DEFAULT NULL COMMENT '操作ip',
  `OPNAME` varchar(100) DEFAULT NULL COMMENT '操作名称',
  `OPBEFORE` text COMMENT '操作前数据',
  `OPAFTER` text COMMENT '操作后数据',
  `OPRESULT` text COMMENT '结果',
  `OPARG` longtext COMMENT '参数',
  `OPRESULTS` longtext COMMENT '结果',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统日志表';

-- ----------------------------
-- Table structure for t_sys_normalaccount_role
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_normalaccount_role`;
CREATE TABLE `t_sys_normalaccount_role` (
  `ACCOUNT_ID` int(11) DEFAULT NULL,
  `ROLE_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_sys_normal_account
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_normal_account`;
CREATE TABLE `t_sys_normal_account` (
  `ACCOUNT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) DEFAULT NULL,
  `ALIAS` varchar(100) DEFAULT NULL,
  `PASSWORD` varchar(100) DEFAULT NULL,
  `SESSIONKEY` varchar(100) DEFAULT NULL COMMENT '描述',
  `DESCRIPTION` text COMMENT '描述',
  `USESTATE` char(1) DEFAULT NULL COMMENT '使用状态',
  `ONLINESTATE` char(1) DEFAULT NULL COMMENT '在线状态',
  `REGTIME` datetime(6) DEFAULT NULL COMMENT '增加时间',
  `UPDATETIME` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `LOGINTIME` datetime(6) DEFAULT NULL COMMENT '登录时间',
  `LOGNUM` text COMMENT '登录次数',
  `USER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ACCOUNT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=312 DEFAULT CHARSET=utf8 COMMENT='登录帐号';

-- ----------------------------
-- Table structure for t_sys_normal_user
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_normal_user`;
CREATE TABLE `t_sys_normal_user` (
  `USER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `REALNAME` text COMMENT '真实姓名',
  `SEX` text COMMENT '性别',
  `NATION` text COMMENT '名族',
  `ADDRESS` text COMMENT '家庭地址',
  `BIRTH` datetime(6) DEFAULT NULL COMMENT '生日',
  `TEL` text COMMENT '电话',
  `EMAIL` text COMMENT '电子邮箱',
  `TYPE` char(1) DEFAULT NULL COMMENT '人员类型(0,工作，1医院,2,供应商)',
  `VENDORID` int(11) DEFAULT NULL COMMENT '供应商rowid',
  `LOCID` int(11) DEFAULT NULL COMMENT '科室rowid',
  `REGTIME` datetime(6) DEFAULT NULL COMMENT '增加时间',
  `UPDTIME` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `USESTATE` char(1) DEFAULT NULL COMMENT '使用状态',
  `CARDID` text COMMENT '身份证',
  `DESCRIPT` text COMMENT '描述',
  `FACCOUNT_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=317 DEFAULT CHARSET=utf8 COMMENT='用户明细信息表';

-- ----------------------------
-- Table structure for t_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role`;
CREATE TABLE `t_sys_role` (
  `DESCRIPTION` text,
  `CODE` varchar(100) DEFAULT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `ROLE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USESTATE` varchar(100) DEFAULT NULL,
  `CREATETIME` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Table structure for t_sys_role_loc
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role_loc`;
CREATE TABLE `t_sys_role_loc` (
  `SYS_ROLE_LOC_ID` char(32) NOT NULL,
  `SYS_ROLE_ID` int(11) DEFAULT NULL,
  `SYS_LOC_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`SYS_ROLE_LOC_ID`),
  KEY `I_SYS_LOC_ID` (`SYS_LOC_ID`),
  KEY `I_SYS_ROLE_ID` (`SYS_ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_sys_taskconfig
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_taskconfig`;
CREATE TABLE `t_sys_taskconfig` (
  `TASK_ID` char(32) DEFAULT NULL,
  `END_TIME` datetime(6) DEFAULT NULL,
  `ID_TYPE` varchar(10) DEFAULT NULL,
  `ID_VALUE` varchar(10) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `JOB_NAME` varchar(250) DEFAULT NULL,
  `START_TIME` datetime(6) DEFAULT NULL,
  `TASK_CLASS` varchar(250) DEFAULT NULL,
  `TASK_DESCRIPTION` text,
  `TASK_STATUS` varchar(10) DEFAULT NULL,
  `TIME_PERIOD` varchar(10) DEFAULT NULL,
  `TIME_PERIOD_TYPE` varchar(10) DEFAULT NULL,
  `TRIGGER_GROUP` varchar(200) DEFAULT NULL,
  `TRIGGER_NAME` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user`;
CREATE TABLE `t_sys_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_sys_ven_role
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_ven_role`;
CREATE TABLE `t_sys_ven_role` (
  `SYS_VEN_ROLE_ID` char(32) NOT NULL,
  `SYS_VEN_ID` int(11) DEFAULT NULL,
  `SYS_ROLE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`SYS_VEN_ROLE_ID`),
  KEY `I_SYS_VENDROLE_ROLE` (`SYS_ROLE_ID`),
  KEY `I_SYS_VENROLE_VEN` (`SYS_VEN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_ven_deliver
-- ----------------------------
DROP TABLE IF EXISTS `t_ven_deliver`;
CREATE TABLE `t_ven_deliver` (
  `DELIVER_ROWID` int(11) NOT NULL AUTO_INCREMENT,
  `DELIVER_VENDORID` decimal(65,30) DEFAULT NULL COMMENT '发货供应商',
  `DELIVER_HOPID` decimal(65,30) DEFAULT NULL COMMENT '收货医院ID',
  `DELIVER_PURLOC` decimal(65,30) DEFAULT NULL COMMENT '入库科室',
  `DELIVER_RECLOC` decimal(65,30) DEFAULT NULL COMMENT '收货科室',
  `DELIVER_ORDERID` decimal(65,30) DEFAULT NULL COMMENT '订单表',
  `DELIVER_DESTINATIONID` decimal(65,30) DEFAULT NULL COMMENT '收货地址',
  `DELIVER_USERID` decimal(65,30) DEFAULT NULL COMMENT '发货人',
  `DELIVER_RECUSERID` decimal(65,30) DEFAULT NULL COMMENT '收货人',
  `DELIVER_DATE` datetime(6) DEFAULT NULL COMMENT '发货日期',
  `DELIVER_ARRDATE` datetime(6) DEFAULT NULL COMMENT '计划到达日期',
  `DELIVER_RECDATE` datetime(6) DEFAULT NULL COMMENT '收货日期',
  `DELIVER_EXESTATEID` decimal(65,30) DEFAULT NULL COMMENT '发货执行状态',
  `DELIVER_REMARK` varchar(250) DEFAULT NULL COMMENT '备注',
  `DELIVER_ACCPECTDATE` datetime(6) DEFAULT NULL COMMENT '接受订单时间',
  `DELIVER_ACCPUSERID` decimal(65,30) DEFAULT NULL COMMENT '接收订单人',
  `DELIVER_HOPVENDORID` decimal(65,30) DEFAULT NULL COMMENT '发货供应商医院供应商t_hop_vendor',
  `DELIVER_WPSID` varchar(200) DEFAULT NULL COMMENT '供应商ID',
  `DELIVER_NO` varchar(200) DEFAULT NULL COMMENT '一次发货单号',
  PRIMARY KEY (`DELIVER_ROWID`),
  KEY `I_DELIVER_HOP_ID` (`DELIVER_HOPID`),
  KEY `I_DELIVER_ORD_ID` (`DELIVER_ORDERID`),
  KEY `I_DELIVER_PUR_ID` (`DELIVER_PURLOC`),
  KEY `I_DELIVER_REC_ID` (`DELIVER_RECLOC`),
  KEY `I_DELIVER_VENDOR_ID` (`DELIVER_VENDORID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发货主表';

-- ----------------------------
-- Table structure for t_ven_deliveritm
-- ----------------------------
DROP TABLE IF EXISTS `t_ven_deliveritm`;
CREATE TABLE `t_ven_deliveritm` (
  `DELIVERITM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DELIVERITM_PARENTID` int(11) DEFAULT NULL COMMENT '父表ID',
  `DELIVERITM_ORDERITMID` decimal(65,30) DEFAULT NULL COMMENT '订单子表ID',
  `DELIVERITM_QTY` decimal(65,30) DEFAULT NULL COMMENT '发货数量(供应商单位)',
  `DELIVERITM_HOPINCID` decimal(65,30) DEFAULT NULL COMMENT '医院药品id',
  `DELIVERITM_VENINCID` decimal(65,30) DEFAULT NULL COMMENT '供应商药品id',
  `DELIVERITM_RP` decimal(65,30) DEFAULT NULL COMMENT '进价(供应商单位)',
  `DELIVERITM_BATNO` varchar(200) DEFAULT NULL COMMENT '批号',
  `DELIVERITM_EXPDATE` datetime(6) DEFAULT NULL COMMENT '效期',
  `DELIVERITM_INVNOE` varchar(200) DEFAULT NULL COMMENT '发票号',
  `DELIVERITM_UOM` varchar(200) DEFAULT NULL COMMENT '单位',
  `DELIVERITM_RPAMT` decimal(65,30) DEFAULT NULL COMMENT '金额(供应商单位)',
  `DELIVERITM_HISQTY` decimal(65,30) DEFAULT NULL COMMENT '医院单位数量',
  `DELIVERITM_HISRP` decimal(65,30) DEFAULT NULL COMMENT '医院单位进价',
  `DELIVERITM_HISUOM` varchar(100) DEFAULT NULL COMMENT '医院单位',
  `DELIVERITM_FAC` decimal(65,30) DEFAULT NULL COMMENT '供应商单位到医院单位系数',
  `DELIVERITM_WPSID` varchar(200) DEFAULT NULL COMMENT '供应商发货单标志',
  `DELIVERITM_NO` varchar(200) DEFAULT NULL COMMENT '发货单号',
  `DELIVERITM_RECFLAG` varchar(1) DEFAULT NULL COMMENT '医院入库标志,1:以入库',
  PRIMARY KEY (`DELIVERITM_ID`),
  KEY `I_DELIVERITM_HOPINC_ID` (`DELIVERITM_HOPINCID`),
  KEY `I_DELIVERITM_ORDERITMID` (`DELIVERITM_ORDERITMID`),
  KEY `I_DELIVERITM_PID` (`DELIVERITM_PARENTID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发货明细表';

-- ----------------------------
-- Table structure for t_ven_delv
-- ----------------------------
DROP TABLE IF EXISTS `t_ven_delv`;
CREATE TABLE `t_ven_delv` (
  `DELV_ID` char(32) DEFAULT NULL,
  `DELV_DATE` datetime(6) DEFAULT NULL,
  `DELV_VENDORID` int(11) DEFAULT NULL,
  `DELV_NO` varchar(100) DEFAULT NULL,
  `DELV_SENDFLAG` char(1) DEFAULT NULL,
  `DELV_USERID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_ven_hop_inc
-- ----------------------------
DROP TABLE IF EXISTS `t_ven_hop_inc`;
CREATE TABLE `t_ven_hop_inc` (
  `HOP_INC_ID` int(11) DEFAULT NULL,
  `VEN_INC_ID` int(11) DEFAULT NULL,
  `VEN_HOP_INC_ID` char(32) NOT NULL,
  `VEN_INC_FAC` decimal(65,30) DEFAULT NULL,
  `VEN_FAC` decimal(6,4) DEFAULT NULL,
  `HOP_FAC` decimal(6,4) DEFAULT NULL,
  `VEN_HOP_AUDITFLAG` char(1) DEFAULT NULL,
  PRIMARY KEY (`VEN_HOP_INC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_ven_inc
-- ----------------------------
DROP TABLE IF EXISTS `t_ven_inc`;
CREATE TABLE `t_ven_inc` (
  `VEN_INC_CODE` varchar(250) DEFAULT NULL COMMENT '代码',
  `VEN_INC_NAME` varchar(250) DEFAULT NULL COMMENT '名称',
  `VEN_INC_UOMCODE` varchar(150) DEFAULT NULL COMMENT '单位代码',
  `VEN_INC_UOMNAME` varchar(150) DEFAULT NULL COMMENT '单位名称',
  `VEN_INC_BUOMCODE` varchar(150) DEFAULT NULL COMMENT '小单位代码',
  `VEN_INC_BUOMNAME` varchar(150) DEFAULT NULL COMMENT '小单位名称',
  `VEN_INC_FAC` decimal(65,30) DEFAULT NULL COMMENT '系数',
  `VEN_INC_MANFID` decimal(65,30) DEFAULT NULL COMMENT '厂商Id',
  `VEN_INC_ROWID` decimal(65,30) NOT NULL COMMENT 'id',
  `VEN_INC_VENSYSID` varchar(150) DEFAULT NULL COMMENT '供应商系统药品ID',
  `VEN_INC_VENID` decimal(65,30) DEFAULT NULL COMMENT '供应商ID',
  `VEN_INC_PRICE` decimal(65,30) DEFAULT NULL COMMENT '价格',
  `VEN_INC_SPEC` varchar(250) DEFAULT NULL COMMENT '规格',
  `VEN_INC_ALIAS` varchar(150) DEFAULT NULL COMMENT '别名',
  `VEN_INC_CATID` decimal(65,30) DEFAULT NULL COMMENT '类组',
  `VEN_INC_SP` decimal(65,30) DEFAULT NULL,
  `VEN_INC_QTY` decimal(65,30) DEFAULT NULL,
  `VEN_INC_RESQTY` decimal(65,30) DEFAULT NULL,
  `VEN_INC_AVAILQTY` decimal(65,30) DEFAULT NULL,
  `VEN_INC_COMMENT_NUM` decimal(65,30) DEFAULT NULL,
  `VEN_INC_ORDER_QTY` decimal(65,30) DEFAULT NULL,
  `VEN_INC_ADDDATE` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`VEN_INC_ROWID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供应商';

-- ----------------------------
-- Table structure for t_ven_inc_advice
-- ----------------------------
DROP TABLE IF EXISTS `t_ven_inc_advice`;
CREATE TABLE `t_ven_inc_advice` (
  `VENINCADVICE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `VENINCADVICE_INC_ID` int(11) DEFAULT NULL,
  `VENINCADVICE_ASK` text,
  `VENINCADVICE_ASK_USERID` int(11) DEFAULT NULL,
  `VENINCADVICE_REPLAY` text,
  `VENINCADVICE_REPLAY_USERID` int(11) DEFAULT NULL,
  `VENINCADVICE_ASK_DATE` datetime DEFAULT NULL,
  `VENINCADVICE_REPLAY_DATE` datetime DEFAULT NULL,
  `VENINCADVICE_READFLAG` char(1) DEFAULT NULL,
  PRIMARY KEY (`VENINCADVICE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_ven_inc_pic
-- ----------------------------
DROP TABLE IF EXISTS `t_ven_inc_pic`;
CREATE TABLE `t_ven_inc_pic` (
  `VEN_INC_PIC_ID` int(11) NOT NULL AUTO_INCREMENT,
  `VEN_INC_PIC_VENINCID` int(11) DEFAULT NULL COMMENT '父表id',
  `VEN_INC_PIC_PATH` varchar(255) DEFAULT NULL COMMENT '路径',
  `VEN_INC_PIC_SEQ` char(1) DEFAULT NULL COMMENT '显示顺序',
  PRIMARY KEY (`VEN_INC_PIC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供应商药品图片表';

-- ----------------------------
-- Table structure for t_ven_inc_property
-- ----------------------------
DROP TABLE IF EXISTS `t_ven_inc_property`;
CREATE TABLE `t_ven_inc_property` (
  `INCPRO_ID` int(11) NOT NULL AUTO_INCREMENT,
  `INCPRO_INC_ID` int(11) DEFAULT NULL,
  `INC_PRO_CATPRO_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`INCPRO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_ven_qualif
-- ----------------------------
DROP TABLE IF EXISTS `t_ven_qualif`;
CREATE TABLE `t_ven_qualif` (
  `QUALIFID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'rowid',
  `VENDORID` int(11) DEFAULT NULL COMMENT '供应商id',
  `REGDATE` datetime(6) DEFAULT NULL COMMENT '注册日期',
  `EXPDATE` datetime(6) DEFAULT NULL COMMENT '过期日期',
  PRIMARY KEY (`QUALIFID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供应商资质表';

-- ----------------------------
-- Table structure for t_ven_qualification
-- ----------------------------
DROP TABLE IF EXISTS `t_ven_qualification`;
CREATE TABLE `t_ven_qualification` (
  `QUALIFICATION_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'rowid',
  `VENDOR_ID` int(11) DEFAULT NULL COMMENT '供应商id',
  `REGDATE` datetime(6) DEFAULT NULL COMMENT '注册日期',
  `EXPDATE` datetime(6) DEFAULT NULL COMMENT '过期日期',
  `QUALIFY_TYPE_ID` int(11) DEFAULT NULL COMMENT '资质字典Id',
  `QUALIFY_DESCRIPTION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`QUALIFICATION_ID`),
  KEY `FK_QUALIF_VEN` (`VENDOR_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='供应商资质表';

-- ----------------------------
-- Table structure for t_ven_qualif_pic
-- ----------------------------
DROP TABLE IF EXISTS `t_ven_qualif_pic`;
CREATE TABLE `t_ven_qualif_pic` (
  `QUALIF_PIC_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'rowid',
  `PATH` varchar(200) DEFAULT NULL COMMENT '图片路劲',
  `QUALIFY_ID` int(11) DEFAULT NULL COMMENT '资质表Id',
  `NAME` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`QUALIF_PIC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供应商资质图片';

-- ----------------------------
-- Table structure for t_ven_qualif_type
-- ----------------------------
DROP TABLE IF EXISTS `t_ven_qualif_type`;
CREATE TABLE `t_ven_qualif_type` (
  `VENQUALIFTYPE_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'rowid',
  `NAME` varchar(50) DEFAULT NULL COMMENT '供应商资质名称',
  `CODE` varchar(50) DEFAULT NULL COMMENT '资质代码',
  `SEQ` char(1) DEFAULT NULL COMMENT '显示顺序',
  `TYPE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`VENQUALIFTYPE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='供应商资质类型字典表';

-- ----------------------------
-- Table structure for t_ven_vendor
-- ----------------------------
DROP TABLE IF EXISTS `t_ven_vendor`;
CREATE TABLE `t_ven_vendor` (
  `VEN_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(250) DEFAULT NULL COMMENT '供应商代码',
  `NAME` varchar(250) DEFAULT NULL COMMENT '供应商名称',
  `PARENTID` int(11) DEFAULT NULL COMMENT '父供应商id',
  `ADDRESS` varchar(255) DEFAULT NULL COMMENT '地址',
  `FAX` varchar(50) DEFAULT NULL COMMENT '传真',
  `TEL` varchar(50) DEFAULT NULL COMMENT '电话',
  `ACCOUNT` varchar(50) DEFAULT NULL COMMENT '银行帐号',
  `CONTACT` varchar(50) DEFAULT NULL COMMENT '联系人',
  `HISID` int(11) DEFAULT NULL COMMENT 'his里供应商Id',
  `ALIAS` varchar(250) DEFAULT NULL,
  `EMAIL` varchar(250) DEFAULT NULL COMMENT '邮箱',
  `TAXATION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`VEN_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='供应商表';

-- ----------------------------
-- Table structure for t_ven_vendor_log
-- ----------------------------
DROP TABLE IF EXISTS `t_ven_vendor_log`;
CREATE TABLE `t_ven_vendor_log` (
  `ID` char(32) NOT NULL COMMENT 'rowid',
  `VENDORID` int(11) DEFAULT NULL COMMENT '供应商Id',
  `OPERATEID` int(11) DEFAULT NULL COMMENT '操作人id',
  `OPERATEDATE` datetime(6) DEFAULT NULL COMMENT '操作时间',
  `OPERATETYPE` varchar(4) DEFAULT NULL COMMENT '操作类型',
  `OPERATEIP` varchar(100) DEFAULT NULL COMMENT '操作电脑ip',
  `OPERATENAME` varchar(100) DEFAULT NULL COMMENT '操作电脑名称',
  `OPCONTENT` text COMMENT '操作内容',
  `OPUSERNAME` varchar(100) DEFAULT NULL COMMENT '操作人帐号名',
  `OPTITLE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供应商修改日志表';

-- ----------------------------
-- Table structure for t_wx_depart
-- ----------------------------
DROP TABLE IF EXISTS `t_wx_depart`;
CREATE TABLE `t_wx_depart` (
  `WXDEPART_ID` int(11) NOT NULL AUTO_INCREMENT,
  `WXDEPART_NAME` varchar(200) DEFAULT NULL,
  `WXDEPART_PARENTID` int(11) DEFAULT NULL,
  `WXDEPART_SCMID` int(11) DEFAULT NULL,
  `WXDEPART_CODE` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`WXDEPART_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_wx_message
-- ----------------------------
DROP TABLE IF EXISTS `t_wx_message`;
CREATE TABLE `t_wx_message` (
  `WXMESSAGE_ID` char(32) NOT NULL,
  `WXMESSAGE_CONTENT` text,
  `WXMESSAGE_DATE` datetime DEFAULT NULL,
  `WXMESSAGE_URL` varchar(100) DEFAULT NULL,
  `WXMESSAGE_PICURL` varchar(100) DEFAULT NULL,
  `WXMESSAGE_TITLE` varchar(100) DEFAULT NULL,
  `WXMESSAGE_TOPARTYID` text,
  PRIMARY KEY (`WXMESSAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_wx_message_pic
-- ----------------------------
DROP TABLE IF EXISTS `t_wx_message_pic`;
CREATE TABLE `t_wx_message_pic` (
  `WXMESSAGE_ID` char(32) DEFAULT NULL,
  `WXMESSAGE_PIC` char(60) DEFAULT NULL,
  `WXMESSAGE_PICID` char(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_wx_user
-- ----------------------------
DROP TABLE IF EXISTS `t_wx_user`;
CREATE TABLE `t_wx_user` (
  `WXUSER_ID` char(32) NOT NULL,
  `WXUSER_NAME` varchar(200) DEFAULT NULL,
  `WXUSER_DEPARTID` int(11) DEFAULT NULL,
  `WXUSER_EMAIL` text,
  `WXUSER_TEL` varchar(20) DEFAULT NULL,
  `WXUSER_WEIXINID` varchar(50) DEFAULT NULL,
  `WXUSER_SCMID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
