/*
Navicat Oracle Data Transfer
Oracle Client Version : 12.1.0.1.0

Source Server         : 127
Source Server Version : 110200
Source Host           : 127.0.0.1:1521
Source Schema         : SCM

Target Server Type    : ORACLE
Target Server Version : 110200
File Encoding         : 65001

Date: 2015-03-25 23:59:35
*/


-- ----------------------------
-- Table structure for T_APP_LOG
-- ----------------------------
DROP TABLE "SCM"."T_APP_LOG";
CREATE TABLE "SCM"."T_APP_LOG" (
"LOG_ID" NUMBER NOT NULL ,
"AUDIT_ROOT_DEAL_CODE" VARCHAR2(250 BYTE) NULL ,
"CURRENT_DEAL_CODE" TIMESTAMP(6)  NULL ,
"DEAL_END_TIME" DATE NULL ,
"DEAL_MODE" VARCHAR2(50 BYTE) NULL ,
"DEAL_START_TIME" TIMESTAMP(6)  NULL ,
"DEAL_STATUS" VARCHAR2(50 BYTE) NULL ,
"INPUT_CONTENT" VARCHAR2(4000 BYTE) NULL ,
"LOG_END_TIME" TIMESTAMP(6)  NULL ,
"LOG_START_TIME" TIMESTAMP(6)  NULL ,
"LOG_TYPE" VARCHAR2(100 BYTE) NULL ,
"OPERATE_ACCOUNT" VARCHAR2(500 BYTE) NULL ,
"OPERATE_DESCRIPTION" VARCHAR2(4000 BYTE) NULL ,
"OPERATE_GATEWAY_ID" VARCHAR2(64 BYTE) NULL ,
"OPERATE_IP" VARCHAR2(64 BYTE) NULL ,
"OPERATE_ORG_CODE" VARCHAR2(64 BYTE) NULL ,
"OPERATE_ROLE" VARCHAR2(64 BYTE) NULL ,
"OPERATE_TABLE" VARCHAR2(64 BYTE) NULL ,
"OUTPUT_CONTENT" VARCHAR2(64 BYTE) NULL ,
"PARENT_DEAL_CODE" VARCHAR2(64 BYTE) NULL ,
"RECORD_GATEWAY_ID" VARCHAR2(64 BYTE) NULL ,
"ROOT_DEAL_CODE" VARCHAR2(64 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of T_APP_LOG
-- ----------------------------

-- ----------------------------
-- Table structure for T_APP_LOG_AUDIT
-- ----------------------------
DROP TABLE "SCM"."T_APP_LOG_AUDIT";
CREATE TABLE "SCM"."T_APP_LOG_AUDIT" (
"AUDIT_ID" NUMBER NOT NULL ,
"DEAL_END_TIME" DATE NULL ,
"DEAL_START_TIME" DATE NULL ,
"DEAL_STATUS" VARCHAR2(255 BYTE) NULL ,
"LOG_NUM" VARCHAR2(250 BYTE) NULL ,
"LOG_TYPE" VARCHAR2(250 BYTE) NULL ,
"OPERATE_ACCOUNT" VARCHAR2(250 BYTE) NULL ,
"OPERATE_DESCRIPTION" VARCHAR2(250 BYTE) NULL ,
"OPERATE_IP" VARCHAR2(250 BYTE) NULL ,
"OPERATE_ORG_CODE" VARCHAR2(250 BYTE) NULL ,
"OPERATE_ROLE" VARCHAR2(250 BYTE) NULL ,
"ROOT_DEAL_CODE" VARCHAR2(250 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of T_APP_LOG_AUDIT
-- ----------------------------

-- ----------------------------
-- Table structure for T_CAT_DRUGGROUP
-- ----------------------------
DROP TABLE "SCM"."T_CAT_DRUGGROUP";
CREATE TABLE "SCM"."T_CAT_DRUGGROUP" (
"SDG_CODE" VARCHAR2(20 BYTE) NULL ,
"SDG_DESC" VARCHAR2(20 BYTE) NULL ,
"SDG_ID" NUMBER NOT NULL ,
"SDG_HOPID" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of T_CAT_DRUGGROUP
-- ----------------------------
INSERT INTO "SCM"."T_CAT_DRUGGROUP" VALUES ('被服', '被服', '15', '7');
INSERT INTO "SCM"."T_CAT_DRUGGROUP" VALUES ('五金', '五金', '13', '7');
INSERT INTO "SCM"."T_CAT_DRUGGROUP" VALUES ('办公用品', '办公用品', '14', '7');
INSERT INTO "SCM"."T_CAT_DRUGGROUP" VALUES ('打印纸', '打印纸', '16', '7');
INSERT INTO "SCM"."T_CAT_DRUGGROUP" VALUES ('其他', '其他', '19', '7');

-- ----------------------------
-- Table structure for T_CAT_DRUGGROUPITM
-- ----------------------------
DROP TABLE "SCM"."T_CAT_DRUGGROUPITM";
CREATE TABLE "SCM"."T_CAT_DRUGGROUPITM" (
"SDGI_ID" NUMBER NOT NULL ,
"SDGI_PARREF_ID" NUMBER NULL ,
"SDGI_CODE" VARCHAR2(20 BYTE) NULL ,
"SDGI_DESC" VARCHAR2(20 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of T_CAT_DRUGGROUPITM
-- ----------------------------
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('21', '15', '被服1', '被服1');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('22', '15', '被服2', '被服2');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('23', '13', '五金1', '五金1');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('24', '13', '五金2', '五金2');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('25', '14', '办公用品1', '办公用品1');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('26', '14', '办公用品2', '办公用品2');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('27', '16', '打印纸1', '打印纸1');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('28', '16', '打印纸2', '打印纸2');

-- ----------------------------
-- Table structure for T_HOP_CTLOC
-- ----------------------------
DROP TABLE "SCM"."T_HOP_CTLOC";
CREATE TABLE "SCM"."T_HOP_CTLOC" (
"ID" NUMBER NOT NULL ,
"CODE" VARCHAR2(50 BYTE) NULL ,
"NAME" VARCHAR2(50 BYTE) NULL ,
"HOSPID" NUMBER NULL ,
"HISID" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "SCM"."T_HOP_CTLOC" IS '科室';
COMMENT ON COLUMN "SCM"."T_HOP_CTLOC"."CODE" IS 'code';
COMMENT ON COLUMN "SCM"."T_HOP_CTLOC"."NAME" IS 'name';
COMMENT ON COLUMN "SCM"."T_HOP_CTLOC"."HOSPID" IS '医院Id';
COMMENT ON COLUMN "SCM"."T_HOP_CTLOC"."HISID" IS 'his里科室Id';

-- ----------------------------
-- Records of T_HOP_CTLOC
-- ----------------------------

-- ----------------------------
-- Table structure for T_HOP_EVALUTE
-- ----------------------------
DROP TABLE "SCM"."T_HOP_EVALUTE";
CREATE TABLE "SCM"."T_HOP_EVALUTE" (
"ELE_ID" NUMBER NOT NULL ,
"ELE_HOSPID" NUMBER NULL ,
"ELE_ORDERID" NUMBER NULL ,
"ELE_DATE" TIMESTAMP(6)  NULL ,
"ELE_USERID" NUMBER NULL ,
"ELE_VENDORID" NUMBER NULL ,
"ELE_RESULT" CHAR(1 BYTE) NULL ,
"ELE_CONTENT" VARCHAR2(4000 BYTE) NULL ,
"ELE_PAYSPEED" NUMBER NULL ,
"ELE_RECSPEED" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "SCM"."T_HOP_EVALUTE" IS '医院评价表';
COMMENT ON COLUMN "SCM"."T_HOP_EVALUTE"."ELE_HOSPID" IS '医院Id';
COMMENT ON COLUMN "SCM"."T_HOP_EVALUTE"."ELE_ORDERID" IS '订单Id';
COMMENT ON COLUMN "SCM"."T_HOP_EVALUTE"."ELE_DATE" IS '评价时间';
COMMENT ON COLUMN "SCM"."T_HOP_EVALUTE"."ELE_USERID" IS '评价人';
COMMENT ON COLUMN "SCM"."T_HOP_EVALUTE"."ELE_VENDORID" IS '评价供应商';
COMMENT ON COLUMN "SCM"."T_HOP_EVALUTE"."ELE_RESULT" IS '评价结果(1:好评，2：一般，3：差评)';
COMMENT ON COLUMN "SCM"."T_HOP_EVALUTE"."ELE_CONTENT" IS '评价内容';
COMMENT ON COLUMN "SCM"."T_HOP_EVALUTE"."ELE_PAYSPEED" IS '付款速度';
COMMENT ON COLUMN "SCM"."T_HOP_EVALUTE"."ELE_RECSPEED" IS '收货速度';

-- ----------------------------
-- Records of T_HOP_EVALUTE
-- ----------------------------
INSERT INTO "SCM"."T_HOP_EVALUTE" VALUES ('32', null, '6050', TO_TIMESTAMP(' 2015-02-05 18:45:56:229000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '1', '7121', '1', '2222方芳芳', null, null);
INSERT INTO "SCM"."T_HOP_EVALUTE" VALUES ('43', null, '7051', TO_TIMESTAMP(' 2015-02-05 18:50:35:403000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '1', '7142', '5', '方法', null, null);
INSERT INTO "SCM"."T_HOP_EVALUTE" VALUES ('44', null, '7050', TO_TIMESTAMP(' 2015-02-05 18:45:52:123000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '1', '7141', '3', '方芳芳', null, null);
INSERT INTO "SCM"."T_HOP_EVALUTE" VALUES ('41', null, '7053', TO_TIMESTAMP(' 2015-02-05 18:45:35:636000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '1', '7141', '5', '方法', null, null);
INSERT INTO "SCM"."T_HOP_EVALUTE" VALUES ('42', null, '7052', TO_TIMESTAMP(' 2015-02-09 13:47:28:835000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '1', '7142', '2', '地方法', null, null);
INSERT INTO "SCM"."T_HOP_EVALUTE" VALUES ('61', null, '8100', TO_TIMESTAMP(' 2015-03-20 10:20:15:917000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '67', '7121', '4', '好', null, null);

-- ----------------------------
-- Table structure for T_HOP_INC
-- ----------------------------
DROP TABLE "SCM"."T_HOP_INC";
CREATE TABLE "SCM"."T_HOP_INC" (
"INC_CODE" VARCHAR2(50 BYTE) NULL ,
"INC_NAME" VARCHAR2(250 BYTE) NULL ,
"INC_UOMCODE" VARCHAR2(100 BYTE) NULL ,
"INC_UOMNAME" VARCHAR2(100 BYTE) NULL ,
"INC_BUOMCODE" VARCHAR2(100 BYTE) NULL ,
"INC_BUOMNAME" VARCHAR2(100 BYTE) NULL ,
"INC_FAC" NUMBER NULL ,
"INC_MANFID" NUMBER NULL ,
"INC_ID" NUMBER NOT NULL ,
"INC_HISSYSID" NUMBER NULL ,
"INC_HOSPID" NUMBER NULL ,
"INC_RP" NUMBER NULL ,
"INC_SPEC" VARCHAR2(100 BYTE) NULL ,
"INC_CAT" VARCHAR2(100 BYTE) NULL ,
"INC_SP" NUMBER NULL ,
"INC_AUDITFLAG" CHAR(1 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "SCM"."T_HOP_INC" IS '医院药品信息';
COMMENT ON COLUMN "SCM"."T_HOP_INC"."INC_CODE" IS '代码';
COMMENT ON COLUMN "SCM"."T_HOP_INC"."INC_NAME" IS '名称';
COMMENT ON COLUMN "SCM"."T_HOP_INC"."INC_UOMCODE" IS '单位代码';
COMMENT ON COLUMN "SCM"."T_HOP_INC"."INC_UOMNAME" IS '单位名称';
COMMENT ON COLUMN "SCM"."T_HOP_INC"."INC_BUOMCODE" IS '小单位代码';
COMMENT ON COLUMN "SCM"."T_HOP_INC"."INC_BUOMNAME" IS '小单位名称';
COMMENT ON COLUMN "SCM"."T_HOP_INC"."INC_FAC" IS '系数';
COMMENT ON COLUMN "SCM"."T_HOP_INC"."INC_MANFID" IS '厂商Id';
COMMENT ON COLUMN "SCM"."T_HOP_INC"."INC_ID" IS 'id';
COMMENT ON COLUMN "SCM"."T_HOP_INC"."INC_HISSYSID" IS 'his系统药品ID';
COMMENT ON COLUMN "SCM"."T_HOP_INC"."INC_HOSPID" IS '医院ID';
COMMENT ON COLUMN "SCM"."T_HOP_INC"."INC_RP" IS '进价';
COMMENT ON COLUMN "SCM"."T_HOP_INC"."INC_SPEC" IS '规格';
COMMENT ON COLUMN "SCM"."T_HOP_INC"."INC_CAT" IS '库存分类';
COMMENT ON COLUMN "SCM"."T_HOP_INC"."INC_SP" IS '售价';

-- ----------------------------
-- Records of T_HOP_INC
-- ----------------------------
INSERT INTO "SCM"."T_HOP_INC" VALUES ('524', '全棉纯色手术帽', '17', '个', null, null, null, '1941', '19791', null, '7', null, '材质：棉', '23', '60', null);
INSERT INTO "SCM"."T_HOP_INC" VALUES ('新绿天章70克A4复印纸 5包箱', '新绿天章70克A4复印纸', '包', '包', null, null, null, null, '19793', null, '7', '2', '得力6600-0.5mm', '25', null, null);
INSERT INTO "SCM"."T_HOP_INC" VALUES ('三黄片', '三黄片', '包', '包', null, null, null, null, '19795', null, '7', null, null, '24', null, null);
INSERT INTO "SCM"."T_HOP_INC" VALUES ('得力中性笔(黑)', '得力中性笔(黑) ', '17', '支', null, null, null, '1941', '19796', null, '7', null, '得力6600-0.5mm', '25', '24', null);
INSERT INTO "SCM"."T_HOP_INC" VALUES ('999感冒灵', '999感冒灵', 'xxx', 'xxx', null, null, null, null, '19797', null, '7', null, null, '24', '10', null);
INSERT INTO "SCM"."T_HOP_INC" VALUES ('525', '甲醛显色剂检测仪试管', '17', '支', null, null, null, null, '19788', null, '7', null, '10.00g', '22', null, null);
INSERT INTO "SCM"."T_HOP_INC" VALUES ('中性笔', '中性笔', null, '支', null, null, null, null, '19789', null, '7', null, '支', '21', null, null);
INSERT INTO "SCM"."T_HOP_INC" VALUES ('心脏支架', '心脏支架', '支', '支', null, null, null, null, '19790', null, '7', null, null, '23', null, null);
INSERT INTO "SCM"."T_HOP_INC" VALUES ('拖鞋', '拖鞋', '双', '双', null, null, null, null, '19792', null, '7', null, '双', '25', null, null);
INSERT INTO "SCM"."T_HOP_INC" VALUES ('拖把', '拖把', '把', '把', null, null, null, null, '19794', null, '7', null, '把', '25', null, null);
INSERT INTO "SCM"."T_HOP_INC" VALUES ('手术刀', '手术刀', '把', '把', null, null, null, null, '19801', null, '7', null, null, '26', null, null);
INSERT INTO "SCM"."T_HOP_INC" VALUES ('XY00001', '阿莫西林', 'mg', 'mg', null, null, null, null, '19761', null, '7', null, null, '27', null, null);
INSERT INTO "SCM"."T_HOP_INC" VALUES ('XY0002', '葡萄糖注射液', 'ml', '袋', null, null, null, null, '19762', null, '7', null, null, '23', null, null);
INSERT INTO "SCM"."T_HOP_INC" VALUES ('自行车', '自行车', '辆', '辆', null, null, null, null, '19785', null, '7', null, null, '23', null, null);
INSERT INTO "SCM"."T_HOP_INC" VALUES ('打印机', '打印机', '台', '台', null, null, null, null, '19786', null, '7', null, null, '27', null, null);
INSERT INTO "SCM"."T_HOP_INC" VALUES ('打印纸', '打印纸', '张', '张', null, null, null, null, '19787', null, '7', null, 'A4', '26', null, null);

-- ----------------------------
-- Table structure for T_HOP_INC_PIC
-- ----------------------------
DROP TABLE "SCM"."T_HOP_INC_PIC";
CREATE TABLE "SCM"."T_HOP_INC_PIC" (
"INC_PIC_ID" NUMBER NOT NULL ,
"INC_PIC_INCID" NUMBER NULL ,
"INC_PIC_PATH" VARCHAR2(255 BYTE) NULL ,
"INC_PIC_SEQ" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "SCM"."T_HOP_INC_PIC" IS '药品图片表';
COMMENT ON COLUMN "SCM"."T_HOP_INC_PIC"."INC_PIC_INCID" IS '父表Id';
COMMENT ON COLUMN "SCM"."T_HOP_INC_PIC"."INC_PIC_PATH" IS '路径';
COMMENT ON COLUMN "SCM"."T_HOP_INC_PIC"."INC_PIC_SEQ" IS '显示顺序';

-- ----------------------------
-- Records of T_HOP_INC_PIC
-- ----------------------------
INSERT INTO "SCM"."T_HOP_INC_PIC" VALUES ('61', null, '2015-03-20+10-22-555a346204-673d-45a3-a7e2-d2d8fe435bdf.gif', '2');

-- ----------------------------
-- Table structure for T_HOP_INCALIAS
-- ----------------------------
DROP TABLE "SCM"."T_HOP_INCALIAS";
CREATE TABLE "SCM"."T_HOP_INCALIAS" (
"INCALIAS_ID" VARCHAR2(250 BYTE) NOT NULL ,
"INCALIAS_TEXT" VARCHAR2(50 BYTE) NULL ,
"INCALIAS_INCID" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of T_HOP_INCALIAS
-- ----------------------------

-- ----------------------------
-- Table structure for T_HOP_MANF
-- ----------------------------
DROP TABLE "SCM"."T_HOP_MANF";
CREATE TABLE "SCM"."T_HOP_MANF" (
"ID" NUMBER NOT NULL ,
"CODE" VARCHAR2(50 BYTE) NULL ,
"NAME" VARCHAR2(50 BYTE) NULL ,
"HISID" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "SCM"."T_HOP_MANF" IS '厂商Id';
COMMENT ON COLUMN "SCM"."T_HOP_MANF"."CODE" IS '代码';
COMMENT ON COLUMN "SCM"."T_HOP_MANF"."NAME" IS '名称';
COMMENT ON COLUMN "SCM"."T_HOP_MANF"."HISID" IS 'his里厂商Id';

-- ----------------------------
-- Records of T_HOP_MANF
-- ----------------------------
INSERT INTO "SCM"."T_HOP_MANF" VALUES ('1941', '602', '山西泰盛制药', null);

-- ----------------------------
-- Table structure for T_HOP_VENDOR
-- ----------------------------
DROP TABLE "SCM"."T_HOP_VENDOR";
CREATE TABLE "SCM"."T_HOP_VENDOR" (
"H_VENID" NUMBER NOT NULL ,
"H_CODE" VARCHAR2(150 BYTE) NULL ,
"H_NAME" VARCHAR2(150 BYTE) NULL ,
"H_PARENTID" NUMBER NULL ,
"H_ADDRESS" VARCHAR2(255 BYTE) NULL ,
"H_FAX" VARCHAR2(50 BYTE) NULL ,
"H_TEL" VARCHAR2(50 BYTE) NULL ,
"H_ACCOUNT" VARCHAR2(50 BYTE) NULL ,
"H_CONTACT" VARCHAR2(50 BYTE) NULL ,
"H_VENDORID" NUMBER NULL ,
"H_ALIAS" VARCHAR2(150 BYTE) NULL ,
"H_HOPID" NUMBER NULL ,
"H_TYPE" VARCHAR2(50 BYTE) NULL ,
"H_EMAIL" VARCHAR2(150 BYTE) NULL ,
"H_SEND" VARCHAR2(255 BYTE) NULL ,
"H_AUDITFLAG" CHAR(1 CHAR) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON COLUMN "SCM"."T_HOP_VENDOR"."H_ALIAS" IS '别名';
COMMENT ON COLUMN "SCM"."T_HOP_VENDOR"."H_HOPID" IS '医院ID';
COMMENT ON COLUMN "SCM"."T_HOP_VENDOR"."H_TYPE" IS '供应商类别';
COMMENT ON COLUMN "SCM"."T_HOP_VENDOR"."H_EMAIL" IS '邮箱';
COMMENT ON COLUMN "SCM"."T_HOP_VENDOR"."H_SEND" IS '发货地点';

-- ----------------------------
-- Records of T_HOP_VENDOR
-- ----------------------------
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6121', '3', '兰州远方药业', null, null, null, null, null, null, '7121', 'lzyfyy', '7', '药品', null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6141', '广西金嗓子', '广西金嗓子', null, null, null, null, null, null, '7141', 'gxjsz', '7', '药品', null, null, 'Y');
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6142', '武汉建民', '武汉建民', null, null, null, null, null, null, '7142', 'whjm', '7', '药品', null, null, 'N');

-- ----------------------------
-- Table structure for T_LOG_CONFIGURE
-- ----------------------------
DROP TABLE "SCM"."T_LOG_CONFIGURE";
CREATE TABLE "SCM"."T_LOG_CONFIGURE" (
"LOG_ID" VARCHAR2(300 BYTE) NOT NULL ,
"LOG_TITLE" VARCHAR2(100 BYTE) NULL ,
"LOG_METHOD" VARCHAR2(300 BYTE) NULL ,
"LOG_ARGS" VARCHAR2(4000 BYTE) NULL ,
"LOG_UPDATEDATE" TIMESTAMP(6)  NULL ,
"LOG_INSERTDATE" TIMESTAMP(6)  NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of T_LOG_CONFIGURE
-- ----------------------------

-- ----------------------------
-- Table structure for T_ORD_EXESTATE
-- ----------------------------
DROP TABLE "SCM"."T_ORD_EXESTATE";
CREATE TABLE "SCM"."T_ORD_EXESTATE" (
"EXESTATE_ID" NUMBER NOT NULL ,
"ORD_ID" NUMBER NULL ,
"STATE_ID" NUMBER NULL ,
"EXEDATE" TIMESTAMP(6)  NULL ,
"USER_ID" NUMBER NULL ,
"TEL" VARCHAR2(255 BYTE) NULL ,
"REMARK" VARCHAR2(500 BYTE) NULL ,
"DELIVER_ID" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "SCM"."T_ORD_EXESTATE" IS '订单执行表';
COMMENT ON COLUMN "SCM"."T_ORD_EXESTATE"."ORD_ID" IS '订单id(t_ord_order)';
COMMENT ON COLUMN "SCM"."T_ORD_EXESTATE"."STATE_ID" IS '状态id(t_ord_state)';
COMMENT ON COLUMN "SCM"."T_ORD_EXESTATE"."EXEDATE" IS '操作日期';
COMMENT ON COLUMN "SCM"."T_ORD_EXESTATE"."USER_ID" IS '操作人';
COMMENT ON COLUMN "SCM"."T_ORD_EXESTATE"."TEL" IS '联系电话';
COMMENT ON COLUMN "SCM"."T_ORD_EXESTATE"."REMARK" IS '备注';
COMMENT ON COLUMN "SCM"."T_ORD_EXESTATE"."DELIVER_ID" IS '发货单ID';

-- ----------------------------
-- Records of T_ORD_EXESTATE
-- ----------------------------
INSERT INTO "SCM"."T_ORD_EXESTATE" VALUES ('13201', '2050', '1', TO_TIMESTAMP(' 2015-03-25 23:33:58:075000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '67', null, null, null);
INSERT INTO "SCM"."T_ORD_EXESTATE" VALUES ('13202', '2050', '2', TO_TIMESTAMP(' 2015-03-25 23:34:48:403000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '8', null, null, null);
INSERT INTO "SCM"."T_ORD_EXESTATE" VALUES ('13203', '2012', '4', TO_TIMESTAMP(' 2015-03-25 23:46:13:508000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '67', null, null, null);
INSERT INTO "SCM"."T_ORD_EXESTATE" VALUES ('13204', '2011', '4', TO_TIMESTAMP(' 2015-03-25 23:46:42:065000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '67', null, null, null);
INSERT INTO "SCM"."T_ORD_EXESTATE" VALUES ('13205', '2050', '3', TO_TIMESTAMP(' 2015-03-25 23:50:16:256000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '8', null, '23', null);
INSERT INTO "SCM"."T_ORD_EXESTATE" VALUES ('13206', '2050', '4', TO_TIMESTAMP(' 2015-03-25 23:50:27:462000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '67', null, null, null);
INSERT INTO "SCM"."T_ORD_EXESTATE" VALUES ('13163', '2012', '2', TO_TIMESTAMP(' 2015-03-25 22:43:53:676000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '8', null, null, null);
INSERT INTO "SCM"."T_ORD_EXESTATE" VALUES ('13164', '2011', '2', TO_TIMESTAMP(' 2015-03-25 22:43:53:678000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '8', null, null, null);
INSERT INTO "SCM"."T_ORD_EXESTATE" VALUES ('13200', '2010', '2', TO_TIMESTAMP(' 2015-03-25 23:33:03:181000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '8', null, null, null);
INSERT INTO "SCM"."T_ORD_EXESTATE" VALUES ('13165', '2012', '3', TO_TIMESTAMP(' 2015-03-25 22:46:54:254000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '8', null, '222', null);
INSERT INTO "SCM"."T_ORD_EXESTATE" VALUES ('13166', '2011', '3', TO_TIMESTAMP(' 2015-03-25 22:46:54:259000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '8', null, '1333', null);
INSERT INTO "SCM"."T_ORD_EXESTATE" VALUES ('13161', '2011', '1', TO_TIMESTAMP(' 2015-03-25 22:35:49:455000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '67', null, null, null);
INSERT INTO "SCM"."T_ORD_EXESTATE" VALUES ('13162', '2012', '1', TO_TIMESTAMP(' 2015-03-25 22:35:49:455000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '67', null, null, null);
INSERT INTO "SCM"."T_ORD_EXESTATE" VALUES ('13159', '2009', '1', TO_TIMESTAMP(' 2015-03-25 22:34:21:325000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '67', null, null, null);
INSERT INTO "SCM"."T_ORD_EXESTATE" VALUES ('13160', '2010', '1', TO_TIMESTAMP(' 2015-03-25 22:35:21:499000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '67', null, null, null);

-- ----------------------------
-- Table structure for T_ORD_ORD
-- ----------------------------
DROP TABLE "SCM"."T_ORD_ORD";
CREATE TABLE "SCM"."T_ORD_ORD" (
"ORD_ID" VARCHAR2(40 BYTE) NULL ,
"ORD_DATE" TIMESTAMP(6)  NULL ,
"ORD_HOP_ID" NUMBER NULL ,
"ORD_LOC_ID" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of T_ORD_ORD
-- ----------------------------
INSERT INTO "SCM"."T_ORD_ORD" VALUES ('4028b7c64c324b98014c328c4d9a0001', TO_TIMESTAMP(' 2015-03-19 22:59:57:978000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '7', null);
INSERT INTO "SCM"."T_ORD_ORD" VALUES ('4028b7c64b594088014b59469e80000a', TO_TIMESTAMP(' 2015-02-05 18:26:15:295000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '7', null);
INSERT INTO "SCM"."T_ORD_ORD" VALUES ('4028b7c64b594088014b5946b61e000b', TO_TIMESTAMP(' 2015-02-05 18:26:21:342000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '7', null);
INSERT INTO "SCM"."T_ORD_ORD" VALUES ('4028b7c64b594088014b5943ac4c0006', TO_TIMESTAMP(' 2015-02-05 18:23:02:219000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '7', null);
INSERT INTO "SCM"."T_ORD_ORD" VALUES ('4028b7c64b594088014b59443ecb0007', TO_TIMESTAMP(' 2015-02-05 18:23:39:722000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '7', null);
INSERT INTO "SCM"."T_ORD_ORD" VALUES ('4028b7c64b594088014b594624e20008', TO_TIMESTAMP(' 2015-02-05 18:25:44:162000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '7', null);
INSERT INTO "SCM"."T_ORD_ORD" VALUES ('4028b7c64b594088014b594639940009', TO_TIMESTAMP(' 2015-02-05 18:25:49:459000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '7', null);
INSERT INTO "SCM"."T_ORD_ORD" VALUES ('297ec3224c34de4b014c34fa99910001', TO_TIMESTAMP(' 2015-03-20 10:19:40:816000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '7', null);

-- ----------------------------
-- Table structure for T_ORD_ORDER
-- ----------------------------
DROP TABLE "SCM"."T_ORD_ORDER";
CREATE TABLE "SCM"."T_ORD_ORDER" (
"ORDER_ID" NUMBER NOT NULL ,
"HOP_ID" NUMBER NULL ,
"ORDER_NO" VARCHAR2(250 BYTE) NULL ,
"EMFLAG" VARCHAR2(50 BYTE) NULL ,
"PLANARRDATE" DATE NULL ,
"DELIVERYDATE" DATE NULL ,
"VENDOR_ID" NUMBER NULL ,
"PLANDATE" DATE NULL ,
"REMARK" VARCHAR2(500 BYTE) NULL ,
"EXESTATE_ID" NUMBER NULL ,
"RECLOC" NUMBER NULL ,
"RECDESTINATION" NUMBER NULL ,
"CREATEUSER" NUMBER NULL ,
"PURLOC" NUMBER NULL ,
"ORD_FLAG" NUMBER NULL ,
"SENDFLAG" VARCHAR2(5 BYTE) NULL ,
"ORDER_SERIAL" VARCHAR2(250 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "SCM"."T_ORD_ORDER" IS '订单主表';
COMMENT ON COLUMN "SCM"."T_ORD_ORDER"."RECLOC" IS '收货科室';
COMMENT ON COLUMN "SCM"."T_ORD_ORDER"."RECDESTINATION" IS '收货地址';
COMMENT ON COLUMN "SCM"."T_ORD_ORDER"."CREATEUSER" IS '建单人';
COMMENT ON COLUMN "SCM"."T_ORD_ORDER"."PURLOC" IS '采购科室';
COMMENT ON COLUMN "SCM"."T_ORD_ORDER"."ORD_FLAG" IS '1:部分发货,2:全部发货';
COMMENT ON COLUMN "SCM"."T_ORD_ORDER"."SENDFLAG" IS '1,已发送';
COMMENT ON COLUMN "SCM"."T_ORD_ORDER"."ORDER_SERIAL" IS '订单流水号';

-- ----------------------------
-- Records of T_ORD_ORDER
-- ----------------------------
INSERT INTO "SCM"."T_ORD_ORDER" VALUES ('5050', '7', '118114', null, null, TO_DATE('2014-12-18 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '6121', TO_DATE('2014-12-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), null, '7205', '62', '107', '1', '62', '2', null, '22');
INSERT INTO "SCM"."T_ORD_ORDER" VALUES ('8100', '7', null, null, null, TO_DATE('2015-03-13 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '6121', TO_DATE('2015-03-19 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), null, '10101', '62', '61', '1', '62', null, null, '4028b7c64c324b98014c328c4d9a0001');
INSERT INTO "SCM"."T_ORD_ORDER" VALUES ('6050', '7', null, null, null, TO_DATE('2015-02-27 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '6121', TO_DATE('2015-02-02 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), null, '10150', '62', '61', '1', '62', null, null, '22');
INSERT INTO "SCM"."T_ORD_ORDER" VALUES ('7053', '7', null, null, null, TO_DATE('2015-02-19 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '6141', TO_DATE('2015-02-05 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '嗖嗖嗖', '9053', '62', '104', '1', '62', null, null, '4028b7c64b594088014b5946b61e000b');
INSERT INTO "SCM"."T_ORD_ORDER" VALUES ('7050', '7', null, null, null, TO_DATE('2015-02-19 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '6141', TO_DATE('2015-02-05 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '宿舍', '9050', '62', '61', '1', '62', null, null, null);
INSERT INTO "SCM"."T_ORD_ORDER" VALUES ('7051', '7', null, null, null, TO_DATE('2015-02-27 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '6142', TO_DATE('2015-02-05 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '宿舍', '9051', '62', '104', '1', '62', null, null, null);
INSERT INTO "SCM"."T_ORD_ORDER" VALUES ('7052', '7', null, 'checked', null, TO_DATE('2015-02-25 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '6142', TO_DATE('2015-02-05 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '点点滴滴', '9052', '62', '102', '1', '62', null, null, '4028b7c64b594088014b594639940009');
INSERT INTO "SCM"."T_ORD_ORDER" VALUES ('9050', '7', null, 'checked', null, null, null, null, null, null, '143', null, null, null, null, null, '297ec3224c34de4b014c34fa99910001');

-- ----------------------------
-- Table structure for T_ORD_ORDERDETAIL
-- ----------------------------
DROP TABLE "SCM"."T_ORD_ORDERDETAIL";
CREATE TABLE "SCM"."T_ORD_ORDERDETAIL" (
"ORDER_ID" NUMBER NOT NULL ,
"ORDER_HOP_ID" NUMBER NULL ,
"ORDER_NO" VARCHAR2(100 BYTE) NULL ,
"ORDER_VEN_ID" NUMBER NULL ,
"ORDER_HOP_INC_ID" NUMBER NULL ,
"ORDER_VEN_INC_ID" NUMBER NULL ,
"ORDER_HOP_UOM" VARCHAR2(10 BYTE) NULL ,
"ORDER_VEN_UOM" VARCHAR2(10 BYTE) NULL ,
"ORDER_HOP_QTY" NUMBER(20) NULL ,
"ORDER_VEN_QTY" FLOAT(126) NULL ,
"ORDER_REC_QTY" FLOAT(126) NULL ,
"ORDER_RP" FLOAT(126) NULL ,
"ORDER_RECLOC" NUMBER NULL ,
"ORDER_RECDESTINATION" NUMBER NULL ,
"ORDER_USER_ID" NUMBER NULL ,
"ORDER_ODATE" TIMESTAMP(7)  NULL ,
"ORDER_FAC" FLOAT(126) NULL ,
"ORDER_STATE" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of T_ORD_ORDERDETAIL
-- ----------------------------
INSERT INTO "SCM"."T_ORD_ORDERDETAIL" VALUES ('2050', '7', 'ORD201503259', '7121', '19791', '6333', '个', '盒(12)', '24', '2', null, '1.5', '143', null, '67', TO_TIMESTAMP(' 2015-03-25 23:33:58:0520000', 'YYYY-MM-DD HH24:MI:SS:FF7'), '12', '4');
INSERT INTO "SCM"."T_ORD_ORDERDETAIL" VALUES ('2012', '7', 'ORD201503258', '7121', '19796', '6330', '支', '盒(12支)', '48', '4', null, '1', '143', null, '67', TO_TIMESTAMP(' 2015-03-25 22:35:49:4550000', 'YYYY-MM-DD HH24:MI:SS:FF7'), '12', '4');
INSERT INTO "SCM"."T_ORD_ORDERDETAIL" VALUES ('2010', '7', 'ORD201503257', '7121', '19791', '6333', '个', '盒(12)', '1', '0.083333336', null, '1.5', '143', null, '67', TO_TIMESTAMP(' 2015-03-25 22:35:21:4990000', 'YYYY-MM-DD HH24:MI:SS:FF7'), '12', '2');
INSERT INTO "SCM"."T_ORD_ORDERDETAIL" VALUES ('2011', '7', 'ORD201503258', '7121', '19791', '6333', '个', '盒(12)', '12', '1', null, '1.5', '143', null, '67', TO_TIMESTAMP(' 2015-03-25 22:35:49:4460000', 'YYYY-MM-DD HH24:MI:SS:FF7'), '12', '4');

-- ----------------------------
-- Table structure for T_ORD_ORDERDETAILSUB
-- ----------------------------
DROP TABLE "SCM"."T_ORD_ORDERDETAILSUB";
CREATE TABLE "SCM"."T_ORD_ORDERDETAILSUB" (
"ORDSUB_ID" VARCHAR2(250 BYTE) NOT NULL ,
"ORDSUB_DETAIL_ID" NUMBER NULL ,
"ORDSUB_INVNO" VARCHAR2(200 BYTE) NULL ,
"ORDSUB_BATNO" VARCHAR2(200 BYTE) NULL ,
"ORDSUB_EXPDATE" DATE NULL ,
"ORDSUB_USERID" NUMBER NULL ,
"ORDSUB_DATE" TIMESTAMP(0)  NULL ,
"ORDSUB_STATUS" CHAR(1 BYTE) NULL ,
"ORDSUB_QTY" FLOAT(126) NULL ,
"ORDSUB_RP" FLOAT(126) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of T_ORD_ORDERDETAILSUB
-- ----------------------------
INSERT INTO "SCM"."T_ORD_ORDERDETAILSUB" VALUES ('297eacb94c51850a014c519fe0020004', '2050', '23', '222', TO_DATE('2015-04-02 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '8', TO_TIMESTAMP(' 2015-03-25 23:49:34', 'YYYY-MM-DD HH24:MI:SS:'), 'Y', '1', '2');
INSERT INTO "SCM"."T_ORD_ORDERDETAILSUB" VALUES ('297eacb94c510033014c5164ba540005', '2012', '222', '20150325', TO_DATE('2015-03-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '8', TO_TIMESTAMP(' 2015-03-25 22:44:58', 'YYYY-MM-DD HH24:MI:SS:'), 'Y', '2', '11');
INSERT INTO "SCM"."T_ORD_ORDERDETAILSUB" VALUES ('297eacb94c510033014c5164f5730006', '2011', '1333', '20150325', TO_DATE('2015-04-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '8', TO_TIMESTAMP(' 2015-03-25 22:45:13', 'YYYY-MM-DD HH24:MI:SS:'), 'Y', '1', '22');

-- ----------------------------
-- Table structure for T_ORD_ORDERITM
-- ----------------------------
DROP TABLE "SCM"."T_ORD_ORDERITM";
CREATE TABLE "SCM"."T_ORD_ORDERITM" (
"ORDERITM_ID" NUMBER NOT NULL ,
"ORD_ID" NUMBER NULL ,
"INC_ID" NUMBER NULL ,
"UOM" VARCHAR2(255 BYTE) NULL ,
"REQQTY" NUMBER DEFAULT 0  NULL ,
"DELIVERQTY" NUMBER DEFAULT 0  NULL ,
"RP" NUMBER DEFAULT 0  NULL ,
"RECLOC" NUMBER NULL ,
"RECDESTINATION" NUMBER NULL ,
"FLAG" NUMBER NULL ,
"VENUOM" VARCHAR2(50 BYTE) NULL ,
"VENUOMREQQTY" NUMBER NULL ,
"VENUOMRP" NUMBER NULL ,
"FAC" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "SCM"."T_ORD_ORDERITM" IS '订单明细表';
COMMENT ON COLUMN "SCM"."T_ORD_ORDERITM"."UOM" IS '单位';
COMMENT ON COLUMN "SCM"."T_ORD_ORDERITM"."REQQTY" IS '请求数量';
COMMENT ON COLUMN "SCM"."T_ORD_ORDERITM"."DELIVERQTY" IS '以发货数量';
COMMENT ON COLUMN "SCM"."T_ORD_ORDERITM"."RP" IS '进价';
COMMENT ON COLUMN "SCM"."T_ORD_ORDERITM"."RECLOC" IS '收货科室';
COMMENT ON COLUMN "SCM"."T_ORD_ORDERITM"."RECDESTINATION" IS '收货地址';
COMMENT ON COLUMN "SCM"."T_ORD_ORDERITM"."FLAG" IS '1,部分发货,2，全部发货';
COMMENT ON COLUMN "SCM"."T_ORD_ORDERITM"."VENUOM" IS '供应商药品单位';
COMMENT ON COLUMN "SCM"."T_ORD_ORDERITM"."VENUOMREQQTY" IS '供应商单数数量';
COMMENT ON COLUMN "SCM"."T_ORD_ORDERITM"."VENUOMRP" IS '供应商单位进价';
COMMENT ON COLUMN "SCM"."T_ORD_ORDERITM"."FAC" IS '供应商单位到医院单位系数';

-- ----------------------------
-- Records of T_ORD_ORDERITM
-- ----------------------------
INSERT INTO "SCM"."T_ORD_ORDERITM" VALUES ('8050', '5050', '19761', 'mg', '70', '70', '0', null, null, '2', null, null, null, null);
INSERT INTO "SCM"."T_ORD_ORDERITM" VALUES ('8051', '5050', '19762', '袋', '100', '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SCM"."T_ORD_ORDERITM" VALUES ('11050', '8100', '19791', '瓶', '1', null, '60', null, null, null, null, null, null, null);
INSERT INTO "SCM"."T_ORD_ORDERITM" VALUES ('9050', '6050', '19761', 'mg', '2', null, '0', null, null, null, null, null, null, null);
INSERT INTO "SCM"."T_ORD_ORDERITM" VALUES ('11051', '8100', '19791', '瓶', null, null, '60', null, null, null, null, null, null, null);
INSERT INTO "SCM"."T_ORD_ORDERITM" VALUES ('11052', '8100', '19789', '支', '2', null, '2', null, null, null, null, null, null, null);
INSERT INTO "SCM"."T_ORD_ORDERITM" VALUES ('10055', '7053', '19762', '袋', null, null, '0', null, null, null, null, null, null, null);
INSERT INTO "SCM"."T_ORD_ORDERITM" VALUES ('10050', '7050', '19761', 'mg', '2', null, '0', null, null, null, null, null, null, null);
INSERT INTO "SCM"."T_ORD_ORDERITM" VALUES ('10051', '7050', '19762', '袋', '3', null, '0', null, null, null, null, null, null, null);
INSERT INTO "SCM"."T_ORD_ORDERITM" VALUES ('10052', '7051', '19761', 'mg', '999', null, '0', null, null, null, null, null, null, null);
INSERT INTO "SCM"."T_ORD_ORDERITM" VALUES ('10053', '7051', '19762', '袋', '22', null, '0', null, null, null, null, null, null, null);
INSERT INTO "SCM"."T_ORD_ORDERITM" VALUES ('10054', '7052', '19761', 'mg', null, null, '0', null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for T_ORD_SHOPPING
-- ----------------------------
DROP TABLE "SCM"."T_ORD_SHOPPING";
CREATE TABLE "SCM"."T_ORD_SHOPPING" (
"SHOP_ID" NUMBER NOT NULL ,
"SHOP_HOP_INCID" NUMBER NULL ,
"SHOP_QTY" NUMBER NULL ,
"SHOP_UOM" VARCHAR2(50 BYTE) NULL ,
"SHOP_USERID" NUMBER NULL ,
"SHOP_CHECKFLAG" NUMBER NULL ,
"SHOP_VEN_INCID" NUMBER NULL ,
"SHOP_RP" FLOAT(126) NULL ,
"SHOP_NAME" VARCHAR2(100 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "SCM"."T_ORD_SHOPPING" IS '购物车';

-- ----------------------------
-- Records of T_ORD_SHOPPING
-- ----------------------------

-- ----------------------------
-- Table structure for T_ORD_STATE
-- ----------------------------
DROP TABLE "SCM"."T_ORD_STATE";
CREATE TABLE "SCM"."T_ORD_STATE" (
"STATE_ID" NUMBER NOT NULL ,
"STATE_CODE" VARCHAR2(255 BYTE) NULL ,
"STATE_NAME" VARCHAR2(255 BYTE) NULL ,
"STATE_SEQ" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "SCM"."T_ORD_STATE" IS '订单状态表';

-- ----------------------------
-- Records of T_ORD_STATE
-- ----------------------------
INSERT INTO "SCM"."T_ORD_STATE" VALUES ('51', '收到订单/下载订单1', '收到订单/下载订单1', '2');
INSERT INTO "SCM"."T_ORD_STATE" VALUES ('54', '回传发票', '回传发票', '3');
INSERT INTO "SCM"."T_ORD_STATE" VALUES ('55', '收货', '收货', '4');
INSERT INTO "SCM"."T_ORD_STATE" VALUES ('1050', '新建', '新建', '1');

-- ----------------------------
-- Table structure for T_SYS_APPNO
-- ----------------------------
DROP TABLE "SCM"."T_SYS_APPNO";
CREATE TABLE "SCM"."T_SYS_APPNO" (
"APPNO_PRE" VARCHAR2(20 BYTE) NULL ,
"APPNO_ID" NUMBER NOT NULL ,
"APPNO_COUNT" NUMBER NULL ,
"APPNO_DATE" DATE NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of T_SYS_APPNO
-- ----------------------------
INSERT INTO "SCM"."T_SYS_APPNO" VALUES ('ORD', '1050', '10', TO_DATE('2015-03-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "SCM"."T_SYS_APPNO" VALUES ('ORD', '50', '22', TO_DATE('2015-03-23 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "SCM"."T_SYS_APPNO" VALUES ('ORD', '1100', '9', TO_DATE('2015-03-25 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));

-- ----------------------------
-- Table structure for T_SYS_CTLOC
-- ----------------------------
DROP TABLE "SCM"."T_SYS_CTLOC";
CREATE TABLE "SCM"."T_SYS_CTLOC" (
"CTLOC_ID" NUMBER NOT NULL ,
"CTLOC_CODE" VARCHAR2(150 BYTE) NULL ,
"CTLOC_NAME" VARCHAR2(150 BYTE) NULL ,
"CTLOC_HOSPID" NUMBER NULL ,
"CTLOC_HISID" NUMBER NULL ,
"CTLOC_TYPE" VARCHAR2(50 BYTE) NULL ,
"CTLOC_DEST" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "SCM"."T_SYS_CTLOC" IS '科室';
COMMENT ON COLUMN "SCM"."T_SYS_CTLOC"."CTLOC_CODE" IS 'code';
COMMENT ON COLUMN "SCM"."T_SYS_CTLOC"."CTLOC_NAME" IS 'name';
COMMENT ON COLUMN "SCM"."T_SYS_CTLOC"."CTLOC_HOSPID" IS '医院Id';
COMMENT ON COLUMN "SCM"."T_SYS_CTLOC"."CTLOC_HISID" IS 'his里科室Id';
COMMENT ON COLUMN "SCM"."T_SYS_CTLOC"."CTLOC_TYPE" IS '1:入库科室，2:收货科室,3:全部';
COMMENT ON COLUMN "SCM"."T_SYS_CTLOC"."CTLOC_DEST" IS '默认收货地址';

-- ----------------------------
-- Records of T_SYS_CTLOC
-- ----------------------------
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('143', '6', 'JSJS(YJK)-计算机室(药剂科)', '7', null, '3', '109');
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('144', '2100004', 'ZLS(YJK)-资料室(药剂科)', '7', null, '3', null);
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('145', '2100005', 'LCYXS(YJK)-临床药学室(药剂科)', '7', null, '3', null);
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('62', '2100670', '1.1100-药库(药剂科)', '7', null, '3', null);
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('63', 'X&', '试剂中心', '7', null, '3', null);
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('146', '2100006', 'LCYXS(YJK)(XY)-临床药学室(药剂科)(西院)', '7', null, '3', null);
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('147', '2100008', 'YSGZZ(YJK)-医生工作站(药剂科)', '7', null, '3', null);
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('148', '2100470', 'YJS(YJK)-药检室(药剂科)', '7', null, '3', null);
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('149', '2100560', 'SYS(YJK)-实验室(药剂科)', '7', null, '3', null);
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('150', '2100000', 'YJK-药剂科', '7', null, '3', null);
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('151', '2100001', 'YJKBGS-药剂科办公室', '7', null, '3', null);
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('152', '2100002', 'YJKBGS(XY)-药剂科办公室(西院)', '7', null, '3', null);
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('153', '2100370', 'ZJYK-制剂药库(药剂科)', '7', null, '3', null);
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('155', '2100677', '6.1100-药库(药剂科)(西院)', '7', null, '3', null);
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('156', '2100771', '1.1300-试剂库(药剂科)', '7', null, '3', null);
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('157', '2100870', 'YPHJS(YJK)-药品会计室(药剂科)', '7', null, '3', null);
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('112', '2100171', '1.2100-门诊药房(药剂科)', '7', null, '3', null);
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('113', '2100175', '1.2300-外宾药房(药剂科)', '7', null, '3', null);
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('114', '2100176', '1.2200-急诊药房(药剂科)', '7', null, '3', null);
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('115', '2100177', '1.2600-病房药房(药剂科)', '7', null, '3', null);
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('116', '2100179', '1.2400-特需药房(药剂科)', '7', null, '3', null);
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('117', '2100180', '6.2100-门诊药房(药剂科)(西院)', '7', null, '3', null);
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('118', '2100181', '6.2600-病房药房(药剂科)(西院)', '7', null, '3', null);
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('119', '2100183', 'GBYF(YJK)(XY)-干部药房(药剂科)(西院)', '7', null, '3', null);
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('120', '2100184', '6.2200-急诊药房(药剂科)(西院)', '7', null, '3', null);
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('121', '2100185', '6.2700-输液库(药剂科)(西院)', '7', null, '3', null);
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('122', '2100178', '1.2700-输液库(药剂科)', '7', null, '3', null);
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('123', '2100172', '(TY)MZECYF-(停用)门诊二层药房', '7', null, '3', null);
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('124', '2100173', '(TY)MZSCYF-(停用)门诊三层药房', '7', null, '3', null);
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('125', '2100174', '(TY)MZEKYF-(停用)门诊儿科药房', '7', null, '3', null);
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('126', '2100182', '(TY)BLXYF-(停用)北楼西药房', '7', null, '3', null);
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('127', '2100270', '(TY)ZYF-(停用)中药房', '7', null, '3', null);
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('128', '2100271', '(TY)MZZYF-(停用)门诊中药房', '7', null, '3', null);
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('129', '2100272', '(TY)WBZYF-(停用)外宾中药房', '7', null, '3', null);
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('130', '2100275', '(TY)BLZYF-(停用)北楼中药房', '7', null, '3', null);
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('131', '2100276', '(TY)TXZYF-(停用)特需中药房', '7', null, '3', null);
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('132', '2100278', '(TY)MZZCYF(XY)-(停用)门诊中草药房(西院)', '7', null, '3', null);
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('133', '2100279', '(TY)MZZYF(XY)-(停用)门诊中药房(西院)', '7', null, '3', null);
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('134', '2100280', '(TY)GBZYF(XY)-(停用)干部中药房(西院)', '7', null, '3', null);
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('135', '2100281', '(TY)ZYZYF(XY)-(停用)住院中药房(西院)', '7', null, '3', null);
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('136', '2100282', '(TY)ZYZYF-(停用)住院中药房', '7', null, '3', null);
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('137', '2100900', 'YJKPYZX-药剂科配液中心', '7', null, '3', null);
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('138', '2109999', 'TRTYF-同仁堂中草药房', '7', null, '3', null);
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('139', 'PUSURG', 'JBWKYZNYG-基本外科一智能药柜', '7', null, '3', null);
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('140', 'PUHEMA', 'XYNKYZNYG-血液内科一智能药柜', '7', null, '3', null);
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('141', 'PUICU', 'ZZYXKZNYK-重症医学科智能药柜', '7', null, '3', null);
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('142', '8661520', '1.2900-帅府药房(药剂科)', '7', null, '3', null);

-- ----------------------------
-- Table structure for T_SYS_CTLOC_DESTINATION
-- ----------------------------
DROP TABLE "SCM"."T_SYS_CTLOC_DESTINATION";
CREATE TABLE "SCM"."T_SYS_CTLOC_DESTINATION" (
"CTLOCDES_ID" NUMBER NOT NULL ,
"CTLOCDES_CTLOCDR" NUMBER NULL ,
"CTLOCDES_DESTINATION" VARCHAR2(500 BYTE) NULL ,
"CTLOCDES_TEL" VARCHAR2(50 BYTE) NULL ,
"CTLOCDES_MAIL" VARCHAR2(500 BYTE) NULL ,
"CTLOCDES_CONTACT" NUMBER NULL ,
"CTLOCDES_CONTACT2" VARCHAR2(10 BYTE) NULL ,
"CTLOCDES_CODE" VARCHAR2(50 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "SCM"."T_SYS_CTLOC_DESTINATION" IS '科室收货地点';
COMMENT ON COLUMN "SCM"."T_SYS_CTLOC_DESTINATION"."CTLOCDES_CTLOCDR" IS '科室Id';
COMMENT ON COLUMN "SCM"."T_SYS_CTLOC_DESTINATION"."CTLOCDES_DESTINATION" IS '收货地点';
COMMENT ON COLUMN "SCM"."T_SYS_CTLOC_DESTINATION"."CTLOCDES_TEL" IS '联系电话';
COMMENT ON COLUMN "SCM"."T_SYS_CTLOC_DESTINATION"."CTLOCDES_CONTACT" IS '联系人t_sys_normal_user';

-- ----------------------------
-- Records of T_SYS_CTLOC_DESTINATION
-- ----------------------------
INSERT INTO "SCM"."T_SYS_CTLOC_DESTINATION" VALUES ('61', '62', '血透中心', '115', '908067886@qq.com', null, '123', '2702');
INSERT INTO "SCM"."T_SYS_CTLOC_DESTINATION" VALUES ('102', '62', '外科手术室', null, null, null, null, '2704');
INSERT INTO "SCM"."T_SYS_CTLOC_DESTINATION" VALUES ('103', '62', '门诊膀胱镜室', null, null, null, null, '2705');
INSERT INTO "SCM"."T_SYS_CTLOC_DESTINATION" VALUES ('104', '62', '病理科', null, null, null, null, '2707');
INSERT INTO "SCM"."T_SYS_CTLOC_DESTINATION" VALUES ('105', '62', '耳鼻喉科实验室老楼15楼', null, null, null, null, '2708');
INSERT INTO "SCM"."T_SYS_CTLOC_DESTINATION" VALUES ('106', '62', '干保基地', null, null, null, null, '2709');
INSERT INTO "SCM"."T_SYS_CTLOC_DESTINATION" VALUES ('107', '62', '门诊四楼静脉配液中心', null, null, null, null, '2711');
INSERT INTO "SCM"."T_SYS_CTLOC_DESTINATION" VALUES ('108', '117', '西院药库', null, null, null, null, '6.1100-药库(药剂科)(西院)');
INSERT INTO "SCM"."T_SYS_CTLOC_DESTINATION" VALUES ('87', '62', '内科手术室', '12345689000', '908067886@qq.com', null, null, '2701');
INSERT INTO "SCM"."T_SYS_CTLOC_DESTINATION" VALUES ('81', '137', '门诊四楼静脉配液中心', '13919007855', '908067886@qq.com', null, null, '2711');
INSERT INTO "SCM"."T_SYS_CTLOC_DESTINATION" VALUES ('83', '62', '东院输液库', '13919007855', '908067886@qq.com', null, 'ZZZ', '2700');
INSERT INTO "SCM"."T_SYS_CTLOC_DESTINATION" VALUES ('84', '62', '病房药房', '13919007855', '908067886@qq.com', null, 'YYY', '2703');
INSERT INTO "SCM"."T_SYS_CTLOC_DESTINATION" VALUES ('85', '62', '东院药库', '13919007855', '908067886@qq.com', null, 'XXX', '1.1100-药库(药剂科)');
INSERT INTO "SCM"."T_SYS_CTLOC_DESTINATION" VALUES ('109', '143', '甘肃省中医院', '123456789', '4345455@qq.com', null, null, '2100003');

-- ----------------------------
-- Table structure for T_SYS_DICT
-- ----------------------------
DROP TABLE "SCM"."T_SYS_DICT";
CREATE TABLE "SCM"."T_SYS_DICT" (
"DIC_ID" NUMBER NOT NULL ,
"DIC_NAME" VARCHAR2(100 BYTE) NULL ,
"DIC_TYPE" VARCHAR2(100 BYTE) NULL ,
"DIC_VALUE" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "SCM"."T_SYS_DICT" IS '系统字典表';

-- ----------------------------
-- Records of T_SYS_DICT
-- ----------------------------
INSERT INTO "SCM"."T_SYS_DICT" VALUES ('29', '秒', 'taskTimeType', '1');
INSERT INTO "SCM"."T_SYS_DICT" VALUES ('30', '分种', 'taskTimeType', '2');
INSERT INTO "SCM"."T_SYS_DICT" VALUES ('32', '小时', 'taskTimeType', '3');
INSERT INTO "SCM"."T_SYS_DICT" VALUES ('33', '天', 'taskTimeType', '4');
INSERT INTO "SCM"."T_SYS_DICT" VALUES ('1', '使用', 'useState', '1');
INSERT INTO "SCM"."T_SYS_DICT" VALUES ('2', '停用', 'useState', '2');
INSERT INTO "SCM"."T_SYS_DICT" VALUES ('5', '男', 'gender', '1');
INSERT INTO "SCM"."T_SYS_DICT" VALUES ('6', '女', 'gender', '2');

-- ----------------------------
-- Table structure for T_SYS_FUNC
-- ----------------------------
DROP TABLE "SCM"."T_SYS_FUNC";
CREATE TABLE "SCM"."T_SYS_FUNC" (
"FUNC_ID" NUMBER NULL ,
"SEQ" NUMBER NULL ,
"IMGURL" VARCHAR2(200 BYTE) NULL ,
"NAME" VARCHAR2(100 BYTE) NULL ,
"PARENTID" NUMBER NULL ,
"LEAF" NUMBER NULL ,
"FUNC" VARCHAR2(100 BYTE) NULL ,
"URL" VARCHAR2(200 BYTE) NULL ,
"BACKCOLOR" VARCHAR2(100 BYTE) NULL ,
"USESTATE" NUMBER DEFAULT 1  NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "SCM"."T_SYS_FUNC" IS '权限表';
COMMENT ON COLUMN "SCM"."T_SYS_FUNC"."USESTATE" IS '使用状态';

-- ----------------------------
-- Records of T_SYS_FUNC
-- ----------------------------
INSERT INTO "SCM"."T_SYS_FUNC" VALUES ('28', '22', 'icon-book', '字典维护', '11', '1', null, 'sys/sysDictCtrl!listMain.htm', '#5B3AB6', '1');
INSERT INTO "SCM"."T_SYS_FUNC" VALUES ('79', '103', 'icon-road', '订单状态维护', '64', '1', null, 'ord/stateCtrl!listMain.htm', '#CE4B27', '1');
INSERT INTO "SCM"."T_SYS_FUNC" VALUES ('61', '43', 'icon-plus-sign-alt', '药品信息维护', '24', '1', null, 'hop/hopIncCtrl!listMain.htm', '#009600', '1');
INSERT INTO "SCM"."T_SYS_FUNC" VALUES ('77', '101', 'icon-file-alt', '新建订单', '64', '1', null, 'ord/orderCtrl!listMain.htm', '#A300AA', '1');
INSERT INTO "SCM"."T_SYS_FUNC" VALUES ('78', '102', 'icon-search', '订单查询', '64', '1', null, 'ord/orderStateCtrl!listMain.htm', '#0093A8', '1');
INSERT INTO "SCM"."T_SYS_FUNC" VALUES ('64', '100', 'icon-shopping-cart', '订单', '0', '0', null, 'xxx', null, '1');
INSERT INTO "SCM"."T_SYS_FUNC" VALUES ('80', '104', 'icon-briefcase', '选购药品', '64', '1', null, 'ord/orderCtrl!listInc.htm', '#009600', '1');
INSERT INTO "SCM"."T_SYS_FUNC" VALUES ('103', '108', 'icon-building', '医院供应商', '24', '1', null, 'hop/hopVendorCtrl!listMain.htm', '#336666', '1');
INSERT INTO "SCM"."T_SYS_FUNC" VALUES ('104', '109', 'icon-exchange', '供应商对照', '73', '1', null, 'ven/vendorCtrl!ContranstVendor.htm', '#B51C44', '1');
INSERT INTO "SCM"."T_SYS_FUNC" VALUES ('125', '118', 'icon-signin', '导入发票(2)', '106', '1', null, 'ven/venDeliverCtrl!importInvByOrderItm.htm', '#CE4B27', '1');
INSERT INTO "SCM"."T_SYS_FUNC" VALUES ('144', '120', 'icon-signin', '导入订单', '64', '1', null, 'ord/ordCtrl!listMain.htm', '#B51C44', '1');
INSERT INTO "SCM"."T_SYS_FUNC" VALUES ('110', '114', 'icon-screenshot', '订单追踪', '106', '1', null, 'ven/venDeliverCtrl!TrackDeliver.htm', '#0093A8', '1');
INSERT INTO "SCM"."T_SYS_FUNC" VALUES ('111', '115', 'icon-signin', '导入发票', '106', '1', null, 'ven/venDeliverCtrl!importInv.htm', '#CE4B27', '1');
INSERT INTO "SCM"."T_SYS_FUNC" VALUES ('7', '1', 'icon-user', '用户中心', '0', '0', null, 'userManage/userManageCtrl!userManageMain.htm', null, '1');
INSERT INTO "SCM"."T_SYS_FUNC" VALUES ('8', '7', 'icon-th-large', '日志管理', '0', '0', null, 'xx', null, '1');
INSERT INTO "SCM"."T_SYS_FUNC" VALUES ('11', '8', 'icon-cogs', '平台维护', '0', '0', null, 'sys/sysDictCtrl!listMain.htm', '#9d3c25', '1');
INSERT INTO "SCM"."T_SYS_FUNC" VALUES ('12', '9', 'icon-group', '用户管理', '7', '1', null, 'normalAccount/normalAccountCtrl!normalAccountMain.htm', '#009600', '1');
INSERT INTO "SCM"."T_SYS_FUNC" VALUES ('2', '6', 'icon-user', '角色管理', '7', '1', 'xx', 'role/roleCtrl!roleMain.htm', '#5B3AB6', '1');
INSERT INTO "SCM"."T_SYS_FUNC" VALUES ('3', '2', 'icon-lock', '权限管理', '7', '1', 'xx', 'func/funcCtrl!funcMain.htm', '#B51C44', '1');
INSERT INTO "SCM"."T_SYS_FUNC" VALUES ('43', '26', 'icon-hospital', '医院信息维护', '24', '1', null, 'hop/hospitalCtrl!listMain.htm', '#A300AA', '1');
INSERT INTO "SCM"."T_SYS_FUNC" VALUES ('46', '29', 'icon-pencil', '日志配置', '8', '1', null, 'logConfig/logConfigCtrl!main.htm', '#A300AA', '1');
INSERT INTO "SCM"."T_SYS_FUNC" VALUES ('56', '40', 'icon-h-sign', '供应商资质字典', '11', '1', null, 'ven/venQualifTypeCtrl!listMain.htm', '#009600', '1');
INSERT INTO "SCM"."T_SYS_FUNC" VALUES ('70', '44', 'icon-picture', '药品图片维护', '24', '1', null, 'hop/hopIncPicCtrl!listMain.htm', '#CE4B27', '1');
INSERT INTO "SCM"."T_SYS_FUNC" VALUES ('59', '42', 'icon-building', '厂商维护', '24', '1', null, 'manf/hopManfCtrl!listMain.htm', '#0093A8', '1');
INSERT INTO "SCM"."T_SYS_FUNC" VALUES ('84', '106', 'icon-exchange', '药品对照', '73', '1', null, 'ven/vendorCtrl!contranstInc.htm', '#CE4B27', '1');
INSERT INTO "SCM"."T_SYS_FUNC" VALUES ('85', '107', 'icon-signin', '导入模板维护', '11', '1', null, 'sys/sysImpModelCtrl!listMain.htm', '#A300AA', '1');
INSERT INTO "SCM"."T_SYS_FUNC" VALUES ('106', '110', ' icon-tasks', '供应商开票', '0', '0', null, 'xx', null, '1');
INSERT INTO "SCM"."T_SYS_FUNC" VALUES ('107', '111', 'icon-truck', '确认订单', '106', '1', null, 'ord/orderStateCtrl!vendorReciveOrd.htm', '#B51C44', '1');
INSERT INTO "SCM"."T_SYS_FUNC" VALUES ('108', '112', ' icon-money', '录入发票', '106', '1', 'ven/venDeliverCtrl!deliver.htm', 'ord/orderStateCtrl!vendorSendOrd.htm', '#5B3AB6', '1');
INSERT INTO "SCM"."T_SYS_FUNC" VALUES ('109', '113', ' icon-barcode', '打印条码', '106', '1', null, 'ven/venDeliverCtrl!printLabel.htm', '#009600', '1');
INSERT INTO "SCM"."T_SYS_FUNC" VALUES ('123', '116', 'icon-tasks', '任务管理', '8', '1', null, 'sys/TaskConfigCtrl!listMain.htm', '#B51C44', '1');
INSERT INTO "SCM"."T_SYS_FUNC" VALUES ('124', '117', ' icon-twitter', '日志', '8', '1', null, 'sys/LogCtrl!listMain.htm', '#009600', '1');
INSERT INTO "SCM"."T_SYS_FUNC" VALUES ('143', '119', ' icon-bar-chart', '供应商明细', '24', '1', null, 'hop/hopVendorCtrl!listDetail.htm', '#1472CF', '1');
INSERT INTO "SCM"."T_SYS_FUNC" VALUES ('24', '25', 'icon-hospital', '医院维护', '0', '0', null, 'hop/hospitalCtrl!listMain.htm', '#861da9', '1');
INSERT INTO "SCM"."T_SYS_FUNC" VALUES ('73', '45', 'icon-building', '供应商维护', '0', '0', null, 'xx', '#861da9', '1');
INSERT INTO "SCM"."T_SYS_FUNC" VALUES ('74', '46', 'icon-building', '供应商信息维护', '73', '1', null, 'ven/vendorCtrl!listMain.htm', '#A300AA', '1');
INSERT INTO "SCM"."T_SYS_FUNC" VALUES ('75', '47', 'icon-plus-sign-alt', '药品信息维护', '73', '1', null, 'ven/venIncCtrl!listMain.htm', '#009600', '1');
INSERT INTO "SCM"."T_SYS_FUNC" VALUES ('66', '27', 'icon-columns', '科室信息', '24', '1', null, 'hop/hopCtlocCtrl!listMain.htm', '#5B3AB6', '1');
INSERT INTO "SCM"."T_SYS_FUNC" VALUES ('76', '48', 'icon-picture', '药品图片维护', '73', '1', null, 'ven/venIncPicCtrl!listMain.htm', '#0093A8', '1');
INSERT INTO "SCM"."T_SYS_FUNC" VALUES ('68', '28', 'icon-medkit', '收货信息', '24', '1', null, 'hop/hopCtlocDestinationCtrl!list.htm', '#B51C44', '1');
INSERT INTO "SCM"."T_SYS_FUNC" VALUES ('83', '105', 'icon-envelope', '发送邮件', '8', '1', null, 'sys/sendMailCtrl!listMain.htm', '#5B3AB6', '1');
INSERT INTO "SCM"."T_SYS_FUNC" VALUES ('163', '49', 'icon-columns', '药品分类维护', '73', '1', null, 'cat/catGroupCtrl!listMain.htm', '#009600', '1');

-- ----------------------------
-- Table structure for T_SYS_FUNC_ROLE
-- ----------------------------
DROP TABLE "SCM"."T_SYS_FUNC_ROLE";
CREATE TABLE "SCM"."T_SYS_FUNC_ROLE" (
"FUNC_ID" NUMBER NULL ,
"ROLE_ID" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of T_SYS_FUNC_ROLE
-- ----------------------------
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('78', '46');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('77', '46');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('80', '46');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('144', '46');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('109', '46');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('59', '46');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('103', '46');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('61', '46');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('143', '46');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('66', '46');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('68', '46');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('104', '46');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('109', '48');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('84', '48');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('106', '48');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('73', '48');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('84', '46');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('64', '46');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('106', '46');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('24', '46');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('73', '46');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('110', '47');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('108', '47');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('107', '47');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('125', '47');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('75', '47');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('106', '47');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('73', '47');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('64', '25');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('79', '25');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('78', '25');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('77', '25');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('80', '25');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('144', '25');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('7', '25');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('12', '25');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('3', '25');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('2', '25');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('8', '25');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('83', '25');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('123', '25');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('124', '25');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('46', '25');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('11', '25');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('56', '25');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('85', '25');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('28', '25');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('106', '25');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('110', '25');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('111', '25');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('109', '25');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('108', '25');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('107', '25');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('125', '25');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('24', '25');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('59', '25');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('43', '25');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('103', '25');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('61', '25');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('143', '25');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('66', '25');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('68', '25');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('70', '25');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('73', '25');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('104', '25');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('84', '25');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('163', '25');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('74', '25');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('75', '25');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('76', '25');

-- ----------------------------
-- Table structure for T_SYS_HOSPITAL
-- ----------------------------
DROP TABLE "SCM"."T_SYS_HOSPITAL";
CREATE TABLE "SCM"."T_SYS_HOSPITAL" (
"HOSPITAL_ID" NUMBER NOT NULL ,
"HOSPITAL_CODE" VARCHAR2(50 BYTE) NULL ,
"HOSPITAL_NAME" VARCHAR2(50 BYTE) NULL ,
"HOSPITAL_HISDR" NUMBER NULL ,
"HOSPITAL_DESTINATION" VARCHAR2(500 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "SCM"."T_SYS_HOSPITAL" IS '医院';
COMMENT ON COLUMN "SCM"."T_SYS_HOSPITAL"."HOSPITAL_CODE" IS 'code';
COMMENT ON COLUMN "SCM"."T_SYS_HOSPITAL"."HOSPITAL_NAME" IS 'name';
COMMENT ON COLUMN "SCM"."T_SYS_HOSPITAL"."HOSPITAL_HISDR" IS 'his中的医院id';
COMMENT ON COLUMN "SCM"."T_SYS_HOSPITAL"."HOSPITAL_DESTINATION" IS '地址';

-- ----------------------------
-- Records of T_SYS_HOSPITAL
-- ----------------------------
INSERT INTO "SCM"."T_SYS_HOSPITAL" VALUES ('7', 'bjxh', '北京协和', '3', '北京市东城区东单北大街协和明日楼');

-- ----------------------------
-- Table structure for T_SYS_IMPMODEL
-- ----------------------------
DROP TABLE "SCM"."T_SYS_IMPMODEL";
CREATE TABLE "SCM"."T_SYS_IMPMODEL" (
"IMPMODEL_ID" NUMBER NOT NULL ,
"IMPMODEL_TYPE" VARCHAR2(50 BYTE) NULL ,
"IMPMODEL_NAME" VARCHAR2(250 BYTE) NULL ,
"IMPMODEL_SEQ" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of T_SYS_IMPMODEL
-- ----------------------------
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('249', 'HOPVENDOR', '代码', '0');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('250', 'HOPVENDOR', '名称', '1');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('251', 'HOPVENDOR', '类别', '2');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('252', 'HOPVENDOR', '别名', '3');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('253', 'HOPVENDOR', '地址', '4');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('254', 'HOPVENDOR', '电话', '5');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('255', 'HOPVENDOR', '联系人', '6');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('256', 'HOPVENDOR', '发货地点', '7');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('257', 'HOPVENDOR', '邮箱', '8');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('364', 'ORDER', '自然序号', '0');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('365', 'ORDER', '定价单位', '1');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('366', 'ORDER', 'HIS药品代码', '2');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('367', 'ORDER', '药品名称', '3');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('368', 'ORDER', '规格', '4');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('369', 'ORDER', '剂型', '5');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('370', 'ORDER', '数量', '6');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('371', 'ORDER', '进价', '7');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('372', 'ORDER', '效期', '8');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('373', 'ORDER', '类别', '9');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('374', 'ORDER', '供应商代码', '10');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('375', 'ORDER', '供应商名称', '11');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('376', 'ORDER', '生产厂家编码', '12');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('377', 'ORDER', '生产厂家名称', '13');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('378', 'ORDER', '订单号', '14');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('379', 'ORDER', '接收院区', '15');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('380', 'ORDER', '收货地址', '16');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('381', 'ORDER', '入库科室', '17');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('382', 'ORDER', '采购日期', '18');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('383', 'ORDER', '要求送货时间', '19');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('384', 'ORDER', '是否加急', '20');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('301', 'VENINC', '药品代码', '0');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('302', 'VENINC', '药品名称', '1');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('303', 'VENINC', '单位描述', '2');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('304', 'VENINC', '生产厂家', '3');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('305', 'VENINC', '进价', '4');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('306', 'VENINC', '规格', '5');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('10', 'VENINVBYORDER', '数量', '3');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('9', 'VENINVBYORDER', '发票', '2');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('8', 'VENINVBYORDER', '供应商药品代码', '1');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('13', 'VENINVBYORDER', '进价', '6');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('12', 'VENINVBYORDER', '效期', '5');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('11', 'VENINVBYORDER', '批号', '4');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('22', 'IMPBYORDERITEM', '订单明细ID', '0');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('23', 'IMPBYORDERITEM', '供应商药品代码', '1');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('1', 'VENINV', '供应商药品代码', '0');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('2', 'VENINV', '发票', '1');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('3', 'VENINV', '数量', '2');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('4', 'VENINV', '批号', '3');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('5', 'VENINV', '效期', '4');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('6', 'VENINV', '进价', '5');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('7', 'VENINVBYORDER', '订单号', '0');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('24', 'IMPBYORDERITEM', '发票号', '2');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('25', 'IMPBYORDERITEM', '数量', '3');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('26', 'IMPBYORDERITEM', '进价', '4');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('27', 'IMPBYORDERITEM', '进价金额', '5');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('28', 'IMPBYORDERITEM', '批号', '6');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('29', 'IMPBYORDERITEM', '效期', '7');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('230', 'INC', '代码', '0');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('231', 'INC', '名称', '1');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('232', 'INC', '规格', '2');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('233', 'INC', '入库单位', '3');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('234', 'INC', '进价', '4');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('235', 'INC', '售价', '5');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('236', 'INC', '产地', '6');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('237', 'INC', '库存分类', '7');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('238', 'INC', '最小单位系数', '8');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('239', 'INC', '别名', '9');

-- ----------------------------
-- Table structure for T_SYS_LOG
-- ----------------------------
DROP TABLE "SCM"."T_SYS_LOG";
CREATE TABLE "SCM"."T_SYS_LOG" (
"ID" VARCHAR2(100 BYTE) NOT NULL ,
"OPUSER" VARCHAR2(100 BYTE) NULL ,
"OPTYPE" VARCHAR2(100 BYTE) NULL ,
"OPDATE" TIMESTAMP(6)  NULL ,
"OPIP" VARCHAR2(100 BYTE) NULL ,
"OPNAME" VARCHAR2(100 BYTE) NULL ,
"OPBEFORE" VARCHAR2(4000 BYTE) NULL ,
"OPAFTER" VARCHAR2(4000 BYTE) NULL ,
"OPRESULT" VARCHAR2(4000 BYTE) NULL ,
"OPARG" CLOB NULL ,
"OPRESULTS" CLOB NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "SCM"."T_SYS_LOG" IS '系统日志表';
COMMENT ON COLUMN "SCM"."T_SYS_LOG"."ID" IS 'id';
COMMENT ON COLUMN "SCM"."T_SYS_LOG"."OPUSER" IS '操作人';
COMMENT ON COLUMN "SCM"."T_SYS_LOG"."OPTYPE" IS '操作类型';
COMMENT ON COLUMN "SCM"."T_SYS_LOG"."OPDATE" IS '操作时间';
COMMENT ON COLUMN "SCM"."T_SYS_LOG"."OPIP" IS '操作ip';
COMMENT ON COLUMN "SCM"."T_SYS_LOG"."OPNAME" IS '操作名称';
COMMENT ON COLUMN "SCM"."T_SYS_LOG"."OPBEFORE" IS '操作前数据';
COMMENT ON COLUMN "SCM"."T_SYS_LOG"."OPAFTER" IS '操作后数据';
COMMENT ON COLUMN "SCM"."T_SYS_LOG"."OPRESULT" IS '结果';
COMMENT ON COLUMN "SCM"."T_SYS_LOG"."OPARG" IS '参数';
COMMENT ON COLUMN "SCM"."T_SYS_LOG"."OPRESULTS" IS '结果';

-- ----------------------------
-- Records of T_SYS_LOG
-- ----------------------------
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('297eacb94c510033014c516ace0a0007', '67', 'webservice', TO_TIMESTAMP(' 2015-03-25 22:51:36:330000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '127.0.0.1', '护士确认收货调用his接口', null, null, null, '{"inPoImInfos":{"getSCIInPoImInfo":[{"inciDr":"524","batNo":"20150325","invNo":"1333","expDate":"2015-04-01","realqty":"0.083333336","ctuomdr":"17","realPrice":"1.8333334","realTotal":null,"vendorDR":"3","phmnfDR":"602","reCTLOCDR":"6","pmsInPoID":"297eacb94c510033014c5164f5730006","ingdReced":null,"receiveDate":null,"receiveTime":null,"orderQty":"12.0"}]}}', '{"resultCode":"1","resultContent":""}');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('297eacb94c51850a014c5194aecc0000', '8', 'webservice', TO_TIMESTAMP(' 2015-03-25 23:37:20:844000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '127.0.0.1', '护士确认收货调用his接口', null, null, null, '{"inPoImInfos":{"getSCIInPoImInfo":[{"inciDr":"得力中性笔(黑)","batNo":"20150325","invNo":"222","expDate":"2015-03-31","realqty":"0.16666667","ctuomdr":"17","realPrice":"0.9166667","realTotal":null,"vendorDR":"3","phmnfDR":"602","reCTLOCDR":"6","pmsInPoID":"297eacb94c510033014c5164ba540005","ingdReced":null,"receiveDate":null,"receiveTime":null,"orderQty":"48.0"}]}}', '{"resultCode":"1","resultContent":""}');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('297eacb94c51850a014c5197d9c70001', '8', 'webservice', TO_TIMESTAMP(' 2015-03-25 23:40:48:454000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '127.0.0.1', '护士确认收货调用his接口', null, null, null, '{"inPoImInfos":{"getSCIInPoImInfo":[{"inciDr":"524","batNo":"20150325","invNo":"1333","expDate":"2015-04-01","realqty":"0.083333336","ctuomdr":"17","realPrice":"1.8333334","realTotal":null,"vendorDR":"3","phmnfDR":"602","reCTLOCDR":"6","pmsInPoID":"297eacb94c510033014c5164f5730006","ingdReced":null,"receiveDate":null,"receiveTime":null,"orderQty":"12.0"}]}}', '{"resultCode":"1","resultContent":""}');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('297eacb94c51850a014c519ccfee0002', '67', 'webservice', TO_TIMESTAMP(' 2015-03-25 23:46:13:613000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '127.0.0.1', '护士确认收货调用his接口', null, null, null, '{"inPoImInfos":{"getSCIInPoImInfo":[{"inciDr":"得力中性笔(黑)","batNo":"20150325","invNo":"222","expDate":"2015-03-31","realqty":"0.16666667","ctuomdr":"17","realPrice":"0.9166667","realTotal":null,"vendorDR":"3","phmnfDR":"602","reCTLOCDR":"6","pmsInPoID":"297eacb94c510033014c5164ba540005","ingdReced":null,"receiveDate":null,"receiveTime":null,"orderQty":"48.0"}]}}', '{"resultCode":"1","resultContent":""}');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('297eacb94c51850a014c519d3f4c0003', '67', 'webservice', TO_TIMESTAMP(' 2015-03-25 23:46:42:123000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '127.0.0.1', '护士确认收货调用his接口', null, null, null, '{"inPoImInfos":{"getSCIInPoImInfo":[{"inciDr":"524","batNo":"20150325","invNo":"1333","expDate":"2015-04-01","realqty":"0.083333336","ctuomdr":"17","realPrice":"1.8333334","realTotal":null,"vendorDR":"3","phmnfDR":"602","reCTLOCDR":"6","pmsInPoID":"297eacb94c510033014c5164f5730006","ingdReced":null,"receiveDate":null,"receiveTime":null,"orderQty":"12.0"}]}}', '{"resultCode":"1","resultContent":""}');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('297eacb94c51850a014c51a0afd80005', '67', 'webservice', TO_TIMESTAMP(' 2015-03-25 23:50:27:543000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '127.0.0.1', '护士确认收货调用his接口', null, null, null, '{"inPoImInfos":{"getSCIInPoImInfo":[{"inciDr":"524","batNo":"222","invNo":"23","expDate":"2015-04-02","realqty":"0.083333336","ctuomdr":"17","realPrice":"0.16666667","realTotal":null,"vendorDR":"3","phmnfDR":"602","reCTLOCDR":"6","pmsInPoID":"297eacb94c51850a014c519fe0020004","ingdReced":null,"receiveDate":null,"receiveTime":null,"orderQty":"24.0"}]}}', '{"resultCode":"1","resultContent":""}');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('297eacb94c510033014c511c332b0001', '67', 'webservice', TO_TIMESTAMP(' 2015-03-25 21:25:44:874000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '127.0.0.1', '护士确认收货调用his接口', null, null, null, null, '{"resultCode":"-2","resultContent":""}');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('297eacb94c510033014c511ea39a0002', '67', 'webservice', TO_TIMESTAMP(' 2015-03-25 21:28:24:724000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '127.0.0.1', '护士确认收货调用his接口', null, null, null, '{"inPoImInfos":{"getSCIInPoImInfo":[{"inciDr":"524525","batNo":"33","invNo":"2","expDate":"2015-03-24","realqty":"2.0","ctuomdr":"17","realPrice":"2.0","realTotal":null,"vendorDR":"3","phmnfDR":null,"reCTLOCDR":"6","pmsInPoID":"4028b7c64c5060b6014c506a80c20001","ingdReced":null,"receiveDate":null,"receiveTime":null,"orderQty":"1.0"}]}}', '{"resultCode":"-2","resultContent":""}');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('297eacb94c510033014c511eca8e0003', '67', 'webservice', TO_TIMESTAMP(' 2015-03-25 21:28:34:701000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '127.0.0.1', '护士确认收货调用his接口', null, null, null, '{"inPoImInfos":{"getSCIInPoImInfo":[{"inciDr":"524525","batNo":"33","invNo":"2","expDate":"2015-03-24","realqty":"2.0","ctuomdr":"17","realPrice":"2.0","realTotal":null,"vendorDR":"3","phmnfDR":null,"reCTLOCDR":"6","pmsInPoID":"4028b7c64c5060b6014c506a80c20001","ingdReced":null,"receiveDate":null,"receiveTime":null,"orderQty":"1.0"}]}}', '{"resultCode":"-2","resultContent":""}');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('297eacb94c510033014c511f65680004', '67', 'webservice', TO_TIMESTAMP(' 2015-03-25 21:29:14:343000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '127.0.0.1', '护士确认收货调用his接口', null, null, null, '{"inPoImInfos":{"getSCIInPoImInfo":[{"inciDr":"524525","batNo":"33","invNo":"2","expDate":"2015-03-24","realqty":"2.0","ctuomdr":"17","realPrice":"2.0","realTotal":null,"vendorDR":"3","phmnfDR":null,"reCTLOCDR":"6","pmsInPoID":"4028b7c64c5060b6014c506a80c20001","ingdReced":null,"receiveDate":null,"receiveTime":null,"orderQty":"1.0"}]}}', '{"resultCode":"1","resultContent":""}');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('297ec3224c34de4b014c34f9cbe70000', 'nur123', 'excel上传', TO_TIMESTAMP(' 2015-03-20 10:18:46:872000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '127.0.0.1', '医院订单excel导入', null, null, null, null, '<BR>');

-- ----------------------------
-- Table structure for T_SYS_NORMAL_ACCOUNT
-- ----------------------------
DROP TABLE "SCM"."T_SYS_NORMAL_ACCOUNT";
CREATE TABLE "SCM"."T_SYS_NORMAL_ACCOUNT" (
"ACCOUNT_ID" NUMBER NOT NULL ,
"NAME" VARCHAR2(100 BYTE) NULL ,
"ALIAS" VARCHAR2(100 BYTE) NULL ,
"PASSWORD" VARCHAR2(100 BYTE) DEFAULT 1  NULL ,
"SESSIONKEY" VARCHAR2(100 BYTE) NULL ,
"DESCRIPTION" VARCHAR2(500 BYTE) NULL ,
"USESTATE" NUMBER DEFAULT 1  NULL ,
"ONLINESTATE" NUMBER NULL ,
"REGTIME" DATE NULL ,
"UPDATETIME" DATE NULL ,
"LOGINTIME" DATE NULL ,
"LOGNUM" NUMBER NULL ,
"USER_ID" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "SCM"."T_SYS_NORMAL_ACCOUNT" IS '登录帐号';
COMMENT ON COLUMN "SCM"."T_SYS_NORMAL_ACCOUNT"."SESSIONKEY" IS '描述';
COMMENT ON COLUMN "SCM"."T_SYS_NORMAL_ACCOUNT"."DESCRIPTION" IS '描述';
COMMENT ON COLUMN "SCM"."T_SYS_NORMAL_ACCOUNT"."USESTATE" IS '使用状态';
COMMENT ON COLUMN "SCM"."T_SYS_NORMAL_ACCOUNT"."ONLINESTATE" IS '在线状态';
COMMENT ON COLUMN "SCM"."T_SYS_NORMAL_ACCOUNT"."REGTIME" IS '增加时间';
COMMENT ON COLUMN "SCM"."T_SYS_NORMAL_ACCOUNT"."UPDATETIME" IS '更新时间';
COMMENT ON COLUMN "SCM"."T_SYS_NORMAL_ACCOUNT"."LOGINTIME" IS '登录时间';
COMMENT ON COLUMN "SCM"."T_SYS_NORMAL_ACCOUNT"."LOGNUM" IS '登录次数';

-- ----------------------------
-- Records of T_SYS_NORMAL_ACCOUNT
-- ----------------------------
INSERT INTO "SCM"."T_SYS_NORMAL_ACCOUNT" VALUES ('49', '1406617599220', 'bjhryy', '1', null, null, '1', null, TO_DATE('2014-07-29 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), null, '53');
INSERT INTO "SCM"."T_SYS_NORMAL_ACCOUNT" VALUES ('8', '1402538433404', 'vendor', '1', null, null, '1', null, TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), null, '15');
INSERT INTO "SCM"."T_SYS_NORMAL_ACCOUNT" VALUES ('9', '1402638899646', 'medical', '1', null, null, '1', null, null, null, null, null, '16');
INSERT INTO "SCM"."T_SYS_NORMAL_ACCOUNT" VALUES ('47', '1406550154073', 'test11', '1', null, null, '1', null, TO_DATE('2014-07-28 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), null, null, null, '51');
INSERT INTO "SCM"."T_SYS_NORMAL_ACCOUNT" VALUES ('1', 'system', 'system', 'dhcc_1024', null, null, '1', null, TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), null, '11');
INSERT INTO "SCM"."T_SYS_NORMAL_ACCOUNT" VALUES ('6', '1397388531265', 'vendor2', '1', null, null, '1', null, TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), null, '10');
INSERT INTO "SCM"."T_SYS_NORMAL_ACCOUNT" VALUES ('27', '1403686096048', 'medical2', '1', null, null, '1', null, TO_DATE('2014-06-25 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), null, null, null, '31');
INSERT INTO "SCM"."T_SYS_NORMAL_ACCOUNT" VALUES ('48', '1406617462726', 'bjkyhx', '1', null, null, '1', null, TO_DATE('2014-07-29 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), null, '52');
INSERT INTO "SCM"."T_SYS_NORMAL_ACCOUNT" VALUES ('67', '1426477103174', 'nur123', '1', null, null, '1', null, TO_DATE('2015-03-16 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), null, '71');

-- ----------------------------
-- Table structure for T_SYS_NORMAL_USER
-- ----------------------------
DROP TABLE "SCM"."T_SYS_NORMAL_USER";
CREATE TABLE "SCM"."T_SYS_NORMAL_USER" (
"USER_ID" NUMBER NOT NULL ,
"REALNAME" VARCHAR2(300 BYTE) NULL ,
"SEX" VARCHAR2(300 BYTE) NULL ,
"NATION" VARCHAR2(300 BYTE) NULL ,
"ADDRESS" VARCHAR2(300 BYTE) NULL ,
"BIRTH" DATE NULL ,
"TEL" VARCHAR2(300 BYTE) NULL ,
"EMAIL" VARCHAR2(300 BYTE) NULL ,
"TYPE" NUMBER NULL ,
"VENDORID" NUMBER NULL ,
"LOCID" NUMBER NULL ,
"REGTIME" DATE NULL ,
"UPDTIME" DATE NULL ,
"USESTATE" NUMBER DEFAULT 1  NULL ,
"CARDID" VARCHAR2(300 BYTE) NULL ,
"DESCRIPT" VARCHAR2(1000 BYTE) NULL ,
"FACCOUNT_ID" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "SCM"."T_SYS_NORMAL_USER" IS '用户明细信息表';
COMMENT ON COLUMN "SCM"."T_SYS_NORMAL_USER"."REALNAME" IS '真实姓名';
COMMENT ON COLUMN "SCM"."T_SYS_NORMAL_USER"."SEX" IS '性别';
COMMENT ON COLUMN "SCM"."T_SYS_NORMAL_USER"."NATION" IS '名族';
COMMENT ON COLUMN "SCM"."T_SYS_NORMAL_USER"."ADDRESS" IS '家庭地址';
COMMENT ON COLUMN "SCM"."T_SYS_NORMAL_USER"."BIRTH" IS '生日';
COMMENT ON COLUMN "SCM"."T_SYS_NORMAL_USER"."TEL" IS '电话';
COMMENT ON COLUMN "SCM"."T_SYS_NORMAL_USER"."EMAIL" IS '电子邮箱';
COMMENT ON COLUMN "SCM"."T_SYS_NORMAL_USER"."TYPE" IS '人员类型(0,工作，1医院,2,供应商)';
COMMENT ON COLUMN "SCM"."T_SYS_NORMAL_USER"."VENDORID" IS '供应商rowid';
COMMENT ON COLUMN "SCM"."T_SYS_NORMAL_USER"."LOCID" IS '科室rowid';
COMMENT ON COLUMN "SCM"."T_SYS_NORMAL_USER"."REGTIME" IS '增加时间';
COMMENT ON COLUMN "SCM"."T_SYS_NORMAL_USER"."UPDTIME" IS '更新时间';
COMMENT ON COLUMN "SCM"."T_SYS_NORMAL_USER"."USESTATE" IS '使用状态';
COMMENT ON COLUMN "SCM"."T_SYS_NORMAL_USER"."CARDID" IS '身份证';
COMMENT ON COLUMN "SCM"."T_SYS_NORMAL_USER"."DESCRIPT" IS '描述';

-- ----------------------------
-- Records of T_SYS_NORMAL_USER
-- ----------------------------
INSERT INTO "SCM"."T_SYS_NORMAL_USER" VALUES ('11', ''''';drop scm', '1', null, null, TO_DATE('2013-04-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '13919007855', 'zhouzhoumanman@gmail.com', '1', null, '62', TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1', null, null, null);
INSERT INTO "SCM"."T_SYS_NORMAL_USER" VALUES ('53', null, null, null, null, TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), null, null, '2', '5798', null, TO_DATE('2014-07-29 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1', null, null, null);
INSERT INTO "SCM"."T_SYS_NORMAL_USER" VALUES ('15', '供应商甲', null, null, null, null, null, null, '2', '7121', null, TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1', null, null, null);
INSERT INTO "SCM"."T_SYS_NORMAL_USER" VALUES ('16', '药库甲', null, null, null, null, null, '908067886@qq.com', '1', null, '62', null, null, '1', null, null, null);
INSERT INTO "SCM"."T_SYS_NORMAL_USER" VALUES ('51', '王校长', null, null, null, null, null, null, '2', '5778', null, TO_DATE('2014-07-28 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), null, '1', null, null, null);
INSERT INTO "SCM"."T_SYS_NORMAL_USER" VALUES ('10', 'II', '1', null, null, TO_DATE('2013-04-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), null, null, '2', '6521', null, TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1', null, null, null);
INSERT INTO "SCM"."T_SYS_NORMAL_USER" VALUES ('31', null, null, null, null, null, null, 'zhouxin@dhcc.com.cn', '1', null, '66', TO_DATE('2014-06-25 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), null, '1', null, null, null);
INSERT INTO "SCM"."T_SYS_NORMAL_USER" VALUES ('52', null, null, null, null, TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), null, null, '2', '5783', null, TO_DATE('2014-07-29 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1', null, null, null);
INSERT INTO "SCM"."T_SYS_NORMAL_USER" VALUES ('71', '周医院123312312', '2', '汉', '兰州市七里河区', TO_DATE('1991-03-06 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '13456789876312321', '1234567@qq.com222', '3', null, '143', TO_DATE('2015-03-16 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1', '510333176509093333', null, null);

-- ----------------------------
-- Table structure for T_SYS_NORMALACCOUNT_ROLE
-- ----------------------------
DROP TABLE "SCM"."T_SYS_NORMALACCOUNT_ROLE";
CREATE TABLE "SCM"."T_SYS_NORMALACCOUNT_ROLE" (
"ACCOUNT_ID" NUMBER NULL ,
"ROLE_ID" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of T_SYS_NORMALACCOUNT_ROLE
-- ----------------------------
INSERT INTO "SCM"."T_SYS_NORMALACCOUNT_ROLE" VALUES ('1', '25');
INSERT INTO "SCM"."T_SYS_NORMALACCOUNT_ROLE" VALUES ('48', '47');
INSERT INTO "SCM"."T_SYS_NORMALACCOUNT_ROLE" VALUES ('9', '46');
INSERT INTO "SCM"."T_SYS_NORMALACCOUNT_ROLE" VALUES ('6', '47');
INSERT INTO "SCM"."T_SYS_NORMALACCOUNT_ROLE" VALUES ('27', '46');
INSERT INTO "SCM"."T_SYS_NORMALACCOUNT_ROLE" VALUES ('49', '47');
INSERT INTO "SCM"."T_SYS_NORMALACCOUNT_ROLE" VALUES ('47', '47');
INSERT INTO "SCM"."T_SYS_NORMALACCOUNT_ROLE" VALUES ('8', '47');

-- ----------------------------
-- Table structure for T_SYS_ROLE
-- ----------------------------
DROP TABLE "SCM"."T_SYS_ROLE";
CREATE TABLE "SCM"."T_SYS_ROLE" (
"DESCRIPTION" VARCHAR2(1000 BYTE) NULL ,
"CODE" VARCHAR2(100 BYTE) NULL ,
"NAME" VARCHAR2(100 BYTE) NULL ,
"ROLE_ID" NUMBER NOT NULL ,
"USESTATE" VARCHAR2(100 BYTE) DEFAULT 1  NULL ,
"CREATETIME" TIMESTAMP(6)  NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "SCM"."T_SYS_ROLE" IS '角色表';

-- ----------------------------
-- Records of T_SYS_ROLE
-- ----------------------------
INSERT INTO "SCM"."T_SYS_ROLE" VALUES ('system', '1000', 'admin2', '25', '1', TO_TIMESTAMP(' 2014-05-13 10:40:34:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "SCM"."T_SYS_ROLE" VALUES ('医院采购发订单使用', 'H001', '医院采购(药品)', '46', '1', TO_TIMESTAMP(' 2014-06-10 00:00:00:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "SCM"."T_SYS_ROLE" VALUES ('供应商接收订单，回传电子发票', 'S001', '供应商开票', '47', '1', TO_TIMESTAMP(' 2014-06-10 09:34:39:089000', 'YYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "SCM"."T_SYS_ROLE" VALUES (null, 'H002', '医院采购(试剂)', '48', '1', TO_TIMESTAMP(' 2014-06-12 11:30:44:975000', 'YYYY-MM-DD HH24:MI:SS:FF6'));

-- ----------------------------
-- Table structure for T_SYS_ROLE_LOC
-- ----------------------------
DROP TABLE "SCM"."T_SYS_ROLE_LOC";
CREATE TABLE "SCM"."T_SYS_ROLE_LOC" (
"SYS_ROLE_LOC_ID" VARCHAR2(100 BYTE) NULL ,
"SYS_ROLE_ID" NUMBER NULL ,
"SYS_LOC_ID" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of T_SYS_ROLE_LOC
-- ----------------------------
INSERT INTO "SCM"."T_SYS_ROLE_LOC" VALUES ('4028b7c64a5619c2014a566420350004', '25', '62');
INSERT INTO "SCM"."T_SYS_ROLE_LOC" VALUES ('4028b7c64a5619c2014a566420350005', '25', '0');
INSERT INTO "SCM"."T_SYS_ROLE_LOC" VALUES ('297eacb94c4ed254014c4edf591c0000', '47', '0');
INSERT INTO "SCM"."T_SYS_ROLE_LOC" VALUES ('297eacb94c4ed254014c4edf592b0001', '47', '143');
INSERT INTO "SCM"."T_SYS_ROLE_LOC" VALUES ('297eacb94c4ed254014c4edf592b0002', '47', '144');
INSERT INTO "SCM"."T_SYS_ROLE_LOC" VALUES ('297eacb94c4ed254014c4edf592b0003', '47', '145');
INSERT INTO "SCM"."T_SYS_ROLE_LOC" VALUES ('297eacb94c4ed254014c4edf592c0004', '47', '62');
INSERT INTO "SCM"."T_SYS_ROLE_LOC" VALUES ('297eacb94c4ed254014c4edf592c0005', '47', '63');
INSERT INTO "SCM"."T_SYS_ROLE_LOC" VALUES ('297eacb94c4ed254014c4edf592c0006', '47', '146');
INSERT INTO "SCM"."T_SYS_ROLE_LOC" VALUES ('297eacb94c4ed254014c4edf592c0007', '47', '147');
INSERT INTO "SCM"."T_SYS_ROLE_LOC" VALUES ('297eacb94c4ed254014c4edf592c0008', '47', '148');
INSERT INTO "SCM"."T_SYS_ROLE_LOC" VALUES ('297eacb94c4ed254014c4edf592c0009', '47', '149');
INSERT INTO "SCM"."T_SYS_ROLE_LOC" VALUES ('297eacb94c4ed254014c4edf592c000a', '47', '150');
INSERT INTO "SCM"."T_SYS_ROLE_LOC" VALUES ('297eacb94c4ed254014c4edf592c000b', '47', '151');
INSERT INTO "SCM"."T_SYS_ROLE_LOC" VALUES ('297eacb94c4ed254014c4edf592c000c', '47', '152');
INSERT INTO "SCM"."T_SYS_ROLE_LOC" VALUES ('297eacb94c4ed254014c4edf592d000d', '47', '153');
INSERT INTO "SCM"."T_SYS_ROLE_LOC" VALUES ('297eacb94c4ed254014c4edf592d000e', '47', '155');
INSERT INTO "SCM"."T_SYS_ROLE_LOC" VALUES ('297eacb94c4ed254014c4edf592d000f', '47', '156');
INSERT INTO "SCM"."T_SYS_ROLE_LOC" VALUES ('297eacb94c4ed254014c4edf592d0010', '47', '157');
INSERT INTO "SCM"."T_SYS_ROLE_LOC" VALUES ('297eacb94c4ed254014c4edf592d0011', '47', '112');
INSERT INTO "SCM"."T_SYS_ROLE_LOC" VALUES ('297eacb94c4ed254014c4edf592d0012', '47', '113');
INSERT INTO "SCM"."T_SYS_ROLE_LOC" VALUES ('297eacb94c4ed254014c4edf592d0013', '47', '114');
INSERT INTO "SCM"."T_SYS_ROLE_LOC" VALUES ('297eacb94c4ed254014c4edf592d0014', '47', '115');
INSERT INTO "SCM"."T_SYS_ROLE_LOC" VALUES ('297eacb94c4ed254014c4edf592d0015', '47', '116');
INSERT INTO "SCM"."T_SYS_ROLE_LOC" VALUES ('297eacb94c4ed254014c4edf592e0016', '47', '117');
INSERT INTO "SCM"."T_SYS_ROLE_LOC" VALUES ('297eacb94c4ed254014c4edf592e0017', '47', '118');
INSERT INTO "SCM"."T_SYS_ROLE_LOC" VALUES ('297eacb94c4ed254014c4edf592e0018', '47', '119');
INSERT INTO "SCM"."T_SYS_ROLE_LOC" VALUES ('297eacb94c4ed254014c4edf592e0019', '47', '120');
INSERT INTO "SCM"."T_SYS_ROLE_LOC" VALUES ('297eacb94c4ed254014c4edf592e001a', '47', '121');
INSERT INTO "SCM"."T_SYS_ROLE_LOC" VALUES ('297eacb94c4ed254014c4edf592e001b', '47', '122');
INSERT INTO "SCM"."T_SYS_ROLE_LOC" VALUES ('297eacb94c4ed254014c4edf592e001c', '47', '123');
INSERT INTO "SCM"."T_SYS_ROLE_LOC" VALUES ('297eacb94c4ed254014c4edf592e001d', '47', '124');
INSERT INTO "SCM"."T_SYS_ROLE_LOC" VALUES ('297eacb94c4ed254014c4edf592e001e', '47', '125');
INSERT INTO "SCM"."T_SYS_ROLE_LOC" VALUES ('297eacb94c4ed254014c4edf592f001f', '47', '126');
INSERT INTO "SCM"."T_SYS_ROLE_LOC" VALUES ('297eacb94c4ed254014c4edf592f0020', '47', '127');
INSERT INTO "SCM"."T_SYS_ROLE_LOC" VALUES ('297eacb94c4ed254014c4edf592f0021', '47', '128');
INSERT INTO "SCM"."T_SYS_ROLE_LOC" VALUES ('297eacb94c4ed254014c4edf592f0022', '47', '129');
INSERT INTO "SCM"."T_SYS_ROLE_LOC" VALUES ('297eacb94c4ed254014c4edf592f0023', '47', '130');
INSERT INTO "SCM"."T_SYS_ROLE_LOC" VALUES ('297eacb94c4ed254014c4edf592f0024', '47', '131');
INSERT INTO "SCM"."T_SYS_ROLE_LOC" VALUES ('297eacb94c4ed254014c4edf592f0025', '47', '132');
INSERT INTO "SCM"."T_SYS_ROLE_LOC" VALUES ('297eacb94c4ed254014c4edf592f0026', '47', '133');
INSERT INTO "SCM"."T_SYS_ROLE_LOC" VALUES ('297eacb94c4ed254014c4edf592f0027', '47', '134');
INSERT INTO "SCM"."T_SYS_ROLE_LOC" VALUES ('297eacb94c4ed254014c4edf59300028', '47', '135');
INSERT INTO "SCM"."T_SYS_ROLE_LOC" VALUES ('297eacb94c4ed254014c4edf59300029', '47', '136');
INSERT INTO "SCM"."T_SYS_ROLE_LOC" VALUES ('297eacb94c4ed254014c4edf5930002a', '47', '137');
INSERT INTO "SCM"."T_SYS_ROLE_LOC" VALUES ('297eacb94c4ed254014c4edf5930002b', '47', '138');
INSERT INTO "SCM"."T_SYS_ROLE_LOC" VALUES ('297eacb94c4ed254014c4edf5930002c', '47', '139');
INSERT INTO "SCM"."T_SYS_ROLE_LOC" VALUES ('297eacb94c4ed254014c4edf5930002d', '47', '140');
INSERT INTO "SCM"."T_SYS_ROLE_LOC" VALUES ('297eacb94c4ed254014c4edf5930002e', '47', '141');
INSERT INTO "SCM"."T_SYS_ROLE_LOC" VALUES ('297eacb94c4ed254014c4edf5930002f', '47', '142');

-- ----------------------------
-- Table structure for T_SYS_TASKCONFIG
-- ----------------------------
DROP TABLE "SCM"."T_SYS_TASKCONFIG";
CREATE TABLE "SCM"."T_SYS_TASKCONFIG" (
"TASK_ID" VARCHAR2(250 BYTE) NULL ,
"END_TIME" TIMESTAMP(6)  NULL ,
"ID_TYPE" VARCHAR2(10 BYTE) NULL ,
"ID_VALUE" VARCHAR2(10 BYTE) NULL ,
"JOB_GROUP" VARCHAR2(200 BYTE) NULL ,
"JOB_NAME" VARCHAR2(250 BYTE) NULL ,
"START_TIME" TIMESTAMP(6)  NULL ,
"TASK_CLASS" VARCHAR2(250 BYTE) NULL ,
"TASK_DESCRIPTION" VARCHAR2(500 BYTE) NULL ,
"TASK_STATUS" VARCHAR2(10 BYTE) NULL ,
"TIME_PERIOD" VARCHAR2(10 BYTE) NULL ,
"TIME_PERIOD_TYPE" VARCHAR2(10 BYTE) NULL ,
"TRIGGER_GROUP" VARCHAR2(200 BYTE) NULL ,
"TRIGGER_NAME" VARCHAR2(250 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of T_SYS_TASKCONFIG
-- ----------------------------

-- ----------------------------
-- Table structure for T_SYS_VEN_ROLE
-- ----------------------------
DROP TABLE "SCM"."T_SYS_VEN_ROLE";
CREATE TABLE "SCM"."T_SYS_VEN_ROLE" (
"SYS_VEN_ROLE_ID" VARCHAR2(100 BYTE) NOT NULL ,
"SYS_VEN_ID" NUMBER NULL ,
"SYS_ROLE_ID" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of T_SYS_VEN_ROLE
-- ----------------------------
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('4028b7c64b594088014b59435e8b0002', '0', '25');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('4028b7c64b594088014b59435e8b0003', '6121', '25');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('4028b7c64b594088014b59435e8c0004', '6141', '25');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('4028b7c64b594088014b59435e8c0005', '6142', '25');

-- ----------------------------
-- Table structure for T_VEN_DELIVER
-- ----------------------------
DROP TABLE "SCM"."T_VEN_DELIVER";
CREATE TABLE "SCM"."T_VEN_DELIVER" (
"DELIVER_ROWID" NUMBER NOT NULL ,
"DELIVER_VENDORID" NUMBER NULL ,
"DELIVER_HOPID" NUMBER NULL ,
"DELIVER_PURLOC" NUMBER NULL ,
"DELIVER_RECLOC" NUMBER NULL ,
"DELIVER_ORDERID" NUMBER NULL ,
"DELIVER_DESTINATIONID" NUMBER NULL ,
"DELIVER_USERID" NUMBER NULL ,
"DELIVER_RECUSERID" NUMBER NULL ,
"DELIVER_DATE" TIMESTAMP(6)  NULL ,
"DELIVER_ARRDATE" TIMESTAMP(6)  NULL ,
"DELIVER_RECDATE" TIMESTAMP(6)  NULL ,
"DELIVER_EXESTATEID" NUMBER NULL ,
"DELIVER_REMARK" NVARCHAR2(250) NULL ,
"DELIVER_ACCPECTDATE" TIMESTAMP(6)  NULL ,
"DELIVER_ACCPUSERID" NUMBER NULL ,
"DELIVER_HOPVENDORID" NUMBER NULL ,
"DELIVER_WPSID" VARCHAR2(200 BYTE) NULL ,
"DELIVER_NO" VARCHAR2(200 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "SCM"."T_VEN_DELIVER" IS '发货主表';
COMMENT ON COLUMN "SCM"."T_VEN_DELIVER"."DELIVER_VENDORID" IS '发货供应商';
COMMENT ON COLUMN "SCM"."T_VEN_DELIVER"."DELIVER_HOPID" IS '收货医院ID';
COMMENT ON COLUMN "SCM"."T_VEN_DELIVER"."DELIVER_PURLOC" IS '入库科室';
COMMENT ON COLUMN "SCM"."T_VEN_DELIVER"."DELIVER_RECLOC" IS '收货科室';
COMMENT ON COLUMN "SCM"."T_VEN_DELIVER"."DELIVER_ORDERID" IS '订单表';
COMMENT ON COLUMN "SCM"."T_VEN_DELIVER"."DELIVER_DESTINATIONID" IS '收货地址';
COMMENT ON COLUMN "SCM"."T_VEN_DELIVER"."DELIVER_USERID" IS '发货人';
COMMENT ON COLUMN "SCM"."T_VEN_DELIVER"."DELIVER_RECUSERID" IS '收货人';
COMMENT ON COLUMN "SCM"."T_VEN_DELIVER"."DELIVER_DATE" IS '发货日期';
COMMENT ON COLUMN "SCM"."T_VEN_DELIVER"."DELIVER_ARRDATE" IS '计划到达日期';
COMMENT ON COLUMN "SCM"."T_VEN_DELIVER"."DELIVER_RECDATE" IS '收货日期';
COMMENT ON COLUMN "SCM"."T_VEN_DELIVER"."DELIVER_EXESTATEID" IS '发货执行状态';
COMMENT ON COLUMN "SCM"."T_VEN_DELIVER"."DELIVER_REMARK" IS '备注';
COMMENT ON COLUMN "SCM"."T_VEN_DELIVER"."DELIVER_ACCPECTDATE" IS '接受订单时间';
COMMENT ON COLUMN "SCM"."T_VEN_DELIVER"."DELIVER_ACCPUSERID" IS '接收订单人';
COMMENT ON COLUMN "SCM"."T_VEN_DELIVER"."DELIVER_HOPVENDORID" IS '发货供应商医院供应商t_hop_vendor';
COMMENT ON COLUMN "SCM"."T_VEN_DELIVER"."DELIVER_WPSID" IS '供应商ID';
COMMENT ON COLUMN "SCM"."T_VEN_DELIVER"."DELIVER_NO" IS '一次发货单号';

-- ----------------------------
-- Records of T_VEN_DELIVER
-- ----------------------------
INSERT INTO "SCM"."T_VEN_DELIVER" VALUES ('3202', '7121', '7', '62', '62', '5050', '107', null, null, TO_TIMESTAMP(' 2014-12-17 21:29:30:095000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, null, '7204', null, TO_TIMESTAMP(' 2014-12-17 21:29:30:095000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '6121', null, '4028b7c64a586b09014a58706ae20002');

-- ----------------------------
-- Table structure for T_VEN_DELIVERITM
-- ----------------------------
DROP TABLE "SCM"."T_VEN_DELIVERITM";
CREATE TABLE "SCM"."T_VEN_DELIVERITM" (
"DELIVERITM_ID" NUMBER NOT NULL ,
"DELIVERITM_PARENTID" NUMBER NULL ,
"DELIVERITM_ORDERITMID" NUMBER NULL ,
"DELIVERITM_QTY" NUMBER DEFAULT 0  NULL ,
"DELIVERITM_HOPINCID" NUMBER NULL ,
"DELIVERITM_VENINCID" NUMBER NULL ,
"DELIVERITM_RP" NUMBER DEFAULT 0  NULL ,
"DELIVERITM_BATNO" VARCHAR2(200 BYTE) NULL ,
"DELIVERITM_EXPDATE" DATE NULL ,
"DELIVERITM_INVNOE" VARCHAR2(200 BYTE) NULL ,
"DELIVERITM_UOM" VARCHAR2(200 BYTE) NULL ,
"DELIVERITM_RPAMT" NUMBER NULL ,
"DELIVERITM_HISQTY" NUMBER DEFAULT 0  NULL ,
"DELIVERITM_HISRP" NUMBER DEFAULT 0  NULL ,
"DELIVERITM_HISUOM" VARCHAR2(100 BYTE) NULL ,
"DELIVERITM_FAC" NUMBER NULL ,
"DELIVERITM_WPSID" VARCHAR2(200 BYTE) NULL ,
"DELIVERITM_NO" VARCHAR2(200 BYTE) NULL ,
"DELIVERITM_RECFLAG" VARCHAR2(1 BYTE) DEFAULT 0  NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "SCM"."T_VEN_DELIVERITM" IS '发货明细表';
COMMENT ON COLUMN "SCM"."T_VEN_DELIVERITM"."DELIVERITM_PARENTID" IS '父表ID';
COMMENT ON COLUMN "SCM"."T_VEN_DELIVERITM"."DELIVERITM_ORDERITMID" IS '订单子表ID';
COMMENT ON COLUMN "SCM"."T_VEN_DELIVERITM"."DELIVERITM_QTY" IS '发货数量(供应商单位)';
COMMENT ON COLUMN "SCM"."T_VEN_DELIVERITM"."DELIVERITM_HOPINCID" IS '医院药品id';
COMMENT ON COLUMN "SCM"."T_VEN_DELIVERITM"."DELIVERITM_VENINCID" IS '供应商药品id';
COMMENT ON COLUMN "SCM"."T_VEN_DELIVERITM"."DELIVERITM_RP" IS '进价(供应商单位)';
COMMENT ON COLUMN "SCM"."T_VEN_DELIVERITM"."DELIVERITM_BATNO" IS '批号';
COMMENT ON COLUMN "SCM"."T_VEN_DELIVERITM"."DELIVERITM_EXPDATE" IS '效期';
COMMENT ON COLUMN "SCM"."T_VEN_DELIVERITM"."DELIVERITM_INVNOE" IS '发票号';
COMMENT ON COLUMN "SCM"."T_VEN_DELIVERITM"."DELIVERITM_UOM" IS '单位';
COMMENT ON COLUMN "SCM"."T_VEN_DELIVERITM"."DELIVERITM_RPAMT" IS '金额(供应商单位)';
COMMENT ON COLUMN "SCM"."T_VEN_DELIVERITM"."DELIVERITM_HISQTY" IS '医院单位数量';
COMMENT ON COLUMN "SCM"."T_VEN_DELIVERITM"."DELIVERITM_HISRP" IS '医院单位进价';
COMMENT ON COLUMN "SCM"."T_VEN_DELIVERITM"."DELIVERITM_HISUOM" IS '医院单位';
COMMENT ON COLUMN "SCM"."T_VEN_DELIVERITM"."DELIVERITM_FAC" IS '供应商单位到医院单位系数';
COMMENT ON COLUMN "SCM"."T_VEN_DELIVERITM"."DELIVERITM_WPSID" IS '供应商发货单标志';
COMMENT ON COLUMN "SCM"."T_VEN_DELIVERITM"."DELIVERITM_NO" IS '发货单号';
COMMENT ON COLUMN "SCM"."T_VEN_DELIVERITM"."DELIVERITM_RECFLAG" IS '医院入库标志,1:以入库';

-- ----------------------------
-- Records of T_VEN_DELIVERITM
-- ----------------------------
INSERT INTO "SCM"."T_VEN_DELIVERITM" VALUES ('4210', '3202', '8050', '4', '19761', '6301', '2', '20140101', TO_DATE('2020-02-02 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '3233', null, '7', '4', '2', null, '1', null, null, null);
INSERT INTO "SCM"."T_VEN_DELIVERITM" VALUES ('5050', '3202', '8050', '0', '19761', '6301', '0', null, TO_DATE('2015-03-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), null, null, null, '0', '0', null, '1', null, null, null);

-- ----------------------------
-- Table structure for T_VEN_DELV
-- ----------------------------
DROP TABLE "SCM"."T_VEN_DELV";
CREATE TABLE "SCM"."T_VEN_DELV" (
"DELV_ID" VARCHAR2(40 BYTE) NULL ,
"DELV_DATE" TIMESTAMP(6)  NULL ,
"DELV_VENDORID" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of T_VEN_DELV
-- ----------------------------
INSERT INTO "SCM"."T_VEN_DELV" VALUES ('4028b7c64a586b09014a58706ae20002', TO_TIMESTAMP(' 2014-12-17 21:29:30:082000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '7121');

-- ----------------------------
-- Table structure for T_VEN_HOP_INC
-- ----------------------------
DROP TABLE "SCM"."T_VEN_HOP_INC";
CREATE TABLE "SCM"."T_VEN_HOP_INC" (
"HOP_INC_ID" NUMBER NULL ,
"VEN_INC_ID" NUMBER NULL ,
"VEN_HOP_INC_ID" VARCHAR2(150 BYTE) NOT NULL ,
"VEN_INC_FAC" NUMBER NULL ,
"VEN_FAC" NUMBER NULL ,
"HOP_FAC" NUMBER NULL ,
"VEN_HOP_AUDITFLAG" CHAR(1 BYTE) DEFAULT 'Y'  NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of T_VEN_HOP_INC
-- ----------------------------
INSERT INTO "SCM"."T_VEN_HOP_INC" VALUES ('19787', '6321', '4028b7c64c2fde3d014c2fe067140001', null, '1', '1', 'Y');
INSERT INTO "SCM"."T_VEN_HOP_INC" VALUES ('19792', '6326', '4028b7c64c2fde3d014c2fe4f4540002', null, '24', '1', 'Y');
INSERT INTO "SCM"."T_VEN_HOP_INC" VALUES ('19795', '6328', '4028b7c64c2fde3d014c2fe58c5d0004', null, '1', '1', 'Y');
INSERT INTO "SCM"."T_VEN_HOP_INC" VALUES ('19790', '6324', '4028b7c64c2f9aaf014c2fb656f90000', null, '1', '1', 'Y');
INSERT INTO "SCM"."T_VEN_HOP_INC" VALUES ('19788', '6332', '4028b7c64c2f9aaf014c2fb76a0b0002', null, '10', '1', 'Y');
INSERT INTO "SCM"."T_VEN_HOP_INC" VALUES ('19789', '6329', '4028b7c64c2f9aaf014c2fb78d140003', null, '20', '1', 'Y');
INSERT INTO "SCM"."T_VEN_HOP_INC" VALUES ('19762', '6302', '297eacb94c278c58014c2794d9330000', null, '12', '1', 'Y');
INSERT INTO "SCM"."T_VEN_HOP_INC" VALUES ('19761', '6301', '297eacb94c278c58014c279510990001', '1', '1', '1', 'Y');
INSERT INTO "SCM"."T_VEN_HOP_INC" VALUES ('19793', '6331', '297ec3224c2fb013014c2fbe28290001', null, '1', '0', 'Y');
INSERT INTO "SCM"."T_VEN_HOP_INC" VALUES ('19797', '6327', '297ec3224c2fb013014c2fbe64000002', '1', '1', '1', 'Y');
INSERT INTO "SCM"."T_VEN_HOP_INC" VALUES ('19791', '6333', '297ec3224c2fb013014c2fbeb1f00003', '12', '12', '1', 'Y');
INSERT INTO "SCM"."T_VEN_HOP_INC" VALUES ('19796', '6330', '297ec3224c2fb013014c2fbeea8f0004', '12', '12', '1', 'Y');
INSERT INTO "SCM"."T_VEN_HOP_INC" VALUES ('19801', '6334', '402882e44c3c4856014c3ca9bdeb0004', null, '100', '1', 'Y');
INSERT INTO "SCM"."T_VEN_HOP_INC" VALUES ('19786', '6323', '297eacb94c2c3505014c2c8106af0002', '20', '20', '1', 'Y');
INSERT INTO "SCM"."T_VEN_HOP_INC" VALUES ('19785', '6322', '297eacb94c2c3505014c2c80c17e0001', '1', '1', '1', 'Y');

-- ----------------------------
-- Table structure for T_VEN_INC
-- ----------------------------
DROP TABLE "SCM"."T_VEN_INC";
CREATE TABLE "SCM"."T_VEN_INC" (
"VEN_INC_CODE" VARCHAR2(250 BYTE) NULL ,
"VEN_INC_NAME" VARCHAR2(250 BYTE) NULL ,
"VEN_INC_UOMCODE" VARCHAR2(150 BYTE) NULL ,
"VEN_INC_UOMNAME" VARCHAR2(150 BYTE) NULL ,
"VEN_INC_BUOMCODE" VARCHAR2(150 BYTE) NULL ,
"VEN_INC_BUOMNAME" VARCHAR2(150 BYTE) NULL ,
"VEN_INC_FAC" NUMBER NULL ,
"VEN_INC_MANFID" NUMBER NULL ,
"VEN_INC_ROWID" NUMBER NOT NULL ,
"VEN_INC_VENSYSID" VARCHAR2(150 BYTE) NULL ,
"VEN_INC_VENID" NUMBER NULL ,
"VEN_INC_PRICE" NUMBER NULL ,
"VEN_INC_SPEC" VARCHAR2(250 BYTE) NULL ,
"VEN_INC_ALIAS" VARCHAR2(150 BYTE) NULL ,
"VEN_INC_CAT" VARCHAR2(150 BYTE) NULL ,
"VEN_INC_SP" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "SCM"."T_VEN_INC" IS '供应商';
COMMENT ON COLUMN "SCM"."T_VEN_INC"."VEN_INC_CODE" IS '代码';
COMMENT ON COLUMN "SCM"."T_VEN_INC"."VEN_INC_NAME" IS '名称';
COMMENT ON COLUMN "SCM"."T_VEN_INC"."VEN_INC_UOMCODE" IS '单位代码';
COMMENT ON COLUMN "SCM"."T_VEN_INC"."VEN_INC_UOMNAME" IS '单位名称';
COMMENT ON COLUMN "SCM"."T_VEN_INC"."VEN_INC_BUOMCODE" IS '小单位代码';
COMMENT ON COLUMN "SCM"."T_VEN_INC"."VEN_INC_BUOMNAME" IS '小单位名称';
COMMENT ON COLUMN "SCM"."T_VEN_INC"."VEN_INC_FAC" IS '系数';
COMMENT ON COLUMN "SCM"."T_VEN_INC"."VEN_INC_MANFID" IS '厂商Id';
COMMENT ON COLUMN "SCM"."T_VEN_INC"."VEN_INC_ROWID" IS 'id';
COMMENT ON COLUMN "SCM"."T_VEN_INC"."VEN_INC_VENSYSID" IS '供应商系统药品ID';
COMMENT ON COLUMN "SCM"."T_VEN_INC"."VEN_INC_VENID" IS '供应商ID';
COMMENT ON COLUMN "SCM"."T_VEN_INC"."VEN_INC_PRICE" IS '价格';
COMMENT ON COLUMN "SCM"."T_VEN_INC"."VEN_INC_SPEC" IS '规格';
COMMENT ON COLUMN "SCM"."T_VEN_INC"."VEN_INC_ALIAS" IS '别名';
COMMENT ON COLUMN "SCM"."T_VEN_INC"."VEN_INC_CAT" IS '类组';

-- ----------------------------
-- Records of T_VEN_INC
-- ----------------------------
INSERT INTO "SCM"."T_VEN_INC" VALUES ('SPC0005', '心脏支架', '箱', '箱', null, null, null, null, '6324', null, '7121', '12306', null, 'xzzj', null, null);
INSERT INTO "SCM"."T_VEN_INC" VALUES ('SPCXXX', '手术刀', '箱(100)', '箱(100)', null, null, null, null, '6334', null, '7121', '1.20', null, 'ssd', null, null);
INSERT INTO "SCM"."T_VEN_INC" VALUES ('spc001', '打印纸', '张', null, null, null, null, null, '6321', null, '7121', '29', null, 'dyz', null, null);
INSERT INTO "SCM"."T_VEN_INC" VALUES ('SPC002', '自行车', '辆', null, null, null, null, null, '6322', null, '7121', '9999999', null, 'zxc', null, null);
INSERT INTO "SCM"."T_VEN_INC" VALUES ('SPC0004', '注射器', '支', null, null, null, null, null, '6323', null, '7121', '2', null, 'zsq', null, null);
INSERT INTO "SCM"."T_VEN_INC" VALUES ('XY0001', '阿莫西林', 'mg', 'mg', null, null, null, null, '6301', null, '7121', '111', 'xx', 'amxl', null, '123');
INSERT INTO "SCM"."T_VEN_INC" VALUES ('XY0002', '葡萄糖注射液', 'ml', 'ml', 'ml', null, null, null, '6302', null, '7121', null, null, 'pttzsy', null, null);
INSERT INTO "SCM"."T_VEN_INC" VALUES ('SPC0006', '拖把', '箱', '箱', null, null, null, null, '6325', null, '7121', '20', null, 'tb', null, null);
INSERT INTO "SCM"."T_VEN_INC" VALUES ('SPC0007', '拖鞋', '箱(24)', '箱(24)', null, null, null, null, '6326', null, '7121', '12', null, 'tx', null, null);
INSERT INTO "SCM"."T_VEN_INC" VALUES ('XY00999', '999感冒灵', '盒', '盒', '包', '包', null, null, '6327', null, '7121', '11', null, '999', null, null);
INSERT INTO "SCM"."T_VEN_INC" VALUES ('XY00012', '三黄片', '包', '包', null, null, null, null, '6328', null, '7121', '0.80', null, 'shp', null, null);
INSERT INTO "SCM"."T_VEN_INC" VALUES ('SPC0008', '中性笔', '盒(20)', '盒(20)', null, null, null, null, '6329', null, '7121', '2', null, 'zxb', null, null);
INSERT INTO "SCM"."T_VEN_INC" VALUES ('sn0001', '得力（deli）6600 经济实用型中性笔(黑) 0.5mm 12只装', '盒(12支)', '盒(12支)', null, null, null, null, '6330', null, '7121', '12', '得力6600-0.5mm', 'sn', null, null);
INSERT INTO "SCM"."T_VEN_INC" VALUES ('dj0001', '新绿天章70克A4复印纸 5包箱', '箱', '箱', null, null, null, null, '6331', null, '7121', '89', null, 'dj', null, null);
INSERT INTO "SCM"."T_VEN_INC" VALUES ('SPC0009', '甲醛显色剂八合一检测仪试管室内空气质', '支', '支', null, null, null, null, '6332', null, '7121', '1', '10.00g', 'ssq', null, null);
INSERT INTO "SCM"."T_VEN_INC" VALUES ('524525', '巧护士 全棉纯色手术帽 蓝色手术衣 洗手衣配套帽子 高温高压消毒 蓝色手术帽', '17', '盒(12)', null, null, null, '1941', '6333', null, '7121', '18', '材质：棉', 'bz', null, null);

-- ----------------------------
-- Table structure for T_VEN_INC_PIC
-- ----------------------------
DROP TABLE "SCM"."T_VEN_INC_PIC";
CREATE TABLE "SCM"."T_VEN_INC_PIC" (
"VEN_INC_PIC_ID" NUMBER NOT NULL ,
"VEN_INC_PIC_VENINCID" NUMBER NULL ,
"VEN_INC_PIC_PATH" VARCHAR2(255 BYTE) NULL ,
"VEN_INC_PIC_SEQ" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "SCM"."T_VEN_INC_PIC" IS '供应商药品图片表';
COMMENT ON COLUMN "SCM"."T_VEN_INC_PIC"."VEN_INC_PIC_VENINCID" IS '父表id';
COMMENT ON COLUMN "SCM"."T_VEN_INC_PIC"."VEN_INC_PIC_PATH" IS '路径';
COMMENT ON COLUMN "SCM"."T_VEN_INC_PIC"."VEN_INC_PIC_SEQ" IS '显示顺序';

-- ----------------------------
-- Records of T_VEN_INC_PIC
-- ----------------------------
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('121', '6302', '2015-02-09+20-04-554cf984a0-174e-4cf2-a956-dd6148199fd5.png', '1');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('197', '6331', '2015-03-24+10-39-12d81c1036-9732-45bf-a6a5-c03ad60cf00a.jpg', '3');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('195', '6331', '2015-03-24+10-39-08f2cc461b-e7ba-4378-a04a-92d3b499a371.jpg', '1');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('196', '6331', '2015-03-24+10-39-10190ed65d-ce74-4d26-9cdd-da4b81685e98.jpg', '2');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('198', '6331', '2015-03-24+10-39-15103fc57d-25ae-4aa2-b893-68934322ad8a.jpg', '4');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('203', '6330', '2015-03-24+10-40-472b5cedf6-ac7f-4b76-9333-9342a5544ac4.jpg', '1');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('204', '6330', '2015-03-24+10-40-50c4688580-a097-4b47-9b14-83f2fa8b2aa8.jpg', '2');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('205', '6330', '2015-03-24+10-40-5370105263-36b0-43e6-84d3-b962795529c5.jpg', '3');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('206', '6330', '2015-03-24+10-40-55ac8d3cfd-f1a9-4d24-b2da-c5d4231354cc.jpg', '4');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('141', '6323', '2015-03-18+19-51-10e43bd317-72cb-4c66-83d3-9f4e6c9d2eb9.png', '1');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('164', '6326', '2015-03-20+17-23-10704cb588-be50-42c6-9959-59256c9ae3d2.jpg', '1');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('165', '6326', '2015-03-20+17-23-131a16faff-38b7-4781-ab03-b7bb0f6f96ac.jpg', '2');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('166', '6326', '2015-03-20+17-23-1654e118b1-b838-41a5-94b1-99438492de34.jpg', '3');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('167', '6326', '2015-03-20+17-23-2061d4fabc-df38-4c04-9c24-aadfe971683a.jpg', '4');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('172', '6334', '2015-03-21+21-31-07f3b85ac9-2f9d-4731-abb5-1146123c4511.jpg', '1');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('173', '6334', '2015-03-21+21-31-15d02825ec-21af-4271-94ee-d25e5e00b191.jpg', '2');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('174', '6334', '2015-03-21+21-31-23547d7276-27c2-4f72-90ad-085c202afe5e.jpg', '3');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('175', '6334', '2015-03-21+21-31-35de8a7436-8939-41a6-ae81-42dcc063a529.jpg', '4');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('142', '6324', '2015-03-19+09-34-386b0c91a1-868a-4675-ab86-ff2402ce1e83.jpg', '1');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('143', '6325', '2015-03-19+09-35-210169343e-0661-4425-89ea-b29e10be19e0.jpg', '1');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('188', '6333', '2015-03-24+10-34-44b7fe42d9-be82-4336-8b1a-ce7c5c7db2c4.jpg', '1');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('145', '6329', '2015-03-19+09-37-142d0f29b9-5e55-4eab-b384-189a273976a2.jpg', '1');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('190', '6333', '2015-03-24+10-34-48bf9d4a0a-a377-48bc-babd-0913ac3676d7.jpg', '3');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('189', '6333', '2015-03-24+10-34-4690707097-37b7-4391-b62a-9814c62e37c4.jpg', '2');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('150', '6328', '2015-03-19+09-48-0260621dec-a962-46d6-bb2d-f2d520e4922c.jpg', '1');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('151', '6327', '2015-03-19+09-48-28e39a977f-6020-4de8-b34c-a4ab23cca11d.png', '1');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('191', '6333', '2015-03-24+10-34-51e7f8a83d-e169-46dc-9eb4-8be40b3e8c77.jpg', '4');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('192', '6332', '2015-03-24+10-35-544c4b1176-e199-4b60-b817-645ab60bbe3b.jpg', '1');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('193', '6332', '2015-03-24+10-35-560293a6db-ec57-4b14-aa7c-77ede4adc730.jpg', '2');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('194', '6332', '2015-03-24+10-35-596bbac7be-c819-43f1-85f1-74b900722e19.jpg', '3');

-- ----------------------------
-- Table structure for T_VEN_QUALIF
-- ----------------------------
DROP TABLE "SCM"."T_VEN_QUALIF";
CREATE TABLE "SCM"."T_VEN_QUALIF" (
"QUALIFID" NUMBER NOT NULL ,
"VENDORID" NUMBER NULL ,
"REGDATE" DATE NULL ,
"EXPDATE" DATE NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "SCM"."T_VEN_QUALIF" IS '供应商资质表';
COMMENT ON COLUMN "SCM"."T_VEN_QUALIF"."QUALIFID" IS 'rowid';
COMMENT ON COLUMN "SCM"."T_VEN_QUALIF"."VENDORID" IS '供应商id';
COMMENT ON COLUMN "SCM"."T_VEN_QUALIF"."REGDATE" IS '注册日期';
COMMENT ON COLUMN "SCM"."T_VEN_QUALIF"."EXPDATE" IS '过期日期';

-- ----------------------------
-- Records of T_VEN_QUALIF
-- ----------------------------

-- ----------------------------
-- Table structure for T_VEN_QUALIF_PIC
-- ----------------------------
DROP TABLE "SCM"."T_VEN_QUALIF_PIC";
CREATE TABLE "SCM"."T_VEN_QUALIF_PIC" (
"QUALIF_PIC_ID" NUMBER NOT NULL ,
"PATH" VARCHAR2(200 BYTE) NULL ,
"QUALIFY_ID" NUMBER NULL ,
"NAME" VARCHAR2(200 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "SCM"."T_VEN_QUALIF_PIC" IS '供应商资质图片';
COMMENT ON COLUMN "SCM"."T_VEN_QUALIF_PIC"."QUALIF_PIC_ID" IS 'rowid';
COMMENT ON COLUMN "SCM"."T_VEN_QUALIF_PIC"."PATH" IS '图片路劲';
COMMENT ON COLUMN "SCM"."T_VEN_QUALIF_PIC"."QUALIFY_ID" IS '资质表Id';

-- ----------------------------
-- Records of T_VEN_QUALIF_PIC
-- ----------------------------
INSERT INTO "SCM"."T_VEN_QUALIF_PIC" VALUES ('6058', '2015-02-09+13-41-216d898d05-de40-4d44-b845-6709df2c558c.gif', '7053', '6d188eacgw1eh4ru9gqisg20a005t4ql.gif');
INSERT INTO "SCM"."T_VEN_QUALIF_PIC" VALUES ('8050', '2015-03-24+21-38-026a1b8d43-4b6e-4edf-917a-4d1dec14ab47.jpg', '7050', 'rBEIDE_f0FAIAAAAAAKWZmeMf5sAAAxTAMbKKQAApZ-982.jpg');

-- ----------------------------
-- Table structure for T_VEN_QUALIF_PIC_LOG
-- ----------------------------
DROP TABLE "SCM"."T_VEN_QUALIF_PIC_LOG";
CREATE TABLE "SCM"."T_VEN_QUALIF_PIC_LOG" (
"ID" NUMBER NOT NULL ,
"PATH" VARCHAR2(200 BYTE) NULL ,
"QUALIFYID" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "SCM"."T_VEN_QUALIF_PIC_LOG" IS '供应商资质图片修改日志表';
COMMENT ON COLUMN "SCM"."T_VEN_QUALIF_PIC_LOG"."ID" IS 'rowid';
COMMENT ON COLUMN "SCM"."T_VEN_QUALIF_PIC_LOG"."PATH" IS '图片路劲';
COMMENT ON COLUMN "SCM"."T_VEN_QUALIF_PIC_LOG"."QUALIFYID" IS '日志资质Id';

-- ----------------------------
-- Records of T_VEN_QUALIF_PIC_LOG
-- ----------------------------

-- ----------------------------
-- Table structure for T_VEN_QUALIF_TYPE
-- ----------------------------
DROP TABLE "SCM"."T_VEN_QUALIF_TYPE";
CREATE TABLE "SCM"."T_VEN_QUALIF_TYPE" (
"VENQUALIFTYPE_ID" NUMBER NOT NULL ,
"NAME" VARCHAR2(50 BYTE) NULL ,
"CODE" VARCHAR2(50 BYTE) NULL ,
"SEQ" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "SCM"."T_VEN_QUALIF_TYPE" IS '供应商资质类型字典表';
COMMENT ON COLUMN "SCM"."T_VEN_QUALIF_TYPE"."VENQUALIFTYPE_ID" IS 'rowid';
COMMENT ON COLUMN "SCM"."T_VEN_QUALIF_TYPE"."NAME" IS '供应商资质名称';
COMMENT ON COLUMN "SCM"."T_VEN_QUALIF_TYPE"."CODE" IS '资质代码';
COMMENT ON COLUMN "SCM"."T_VEN_QUALIF_TYPE"."SEQ" IS '显示顺序';

-- ----------------------------
-- Records of T_VEN_QUALIF_TYPE
-- ----------------------------
INSERT INTO "SCM"."T_VEN_QUALIF_TYPE" VALUES ('1050', 'AAA', 'AAA', '1');
INSERT INTO "SCM"."T_VEN_QUALIF_TYPE" VALUES ('1100', 'BBB', 'BBB', '2');
INSERT INTO "SCM"."T_VEN_QUALIF_TYPE" VALUES ('1101', 'CCC', 'CCC', '3');

-- ----------------------------
-- Table structure for T_VEN_QUALIFICATION
-- ----------------------------
DROP TABLE "SCM"."T_VEN_QUALIFICATION";
CREATE TABLE "SCM"."T_VEN_QUALIFICATION" (
"QUALIFICATION_ID" NUMBER NOT NULL ,
"VENDOR_ID" NUMBER NULL ,
"REGDATE" DATE NULL ,
"EXPDATE" DATE NULL ,
"QUALIFY_TYPE_ID" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "SCM"."T_VEN_QUALIFICATION" IS '供应商资质表';
COMMENT ON COLUMN "SCM"."T_VEN_QUALIFICATION"."QUALIFICATION_ID" IS 'rowid';
COMMENT ON COLUMN "SCM"."T_VEN_QUALIFICATION"."VENDOR_ID" IS '供应商id';
COMMENT ON COLUMN "SCM"."T_VEN_QUALIFICATION"."REGDATE" IS '注册日期';
COMMENT ON COLUMN "SCM"."T_VEN_QUALIFICATION"."EXPDATE" IS '过期日期';
COMMENT ON COLUMN "SCM"."T_VEN_QUALIFICATION"."QUALIFY_TYPE_ID" IS '资质字典Id';

-- ----------------------------
-- Records of T_VEN_QUALIFICATION
-- ----------------------------
INSERT INTO "SCM"."T_VEN_QUALIFICATION" VALUES ('7053', '7142', null, null, '1050');
INSERT INTO "SCM"."T_VEN_QUALIFICATION" VALUES ('7054', '7142', null, null, '1100');
INSERT INTO "SCM"."T_VEN_QUALIFICATION" VALUES ('7050', '7121', null, TO_DATE('2015-02-18 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1050');
INSERT INTO "SCM"."T_VEN_QUALIFICATION" VALUES ('7051', '7121', null, TO_DATE('2015-02-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1100');
INSERT INTO "SCM"."T_VEN_QUALIFICATION" VALUES ('7052', '7121', null, TO_DATE('2015-03-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1101');

-- ----------------------------
-- Table structure for T_VEN_QUALIFICATION_LOG
-- ----------------------------
DROP TABLE "SCM"."T_VEN_QUALIFICATION_LOG";
CREATE TABLE "SCM"."T_VEN_QUALIFICATION_LOG" (
"ID" NUMBER NOT NULL ,
"REGDATE" DATE NULL ,
"EXPDATE" DATE NULL ,
"VENID" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "SCM"."T_VEN_QUALIFICATION_LOG" IS '供应商资质表日志';
COMMENT ON COLUMN "SCM"."T_VEN_QUALIFICATION_LOG"."ID" IS 'rowid';
COMMENT ON COLUMN "SCM"."T_VEN_QUALIFICATION_LOG"."REGDATE" IS '注册日期';
COMMENT ON COLUMN "SCM"."T_VEN_QUALIFICATION_LOG"."EXPDATE" IS '过期日期';
COMMENT ON COLUMN "SCM"."T_VEN_QUALIFICATION_LOG"."VENID" IS '供应商Id';

-- ----------------------------
-- Records of T_VEN_QUALIFICATION_LOG
-- ----------------------------

-- ----------------------------
-- Table structure for T_VEN_VENDOR
-- ----------------------------
DROP TABLE "SCM"."T_VEN_VENDOR";
CREATE TABLE "SCM"."T_VEN_VENDOR" (
"VEN_ID" NUMBER NOT NULL ,
"CODE" VARCHAR2(250 BYTE) NULL ,
"NAME" VARCHAR2(250 BYTE) NULL ,
"PARENTID" NUMBER NULL ,
"ADDRESS" VARCHAR2(255 BYTE) NULL ,
"FAX" VARCHAR2(50 BYTE) NULL ,
"TEL" VARCHAR2(50 BYTE) NULL ,
"ACCOUNT" VARCHAR2(50 BYTE) NULL ,
"CONTACT" VARCHAR2(50 BYTE) NULL ,
"HISID" NUMBER NULL ,
"ALIAS" VARCHAR2(250 BYTE) NULL ,
"EMAIL" VARCHAR2(250 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "SCM"."T_VEN_VENDOR" IS '供应商表';
COMMENT ON COLUMN "SCM"."T_VEN_VENDOR"."CODE" IS '供应商代码';
COMMENT ON COLUMN "SCM"."T_VEN_VENDOR"."NAME" IS '供应商名称';
COMMENT ON COLUMN "SCM"."T_VEN_VENDOR"."PARENTID" IS '父供应商id';
COMMENT ON COLUMN "SCM"."T_VEN_VENDOR"."ADDRESS" IS '地址';
COMMENT ON COLUMN "SCM"."T_VEN_VENDOR"."FAX" IS '传真';
COMMENT ON COLUMN "SCM"."T_VEN_VENDOR"."TEL" IS '电话';
COMMENT ON COLUMN "SCM"."T_VEN_VENDOR"."ACCOUNT" IS '银行帐号';
COMMENT ON COLUMN "SCM"."T_VEN_VENDOR"."CONTACT" IS '联系人';
COMMENT ON COLUMN "SCM"."T_VEN_VENDOR"."HISID" IS 'his里供应商Id';
COMMENT ON COLUMN "SCM"."T_VEN_VENDOR"."EMAIL" IS '邮箱';

-- ----------------------------
-- Records of T_VEN_VENDOR
-- ----------------------------
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7176', '8', '彭州市投资促进局', null, '管理员', null, null, null, '1.0', null, '1', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7178', '10', '彭州市司法局', null, '管理员', null, null, null, '1.0', null, '1', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7180', '11', '彭州市国土资源局', null, '助理工程师', null, null, null, '2.0', null, '2', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7181', '12', '彭州市发展和改革局', null, '管理员', null, null, null, '1.0', null, '2', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7183', '13', '彭州市工业和科学技术信息化局', null, '技术员', null, null, null, '2.0', null, '2', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7184', '14', '彭州市文体广电新闻出版局', null, '图书管理员', null, null, null, '1.0', null, '2', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7188', '15', '彭州市交通运输局', null, '管理员', null, null, null, '1.0', null, '1', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7189', '16', '彭州市农村发展局', null, '农技员', null, null, null, '1.0', null, '1', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7192', '17', '彭州市规划管理局', null, '技术员', null, null, null, '1.0', null, '3', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7195', '18', '彭州市气象局', null, '会计员', null, null, null, '1.0', null, '1', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7196', '19', '彭州市环境保护局', null, '环境保护员', null, null, null, '16.0', null, '16', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7197', '20', '共青团彭州市委', null, '管理员', null, null, null, '1.0', null, '1', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7198', '21', '彭州市人民政府政务服务中心', null, '管理员', null, null, null, '1.0', null, '2', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7200', '22', '彭州市林业和园林管理局', null, '林业助理工程师', null, null, null, '3.0', null, '3', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7201', '23', '彭州市信访和群众工作局', null, '接待员', null, null, null, '1.0', null, '1', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7121', '3', '兰州远方药业', null, null, null, null, null, null, null, 'lzyfyy', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7141', '广西金嗓子', '广西金嗓子', null, null, null, null, null, null, null, 'gxjsz', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7142', '武汉建民', '武汉建民', null, null, null, null, null, null, null, 'whjm', null);

-- ----------------------------
-- Table structure for T_VEN_VENDOR_LOG
-- ----------------------------
DROP TABLE "SCM"."T_VEN_VENDOR_LOG";
CREATE TABLE "SCM"."T_VEN_VENDOR_LOG" (
"ID" VARCHAR2(200 BYTE) NOT NULL ,
"VENDORID" NUMBER NULL ,
"OPERATEID" NUMBER NULL ,
"OPERATEDATE" TIMESTAMP(6)  NULL ,
"OPERATETYPE" VARCHAR2(4 BYTE) NULL ,
"OPERATEIP" VARCHAR2(100 BYTE) NULL ,
"OPERATENAME" VARCHAR2(100 BYTE) NULL ,
"OPCONTENT" VARCHAR2(4000 BYTE) NULL ,
"OPUSERNAME" VARCHAR2(100 BYTE) NULL ,
"OPTITLE" VARCHAR2(100 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "SCM"."T_VEN_VENDOR_LOG" IS '供应商修改日志表';
COMMENT ON COLUMN "SCM"."T_VEN_VENDOR_LOG"."ID" IS 'rowid';
COMMENT ON COLUMN "SCM"."T_VEN_VENDOR_LOG"."VENDORID" IS '供应商Id';
COMMENT ON COLUMN "SCM"."T_VEN_VENDOR_LOG"."OPERATEID" IS '操作人id';
COMMENT ON COLUMN "SCM"."T_VEN_VENDOR_LOG"."OPERATEDATE" IS '操作时间';
COMMENT ON COLUMN "SCM"."T_VEN_VENDOR_LOG"."OPERATETYPE" IS '操作类型';
COMMENT ON COLUMN "SCM"."T_VEN_VENDOR_LOG"."OPERATEIP" IS '操作电脑ip';
COMMENT ON COLUMN "SCM"."T_VEN_VENDOR_LOG"."OPERATENAME" IS '操作电脑名称';
COMMENT ON COLUMN "SCM"."T_VEN_VENDOR_LOG"."OPCONTENT" IS '操作内容';
COMMENT ON COLUMN "SCM"."T_VEN_VENDOR_LOG"."OPUSERNAME" IS '操作人帐号名';

-- ----------------------------
-- Records of T_VEN_VENDOR_LOG
-- ----------------------------
INSERT INTO "SCM"."T_VEN_VENDOR_LOG" VALUES ('4028b7c64b6c9906014b6cd723ae000f', '7121', null, TO_TIMESTAMP(' 2015-02-09 13:36:53:677000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'P', '127.0.0.1', null, '2015-02-09+13-36-531c18fe36-4d0e-423b-b301-0ae7cf00c233.png', 'system', 'AAA');
INSERT INTO "SCM"."T_VEN_VENDOR_LOG" VALUES ('4028b7c64b6c9906014b6cdb3ad70010', '7142', null, TO_TIMESTAMP(' 2015-02-09 13:41:21:751000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'P', '127.0.0.1', null, '2015-02-09+13-41-216d898d05-de40-4d44-b845-6709df2c558c.gif', 'system', 'AAA');
INSERT INTO "SCM"."T_VEN_VENDOR_LOG" VALUES ('4028b7c64b6c9906014b6cdb7a940011', '7142', null, TO_TIMESTAMP(' 2015-02-09 13:41:38:068000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'P', '127.0.0.1', null, '2015-02-09+13-41-38ff51ef34-927b-4216-b404-921da5195db6.jpg', 'system', 'BBB');
INSERT INTO "SCM"."T_VEN_VENDOR_LOG" VALUES ('4028b7c64b6c9906014b6cdba8380012', '7142', null, TO_TIMESTAMP(' 2015-02-09 13:41:49:752000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'P', '127.0.0.1', null, '2015-02-09+13-41-499f26c8cb-0251-470e-bd6c-ba0fa2954eea.gif', 'system', 'BBB');
INSERT INTO "SCM"."T_VEN_VENDOR_LOG" VALUES ('4028b7c64b6c9906014b6cdbe0260013', '7142', null, TO_TIMESTAMP(' 2015-02-09 13:42:04:069000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'P', '127.0.0.1', null, '2015-02-09+13-42-04cdc16c1f-ba55-470f-9421-74e5c1e53568.jpg', 'system', 'BBB');
INSERT INTO "SCM"."T_VEN_VENDOR_LOG" VALUES ('4028b7c64b6c9906014b6cdc0d600014', '7142', null, TO_TIMESTAMP(' 2015-02-09 13:42:15:648000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'P', '127.0.0.1', null, '2015-02-09+13-42-154e436775-8c7d-41bb-bec8-30b22bf554b3.gif', 'system', 'BBB');
INSERT INTO "SCM"."T_VEN_VENDOR_LOG" VALUES ('297ec3224c32a444014c32b0998e0000', '7121', null, TO_TIMESTAMP(' 2015-03-19 23:39:36:717000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'P', '127.0.0.1', null, '2015-03-19+23-39-369b5982df-b60f-4e18-99e3-2d74787f326d.JPG', 'vendor', 'AAA');
INSERT INTO "SCM"."T_VEN_VENDOR_LOG" VALUES ('297ec3224c32a444014c32b0d8b60001', '7121', null, TO_TIMESTAMP(' 2015-03-19 23:39:52:886000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'P', '127.0.0.1', null, '2015-03-19+23-39-524a235196-ab9f-4216-acc1-e6cb775d788f.jpg', 'vendor', 'BBB');
INSERT INTO "SCM"."T_VEN_VENDOR_LOG" VALUES ('297ec3224c32a444014c32b105d10002', '7121', null, TO_TIMESTAMP(' 2015-03-19 23:40:04:432000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '修改', '127.0.0.1', null, ' CCC效期:2015-03-24', 'vendor', null);
INSERT INTO "SCM"."T_VEN_VENDOR_LOG" VALUES ('4028b7c64b6c9906014b6d1e3c840015', '7121', null, TO_TIMESTAMP(' 2015-02-09 14:54:33:091000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'P', '127.0.0.1', null, '2015-02-09+14-54-331753289b-5ddf-4b99-928f-236eafba48ee.jpg', 'system', 'AAA');
INSERT INTO "SCM"."T_VEN_VENDOR_LOG" VALUES ('4028b7c64b6c9906014b6e047fe80016', '7121', null, TO_TIMESTAMP(' 2015-02-09 19:06:03:623000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'P', '127.0.0.1', null, '2015-02-09+19-06-0360d8b257-b77e-4bd7-a14e-453d093d619f.gif', 'system', 'AAA');
INSERT INTO "SCM"."T_VEN_VENDOR_LOG" VALUES ('4028b7c64b6c9906014b6e0cbfe30017', '7121', null, TO_TIMESTAMP(' 2015-02-09 19:15:04:291000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'P', '127.0.0.1', null, '2015-02-09+19-15-048478e328-ebd2-4e9e-baaa-2dfd144f26e2.png', 'system', 'AAA');
INSERT INTO "SCM"."T_VEN_VENDOR_LOG" VALUES ('4028b7c64b6c9906014b6e32e9f50018', '7121', null, TO_TIMESTAMP(' 2015-02-09 19:56:45:428000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'P', '127.0.0.1', null, '2015-02-09+19-56-450e8e54b2-7d62-42c2-a85d-b0e9e0eab2cd.gif', 'system', 'BBB');
INSERT INTO "SCM"."T_VEN_VENDOR_LOG" VALUES ('297eacb94c510033014c510230320000', '7121', null, TO_TIMESTAMP(' 2015-03-25 20:57:20:177000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '修改', '127.0.0.1', null, null, 'system', null);
INSERT INTO "SCM"."T_VEN_VENDOR_LOG" VALUES ('4028b7c64b6c9906014b6c9a14da0000', '7121', null, TO_TIMESTAMP(' 2015-02-09 12:30:12:185000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'P', '127.0.0.1', null, '2015-02-09+12-30-1104999050-8361-4355-8edd-7eee4cedd2da.gif', 'system', 'AAA');
INSERT INTO "SCM"."T_VEN_VENDOR_LOG" VALUES ('4028b7c64b6c9906014b6c9a76220001', '7121', null, TO_TIMESTAMP(' 2015-02-09 12:30:37:089000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '修改', '127.0.0.1', null, null, 'system', null);
INSERT INTO "SCM"."T_VEN_VENDOR_LOG" VALUES ('4028b7c64b6c9906014b6c9a96820002', '7121', null, TO_TIMESTAMP(' 2015-02-09 12:30:45:377000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '修改', '127.0.0.1', null, null, 'system', null);
INSERT INTO "SCM"."T_VEN_VENDOR_LOG" VALUES ('4028b7c64b6c9906014b6c9ab4fe0003', '7121', null, TO_TIMESTAMP(' 2015-02-09 12:30:53:181000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'P', '127.0.0.1', null, '2015-02-09+12-30-536b8cdb86-a67e-400b-a4ec-9cf0c852c7a6.png', 'system', 'AAA');
INSERT INTO "SCM"."T_VEN_VENDOR_LOG" VALUES ('4028b7c64b6c9906014b6c9b6ab10004', '7121', null, TO_TIMESTAMP(' 2015-02-09 12:31:39:697000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '修改', '127.0.0.1', null, null, 'system', null);
INSERT INTO "SCM"."T_VEN_VENDOR_LOG" VALUES ('4028b7c64b6c9906014b6ca2c5d90005', '7121', null, TO_TIMESTAMP(' 2015-02-09 12:39:41:784000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '修改', '127.0.0.1', null, null, 'system', null);
INSERT INTO "SCM"."T_VEN_VENDOR_LOG" VALUES ('4028b7c64b6c9906014b6ca3fc6f0006', '7121', null, TO_TIMESTAMP(' 2015-02-09 12:41:01:295000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '修改', '127.0.0.1', null, ' AAA效期:2015-02-18', 'system', null);
INSERT INTO "SCM"."T_VEN_VENDOR_LOG" VALUES ('4028b7c64b6c9906014b6ca428e10007', '7121', null, TO_TIMESTAMP(' 2015-02-09 12:41:12:672000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'P', '127.0.0.1', null, '2015-02-09+12-41-1225cc5125-28f1-4633-a596-fad6a300ee1d.jpg', 'system', 'AAA');
INSERT INTO "SCM"."T_VEN_VENDOR_LOG" VALUES ('4028b7c64b6c9906014b6ca591460008', '7121', null, TO_TIMESTAMP(' 2015-02-09 12:42:44:934000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'P', '127.0.0.1', null, '2015-02-09+12-42-443b990456-0f5a-4bdd-8273-f59b0678d7a7.png', 'system', 'AAA');
INSERT INTO "SCM"."T_VEN_VENDOR_LOG" VALUES ('4028b7c64b6c9906014b6ca65acc0009', '7121', null, TO_TIMESTAMP(' 2015-02-09 12:43:36:523000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'P', '127.0.0.1', null, '2015-02-09+12-43-363bf47534-0c0b-4cd3-b095-b6effeca7812.png', 'system', 'BBB');
INSERT INTO "SCM"."T_VEN_VENDOR_LOG" VALUES ('4028b7c64b6c9906014b6ca667f1000a', '7121', null, TO_TIMESTAMP(' 2015-02-09 12:43:39:889000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '修改', '127.0.0.1', null, ' BBB效期:2015-02-24', 'system', null);
INSERT INTO "SCM"."T_VEN_VENDOR_LOG" VALUES ('4028b7c64b6c9906014b6ca8831d000b', '7121', null, TO_TIMESTAMP(' 2015-02-09 12:45:57:916000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'P', '127.0.0.1', null, '2015-02-09+12-45-57477730ba-2ea3-4703-8284-f906f7e19ee3.gif', 'system', 'CCC');
INSERT INTO "SCM"."T_VEN_VENDOR_LOG" VALUES ('4028b7c64b6c9906014b6ca89aab000c', '7121', null, TO_TIMESTAMP(' 2015-02-09 12:46:03:947000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '修改', '127.0.0.1', null, ' CCC效期:2015-02-25', 'system', null);
INSERT INTO "SCM"."T_VEN_VENDOR_LOG" VALUES ('4028b7c64b6c9906014b6ca8dd1f000d', '7121', null, TO_TIMESTAMP(' 2015-02-09 12:46:20:957000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '修改', '127.0.0.1', null, ' CCC效期:', 'system', null);
INSERT INTO "SCM"."T_VEN_VENDOR_LOG" VALUES ('4028b7c64b6c9906014b6ccda1c4000e', '7121', null, TO_TIMESTAMP(' 2015-02-09 13:26:30:596000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'P', '127.0.0.1', null, '2015-02-09+13-26-300f23c176-45d0-44a5-903f-46a9872e5577.png', 'system', 'BBB');
INSERT INTO "SCM"."T_VEN_VENDOR_LOG" VALUES ('4028b7c64a5619c2014a5658c7fa0000', '7121', null, TO_TIMESTAMP(' 2014-12-17 11:44:26:615000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '增加', '127.0.0.1', null, ' 邮箱: 地址: 联系人:', 'system', null);
INSERT INTO "SCM"."T_VEN_VENDOR_LOG" VALUES ('4028b7c64b594088014b594238f50000', '7141', null, TO_TIMESTAMP(' 2015-02-05 18:21:27:157000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '增加', '127.0.0.1', null, ' 邮箱: 地址: 联系人:', 'system', null);
INSERT INTO "SCM"."T_VEN_VENDOR_LOG" VALUES ('4028b7c64b594088014b5942668b0001', '7142', null, TO_TIMESTAMP(' 2015-02-05 18:21:38:826000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '增加', '127.0.0.1', null, ' 邮箱: 地址: 联系人:', 'system', null);
INSERT INTO "SCM"."T_VEN_VENDOR_LOG" VALUES ('4028b7c64c4bf7e6014c4c011b140000', '7121', null, TO_TIMESTAMP(' 2015-03-24 21:38:03:155000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'P', '127.0.0.1', null, '2015-03-24+21-38-026a1b8d43-4b6e-4edf-917a-4d1dec14ab47.jpg', 'vendor', 'AAA');

-- ----------------------------
-- Sequence structure for SEQ_NORMALUSER
-- ----------------------------
DROP SEQUENCE "SCM"."SEQ_NORMALUSER";
CREATE SEQUENCE "SCM"."SEQ_NORMALUSER"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 91
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQ_SYS_FUNC
-- ----------------------------
DROP SEQUENCE "SCM"."SEQ_SYS_FUNC";
CREATE SEQUENCE "SCM"."SEQ_SYS_FUNC"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 183
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQ_SYS_NORMAL_ACCOUNT
-- ----------------------------
DROP SEQUENCE "SCM"."SEQ_SYS_NORMAL_ACCOUNT";
CREATE SEQUENCE "SCM"."SEQ_SYS_NORMAL_ACCOUNT"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 87
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQ_SYS_ROLE
-- ----------------------------
DROP SEQUENCE "SCM"."SEQ_SYS_ROLE";
CREATE SEQUENCE "SCM"."SEQ_SYS_ROLE"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 65
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQ_SYSDIC
-- ----------------------------
DROP SEQUENCE "SCM"."SEQ_SYSDIC";
CREATE SEQUENCE "SCM"."SEQ_SYSDIC"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 49
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQ_VENDOR
-- ----------------------------
DROP SEQUENCE "SCM"."SEQ_VENDOR";
CREATE SEQUENCE "SCM"."SEQ_VENDOR"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 7221
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQ_VENINC
-- ----------------------------
DROP SEQUENCE "SCM"."SEQ_VENINC";
CREATE SEQUENCE "SCM"."SEQ_VENINC"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 1
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_CAT_CATGROUP
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_CAT_CATGROUP";
CREATE SEQUENCE "SCM"."SEQUENCE_CAT_CATGROUP"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 21
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_CAT_CATGROUPITM
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_CAT_CATGROUPITM";
CREATE SEQUENCE "SCM"."SEQUENCE_CAT_CATGROUPITM"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 41
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_HOP_EVALUTE
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_HOP_EVALUTE";
CREATE SEQUENCE "SCM"."SEQUENCE_HOP_EVALUTE"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 81
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_HOP_EVALUTE_DETAIL
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_HOP_EVALUTE_DETAIL";
CREATE SEQUENCE "SCM"."SEQUENCE_HOP_EVALUTE_DETAIL"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 1
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_HOP_INC
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_HOP_INC";
CREATE SEQUENCE "SCM"."SEQUENCE_HOP_INC"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 19821
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_HOP_INC_PIC
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_HOP_INC_PIC";
CREATE SEQUENCE "SCM"."SEQUENCE_HOP_INC_PIC"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 81
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_HOP_INC_REF
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_HOP_INC_REF";
CREATE SEQUENCE "SCM"."SEQUENCE_HOP_INC_REF"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 1
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_HOP_INCALIAS
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_HOP_INCALIAS";
CREATE SEQUENCE "SCM"."SEQUENCE_HOP_INCALIAS"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 6521
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_HOP_MANF
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_HOP_MANF";
CREATE SEQUENCE "SCM"."SEQUENCE_HOP_MANF"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 1961
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_HOP_VENDOR
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_HOP_VENDOR";
CREATE SEQUENCE "SCM"."SEQUENCE_HOP_VENDOR"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 6221
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_ORD_DETAIL
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_ORD_DETAIL";
CREATE SEQUENCE "SCM"."SEQUENCE_ORD_DETAIL"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 61
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_ORD_EXESTATE
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_ORD_EXESTATE";
CREATE SEQUENCE "SCM"."SEQUENCE_ORD_EXESTATE"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 281
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_ORD_ORDER
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_ORD_ORDER";
CREATE SEQUENCE "SCM"."SEQUENCE_ORD_ORDER"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 201
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_ORD_ORDERITM
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_ORD_ORDERITM";
CREATE SEQUENCE "SCM"."SEQUENCE_ORD_ORDERITM"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 241
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_ORD_SHOPPING
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_ORD_SHOPPING";
CREATE SEQUENCE "SCM"."SEQUENCE_ORD_SHOPPING"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 181
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_ORD_STATE
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_ORD_STATE";
CREATE SEQUENCE "SCM"."SEQUENCE_ORD_STATE"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 41
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_SYS_APPNO
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_SYS_APPNO";
CREATE SEQUENCE "SCM"."SEQUENCE_SYS_APPNO"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 41
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_SYS_CTLOC
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_SYS_CTLOC";
CREATE SEQUENCE "SCM"."SEQUENCE_SYS_CTLOC"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 161
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_SYS_CTLOC_DESTINATION
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_SYS_CTLOC_DESTINATION";
CREATE SEQUENCE "SCM"."SEQUENCE_SYS_CTLOC_DESTINATION"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 121
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_SYS_HOSPITAL
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_SYS_HOSPITAL";
CREATE SEQUENCE "SCM"."SEQUENCE_SYS_HOSPITAL"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 21
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_SYS_IMPMODEL
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_SYS_IMPMODEL";
CREATE SEQUENCE "SCM"."SEQUENCE_SYS_IMPMODEL"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 401
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_T_SYS_FUNC_ROLE
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_T_SYS_FUNC_ROLE";
CREATE SEQUENCE "SCM"."SEQUENCE_T_SYS_FUNC_ROLE"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 1
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_T_SYS_LOG
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_T_SYS_LOG";
CREATE SEQUENCE "SCM"."SEQUENCE_T_SYS_LOG"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 1
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_T_VEN_QUALIF_PIC_LOG
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_T_VEN_QUALIF_PIC_LOG";
CREATE SEQUENCE "SCM"."SEQUENCE_T_VEN_QUALIF_PIC_LOG"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 1
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_VEN_DELIVER
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_VEN_DELIVER";
CREATE SEQUENCE "SCM"."SEQUENCE_VEN_DELIVER"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 81
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_VEN_DELIVERITM
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_VEN_DELIVERITM";
CREATE SEQUENCE "SCM"."SEQUENCE_VEN_DELIVERITM"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 121
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_VEN_EVALUTE
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_VEN_EVALUTE";
CREATE SEQUENCE "SCM"."SEQUENCE_VEN_EVALUTE"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 1
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_VEN_EVALUTE_DETAIL
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_VEN_EVALUTE_DETAIL";
CREATE SEQUENCE "SCM"."SEQUENCE_VEN_EVALUTE_DETAIL"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 1
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_VEN_INC
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_VEN_INC";
CREATE SEQUENCE "SCM"."SEQUENCE_VEN_INC"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 6341
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_VEN_INC_PIC
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_VEN_INC_PIC";
CREATE SEQUENCE "SCM"."SEQUENCE_VEN_INC_PIC"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999
 START WITH 208
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_VEN_QUALIF_PIC
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_VEN_QUALIF_PIC";
CREATE SEQUENCE "SCM"."SEQUENCE_VEN_QUALIF_PIC"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 181
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_VEN_QUALIF_TYPE
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_VEN_QUALIF_TYPE";
CREATE SEQUENCE "SCM"."SEQUENCE_VEN_QUALIF_TYPE"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 42
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_VEN_QUALIFICATION
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_VEN_QUALIFICATION";
CREATE SEQUENCE "SCM"."SEQUENCE_VEN_QUALIFICATION"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 161
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_VEN_TRANSPORT
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_VEN_TRANSPORT";
CREATE SEQUENCE "SCM"."SEQUENCE_VEN_TRANSPORT"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 1
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_VEN_VENDOR_LOG
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_VEN_VENDOR_LOG";
CREATE SEQUENCE "SCM"."SEQUENCE_VEN_VENDOR_LOG"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 1
 CACHE 20;

-- ----------------------------
-- Indexes structure for table T_APP_LOG
-- ----------------------------

-- ----------------------------
-- Checks structure for table T_APP_LOG
-- ----------------------------
ALTER TABLE "SCM"."T_APP_LOG" ADD CHECK ("LOG_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_APP_LOG
-- ----------------------------
ALTER TABLE "SCM"."T_APP_LOG" ADD PRIMARY KEY ("LOG_ID");

-- ----------------------------
-- Indexes structure for table T_APP_LOG_AUDIT
-- ----------------------------

-- ----------------------------
-- Checks structure for table T_APP_LOG_AUDIT
-- ----------------------------
ALTER TABLE "SCM"."T_APP_LOG_AUDIT" ADD CHECK ("AUDIT_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_APP_LOG_AUDIT
-- ----------------------------
ALTER TABLE "SCM"."T_APP_LOG_AUDIT" ADD PRIMARY KEY ("AUDIT_ID");

-- ----------------------------
-- Indexes structure for table T_CAT_DRUGGROUP
-- ----------------------------

-- ----------------------------
-- Checks structure for table T_CAT_DRUGGROUP
-- ----------------------------
ALTER TABLE "SCM"."T_CAT_DRUGGROUP" ADD CHECK ("SDG_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_CAT_DRUGGROUP
-- ----------------------------
ALTER TABLE "SCM"."T_CAT_DRUGGROUP" ADD PRIMARY KEY ("SDG_ID");

-- ----------------------------
-- Indexes structure for table T_CAT_DRUGGROUPITM
-- ----------------------------

-- ----------------------------
-- Checks structure for table T_CAT_DRUGGROUPITM
-- ----------------------------
ALTER TABLE "SCM"."T_CAT_DRUGGROUPITM" ADD CHECK ("SDGI_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_CAT_DRUGGROUPITM
-- ----------------------------
ALTER TABLE "SCM"."T_CAT_DRUGGROUPITM" ADD PRIMARY KEY ("SDGI_ID");

-- ----------------------------
-- Checks structure for table T_HOP_CTLOC
-- ----------------------------
ALTER TABLE "SCM"."T_HOP_CTLOC" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Indexes structure for table T_HOP_EVALUTE
-- ----------------------------

-- ----------------------------
-- Checks structure for table T_HOP_EVALUTE
-- ----------------------------
ALTER TABLE "SCM"."T_HOP_EVALUTE" ADD CHECK ("ELE_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_HOP_EVALUTE
-- ----------------------------
ALTER TABLE "SCM"."T_HOP_EVALUTE" ADD PRIMARY KEY ("ELE_ID");

-- ----------------------------
-- Indexes structure for table T_HOP_INC
-- ----------------------------

-- ----------------------------
-- Checks structure for table T_HOP_INC
-- ----------------------------
ALTER TABLE "SCM"."T_HOP_INC" ADD CHECK ("INC_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_HOP_INC
-- ----------------------------
ALTER TABLE "SCM"."T_HOP_INC" ADD PRIMARY KEY ("INC_ID");

-- ----------------------------
-- Indexes structure for table T_HOP_INC_PIC
-- ----------------------------

-- ----------------------------
-- Checks structure for table T_HOP_INC_PIC
-- ----------------------------
ALTER TABLE "SCM"."T_HOP_INC_PIC" ADD CHECK ("INC_PIC_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_HOP_INC_PIC
-- ----------------------------
ALTER TABLE "SCM"."T_HOP_INC_PIC" ADD PRIMARY KEY ("INC_PIC_ID");

-- ----------------------------
-- Indexes structure for table T_HOP_INCALIAS
-- ----------------------------
CREATE INDEX "SCM"."FK_INCALIAS_TEXT"
ON "SCM"."T_HOP_INCALIAS" ("INCALIAS_TEXT" ASC)
LOGGING
VISIBLE;

-- ----------------------------
-- Checks structure for table T_HOP_INCALIAS
-- ----------------------------
ALTER TABLE "SCM"."T_HOP_INCALIAS" ADD CHECK ("INCALIAS_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_HOP_INCALIAS
-- ----------------------------
ALTER TABLE "SCM"."T_HOP_INCALIAS" ADD PRIMARY KEY ("INCALIAS_ID");

-- ----------------------------
-- Indexes structure for table T_HOP_MANF
-- ----------------------------

-- ----------------------------
-- Checks structure for table T_HOP_MANF
-- ----------------------------
ALTER TABLE "SCM"."T_HOP_MANF" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_HOP_MANF
-- ----------------------------
ALTER TABLE "SCM"."T_HOP_MANF" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table T_HOP_VENDOR
-- ----------------------------
CREATE INDEX "SCM"."FK_VENDORID"
ON "SCM"."T_HOP_VENDOR" ("H_VENDORID" ASC)
LOGGING
VISIBLE;

-- ----------------------------
-- Checks structure for table T_HOP_VENDOR
-- ----------------------------
ALTER TABLE "SCM"."T_HOP_VENDOR" ADD CHECK ("H_VENID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_HOP_VENDOR
-- ----------------------------
ALTER TABLE "SCM"."T_HOP_VENDOR" ADD PRIMARY KEY ("H_VENID");

-- ----------------------------
-- Indexes structure for table T_LOG_CONFIGURE
-- ----------------------------

-- ----------------------------
-- Checks structure for table T_LOG_CONFIGURE
-- ----------------------------
ALTER TABLE "SCM"."T_LOG_CONFIGURE" ADD CHECK ("LOG_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_LOG_CONFIGURE
-- ----------------------------
ALTER TABLE "SCM"."T_LOG_CONFIGURE" ADD PRIMARY KEY ("LOG_ID");

-- ----------------------------
-- Indexes structure for table T_ORD_EXESTATE
-- ----------------------------
CREATE INDEX "SCM"."FK_ORD_ID"
ON "SCM"."T_ORD_EXESTATE" ("ORD_ID" ASC)
LOGGING
VISIBLE;

-- ----------------------------
-- Checks structure for table T_ORD_EXESTATE
-- ----------------------------
ALTER TABLE "SCM"."T_ORD_EXESTATE" ADD CHECK ("EXESTATE_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_ORD_EXESTATE
-- ----------------------------
ALTER TABLE "SCM"."T_ORD_EXESTATE" ADD PRIMARY KEY ("EXESTATE_ID");

-- ----------------------------
-- Indexes structure for table T_ORD_ORDER
-- ----------------------------
CREATE INDEX "SCM"."PK_ORDER_HOP"
ON "SCM"."T_ORD_ORDER" ("HOP_ID" ASC)
LOGGING
VISIBLE;
CREATE INDEX "SCM"."PK_ORDER_VENDOR"
ON "SCM"."T_ORD_ORDER" ("VENDOR_ID" ASC)
LOGGING
VISIBLE;

-- ----------------------------
-- Checks structure for table T_ORD_ORDER
-- ----------------------------
ALTER TABLE "SCM"."T_ORD_ORDER" ADD CHECK ("ORDER_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_ORD_ORDER
-- ----------------------------
ALTER TABLE "SCM"."T_ORD_ORDER" ADD PRIMARY KEY ("ORDER_ID");

-- ----------------------------
-- Indexes structure for table T_ORD_ORDERDETAIL
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table T_ORD_ORDERDETAIL
-- ----------------------------
ALTER TABLE "SCM"."T_ORD_ORDERDETAIL" ADD PRIMARY KEY ("ORDER_ID");

-- ----------------------------
-- Indexes structure for table T_ORD_ORDERDETAILSUB
-- ----------------------------

-- ----------------------------
-- Checks structure for table T_ORD_ORDERDETAILSUB
-- ----------------------------
ALTER TABLE "SCM"."T_ORD_ORDERDETAILSUB" ADD CHECK ("ORDSUB_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_ORD_ORDERDETAILSUB
-- ----------------------------
ALTER TABLE "SCM"."T_ORD_ORDERDETAILSUB" ADD PRIMARY KEY ("ORDSUB_ID");

-- ----------------------------
-- Indexes structure for table T_ORD_ORDERITM
-- ----------------------------
CREATE INDEX "SCM"."FK_ORDER_ID"
ON "SCM"."T_ORD_ORDERITM" ("ORD_ID" ASC)
LOGGING
VISIBLE;

-- ----------------------------
-- Checks structure for table T_ORD_ORDERITM
-- ----------------------------
ALTER TABLE "SCM"."T_ORD_ORDERITM" ADD CHECK ("ORDERITM_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_ORD_ORDERITM
-- ----------------------------
ALTER TABLE "SCM"."T_ORD_ORDERITM" ADD PRIMARY KEY ("ORDERITM_ID");

-- ----------------------------
-- Indexes structure for table T_ORD_SHOPPING
-- ----------------------------
CREATE INDEX "SCM"."PK_ORD_SHOPUSER"
ON "SCM"."T_ORD_SHOPPING" ("SHOP_USERID" ASC)
LOGGING
VISIBLE;

-- ----------------------------
-- Checks structure for table T_ORD_SHOPPING
-- ----------------------------
ALTER TABLE "SCM"."T_ORD_SHOPPING" ADD CHECK ("SHOP_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_ORD_SHOPPING
-- ----------------------------
ALTER TABLE "SCM"."T_ORD_SHOPPING" ADD PRIMARY KEY ("SHOP_ID");

-- ----------------------------
-- Indexes structure for table T_ORD_STATE
-- ----------------------------

-- ----------------------------
-- Checks structure for table T_ORD_STATE
-- ----------------------------
ALTER TABLE "SCM"."T_ORD_STATE" ADD CHECK ("STATE_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_ORD_STATE
-- ----------------------------
ALTER TABLE "SCM"."T_ORD_STATE" ADD PRIMARY KEY ("STATE_ID");

-- ----------------------------
-- Indexes structure for table T_SYS_APPNO
-- ----------------------------

-- ----------------------------
-- Checks structure for table T_SYS_APPNO
-- ----------------------------
ALTER TABLE "SCM"."T_SYS_APPNO" ADD CHECK ("APPNO_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_SYS_APPNO
-- ----------------------------
ALTER TABLE "SCM"."T_SYS_APPNO" ADD PRIMARY KEY ("APPNO_ID");

-- ----------------------------
-- Indexes structure for table T_SYS_CTLOC
-- ----------------------------

-- ----------------------------
-- Checks structure for table T_SYS_CTLOC
-- ----------------------------
ALTER TABLE "SCM"."T_SYS_CTLOC" ADD CHECK ("CTLOC_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_SYS_CTLOC
-- ----------------------------
ALTER TABLE "SCM"."T_SYS_CTLOC" ADD PRIMARY KEY ("CTLOC_ID");

-- ----------------------------
-- Indexes structure for table T_SYS_CTLOC_DESTINATION
-- ----------------------------

-- ----------------------------
-- Checks structure for table T_SYS_CTLOC_DESTINATION
-- ----------------------------
ALTER TABLE "SCM"."T_SYS_CTLOC_DESTINATION" ADD CHECK ("CTLOCDES_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_SYS_CTLOC_DESTINATION
-- ----------------------------
ALTER TABLE "SCM"."T_SYS_CTLOC_DESTINATION" ADD PRIMARY KEY ("CTLOCDES_ID");

-- ----------------------------
-- Indexes structure for table T_SYS_DICT
-- ----------------------------

-- ----------------------------
-- Checks structure for table T_SYS_DICT
-- ----------------------------
ALTER TABLE "SCM"."T_SYS_DICT" ADD CHECK ("DIC_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_SYS_DICT
-- ----------------------------
ALTER TABLE "SCM"."T_SYS_DICT" ADD PRIMARY KEY ("DIC_ID");

-- ----------------------------
-- Indexes structure for table T_SYS_HOSPITAL
-- ----------------------------

-- ----------------------------
-- Checks structure for table T_SYS_HOSPITAL
-- ----------------------------
ALTER TABLE "SCM"."T_SYS_HOSPITAL" ADD CHECK ("HOSPITAL_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_SYS_HOSPITAL
-- ----------------------------
ALTER TABLE "SCM"."T_SYS_HOSPITAL" ADD PRIMARY KEY ("HOSPITAL_ID");

-- ----------------------------
-- Indexes structure for table T_SYS_IMPMODEL
-- ----------------------------

-- ----------------------------
-- Checks structure for table T_SYS_IMPMODEL
-- ----------------------------
ALTER TABLE "SCM"."T_SYS_IMPMODEL" ADD CHECK ("IMPMODEL_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_SYS_IMPMODEL
-- ----------------------------
ALTER TABLE "SCM"."T_SYS_IMPMODEL" ADD PRIMARY KEY ("IMPMODEL_ID");

-- ----------------------------
-- Indexes structure for table T_SYS_LOG
-- ----------------------------

-- ----------------------------
-- Checks structure for table T_SYS_LOG
-- ----------------------------
ALTER TABLE "SCM"."T_SYS_LOG" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_SYS_LOG
-- ----------------------------
ALTER TABLE "SCM"."T_SYS_LOG" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table T_SYS_NORMAL_ACCOUNT
-- ----------------------------

-- ----------------------------
-- Checks structure for table T_SYS_NORMAL_ACCOUNT
-- ----------------------------
ALTER TABLE "SCM"."T_SYS_NORMAL_ACCOUNT" ADD CHECK ("ACCOUNT_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_SYS_NORMAL_ACCOUNT
-- ----------------------------
ALTER TABLE "SCM"."T_SYS_NORMAL_ACCOUNT" ADD PRIMARY KEY ("ACCOUNT_ID");

-- ----------------------------
-- Indexes structure for table T_SYS_NORMAL_USER
-- ----------------------------

-- ----------------------------
-- Checks structure for table T_SYS_NORMAL_USER
-- ----------------------------
ALTER TABLE "SCM"."T_SYS_NORMAL_USER" ADD CHECK ("USER_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_SYS_NORMAL_USER
-- ----------------------------
ALTER TABLE "SCM"."T_SYS_NORMAL_USER" ADD PRIMARY KEY ("USER_ID");

-- ----------------------------
-- Checks structure for table T_SYS_ROLE
-- ----------------------------
ALTER TABLE "SCM"."T_SYS_ROLE" ADD CHECK ("ROLE_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_SYS_ROLE
-- ----------------------------
ALTER TABLE "SCM"."T_SYS_ROLE" ADD PRIMARY KEY ("ROLE_ID") DISABLE;

-- ----------------------------
-- Indexes structure for table T_SYS_ROLE_LOC
-- ----------------------------
CREATE INDEX "SCM"."I_SYS_LOC_ID"
ON "SCM"."T_SYS_ROLE_LOC" ("SYS_LOC_ID" ASC)
LOGGING
VISIBLE;
CREATE INDEX "SCM"."I_SYS_ROLE_ID"
ON "SCM"."T_SYS_ROLE_LOC" ("SYS_ROLE_ID" ASC)
LOGGING
VISIBLE;

-- ----------------------------
-- Indexes structure for table T_SYS_VEN_ROLE
-- ----------------------------
CREATE INDEX "SCM"."I_SYS_VENDROLE_ROLE"
ON "SCM"."T_SYS_VEN_ROLE" ("SYS_ROLE_ID" ASC)
LOGGING
VISIBLE;
CREATE INDEX "SCM"."I_SYS_VENROLE_VEN"
ON "SCM"."T_SYS_VEN_ROLE" ("SYS_VEN_ID" ASC)
LOGGING
VISIBLE;

-- ----------------------------
-- Checks structure for table T_SYS_VEN_ROLE
-- ----------------------------
ALTER TABLE "SCM"."T_SYS_VEN_ROLE" ADD CHECK ("SYS_VEN_ROLE_ID" IS NOT NULL);

-- ----------------------------
-- Indexes structure for table T_VEN_DELIVER
-- ----------------------------
CREATE INDEX "SCM"."I_DELIVER_HOP_ID"
ON "SCM"."T_VEN_DELIVER" ("DELIVER_HOPID" ASC)
LOGGING
VISIBLE;
CREATE INDEX "SCM"."I_DELIVER_ORD_ID"
ON "SCM"."T_VEN_DELIVER" ("DELIVER_ORDERID" ASC)
LOGGING
VISIBLE;
CREATE INDEX "SCM"."I_DELIVER_PUR_ID"
ON "SCM"."T_VEN_DELIVER" ("DELIVER_PURLOC" ASC)
LOGGING
VISIBLE;
CREATE INDEX "SCM"."I_DELIVER_REC_ID"
ON "SCM"."T_VEN_DELIVER" ("DELIVER_RECLOC" ASC)
LOGGING
VISIBLE;
CREATE INDEX "SCM"."I_DELIVER_VENDOR_ID"
ON "SCM"."T_VEN_DELIVER" ("DELIVER_VENDORID" ASC)
LOGGING
VISIBLE;

-- ----------------------------
-- Checks structure for table T_VEN_DELIVER
-- ----------------------------
ALTER TABLE "SCM"."T_VEN_DELIVER" ADD CHECK ("DELIVER_ROWID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_VEN_DELIVER
-- ----------------------------
ALTER TABLE "SCM"."T_VEN_DELIVER" ADD PRIMARY KEY ("DELIVER_ROWID");

-- ----------------------------
-- Indexes structure for table T_VEN_DELIVERITM
-- ----------------------------
CREATE INDEX "SCM"."I_DELIVERITM_HOPINC_ID"
ON "SCM"."T_VEN_DELIVERITM" ("DELIVERITM_HOPINCID" ASC)
LOGGING
VISIBLE;
CREATE INDEX "SCM"."I_DELIVERITM_ORDERITMID"
ON "SCM"."T_VEN_DELIVERITM" ("DELIVERITM_ORDERITMID" ASC)
LOGGING
VISIBLE;
CREATE INDEX "SCM"."I_DELIVERITM_PID"
ON "SCM"."T_VEN_DELIVERITM" ("DELIVERITM_PARENTID" ASC)
LOGGING
VISIBLE;

-- ----------------------------
-- Checks structure for table T_VEN_DELIVERITM
-- ----------------------------
ALTER TABLE "SCM"."T_VEN_DELIVERITM" ADD CHECK ("DELIVERITM_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_VEN_DELIVERITM
-- ----------------------------
ALTER TABLE "SCM"."T_VEN_DELIVERITM" ADD PRIMARY KEY ("DELIVERITM_ID");

-- ----------------------------
-- Indexes structure for table T_VEN_HOP_INC
-- ----------------------------

-- ----------------------------
-- Checks structure for table T_VEN_HOP_INC
-- ----------------------------
ALTER TABLE "SCM"."T_VEN_HOP_INC" ADD CHECK ("VEN_HOP_INC_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_VEN_HOP_INC
-- ----------------------------
ALTER TABLE "SCM"."T_VEN_HOP_INC" ADD PRIMARY KEY ("VEN_HOP_INC_ID");

-- ----------------------------
-- Indexes structure for table T_VEN_INC
-- ----------------------------

-- ----------------------------
-- Checks structure for table T_VEN_INC
-- ----------------------------
ALTER TABLE "SCM"."T_VEN_INC" ADD CHECK ("VEN_INC_ROWID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_VEN_INC
-- ----------------------------
ALTER TABLE "SCM"."T_VEN_INC" ADD PRIMARY KEY ("VEN_INC_ROWID");

-- ----------------------------
-- Indexes structure for table T_VEN_INC_PIC
-- ----------------------------

-- ----------------------------
-- Checks structure for table T_VEN_INC_PIC
-- ----------------------------
ALTER TABLE "SCM"."T_VEN_INC_PIC" ADD CHECK ("VEN_INC_PIC_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_VEN_INC_PIC
-- ----------------------------
ALTER TABLE "SCM"."T_VEN_INC_PIC" ADD PRIMARY KEY ("VEN_INC_PIC_ID");

-- ----------------------------
-- Checks structure for table T_VEN_QUALIF
-- ----------------------------
ALTER TABLE "SCM"."T_VEN_QUALIF" ADD CHECK ("QUALIFID" IS NOT NULL);

-- ----------------------------
-- Indexes structure for table T_VEN_QUALIF_PIC
-- ----------------------------

-- ----------------------------
-- Checks structure for table T_VEN_QUALIF_PIC
-- ----------------------------
ALTER TABLE "SCM"."T_VEN_QUALIF_PIC" ADD CHECK ("QUALIF_PIC_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_VEN_QUALIF_PIC
-- ----------------------------
ALTER TABLE "SCM"."T_VEN_QUALIF_PIC" ADD PRIMARY KEY ("QUALIF_PIC_ID");

-- ----------------------------
-- Indexes structure for table T_VEN_QUALIF_PIC_LOG
-- ----------------------------

-- ----------------------------
-- Checks structure for table T_VEN_QUALIF_PIC_LOG
-- ----------------------------
ALTER TABLE "SCM"."T_VEN_QUALIF_PIC_LOG" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_VEN_QUALIF_PIC_LOG
-- ----------------------------
ALTER TABLE "SCM"."T_VEN_QUALIF_PIC_LOG" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Checks structure for table T_VEN_QUALIF_TYPE
-- ----------------------------
ALTER TABLE "SCM"."T_VEN_QUALIF_TYPE" ADD CHECK ("VENQUALIFTYPE_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_VEN_QUALIF_TYPE
-- ----------------------------
ALTER TABLE "SCM"."T_VEN_QUALIF_TYPE" ADD PRIMARY KEY ("VENQUALIFTYPE_ID") DISABLE;

-- ----------------------------
-- Indexes structure for table T_VEN_QUALIFICATION
-- ----------------------------
CREATE INDEX "SCM"."FK_QUALIF_VEN"
ON "SCM"."T_VEN_QUALIFICATION" ("VENDOR_ID" ASC)
LOGGING
VISIBLE;

-- ----------------------------
-- Checks structure for table T_VEN_QUALIFICATION
-- ----------------------------
ALTER TABLE "SCM"."T_VEN_QUALIFICATION" ADD CHECK ("QUALIFICATION_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_VEN_QUALIFICATION
-- ----------------------------
ALTER TABLE "SCM"."T_VEN_QUALIFICATION" ADD PRIMARY KEY ("QUALIFICATION_ID");

-- ----------------------------
-- Indexes structure for table T_VEN_QUALIFICATION_LOG
-- ----------------------------

-- ----------------------------
-- Checks structure for table T_VEN_QUALIFICATION_LOG
-- ----------------------------
ALTER TABLE "SCM"."T_VEN_QUALIFICATION_LOG" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_VEN_QUALIFICATION_LOG
-- ----------------------------
ALTER TABLE "SCM"."T_VEN_QUALIFICATION_LOG" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table T_VEN_VENDOR
-- ----------------------------

-- ----------------------------
-- Checks structure for table T_VEN_VENDOR
-- ----------------------------
ALTER TABLE "SCM"."T_VEN_VENDOR" ADD CHECK ("VEN_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_VEN_VENDOR
-- ----------------------------
ALTER TABLE "SCM"."T_VEN_VENDOR" ADD PRIMARY KEY ("VEN_ID");

-- ----------------------------
-- Indexes structure for table T_VEN_VENDOR_LOG
-- ----------------------------

-- ----------------------------
-- Checks structure for table T_VEN_VENDOR_LOG
-- ----------------------------
ALTER TABLE "SCM"."T_VEN_VENDOR_LOG" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_VEN_VENDOR_LOG
-- ----------------------------
ALTER TABLE "SCM"."T_VEN_VENDOR_LOG" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Foreign Key structure for table "SCM"."T_CAT_DRUGGROUP"
-- ----------------------------
ALTER TABLE "SCM"."T_CAT_DRUGGROUP" ADD FOREIGN KEY ("SDG_HOPID") REFERENCES "SCM"."T_SYS_HOSPITAL" ("HOSPITAL_ID");

-- ----------------------------
-- Foreign Key structure for table "SCM"."T_CAT_DRUGGROUPITM"
-- ----------------------------
ALTER TABLE "SCM"."T_CAT_DRUGGROUPITM" ADD FOREIGN KEY ("SDGI_PARREF_ID") REFERENCES "SCM"."T_CAT_DRUGGROUP" ("SDG_ID");

-- ----------------------------
-- Foreign Key structure for table "SCM"."T_HOP_INC"
-- ----------------------------
ALTER TABLE "SCM"."T_HOP_INC" ADD FOREIGN KEY ("INC_HOSPID") REFERENCES "SCM"."T_SYS_HOSPITAL" ("HOSPITAL_ID") ON DELETE CASCADE;
ALTER TABLE "SCM"."T_HOP_INC" ADD FOREIGN KEY ("INC_MANFID") REFERENCES "SCM"."T_HOP_MANF" ("ID") ON DELETE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "SCM"."T_HOP_INC_PIC"
-- ----------------------------
ALTER TABLE "SCM"."T_HOP_INC_PIC" ADD FOREIGN KEY ("INC_PIC_INCID") REFERENCES "SCM"."T_HOP_INC" ("INC_ID") ON DELETE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "SCM"."T_ORD_ORDERDETAIL"
-- ----------------------------
ALTER TABLE "SCM"."T_ORD_ORDERDETAIL" ADD FOREIGN KEY ("ORDER_RECDESTINATION") REFERENCES "SCM"."T_SYS_CTLOC_DESTINATION" ("CTLOCDES_ID");
ALTER TABLE "SCM"."T_ORD_ORDERDETAIL" ADD FOREIGN KEY ("ORDER_HOP_ID") REFERENCES "SCM"."T_SYS_HOSPITAL" ("HOSPITAL_ID");
ALTER TABLE "SCM"."T_ORD_ORDERDETAIL" ADD FOREIGN KEY ("ORDER_HOP_INC_ID") REFERENCES "SCM"."T_HOP_INC" ("INC_ID");
ALTER TABLE "SCM"."T_ORD_ORDERDETAIL" ADD FOREIGN KEY ("ORDER_VEN_INC_ID") REFERENCES "SCM"."T_VEN_INC" ("VEN_INC_ROWID");
ALTER TABLE "SCM"."T_ORD_ORDERDETAIL" ADD FOREIGN KEY ("ORDER_RECLOC") REFERENCES "SCM"."T_SYS_CTLOC" ("CTLOC_ID");
ALTER TABLE "SCM"."T_ORD_ORDERDETAIL" ADD FOREIGN KEY ("ORDER_USER_ID") REFERENCES "SCM"."T_SYS_NORMAL_ACCOUNT" ("ACCOUNT_ID");
ALTER TABLE "SCM"."T_ORD_ORDERDETAIL" ADD FOREIGN KEY ("ORDER_VEN_ID") REFERENCES "SCM"."T_VEN_VENDOR" ("VEN_ID");

-- ----------------------------
-- Foreign Key structure for table "SCM"."T_SYS_CTLOC"
-- ----------------------------
ALTER TABLE "SCM"."T_SYS_CTLOC" ADD FOREIGN KEY ("CTLOC_HOSPID") REFERENCES "SCM"."T_SYS_HOSPITAL" ("HOSPITAL_ID") ON DELETE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "SCM"."T_SYS_CTLOC_DESTINATION"
-- ----------------------------
ALTER TABLE "SCM"."T_SYS_CTLOC_DESTINATION" ADD FOREIGN KEY ("CTLOCDES_CTLOCDR") REFERENCES "SCM"."T_SYS_CTLOC" ("CTLOC_ID") ON DELETE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "SCM"."T_SYS_NORMAL_ACCOUNT"
-- ----------------------------
ALTER TABLE "SCM"."T_SYS_NORMAL_ACCOUNT" ADD FOREIGN KEY ("USER_ID") REFERENCES "SCM"."T_SYS_NORMAL_USER" ("USER_ID") ON DELETE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "SCM"."T_VEN_INC"
-- ----------------------------
ALTER TABLE "SCM"."T_VEN_INC" ADD FOREIGN KEY ("VEN_INC_MANFID") REFERENCES "SCM"."T_HOP_MANF" ("ID") ON DELETE CASCADE;
ALTER TABLE "SCM"."T_VEN_INC" ADD FOREIGN KEY ("VEN_INC_VENID") REFERENCES "SCM"."T_VEN_VENDOR" ("VEN_ID") ON DELETE CASCADE;
