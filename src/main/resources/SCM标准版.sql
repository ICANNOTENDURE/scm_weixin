/*
Navicat Oracle Data Transfer
Oracle Client Version : 11.2.0.1.0

Source Server         : 本地
Source Server Version : 110200
Source Host           : 127.0.0.1:1521
Source Schema         : SCM

Target Server Type    : ORACLE
Target Server Version : 110200
File Encoding         : 65001

Date: 2015-06-11 10:48:30
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
"SDG_CODE" VARCHAR2(200 BYTE) NULL ,
"SDG_DESC" VARCHAR2(200 BYTE) NULL ,
"SDG_ID" NUMBER NOT NULL ,
"SDG_PARREF_ID" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of T_CAT_DRUGGROUP
-- ----------------------------
INSERT INTO "SCM"."T_CAT_DRUGGROUP" VALUES ('被服', '被服', '15', '23');
INSERT INTO "SCM"."T_CAT_DRUGGROUP" VALUES ('五金', '五金', '13', '23');
INSERT INTO "SCM"."T_CAT_DRUGGROUP" VALUES ('办公用品', '办公用品', '14', '3');
INSERT INTO "SCM"."T_CAT_DRUGGROUP" VALUES ('办公文具', '办公文具', '16', '3');
INSERT INTO "SCM"."T_CAT_DRUGGROUP" VALUES ('其他', '其他', '19', '3');
INSERT INTO "SCM"."T_CAT_DRUGGROUP" VALUES ('手术器械', '手术器械', '45', '22');
INSERT INTO "SCM"."T_CAT_DRUGGROUP" VALUES ('一次性医用包', '一次性医用包', '33', '21');
INSERT INTO "SCM"."T_CAT_DRUGGROUP" VALUES ('一次医用导管', '一次医用导管', '29', '21');
INSERT INTO "SCM"."T_CAT_DRUGGROUP" VALUES ('伤口敷料、护创材料', '伤口敷料、护创材料', '31', '21');
INSERT INTO "SCM"."T_CAT_DRUGGROUP" VALUES ('医用胶带、胶贴', '医用胶带、胶贴', '32', '21');
INSERT INTO "SCM"."T_CAT_DRUGGROUP" VALUES ('医用纱布、医用绷带、骨科夹板', '医用纱布、医用绷带、骨科夹板', '34', '21');
INSERT INTO "SCM"."T_CAT_DRUGGROUP" VALUES ('医用消毒片、医用海绵', '医用消毒片、医用海绵', '35', '21');
INSERT INTO "SCM"."T_CAT_DRUGGROUP" VALUES ('注射及输液器械', '注射及输液器械', '36', '21');
INSERT INTO "SCM"."T_CAT_DRUGGROUP" VALUES ('穿刺针、活检针', '穿刺针、活检针', '37', '21');
INSERT INTO "SCM"."T_CAT_DRUGGROUP" VALUES ('留置针', '留置针', '38', '21');
INSERT INTO "SCM"."T_CAT_DRUGGROUP" VALUES ('医用缝合材料及器械', '医用缝合材料及器械', '39', '21');
INSERT INTO "SCM"."T_CAT_DRUGGROUP" VALUES ('采血、输血器材', '采血、输血器材', '40', '21');
INSERT INTO "SCM"."T_CAT_DRUGGROUP" VALUES ('手术室防护隔离卫生用品', '手术室防护隔离卫生用品', '41', '21');
INSERT INTO "SCM"."T_CAT_DRUGGROUP" VALUES ('介入放射造影器械', '介入放射造影器械', '42', '21');
INSERT INTO "SCM"."T_CAT_DRUGGROUP" VALUES ('其它医用高分子材料', '其它医用高分子材料', '43', '21');

-- ----------------------------
-- Table structure for T_CAT_DRUGGROUPITM
-- ----------------------------
DROP TABLE "SCM"."T_CAT_DRUGGROUPITM";
CREATE TABLE "SCM"."T_CAT_DRUGGROUPITM" (
"SDGI_ID" NUMBER NOT NULL ,
"SDGI_PARREF_ID" NUMBER NULL ,
"SDGI_CODE" VARCHAR2(200 BYTE) NULL ,
"SDGI_DESC" VARCHAR2(200 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of T_CAT_DRUGGROUPITM
-- ----------------------------
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('130', '16', '中性笔', '中性笔');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('21', '32', '透气胶带', '透气胶带');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('22', '32', '外科手术胶带', '外科手术胶带');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('23', '29', '其他一次性医用导管', '其他一次性医用导管');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('24', '29', '鼻饲管、肛管 ', '鼻饲管、肛管 ');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('25', '29', '中心静脉导管', '中心静脉导管');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('26', '29', '胃管', '胃管');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('56', '32', '输液胶贴 ', '输液胶贴 ');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('28', '29', '呼吸道插管、导管系列', '呼吸道插管、导管系列');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('57', '32', '留置针胶贴', '留置针胶贴');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('58', '36', '注射针、输液针', '注射针、输液针');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('59', '36', '一次性注射器 ', '一次性注射器 ');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('60', '36', '胰岛素注射器', '胰岛素注射器');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('61', '36', '输液器', '输液器');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('62', '36', '无针注射器', '无针注射器');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('63', '36', '注射、输液配件', '注射、输液配件');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('64', '36', '一次性使用输注泵', '一次性使用输注泵');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('82', '34', '弹性绷带', '弹性绷带');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('83', '34', '自粘性绷带', '自粘性绷带');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('81', '34', '医用纱布', '医用纱布');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('84', '34', '腹带、压力袜', '腹带、压力袜');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('85', '34', '石膏绷带', '石膏绷带');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('86', '34', '骨科高分子矫形合成绷带', '骨科高分子矫形合成绷带');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('87', '34', '预制石膏夹板', '预制石膏夹板');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('88', '34', '高分子玻璃纤维夹板', '高分子玻璃纤维夹板');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('89', '35', '医用海绵', '医用海绵');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('90', '35', '酒精棉片、棉棒', '酒精棉片、棉棒');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('91', '35', ' 碘伏消毒棉片、棉棒', ' 碘伏消毒棉片、棉棒');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('92', '35', '医用棉制品', '医用棉制品');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('93', '37', '一次性麻醉用针', '一次性麻醉用针');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('94', '37', '造影及引流器械', '造影及引流器械');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('95', '37', '微创手术及麻醉器械', '微创手术及麻醉器械');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('96', '37', '骨髓及内脏活检穿刺针', '骨髓及内脏活检穿刺针');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('97', '38', '动静脉留置针', '动静脉留置针');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('98', '38', '头皮式留置针', '头皮式留置针');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('99', '39', 'PGA可吸收医用缝合线', 'PGA可吸收医用缝合线');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('100', '39', 'PGLA可吸收医用缝合线', 'PGLA可吸收医用缝合线');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('101', '39', '医用真丝缝合线', '医用真丝缝合线');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('102', '39', '医用聚丙烯缝合线', '医用聚丙烯缝合线');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('103', '39', '医用聚酰胺缝合线', '医用聚酰胺缝合线');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('104', '39', '医用聚酯缝合线', '医用聚酯缝合线');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('105', '39', 'PVDF医用缝合线', 'PVDF医用缝合线');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('106', '39', 'PET医用缝合线', 'PET医用缝合线');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('107', '39', '医用不锈钢丝', '医用不锈钢丝');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('108', '39', ' 医用缝合针', ' 医用缝合针');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('109', '39', '皮肤缝合器', '皮肤缝合器');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('110', '39', '免缝胶带', '免缝胶带');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('111', '40', '激光采血仪', '激光采血仪');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('112', '40', '一次性输血器具', '一次性输血器具');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('113', '40', '血液透析导管', '血液透析导管');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('114', '40', '采血针', '采血针');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('115', '41', '失禁护理产品', '失禁护理产品');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('116', '41', '手术巾', '手术巾');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('117', '41', '手术床罩、床单、垫单类', '手术床罩、床单、垫单类');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('118', '41', '手术保护用品', '手术保护用品');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('119', '41', '医用口罩', '医用口罩');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('120', '41', '医用手套', '医用手套');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('121', '41', '医用帽、鞋套', '医用帽、鞋套');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('122', '41', '隔离服、防护服、手术衣', '隔离服、防护服、手术衣');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('123', '41', '无菌保护套', '无菌保护套');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('124', '42', '穿刺鞘', '穿刺鞘');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('125', '42', '心脏介入、放射造影系列配件', '心脏介入、放射造影系列配件');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('126', '43', '引流瓶、引流袋', '引流瓶、引流袋');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('127', '42', '常用医疗用品', '常用医疗用品');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('43', '29', '引流管', '引流管');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('41', '29', '导尿管', '导尿管');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('42', '33', '灌肠包、急救包', '灌肠包、急救包');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('44', '33', '胃管包、咬口材料包', '胃管包、咬口材料包');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('45', '33', '吸痰包', '吸痰包');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('46', '33', '气管导管包', '气管导管包');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('47', '33', '口腔护理包', '口腔护理包');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('48', '33', '换药包、备皮包', '换药包、备皮包');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('49', '33', '产包', '产包');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('50', '15', '牛六', '牛六');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('51', '33', '穿刺包', '穿刺包');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('52', '33', '血液透析导管包', '血液透析导管包');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('53', '33', '中心静脉导管包', '中心静脉导管包');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('54', '33', '手术包', '手术包');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('55', '33', '导尿包', '导尿包');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('65', '31', '创可贴', '创可贴');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('66', '31', '生物敷料', '生物敷料');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('67', '31', '透明敷料', '透明敷料');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('68', '31', '自粘伤口敷料', '自粘伤口敷料');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('69', '31', '婴儿护脐敷料', '婴儿护脐敷料');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('70', '31', '优格伤口敷料', '优格伤口敷料');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('71', '31', '德国LR伤口敷料', '德国LR伤口敷料');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('72', '31', '德国HARTMANN伤口敷料', '德国HARTMANN伤口敷料');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('73', '31', '其它医用高分子敷料', '其它医用高分子敷料');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('128', '14', '打印纸', '打印纸');
INSERT INTO "SCM"."T_CAT_DRUGGROUPITM" VALUES ('129', '16', '笔记本', '笔记本');

-- ----------------------------
-- Table structure for T_CAT_GROUP
-- ----------------------------
DROP TABLE "SCM"."T_CAT_GROUP";
CREATE TABLE "SCM"."T_CAT_GROUP" (
"SG_ID" NUMBER NOT NULL ,
"SG_CODE" VARCHAR2(200 BYTE) NULL ,
"SG_DESC" VARCHAR2(200 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of T_CAT_GROUP
-- ----------------------------
INSERT INTO "SCM"."T_CAT_GROUP" VALUES ('21', '医用耗材', '医用耗材');
INSERT INTO "SCM"."T_CAT_GROUP" VALUES ('3', '办公耗材', '办公耗材');
INSERT INTO "SCM"."T_CAT_GROUP" VALUES ('22', '医用器械', '医用器械');
INSERT INTO "SCM"."T_CAT_GROUP" VALUES ('23', '其他', '其他');

-- ----------------------------
-- Table structure for T_CAT_GROUPPROPERTY
-- ----------------------------
DROP TABLE "SCM"."T_CAT_GROUPPROPERTY";
CREATE TABLE "SCM"."T_CAT_GROUPPROPERTY" (
"GRP_PRO_ID" NUMBER NOT NULL ,
"GRP_PARREFID" NUMBER NULL ,
"GRP_PRO_DESC" VARCHAR2(200 BYTE) NULL ,
"GRP_PRO_PARREFID" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of T_CAT_GROUPPROPERTY
-- ----------------------------

-- ----------------------------
-- Table structure for T_CAT_PROPERTY
-- ----------------------------
DROP TABLE "SCM"."T_CAT_PROPERTY";
CREATE TABLE "SCM"."T_CAT_PROPERTY" (
"PRO_ID" VARCHAR2(200 BYTE) NULL ,
"PRO_CODE" VARCHAR2(200 BYTE) NULL ,
"PRO_NAME" VARCHAR2(200 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of T_CAT_PROPERTY
-- ----------------------------
INSERT INTO "SCM"."T_CAT_PROPERTY" VALUES ('3', '1', '厂商');
INSERT INTO "SCM"."T_CAT_PROPERTY" VALUES ('4', '2', '价格');
INSERT INTO "SCM"."T_CAT_PROPERTY" VALUES ('6', '1000', '规格');
INSERT INTO "SCM"."T_CAT_PROPERTY" VALUES ('7', '4', '颜色');
INSERT INTO "SCM"."T_CAT_PROPERTY" VALUES ('10', '6', '选购热点');
INSERT INTO "SCM"."T_CAT_PROPERTY" VALUES ('9', '5', '类别');
INSERT INTO "SCM"."T_CAT_PROPERTY" VALUES ('8', '999', '大家说');

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
-- Table structure for T_HOP_ELESUB
-- ----------------------------
DROP TABLE "SCM"."T_HOP_ELESUB";
CREATE TABLE "SCM"."T_HOP_ELESUB" (
"ELE_ORD_ID" NUMBER NULL ,
"ELE_PROPERTY_ID" NUMBER NULL ,
"ELE_SUB_ID" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of T_HOP_ELESUB
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
"ELE_DESCRIPTION" CHAR(1 BYTE) NULL ,
"ELE_SPEED" CHAR(1 BYTE) NULL ,
"ELE_VENINCID" NUMBER NULL ,
"ELE_SERVICE" CHAR(1 BYTE) NULL 
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
COMMENT ON COLUMN "SCM"."T_HOP_EVALUTE"."ELE_DESCRIPTION" IS '付款速度';
COMMENT ON COLUMN "SCM"."T_HOP_EVALUTE"."ELE_SPEED" IS '收货速度';

-- ----------------------------
-- Records of T_HOP_EVALUTE
-- ----------------------------

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

-- ----------------------------
-- Table structure for T_HOP_INC_LOC
-- ----------------------------
DROP TABLE "SCM"."T_HOP_INC_LOC";
CREATE TABLE "SCM"."T_HOP_INC_LOC" (
"INCLOC_PARREFID" NUMBER NULL ,
"INCLOC_LOCID" NUMBER NULL ,
"INCLOC_ID" NUMBER NOT NULL ,
"INCLOC_QTY" FLOAT(126) NULL ,
"INCLOC_MAXQTY" FLOAT(126) NULL ,
"INCLOC_MINQTY" FLOAT(126) NULL ,
"INCLOC_STANDQTY" FLOAT(126) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of T_HOP_INC_LOC
-- ----------------------------

-- ----------------------------
-- Table structure for T_HOP_INC_NEWS
-- ----------------------------
DROP TABLE "SCM"."T_HOP_INC_NEWS";
CREATE TABLE "SCM"."T_HOP_INC_NEWS" (
"INCNEWS_ID" NUMBER NULL ,
"INCNEWS_TITLE" VARCHAR2(200 BYTE) NULL ,
"INCNEWS_USERID" NUMBER NULL ,
"INCNEWS_PATH" VARCHAR2(200 BYTE) NULL ,
"INCNEWS_DATE" TIMESTAMP(0)  NULL ,
"INCNEWS_TYPE" CHAR(1 BYTE) NULL ,
"INCNEWS_READCOUNT" NUMBER NULL ,
"INCNEWS_CONTENT" CLOB NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of T_HOP_INC_NEWS
-- ----------------------------

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

-- ----------------------------
-- Table structure for T_ORD_ORD
-- ----------------------------
DROP TABLE "SCM"."T_ORD_ORD";
CREATE TABLE "SCM"."T_ORD_ORD" (
"ORD_ID" VARCHAR2(40 BYTE) NULL ,
"ORD_DATE" TIMESTAMP(6)  NULL ,
"ORD_HOP_ID" NUMBER NULL ,
"ORD_LOC_ID" NUMBER NULL ,
"ORD_NO" VARCHAR2(100 BYTE) NULL ,
"ORD_CMPFLAG" CHAR(1 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of T_ORD_ORD
-- ----------------------------

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
"ORDER_STATE" NUMBER NULL ,
"ORDER_HISNO" VARCHAR2(100 BYTE) NULL ,
"ORDER_EMFLAG" CHAR(1 BYTE) NULL ,
"ORDER_IMP_ID" VARCHAR2(100 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of T_ORD_ORDERDETAIL
-- ----------------------------

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
"ORDSUB_RP" FLOAT(126) NULL ,
"ORDSUB_PRINTFLAG" CHAR(1 BYTE) NULL ,
"ORDSUB_RPAMT" FLOAT(126) NULL ,
"ORDSUB_HIS_QTY" FLOAT(126) NULL ,
"ORDSUB_HIS_RP" FLOAT(126) NULL ,
"ORDSUB_IMP_ID" VARCHAR2(100 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of T_ORD_ORDERDETAILSUB
-- ----------------------------

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
-- Table structure for T_ORD_PLAN
-- ----------------------------
DROP TABLE "SCM"."T_ORD_PLAN";
CREATE TABLE "SCM"."T_ORD_PLAN" (
"PLAN_ID" NUMBER NOT NULL ,
"PLAN_DATE" DATE NULL ,
"PLAN_FLAG" CHAR(1 BYTE) NULL ,
"PLAN_NO" VARCHAR2(200 BYTE) NULL ,
"PLAN_CTLOC" NUMBER NULL ,
"PLAN_USERID" NUMBER NULL ,
"PLAN_INCID" NUMBER NULL ,
"PLAN_VENINCID" NUMBER NULL ,
"PLAN_VENDORID" NUMBER NULL ,
"PLAN_QTY" FLOAT(126) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of T_ORD_PLAN
-- ----------------------------

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
"SHOP_NAME" VARCHAR2(100 BYTE) NULL ,
"SHOP_VENDORID" NUMBER NULL 
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
INSERT INTO "SCM"."T_ORD_STATE" VALUES ('51', '确认订单/下载订单', '确认订单/下载订单', '2');
INSERT INTO "SCM"."T_ORD_STATE" VALUES ('54', '发货/上传发票', '发货/上传发票', '3');
INSERT INTO "SCM"."T_ORD_STATE" VALUES ('55', '收货', '收货', '4');
INSERT INTO "SCM"."T_ORD_STATE" VALUES ('1050', '新建', '新建', '1');
INSERT INTO "SCM"."T_ORD_STATE" VALUES ('2150', '交易关闭', '交易关闭', '9');
INSERT INTO "SCM"."T_ORD_STATE" VALUES ('2100', '退货申请', '退货申请', '6');
INSERT INTO "SCM"."T_ORD_STATE" VALUES ('2101', '退货审核通过', '退货审核通过', '7');
INSERT INTO "SCM"."T_ORD_STATE" VALUES ('2102', '退货审核不通过', '退货审核不通过', '8');
INSERT INTO "SCM"."T_ORD_STATE" VALUES ('2050', '已评价', '已评价', '5');

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
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('201', 'GZHCK', 'GZHCK-高值耗财库', '7', null, null, null);

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
INSERT INTO "SCM"."T_SYS_DICT" VALUES ('49', '未审批', 'useState', '3');

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
INSERT INTO "SCM"."T_SYS_FUNC" VALUES ('61', '43', 'icon-plus-sign-alt', '商品信息维护', '24', '1', null, 'hop/hopIncCtrl!listMain.htm', '#009600', '1');
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
INSERT INTO "SCM"."T_SYS_FUNC" VALUES ('70', '44', 'icon-picture', '药品图片维护', '24', '1', null, 'hop/hopIncPicCtrl!listMain.htm', '#CE4B27', '2');
INSERT INTO "SCM"."T_SYS_FUNC" VALUES ('59', '42', 'icon-building', '厂商维护', '24', '1', null, 'manf/hopManfCtrl!listMain.htm', '#0093A8', '1');
INSERT INTO "SCM"."T_SYS_FUNC" VALUES ('84', '106', 'icon-exchange', '商品对照', '73', '1', null, 'ven/vendorCtrl!contranstInc.htm', '#CE4B27', '1');
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
INSERT INTO "SCM"."T_SYS_FUNC" VALUES ('76', '48', 'icon-book', '大类维护', '73', '1', null, 'cat/catGroupCtrl!group.htm', '#0093A8', '1');
INSERT INTO "SCM"."T_SYS_FUNC" VALUES ('68', '28', 'icon-medkit', '收货信息', '24', '1', null, 'hop/hopCtlocDestinationCtrl!list.htm', '#B51C44', '1');
INSERT INTO "SCM"."T_SYS_FUNC" VALUES ('83', '105', 'icon-envelope', '发送邮件', '8', '1', null, 'sys/sendMailCtrl!listMain.htm', '#5B3AB6', '1');
INSERT INTO "SCM"."T_SYS_FUNC" VALUES ('183', '123', 'icon-book', '商品属性', '73', '1', null, 'cat/catPropertyCtrl!listMain.htm', '#0093A8', '1');
INSERT INTO "SCM"."T_SYS_FUNC" VALUES ('163', '49', 'icon-columns', '类祖,小类维护', '73', '1', null, 'cat/catGroupCtrl!listMain.htm', '#009600', '1');

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
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('108', '47');
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('107', '47');
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
INSERT INTO "SCM"."T_SYS_FUNC_ROLE" VALUES ('183', '25');
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
INSERT INTO "SCM"."T_SYS_HOSPITAL" VALUES ('7', 'bjxh', '中国石油中心医院', '3', '中国石油中心医院');

-- ----------------------------
-- Table structure for T_SYS_IMPMODEL
-- ----------------------------
DROP TABLE "SCM"."T_SYS_IMPMODEL";
CREATE TABLE "SCM"."T_SYS_IMPMODEL" (
"IMPMODEL_ID" NUMBER NOT NULL ,
"IMPMODEL_TYPE" VARCHAR2(50 BYTE) NULL ,
"IMPMODEL_NAME" VARCHAR2(250 BYTE) NULL ,
"IMPMODEL_SEQ" NUMBER NULL ,
"IMPMODEL_CODE" VARCHAR2(250 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of T_SYS_IMPMODEL
-- ----------------------------
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('249', 'HOPVENDOR', '代码', '0', 'HOPEVENDOR_CODE');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('250', 'HOPVENDOR', '名称', '1', 'HOPEVENDOR_NAME');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('251', 'HOPVENDOR', '类别', '2', 'HOPEVENDOR_CAT');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('252', 'HOPVENDOR', '别名', '3', 'HOPEVENDOR_ALIAS');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('253', 'HOPVENDOR', '地址', '4', 'HOPEVENDOR_ADDRESS');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('254', 'HOPVENDOR', '电话', '5', 'HOPEVENDOR_TELPHONE');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('255', 'HOPVENDOR', '登录名', '6', 'HOPEVENDOR_USERNAME');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('256', 'HOPVENDOR', '邮箱', '7', 'HOPEVENDOR_EMALI');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('257', 'HOPVENDOR', '同步标志', '8', 'HOPEVENDOR_SYNFLAG');
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('364', 'ORDER', '自然序号', '0', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('365', 'ORDER', '定价单位', '1', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('366', 'ORDER', 'HIS药品代码', '2', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('367', 'ORDER', '药品名称', '3', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('368', 'ORDER', '规格', '4', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('369', 'ORDER', '剂型', '5', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('370', 'ORDER', '数量', '6', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('371', 'ORDER', '进价', '7', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('372', 'ORDER', '效期', '8', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('373', 'ORDER', '类别', '9', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('374', 'ORDER', '供应商代码', '10', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('375', 'ORDER', '供应商名称', '11', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('376', 'ORDER', '生产厂家编码', '12', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('377', 'ORDER', '生产厂家名称', '13', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('378', 'ORDER', '订单号', '14', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('379', 'ORDER', '接收院区', '15', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('380', 'ORDER', '收货地址', '16', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('381', 'ORDER', '入库科室', '17', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('382', 'ORDER', '采购日期', '18', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('383', 'ORDER', '要求送货时间', '19', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('384', 'ORDER', '是否加急', '20', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('301', 'VENINC', '药品代码', '0', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('302', 'VENINC', '药品名称', '1', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('303', 'VENINC', '单位描述', '2', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('304', 'VENINC', '生产厂家', '3', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('305', 'VENINC', '进价', '4', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('306', 'VENINC', '规格', '5', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('10', 'VENINVBYORDER', '数量', '3', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('9', 'VENINVBYORDER', '发票', '2', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('8', 'VENINVBYORDER', '供应商药品代码', '1', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('13', 'VENINVBYORDER', '进价', '6', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('12', 'VENINVBYORDER', '效期', '5', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('11', 'VENINVBYORDER', '批号', '4', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('22', 'IMPBYORDERITEM', '订单明细ID', '0', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('23', 'IMPBYORDERITEM', '供应商药品代码', '1', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('1', 'VENINV', '供应商药品代码', '0', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('2', 'VENINV', '发票', '1', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('3', 'VENINV', '数量', '2', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('4', 'VENINV', '批号', '3', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('5', 'VENINV', '效期', '4', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('6', 'VENINV', '进价', '5', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('7', 'VENINVBYORDER', '订单号', '0', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('24', 'IMPBYORDERITEM', '发票号', '2', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('25', 'IMPBYORDERITEM', '数量', '3', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('26', 'IMPBYORDERITEM', '进价', '4', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('27', 'IMPBYORDERITEM', '进价金额', '5', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('28', 'IMPBYORDERITEM', '批号', '6', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('29', 'IMPBYORDERITEM', '效期', '7', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('230', 'INC', '代码', '0', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('231', 'INC', '名称', '1', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('232', 'INC', '规格', '2', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('233', 'INC', '入库单位', '3', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('234', 'INC', '进价', '4', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('235', 'INC', '售价', '5', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('236', 'INC', '产地', '6', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('237', 'INC', '库存分类', '7', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('238', 'INC', '最小单位系数', '8', null);
INSERT INTO "SCM"."T_SYS_IMPMODEL" VALUES ('239', 'INC', '别名', '9', null);

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
INSERT INTO "SCM"."T_SYS_NORMAL_ACCOUNT" VALUES ('8', '1402538433404', 'vendor', '1', null, null, '1', null, TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), null, '15');
INSERT INTO "SCM"."T_SYS_NORMAL_ACCOUNT" VALUES ('1', 'system', 'system', '1', null, null, '1', null, TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), null, '11');
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
INSERT INTO "SCM"."T_SYS_NORMAL_USER" VALUES ('11', ''''';drop scm', '1', null, null, TO_DATE('2013-04-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '13919007855', 'zhouzhoumanman@gmail.com', '1', null, '201', TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1', null, null, null);
INSERT INTO "SCM"."T_SYS_NORMAL_USER" VALUES ('15', '供应商甲', null, null, null, TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '13919007855', null, '2', '15564', null, TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1', null, null, null);
INSERT INTO "SCM"."T_SYS_NORMAL_USER" VALUES ('71', '周医院123312312', '2', '汉', null, TO_DATE('1991-03-06 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '13919007855', '1234567@qq.com', '3', null, '201', TO_DATE('2015-03-16 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1', '510333176509093333', null, null);

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
INSERT INTO "SCM"."T_SYS_NORMALACCOUNT_ROLE" VALUES ('8', '47');
INSERT INTO "SCM"."T_SYS_NORMALACCOUNT_ROLE" VALUES ('1', '25');

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
INSERT INTO "SCM"."T_SYS_TASKCONFIG" VALUES ('40287d814c59e68c014c59fa39cd0000', null, null, null, 'SCM', '同步his科室信息', TO_TIMESTAMP(' 2015-03-26 14:44:31:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'com.dhcc.pms.blh.task.monitor.GetHisLocXHTask', null, '2', '1', '4', 'SCM', 'SCM');
INSERT INTO "SCM"."T_SYS_TASKCONFIG" VALUES ('40287d814c5a032e014c5a2333e70022', null, null, null, 'scm', '同步供应商信息', TO_TIMESTAMP(' 2015-03-19 15:29:53:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'com.dhcc.pms.blh.task.monitor.GetHisVendorXHTask', null, '2', '1', '4', 'scm', 'scm');

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
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2400a1', '7042', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2400a2', '7044', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2400a3', '7045', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2400a4', '7047', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2400a5', '7049', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2400a6', '7051', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2400a7', '7053', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2400a8', '7055', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2400a9', '7057', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2400aa', '7059', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2400ab', '7062', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2400ac', '7064', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2400ad', '7065', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2500ae', '7067', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2500af', '7070', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2500b0', '7072', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2500b1', '7073', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2500b2', '7075', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2500b3', '7077', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2500b4', '7079', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2500b5', '7081', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2500b6', '7083', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2500b7', '7085', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2500b8', '7087', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2500b9', '7090', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2500ba', '7092', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2500bb', '7095', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2600bc', '7096', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2600bd', '7098', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2600be', '7101', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2600bf', '7156', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2600c0', '7157', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2600c1', '7160', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2600c2', '7163', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2600c3', '7164', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2600c4', '7168', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2600c5', '7171', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2600c6', '7172', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2600c7', '7175', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2600c8', '7180', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2600c9', '7183', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2700ca', '7187', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2700cb', '7191', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2700cc', '7193', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2700cd', '7195', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2700ce', '7197', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2700cf', '7200', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2700d0', '7202', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2700d1', '7205', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2700d2', '7208', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2700d3', '7211', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2700d4', '7213', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2700d5', '7215', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2800d6', '7217', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2800d7', '7221', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2800d8', '7222', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2800d9', '7226', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2800da', '7230', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2800db', '7231', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2800dc', '7236', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2800dd', '7239', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2800de', '7242', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2800df', '7244', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2800e0', '7247', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2800e1', '7249', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2800e2', '7253', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2800e3', '7256', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2900e4', '7257', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2900e5', '7260', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2900e6', '7263', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2900e7', '7268', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2900e8', '7273', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2900e9', '7355', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2900ea', '7359', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2900eb', '7361', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2900ec', '7367', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2900ed', '7368', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2900ee', '7372', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2900ef', '7378', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2900f0', '7383', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2a00f1', '7412', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2a00f2', '7415', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2a00f3', '7417', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2a00f4', '7420', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2a00f5', '7425', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2a00f6', '7428', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2a00f7', '7431', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2a00f8', '7434', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2a00f9', '7437', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2a00fa', '7441', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2a00fb', '7444', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2a00fc', '7449', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2a00fd', '7450', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2a00fe', '7455', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2b00ff', '7456', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2b0100', '7459', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2b0101', '7462', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2b0102', '7465', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2b0103', '7468', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2b0104', '7471', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2b0105', '7475', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2b0106', '7479', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2b0107', '7480', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2b0108', '7483', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2b0109', '7489', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2b010a', '7491', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2b010b', '7494', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2b010c', '7497', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2c010d', '7500', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2c010e', '7503', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2c010f', '7507', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2c0110', '7534', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2c0111', '7537', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2c0112', '7539', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2c0113', '7541', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2c0114', '7545', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2c0115', '7542', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2c0116', '7548', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2c0117', '7546', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2c0118', '7552', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2c0119', '7555', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2c011a', '7557', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2d011b', '7560', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2d011c', '7563', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2d011d', '7564', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2d011e', '7571', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2d011f', '7573', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2d0120', '7577', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2d0121', '7583', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2d0122', '7584', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2d0123', '7586', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2d0124', '7590', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2d0125', '7549', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2d0126', '7553', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2e0127', '7556', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2e0128', '7567', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2e0129', '7572', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2e012a', '7578', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2e012b', '7581', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2e012c', '7587', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2e012d', '7595', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2e012e', '7594', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2e012f', '7592', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2e0130', '7600', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2e0131', '7599', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2e0132', '7601', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2f0133', '7604', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2f0134', '7607', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2f0135', '7641', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2f0136', '7642', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2f0137', '7649', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2f0138', '7650', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2f0139', '7657', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2f013a', '7658', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2f013b', '7667', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f30013c', '7669', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f30013d', '7674', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f30013e', '7676', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f30013f', '7681', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f300140', '7682', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f300141', '7687', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f300142', '7689', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f300143', '7695', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f300144', '7698', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f300145', '7703', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f300146', '7704', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f300147', '7709', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f300148', '7710', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f300149', '7715', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f30014a', '7717', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f31014b', '7719', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f31014c', '7722', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f31014d', '7721', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f31014e', '7724', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f31014f', '7727', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f310150', '7726', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f310151', '7728', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f310152', '7731', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f310153', '7729', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f310154', '7732', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f310155', '7734', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f320156', '7735', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f320157', '7736', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f320158', '7739', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f320159', '7741', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f32015a', '7743', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f32015b', '7746', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f32015c', '7747', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f32015d', '7748', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f32015e', '7751', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f32015f', '7752', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f320160', '7755', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f320161', '7753', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f320162', '7756', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f320163', '7760', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f320164', '7764', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f330165', '7765', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f330166', '7773', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f330167', '7776', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f330168', '7779', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f330169', '7781', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f33016a', '7786', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f33016b', '7788', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f33016c', '7792', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f33016d', '7795', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f33016e', '7797', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f33016f', '7799', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f330170', '7802', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f330171', '7804', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f330172', '7807', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f340173', '7809', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f340174', '7813', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f340175', '7816', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f340176', '7818', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f340177', '7817', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f340178', '7823', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f340179', '7822', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f34017a', '7826', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f34017b', '7825', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f34017c', '7830', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f34017d', '7833', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f34017e', '7835', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f34017f', '7834', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f340180', '7841', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f350181', '7840', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f350182', '7843', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f350183', '7842', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f350184', '7851', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f350185', '7848', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f350186', '7852', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f350187', '7857', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f350188', '7854', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f350189', '7859', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f35018a', '7862', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f35018b', '7861', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f35018c', '7867', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f35018d', '7866', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f35018e', '7865', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f36018f', '7868', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f360190', '7872', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f360191', '7871', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f360192', '7870', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f360193', '7873', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f360194', '7876', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f360195', '7875', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f360196', '7874', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f360197', '7877', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f360198', '7880', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f360199', '7878', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f36019a', '7882', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f36019b', '7881', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f36019c', '7884', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f36019d', '7887', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f37019e', '7891', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f37019f', '7892', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3701a0', '7895', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3701a1', '7900', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3701a2', '7902', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3701a3', '7906', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3701a4', '7904', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3701a5', '7903', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3701a6', '7912', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3701a7', '7910', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3701a8', '7914', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3701a9', '7919', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3701aa', '7923', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3801ab', '7921', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3801ac', '7920', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3801ad', '7922', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3801ae', '7928', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3801af', '7927', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3801b0', '7925', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3801b1', '7931', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3801b2', '7930', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3801b3', '7929', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3801b4', '7936', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3801b5', '7935', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3801b6', '7934', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3801b7', '7933', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3801b8', '7932', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3901b9', '7939', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3901ba', '7938', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3901bb', '7943', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3901bc', '7942', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3901bd', '7941', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3901be', '7940', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3901bf', '7945', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3901c0', '7944', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3901c1', '7946', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3901c2', '7949', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3901c3', '7948', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3901c4', '7947', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3a01c5', '7951', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3a01c6', '7950', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3a01c7', '7955', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3a01c8', '7954', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3a01c9', '7953', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3a01ca', '7957', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3a01cb', '7952', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3a01cc', '7956', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3a01cd', '7959', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3a01ce', '7958', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3a01cf', '7960', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3a01d0', '7962', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3a01d1', '7961', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3a01d2', '7963', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3b01d3', '7967', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3b01d4', '7924', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3b01d5', '7937', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3b01d6', '7966', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3b01d7', '7965', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3b01d8', '7964', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3b01d9', '7969', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3b01da', '7970', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3b01db', '7971', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3b01dc', '7973', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3b01dd', '7972', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3b01de', '7975', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3b01df', '7974', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3c01e0', '7980', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3c01e1', '7979', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3c01e2', '7978', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3c01e3', '7977', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3c01e4', '7982', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3c01e5', '7984', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3c01e6', '7986', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3c01e7', '7985', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3c01e8', '7990', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3c01e9', '7988', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3c01ea', '7992', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3c01eb', '7991', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3c01ec', '7995', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3c01ed', '7994', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3c01ee', '7998', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3c01ef', '7997', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3d01f0', '7996', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3d01f1', '8001', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3d01f2', '7999', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3d01f3', '8002', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3d01f4', '8004', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3d01f5', '8003', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3d01f6', '8005', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3d01f7', '8008', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3d01f8', '8007', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3d01f9', '8011', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3e01fa', '8009', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3e01fb', '8012', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3e01fc', '8016', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3e01fd', '8015', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3e01fe', '8014', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3e01ff', '8013', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3e0200', '8017', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3e0201', '8021', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3e0202', '8020', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3e0203', '8023', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3e0204', '8025', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3e0205', '8026', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3e0206', '8029', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3e0207', '8027', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3e0208', '8032', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3f0209', '8031', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3f020a', '8030', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3f020b', '8037', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3f020c', '8035', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3f020d', '8034', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3f020e', '8039', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3f020f', '8038', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3f0210', '8042', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3f0211', '8041', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3f0212', '8043', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3f0213', '8046', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3f0214', '8045', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3f0215', '8044', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3f0216', '8050', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f3f0217', '8048', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f400218', '8047', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f400219', '8052', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f40021a', '8051', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f40021b', '8055', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f40021c', '8054', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f40021d', '8057', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f40021e', '8056', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f40021f', '8062', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f400220', '8061', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f400221', '8060', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f400222', '8059', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f400223', '8058', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f400224', '8063', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f400225', '8065', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f400226', '8067', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f410227', '8072', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f410228', '8071', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f410229', '7926', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f41022a', '7968', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f41022b', '7976', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f41022c', '7981', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f41022d', '7983', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f41022e', '7987', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f41022f', '7989', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f410230', '7993', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f410231', '8000', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f410232', '8006', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f410233', '8010', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f410234', '8018', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f420235', '8019', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f420236', '8022', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f420237', '8024', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f420238', '8028', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f420239', '8036', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f42023a', '8033', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f42023b', '8040', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f42023c', '8049', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f42023d', '8053', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f42023e', '8064', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f42023f', '8066', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f420240', '8070', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f420241', '8069', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f420242', '8068', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f420243', '8075', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f420244', '8074', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f430245', '8073', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f430246', '8078', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f430247', '8077', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f430248', '8076', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f430249', '8079', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f43024a', '8081', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f43024b', '8080', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f43024c', '8082', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f43024d', '8084', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f43024e', '8083', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f43024f', '8086', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f430250', '8085', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f430251', '8087', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f440252', '8091', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f440253', '8090', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f440254', '8089', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f440255', '8088', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f440256', '8095', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f440257', '8094', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f440258', '8093', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f440259', '8092', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f44025a', '8098', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f44025b', '8097', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f44025c', '8096', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f44025d', '8101', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f44025e', '8100', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f44025f', '8099', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f440260', '8102', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f440261', '8103', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f440262', '8106', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f450263', '8105', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f450264', '8104', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f450265', '8107', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f450266', '8110', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f450267', '8109', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f450268', '8108', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f450269', '8111', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f45026a', '8116', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f45026b', '8115', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f45026c', '8114', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f45026d', '8113', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f45026e', '8112', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f45026f', '8118', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f450270', '8117', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f460271', '8119', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f460272', '8122', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f460273', '8123', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f460274', '8121', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f460275', '8120', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f460276', '8124', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f460277', '8129', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f460278', '8128', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f460279', '8127', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f46027a', '8126', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f46027b', '8125', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f46027c', '8130', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f46027d', '8134', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f46027e', '8133', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f46027f', '8132', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f460280', '6994', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f460281', '6996', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f470282', '6997', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f470283', '6999', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('4028b7c64b594088014b59435e8b0002', '0', '25');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('4028b7c64b594088014b59435e8b0003', '6121', '25');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('4028b7c64b594088014b59435e8c0004', '6141', '25');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('4028b7c64b594088014b59435e8c0005', '6142', '25');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f470284', '7001', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f470285', '7003', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f470286', '7005', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f470287', '7007', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f470288', '7009', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f470289', '7011', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f47028a', '7013', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f47028b', '7015', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f48028c', '7017', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f48028d', '7019', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f48028e', '7021', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f48028f', '7023', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f480290', '7025', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f480291', '7027', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f480292', '7029', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f480293', '7031', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f480294', '7033', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f480295', '7035', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f480296', '7037', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f480297', '7039', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f480298', '7041', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f480299', '7043', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f48029a', '7046', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f48029b', '7048', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f48029c', '7050', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f49029d', '7052', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f49029e', '7054', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f49029f', '7056', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4902a0', '7058', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4902a1', '7060', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4902a2', '7061', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4902a3', '7063', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4902a4', '7066', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4902a5', '7068', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4902a6', '7069', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4902a7', '7071', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4902a8', '7074', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4902a9', '7076', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4a02aa', '7078', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4a02ab', '7080', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4a02ac', '7082', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4a02ad', '7084', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4a02ae', '7086', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4a02af', '7088', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4a02b0', '7089', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4a02b1', '7091', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4a02b2', '7093', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4a02b3', '7094', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4a02b4', '7097', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4a02b5', '7099', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4a02b6', '7109', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4a02b7', '7110', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4a02b8', '7112', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4a02b9', '7114', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4b02ba', '7116', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4b02bb', '7118', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4b02bc', '7121', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4b02bd', '7122', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4b02be', '7125', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4b02bf', '7127', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4b02c0', '7129', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4b02c1', '7131', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4b02c2', '7132', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4b02c3', '7135', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4b02c4', '7137', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4c02c5', '7139', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4c02c6', '7140', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4c02c7', '7142', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4c02c8', '7144', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4c02c9', '7146', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4c02ca', '7148', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4c02cb', '7150', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4c02cc', '7153', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4c02cd', '7155', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4c02ce', '7158', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4c02cf', '7161', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4c02d0', '7167', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4c02d1', '7169', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4c02d2', '7174', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4c02d3', '7176', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4d02d4', '7178', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4d02d5', '7181', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4d02d6', '7185', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4d02d7', '7188', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4d02d8', '7190', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4d02d9', '7198', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4d02da', '7199', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4d02db', '7203', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4d02dc', '7206', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4d02dd', '7210', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4d02de', '7219', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4d02df', '7224', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4d02e0', '6992', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4d02e1', '7227', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4e02e2', '7228', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4e02e3', '7233', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4e02e4', '7235', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4e02e5', '7237', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4e02e6', '7241', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4e02e7', '7243', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4f02e8', '7246', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4f02e9', '7248', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4f02ea', '7252', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f4f02eb', '7255', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5002ec', '7259', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5002ed', '7261', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5002ee', '7269', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5002ef', '7271', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5002f0', '7274', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5002f1', '7278', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5002f2', '7280', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5002f3', '7281', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5002f4', '7283', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5002f5', '7284', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5002f6', '7286', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5002f7', '7291', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5002f8', '7297', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5002f9', '7301', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5002fa', '7306', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5002fb', '7336', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5102fc', '7337', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5102fd', '7338', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5102fe', '7339', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5102ff', '7384', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f510300', '7387', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f510301', '7388', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f510302', '7391', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f510303', '7392', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f510304', '7395', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f510305', '7396', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f510306', '7400', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f510307', '7401', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f510308', '7404', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f520309', '7408', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f52030a', '7411', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f52030b', '7414', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f52030c', '7416', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f52030d', '7422', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f52030e', '7423', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f52030f', '7442', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f520310', '7443', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f520311', '7457', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f520312', '7461', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f520313', '7463', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f520314', '7467', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f530315', '7469', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f530316', '7473', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f530317', '7474', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f530318', '7477', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f530319', '7482', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f53031a', '7486', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f53031b', '7487', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f53031c', '7492', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f53031d', '7493', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f53031e', '7498', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f53031f', '7499', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f530320', '7504', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2efa0000', '0', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f170001', '7550', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f180002', '7554', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f180003', '7559', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f180004', '7562', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f180005', '7565', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f180006', '7569', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f180007', '7575', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f180008', '7580', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f180009', '7588', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f18000a', '7593', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f18000b', '7613', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f18000c', '7619', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f18000d', '7620', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f18000e', '7625', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f18000f', '7626', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f190010', '7631', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f190011', '7632', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f190012', '7637', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f190013', '7638', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f190014', '7645', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f190015', '7646', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f190016', '7653', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f190017', '7654', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f190018', '7662', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f190019', '7664', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f19001a', '7668', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f19001b', '7675', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f19001c', '7688', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1a001d', '7692', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1a001e', '7696', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1a001f', '7697', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1a0020', '7723', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1a0021', '7725', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1a0022', '7766', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1a0023', '7774', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1a0024', '7780', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1a0025', '7782', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1a0026', '7787', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1a0027', '7796', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1a0028', '7798', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1a0029', '7805', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1a002a', '7808', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1b002b', '7814', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1b002c', '7832', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1b002d', '7837', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1b002e', '7836', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1b002f', '7839', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1b0030', '7838', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1b0031', '7844', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1b0032', '7845', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1b0033', '7846', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1b0034', '7850', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1b0035', '7849', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1b0036', '7847', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1b0037', '7853', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1b0038', '7856', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1c0039', '7855', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1c003a', '7858', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1c003b', '7860', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1c003c', '7863', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1c003d', '7864', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1c003e', '7869', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1c003f', '7879', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1c0040', '7883', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1c0041', '7886', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1c0042', '7885', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1c0043', '7889', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1c0044', '7888', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1c0045', '7890', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1c0046', '7894', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1d0047', '7893', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1d0048', '7896', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1d0049', '7899', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1d004a', '7898', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1d004b', '7897', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1d004c', '7901', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1d004d', '7907', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1d004e', '7905', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1d004f', '7908', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1d0050', '7911', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1d0051', '7909', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1e0052', '7913', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1e0053', '7918', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1e0054', '7917', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1e0055', '7916', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1e0056', '7915', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1e0057', '6942', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1e0058', '6943', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1e0059', '6944', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1e005a', '6945', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1e005b', '6946', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1e005c', '6947', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1e005d', '6948', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1e005e', '6949', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1e005f', '6950', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1f0060', '6951', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1f0061', '6952', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1f0062', '6953', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1f0063', '6954', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1f0064', '6955', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1f0065', '6956', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1f0066', '6957', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1f0067', '6958', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1f0068', '6959', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1f0069', '6960', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1f006a', '6961', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1f006b', '6962', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1f006c', '6963', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f1f006d', '6964', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f20006e', '6965', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f20006f', '6966', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f200070', '6967', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f200071', '6968', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f200072', '6969', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f200073', '6970', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f200074', '6971', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f200075', '6972', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f200076', '6973', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f200077', '6974', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f200078', '6975', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f200079', '6976', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f20007a', '6977', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f20007b', '6978', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f21007c', '6979', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f21007d', '6980', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f21007e', '6981', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f21007f', '6982', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f210080', '6983', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f210081', '6984', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f210082', '6985', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f210083', '6986', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f210084', '6987', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f210085', '6988', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f210086', '6989', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f210087', '6990', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f220088', '6991', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f220089', '6993', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f22008a', '6995', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f22008b', '6998', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f22008c', '7000', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f22008d', '7002', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f22008e', '7004', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f22008f', '7006', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f220090', '7008', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f220091', '7010', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f220092', '7012', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f220093', '7014', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f220094', '7016', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f230095', '7018', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f230096', '7020', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f230097', '7022', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f230098', '7024', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f230099', '7026', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f23009a', '7028', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f23009b', '7030', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f23009c', '7032', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f23009d', '7034', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f23009e', '7036', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f23009f', '7038', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f2400a0', '7040', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7e0646', '8662', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7e0647', '8663', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7e0648', '8669', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7e0649', '8136', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7e064a', '8143', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7e064b', '8150', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7e064c', '8155', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7e064d', '8161', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7e064e', '8165', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7f064f', '8167', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7f0650', '8168', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7f0651', '8172', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7f0652', '8175', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7f0653', '8178', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7f0654', '8180', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7f0655', '8184', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7f0656', '8188', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f8d0657', '8194', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f8d0658', '8195', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f8d0659', '8197', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f8e065a', '8202', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f8e065b', '8210', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f8e065c', '8217', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f8e065d', '8223', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f8e065e', '8230', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f8e065f', '8232', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f8e0660', '8243', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f8e0661', '8250', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f8e0662', '8256', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f8e0663', '8257', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f8e0664', '8259', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f8e0665', '8264', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f8e0666', '8284', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f8e0667', '8318', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f8e0668', '8320', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f8e0669', '8324', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f8e066a', '8327', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f8e066b', '8328', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f8e066c', '8338', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f8e066d', '8344', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f8e066e', '8353', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f8e066f', '8369', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f8f0670', '8374', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f8f0671', '8385', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f8f0672', '8390', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f8f0673', '8399', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f8f0674', '8416', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f8f0675', '8420', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f8f0676', '8425', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f8f0677', '8432', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f8f0678', '8438', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f8f0679', '8443', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f8f067a', '8453', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f8f067b', '8458', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f8f067c', '8481', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f8f067d', '8492', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f8f067e', '8498', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f8f067f', '8502', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f8f0680', '8508', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f8f0681', '8510', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f8f0682', '8513', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f8f0683', '8519', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f8f0684', '8524', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f8f0685', '8531', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f8f0686', '8541', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f8f0687', '8548', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f8f0688', '8552', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f900689', '8562', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f90068a', '8567', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f90068b', '8574', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f90068c', '8579', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f90068d', '8590', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f90068e', '8597', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f90068f', '8614', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f900690', '8627', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f900691', '8629', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f900692', '8631', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f900693', '8637', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f900694', '8647', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f900695', '8651', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f900696', '8654', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f900697', '8656', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f900698', '8655', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f900699', '8666', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f90069a', '8665', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f90069b', '8673', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f90069c', '8674', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f90069d', '8679', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f90069e', '8135', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f91069f', '8141', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9106a0', '8144', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9106a1', '8146', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9106a2', '8149', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9106a3', '8153', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9106a4', '8154', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9106a5', '8160', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9106a6', '8164', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9106a7', '8169', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9106a8', '8170', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9106a9', '8174', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9106aa', '8177', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9106ab', '8181', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9106ac', '8183', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9106ad', '8187', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9106ae', '8190', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9106af', '8193', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9106b0', '8192', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9106b1', '8200', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9106b2', '8199', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9106b3', '8207', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9106b4', '8205', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9106b5', '8214', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9106b6', '8212', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9206b7', '8221', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9206b8', '8219', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9206b9', '8231', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9206ba', '8229', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9206bb', '8237', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9206bc', '8236', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9206bd', '8249', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9206be', '8248', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9206bf', '8253', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9206c0', '8262', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9206c1', '8272', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9206c2', '8273', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9206c3', '8276', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9206c4', '8281', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9206c5', '8286', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9206c6', '8289', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9206c7', '8293', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9206c8', '8294', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9206c9', '8298', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9206ca', '8303', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9206cb', '8304', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9206cc', '8307', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9206cd', '8311', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9206ce', '8314', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9206cf', '8315', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9206d0', '8319', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9206d1', '8326', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9206d2', '8332', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9306d3', '8331', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9306d4', '8340', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9306d5', '8341', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9306d6', '8345', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9306d7', '8350', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9306d8', '8348', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9306d9', '8356', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9306da', '8354', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9306db', '8361', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9306dc', '8360', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9306dd', '8367', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9306de', '8373', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9306df', '8379', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9306e0', '8382', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9306e1', '8380', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9306e2', '8388', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9306e3', '8395', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9306e4', '8394', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9306e5', '8404', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9306e6', '8403', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9306e7', '8410', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5c03c3', '7382', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5c03c4', '7385', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5c03c5', '7386', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5c03c6', '7389', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5c03c7', '7390', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5c03c8', '7393', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5c03c9', '7394', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5c03ca', '7397', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5c03cb', '7398', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5c03cc', '7403', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5c03cd', '7406', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5d03ce', '7409', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5d03cf', '7421', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5d03d0', '7424', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5d03d1', '7429', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5d03d2', '7430', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5d03d3', '7435', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5d03d4', '7436', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5d03d5', '7440', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5d03d6', '7445', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5d03d7', '7448', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5d03d8', '7451', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5d03d9', '7454', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5d03da', '7458', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5d03db', '7460', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5d03dc', '7464', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5d03dd', '7466', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5d03de', '7470', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5d03df', '7472', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5e03e0', '7476', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5e03e1', '7478', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5e03e2', '7484', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5e03e3', '7508', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5e03e4', '7535', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5e03e5', '7544', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5e03e6', '7651', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5e03e7', '7656', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5e03e8', '7660', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5e03e9', '7665', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5e03ea', '7671', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5e03eb', '7672', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5e03ec', '7678', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5e03ed', '7680', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5e03ee', '7679', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5e03ef', '7684', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5e03f0', '7683', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5e03f1', '7686', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5e03f2', '7685', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5e03f3', '7691', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5e03f4', '7690', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5f03f5', '7265', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5f03f6', '7277', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5f03f7', '7285', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5f03f8', '7288', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5f03f9', '7289', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5f03fa', '7293', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5f03fb', '7296', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5f03fc', '7299', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5f03fd', '7302', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5f03fe', '7305', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5f03ff', '7308', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5f0400', '7311', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5f0401', '7314', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5f0402', '7316', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5f0403', '7318', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5f0404', '7320', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5f0405', '7323', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5f0406', '7327', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f600407', '7330', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f600408', '7331', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f600409', '7333', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f60040a', '7335', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f60040b', '7340', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f60040c', '7341', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f60040d', '7342', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f60040e', '7343', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f60040f', '7345', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f600410', '7350', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f600411', '7352', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f600412', '7354', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f600413', '7362', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f600414', '7365', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f600415', '7399', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f600416', '7402', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f600417', '7405', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f600418', '7407', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f600419', '7410', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f60041a', '7413', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f60041b', '7418', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f61041c', '7419', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f61041d', '7426', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f61041e', '7427', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f61041f', '7432', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f610420', '7433', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f610421', '7438', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f610422', '7439', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f610423', '7446', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f610424', '7447', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f610425', '7452', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f610426', '7453', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f610427', '7481', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f610428', '7485', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f610429', '7488', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f61042a', '7490', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f61042b', '7495', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f61042c', '7496', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f61042d', '7501', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f62042e', '7502', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f62042f', '7506', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f620430', '7509', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f620431', '7514', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f620432', '7515', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f620433', '7520', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f620434', '7521', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f620435', '7524', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f620436', '7529', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f620437', '7531', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f620438', '7532', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f620439', '7533', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f62043a', '7536', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f62043b', '7538', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f62043c', '7540', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f62043d', '7570', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f62043e', '7574', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f62043f', '7582', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f620440', '7585', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f620441', '7596', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f630442', '7598', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f630443', '7602', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f630444', '7606', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f630445', '7608', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f630446', '7610', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f630447', '7614', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f630448', '7617', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f630449', '7621', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f63044a', '7624', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f63044b', '7627', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f63044c', '7630', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f63044d', '7633', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f63044e', '7636', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f63044f', '7510', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f630450', '7513', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f630451', '7517', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f630452', '7519', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f630453', '7523', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f640454', '7525', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f640455', '7528', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f640456', '7543', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f640457', '7547', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f640458', '7611', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f640459', '7616', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f64045a', '7639', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f64045b', '7644', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f64045c', '7647', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f64045d', '7652', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f64045e', '7655', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f64045f', '7659', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f640460', '7661', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f640461', '7666', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f640462', '7663', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f640463', '7670', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6d0505', '8246', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6d0506', '8255', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6d0507', '8261', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6d0508', '8269', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6d0509', '8270', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6d050a', '8279', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6d050b', '8283', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6e050c', '8299', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6e050d', '8302', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6e050e', '8306', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6e050f', '8317', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6e0510', '8321', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6e0511', '8330', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6e0512', '8339', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6e0513', '8346', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6e0514', '8351', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6e0515', '8358', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6e0516', '8363', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6e0517', '8366', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6e0518', '8376', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6e0519', '8383', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6e051a', '8392', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6e051b', '8397', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6e051c', '8407', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6e051d', '8412', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6e051e', '8446', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6e051f', '8451', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6e0520', '8459', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6f0521', '8463', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6f0522', '8470', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6f0523', '8476', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6f0524', '8483', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6f0525', '8489', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6f0526', '8495', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6f0527', '8503', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6f0528', '8504', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6f0529', '8512', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6f052a', '8516', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6f052b', '8527', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6f052c', '8523', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6f052d', '8528', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6f052e', '8530', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6f052f', '8529', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6f0530', '8535', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6f0531', '8536', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6f0532', '8542', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f700533', '8540', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f700534', '8544', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f700535', '8543', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f700536', '8547', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f700537', '8549', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f700538', '8553', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f700539', '8556', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f70053a', '8555', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f70053b', '8559', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f70053c', '8557', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f70053d', '8561', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f70053e', '8564', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f70053f', '8569', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f700540', '8568', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f700541', '8573', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f700542', '8577', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f700543', '8576', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f700544', '8584', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f700545', '8583', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f700546', '8589', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f700547', '8587', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f710548', '8592', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f710549', '8593', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f71054a', '8595', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f71054b', '8600', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f71054c', '8598', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f71054d', '8601', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f71054e', '8604', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f71054f', '8603', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f710550', '8610', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f710551', '8608', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f710552', '8139', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f710553', '8148', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f710554', '8151', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f720555', '8163', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f720556', '8189', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f720557', '8196', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f720558', '8198', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f720559', '8208', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f72055a', '8211', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f72055b', '8222', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f72055c', '8226', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f72055d', '8242', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f72055e', '8265', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f72055f', '8275', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f720560', '8278', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f720561', '8282', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f720562', '8288', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f720563', '8296', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f720564', '8300', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f720565', '8309', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f720566', '8312', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f720567', '8323', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f720568', '8359', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f730569', '8368', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f73056a', '8375', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f73056b', '8384', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f73056c', '8391', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f73056d', '8398', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f73056e', '8406', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f73056f', '8414', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f730570', '8428', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f730571', '8441', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f730572', '8445', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f730573', '8452', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f730574', '8457', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f730575', '8469', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f730576', '8478', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f730577', '8485', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f730578', '8554', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f730579', '8618', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f74057a', '8617', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f74057b', '8615', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f74057c', '8625', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f74057d', '8623', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f74057e', '8626', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f74057f', '8633', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f740580', '8630', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f740581', '8636', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f740582', '8641', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f740583', '8642', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f740584', '8646', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f740585', '8648', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f740586', '8650', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f740587', '8657', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f740588', '8659', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f740589', '8664', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f74058a', '8670', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f74058b', '8672', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f74058c', '8671', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f74058d', '8680', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f75058e', '8678', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f75058f', '8677', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f750590', '8682', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f750591', '8686', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f750592', '8685', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f750593', '8684', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f750594', '8683', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f750595', '8687', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f750596', '8689', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f750597', '8693', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f750598', '8692', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f750599', '8691', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f75059a', '8690', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f75059b', '8695', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f75059c', '8698', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f76059d', '8697', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f76059e', '8696', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f76059f', '8701', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7605a0', '8700', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7605a1', '8699', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7605a2', '8203', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7605a3', '8206', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7605a4', '8213', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7605a5', '8220', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7605a6', '8233', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7605a7', '8241', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7605a8', '8247', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7605a9', '8254', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7605aa', '8263', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7605ab', '8266', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7605ac', '8271', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7605ad', '8277', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7605ae', '8285', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7605af', '8290', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7605b0', '8297', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7705b1', '8305', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7705b2', '8310', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7705b3', '8316', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7705b4', '8325', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7705b5', '8334', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7705b6', '8336', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7705b7', '8343', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7705b8', '8347', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7705b9', '8378', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7705ba', '8381', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7705bb', '8389', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7705bc', '8393', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7705bd', '8405', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7705be', '8408', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7705bf', '8442', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7705c0', '8447', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7705c1', '8465', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7705c2', '8473', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7805c3', '8480', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7805c4', '8490', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7805c5', '8537', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7805c6', '8571', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7805c7', '8575', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7805c8', '8581', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7805c9', '8586', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7805ca', '8591', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7805cb', '8596', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7805cc', '8602', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7805cd', '8611', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7805ce', '8616', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7805cf', '8624', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7805d0', '8632', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7805d1', '8638', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7805d2', '8643', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7805d3', '8645', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7805d4', '8644', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7805d5', '8653', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7805d6', '8652', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7905d7', '8661', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7905d8', '8660', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7905d9', '8668', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7905da', '8667', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7905db', '8676', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7905dc', '8675', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7905dd', '8681', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7905de', '8688', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7905df', '8694', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7905e0', '8702', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7905e1', '8706', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7905e2', '8705', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7905e3', '8704', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7905e4', '8703', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7905e5', '8708', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7905e6', '8707', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7905e7', '8712', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7905e8', '8711', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7905e9', '8710', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7a05ea', '8709', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7a05eb', '8714', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7a05ec', '8713', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7a05ed', '8718', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7a05ee', '8717', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7a05ef', '8716', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7a05f0', '8715', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7a05f1', '8720', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7a05f2', '8719', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7a05f3', '8721', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7a05f4', '8131', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7a05f5', '8145', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7a05f6', '8156', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7a05f7', '8159', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7a05f8', '8171', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7a05f9', '8173', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7a05fa', '8182', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7a05fb', '8185', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7a05fc', '8201', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7a05fd', '8215', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7a05fe', '8218', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7b05ff', '8228', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7b0600', '8238', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7b0601', '8244', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7b0602', '8252', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7b0603', '8260', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7b0604', '8268', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7b0605', '8274', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7b0606', '8280', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7b0607', '8287', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7b0608', '8292', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7b0609', '8295', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7b060a', '8301', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7b060b', '8308', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7b060c', '8313', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7b060d', '8322', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7b060e', '8329', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7c060f', '8335', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7c0610', '8352', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7c0611', '8357', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7c0612', '8365', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7c0613', '8370', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7c0614', '8413', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7c0615', '8423', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7c0616', '8427', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7c0617', '8464', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7c0618', '8474', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7c0619', '8479', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7c061a', '8487', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7c061b', '8493', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7c061c', '8517', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7c061d', '8525', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7c061e', '8533', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7c061f', '8532', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7c0620', '8534', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7c0621', '8538', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7c0622', '8539', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7c0623', '8546', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7c0624', '8545', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7d0625', '8551', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7d0626', '8550', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7d0627', '8560', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7d0628', '8558', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7d0629', '8566', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7d062a', '8565', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7d062b', '8563', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7d062c', '8572', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7d062d', '8570', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7d062e', '8578', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7d062f', '8580', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7d0630', '8582', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7d0631', '8585', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7d0632', '8588', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7d0633', '8594', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7d0634', '8599', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7d0635', '8606', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7d0636', '8605', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7d0637', '8607', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7d0638', '8609', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7d0639', '8613', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7e063a', '8612', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7e063b', '8619', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7e063c', '8620', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7e063d', '8622', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7e063e', '8621', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7e063f', '8628', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7e0640', '8634', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7e0641', '8635', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7e0642', '8640', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7e0643', '8639', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7e0644', '8649', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f7e0645', '8658', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f640464', '7673', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f640465', '7677', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f640466', '7694', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f640467', '7693', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f640468', '7700', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f650469', '7699', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f65046a', '7702', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f65046b', '7701', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f65046c', '7706', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f65046d', '7705', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f65046e', '7708', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f65046f', '7707', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f650470', '7712', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f650471', '7711', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f650472', '7714', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f650473', '7713', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f650474', '7716', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f650475', '7718', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f650476', '7720', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f650477', '7730', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f650478', '7733', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f650479', '7738', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f65047a', '7737', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f65047b', '7742', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f65047c', '7740', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f66047d', '7745', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f66047e', '7744', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f66047f', '7750', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f660480', '7749', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f660481', '7754', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f660482', '7759', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f660483', '7758', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f660484', '7757', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f660485', '7763', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f660486', '7762', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f660487', '7761', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f660488', '7769', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f660489', '7768', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f66048a', '7767', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f66048b', '7772', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f66048c', '7771', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f66048d', '7770', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f66048e', '7775', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f66048f', '7778', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f670490', '7777', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f670491', '7783', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f670492', '7785', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f670493', '7784', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f670494', '7789', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f670495', '7791', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f670496', '7790', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f670497', '7794', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f670498', '7793', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f670499', '7800', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f67049a', '7801', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f67049b', '7803', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f67049c', '7806', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f67049d', '7810', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f67049e', '7811', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f68049f', '7812', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6804a0', '7815', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6804a1', '7819', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6804a2', '7820', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6804a3', '7821', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6804a4', '7824', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6804a5', '7827', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6804a6', '7828', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6804a7', '7829', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6804a8', '7831', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6804a9', '8140', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6804aa', '8138', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6804ab', '8147', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6804ac', '8152', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6804ad', '8162', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6804ae', '8166', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6804af', '8176', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6804b0', '8179', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6804b1', '8209', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6804b2', '8216', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6904b3', '8224', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6904b4', '8225', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6904b5', '8234', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6904b6', '8239', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6904b7', '8235', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6904b8', '8245', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6904b9', '8251', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6904ba', '8258', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6904bb', '8267', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6904bc', '8291', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6904bd', '8333', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6904be', '8337', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6904bf', '8342', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6904c0', '8349', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6904c1', '8355', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6904c2', '8364', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6a04c3', '8362', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6a04c4', '8371', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6a04c5', '8372', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6a04c6', '8377', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6a04c7', '8386', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6a04c8', '8387', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6a04c9', '8396', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6a04ca', '8400', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6a04cb', '8402', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6a04cc', '8401', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6a04cd', '8411', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6a04ce', '8415', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6a04cf', '8419', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6a04d0', '8422', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6a04d1', '8421', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6a04d2', '8431', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6a04d3', '8429', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6a04d4', '8436', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6a04d5', '8434', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6a04d6', '8439', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6b04d7', '8444', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6b04d8', '8450', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6b04d9', '8455', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6b04da', '8454', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6b04db', '8461', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6b04dc', '8460', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6b04dd', '8462', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6b04de', '8467', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6b04df', '8466', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6b04e0', '8468', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6b04e1', '8472', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6b04e2', '8471', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6b04e3', '8475', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6b04e4', '8477', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6b04e5', '8482', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6b04e6', '8486', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6c04e7', '8484', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6c04e8', '8488', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6c04e9', '8491', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6c04ea', '8494', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6c04eb', '8497', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6c04ec', '8496', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6c04ed', '8499', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6c04ee', '8500', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6c04ef', '8501', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6c04f0', '8505', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6c04f1', '8507', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6c04f2', '8506', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6c04f3', '8511', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6c04f4', '8509', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6c04f5', '8515', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6c04f6', '8514', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6c04f7', '8518', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6c04f8', '8522', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6c04f9', '8521', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6c04fa', '8520', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6d04fb', '8526', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6d04fc', '8137', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6d04fd', '8142', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6d04fe', '8157', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6d04ff', '8158', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6d0500', '8186', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6d0501', '8191', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6d0502', '8204', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6d0503', '8227', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f6d0504', '8240', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9306e8', '8409', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9306e9', '8418', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9306ea', '8417', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9306eb', '8424', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9406ec', '8426', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9406ed', '8430', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9406ee', '8433', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9406ef', '8435', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9406f0', '8437', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9406f1', '8440', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9406f2', '8449', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9406f3', '8448', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9406f4', '8456', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9406f5', '8728', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9406f6', '8742', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9406f7', '8757', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9406f8', '8764', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9406f9', '8771', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9406fa', '8787', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9406fb', '8794', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9406fc', '8798', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9406fd', '8804', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9406fe', '8841', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9406ff', '8855', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f940700', '8868', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f940701', '8872', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f940702', '8888', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f940703', '8909', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f940704', '8926', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f940705', '8932', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f940706', '8940', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f940707', '8946', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f950708', '8949', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f950709', '8991', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f95070a', '8996', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f95070b', '9008', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f95070c', '9022', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f95070d', '9030', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f95070e', '9035', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f95070f', '9044', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f950710', '9049', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f950711', '9056', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f950712', '9063', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f950713', '9073', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f950714', '9081', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f950715', '9098', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f950716', '9104', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f950717', '9114', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f950718', '9116', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f950719', '9126', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f95071a', '9129', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f95071b', '9137', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f95071c', '9142', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f95071d', '9150', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f95071e', '9154', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f95071f', '9166', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f950720', '9168', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f950721', '9180', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f950722', '9189', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f950723', '9203', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f960724', '9211', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f960725', '9219', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f960726', '9222', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f960727', '9230', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f960728', '9239', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f960729', '9241', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f96072a', '9250', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f96072b', '9258', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f96072c', '9269', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f96072d', '9277', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f96072e', '9282', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f96072f', '9289', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f960730', '9294', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f960731', '9303', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f960732', '9307', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f960733', '9318', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f960734', '9325', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f960735', '9332', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f960736', '9336', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f960737', '9345', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f960738', '9379', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f960739', '9378', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f96073a', '9377', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f96073b', '9381', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f96073c', '9380', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f96073d', '9382', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f96073e', '9386', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f96073f', '9385', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f970740', '9384', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f980741', '9383', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f980742', '9388', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f980743', '9387', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f980744', '9391', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f980745', '9390', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f980746', '9389', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f980747', '9393', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f980748', '9392', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f980749', '9395', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f98074a', '8722', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f98074b', '8726', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f98074c', '8731', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f98074d', '8740', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f98074e', '8745', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f98074f', '8751', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f980750', '8748', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f980751', '8753', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f980752', '8766', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f980753', '8772', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f980754', '8779', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f980755', '8786', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f980756', '8790', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f980757', '8795', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f980758', '8802', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f980759', '8809', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f98075a', '8815', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f98075b', '8827', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f98075c', '8826', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f98075d', '8831', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f98075e', '8830', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f98075f', '8839', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f980760', '8838', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f980761', '8846', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f990762', '8845', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f990763', '8849', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f990764', '8853', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f990765', '8857', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f990766', '8862', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f990767', '8866', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f990768', '8874', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f990769', '8881', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f99076a', '8885', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f99076b', '8893', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f99076c', '8900', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f99076d', '8906', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f99076e', '8910', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f99076f', '8914', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f990770', '8918', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f990771', '8916', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f990772', '8924', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f990773', '8927', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f990774', '8937', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f990775', '8941', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f990776', '8942', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f990777', '8945', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f990778', '8952', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f990779', '8960', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f99077a', '8958', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f99077b', '8964', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f99077c', '8962', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f99077d', '8971', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f99077e', '8969', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f99077f', '8976', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f990780', '8980', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f990781', '8982', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9a0782', '8985', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9a0783', '8990', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9a0784', '8994', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9a0785', '8997', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9a0786', '8998', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9a0787', '9007', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9a0788', '9004', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9a0789', '9012', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9a078a', '9011', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9a078b', '9016', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9a078c', '9021', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9a078d', '9027', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9a078e', '9038', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9a078f', '9047', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9a0790', '9048', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9a0791', '9053', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9a0792', '9058', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9a0793', '9062', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9a0794', '9076', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9a0795', '9075', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9a0796', '9087', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9a0797', '9093', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9a0798', '9101', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9a0799', '9108', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9a079a', '9112', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9a079b', '8730', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9a079c', '8736', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9a079d', '8752', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9a079e', '8755', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9a079f', '8761', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9a07a0', '8769', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9a07a1', '8773', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9a07a2', '8781', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9a07a3', '8784', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9b07a4', '8793', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9b07a5', '8801', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9b07a6', '8806', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9b07a7', '8811', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9b07a8', '8818', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9b07a9', '8823', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9b07aa', '8828', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9b07ab', '8860', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9b07ac', '8867', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9b07ad', '8873', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9b07ae', '8887', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9b07af', '8891', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9b07b0', '8895', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9b07b1', '8905', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9b07b2', '8911', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9b07b3', '8917', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9b07b4', '8922', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9b07b5', '8929', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9b07b6', '8935', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9b07b7', '8944', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9b07b8', '8959', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9b07b9', '8963', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9b07ba', '8972', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9b07bb', '8977', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9b07bc', '8992', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9b07bd', '8995', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9b07be', '9005', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9b07bf', '9010', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9b07c0', '9018', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9b07c1', '9025', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9b07c2', '9036', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9b07c3', '9043', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9b07c4', '9050', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9b07c5', '9059', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9b07c6', '9066', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9c07c7', '9070', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9c07c8', '9078', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9c07c9', '9085', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9c07ca', '9090', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9c07cb', '9102', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9c07cc', '9113', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9c07cd', '9119', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9c07ce', '9118', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9c07cf', '9117', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9c07d0', '9123', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9c07d1', '9124', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9c07d2', '9127', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9c07d3', '9128', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9c07d4', '9131', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9c07d5', '9133', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9c07d6', '9134', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9c07d7', '9135', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9c07d8', '9138', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9c07d9', '9141', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9c07da', '9145', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9c07db', '9146', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9c07dc', '9151', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9c07dd', '9153', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9c07de', '9158', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9c07df', '9162', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9c07e0', '9164', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9c07e1', '9167', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9c07e2', '9170', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9c07e3', '9172', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9c07e4', '9176', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9c07e5', '9175', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9c07e6', '9179', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9c07e7', '9181', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9c07e8', '9184', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9c07e9', '9192', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9c07ea', '9191', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9d07eb', '9194', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9d07ec', '9200', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9d07ed', '9202', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9d07ee', '9207', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9d07ef', '8724', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9d07f0', '8723', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9d07f1', '8733', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9d07f2', '8729', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9d07f3', '8739', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9d07f4', '8743', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9d07f5', '8749', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9d07f6', '8747', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9d07f7', '8756', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9d07f8', '8759', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9d07f9', '8760', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9d07fa', '8762', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9d07fb', '8765', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9d07fc', '8770', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9d07fd', '8782', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9d07fe', '8814', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9d07ff', '8819', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9d0800', '8825', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9d0801', '8832', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9d0802', '8835', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9d0803', '8836', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9d0804', '8837', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9d0805', '8840', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9d0806', '8842', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9d0807', '8843', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9d0808', '8847', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9d0809', '8852', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9d080a', '8854', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9d080b', '8856', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9d080c', '8859', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9d080d', '8869', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9d080e', '8878', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9d080f', '8882', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9d0810', '8892', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9d0811', '8901', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9d0812', '8907', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9d0813', '8921', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9d0814', '8931', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9d0815', '8930', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9d0816', '8953', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9e0817', '8967', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9e0818', '8973', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9e0819', '8975', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9e081a', '8979', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9e081b', '8983', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9e081c', '8986', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9e081d', '8989', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9e081e', '9000', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9e081f', '9003', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9e0820', '9009', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9e0821', '9023', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9e0822', '9024', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9e0823', '9034', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9e0824', '9039', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9e0825', '9041', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9e0826', '9045', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9e0827', '9060', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9e0828', '9067', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f530321', '7505', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f530322', '7511', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f530323', '7512', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f530324', '7516', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f530325', '7518', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f530326', '7522', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f540327', '7526', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f540328', '7527', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f540329', '7530', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f54032a', '7551', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f54032b', '7558', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f54032c', '7561', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f54032d', '7566', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f54032e', '7568', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f54032f', '7576', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f540330', '7579', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f540331', '7589', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f540332', '7591', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f540333', '7597', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f540334', '7603', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f540335', '7605', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f540336', '7609', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f540337', '7612', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f540338', '7615', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f550339', '7618', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f55033a', '7622', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f55033b', '7623', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f55033c', '7628', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f55033d', '7629', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f55033e', '7634', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f55033f', '7635', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f550340', '7640', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f550341', '7643', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f550342', '7648', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f550343', '7245', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f550344', '7100', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f550345', '7102', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f550346', '7104', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f550347', '7106', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f550348', '7108', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f550349', '7111', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f55034a', '7113', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f56034b', '7115', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f56034c', '7117', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f56034d', '7119', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f56034e', '7120', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f56034f', '7123', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f560350', '7124', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f560351', '7126', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f560352', '7128', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f560353', '7130', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f560354', '7133', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f560355', '7134', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f560356', '7136', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f560357', '7138', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f560358', '7141', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f560359', '7143', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f56035a', '7145', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f56035b', '7147', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f56035c', '7149', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f56035d', '7151', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f56035e', '7152', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f57035f', '7154', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f570360', '7165', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f570361', '7166', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f570362', '7170', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f570363', '7173', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f570364', '7177', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f570365', '7179', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f570366', '7182', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f570367', '7184', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f570368', '7186', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f570369', '7189', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f57036a', '7192', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f57036b', '7194', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f57036c', '7196', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f57036d', '7201', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f57036e', '7204', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f57036f', '7207', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f570370', '7209', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f580371', '7212', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f580372', '7214', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f580373', '7216', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f580374', '7218', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f580375', '7220', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f580376', '7223', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f580377', '7225', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f580378', '7229', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f580379', '7232', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f58037a', '7234', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f58037b', '7238', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f58037c', '7240', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f58037d', '7266', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f58037e', '7270', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f58037f', '7276', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f590380', '7279', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f590381', '7282', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f590382', '7287', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f590383', '7290', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f590384', '7292', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f590385', '7294', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f590386', '7295', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f590387', '7298', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f590388', '7300', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f590389', '7303', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f59038a', '7304', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f59038b', '7309', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f59038c', '7310', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f59038d', '7313', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f59038e', '7315', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f59038f', '7319', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f590390', '7321', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f590391', '7325', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5a0392', '7328', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5a0393', '7329', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5a0394', '7332', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5a0395', '7334', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5a0396', '7347', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5a0397', '7348', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5a0398', '7351', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5a0399', '7356', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5a039a', '7358', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5a039b', '7103', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5a039c', '7105', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5a039d', '7107', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5a039e', '7159', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5a039f', '7162', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5a03a0', '7250', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5a03a1', '7251', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5a03a2', '7254', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5a03a3', '7258', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5a03a4', '7262', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5a03a5', '7264', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5a03a6', '7267', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5b03a7', '7272', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5b03a8', '7275', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5b03a9', '7307', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5b03aa', '7312', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5b03ab', '7317', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5b03ac', '7322', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5b03ad', '7324', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5b03ae', '7326', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5b03af', '7344', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5b03b0', '7346', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5b03b1', '7349', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5b03b2', '7353', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5b03b3', '7357', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5b03b4', '7360', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5b03b5', '7363', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5b03b6', '7364', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5b03b7', '7366', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5b03b8', '7369', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5c03b9', '7370', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5c03ba', '7371', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5c03bb', '7373', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5c03bc', '7375', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5c03bd', '7374', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5c03be', '7377', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5c03bf', '7376', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5c03c0', '7380', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5c03c1', '7379', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f5c03c2', '7381', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb30bee', '10352', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb30bef', '10358', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb30bf0', '10366', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb30bf1', '10371', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb30bf2', '10383', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb30bf3', '10385', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb30bf4', '10394', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb30bf5', '10400', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb30bf6', '10407', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb30bf7', '10410', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb30bf8', '10433', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb30bf9', '10463', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb30bfa', '10467', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb30bfb', '10472', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb30bfc', '10480', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb30bfd', '10485', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb30bfe', '10496', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb30bff', '10499', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb30c00', '10504', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb30c01', '10511', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb30c02', '10517', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb30c03', '10525', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb30c04', '10531', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb30c05', '10537', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb30c06', '10545', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c07', '10546', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c08', '10568', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c09', '10567', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c0a', '9948', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c0b', '9952', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c0c', '9959', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c0d', '9968', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c0e', '9972', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c0f', '9976', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c10', '9983', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c11', '9990', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c12', '9989', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c13', '9994', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c14', '10002', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c15', '10012', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c16', '10020', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c17', '10018', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c18', '10027', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c19', '10028', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c1a', '10049', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c1b', '10046', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c1c', '10053', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c1d', '10057', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c1e', '10060', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c1f', '10066', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c20', '10071', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c21', '10079', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c22', '10084', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c23', '10096', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c24', '10101', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c25', '10109', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c26', '10110', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c27', '10115', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c28', '10124', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c29', '10135', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c2a', '10137', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c2b', '10140', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c2c', '10148', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c2d', '10152', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c2e', '10162', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c2f', '10166', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c30', '10169', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c31', '10171', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c32', '10170', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c33', '10181', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c34', '10179', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c35', '10185', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c36', '10184', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c37', '10192', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c38', '10195', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c39', '10196', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c3a', '10198', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c3b', '10205', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c3c', '10203', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb40c3d', '10209', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb50c3e', '10212', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb50c3f', '10215', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb50c40', '10221', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb50c41', '10228', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb50c42', '10233', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb50c43', '10239', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb50c44', '10246', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb50c45', '10244', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb50c46', '10249', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb50c47', '10254', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb50c48', '10259', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb50c49', '10263', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb50c4a', '10270', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb50c4b', '10278', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb50c4c', '10297', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb50c4d', '10298', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb50c4e', '10300', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb50c4f', '10306', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb50c50', '10315', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb50c51', '10321', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb50c52', '10319', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb50c53', '10326', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb50c54', '10323', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb50c55', '10333', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb50c56', '10340', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb50c57', '10345', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb50c58', '9993', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb50c59', '10004', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb50c5a', '10013', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb50c5b', '10019', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb50c5c', '10069', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb50c5d', '10080', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb50c5e', '10116', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb50c5f', '10119', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb50c60', '10126', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb50c61', '10134', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb50c62', '10136', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb50c63', '10151', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb50c64', '10189', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb50c65', '10193', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb50c66', '10200', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb50c67', '10206', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb50c68', '10211', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb50c69', '10217', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb50c6a', '10219', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb50c6b', '10235', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60c6c', '10237', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60c6d', '10241', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60c6e', '10251', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60c6f', '10255', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60c70', '10262', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60c71', '10267', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60c72', '10277', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60c73', '10281', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60c74', '10290', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60c75', '10294', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60c76', '10328', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60c77', '10330', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60c78', '10337', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60c79', '10341', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60c7a', '10350', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60c7b', '10348', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60c7c', '10356', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60c7d', '10354', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60c7e', '10365', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60c7f', '10363', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60c80', '10367', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60c81', '10368', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60c82', '10373', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60c83', '10376', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60c84', '10377', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60c85', '10382', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60c86', '10381', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60c87', '10386', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60c88', '10389', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60c89', '10387', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60c8a', '10393', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60c8b', '10392', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa5096c', '9092', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa80a0e', '9772', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa80a0f', '9776', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa80a10', '9775', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa80a11', '9779', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa80a12', '9781', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa80a13', '9780', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa90a14', '9785', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa90a15', '9787', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa90a16', '9789', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa90a17', '9792', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa90a18', '9794', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa90a19', '9798', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa90a1a', '9796', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa90a1b', '9799', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa90a1c', '9802', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa90a1d', '9801', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa90a1e', '9803', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa90a1f', '9809', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa90a20', '9808', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa90a21', '9810', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa90a22', '9814', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa90a23', '9817', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa90a24', '9816', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa90a25', '9821', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa90a26', '9818', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa90a27', '9822', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa90a28', '9826', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa90a29', '9829', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa90a2a', '9832', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa90a2b', '9834', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa90a2c', '9833', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa90a2d', '9835', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa90a2e', '9840', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa90a2f', '9839', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa90a30', '9845', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa90a31', '9414', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa90a32', '9421', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa90a33', '9429', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa90a34', '9432', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa90a35', '9447', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa90a36', '9457', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa90a37', '9460', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa90a38', '9465', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa90a39', '9468', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa90a3a', '9479', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa90a3b', '9481', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa90a3c', '9498', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa90a3d', '9505', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a3e', '9512', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a3f', '9520', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a40', '9521', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a41', '9531', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a42', '9534', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a43', '9559', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a44', '9589', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a45', '9593', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a46', '9600', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a47', '9609', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a48', '9617', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a49', '9623', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a4a', '9631', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a4b', '9632', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a4c', '9642', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a4d', '9655', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a4e', '9709', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a4f', '9711', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a50', '9722', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a51', '9743', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a52', '9805', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a53', '9806', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a54', '9815', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a55', '9825', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a56', '9844', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a57', '9849', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a58', '9847', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a59', '9852', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a5a', '9851', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a5b', '9857', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a5c', '9864', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a5d', '9867', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a5e', '9874', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a5f', '9873', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a60', '9872', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a61', '9871', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a62', '9870', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a63', '9876', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a64', '9879', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a65', '9878', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a66', '9877', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a67', '9880', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a68', '9882', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a69', '9886', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a6a', '9885', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a6b', '9884', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a6c', '9889', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a6d', '9888', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a6e', '9891', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a6f', '9890', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a70', '9896', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a71', '9894', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a72', '9900', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a73', '9899', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faa0a74', '9897', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fab0a75', '9904', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fab0a76', '9902', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fab0a77', '9901', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fab0a78', '9905', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fab0a79', '9906', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fab0a7a', '9907', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fab0a7b', '9912', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fab0a7c', '9911', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fab0a7d', '9909', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fab0a7e', '9399', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fab0a7f', '9413', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fab0a80', '9431', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fab0a81', '9438', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fab0a82', '9441', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fab0a83', '9450', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fab0a84', '9493', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fab0a85', '9496', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fab0a86', '9510', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fab0a87', '9516', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fab0a88', '9524', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fab0a89', '9532', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fab0a8a', '9540', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fab0a8b', '9563', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fab0a8c', '9566', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fab0a8d', '9612', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fab0a8e', '9635', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fab0a8f', '9646', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fab0a90', '9649', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fab0a91', '9661', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fab0a92', '9664', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fab0a93', '9673', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fab0a94', '9676', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fab0a95', '9683', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fab0a96', '9690', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fab0a97', '9697', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fab0a98', '9797', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fab0a99', '9804', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fab0a9a', '9811', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fab0a9b', '9813', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fab0a9c', '9819', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fab0a9d', '9828', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fab0a9e', '9837', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fab0a9f', '9843', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fab0aa0', '9846', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fab0aa1', '9853', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fab0aa2', '9854', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fac0aa3', '9859', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fac0aa4', '9862', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fac0aa5', '9869', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fac0aa6', '9881', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fac0aa7', '9883', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fac0aa8', '9887', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fac0aa9', '9892', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fac0aaa', '9893', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fac0aab', '9895', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fac0aac', '9898', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fac0aad', '9903', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9e0829', '9069', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9e082a', '9080', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9e082b', '9082', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9e082c', '9083', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9e082d', '9095', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9e082e', '9099', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9e082f', '9105', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9e0830', '9110', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9e0831', '9121', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9e0832', '9132', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9e0833', '9139', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9e0834', '9140', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9e0835', '9147', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9e0836', '9152', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9e0837', '9157', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9e0838', '9160', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9e0839', '9159', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9e083a', '9177', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9e083b', '9178', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9e083c', '9190', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9e083d', '9193', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9e083e', '9195', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9e083f', '9198', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9e0840', '9205', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9e0841', '8735', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9e0842', '8741', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9f0843', '8746', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9f0844', '8776', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9f0845', '8791', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9f0846', '8796', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9f0847', '8808', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9f0848', '8810', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9f0849', '8851', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9f084a', '8863', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9f084b', '8864', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9f084c', '8870', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9f084d', '8877', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9f084e', '8883', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9f084f', '8890', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9f0850', '8897', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9f0851', '8903', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9f0852', '8919', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9f0853', '8925', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9f0854', '8955', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9f0855', '8966', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9f0856', '8974', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9f0857', '8999', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9f0858', '9006', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9f0859', '9015', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9f085a', '9017', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9f085b', '9026', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9f085c', '9033', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9f085d', '9057', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9f085e', '9068', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9f085f', '9084', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9f0860', '9094', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9f0861', '9100', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9f0862', '9109', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9f0863', '9111', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9f0864', '9120', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9f0865', '9144', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9f0866', '9148', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9f0867', '9156', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9f0868', '9161', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9f0869', '9169', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9f086a', '9173', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9f086b', '9183', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9f086c', '9185', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2f9f086d', '9197', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa0086e', '9204', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa0086f', '9209', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa00870', '9210', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa00871', '9212', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa00872', '9214', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa00873', '9213', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa00874', '9218', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa00875', '9217', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa00876', '9224', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa00877', '9223', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa00878', '9226', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa00879', '9225', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa0087a', '9229', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa0087b', '9228', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa0087c', '9234', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa0087d', '9233', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa0087e', '9235', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa0087f', '9238', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa00880', '9237', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa00881', '9240', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa00882', '9242', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa00883', '9243', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa00884', '9245', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa00885', '9246', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa00886', '9249', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa00887', '9248', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa00888', '9252', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa00889', '9251', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa0088a', '9256', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa0088b', '9254', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa0088c', '9259', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa0088d', '9264', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa0088e', '9262', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa0088f', '9265', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa00890', '9270', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa00891', '9268', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa00892', '9272', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa00893', '9278', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa00894', '9276', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa00895', '9279', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa00896', '9283', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa00897', '8734', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa00898', '8738', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa00899', '8750', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa0089a', '8754', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa0089b', '8763', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa0089c', '8767', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa1089d', '8775', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa1089e', '8777', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa1089f', '8783', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa108a0', '8788', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa108a1', '8799', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa108a2', '8803', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa108a3', '8816', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa108a4', '8822', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa108a5', '8829', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa108a6', '8848', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa108a7', '8858', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa108a8', '8879', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa108a9', '8896', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa108aa', '8904', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa108ab', '8912', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa108ac', '8915', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa108ad', '8920', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa108ae', '8934', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa108af', '8939', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa108b0', '8947', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa108b1', '8968', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa108b2', '8981', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa108b3', '8984', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa108b4', '8988', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa108b5', '9013', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa108b6', '9020', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa108b7', '9028', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa108b8', '9032', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa108b9', '9037', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa108ba', '9042', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa108bb', '9051', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa108bc', '9055', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa108bd', '9064', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa108be', '9072', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa108bf', '9088', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa108c0', '9091', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa108c1', '9163', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa108c2', '9186', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa108c3', '9196', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa108c4', '9206', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa108c5', '9215', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa108c6', '9221', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa108c7', '9232', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa108c8', '9236', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa108c9', '9244', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa5096d', '9097', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa5096e', '9107', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa5096f', '9115', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa50970', '9187', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa50971', '9201', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa50972', '9208', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa50973', '9257', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa50974', '9261', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa50975', '9266', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa50976', '9274', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa50977', '9280', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa50978', '9286', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa50979', '9292', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa5097a', '9298', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa6097b', '9305', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa6097c', '9312', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa6097d', '9320', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa6097e', '9351', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa6097f', '9354', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa60980', '9353', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa60981', '9358', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa60982', '9357', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa60983', '9356', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa60984', '9359', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa60985', '9360', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa60986', '9362', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa60987', '9361', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa60988', '9365', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa60989', '9364', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa6098a', '9363', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa6098b', '9367', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa6098c', '9366', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa6098d', '9371', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa6098e', '9370', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa6098f', '9369', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa60990', '9368', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa60991', '9374', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa60992', '9373', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa60993', '9372', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa60994', '9376', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa60995', '9375', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa60996', '9396', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa60997', '9401', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa60998', '9406', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa60999', '9410', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa6099a', '9408', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa6099b', '9418', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa6099c', '9422', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa6099d', '9428', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa6099e', '9433', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa6099f', '9442', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa609a0', '9449', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa609a1', '9452', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa609a2', '9461', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa609a3', '9467', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa609a4', '9469', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa609a5', '9473', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa609a6', '9478', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa609a7', '9480', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa609a8', '9482', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa609a9', '9492', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa609aa', '9497', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa609ab', '9506', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa609ac', '9511', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa609ad', '9525', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa609ae', '9539', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa609af', '9541', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa609b0', '9542', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa609b1', '9546', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa709b2', '9549', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa709b3', '9552', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa709b4', '9560', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa709b5', '9564', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa709b6', '9568', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa709b7', '9572', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa709b8', '9577', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa709b9', '9578', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa709ba', '9580', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa709bb', '9583', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa709bc', '9585', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa709bd', '9588', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa709be', '9592', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa709bf', '9594', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa709c0', '9597', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa709c1', '9601', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa709c2', '9604', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa709c3', '9608', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa709c4', '9613', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa709c5', '9619', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa709c6', '9622', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa709c7', '9621', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa709c8', '9626', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa709c9', '9627', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa709ca', '9634', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa709cb', '9637', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa709cc', '9639', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa709cd', '9644', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa709ce', '9652', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa709cf', '9654', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa709d0', '9662', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa709d1', '9667', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa709d2', '9670', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa709d3', '9685', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa709d4', '9686', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa709d5', '9696', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa709d6', '9700', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa709d7', '9706', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa709d8', '9707', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa709d9', '9710', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa709da', '9717', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa709db', '9723', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa709dc', '9728', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa809dd', '9737', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa809de', '9749', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa809df', '9756', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa809e0', '9762', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa809e1', '9761', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa809e2', '9768', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa809e3', '9402', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa809e4', '9419', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa809e5', '9420', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa809e6', '9430', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa809e7', '9439', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa809e8', '9443', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa809e9', '9455', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa809ea', '9487', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa809eb', '9547', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa809ec', '9551', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa809ed', '9555', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa809ee', '9562', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa809ef', '9567', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa809f0', '9579', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa809f1', '9584', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa809f2', '9590', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa809f3', '9596', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa809f4', '9598', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa809f5', '9602', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa809f6', '9607', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa809f7', '9614', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa809f8', '9620', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa809f9', '9628', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa809fa', '9636', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa809fb', '9645', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa809fc', '9650', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa809fd', '9660', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa809fe', '9665', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa809ff', '9672', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa80a00', '9677', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa80a01', '9682', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa80a02', '9689', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa80a03', '9699', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa80a04', '9702', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa80a05', '9705', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa80a06', '9712', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa80a07', '9720', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa80a08', '9730', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa80a09', '9735', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa80a0a', '9757', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa80a0b', '9769', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa80a0c', '9770', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa80a0d', '9773', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa208ca', '9247', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa208cb', '9253', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa208cc', '9260', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa208cd', '9267', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa208ce', '9273', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa208cf', '9281', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa208d0', '9284', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa208d1', '9285', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa208d2', '9288', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa208d3', '9287', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa208d4', '9290', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa208d5', '9293', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa208d6', '9291', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa208d7', '9296', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa208d8', '9295', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa208d9', '9299', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa208da', '9297', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa208db', '9302', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa208dc', '9301', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa208dd', '9300', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa208de', '9306', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa208df', '9304', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa208e0', '9308', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa208e1', '9310', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa208e2', '9313', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa208e3', '9316', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa208e4', '9315', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa208e5', '9319', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa208e6', '9317', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa208e7', '9323', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa208e8', '9322', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa208e9', '9321', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa208ea', '9326', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa208eb', '9324', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa208ec', '9328', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa208ed', '8727', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa208ee', '8737', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa308ef', '8778', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa308f0', '8789', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa308f1', '8797', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa308f2', '8807', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa308f3', '8812', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa308f4', '8817', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa308f5', '8824', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa308f6', '8834', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa308f7', '8844', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa308f8', '8850', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa308f9', '8861', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa308fa', '8865', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa308fb', '8875', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa308fc', '8880', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa308fd', '8886', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa308fe', '8894', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa308ff', '8899', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa30900', '8908', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa30901', '8913', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa30902', '8923', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa30903', '8928', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa30904', '8936', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa30905', '8943', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa30906', '8950', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa30907', '8954', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa30908', '8956', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa30909', '8965', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa3090a', '8970', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa3090b', '8978', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa3090c', '9040', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa3090d', '9052', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa3090e', '9074', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa3090f', '9079', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa30910', '9089', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa30911', '9096', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa30912', '9103', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa30913', '9106', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa30914', '9122', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa30915', '9125', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa30916', '9130', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa30917', '9136', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa40918', '9143', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa40919', '9149', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa4091a', '9155', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa4091b', '9165', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa4091c', '9171', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa4091d', '9174', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa4091e', '9182', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa4091f', '9188', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa40920', '9199', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa40921', '9216', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa40922', '9220', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa40923', '9227', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa40924', '9231', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa40925', '9255', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa40926', '9263', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa40927', '9271', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa40928', '9275', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa40929', '9309', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa4092a', '9311', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa4092b', '9314', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa4092c', '9327', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa4092d', '9329', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa4092e', '9331', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa4092f', '9330', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa40930', '9333', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa40931', '9334', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa40932', '9335', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa40933', '9338', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa40934', '9337', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa40935', '9340', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa40936', '9339', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa40937', '9344', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa40938', '9342', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa40939', '9343', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa4093a', '9341', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa4093b', '9346', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa4093c', '9350', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa4093d', '9349', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa4093e', '9348', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa4093f', '9347', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa40940', '9352', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa40941', '9355', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa40942', '8725', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa40943', '8732', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa40944', '8744', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa40945', '8758', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa40946', '8768', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa40947', '8774', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa40948', '8780', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa40949', '8785', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa4094a', '8792', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa4094b', '8800', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa4094c', '8805', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa4094d', '8813', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa4094e', '8820', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa5094f', '8821', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa50950', '8833', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa50951', '8871', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa50952', '8876', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa50953', '8884', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa50954', '8889', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa50955', '8898', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa50956', '8902', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa50957', '8933', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa50958', '8938', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa50959', '8948', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa5095a', '8951', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa5095b', '8957', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa5095c', '8961', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa5095d', '8987', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa5095e', '8993', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa5095f', '9001', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa50960', '9002', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa50961', '9014', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa50962', '9019', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa50963', '9029', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa50964', '9031', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa50965', '9046', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa50966', '9054', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa50967', '9061', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa50968', '9065', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa50969', '9071', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa5096a', '9077', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fa5096b', '9086', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fac0aae', '9910', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fac0aaf', '9908', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fac0ab0', '9913', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fac0ab1', '9914', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fac0ab2', '9918', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fac0ab3', '9917', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fac0ab4', '9916', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fac0ab5', '9915', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fac0ab6', '9919', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fac0ab7', '9922', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fac0ab8', '9921', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fac0ab9', '9920', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fac0aba', '9923', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fac0abb', '9924', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fac0abc', '9927', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fad0abd', '9926', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fad0abe', '9925', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fad0abf', '9929', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fad0ac0', '9928', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fad0ac1', '9930', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fad0ac2', '9934', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fad0ac3', '9933', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fad0ac4', '9932', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fad0ac5', '9931', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fad0ac6', '9937', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fad0ac7', '9936', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fad0ac8', '9935', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fad0ac9', '9939', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fad0aca', '9938', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fad0acb', '9941', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fad0acc', '9940', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fad0acd', '9943', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fad0ace', '9942', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fad0acf', '9394', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fad0ad0', '9397', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fad0ad1', '9403', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fad0ad2', '9407', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fad0ad3', '9415', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fad0ad4', '9424', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fad0ad5', '9436', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fad0ad6', '9445', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fad0ad7', '9454', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fad0ad8', '9459', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fad0ad9', '9474', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fad0ada', '9486', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fad0adb', '9491', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fad0adc', '9499', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fad0add', '9504', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fad0ade', '9513', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fad0adf', '9519', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fad0ae0', '9526', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fad0ae1', '9529', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fad0ae2', '9536', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fad0ae3', '9544', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fad0ae4', '9554', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fad0ae5', '9556', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fad0ae6', '9561', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fad0ae7', '9569', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fad0ae8', '9574', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fad0ae9', '9648', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0aea', '9668', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0aeb', '9674', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0aec', '9679', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0aed', '9684', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0aee', '9693', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0aef', '9694', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0af0', '9714', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0af1', '9724', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0af2', '9726', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0af3', '9734', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0af4', '9739', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0af5', '9748', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0af6', '9751', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0af7', '9760', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0af8', '9765', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0af9', '9774', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0afa', '9778', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0afb', '9777', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0afc', '9782', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0afd', '9783', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0afe', '9784', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0aff', '9788', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0b00', '9786', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0b01', '9790', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0b02', '9791', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0b03', '9793', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0b04', '9795', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0b05', '9800', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0b06', '9807', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0b07', '9812', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0b08', '9820', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0b09', '9824', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0b0a', '9823', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0b0b', '9827', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0b0c', '9831', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0b0d', '9830', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0b0e', '9838', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0b0f', '9836', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0b10', '9842', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0b11', '9841', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0b12', '9848', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0b13', '9850', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0b14', '9856', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0b15', '9855', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0b16', '9858', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0b17', '9861', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0b18', '9860', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0b19', '9863', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0b1a', '9866', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0b1b', '9868', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0b1c', '9865', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0b1d', '9875', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0b1e', '9404', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0b1f', '9412', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fae0b20', '9416', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faf0b21', '9425', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faf0b22', '9426', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faf0b23', '9435', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faf0b24', '9444', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faf0b25', '9456', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faf0b26', '9463', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faf0b27', '9470', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faf0b28', '9472', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faf0b29', '9477', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faf0b2a', '9476', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faf0b2b', '9485', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faf0b2c', '9483', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faf0b2d', '9490', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faf0b2e', '9495', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faf0b2f', '9494', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faf0b30', '9501', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faf0b31', '9502', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faf0b32', '9509', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faf0b33', '9517', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faf0b34', '9523', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faf0b35', '9533', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faf0b36', '9538', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faf0b37', '9545', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faf0b38', '9553', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faf0b39', '9557', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faf0b3a', '9565', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faf0b3b', '9570', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faf0b3c', '9573', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faf0b3d', '9576', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faf0b3e', '9575', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faf0b3f', '9582', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faf0b40', '9581', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faf0b41', '9586', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faf0b42', '9587', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faf0b43', '9591', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faf0b44', '9595', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faf0b45', '9599', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faf0b46', '9606', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faf0b47', '9605', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faf0b48', '9611', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faf0b49', '9610', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faf0b4a', '9616', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faf0b4b', '9615', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faf0b4c', '9624', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faf0b4d', '9630', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2faf0b4e', '9633', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b4f', '9641', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b50', '9647', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b51', '9656', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b52', '9659', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b53', '9666', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b54', '9671', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b55', '9678', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b56', '9681', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b57', '9687', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b58', '9691', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b59', '9695', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b5a', '9701', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b5b', '9708', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b5c', '9715', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b5d', '9716', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b5e', '9718', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b5f', '9721', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b60', '9727', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b61', '9729', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b62', '9732', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b63', '9736', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b64', '9742', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b65', '9744', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b66', '9745', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b67', '9750', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b68', '9754', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b69', '9755', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b6a', '9764', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b6b', '9398', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b6c', '9400', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b6d', '9405', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b6e', '9411', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b6f', '9409', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b70', '9417', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b71', '9423', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b72', '9427', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b73', '9434', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b74', '9437', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b75', '9440', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b76', '9446', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b77', '9448', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b78', '9453', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b79', '9451', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b7a', '9458', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b7b', '9462', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b7c', '9464', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b7d', '9466', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b7e', '9471', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b7f', '9475', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b80', '9484', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b81', '9488', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b82', '9489', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b83', '9500', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b84', '9503', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b85', '9507', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb00b86', '9508', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb10b87', '9514', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb10b88', '9515', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb10b89', '9518', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb10b8a', '9522', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb10b8b', '9527', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb10b8c', '9530', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb10b8d', '9528', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb10b8e', '9537', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb10b8f', '9535', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb10b90', '9543', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb10b91', '9548', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb10b92', '9550', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb10b93', '9558', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb10b94', '9571', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb10b95', '9603', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb10b96', '9618', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb10b97', '9625', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb10b98', '9629', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb10b99', '9638', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb10b9a', '9640', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb10b9b', '9643', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb10b9c', '9651', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb10b9d', '9653', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb10b9e', '9657', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb10b9f', '9658', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb10ba0', '9663', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb10ba1', '9669', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb10ba2', '9675', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb10ba3', '9680', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb10ba4', '9688', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb10ba5', '9692', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb10ba6', '9698', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb10ba7', '9703', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb10ba8', '9704', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb10ba9', '9713', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb10baa', '9719', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb10bab', '9725', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb10bac', '9731', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb10bad', '9733', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb10bae', '9738', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20baf', '9741', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20bb0', '9740', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20bb1', '9747', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20bb2', '9746', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20bb3', '9753', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20bb4', '9752', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20bb5', '9759', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20bb6', '9758', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20bb7', '9763', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20bb8', '9766', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20bb9', '9767', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20bba', '9771', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20bbb', '9961', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20bbc', '9969', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20bbd', '9973', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20bbe', '9981', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20bbf', '9982', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20bc0', '9992', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20bc1', '9995', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20bc2', '10005', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20bc3', '10022', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20bc4', '10032', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20bc5', '10034', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20bc6', '10037', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20bc7', '10044', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20bc8', '10051', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20bc9', '10059', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20bca', '10064', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20bcb', '10073', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20bcc', '10081', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20bcd', '10087', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20bce', '10092', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20bcf', '10098', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20bd0', '10105', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20bd1', '10111', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20bd2', '10123', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20bd3', '10125', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20bd4', '10132', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20bd5', '10138', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20bd6', '10146', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20bd7', '10154', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20bd8', '10160', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20bd9', '10164', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20bda', '10173', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20bdb', '10177', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20bdc', '10187', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20bdd', '10190', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20bde', '10199', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20bdf', '10201', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20be0', '10225', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20be1', '10226', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20be2', '10230', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb20be3', '10240', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb30be4', '10258', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb30be5', '10264', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb30be6', '10271', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb30be7', '10280', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb30be8', '10291', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb30be9', '10293', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb30bea', '10309', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb30beb', '10316', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb30bec', '10329', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb30bed', '10346', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60fa0', '11067', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60fa1', '11069', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60fa2', '11072', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60fa3', '11074', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60fa4', '11086', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60fa5', '11094', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60fa6', '11100', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60fa7', '11099', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60fa8', '11106', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60fa9', '11103', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60faa', '11102', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60fab', '11108', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60fac', '10573', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60fad', '10582', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60fae', '10588', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60faf', '10593', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60fb0', '10604', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60fb1', '10602', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60fb2', '10609', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60fb3', '10618', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60fb4', '10624', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60fb5', '10629', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60fb6', '10634', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60fb7', '10637', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc70fb8', '10644', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc70fb9', '10655', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc70fba', '10652', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc70fbb', '10661', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc70fbc', '10667', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc70fbd', '10671', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc70fbe', '10672', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc70fbf', '10678', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc70fc0', '10675', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc70fc1', '10683', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc70fc2', '10691', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc70fc3', '10697', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc70fc4', '10695', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc70fc5', '10719', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc70fc6', '10726', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc70fc7', '10730', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc70fc8', '10733', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc70fc9', '10738', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc70fca', '10749', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc70fcb', '10748', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc70fcc', '10751', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc70fcd', '10757', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc70fce', '10756', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc70fcf', '10765', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc70fd0', '10767', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc70fd1', '10776', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc70fd2', '10780', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc70fd3', '10785', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc70fd4', '10794', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc70fd5', '10802', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc70fd6', '10810', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc70fd7', '10817', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc70fd8', '10814', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc70fd9', '10826', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc70fda', '10824', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc70fdb', '10830', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc70fdc', '10836', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc70fdd', '10837', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc70fde', '10855', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc70fdf', '10857', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc70fe0', '10866', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc70fe1', '10865', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc70fe2', '10869', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc80fe3', '10874', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc80fe4', '10878', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc80fe5', '10898', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc80fe6', '10899', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc80fe7', '10906', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc80fe8', '10909', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc80fe9', '10908', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc80fea', '10916', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc80feb', '10922', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc80fec', '10925', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc80fed', '10926', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc80fee', '10930', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc80fef', '10938', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc80ff0', '10942', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc80ff1', '10945', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc80ff2', '10951', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc80ff3', '10953', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc80ff4', '10959', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc80ff5', '10961', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc80ff6', '10970', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc80ff7', '10976', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc80ff8', '10983', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc80ff9', '10993', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc80ffa', '10566', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc80ffb', '10576', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc80ffc', '10575', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc80ffd', '10580', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc80ffe', '10579', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc80fff', '10587', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc81000', '10595', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc81001', '10598', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc81002', '10600', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc81003', '10603', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc81004', '10606', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc81005', '10611', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc81006', '10616', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc81007', '10626', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc81008', '10621', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc81009', '10631', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc8100a', '10636', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc8100b', '10647', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc8100c', '10646', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc8100d', '10650', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc8100e', '10649', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc8100f', '10654', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc81010', '10658', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc81011', '10665', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc81012', '10668', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc81013', '10676', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc81014', '10680', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc81015', '10681', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc81016', '10688', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc81017', '10692', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc81018', '10703', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc91019', '10707', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc9101a', '10710', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc9101b', '10716', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc9101c', '10722', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc9101d', '10728', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc9101e', '10735', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc9101f', '10742', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc91020', '10744', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc91021', '10750', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc91022', '10759', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc91023', '10774', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc91024', '10784', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc91025', '10790', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc91026', '10799', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc91027', '10797', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc91028', '10801', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc91029', '10804', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc9102a', '10805', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc9102b', '10808', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc9102c', '10816', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc9102d', '10811', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc9102e', '10827', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc9102f', '10822', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc91030', '10832', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc91031', '10841', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc91032', '10845', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc91033', '10848', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc91034', '10852', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc91035', '10858', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc91036', '10864', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc91037', '10870', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca1038', '10877', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca1039', '10879', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca103a', '10883', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca103b', '10887', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca103c', '10889', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca103d', '10891', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb90d2b', '10441', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb90d2c', '10443', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb90d2d', '10447', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb90d2e', '10454', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb90d2f', '10449', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb90d30', '10456', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb90d31', '10462', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb90d32', '10466', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb90d33', '10468', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb90d34', '10475', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d35', '10474', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d36', '10477', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d37', '10476', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d38', '10478', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d39', '10482', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d3a', '10481', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d3b', '10483', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d3c', '10488', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d3d', '10487', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d3e', '10484', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d3f', '10489', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d40', '10493', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d41', '10495', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d42', '9944', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d43', '9954', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d44', '9958', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d45', '9975', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d46', '9977', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d47', '9984', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d48', '9991', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d49', '9997', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d4a', '10006', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d4b', '10033', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d4c', '10039', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d4d', '10048', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d4e', '10055', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d4f', '10062', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d50', '10068', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d51', '10075', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d52', '10077', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d53', '10090', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d54', '10129', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d55', '10133', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d56', '10141', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d57', '10147', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d58', '10150', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d59', '10158', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d5a', '10165', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d5b', '10172', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d5c', '10178', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d5d', '10186', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d5e', '10191', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d5f', '10197', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d60', '10204', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d61', '10210', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d62', '10213', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d63', '10223', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d64', '10242', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d65', '10250', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d66', '10256', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d67', '10261', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d68', '10269', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d69', '10274', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d6a', '10285', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fba0d6b', '10286', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbb0d6c', '10292', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbb0d6d', '10301', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbb0d6e', '10305', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbb0d6f', '10353', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbb0d70', '10357', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbb0d71', '10361', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbb0d72', '10398', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbb0d73', '10414', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbb0d74', '10420', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbb0d75', '10424', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbb0d76', '10434', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbb0d77', '10438', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbb0d78', '10444', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbb0d79', '10453', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbb0d7a', '10457', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbb0d7b', '10461', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbb0d7c', '10471', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbb0d7d', '10473', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbb0d7e', '10479', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbb0d7f', '10486', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbb0d80', '10494', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbb0d81', '10498', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbb0d82', '10497', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbb0d83', '10502', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbb0d84', '10507', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbb0d85', '10506', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbb0d86', '10505', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbb0d87', '10508', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbb0d88', '10513', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbb0d89', '10510', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbb0d8a', '10509', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbb0d8b', '10514', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbb0d8c', '10519', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbb0d8d', '10518', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbb0d8e', '10516', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbb0d8f', '10521', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbb0d90', '10520', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbb0d91', '9949', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbb0d92', '9951', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbb0d93', '9960', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbb0d94', '9967', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbb0d95', '9974', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbb0d96', '9980', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbb0d97', '9985', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbb0d98', '9988', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbb0d99', '9996', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0d9a', '10007', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0d9b', '10009', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0d9c', '10016', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0d9d', '10024', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0d9e', '10030', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0d9f', '10036', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0da0', '10040', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0da1', '10047', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0da2', '10056', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0da3', '10061', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0da4', '10083', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0da5', '10088', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0da6', '10095', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0da7', '10106', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0da8', '10114', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0da9', '10121', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0daa', '10149', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0dab', '10153', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0dac', '10161', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0dad', '10167', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0dae', '10176', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0daf', '10180', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0db0', '10183', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0db1', '10208', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0db2', '10216', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0db3', '10220', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0db4', '10229', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0db5', '10232', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0db6', '10245', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0db7', '10257', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0db8', '10265', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0db9', '10273', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0dba', '10288', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0dbb', '10296', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0dbc', '10302', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0dbd', '10312', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0dbe', '10343', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0dbf', '10360', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0dc0', '10380', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0dc1', '10390', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0dc2', '10396', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0dc3', '10425', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0dc4', '10430', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0dc5', '10435', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0dc6', '10490', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0dc7', '10492', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0dc8', '10500', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e67', '10844', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e68', '10854', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e69', '10868', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e6a', '10873', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e6b', '10881', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e6c', '10905', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e6d', '10911', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e6e', '10914', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e6f', '10924', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e70', '10932', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e71', '10931', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e72', '10933', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e73', '10937', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e74', '10936', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e75', '10939', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e76', '10944', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e77', '10949', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e78', '10948', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e79', '10572', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e7a', '10577', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e7b', '10585', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e7c', '10590', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e7d', '10599', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e7e', '10610', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e7f', '10617', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e80', '10625', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e81', '10639', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e82', '10645', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e83', '10659', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e84', '10663', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e85', '10670', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e86', '10674', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e87', '10686', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e88', '10694', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e89', '10700', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc10e8a', '10771', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc10e8b', '10778', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc10e8c', '10783', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc10e8d', '10787', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc10e8e', '10812', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc10e8f', '10828', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc10e90', '10833', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc10e91', '10838', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc10e92', '10853', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc10e93', '10856', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc10e94', '10867', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc10e95', '10886', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc10e96', '10892', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc10e97', '10896', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc10e98', '10904', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc10e99', '10912', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc10e9a', '10923', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc10e9b', '10928', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc10e9c', '10935', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc10e9d', '10943', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc10e9e', '10950', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc10e9f', '10952', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc10ea0', '10957', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc10ea1', '10964', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc10ea2', '10963', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc10ea3', '10968', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc10ea4', '10967', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc10ea5', '10972', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc10ea6', '10978', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc10ea7', '10977', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc10ea8', '10982', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc10ea9', '10981', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc10eaa', '10986', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc10eab', '10991', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc10eac', '10989', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc10ead', '10988', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc10eae', '10994', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc10eaf', '10997', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc10eb0', '11006', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc10eb1', '11004', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc10eb2', '11001', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc10eb3', '11008', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc10eb4', '11002', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc10eb5', '11016', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc10eb6', '11014', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc10eb7', '11013', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20eb8', '11012', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20eb9', '11018', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20eba', '11021', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20ebb', '11026', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20ebc', '11025', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20ebd', '11024', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20ebe', '11022', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20ebf', '11034', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20ec0', '11031', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20ec1', '11030', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20ec2', '11038', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20ec3', '11036', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20ec4', '11042', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20ec5', '11041', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20ec6', '10583', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20ec7', '10589', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20ec8', '10591', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20ec9', '10596', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20eca', '10601', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20ecb', '10608', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20ecc', '10615', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20ecd', '10620', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20ece', '10633', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20ecf', '10648', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20ed0', '10653', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20ed1', '10666', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20ed2', '10701', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20ed3', '10712', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20ed4', '10718', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20ed5', '10724', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20ed6', '10743', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20ed7', '10747', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20ed8', '10752', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20ed9', '10761', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20eda', '10792', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20edb', '10796', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20edc', '10813', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20edd', '10829', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20ede', '10834', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20edf', '10840', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20ee0', '10846', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20ee1', '10849', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20ee2', '10861', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20ee3', '10880', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20ee4', '10885', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20ee5', '10929', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20ee6', '10940', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20ee7', '10947', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20ee8', '10954', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20ee9', '10962', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20eea', '10969', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20eeb', '10975', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20eec', '10980', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20eed', '10999', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc20eee', '11003', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc30eef', '11011', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc30ef0', '11027', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc30ef1', '11029', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc30ef2', '11040', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc30ef3', '11039', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc30ef4', '11047', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc30ef5', '11046', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc30ef6', '11044', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc30ef7', '11043', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc30ef8', '11048', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc30ef9', '11049', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc30efa', '11052', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc30efb', '11058', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc30efc', '11060', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc30efd', '11064', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc30efe', '11062', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc30eff', '11061', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc30f00', '11066', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc30f01', '11071', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc30f02', '11076', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc30f03', '11075', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc30f04', '11073', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc30f05', '11079', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc30f06', '11080', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc30f07', '11084', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc30f08', '11082', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc30f09', '11085', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc30f0a', '11088', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc30f0b', '11093', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc30f0c', '11091', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc30f0d', '11090', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc30f0e', '11089', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc30f0f', '11097', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc30f10', '10571', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc30f11', '10584', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc30f12', '10592', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc30f13', '10597', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc30f14', '10605', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc30f15', '10628', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc30f16', '10632', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc30f17', '10643', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc30f18', '10656', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc30f19', '10664', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc30f1a', '10673', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc30f1b', '10679', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc30f1c', '10699', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f1d', '10706', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f1e', '10709', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f1f', '10717', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f20', '10720', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f21', '10727', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f22', '10734', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f23', '10737', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f24', '10755', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f25', '10762', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f26', '10763', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f27', '10769', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f28', '10775', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f29', '10782', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f2a', '10789', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f2b', '10798', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f2c', '10803', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f2d', '10809', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f2e', '10815', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f2f', '10823', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f30', '10835', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f31', '10843', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f32', '10847', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f33', '10850', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f34', '10860', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f35', '10862', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f36', '10872', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f37', '10875', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f38', '10884', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f39', '10888', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f3a', '10895', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f3b', '10902', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f3c', '10917', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f3d', '10921', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f3e', '10927', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f3f', '10934', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f40', '10941', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f41', '10946', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f42', '10955', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f43', '10960', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f44', '10973', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f45', '10979', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f46', '10985', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f47', '10990', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f48', '10998', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f49', '11009', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f4a', '11015', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f4b', '11023', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f4c', '11033', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f4d', '11050', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f4e', '11057', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f4f', '11063', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f50', '11065', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f51', '11070', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f52', '11077', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc40f53', '11078', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc50f54', '11083', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc50f55', '11081', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc50f56', '11087', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc50f57', '11092', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc50f58', '11098', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc50f59', '11096', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc50f5a', '11095', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc50f5b', '11101', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc50f5c', '11105', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc50f5d', '11104', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc50f5e', '10570', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc50f5f', '10622', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc50f60', '10635', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc50f61', '10642', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc50f62', '10657', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc50f63', '10682', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc50f64', '10687', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc50f65', '10693', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc50f66', '10702', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc50f67', '10708', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc50f68', '10713', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc50f69', '10721', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc50f6a', '10725', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc50f6b', '10732', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc50f6c', '10739', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc50f6d', '10745', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc50f6e', '10754', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc50f6f', '10758', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc50f70', '10764', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc50f71', '10768', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc50f72', '10773', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc50f73', '10779', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc50f74', '10786', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc50f75', '10820', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc50f76', '10821', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc50f77', '10851', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc50f78', '10859', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc50f79', '10863', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc50f7a', '10871', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc50f7b', '10876', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc50f7c', '10882', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc50f7d', '10890', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc50f7e', '10893', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc50f7f', '10900', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc50f80', '10910', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc50f81', '10915', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60f82', '10958', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60f83', '10956', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60f84', '10965', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60f85', '10966', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60f86', '10971', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60f87', '10974', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60f88', '10984', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60f89', '10987', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60f8a', '10992', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60f8b', '10995', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60f8c', '10996', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60f8d', '11005', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60f8e', '11000', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60f8f', '11007', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60f90', '11010', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60f91', '11019', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60f92', '11017', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60f93', '11020', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60f94', '11028', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60f95', '11035', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60f96', '11032', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60f97', '11037', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60f98', '11045', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60f99', '11051', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60f9a', '11053', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60f9b', '11054', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60f9c', '11056', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60f9d', '11055', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60f9e', '11059', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc60f9f', '11068', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0dc9', '10503', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0dca', '10512', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0dcb', '10515', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0dcc', '10523', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0dcd', '10522', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0dce', '10526', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbc0dcf', '10524', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbd0dd0', '10530', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbd0dd1', '10529', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbd0dd2', '10528', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbd0dd3', '10527', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbd0dd4', '10533', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbd0dd5', '10532', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbd0dd6', '10536', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbd0dd7', '10534', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbd0dd8', '10539', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbd0dd9', '10538', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbd0dda', '10540', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbd0ddb', '10544', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbd0ddc', '10543', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbd0ddd', '10541', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbd0dde', '10548', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbd0ddf', '10547', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbd0de0', '9947', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbd0de1', '9955', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbd0de2', '9963', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbd0de3', '9964', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbd0de4', '10003', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbd0de5', '10008', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbd0de6', '10017', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbd0de7', '10023', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbd0de8', '10031', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbd0de9', '10035', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbd0dea', '10041', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbd0deb', '10045', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbd0dec', '10050', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbd0ded', '10063', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbd0dee', '10067', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbd0def', '10089', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbd0df0', '10094', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbd0df1', '10102', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbd0df2', '10104', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbd0df3', '10117', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbd0df4', '10118', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbd0df5', '10128', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbd0df6', '10156', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbd0df7', '10168', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbd0df8', '10175', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbd0df9', '10218', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbd0dfa', '10224', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbe0dfb', '10231', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbe0dfc', '10236', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbe0dfd', '10243', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbe0dfe', '10248', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbe0dff', '10260', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbe0e00', '10266', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbe0e01', '10268', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbe0e02', '10276', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbe0e03', '10283', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbe0e04', '10289', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbe0e05', '10295', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbe0e06', '10303', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbe0e07', '10310', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbe0e08', '10318', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbe0e09', '10327', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbe0e0a', '10332', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbe0e0b', '10344', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbe0e0c', '10370', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbe0e0d', '10379', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbe0e0e', '10391', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbe0e0f', '10415', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbe0e10', '10416', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbe0e11', '10428', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbe0e12', '10439', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbe0e13', '10442', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbe0e14', '10451', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbe0e15', '10460', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbe0e16', '10491', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbe0e17', '10501', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbe0e18', '10535', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbe0e19', '10542', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbe0e1a', '10550', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbe0e1b', '10549', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbe0e1c', '10551', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbe0e1d', '10552', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbe0e1e', '10556', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbe0e1f', '10555', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbe0e20', '10554', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbe0e21', '10553', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbe0e22', '10557', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbe0e23', '10558', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbe0e24', '10559', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbe0e25', '10564', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbe0e26', '10562', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbe0e27', '10563', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbe0e28', '10561', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbf0e29', '10560', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbf0e2a', '10565', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbf0e2b', '10569', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbf0e2c', '10574', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbf0e2d', '10581', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbf0e2e', '10578', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbf0e2f', '10586', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbf0e30', '10594', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbf0e31', '10607', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbf0e32', '10613', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbf0e33', '10612', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbf0e34', '10614', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbf0e35', '10619', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbf0e36', '10623', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbf0e37', '10627', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbf0e38', '10630', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbf0e39', '10638', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbf0e3a', '10640', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbf0e3b', '10641', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbf0e3c', '10651', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbf0e3d', '10660', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbf0e3e', '10662', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbf0e3f', '10669', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbf0e40', '10677', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbf0e41', '10685', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbf0e42', '10684', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbf0e43', '10690', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbf0e44', '10689', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbf0e45', '10696', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbf0e46', '10698', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbf0e47', '10705', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbf0e48', '10704', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbf0e49', '10711', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbf0e4a', '10715', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbf0e4b', '10714', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbf0e4c', '10723', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbf0e4d', '10729', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbf0e4e', '10731', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbf0e4f', '10736', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbf0e50', '10740', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbf0e51', '10741', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fbf0e52', '10746', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e53', '10753', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e54', '10760', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e55', '10766', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e56', '10772', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e57', '10770', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e58', '10777', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e59', '10781', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e5a', '10791', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e5b', '10788', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e5c', '10795', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e5d', '10793', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e5e', '10800', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e5f', '10807', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e60', '10806', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e61', '10819', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e62', '10818', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e63', '10825', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e64', '10831', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e65', '10842', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fc00e66', '10839', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca103e', '10894', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca103f', '10897', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca1040', '10901', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca1041', '10903', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca1042', '10907', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca1043', '10913', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca1044', '10918', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca1045', '10919', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca1046', '10920', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca1047', '11107', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca1048', '11119', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca1049', '11124', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca104a', '11132', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca104b', '11134', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca104c', '11142', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca104d', '11170', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca104e', '11176', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca104f', '11201', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca1050', '11211', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca1051', '11217', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca1052', '11223', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca1053', '11229', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca1054', '11233', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca1055', '11250', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca1056', '11253', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca1057', '11261', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca1058', '11265', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca1059', '11276', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca105a', '11284', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca105b', '11296', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca105c', '11361', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca105d', '11372', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca105e', '11379', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca105f', '11380', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca1060', '11393', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca1061', '11412', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca1062', '11421', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca1063', '11428', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca1064', '11436', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca1065', '11444', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca1066', '11445', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca1067', '11506', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca1068', '11514', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca1069', '11517', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca106a', '11530', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca106b', '11536', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca106c', '11538', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fca106d', '11546', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcb106e', '11552', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcb106f', '11560', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcb1070', '11586', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcb1071', '11593', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcb1072', '11595', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcb1073', '11600', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcb1074', '11608', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcb1075', '11615', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcb1076', '11622', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcb1077', '11627', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcb1078', '11635', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcb1079', '11636', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcb107a', '11649', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcb107b', '11661', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcb107c', '11669', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcb107d', '11671', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcb107e', '11676', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcb107f', '11682', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcb1080', '11691', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcb1081', '11695', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcb1082', '11704', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcb1083', '11712', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcb1084', '11725', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcb1085', '11729', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcb1086', '11728', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcb1087', '11727', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcb1088', '11726', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcb1089', '11730', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcb108a', '11731', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcb108b', '11735', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcb108c', '11734', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcb108d', '11733', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcb108e', '11736', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcb108f', '11732', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcb1090', '11738', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcb1091', '11737', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcb1092', '11744', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcb1093', '11742', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcb1094', '11109', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcb1095', '11117', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcb1096', '11122', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcb1097', '11126', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcb1098', '11127', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc1099', '11130', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc109a', '11136', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc109b', '11138', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc109c', '11145', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc109d', '11147', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc109e', '11153', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc109f', '11157', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc10a0', '11160', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc10a1', '11163', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc10a2', '11168', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc10a3', '11177', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc10a4', '11180', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc10a5', '11184', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc10a6', '11188', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc10a7', '11193', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc10a8', '11195', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc10a9', '11202', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc10aa', '11210', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc10ab', '11218', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc10ac', '11230', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc10ad', '11227', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc10ae', '11237', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc10af', '11251', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc10b0', '11260', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc10b1', '11262', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc10b2', '11266', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc10b3', '11270', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc10b4', '11275', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc10b5', '11274', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc10b6', '11278', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc10b7', '11282', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc10b8', '11290', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc10b9', '11287', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc10ba', '11295', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc10bb', '11304', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc10bc', '11307', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc10bd', '11306', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc10be', '11312', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc10bf', '11315', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc10c0', '11323', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc10c1', '11324', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc10c2', '11334', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc10c3', '11339', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc10c4', '11337', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc10c5', '11345', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc10c6', '11344', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc10c7', '11351', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc10c8', '11350', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc10c9', '11356', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc10ca', '11366', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc10cb', '11374', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc10cc', '11376', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc10cd', '11383', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc10ce', '11387', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcc10cf', '11391', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcd10d0', '11390', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcd10d1', '11398', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcd10d2', '11397', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcd10d3', '11405', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcd10d4', '11403', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcd10d5', '11423', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcd10d6', '11438', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcd10d7', '11455', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcd10d8', '11461', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcd10d9', '11462', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcd10da', '11470', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcd10db', '11474', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcd10dc', '11476', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcd10dd', '11475', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcd10de', '11485', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcd10df', '11484', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcd10e0', '11489', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcd10e1', '11499', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcd10e2', '11507', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcd10e3', '11524', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcd10e4', '11529', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcd10e5', '11113', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcd10e6', '11114', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcd10e7', '11178', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcd10e8', '11183', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcd10e9', '11191', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcd10ea', '11198', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcd10eb', '11206', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcd10ec', '11215', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcd10ed', '11220', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcd10ee', '11241', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcd10ef', '11245', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcd10f0', '11280', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcd10f1', '11288', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcd10f2', '11294', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcd10f3', '11302', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcd10f4', '11309', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcd10f5', '11317', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcd10f6', '11319', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcd10f7', '11400', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcd10f8', '11407', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcd10f9', '11413', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcd10fa', '11420', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcd10fb', '11431', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcd10fc', '11452', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcd10fd', '11457', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcd10fe', '11464', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce10ff', '11468', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce1100', '11478', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce1101', '11481', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce1102', '11493', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce1103', '11497', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce1104', '11502', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce1105', '11511', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce1106', '11515', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce1107', '11523', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce1108', '11533', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce1109', '11537', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce110a', '11541', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce110b', '11539', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce110c', '11544', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce110d', '11549', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce110e', '11548', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce110f', '11554', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce1110', '11556', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce1111', '11558', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce1112', '11561', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce1113', '11565', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce1114', '11568', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce1115', '11570', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce1116', '11573', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce1117', '11579', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce1118', '11582', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce1119', '11592', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce111a', '11597', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce111b', '11602', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce111c', '11604', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce111d', '11605', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce111e', '11613', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce111f', '11618', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce1120', '11617', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce1121', '11626', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce1122', '11629', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce1123', '11631', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce1124', '11642', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce1125', '11646', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce1126', '11644', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce1127', '11653', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce1128', '11657', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce1129', '11655', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce112a', '11663', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce112b', '11667', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce112c', '11668', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce112d', '11673', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce112e', '11680', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce112f', '11679', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce1130', '11685', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce1131', '11684', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce1132', '11693', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce1133', '11692', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fce1134', '11699', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcf1135', '11115', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcf1136', '11121', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcf1137', '11128', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcf1138', '11135', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcf1139', '11143', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcf113a', '11141', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcf113b', '11150', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcf113c', '11149', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcf113d', '11156', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcf113e', '11154', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcf113f', '11166', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcf1140', '11164', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcf1141', '11172', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcf1142', '11181', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcf1143', '11186', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcf1144', '11189', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcf1145', '11197', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcf1146', '11194', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcf1147', '11203', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcf1148', '11204', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcf1149', '11208', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcf114a', '11214', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcf114b', '11221', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcf114c', '11225', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcf114d', '11232', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcf114e', '11236', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcf114f', '11240', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcf1150', '11242', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcf1151', '11248', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcf1152', '11246', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcf1153', '11256', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcf1154', '11254', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcf1155', '11258', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcf1156', '11264', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcf1157', '11269', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcf1158', '11271', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcf1159', '11277', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcf115a', '11283', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcf115b', '11286', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcf115c', '11285', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcf115d', '11292', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcf115e', '11300', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcf115f', '11303', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcf1160', '11310', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcf1161', '11313', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fcf1162', '11316', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd01163', '11322', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd01164', '11321', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd01165', '11328', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd01166', '11327', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd01167', '11331', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd01168', '11342', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd01169', '11359', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd0116a', '11367', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd0116b', '11368', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd0116c', '11377', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd0116d', '11382', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd0116e', '11381', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd0116f', '11392', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd01170', '11389', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd01171', '11399', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd01172', '11396', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd01173', '11406', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd01174', '11402', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd01175', '11409', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd01176', '11414', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60c8c', '10397', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60c8d', '10402', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60c8e', '10403', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60c8f', '10406', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60c90', '10408', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60c91', '10411', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60c92', '10413', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60c93', '10419', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60c94', '10421', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60c95', '10422', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60c96', '10429', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60c97', '10426', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60c98', '10432', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60c99', '10437', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60c9a', '10445', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60c9b', '10446', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60c9c', '10448', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60c9d', '10452', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60c9e', '10450', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60c9f', '10455', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60ca0', '10458', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60ca1', '10459', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb60ca2', '10464', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb70ca3', '10465', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb70ca4', '10470', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb70ca5', '10469', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb70ca6', '9945', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb70ca7', '9950', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb70ca8', '9953', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb70ca9', '9957', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb70caa', '9966', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb70cab', '9970', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb70cac', '9979', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb70cad', '9986', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb70cae', '9987', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb70caf', '9999', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb70cb0', '9998', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb70cb1', '10001', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb70cb2', '10000', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb70cb3', '10010', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb70cb4', '10014', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb70cb5', '10015', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb70cb6', '10025', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb70cb7', '10029', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb70cb8', '10038', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb70cb9', '10042', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb70cba', '10043', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb70cbb', '10052', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb70cbc', '10058', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb70cbd', '10065', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb70cbe', '10070', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb70cbf', '10072', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb70cc0', '10076', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb70cc1', '10082', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb70cc2', '10086', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb70cc3', '10093', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb70cc4', '10091', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb70cc5', '10100', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb70cc6', '10099', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb70cc7', '10103', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb70cc8', '10108', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb70cc9', '10112', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb70cca', '10122', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb70ccb', '10130', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb70ccc', '10142', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb70ccd', '10143', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb70cce', '10145', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb70ccf', '10155', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb70cd0', '10159', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80cd1', '10163', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80cd2', '10174', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80cd3', '10214', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80cd4', '10222', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80cd5', '10227', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80cd6', '10234', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80cd7', '10238', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80cd8', '10252', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80cd9', '10272', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80cda', '10275', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80cdb', '10284', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80cdc', '10304', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80cdd', '10311', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80cde', '10308', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80cdf', '10313', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80ce0', '10317', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80ce1', '10322', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80ce2', '10325', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80ce3', '10331', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80ce4', '10334', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80ce5', '10336', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80ce6', '10339', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80ce7', '10342', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80ce8', '10347', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80ce9', '10349', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80cea', '10351', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80ceb', '10355', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80cec', '10359', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80ced', '10362', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80cee', '10364', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80cef', '10369', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80cf0', '10372', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80cf1', '10375', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80cf2', '10378', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80cf3', '10384', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80cf4', '10395', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80cf5', '9946', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80cf6', '9956', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80cf7', '9962', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80cf8', '9965', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80cf9', '9971', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80cfa', '9978', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80cfb', '10011', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80cfc', '10021', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80cfd', '10026', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80cfe', '10054', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80cff', '10074', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80d00', '10078', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80d01', '10085', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80d02', '10097', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80d03', '10107', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80d04', '10113', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80d05', '10120', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb80d06', '10127', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb90d07', '10131', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb90d08', '10139', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb90d09', '10144', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb90d0a', '10157', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb90d0b', '10182', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb90d0c', '10188', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb90d0d', '10194', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb90d0e', '10202', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb90d0f', '10207', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb90d10', '10247', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb90d11', '10253', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb90d12', '10279', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb90d13', '10282', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb90d14', '10287', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb90d15', '10299', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb90d16', '10307', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb90d17', '10314', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb90d18', '10320', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb90d19', '10324', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb90d1a', '10335', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb90d1b', '10338', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb90d1c', '10374', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb90d1d', '10388', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb90d1e', '10401', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb90d1f', '10399', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb90d20', '10404', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb90d21', '10405', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb90d22', '10409', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb90d23', '10412', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb90d24', '10417', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb90d25', '10418', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb90d26', '10423', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb90d27', '10427', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb90d28', '10431', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb90d29', '10440', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fb90d2a', '10436', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe31525', '12940', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe31526', '12939', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe31527', '12938', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe31528', '12937', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe31529', '12942', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe3152a', '12946', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe3152b', '12945', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe3152c', '12944', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe3152d', '12285', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe3152e', '12289', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe3152f', '12297', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe31530', '12301', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe31531', '12310', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe31532', '12313', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe31533', '12315', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe31534', '12320', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe31535', '12321', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe31536', '12328', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe31537', '12334', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe31538', '12337', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe31539', '12341', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe3153a', '12339', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe3153b', '12345', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe3153c', '12350', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe3153d', '12349', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe3153e', '12354', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe3153f', '12359', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe31540', '12360', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe31541', '12365', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe31542', '12369', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe31543', '12376', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe31544', '12382', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe31545', '12385', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe31546', '12390', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe31547', '12393', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe31548', '12395', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe31549', '12397', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe3154a', '12402', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe3154b', '12404', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe3154c', '12410', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe3154d', '12412', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe3154e', '12418', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe3154f', '12423', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe31550', '12430', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe31551', '12438', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe31552', '12444', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe31553', '12450', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe31554', '12459', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe51555', '12465', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe51556', '12473', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe51557', '12483', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe51558', '12494', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe51559', '12495', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe5155a', '12504', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe5155b', '12507', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe5155c', '12508', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe5155d', '12513', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe5155e', '12518', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe5155f', '12522', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe51560', '12527', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe51561', '12529', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe51562', '12531', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe51563', '12536', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe51564', '12545', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe51565', '12548', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe51566', '12554', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe51567', '12573', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe51568', '12597', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe51569', '12600', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe5156a', '12609', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe5156b', '12613', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe5156c', '12616', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe5156d', '12619', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe5156e', '12622', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe5156f', '12628', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe51570', '12630', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe51571', '12633', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe51572', '12639', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe51573', '12645', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe51574', '12653', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe51575', '12658', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe51576', '12661', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe51577', '12671', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe51578', '12675', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe51579', '12686', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe5157a', '12698', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe5157b', '12707', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe5157c', '12711', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe5157d', '12725', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe5157e', '12741', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe5157f', '12772', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe51580', '12282', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe51581', '12288', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe51582', '12302', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe61583', '12312', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe61584', '12319', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe61585', '12323', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe61586', '12329', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe61587', '12367', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe61588', '12372', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe61589', '12378', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe6158a', '12386', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe6158b', '12426', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe6158c', '12437', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe6158d', '12456', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe6158e', '12514', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe6158f', '12515', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe61590', '12525', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe61591', '12534', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe61592', '12546', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe61593', '12558', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe61594', '12562', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe61595', '12571', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe61596', '12577', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe61597', '12582', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe61598', '12587', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe61599', '12596', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe6159a', '12605', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe6159b', '12618', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe6159c', '12629', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe6159d', '12640', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe6159e', '12666', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe6159f', '12674', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe615a0', '12678', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe615a1', '12684', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe615a2', '12692', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe615a3', '12695', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe615a4', '12713', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe615a5', '12719', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe615a6', '12721', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe615a7', '12728', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe615a8', '12736', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe615a9', '12744', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe615aa', '12752', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe615ab', '12758', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe615ac', '12765', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe615ad', '12766', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe615ae', '12782', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe615af', '12787', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe615b0', '12792', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715b1', '12798', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715b2', '12797', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715b3', '12803', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715b4', '12807', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715b5', '12808', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715b6', '12813', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715b7', '12816', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715b8', '12817', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715b9', '12820', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715ba', '12824', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715bb', '12831', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715bc', '12832', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715bd', '12834', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715be', '12839', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715bf', '12844', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715c0', '12847', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715c1', '12850', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd612b2', '11709', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd91350', '12180', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd91351', '12178', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd91352', '12184', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd91353', '12185', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd91354', '12188', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd91355', '12186', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd91356', '12189', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd91357', '12193', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd91358', '11751', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd91359', '11753', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd9135a', '11757', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd9135b', '11764', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd9135c', '11768', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd9135d', '11778', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd9135e', '11785', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd9135f', '11800', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda1360', '11806', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda1361', '11815', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda1362', '11823', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda1363', '11841', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda1364', '11855', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda1365', '11908', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda1366', '11911', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda1367', '11921', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda1368', '11928', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda1369', '11955', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda136a', '11957', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda136b', '11965', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda136c', '11974', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda136d', '11982', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda136e', '11988', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda136f', '11993', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda1370', '11998', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda1371', '12008', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda1372', '12015', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda1373', '12065', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda1374', '12070', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda1375', '12078', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda1376', '12085', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda1377', '12092', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda1378', '12098', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda1379', '12107', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda137a', '12129', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda137b', '12133', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda137c', '12138', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda137d', '12145', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda137e', '12151', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda137f', '12160', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda1380', '12167', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda1381', '12175', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda1382', '12183', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda1383', '12190', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda1384', '12192', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda1385', '12194', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda1386', '12200', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda1387', '12199', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda1388', '12202', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda1389', '12205', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda138a', '12208', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda138b', '12210', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda138c', '12211', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda138d', '12213', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda138e', '12216', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda138f', '12223', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda1390', '12220', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda1391', '12219', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda1392', '12217', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda1393', '12222', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda1394', '12229', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fda1395', '12227', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdb1396', '12232', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdb1397', '12230', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdb1398', '12241', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdb1399', '12239', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdb139a', '12238', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdb139b', '12237', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdb139c', '12236', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdb139d', '12235', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdb139e', '12234', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdb139f', '12243', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdb13a0', '12246', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdb13a1', '12245', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdb13a2', '12244', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdb13a3', '12251', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdb13a4', '12250', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdb13a5', '11750', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdb13a6', '11759', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdb13a7', '11860', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdb13a8', '11872', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdb13a9', '11898', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdb13aa', '11905', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdb13ab', '11912', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdb13ac', '11920', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdb13ad', '11929', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdb13ae', '11934', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdb13af', '11936', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdb13b0', '11947', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdb13b1', '11953', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdb13b2', '11961', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdb13b3', '11963', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdb13b4', '11972', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdb13b5', '12029', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdb13b6', '12036', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdb13b7', '12044', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdb13b8', '12051', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdb13b9', '12058', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdb13ba', '12063', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13bb', '12068', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13bc', '12075', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13bd', '12082', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13be', '12086', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13bf', '12096', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13c0', '12101', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13c1', '12112', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13c2', '12114', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13c3', '12118', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13c4', '12126', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13c5', '12131', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13c6', '12141', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13c7', '12146', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13c8', '12155', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13c9', '12158', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13ca', '12177', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13cb', '12195', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13cc', '12197', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13cd', '12201', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13ce', '12206', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13cf', '12209', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13d0', '12212', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13d1', '12224', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13d2', '12228', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13d3', '12231', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13d4', '12240', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13d5', '12242', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13d6', '12249', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13d7', '12248', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13d8', '12247', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13d9', '12253', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13da', '12252', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13db', '12256', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13dc', '12255', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13dd', '12254', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13de', '12260', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13df', '12259', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13e0', '12258', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13e1', '12257', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13e2', '12263', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13e3', '12262', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13e4', '12261', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13e5', '12266', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13e6', '12265', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13e7', '12264', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13e8', '12267', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13e9', '12269', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13ea', '12268', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13eb', '12272', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd01177', '11415', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd01178', '11424', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd01179', '11426', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd0117a', '11425', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd0117b', '11435', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd0117c', '11432', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd0117d', '11442', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd0117e', '11440', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd0117f', '11448', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd01180', '11454', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd01181', '11456', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd01182', '11459', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd01183', '11465', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd01184', '11467', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd01185', '11471', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd01186', '11139', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd01187', '11140', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd01188', '11151', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd01189', '11155', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd0118a', '11165', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd0118b', '11167', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd0118c', '11200', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd0118d', '11216', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd0118e', '11226', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd0118f', '11231', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd01190', '11239', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd01191', '11249', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd01192', '11263', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd01193', '11267', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd01194', '11273', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd01195', '11279', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd01196', '11289', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd01197', '11293', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd01198', '11298', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd01199', '11301', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd1119a', '11308', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd1119b', '11318', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd1119c', '11332', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd1119d', '11341', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd1119e', '11343', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd1119f', '11354', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd111a0', '11355', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd111a1', '11365', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd111a2', '11370', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd111a3', '11401', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd111a4', '11404', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd111a5', '11408', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd111a6', '11416', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd111a7', '11419', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd111a8', '11434', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd111a9', '11439', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd111aa', '11446', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd111ab', '11450', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd111ac', '11458', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd111ad', '11463', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd111ae', '11469', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd111af', '11473', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd111b0', '11477', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd111b1', '11479', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd111b2', '11483', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd111b3', '11486', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd111b4', '11491', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd111b5', '11490', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd111b6', '11494', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd111b7', '11496', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd111b8', '11495', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd111b9', '11504', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd111ba', '11503', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd111bb', '11509', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd111bc', '11508', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd111bd', '11519', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd111be', '11527', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd111bf', '11525', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd111c0', '11521', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd111c1', '11532', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd111c2', '11535', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd111c3', '11542', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd111c4', '11540', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd111c5', '11545', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd111c6', '11547', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd111c7', '11551', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd211c8', '11553', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd211c9', '11557', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd211ca', '11559', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd211cb', '11564', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd211cc', '11567', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd211cd', '11571', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd211ce', '11574', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd211cf', '11578', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd211d0', '11584', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd211d1', '11587', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd211d2', '11591', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd211d3', '11598', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd211d4', '11603', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd211d5', '11609', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd211d6', '11612', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd211d7', '11614', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd211d8', '11111', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd211d9', '11120', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd211da', '11159', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd211db', '11161', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd211dc', '11171', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd211dd', '11175', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd211de', '11190', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd211df', '11199', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd211e0', '11205', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd211e1', '11209', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd211e2', '11213', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd211e3', '11222', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd211e4', '11238', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd211e5', '11252', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd211e6', '11297', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd211e7', '11299', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd211e8', '11325', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd211e9', '11326', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd211ea', '11330', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd211eb', '11333', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd211ec', '11338', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd211ed', '11346', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd211ee', '11349', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd211ef', '11357', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd211f0', '11364', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd211f1', '11371', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd211f2', '11378', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd211f3', '11386', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd211f4', '11395', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd211f5', '11430', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd211f6', '11433', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd211f7', '11441', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd211f8', '11449', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd211f9', '11453', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd311fa', '11460', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd311fb', '11466', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd311fc', '11472', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd311fd', '11480', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd311fe', '11482', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd311ff', '11488', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd31200', '11498', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd31201', '11501', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd31202', '11512', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd31203', '11516', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd31204', '11528', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd31205', '11555', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd31206', '11562', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd31207', '11575', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd31208', '11576', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd31209', '11581', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd3120a', '11589', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd3120b', '11594', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd3120c', '11601', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd3120d', '11607', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd3120e', '11616', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd3120f', '11619', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd31210', '11623', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd31211', '11621', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd31212', '11625', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd31213', '11628', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd612b3', '11711', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd612b4', '11714', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd612b5', '11713', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd612b6', '11716', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd612b7', '11715', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd612b8', '11718', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd612b9', '11717', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd612ba', '11721', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd612bb', '11720', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd612bc', '11719', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd612bd', '11722', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd612be', '11724', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd612bf', '11723', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd612c0', '11745', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd612c1', '11746', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd612c2', '11772', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd612c3', '11777', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd712c4', '11775', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd712c5', '11781', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd712c6', '11780', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd712c7', '11786', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd712c8', '11789', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd712c9', '11797', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd712ca', '11798', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd712cb', '11799', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd712cc', '11804', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd712cd', '11809', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd712ce', '11807', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd712cf', '11812', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd712d0', '11813', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd712d1', '11817', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd712d2', '11821', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd712d3', '11826', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd712d4', '11827', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd712d5', '11833', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd712d6', '11834', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd712d7', '11839', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd712d8', '11843', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd712d9', '11847', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd712da', '11851', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd712db', '11850', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd712dc', '11853', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd712dd', '11859', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd712de', '11862', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd712df', '11863', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd712e0', '11869', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd712e1', '11875', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd712e2', '11880', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd712e3', '11882', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd712e4', '11887', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd712e5', '11890', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd712e6', '11891', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd712e7', '11903', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd712e8', '11922', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd712e9', '11925', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd712ea', '11932', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd712eb', '11937', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd712ec', '11941', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd712ed', '11946', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd712ee', '11943', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd712ef', '11952', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd712f0', '11949', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd712f1', '11968', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd812f2', '11985', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd812f3', '11992', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd812f4', '11995', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd812f5', '12000', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd812f6', '12003', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd812f7', '12007', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd812f8', '12011', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd812f9', '12016', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd812fa', '12018', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd812fb', '12023', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd812fc', '12024', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd812fd', '12030', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd812fe', '12031', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd812ff', '12034', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd81300', '12041', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd81301', '12045', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd81302', '12049', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd81303', '12050', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd81304', '12055', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd81305', '12054', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd81306', '12062', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd81307', '12069', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd81308', '12073', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd81309', '12084', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd8130a', '12100', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd8130b', '12105', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd8130c', '11741', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd8130d', '11748', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd8130e', '11752', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd8130f', '11758', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd81310', '11762', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd81311', '11769', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd81312', '11774', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd81313', '11783', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd81314', '11791', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd81315', '11795', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd81316', '11801', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd81317', '11811', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd81318', '11819', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd81319', '11840', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd8131a', '11842', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd8131b', '11849', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd8131c', '11854', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd8131d', '11861', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd8131e', '11870', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd8131f', '11878', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd81320', '11900', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd81321', '11960', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd81322', '11966', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd81323', '11973', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd81324', '11981', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd81325', '12005', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd81326', '12014', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd81327', '12026', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd81328', '12037', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd91329', '12042', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd9132a', '12048', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd9132b', '12056', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd9132c', '12066', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd9132d', '12072', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd9132e', '12074', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd9132f', '12083', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd91330', '12087', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd91331', '12095', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd91332', '12104', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd91333', '12102', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd91334', '12110', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd91335', '12108', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd91336', '12117', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd91337', '12116', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd91338', '12121', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd91339', '12120', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd9133a', '12124', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd9133b', '12123', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd9133c', '12128', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd9133d', '12130', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd9133e', '12136', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd9133f', '12134', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd91340', '12137', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd91341', '12143', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd91342', '12144', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd91343', '12150', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd91344', '12156', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd91345', '12157', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd91346', '12163', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd91347', '12164', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd91348', '12168', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd91349', '12165', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd9134a', '12172', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd9134b', '12171', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd9134c', '12170', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd9134d', '12174', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd9134e', '12173', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd9134f', '12182', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd31214', '11630', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd31215', '11632', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd31216', '11634', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd31217', '11638', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd31218', '11637', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd31219', '11640', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd3121a', '11643', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd3121b', '11645', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd3121c', '11652', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd3121d', '11651', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd3121e', '11648', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd3121f', '11658', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd31220', '11656', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd31221', '11660', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd31222', '11662', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd31223', '11665', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd31224', '11664', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd31225', '11666', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd31226', '11110', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd31227', '11116', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd41228', '11123', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd41229', '11131', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd4122a', '11137', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd4122b', '11144', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd4122c', '11152', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd4122d', '11173', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd4122e', '11179', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd4122f', '11185', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd41230', '11187', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd41231', '11196', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd41232', '11207', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd41233', '11212', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd41234', '11219', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd41235', '11235', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd41236', '11243', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd41237', '11257', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd41238', '11305', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd41239', '11314', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd4123a', '11320', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd4123b', '11329', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd4123c', '11336', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd4123d', '11340', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd4123e', '11348', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd4123f', '11352', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd41240', '11360', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd41241', '11362', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd41242', '11369', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd41243', '11375', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd41244', '11384', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd41245', '11388', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd41246', '11411', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd41247', '11422', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd41248', '11427', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd41249', '11437', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd4124a', '11443', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd4124b', '11447', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd4124c', '11487', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd4124d', '11492', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd4124e', '11500', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd4124f', '11505', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd41250', '11513', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd41251', '11520', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd41252', '11526', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd41253', '11531', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd41254', '11543', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd41255', '11550', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd41256', '11566', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd41257', '11569', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd41258', '11580', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd41259', '11583', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd4125a', '11588', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd4125b', '11596', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd4125c', '11599', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd4125d', '11606', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd4125e', '11611', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd5125f', '11620', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd51260', '11624', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd51261', '11633', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd51262', '11639', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd51263', '11647', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd51264', '11659', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd51265', '11672', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd51266', '11670', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd51267', '11674', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd51268', '11677', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd51269', '11675', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd5126a', '11678', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd5126b', '11683', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd5126c', '11681', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd5126d', '11686', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd5126e', '11687', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd5126f', '11690', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd51270', '11689', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd51271', '11688', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd51272', '11694', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd51273', '11698', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd51274', '11697', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd51275', '11112', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd51276', '11118', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd51277', '11125', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd51278', '11129', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd51279', '11133', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd5127a', '11146', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd5127b', '11148', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd5127c', '11158', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd5127d', '11162', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd5127e', '11169', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd5127f', '11174', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd51280', '11182', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd51281', '11192', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd51282', '11224', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd51283', '11228', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd51284', '11234', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd51285', '11244', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd51286', '11247', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd51287', '11255', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd51288', '11259', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd51289', '11268', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd5128a', '11272', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd5128b', '11281', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd5128c', '11291', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd6128d', '11311', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd6128e', '11335', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd6128f', '11347', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd61290', '11353', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd61291', '11358', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd61292', '11363', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd61293', '11373', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd61294', '11385', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd61295', '11394', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd61296', '11410', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd61297', '11417', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd61298', '11418', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd61299', '11429', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd6129a', '11451', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd6129b', '11510', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd6129c', '11518', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd6129d', '11522', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd6129e', '11534', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd6129f', '11563', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd612a0', '11572', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd612a1', '11577', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd612a2', '11585', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd612a3', '11590', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd612a4', '11610', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd612a5', '11641', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd612a6', '11650', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd612a7', '11654', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd612a8', '11696', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd612a9', '11701', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd612aa', '11700', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd612ab', '11703', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd612ac', '11702', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd612ad', '11705', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd612ae', '11708', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd612af', '11707', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd612b0', '11706', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fd612b1', '11710', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13ec', '12271', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13ed', '12270', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13ee', '12273', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13ef', '12275', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdc13f0', '12274', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdd13f1', '12278', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdd13f2', '11740', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdd13f3', '11756', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdd13f4', '11825', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdd13f5', '11832', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdd13f6', '11836', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdd13f7', '11845', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdd13f8', '11852', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdd13f9', '11857', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdd13fa', '11864', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdd13fb', '11873', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdd13fc', '11883', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdd13fd', '11889', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdd13fe', '11894', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdd13ff', '11901', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdd1400', '11907', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdd1401', '11915', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdd1402', '11917', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdd1403', '11927', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdd1404', '11930', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdd1405', '11940', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdd1406', '11948', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdd1407', '11956', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdd1408', '11980', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdd1409', '11983', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdd140a', '11999', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdd140b', '12025', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdd140c', '12028', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdd140d', '12038', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdd140e', '12047', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdd140f', '12061', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdd1410', '12076', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdd1411', '12080', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdd1412', '12090', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdd1413', '12099', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdd1414', '12106', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdd1415', '12111', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdd1416', '12109', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdd1417', '12113', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdd1418', '12115', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdd1419', '12119', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdd141a', '12122', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdd141b', '12125', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdd141c', '12127', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdd141d', '12132', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdd141e', '12135', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde141f', '12142', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde1420', '12140', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde1421', '12139', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde1422', '12149', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde1423', '12148', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde1424', '12147', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde1425', '12154', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde1426', '12153', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde1427', '12152', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde1428', '12162', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde1429', '12161', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde142a', '12159', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde142b', '12166', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde142c', '12169', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde142d', '12176', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde142e', '12181', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde142f', '12179', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde1430', '12187', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde1431', '12191', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde1432', '12196', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde1433', '12198', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde1434', '12203', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde1435', '12207', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde1436', '12204', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde1437', '12215', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde1438', '12214', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde1439', '12221', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde143a', '12218', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde143b', '12226', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde143c', '12225', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde143d', '12233', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde143e', '11743', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde143f', '11747', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde1440', '11749', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde1441', '11755', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde1442', '11760', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde1443', '11761', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde1444', '11763', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde1445', '11765', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde1446', '11784', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde1447', '11788', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde1448', '11790', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde1449', '11796', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde144a', '11793', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde144b', '11803', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde144c', '11805', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde144d', '11810', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde144e', '11816', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde144f', '11818', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde1450', '11822', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde1451', '11824', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde1452', '11829', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fde1453', '11830', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf1454', '11835', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf1455', '11846', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf1456', '11848', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf1457', '11856', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf1458', '11865', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf1459', '11868', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf145a', '11871', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf145b', '11877', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf145c', '11876', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf145d', '11881', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf145e', '11885', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf145f', '11893', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf1460', '11896', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf1461', '11902', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf1462', '11909', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf1463', '11910', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf1464', '11914', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf1465', '11919', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf1466', '11918', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf1467', '11926', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf1468', '11924', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf1469', '11933', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf146a', '11931', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf146b', '11939', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf146c', '11938', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf146d', '11945', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf146e', '11944', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf146f', '11951', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf1470', '11950', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf1471', '11959', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf1472', '11962', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf1473', '11971', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf1474', '11975', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf1475', '11977', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf1476', '11976', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf1477', '11987', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf1478', '11986', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf1479', '11991', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf147a', '11990', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf147b', '11996', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf147c', '12004', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf147d', '12010', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf147e', '12009', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf147f', '12017', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf1480', '12019', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf1481', '12020', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf1482', '12022', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf1483', '12032', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf1484', '12033', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf1485', '12039', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf1486', '12046', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf1487', '12053', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf1488', '12060', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf1489', '12091', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fdf148a', '12097', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe0148b', '11739', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe0148c', '11754', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe0148d', '11766', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe0148e', '11767', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe0148f', '11770', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe01490', '11771', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe01491', '11776', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe01492', '11773', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe01493', '11779', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe01494', '11782', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe01495', '11787', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe01496', '11792', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe01497', '11794', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe01498', '11802', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe01499', '11808', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe0149a', '11814', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe0149b', '11820', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe0149c', '11828', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe0149d', '11831', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe0149e', '11838', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe0149f', '11837', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe014a0', '11844', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe014a1', '11858', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe014a2', '11866', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe014a3', '11867', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe014a4', '11874', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe014a5', '11879', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe014a6', '11884', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe014a7', '11888', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe014a8', '11886', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe014a9', '11892', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe014aa', '11895', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe014ab', '11897', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe014ac', '11899', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe014ad', '11906', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe014ae', '11904', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe014af', '11913', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe014b0', '11916', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe014b1', '11923', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe014b2', '11935', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe014b3', '11942', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe014b4', '11954', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe014b5', '11958', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe014b6', '11964', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe014b7', '11967', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe014b8', '11970', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe014b9', '11969', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe014ba', '11979', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe014bb', '11978', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe014bc', '11984', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe014bd', '11989', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe014be', '11994', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe014bf', '11997', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe014c0', '12001', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe114c1', '12002', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe114c2', '12006', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe114c3', '12012', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe114c4', '12013', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe114c5', '12021', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe114c6', '12027', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe114c7', '12035', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe114c8', '12040', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe114c9', '12043', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe114ca', '12052', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe114cb', '12057', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe114cc', '12059', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe114cd', '12064', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe114ce', '12067', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe114cf', '12071', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe114d0', '12077', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe114d1', '12079', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe114d2', '12081', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe114d3', '12089', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe114d4', '12088', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe114d5', '12094', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe114d6', '12093', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe114d7', '12103', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe114d8', '12298', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe114d9', '12300', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe114da', '12311', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe114db', '12353', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe114dc', '12363', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe114dd', '12370', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe114de', '12380', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe114df', '12387', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe114e0', '12421', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe114e1', '12429', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe114e2', '12433', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe114e3', '12443', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe114e4', '12446', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe114e5', '12454', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe114e6', '12457', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe114e7', '12468', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe114e8', '12476', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe114e9', '12479', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe114ea', '12485', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe214eb', '12489', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe214ec', '12500', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe214ed', '12502', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe214ee', '12510', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe214ef', '12516', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe214f0', '12524', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe214f1', '12528', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe214f2', '12538', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe214f3', '12549', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe214f4', '12550', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe214f5', '12555', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe214f6', '12561', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe214f7', '12567', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe214f8', '12574', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe214f9', '12584', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe214fa', '12585', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe214fb', '12594', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe214fc', '12599', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe214fd', '12610', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe214fe', '12625', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe214ff', '12659', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe21500', '12665', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe21501', '12672', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe21502', '12680', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe21503', '12687', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe21504', '12690', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe21505', '12697', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe21506', '12727', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe21507', '12737', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe21508', '12740', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe21509', '12747', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe2150a', '12757', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe2150b', '12761', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe2150c', '12771', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe2150d', '12775', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe2150e', '12786', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe2150f', '12788', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe21510', '12796', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe21511', '12804', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe21512', '12812', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe21513', '12818', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe21514', '12823', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe21515', '12833', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe21516', '12838', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe21517', '12840', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe21518', '12864', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe21519', '12868', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe2151a', '12876', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe2151b', '12884', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe2151c', '12893', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe2151d', '12899', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe2151e', '12907', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe2151f', '12912', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe21520', '12931', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe21521', '12930', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe31522', '12936', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe31523', '12935', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe31524', '12941', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffc18d3', '13567', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffc18d4', '13570', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffc18d5', '13569', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffc18d6', '13568', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffc18d7', '12947', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffc18d8', '12962', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffc18d9', '12971', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffc18da', '12981', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffc18db', '12988', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffc18dc', '13007', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffd18dd', '13019', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffd18de', '13032', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffd18df', '13044', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffd18e0', '13048', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffd18e1', '13056', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffd18e2', '13070', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffd18e3', '13080', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffd18e4', '13089', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffd18e5', '13096', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffd18e6', '13106', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffd18e7', '13115', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffd18e8', '13127', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffd18e9', '13139', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffd18ea', '13143', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffd18eb', '13161', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffd18ec', '13166', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffd18ed', '13179', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffd18ee', '13190', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffd18ef', '13192', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffd18f0', '13205', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffd18f1', '13223', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffd18f2', '13235', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffd18f3', '13240', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffd18f4', '13253', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffd18f5', '13259', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffd18f6', '13276', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffd18f7', '13280', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffd18f8', '13289', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffd18f9', '13293', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffd18fa', '13310', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffd18fb', '13319', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffd18fc', '13322', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffd18fd', '13329', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffd18fe', '13344', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fff18ff', '13349', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fff1900', '13358', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fff1901', '13370', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fff1902', '13375', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fff1903', '13384', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fff1904', '13382', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fff1905', '13390', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fff1906', '13389', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fff1907', '13392', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fff1908', '13395', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fff1909', '13394', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fff190a', '13397', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fff190b', '13406', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fff190c', '13409', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fff190d', '13417', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fff190e', '13415', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fff190f', '13418', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fff1910', '13427', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fff1911', '13424', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fff1912', '13433', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fff1913', '13435', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fff1914', '13440', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fff1915', '13439', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fff1916', '13446', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fff1917', '13445', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fff1918', '13447', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fff1919', '13451', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fff191a', '13453', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fff191b', '13452', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fff191c', '13456', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fff191d', '13459', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fff191e', '13458', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fff191f', '13466', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fff1920', '13462', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fff1921', '13467', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fff1922', '13469', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30001923', '13472', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30001924', '13479', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30001925', '13477', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30001926', '13483', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30001927', '13484', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30001928', '13489', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30001929', '13491', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3000192a', '13490', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3000192b', '13500', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3000192c', '13506', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3000192d', '12953', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3000192e', '12952', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3000192f', '12957', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30001930', '12958', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30001931', '12959', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30001932', '12961', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30001933', '12966', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30001934', '12974', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30001935', '12970', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30001936', '12979', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30001937', '12987', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30001938', '12990', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30001939', '12996', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3000193a', '12999', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3000193b', '13002', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3000193c', '13013', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3000193d', '13009', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3000193e', '13020', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3000193f', '13023', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30011940', '13031', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30011941', '13030', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30011942', '13039', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30011943', '13038', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30011944', '13050', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30011945', '13049', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30011946', '13059', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30011947', '13062', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30011948', '13066', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30011949', '13072', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3001194a', '13081', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3001194b', '13078', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3001194c', '13090', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3001194d', '13093', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3001194e', '13100', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3001194f', '13103', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30011950', '13110', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30011951', '13104', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30011952', '13118', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30011953', '13114', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30011954', '13128', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30011955', '13132', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30011956', '13140', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30011957', '13142', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30011958', '13148', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30011959', '13150', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3001195a', '13157', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3001195b', '13154', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3001195c', '13165', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3001195d', '13170', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3001195e', '13172', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3001195f', '13176', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30011960', '13188', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30011961', '13182', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30011962', '13195', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30011963', '13193', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30011964', '13207', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30011965', '13208', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30011966', '13211', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30011967', '13213', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30011968', '13225', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30011969', '13222', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3001196a', '13227', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3001196b', '13226', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3001196c', '13244', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3001196d', '13245', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3001196e', '13249', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3001196f', '13254', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30011970', '13257', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fea1660', '12708', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fea1661', '12712', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fea1662', '12714', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fea1663', '12715', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fea1664', '12720', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fea1665', '12724', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fea1666', '12726', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fea1667', '12729', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fea1668', '12735', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fea1669', '12734', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fea166a', '12738', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fea166b', '12739', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fea166c', '12743', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fea166d', '12745', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fea166e', '12749', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fea166f', '12748', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fea1670', '12753', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fea1671', '12754', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fea1672', '12756', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fea1673', '12760', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fea1674', '12762', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fea1675', '12767', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fea1676', '12770', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fea1677', '12769', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fea1678', '12777', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fea1679', '12780', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fea167a', '12279', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb167b', '12281', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb167c', '12290', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb167d', '12296', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb167e', '12303', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb167f', '12309', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb1680', '12317', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb1681', '12322', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb1682', '12330', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb1683', '12333', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb1684', '12344', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb1685', '12351', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb1686', '12358', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb1687', '12366', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb1688', '12373', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb1689', '12409', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb168a', '12413', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb168b', '12417', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb168c', '12424', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb168d', '12427', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb168e', '12436', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb168f', '12439', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb1690', '12449', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb1691', '12451', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb1692', '12461', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb1693', '12466', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb1694', '12471', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb1695', '12484', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb1696', '12493', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb1697', '12520', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb1698', '12526', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb1699', '12533', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb169a', '12544', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb169b', '12553', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb169c', '12560', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb169d', '12569', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb169e', '12578', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb169f', '12581', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb16a0', '12588', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb16a1', '12598', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb16a2', '12617', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb16a3', '12624', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb16a4', '12631', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb16a5', '12637', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb16a6', '12655', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb16a7', '12673', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb16a8', '12677', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb16a9', '12683', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb16aa', '12689', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb16ab', '12694', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb16ac', '12704', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb16ad', '12710', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb16ae', '12716', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb16af', '12723', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb16b0', '12730', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2feb16b1', '12742', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fec16b2', '12750', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fec16b3', '12755', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fec16b4', '12763', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fec16b5', '12768', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fec16b6', '12779', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fec16b7', '12781', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fec16b8', '12785', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fec16b9', '12784', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fec16ba', '12790', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fec16bb', '12789', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fec16bc', '12791', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fec16bd', '12795', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fec16be', '12794', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fec16bf', '12799', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fec16c0', '12802', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fec16c1', '12805', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fec16c2', '12806', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fec16c3', '12810', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fec16c4', '12809', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fec16c5', '12811', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fec16c6', '12815', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fec16c7', '12814', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fec16c8', '12819', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fec16c9', '12822', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fec16ca', '12821', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fec16cb', '12286', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fec16cc', '12314', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fec16cd', '12326', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fec16ce', '12332', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fec16cf', '12342', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fec16d0', '12346', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fec16d1', '12356', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fec16d2', '12399', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fec16d3', '12407', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fec16d4', '12431', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fec16d5', '12435', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fec16d6', '12440', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fec16d7', '12445', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fec16d8', '12469', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fec16d9', '12472', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fec16da', '12480', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fec16db', '12482', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fec16dc', '12490', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fec16dd', '12496', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fec16de', '12503', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fed16df', '12509', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fed16e0', '12517', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fed16e1', '12523', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fed16e2', '12530', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fed16e3', '12535', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fed16e4', '12540', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fed16e5', '12604', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fed16e6', '12607', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fed16e7', '12634', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fed16e8', '12642', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fed16e9', '12654', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fed16ea', '12664', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fed16eb', '12682', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fed16ec', '12701', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fed16ed', '12732', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fed16ee', '12774', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fed16ef', '12776', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fed16f0', '12783', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fed16f1', '12793', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fed16f2', '12801', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fed16f3', '12825', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fed16f4', '12827', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fed16f5', '12830', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fed16f6', '12829', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fed16f7', '12836', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fed16f8', '12835', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fed16f9', '12843', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fed16fa', '12842', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fed16fb', '12848', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fed16fc', '12846', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff1179a', '13133', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff1179b', '13147', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff1179c', '13151', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff1179d', '13153', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff1179e', '13160', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff1179f', '13164', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff117a0', '13162', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff117a1', '13181', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff117a2', '13180', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff117a3', '13183', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff117a4', '13189', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff117a5', '13191', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff117a6', '13200', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff117a7', '13209', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff117a8', '13210', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff117a9', '13215', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff117aa', '13218', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff117ab', '13216', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff117ac', '13229', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff117ad', '13228', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff117ae', '13237', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff117af', '13236', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff117b0', '13248', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff117b1', '13246', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff117b2', '13264', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff117b3', '13262', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff117b4', '13265', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff117b5', '13274', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff217b6', '13277', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff217b7', '13281', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff217b8', '13284', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff217b9', '13287', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff217ba', '13292', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff217bb', '13295', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff217bc', '13297', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff217bd', '13302', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff217be', '13303', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff217bf', '13313', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff217c0', '13315', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff217c1', '13328', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff217c2', '13336', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff217c3', '13335', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff217c4', '13342', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff217c5', '13343', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff217c6', '13351', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff217c7', '13350', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff217c8', '13357', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff217c9', '13356', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff217ca', '13359', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff217cb', '13363', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff217cc', '13365', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff217cd', '13371', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff217ce', '13367', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff217cf', '13374', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff217d0', '13372', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff217d1', '12949', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff217d2', '12954', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff217d3', '12965', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff217d4', '12972', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff317d5', '12983', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff317d6', '12997', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff317d7', '13004', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff317d8', '13011', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff317d9', '13022', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff317da', '13035', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff317db', '13041', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff317dc', '13051', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff317dd', '13058', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff317de', '13067', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff317df', '13075', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff317e0', '13091', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff317e1', '13094', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff317e2', '13107', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff317e3', '13119', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff317e4', '13129', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff317e5', '13137', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff317e6', '13155', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff317e7', '13168', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff317e8', '13177', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff317e9', '13185', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff317ea', '13197', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff317eb', '13206', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff317ec', '13212', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff317ed', '13224', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff317ee', '13234', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff317ef', '13241', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff317f0', '13256', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff317f1', '13269', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff317f2', '13291', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff317f3', '13300', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff317f4', '13307', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff317f5', '13333', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff317f6', '13340', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff317f7', '13368', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff317f8', '13380', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff317f9', '13378', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff317fa', '13376', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff317fb', '13381', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff317fc', '13388', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff317fd', '13387', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff317fe', '13393', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff317ff', '13401', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff31800', '13400', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff31801', '13399', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff31802', '13407', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff31803', '13405', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff31804', '13404', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff51805', '13411', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff51806', '13416', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff51807', '13414', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff51808', '13413', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff51809', '13420', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff5180a', '13421', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff5180b', '13425', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff5180c', '13423', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff5180d', '13428', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff5180e', '13429', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff5180f', '13432', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff51810', '13431', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff51811', '13434', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff51812', '13438', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff51813', '13437', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff51814', '13441', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff51815', '13442', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff51816', '13443', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff51817', '13444', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff51818', '13448', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff51819', '13450', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff5181a', '13449', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff5181b', '13454', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff5181c', '13457', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff5181d', '13455', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff5181e', '13461', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff5181f', '13465', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff51820', '13463', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff51821', '13468', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff51822', '13473', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff51823', '13470', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff51824', '13476', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff51825', '13481', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff51826', '13480', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff51827', '13482', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff51828', '12955', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff51829', '12960', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff5182a', '12969', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff5182b', '12985', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff5182c', '12994', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff5182d', '13005', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff5182e', '13015', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff5182f', '13025', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff51830', '13034', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff51831', '13045', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff51832', '13046', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff51833', '13073', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff51834', '13077', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff61835', '13098', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff61836', '13111', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff61837', '13120', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff61838', '13126', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff61839', '13136', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff6183a', '13146', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff6183b', '13152', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff6183c', '13171', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff6183d', '13173', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff6183e', '13186', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff6183f', '13196', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff61840', '13204', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff61841', '13220', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff61842', '13231', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff61843', '13239', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff61844', '13247', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff61845', '13260', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff61846', '13270', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff61847', '13306', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff61848', '13309', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff61849', '13331', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff6184a', '13334', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff6184b', '13339', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff6184c', '13346', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff6184d', '13353', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff6184e', '13360', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff6184f', '13373', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff61850', '13377', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff61851', '13391', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff61852', '13396', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff61853', '13410', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff61854', '13419', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff61855', '13422', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff61856', '13474', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff61857', '13475', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff61858', '13486', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff61859', '13485', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff7185a', '13488', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff7185b', '13487', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff7185c', '13493', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff7185d', '13495', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff7185e', '13499', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff7185f', '13497', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff71860', '13496', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff71861', '13501', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff71862', '13505', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff71863', '13504', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff71864', '13502', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff71865', '13511', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff71866', '13510', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff71867', '13509', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff71868', '13508', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff71869', '13513', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff7186a', '13514', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff7186b', '13515', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff7186c', '13518', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff7186d', '13517', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff7186e', '13516', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff7186f', '13520', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff71870', '13519', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff71871', '13521', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff71872', '13525', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff71873', '13524', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff71874', '13523', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff71875', '13527', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff71876', '13526', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff71877', '13531', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff71878', '13529', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff71879', '13528', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff7187a', '13533', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff7187b', '13532', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff7187c', '13538', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff7187d', '13537', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff7187e', '13535', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff7187f', '13534', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff71880', '12973', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff71881', '12984', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff71882', '12991', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff71883', '13003', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff91884', '13012', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff91885', '13017', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff91886', '13028', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff91887', '13037', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff91888', '13047', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff91889', '13061', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff9188a', '13068', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff9188b', '13082', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff9188c', '13087', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff9188d', '13095', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff9188e', '13117', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff9188f', '13125', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff91890', '13138', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff91891', '13149', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff91892', '13158', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff91893', '13167', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff91894', '13175', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff91895', '13184', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff91896', '13198', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff91897', '13201', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff91898', '13219', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff91899', '13232', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff9189a', '13243', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffa189b', '13250', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffa189c', '13261', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffa189d', '13266', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffa189e', '13275', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffa189f', '13326', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffa18a0', '13345', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffa18a1', '13352', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffa18a2', '13379', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffa18a3', '13386', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffa18a4', '13402', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffa18a5', '13408', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffa18a6', '13412', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffa18a7', '13426', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffa18a8', '13430', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffa18a9', '13436', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffa18aa', '13460', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffa18ab', '13464', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffa18ac', '13471', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffa18ad', '13478', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffa18ae', '13494', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffa18af', '13492', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffa18b0', '13498', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffa18b1', '13503', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffb18b2', '13507', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffb18b3', '13512', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffb18b4', '13522', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffb18b5', '13530', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffb18b6', '13536', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffb18b7', '13539', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffb18b8', '13544', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffb18b9', '13542', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffb18ba', '13543', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffb18bb', '13541', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffb18bc', '13540', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffb18bd', '13545', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffc18be', '13547', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffc18bf', '13546', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffc18c0', '13548', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffc18c1', '13551', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffc18c2', '13550', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffc18c3', '13549', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffc18c4', '13554', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffc18c5', '13553', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffc18c6', '13552', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffc18c7', '13557', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffc18c8', '13556', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffc18c9', '13555', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffc18ca', '13558', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffc18cb', '13559', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffc18cc', '13561', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffc18cd', '13560', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffc18ce', '13564', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffc18cf', '13563', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffc18d0', '13562', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffc18d1', '13566', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ffc18d2', '13565', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fed16fd', '12845', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fed16fe', '12849', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fed16ff', '12851', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fed1700', '12854', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fed1701', '12853', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fed1702', '12857', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fed1703', '12860', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fed1704', '12858', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fed1705', '12862', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fed1706', '12865', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fed1707', '12867', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fed1708', '12866', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fed1709', '12869', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fed170a', '12874', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fed170b', '12873', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fed170c', '12875', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fed170d', '12877', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fee170e', '12880', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fee170f', '12883', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fee1710', '12881', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fee1711', '12888', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fee1712', '12887', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fee1713', '12892', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fee1714', '12891', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fee1715', '12890', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fee1716', '12896', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fee1717', '12902', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fee1718', '12901', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fee1719', '12900', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fee171a', '12904', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fee171b', '12903', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fee171c', '12908', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fee171d', '12906', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fee171e', '12905', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fee171f', '12909', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fee1720', '12293', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fee1721', '12295', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fee1722', '12304', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fee1723', '12306', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fee1724', '12335', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fee1725', '12347', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fee1726', '12355', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fee1727', '12362', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fee1728', '12371', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fee1729', '12379', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fee172a', '12384', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fee172b', '12388', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fee172c', '12392', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fee172d', '12408', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fef172e', '12463', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fef172f', '12475', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fef1730', '12486', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fef1731', '12488', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fef1732', '12497', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fef1733', '12501', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fef1734', '12511', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fef1735', '12521', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fef1736', '12537', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fef1737', '12541', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fef1738', '12565', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fef1739', '12568', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fef173a', '12575', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fef173b', '12579', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fef173c', '12586', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fef173d', '12592', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fef173e', '12602', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fef173f', '12606', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fef1740', '12615', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fef1741', '12621', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fef1742', '12623', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fef1743', '12632', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fef1744', '12636', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fef1745', '12641', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fef1746', '12648', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fef1747', '12649', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fef1748', '12657', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fef1749', '12667', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fef174a', '12693', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fef174b', '12699', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fef174c', '12705', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fef174d', '12709', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fef174e', '12717', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fef174f', '12718', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fef1750', '12722', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fef1751', '12731', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fef1752', '12733', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fef1753', '12746', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fef1754', '12751', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fef1755', '12759', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fef1756', '12764', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fef1757', '12773', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fef1758', '12778', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fef1759', '12800', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fef175a', '12826', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fef175b', '12828', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fef175c', '12837', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fef175d', '12841', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fef175e', '12852', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff0175f', '12911', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff01760', '12910', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff01761', '12914', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff01762', '12913', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff01763', '12915', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff01764', '12916', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff01765', '12920', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff01766', '12919', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff01767', '12918', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff01768', '12917', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff01769', '12922', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff0176a', '12921', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff0176b', '12923', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff0176c', '12927', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff0176d', '12926', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff0176e', '12925', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff0176f', '12924', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff01770', '12929', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff01771', '12928', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff01772', '12934', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff01773', '12933', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff01774', '12932', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff01775', '12948', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff01776', '12964', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff01777', '12967', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff01778', '12975', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff01779', '12978', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff0177a', '12982', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff0177b', '12993', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff0177c', '12995', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff0177d', '13001', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff0177e', '13006', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff0177f', '13010', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff01780', '13016', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff11781', '13018', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff11782', '13024', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff11783', '13027', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff11784', '13029', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff11785', '13043', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff11786', '13040', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff11787', '13052', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff11788', '13055', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff11789', '13057', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff1178a', '13063', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff1178b', '13071', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff1178c', '13065', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff1178d', '13079', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff1178e', '13083', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff1178f', '13085', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff11790', '13092', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff11791', '13099', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff11792', '13102', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff11793', '13105', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff11794', '13112', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff11795', '13113', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff11796', '13121', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff11797', '13124', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff11798', '13130', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2ff11799', '13134', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30011971', '13263', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30011972', '13272', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30011973', '13278', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30021974', '13283', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30021975', '13282', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30021976', '13286', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30021977', '13298', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30021978', '13304', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30021979', '13312', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3002197a', '13318', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3002197b', '13317', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3002197c', '13321', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3002197d', '13323', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3002197e', '13325', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3002197f', '13330', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30021980', '13338', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30021981', '13348', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30021982', '13354', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30021983', '13362', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30021984', '13369', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30021985', '13366', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30021986', '13383', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30021987', '13385', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30021988', '13398', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30021989', '13403', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3002198a', '12943', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3002198b', '12950', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3002198c', '12951', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3002198d', '12956', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3002198e', '12963', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3002198f', '12968', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30021990', '12977', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30021991', '12976', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30021992', '12980', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30021993', '12986', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30021994', '12992', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30021995', '12989', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30021996', '13000', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30021997', '12998', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30031998', '13008', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30031999', '13014', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3003199a', '13021', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3003199b', '13026', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3003199c', '13033', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3003199d', '13036', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3003199e', '13042', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3003199f', '13054', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300319a0', '13053', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300319a1', '13060', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300319a2', '13064', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300319a3', '13069', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300319a4', '13074', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300319a5', '13076', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300319a6', '13084', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300319a7', '13088', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300319a8', '13086', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300319a9', '13097', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300319aa', '13101', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300319ab', '13109', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300319ac', '13108', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300319ad', '13116', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300319ae', '13122', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300319af', '13123', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300319b0', '13131', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300319b1', '13135', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300319b2', '13141', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300319b3', '13145', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300319b4', '13144', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300319b5', '13156', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300319b6', '13159', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300319b7', '13163', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300319b8', '13169', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300319b9', '13178', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300319ba', '13174', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300319bb', '13187', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300319bc', '13194', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300319bd', '13199', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300319be', '13203', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300319bf', '13202', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300319c0', '13214', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300319c1', '13221', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300319c2', '13217', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300319c3', '13233', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300319c4', '13230', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300319c5', '13242', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300319c6', '13238', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300419c7', '13251', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300419c8', '13252', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300419c9', '13258', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300419ca', '13255', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300419cb', '13267', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300419cc', '13268', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300419cd', '13273', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300419ce', '13271', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300419cf', '13279', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300419d0', '13285', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300419d1', '13290', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300419d2', '13288', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300419d3', '13294', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300419d4', '13296', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300419d5', '13299', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300419d6', '13301', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300419d7', '13305', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300419d8', '13308', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300419d9', '13311', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300419da', '13314', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300419db', '13316', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300419dc', '13320', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300419dd', '13324', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300419de', '13327', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300419df', '13332', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300419e0', '13337', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300419e1', '13341', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300419e2', '13347', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300419e3', '13355', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300419e4', '13361', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300419e5', '13364', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300419e6', '13576', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300419e7', '13581', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300419e8', '13586', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300419e9', '13588', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300419ea', '13589', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300419eb', '13597', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300419ec', '13604', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300419ed', '13610', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300419ee', '13617', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300419ef', '13624', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300419f0', '13632', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300419f1', '13674', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300419f2', '13694', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300519f3', '13701', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300519f4', '13708', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300519f5', '13718', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300519f6', '13719', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300519f7', '13723', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300519f8', '13730', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300519f9', '13736', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300519fa', '13745', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300519fb', '13749', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300519fc', '13756', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300519fd', '13766', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300519fe', '13772', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300519ff', '13806', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30051a00', '13809', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30051a01', '13817', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30051a02', '13822', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30051a03', '13830', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30051a04', '13833', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30051a05', '13844', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30051a06', '13854', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30051a07', '13858', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30051a08', '13882', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30051a09', '13887', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30051a0a', '13892', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30051a0b', '13903', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30051a0c', '13909', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30051a0d', '13920', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30051a0e', '13928', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30051a0f', '13977', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30051a10', '13984', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30051a11', '13989', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30051a12', '13999', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30051a13', '14010', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30051a14', '14018', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30051a15', '14026', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30051a16', '14041', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30051a17', '14058', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30051a18', '14067', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30051a19', '14168', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30051a1a', '14169', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30051a1b', '14180', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30051a1c', '14181', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30051a1d', '14193', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30051a1e', '14197', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30061a1f', '14204', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30061a20', '14203', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30061a21', '14207', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30061a22', '14211', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30061a23', '14210', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30061a24', '14209', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30061a25', '14208', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30061a26', '14213', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30061a27', '14212', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30061a28', '14214', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30061a29', '14217', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30061a2a', '14216', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30061a2b', '14215', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30061a2c', '14219', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30061a2d', '14218', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30061a2e', '14222', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30061a2f', '14221', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30061a30', '14220', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30061a31', '14224', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30061a32', '14223', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30061a33', '14228', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30061a34', '14227', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30061a35', '14226', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30061a36', '14225', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30061a37', '14230', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30061a38', '13572', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30061a39', '13577', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30061a3a', '13584', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30061a3b', '13591', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30061a3c', '13595', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30061a3d', '13605', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30061a3e', '13609', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30061a3f', '13621', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30061a40', '13626', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30061a41', '13631', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30061a42', '13634', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30061a43', '13638', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30061a44', '13636', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30061a45', '13647', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30071a46', '13645', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30071a47', '13650', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30071a48', '13655', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30071a49', '13657', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30071a4a', '13664', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30071a4b', '13669', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30071a4c', '13671', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30071a4d', '13675', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30071a4e', '13678', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30071a4f', '13680', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30071a50', '13682', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30081a51', '13686', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30081a52', '13691', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30081a53', '13693', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30081a54', '13698', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30081a55', '13702', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30081a56', '13705', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30081a57', '13710', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30081a58', '13717', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30081a59', '13725', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30081a5a', '13732', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30081a5b', '13734', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30081a5c', '13740', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30081a5d', '13739', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30081a5e', '13743', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30081a5f', '13753', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30081a60', '13759', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30081a61', '13764', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30081a62', '13770', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30081a63', '13771', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30081a64', '13774', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30081a65', '13776', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30081a66', '13783', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30081a67', '13785', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30081a68', '13786', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30081a69', '13790', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30081a6a', '13794', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30081a6b', '13797', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30081a6c', '13800', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30081a6d', '13808', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091a6e', '13820', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091a6f', '13821', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091a70', '13826', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091a71', '13831', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091a72', '13829', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091a73', '13836', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091a74', '13834', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091a75', '13842', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091a76', '13839', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091a77', '13849', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091a78', '13845', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091a79', '13856', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091a7a', '13852', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091a7b', '13861', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091a7c', '13863', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091a7d', '13867', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091a7e', '13870', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091a7f', '13877', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091a80', '13883', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091a81', '13886', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091a82', '13893', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091a83', '13897', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091a84', '13900', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091a85', '13899', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091a86', '13907', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091a87', '13906', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091a88', '13912', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091a89', '13913', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091a8a', '13606', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091a8b', '13614', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091a8c', '13619', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091a8d', '13623', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091a8e', '13635', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091a8f', '13637', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091a90', '13646', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091a91', '13649', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091a92', '13658', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091a93', '13662', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091a94', '13758', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091a95', '13767', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091a96', '13769', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091a97', '13775', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091a98', '13782', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091a99', '13795', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091a9a', '13799', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091a9b', '13813', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091a9c', '13816', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091a9d', '13823', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091a9e', '13828', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091a9f', '13835', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091aa0', '13841', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091aa1', '13846', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30091aa2', '13862', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300a1aa3', '13868', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300a1aa4', '13876', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300a1aa5', '13919', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300a1aa6', '13921', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300a1aa7', '13922', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300a1aa8', '13927', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300a1aa9', '13932', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715c2', '12856', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715c3', '12855', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715c4', '12859', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715c5', '12861', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715c6', '12863', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715c7', '12870', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715c8', '12872', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715c9', '12871', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715ca', '12879', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715cb', '12878', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715cc', '12882', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715cd', '12885', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715ce', '12886', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715cf', '12889', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715d0', '12895', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715d1', '12894', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715d2', '12897', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715d3', '12898', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715d4', '12276', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715d5', '12280', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715d6', '12284', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715d7', '12291', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715d8', '12292', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715d9', '12294', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715da', '12305', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715db', '12307', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715dc', '12318', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715dd', '12325', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715de', '12331', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715df', '12338', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715e0', '12343', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715e1', '12352', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715e2', '12364', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715e3', '12374', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715e4', '12375', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe715e5', '12383', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe815e6', '12389', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe815e7', '12396', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe815e8', '12398', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe815e9', '12400', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe815ea', '12403', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe815eb', '12406', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe815ec', '12411', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe815ed', '12414', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe815ee', '12416', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe815ef', '12420', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe815f0', '12422', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe815f1', '12428', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe815f2', '12434', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe815f3', '12442', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe815f4', '12441', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe815f5', '12448', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe815f6', '12447', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe815f7', '12453', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe815f8', '12452', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe815f9', '12460', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe815fa', '12458', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe815fb', '12467', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe815fc', '12464', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe815fd', '12470', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe815fe', '12477', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe815ff', '12478', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe81600', '12481', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe81601', '12492', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe81602', '12491', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe81603', '12499', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe81604', '12498', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe81605', '12506', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe81606', '12505', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe81607', '12512', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe81608', '12519', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe81609', '12532', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe8160a', '12539', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe8160b', '12543', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe8160c', '12542', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe8160d', '12551', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe8160e', '12557', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe8160f', '12556', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe81610', '12564', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe81611', '12563', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe81612', '12572', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe91613', '12570', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe91614', '12580', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe91615', '12589', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe91616', '12590', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe91617', '12593', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe91618', '12595', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe91619', '12601', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe9161a', '12603', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe9161b', '12608', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe9161c', '12611', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe9161d', '12614', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe9161e', '12620', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe9161f', '12627', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe91620', '12638', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe91621', '12644', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe91622', '12647', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe91623', '12650', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe91624', '12651', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe91625', '12656', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe91626', '12277', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe91627', '12283', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe91628', '12287', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe91629', '12299', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe9162a', '12308', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe9162b', '12316', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe9162c', '12324', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe9162d', '12327', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe9162e', '12336', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe9162f', '12340', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe91630', '12348', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe91631', '12357', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe91632', '12361', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe91633', '12368', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe91634', '12377', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe91635', '12381', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe91636', '12391', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe91637', '12394', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe91638', '12401', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe91639', '12405', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe9163a', '12415', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe9163b', '12419', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe9163c', '12425', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe9163d', '12432', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe9163e', '12455', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe9163f', '12462', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe91640', '12474', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe91641', '12487', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe91642', '12547', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe91643', '12552', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe91644', '12559', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe91645', '12566', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe91646', '12576', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe91647', '12583', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe91648', '12591', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fe91649', '12612', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fea164a', '12626', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fea164b', '12635', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fea164c', '12643', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fea164d', '12646', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fea164e', '12652', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fea164f', '12660', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fea1650', '12662', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fea1651', '12663', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fea1652', '12668', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fea1653', '12670', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fea1654', '12669', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fea1655', '12679', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fea1656', '12676', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fea1657', '12681', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fea1658', '12685', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fea1659', '12688', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fea165a', '12691', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fea165b', '12696', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fea165c', '12700', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fea165d', '12703', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fea165e', '12702', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a2fea165f', '12706', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30261e58', '14302', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30261e59', '14305', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30261e5a', '14308', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30261e5b', '14310', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30261e5c', '14312', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30261e5d', '14314', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30261e5e', '14317', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30261e5f', '14324', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30261e60', '14323', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30261e61', '14325', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30261e62', '14332', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30261e63', '14337', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30261e64', '14342', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30261e65', '14343', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30261e66', '14347', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30261e67', '14350', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30261e68', '14349', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30261e69', '14355', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30261e6a', '14357', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30261e6b', '14365', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30261e6c', '14363', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30261e6d', '14372', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30261e6e', '14373', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30261e6f', '14379', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30261e70', '14377', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30261e71', '14381', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30261e72', '14387', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30271e73', '14394', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30271e74', '14397', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30271e75', '14399', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30271e76', '14398', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30271e77', '14406', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30271e78', '14412', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30271e79', '14417', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30271e7a', '14425', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30271e7b', '14421', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30271e7c', '14436', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30271e7d', '14438', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30271e7e', '14445', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30271e7f', '14453', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30271e80', '14459', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30271e81', '14468', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30271e82', '14467', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30271e83', '14475', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30271e84', '14487', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30271e85', '14486', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30271e86', '14498', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30271e87', '14492', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30271e88', '14506', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30271e89', '14509', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30271e8a', '14516', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30271e8b', '14522', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30271e8c', '14523', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30271e8d', '14531', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30281e8e', '14532', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30281e8f', '14543', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30281e90', '14545', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30281e91', '14773', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30281e92', '14781', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30281e93', '14784', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30281e94', '14794', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30281e95', '14796', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30281e96', '14804', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30281e97', '14809', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30281e98', '14822', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30281e99', '14865', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30281e9a', '14872', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30281e9b', '14879', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30281e9c', '14894', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30281e9d', '14903', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30281e9e', '14911', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30281e9f', '14912', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30281ea0', '14919', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30281ea1', '14929', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30291ea2', '14947', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30291ea3', '14948', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30291ea4', '14951', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30291ea5', '14960', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30291ea6', '15033', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30291ea7', '15037', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30291ea8', '15044', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30291ea9', '15049', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30291eaa', '15062', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30291eab', '15063', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30291eac', '15065', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30291ead', '15069', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30291eae', '15075', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30291eaf', '15082', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30291eb0', '15088', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30291eb1', '15108', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30291eb2', '15115', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30291eb3', '15119', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30291eb4', '15124', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30291eb5', '15131', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30291eb6', '15139', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30291eb7', '15144', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30291eb8', '15151', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30291eb9', '15155', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30291eba', '15182', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30291ebb', '15188', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30291ebc', '15191', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30291ebd', '15206', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30291ebe', '14766', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302a1ebf', '14770', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302a1ec0', '14776', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302a1ec1', '14782', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302a1ec2', '14785', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302a1ec3', '14793', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302a1ec4', '14797', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302a1ec5', '14803', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302a1ec6', '14808', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302a1ec7', '14812', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302a1ec8', '14814', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302a1ec9', '14820', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302a1eca', '14819', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302a1ecb', '14823', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302a1ecc', '14824', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302a1ecd', '14831', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302a1ece', '14833', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302a1ecf', '14838', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302a1ed0', '14841', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302a1ed1', '14846', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302a1ed2', '14852', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302a1ed3', '14858', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302a1ed4', '14863', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302a1ed5', '14870', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302a1ed6', '14878', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302a1ed7', '14883', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302a1ed8', '14885', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302a1ed9', '14888', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302a1eda', '14898', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302a1edb', '14897', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302a1edc', '14905', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302a1edd', '14913', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302a1ede', '14917', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302a1edf', '14922', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302a1ee0', '14925', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302a1ee1', '14935', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302b1ee2', '14934', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302b1ee3', '14939', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302b1ee4', '14940', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302b1ee5', '14944', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302b1ee6', '14943', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302b1ee7', '14954', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302b1ee8', '14956', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302b1ee9', '14961', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302b1eea', '14965', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302b1eeb', '14968', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302b1eec', '14969', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302b1eed', '14973', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302b1eee', '14975', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302b1eef', '14977', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302b1ef0', '14980', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302b1ef1', '14984', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302b1ef2', '14986', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302b1ef3', '14991', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302b1ef4', '14990', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30171be5', '13700', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301a1c83', '14321', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301b1c84', '14327', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301b1c85', '14334', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301b1c86', '14339', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301b1c87', '14351', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301b1c88', '14360', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301b1c89', '14366', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301b1c8a', '14367', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301b1c8b', '14380', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301b1c8c', '14384', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301b1c8d', '14391', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301b1c8e', '14392', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301b1c8f', '14404', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301b1c90', '14410', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301b1c91', '14422', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301b1c92', '14426', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301b1c93', '14429', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301b1c94', '14431', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301b1c95', '14435', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301b1c96', '14439', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301b1c97', '14443', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301b1c98', '14450', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301b1c99', '14458', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301b1c9a', '14462', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301b1c9b', '14472', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301b1c9c', '14471', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301b1c9d', '14478', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301b1c9e', '14480', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301b1c9f', '14488', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301b1ca0', '14484', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301b1ca1', '14496', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301b1ca2', '14494', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301b1ca3', '14504', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301b1ca4', '14503', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301b1ca5', '14508', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301b1ca6', '14507', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301b1ca7', '14514', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301b1ca8', '14517', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301b1ca9', '14518', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301b1caa', '14521', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301b1cab', '14527', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301b1cac', '14529', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301b1cad', '14534', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301b1cae', '14539', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301b1caf', '14542', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301b1cb0', '14547', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301b1cb1', '14549', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301c1cb2', '14552', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301c1cb3', '14551', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301c1cb4', '14555', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301c1cb5', '14559', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301c1cb6', '14558', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301c1cb7', '14565', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301c1cb8', '14568', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301c1cb9', '14572', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301c1cba', '14571', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301c1cbb', '14570', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301c1cbc', '14579', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301c1cbd', '14578', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301c1cbe', '14582', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301c1cbf', '14586', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301c1cc0', '14584', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301c1cc1', '14594', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301c1cc2', '14596', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301c1cc3', '14603', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301d1cc4', '14608', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301d1cc5', '14615', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301d1cc6', '14231', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301d1cc7', '14241', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301d1cc8', '14244', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301d1cc9', '14255', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301d1cca', '14263', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301d1ccb', '14304', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301d1ccc', '14313', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301d1ccd', '14356', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301d1cce', '14371', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301d1ccf', '14403', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301d1cd0', '14407', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301d1cd1', '14414', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301d1cd2', '14418', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301d1cd3', '14448', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301d1cd4', '14455', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301d1cd5', '14460', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301d1cd6', '14470', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301d1cd7', '14476', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301d1cd8', '14482', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301d1cd9', '14495', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301d1cda', '14513', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301d1cdb', '14526', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301d1cdc', '14536', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301d1cdd', '14538', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301d1cde', '14546', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301d1cdf', '14550', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301d1ce0', '14563', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301d1ce1', '14566', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301d1ce2', '14574', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301d1ce3', '14580', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301d1ce4', '14588', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301d1ce5', '14591', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301d1ce6', '14602', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301d1ce7', '14607', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301d1ce8', '14610', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301d1ce9', '14616', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301d1cea', '14619', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301d1ceb', '14620', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301e1cec', '14622', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301e1ced', '14623', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301e1cee', '14627', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301e1cef', '14630', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301e1cf0', '14632', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301e1cf1', '14636', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301e1cf2', '14637', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301e1cf3', '14639', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301e1cf4', '14638', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301e1cf5', '14640', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301e1cf6', '14642', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301e1cf7', '14641', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301f1cf8', '14645', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301f1cf9', '14648', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301f1cfa', '14647', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301f1cfb', '14646', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30201cfc', '14651', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30201cfd', '14654', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30201cfe', '14653', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30201cff', '14652', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30201d00', '14656', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30201d01', '14655', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30201d02', '14659', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30201d03', '14658', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30201d04', '14657', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30201d05', '14661', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30201d06', '14660', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30201d07', '14663', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30201d08', '14662', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30201d09', '14665', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30201d0a', '14664', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30201d0b', '14669', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30201d0c', '14670', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30201d0d', '14674', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30201d0e', '14673', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30201d0f', '14678', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30201d10', '14680', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30201d11', '14679', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30201d12', '14684', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30201d13', '14682', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30201d14', '14237', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30201d15', '14267', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30201d16', '14276', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30201d17', '14283', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30201d18', '14307', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30201d19', '14315', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30201d1a', '14322', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30201d1b', '14326', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30201d1c', '14335', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30201d1d', '14336', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30201d1e', '14344', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300a1aaa', '13937', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300a1aab', '13936', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300a1aac', '13945', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300a1aad', '13944', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300a1aae', '13946', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300a1aaf', '13952', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300a1ab0', '13951', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300d1ab1', '13960', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300d1ab2', '13959', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300d1ab3', '13964', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300d1ab4', '13973', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300d1ab5', '13971', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300d1ab6', '13969', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300d1ab7', '13981', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300d1ab8', '13985', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300d1ab9', '13993', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300d1aba', '13991', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300d1abb', '13990', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300d1abc', '14000', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300e1abd', '13997', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300e1abe', '14005', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300e1abf', '14006', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300e1ac0', '14017', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300e1ac1', '14015', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300e1ac2', '14014', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300e1ac3', '14021', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300e1ac4', '14027', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300e1ac5', '14031', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300e1ac6', '14038', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300e1ac7', '14040', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300e1ac8', '14047', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300e1ac9', '14056', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300e1aca', '14059', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300e1acb', '14062', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300e1acc', '14066', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300e1acd', '14070', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300e1ace', '14072', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300e1acf', '14080', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300e1ad0', '14079', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300e1ad1', '14087', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300e1ad2', '14086', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300e1ad3', '14091', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300e1ad4', '14093', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300e1ad5', '14098', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300e1ad6', '14101', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300e1ad7', '14103', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300e1ad8', '14106', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300e1ad9', '14112', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300e1ada', '14109', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300e1adb', '14117', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300e1adc', '14114', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300e1add', '14121', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300e1ade', '14122', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300e1adf', '13571', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300e1ae0', '13573', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300e1ae1', '13578', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300e1ae2', '13579', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300e1ae3', '13580', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300e1ae4', '13587', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300e1ae5', '13593', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300e1ae6', '13594', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300e1ae7', '13598', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300e1ae8', '13608', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300e1ae9', '13612', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300e1aea', '13616', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300e1aeb', '13625', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300e1aec', '13629', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300e1aed', '13639', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300e1aee', '13644', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300e1aef', '13651', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300e1af0', '13656', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300f1af1', '13665', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300f1af2', '13668', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300f1af3', '13672', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a300f1af4', '13676', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30121af5', '13685', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30121af6', '13687', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30121af7', '13695', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30121af8', '13712', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30121af9', '13714', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30121afa', '13716', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30121afb', '13722', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30121afc', '13724', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30121afd', '13727', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30121afe', '13733', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30121aff', '13742', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30121b00', '13748', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30121b01', '13752', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30121b02', '13760', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30121b03', '13762', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30121b04', '13768', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30121b05', '13773', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30121b06', '13781', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30121b07', '13787', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30121b08', '13791', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30121b09', '13793', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30121b0a', '13798', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30121b0b', '13801', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30121b0c', '13814', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30121b0d', '13840', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30121b0e', '13848', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30121b0f', '13853', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30121b10', '13860', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30121b11', '13865', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30121b12', '13872', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30121b13', '13878', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30121b14', '13896', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30121b15', '13901', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30121b16', '13905', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30121b17', '13910', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30121b18', '13911', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30121b19', '13918', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30121b1a', '13916', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30121b1b', '13925', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30121b1c', '13923', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30121b1d', '13931', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30121b1e', '13929', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30131b1f', '13938', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30131b20', '13943', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30131b21', '13953', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30131b22', '13954', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30131b23', '13958', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30131b24', '13961', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30131b25', '13967', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30131b26', '13966', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30131b27', '13972', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30131b28', '13976', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30131b29', '13978', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30131b2a', '13982', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30131b2b', '13992', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30131b2c', '13987', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30131b2d', '13998', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30131b2e', '14003', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30131b2f', '14008', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30131b30', '14007', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30131b31', '14020', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30131b32', '14025', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30131b33', '14028', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30131b34', '13575', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30131b35', '13582', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30131b36', '13592', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30131b37', '13599', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30131b38', '13615', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30131b39', '13622', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30131b3a', '13628', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30131b3b', '13630', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30131b3c', '13642', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30131b3d', '13681', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30131b3e', '13683', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30131b3f', '13692', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30131b40', '13697', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30131b41', '13735', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30131b42', '13737', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30131b43', '13744', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30131b44', '13751', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30131b45', '13755', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30131b46', '13765', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30171be6', '13703', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30171be7', '13707', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30171be8', '13715', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30171be9', '13728', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30171bea', '13729', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30171beb', '13738', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30171bec', '13746', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30171bed', '13750', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30171bee', '13757', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30171bef', '13763', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30171bf0', '13796', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30171bf1', '13803', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30171bf2', '13807', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30181bf3', '13810', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30181bf4', '13815', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30181bf5', '13824', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30181bf6', '13827', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30181bf7', '13851', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30181bf8', '13857', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30181bf9', '13869', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30181bfa', '13875', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30181bfb', '13880', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30181bfc', '13889', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30181bfd', '13895', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30181bfe', '13902', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30181bff', '13940', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30181c00', '13941', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30181c01', '13950', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30181c02', '13955', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30181c03', '13965', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30181c04', '13974', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30181c05', '13986', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30181c06', '13996', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30181c07', '14002', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30181c08', '14011', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30181c09', '14016', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30181c0a', '14023', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30181c0b', '14029', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30181c0c', '14034', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30181c0d', '14039', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30181c0e', '14049', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30181c0f', '14055', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30181c10', '14075', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30181c11', '14081', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30181c12', '14085', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30181c13', '14094', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30181c14', '14100', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30181c15', '14107', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30181c16', '14118', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30181c17', '14129', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30181c18', '14130', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30181c19', '14141', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30181c1a', '14146', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30181c1b', '14150', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30181c1c', '14152', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30181c1d', '14154', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30181c1e', '14153', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30181c1f', '14156', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30181c20', '14155', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30181c21', '14157', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30181c22', '14158', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30181c23', '14161', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30191c24', '14160', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30191c25', '14159', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30191c26', '14162', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30191c27', '14165', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30191c28', '14164', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30191c29', '14163', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30191c2a', '14167', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30191c2b', '14166', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30191c2c', '13601', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30191c2d', '13603', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30191c2e', '13611', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30191c2f', '13618', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30191c30', '13654', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30191c31', '13661', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30191c32', '13663', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30191c33', '13666', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30191c34', '13673', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30191c35', '13677', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30191c36', '13684', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30191c37', '13706', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30191c38', '13709', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30191c39', '13720', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30191c3a', '13779', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30191c3b', '13847', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30191c3c', '13855', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30191c3d', '13859', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30191c3e', '13866', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30191c3f', '13871', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30191c40', '13884', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30191c41', '13914', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30191c42', '13917', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30191c43', '13924', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30191c44', '13930', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30191c45', '13935', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30191c46', '13942', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30191c47', '13948', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30191c48', '13957', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30191c49', '13962', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30191c4a', '13968', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30191c4b', '13979', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30191c4c', '13995', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30191c4d', '14004', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30191c4e', '14009', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30191c4f', '14019', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30191c50', '14022', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30191c51', '14030', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30191c52', '14033', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30191c53', '14045', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301a1c54', '14048', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301a1c55', '14060', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301a1c56', '14061', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301a1c57', '14134', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301a1c58', '14145', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301a1c59', '14149', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301a1c5a', '14170', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301a1c5b', '14173', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301a1c5c', '14172', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301a1c5d', '14171', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301a1c5e', '14174', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301a1c5f', '14175', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301a1c60', '14178', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301a1c61', '14177', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301a1c62', '14176', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301a1c63', '14179', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301a1c64', '14183', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301a1c65', '14182', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301a1c66', '14186', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301a1c67', '14185', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301a1c68', '14184', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301a1c69', '14187', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301a1c6a', '14190', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301a1c6b', '14189', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301a1c6c', '14188', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301a1c6d', '14191', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301a1c6e', '14192', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301a1c6f', '14194', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301a1c70', '14198', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301a1c71', '14195', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301a1c72', '14196', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301a1c73', '14200', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301a1c74', '14199', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301a1c75', '14201', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301a1c76', '14202', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301a1c77', '14206', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301a1c78', '14205', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301a1c79', '14229', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301a1c7a', '14261', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301a1c7b', '14270', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301a1c7c', '14282', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301a1c7d', '14289', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301a1c7e', '14292', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301a1c7f', '14299', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301a1c80', '14303', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301a1c81', '14311', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a301a1c82', '14316', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30131b47', '13778', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30131b48', '13780', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30131b49', '13789', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30131b4a', '13812', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30131b4b', '13818', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30141b4c', '13837', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30141b4d', '13838', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30141b4e', '13850', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30141b4f', '13864', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30141b50', '13873', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30141b51', '13879', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30141b52', '13885', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30141b53', '13894', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30141b54', '13898', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30141b55', '13908', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30141b56', '13915', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30141b57', '13933', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30141b58', '13939', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30141b59', '13947', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30141b5a', '13949', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30141b5b', '13956', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30141b5c', '13963', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30141b5d', '13975', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30141b5e', '13983', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30141b5f', '13994', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30141b60', '14001', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30141b61', '14012', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30141b62', '14013', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30141b63', '14035', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30141b64', '14037', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30151b65', '14042', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30151b66', '14044', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30151b67', '14046', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30151b68', '14051', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30151b69', '14052', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30151b6a', '14057', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30151b6b', '14054', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30151b6c', '14065', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30151b6d', '14064', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30151b6e', '14071', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30151b6f', '14069', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30151b70', '14073', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30151b71', '14074', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30151b72', '14076', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30151b73', '14077', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30151b74', '14078', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30151b75', '14082', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30151b76', '14084', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30151b77', '14089', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30151b78', '14092', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30151b79', '14090', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30151b7a', '14099', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30151b7b', '14097', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30151b7c', '14104', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30151b7d', '14102', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30151b7e', '14111', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30151b7f', '14110', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30151b80', '14116', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30151b81', '14115', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30151b82', '14119', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30151b83', '14123', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30151b84', '14127', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30151b85', '14126', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30151b86', '14125', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30151b87', '14124', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30151b88', '14132', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30151b89', '13574', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30151b8a', '13583', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30151b8b', '13585', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30151b8c', '13590', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30151b8d', '13596', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30151b8e', '13602', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30151b8f', '13620', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30151b90', '13627', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30151b91', '13633', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30151b92', '13640', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30161b93', '13648', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30161b94', '13653', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30161b95', '13659', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30161b96', '13667', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30161b97', '13670', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30161b98', '13679', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30161b99', '13688', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30161b9a', '13696', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30161b9b', '13699', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30161b9c', '13704', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30161b9d', '13711', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30161b9e', '13713', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30161b9f', '13721', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30161ba0', '13726', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30161ba1', '13731', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30161ba2', '13741', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30161ba3', '13747', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30161ba4', '13754', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30161ba5', '13761', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30161ba6', '13777', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30161ba7', '13784', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30161ba8', '13788', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30161ba9', '13792', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30161baa', '13802', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30161bab', '13804', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30161bac', '13805', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30161bad', '13811', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30161bae', '13819', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30161baf', '13825', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30161bb0', '13832', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30161bb1', '13843', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30161bb2', '13874', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30161bb3', '13881', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30161bb4', '13888', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30161bb5', '13890', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30161bb6', '13891', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30161bb7', '13904', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30161bb8', '13926', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30161bb9', '13934', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30161bba', '13970', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30161bbb', '13980', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30161bbc', '13988', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30161bbd', '14024', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30161bbe', '14032', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30161bbf', '14036', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30161bc0', '14043', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30161bc1', '14050', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30161bc2', '14053', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30171bc3', '14063', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30171bc4', '14068', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30171bc5', '14083', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30171bc6', '14088', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30171bc7', '14095', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30171bc8', '14096', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30171bc9', '14105', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30171bca', '14108', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30171bcb', '14113', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30171bcc', '14120', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30171bcd', '14128', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30171bce', '14131', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30171bcf', '14133', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30171bd0', '14136', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30171bd1', '14135', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30171bd2', '14138', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30171bd3', '14140', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30171bd4', '14137', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30171bd5', '14139', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30171bd6', '14142', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30171bd7', '14144', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30171bd8', '14143', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30171bd9', '14148', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30171bda', '14147', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30171bdb', '14151', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30171bdc', '13600', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30171bdd', '13607', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30171bde', '13613', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30171bdf', '13641', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30171be0', '13643', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30171be1', '13652', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30171be2', '13660', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30171be3', '13689', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30171be4', '13690', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30201d1f', '14348', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30201d20', '14358', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30201d21', '14362', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30201d22', '14368', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30201d23', '14376', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30201d24', '14382', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30201d25', '14430', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30201d26', '14440', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30201d27', '14444', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30201d28', '14451', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30201d29', '14456', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30201d2a', '14469', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30201d2b', '14477', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30201d2c', '14485', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30201d2d', '14493', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30201d2e', '14511', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d2f', '14519', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d30', '14525', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d31', '14537', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d32', '14560', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d33', '14564', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d34', '14576', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d35', '14577', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d36', '14592', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d37', '14601', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d38', '14617', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d39', '14624', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d3a', '14633', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d3b', '14649', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d3c', '14675', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d3d', '14681', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d3e', '14685', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d3f', '14688', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d40', '14692', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d41', '14691', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d42', '14694', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d43', '14693', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d44', '14698', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d45', '14701', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d46', '14700', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d47', '14704', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d48', '14709', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d49', '14708', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d4a', '14707', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d4b', '14712', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d4c', '14716', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d4d', '14715', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d4e', '14720', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d4f', '14719', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d50', '14723', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d51', '14730', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d52', '14728', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d53', '14727', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d54', '14736', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d55', '14739', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d56', '14737', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d57', '14742', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d58', '14744', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d59', '14743', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d5a', '14748', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d5b', '14747', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d5c', '14746', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d5d', '14749', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d5e', '14755', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d5f', '14754', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d60', '14235', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d61', '14242', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d62', '14249', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d63', '14252', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d64', '14259', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30211d65', '14266', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d66', '14271', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d67', '14320', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d68', '14328', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d69', '14333', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d6a', '14341', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d6b', '14345', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d6c', '14353', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d6d', '14378', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d6e', '14386', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d6f', '14388', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d70', '14393', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d71', '14400', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d72', '14405', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d73', '14416', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d74', '14424', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d75', '14428', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d76', '14432', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d77', '14437', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d78', '14449', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d79', '14452', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d7a', '14457', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d7b', '14463', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d7c', '14479', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d7d', '14489', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d7e', '14500', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d7f', '14520', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d80', '14540', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d81', '14548', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d82', '14554', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d83', '14561', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d84', '14567', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d85', '14575', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d86', '14583', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d87', '14585', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d88', '14590', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d89', '14598', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d8a', '14606', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d8b', '14612', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d8c', '14618', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d8d', '14625', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d8e', '14628', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d8f', '14635', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d90', '14668', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d91', '14690', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d92', '14695', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d93', '14699', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d94', '14711', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d95', '14714', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d96', '14713', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d97', '14722', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d98', '14721', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d99', '14729', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d9a', '14726', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d9b', '14735', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30221d9c', '14741', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231d9d', '14745', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231d9e', '14753', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231d9f', '14752', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231da0', '14751', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231da1', '14750', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231da2', '14756', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231da3', '14762', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231da4', '14761', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231da5', '14760', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231da6', '14759', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231da7', '14758', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231da8', '14757', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231da9', '14763', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231daa', '14764', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231dab', '14768', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231dac', '14232', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231dad', '14240', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231dae', '14246', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231daf', '14253', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231db0', '14258', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231db1', '14268', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231db2', '14275', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231db3', '14278', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231db4', '14288', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231db5', '14295', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231db6', '14301', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231db7', '14319', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231db8', '14329', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231db9', '14340', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231dba', '14346', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231dbb', '14352', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231dbc', '14364', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231dbd', '14370', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231dbe', '14374', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231dbf', '14385', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231dc0', '14389', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231dc1', '14396', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231dc2', '14401', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231dc3', '14409', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231dc4', '14423', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231dc5', '14465', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231dc6', '14474', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231dc7', '14491', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231dc8', '14501', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231dc9', '14505', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231dca', '14512', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231dcb', '14524', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231dcc', '14544', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231dcd', '14553', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231dce', '14556', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231dcf', '14557', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231dd0', '14573', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231dd1', '14581', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231dd2', '14587', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30231dd3', '14593', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241dd4', '14599', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241dd5', '14605', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241dd6', '14613', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241dd7', '14621', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241dd8', '14626', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241dd9', '14629', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241dda', '14631', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241ddb', '14634', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241ddc', '14644', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241ddd', '14666', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241dde', '14667', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241ddf', '14672', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241de0', '14671', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241de1', '14677', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241de2', '14676', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241de3', '14683', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241de4', '14686', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241de5', '14689', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241de6', '14687', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241de7', '14697', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241de8', '14696', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241de9', '14702', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241dea', '14703', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241deb', '14705', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241dec', '14706', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241ded', '14710', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241dee', '14718', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241def', '14717', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241df0', '14724', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241df1', '14725', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241df2', '14731', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241df3', '14732', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241df4', '14734', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241df5', '14733', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241df6', '14738', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241df7', '14740', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241df8', '14234', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241df9', '14236', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241dfa', '14238', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241dfb', '14243', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241dfc', '14245', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241dfd', '14250', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241dfe', '14254', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241dff', '14257', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241e00', '14264', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241e01', '14274', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241e02', '14281', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241e03', '14279', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241e04', '14287', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241e05', '14285', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241e06', '14294', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241e07', '14291', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241e08', '14300', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241e09', '14297', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30241e0a', '14306', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e0b', '14309', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e0c', '14318', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e0d', '14330', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e0e', '14331', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e0f', '14338', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e10', '14354', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e11', '14359', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e12', '14361', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e13', '14369', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e14', '14375', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e15', '14383', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e16', '14390', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e17', '14395', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e18', '14402', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e19', '14408', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e1a', '14411', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e1b', '14413', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e1c', '14415', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e1d', '14420', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e1e', '14419', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e1f', '14427', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e20', '14434', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e21', '14433', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e22', '14442', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e23', '14441', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e24', '14447', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e25', '14446', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e26', '14454', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e27', '14461', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e28', '14466', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e29', '14464', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e2a', '14473', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e2b', '14481', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e2c', '14483', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e2d', '14490', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e2e', '14497', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e2f', '14499', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e30', '14502', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e31', '14510', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e32', '14515', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e33', '14528', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e34', '14530', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e35', '14535', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e36', '14533', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e37', '14541', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e38', '14562', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e39', '14569', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e3a', '14589', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e3b', '14595', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e3c', '14597', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e3d', '14600', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e3e', '14604', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e3f', '14609', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e40', '14614', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30251e41', '14611', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30261e42', '14643', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30261e43', '14650', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30261e44', '14233', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30261e45', '14239', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30261e46', '14248', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30261e47', '14247', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30261e48', '14251', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30261e49', '14256', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30261e4a', '14260', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30261e4b', '14262', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30261e4c', '14265', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30261e4d', '14269', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30261e4e', '14273', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30261e4f', '14272', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30261e50', '14277', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30261e51', '14280', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30261e52', '14284', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30261e53', '14286', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30261e54', '14290', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30261e55', '14293', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30261e56', '14296', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30261e57', '14298', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302b1ef5', '14995', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302b1ef6', '14998', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302b1ef7', '14999', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302b1ef8', '15004', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302b1ef9', '15008', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302b1efa', '15013', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302b1efb', '15016', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302b1efc', '15025', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302b1efd', '15031', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302b1efe', '15041', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302b1eff', '15046', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302b1f00', '15051', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302b1f01', '15054', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302b1f02', '15057', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302b1f03', '15064', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302b1f04', '15068', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302b1f05', '15071', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302b1f06', '15078', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302b1f07', '15081', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302b1f08', '14807', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302b1f09', '14816', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302b1f0a', '14821', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302b1f0b', '14826', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302b1f0c', '14832', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302b1f0d', '14835', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302b1f0e', '14844', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302b1f0f', '14848', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302b1f10', '14860', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302b1f11', '14866', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302b1f12', '14871', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302b1f13', '14877', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302b1f14', '14892', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302b1f15', '14901', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302c1f16', '14910', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302c1f17', '14914', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302c1f18', '14920', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302c1f19', '14927', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302c1f1a', '14930', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302c1f1b', '14942', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302c1f1c', '14953', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302c1f1d', '14958', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302c1f1e', '14964', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302c1f1f', '14970', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302c1f20', '14979', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302c1f21', '14982', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302c1f22', '14989', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302c1f23', '14996', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302c1f24', '15006', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302c1f25', '15009', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302c1f26', '15022', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302c1f27', '15084', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302c1f28', '15089', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302c1f29', '15090', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302c1f2a', '15093', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302c1f2b', '15094', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302c1f2c', '15098', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302c1f2d', '15100', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302c1f2e', '15099', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302c1f2f', '15103', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302c1f30', '15106', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302c1f31', '15110', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302c1f32', '15117', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302c1f33', '15122', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302c1f34', '15123', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302d1f35', '15128', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302d1f36', '15126', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302d1f37', '15134', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302d1f38', '15132', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302e1f39', '15137', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302e1f3a', '15141', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302e1f3b', '15146', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302e1f3c', '15148', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302e1f3d', '15150', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302e1f3e', '15154', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302e1f3f', '15157', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302e1f40', '15161', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302e1f41', '15166', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302e1f42', '15175', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302e1f43', '15178', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302e1f44', '15183', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302e1f45', '15187', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302e1f46', '15196', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302e1f47', '15194', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302e1f48', '15198', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302e1f49', '15197', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302e1f4a', '15202', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302e1f4b', '15204', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302e1f4c', '15208', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302e1f4d', '14767', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302e1f4e', '14765', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302e1f4f', '14772', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302e1f50', '14775', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302e1f51', '14779', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302e1f52', '14783', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302e1f53', '14787', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302e1f54', '14789', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302e1f55', '14791', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302e1f56', '14795', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302e1f57', '14813', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302f1f58', '14817', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302f1f59', '14825', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302f1f5a', '14827', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302f1f5b', '14830', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302f1f5c', '14834', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302f1f5d', '14836', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302f1f5e', '14839', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302f1f5f', '14843', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302f1f60', '14845', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302f1f61', '14849', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302f1f62', '14853', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302f1f63', '14856', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302f1f64', '14857', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302f1f65', '14864', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302f1f66', '14868', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302f1f67', '14876', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302f1f68', '14881', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302f1f69', '14880', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302f1f6a', '14891', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302f1f6b', '14893', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302f1f6c', '14896', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302f1f6d', '14902', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302f1f6e', '14906', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302f1f6f', '14909', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302f1f70', '14918', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a302f1f71', '14923', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30301f72', '14932', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30301f73', '14937', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30301f74', '14966', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30301f75', '14972', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30301f76', '14978', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30301f77', '14988', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30301f78', '15001', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30301f79', '15002', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30301f7a', '15007', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30301f7b', '15011', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30301f7c', '15015', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30301f7d', '15018', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30311f7e', '15020', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30311f7f', '15023', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30311f80', '15028', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30311f81', '15029', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30311f82', '15032', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30311f83', '15039', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30311f84', '15040', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30311f85', '15042', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30311f86', '15047', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30311f87', '15052', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30311f88', '15059', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30311f89', '15066', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30311f8a', '15073', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30311f8b', '15079', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30311f8c', '15086', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30311f8d', '15091', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30311f8e', '15092', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30311f8f', '15095', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30311f90', '15102', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30311f91', '15107', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30311f92', '15116', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30311f93', '15121', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30311f94', '15125', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30311f95', '15135', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30311f96', '15140', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30311f97', '15153', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30311f98', '15160', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30311f99', '14778', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30311f9a', '14788', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30311f9b', '14790', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30311f9c', '14805', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30311f9d', '14815', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30311f9e', '14840', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30311f9f', '14847', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30311fa0', '14851', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30311fa1', '14867', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30311fa2', '14889', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30311fa3', '14899', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30311fa4', '14907', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30311fa5', '14916', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30311fa6', '14921', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30311fa7', '14926', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30311fa8', '14941', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30321fa9', '14946', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30321faa', '14950', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30321fab', '14959', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30321fac', '14962', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30321fad', '14967', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30321fae', '14974', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30321faf', '15014', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30321fb0', '15021', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30321fb1', '15027', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30321fb2', '15034', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30321fb3', '15036', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30321fb4', '15053', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30321fb5', '15060', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30321fb6', '15076', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30321fb7', '15083', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30321fb8', '15087', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30321fb9', '15096', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30321fba', '15101', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30321fbb', '15109', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30321fbc', '15114', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30321fbd', '15159', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30321fbe', '15163', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30321fbf', '15167', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30321fc0', '15171', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30321fc1', '15168', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30321fc2', '15174', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30331fc3', '15177', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30331fc4', '15180', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30331fc5', '15185', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30331fc6', '15190', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30331fc7', '15195', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30331fc8', '15199', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30331fc9', '15207', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30331fca', '14800', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30331fcb', '14801', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30331fcc', '14811', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30331fcd', '14818', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30331fce', '14828', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30331fcf', '14859', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30331fd0', '14862', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30331fd1', '14887', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30331fd2', '14904', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30331fd3', '14908', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30331fd4', '14915', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30331fd5', '14924', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30331fd6', '14931', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30331fd7', '14938', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30331fd8', '14945', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30331fd9', '14952', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30331fda', '14955', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30331fdb', '14963', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30331fdc', '14971', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30331fdd', '14987', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30331fde', '14994', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30331fdf', '14997', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30331fe0', '15005', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30331fe1', '15010', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30331fe2', '15019', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30331fe3', '15024', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30331fe4', '15030', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30331fe5', '15038', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30331fe6', '15043', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30331fe7', '15048', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30331fe8', '15056', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30331fe9', '15061', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30331fea', '15074', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30331feb', '15097', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30331fec', '15104', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30331fed', '15105', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30331fee', '15113', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30331fef', '15118', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30331ff0', '15129', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30331ff1', '15130', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30331ff2', '15136', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30331ff3', '15142', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30331ff4', '15147', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30331ff5', '15162', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30341ff6', '15170', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30341ff7', '15173', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30341ff8', '15179', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30341ff9', '15184', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30341ffa', '15192', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30341ffb', '15201', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30341ffc', '14769', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30341ffd', '14777', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30341ffe', '14799', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30341fff', '14806', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30342000', '14829', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30342001', '14837', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30342002', '14842', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30342003', '14850', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30342004', '14855', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30342005', '14861', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30342006', '14869', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30342007', '14874', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30342008', '14884', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30342009', '14890', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3034200a', '14895', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3034200b', '14957', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3034200c', '14976', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3034200d', '14985', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3034200e', '14992', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3034200f', '15000', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30342010', '15003', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30342011', '15012', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30342012', '15017', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30342013', '15026', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30342014', '15035', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30342015', '15045', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30342016', '15050', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30352017', '15055', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30352018', '15058', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30352019', '15067', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3035201a', '15072', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3035201b', '15077', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3035201c', '15085', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3035201d', '15143', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3035201e', '15152', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3035201f', '15156', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30352020', '15165', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30352021', '15169', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30352022', '15176', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30352023', '15181', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30352024', '15186', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30352025', '15189', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30352026', '15203', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30352027', '15209', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30352028', '14771', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30352029', '14774', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3035202a', '14780', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3035202b', '14786', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3035202c', '14792', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3035202d', '14798', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3035202e', '14802', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3035202f', '14810', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30352030', '14854', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30352031', '14873', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30352032', '14875', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30352033', '14882', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30352034', '14886', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30352035', '14900', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30352036', '14928', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30352037', '14933', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30352038', '14936', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30352039', '14949', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3035203a', '14981', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3035203b', '14983', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3035203c', '14993', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3035203d', '15070', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3035203e', '15080', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3035203f', '15111', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30352040', '15112', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30352041', '15120', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30352042', '15127', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30352043', '15133', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30352044', '15138', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30352045', '15145', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30352046', '15149', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30352047', '15158', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30352048', '15164', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a30352049', '15172', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3035204a', '15193', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3036204b', '15200', '46');
INSERT INTO "SCM"."T_SYS_VEN_ROLE" VALUES ('40282d814d6b4701014d6b4a3036204c', '15205', '46');

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
"DELV_VENDORID" NUMBER NULL ,
"DELV_NO" VARCHAR2(100 BYTE) NULL ,
"DELV_SENDFLAG" CHAR(1 BYTE) NULL ,
"DELV_USERID" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of T_VEN_DELV
-- ----------------------------

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
"VEN_HOP_AUDITFLAG" CHAR(1 BYTE) DEFAULT ''  NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of T_VEN_HOP_INC
-- ----------------------------

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
"VEN_INC_CATID" NUMBER NULL ,
"VEN_INC_SP" NUMBER NULL ,
"VEN_INC_QTY" NUMBER DEFAULT 0  NULL ,
"VEN_INC_RESQTY" NUMBER NULL ,
"VEN_INC_AVAILQTY" NUMBER NULL ,
"VEN_INC_COMMENT_NUM" NUMBER DEFAULT 0  NULL ,
"VEN_INC_ORDER_QTY" NUMBER DEFAULT 0  NULL ,
"VEN_INC_ADDDATE" DATE NULL 
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
COMMENT ON COLUMN "SCM"."T_VEN_INC"."VEN_INC_CATID" IS '类组';

-- ----------------------------
-- Records of T_VEN_INC
-- ----------------------------

-- ----------------------------
-- Table structure for T_VEN_INC_ADVICE
-- ----------------------------
DROP TABLE "SCM"."T_VEN_INC_ADVICE";
CREATE TABLE "SCM"."T_VEN_INC_ADVICE" (
"VENINCADVICE_ID" NUMBER NULL ,
"VENINCADVICE_INC_ID" NUMBER NULL ,
"VENINCADVICE_ASK" VARCHAR2(500 BYTE) NULL ,
"VENINCADVICE_ASK_USERID" NUMBER NULL ,
"VENINCADVICE_REPLAY" VARCHAR2(500 BYTE) NULL ,
"VENINCADVICE_REPLAY_USERID" NUMBER NULL ,
"VENINCADVICE_ASK_DATE" TIMESTAMP(0)  NULL ,
"VENINCADVICE_REPLAY_DATE" TIMESTAMP(0)  NULL ,
"VENINCADVICE_READFLAG" CHAR(1 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of T_VEN_INC_ADVICE
-- ----------------------------

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

-- ----------------------------
-- Table structure for T_VEN_INC_PROPERTY
-- ----------------------------
DROP TABLE "SCM"."T_VEN_INC_PROPERTY";
CREATE TABLE "SCM"."T_VEN_INC_PROPERTY" (
"INCPRO_ID" NUMBER NOT NULL ,
"INCPRO_INC_ID" NUMBER NULL ,
"INC_PRO_CATPRO_ID" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of T_VEN_INC_PROPERTY
-- ----------------------------

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
"SEQ" NUMBER NULL ,
"TYPE" VARCHAR2(20 BYTE) NULL 
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
INSERT INTO "SCM"."T_VEN_QUALIF_TYPE" VALUES ('1050', '销售许可证效期', '销售许可证效期', '1', '日期');
INSERT INTO "SCM"."T_VEN_QUALIF_TYPE" VALUES ('2100', '营业执照效期', '营业执照效期', '4', '日期');
INSERT INTO "SCM"."T_VEN_QUALIF_TYPE" VALUES ('2101', '营业执照照片', '营业执照照片', '5', '图片');
INSERT INTO "SCM"."T_VEN_QUALIF_TYPE" VALUES ('2102', '营业执照编码', '营业执照编码', '6', '文本');
INSERT INTO "SCM"."T_VEN_QUALIF_TYPE" VALUES ('1100', '销售许可证图片', '销售许可证图片', '2', '图片');
INSERT INTO "SCM"."T_VEN_QUALIF_TYPE" VALUES ('1101', '销售许可证号', '销售许可证号', '3', '文本');

-- ----------------------------
-- Table structure for T_VEN_QUALIFICATION
-- ----------------------------
DROP TABLE "SCM"."T_VEN_QUALIFICATION";
CREATE TABLE "SCM"."T_VEN_QUALIFICATION" (
"QUALIFICATION_ID" NUMBER NOT NULL ,
"VENDOR_ID" NUMBER NULL ,
"REGDATE" DATE NULL ,
"EXPDATE" DATE NULL ,
"QUALIFY_TYPE_ID" NUMBER NULL ,
"QUALIFY_DESCRIPTION" NVARCHAR2(100) NULL 
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
INSERT INTO "SCM"."T_VEN_QUALIFICATION" VALUES ('18200', '15564', null, null, '1050', null);
INSERT INTO "SCM"."T_VEN_QUALIFICATION" VALUES ('18201', '15564', null, null, '1101', null);
INSERT INTO "SCM"."T_VEN_QUALIFICATION" VALUES ('18202', '15564', null, null, '2100', null);
INSERT INTO "SCM"."T_VEN_QUALIFICATION" VALUES ('18203', '15564', null, null, '2102', null);

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
"EMAIL" VARCHAR2(250 BYTE) NULL ,
"TAXATION" VARCHAR2(100 BYTE) NULL 
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
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('15564', 'bjaz', 'bjaz-北京安贞', null, '北京安贞', '12334', '13733333333', null, null, null, 'bjazbjaz', null, null);

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
INSERT INTO "SCM"."T_VEN_VENDOR_LOG" VALUES ('402881ed4de0635e014de082e1bd0000', '15564', null, TO_TIMESTAMP(' 2015-06-11 10:46:23:419000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '增加', '127.0.0.1', null, ' 邮箱: 联系人:', 'system', null);

-- ----------------------------
-- Sequence structure for SEQ_NORMALUSER
-- ----------------------------
DROP SEQUENCE "SCM"."SEQ_NORMALUSER";
CREATE SEQUENCE "SCM"."SEQ_NORMALUSER"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 313
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQ_SYS_FUNC
-- ----------------------------
DROP SEQUENCE "SCM"."SEQ_SYS_FUNC";
CREATE SEQUENCE "SCM"."SEQ_SYS_FUNC"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 223
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQ_SYS_NORMAL_ACCOUNT
-- ----------------------------
DROP SEQUENCE "SCM"."SEQ_SYS_NORMAL_ACCOUNT";
CREATE SEQUENCE "SCM"."SEQ_SYS_NORMAL_ACCOUNT"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 309
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
 START WITH 50
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQ_VENDOR
-- ----------------------------
DROP SEQUENCE "SCM"."SEQ_VENDOR";
CREATE SEQUENCE "SCM"."SEQ_VENDOR"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 15584
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
 START WITH 81
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_CAT_CATGROUPITM
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_CAT_CATGROUPITM";
CREATE SEQUENCE "SCM"."SEQUENCE_CAT_CATGROUPITM"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 150
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_CAT_GROUP
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_CAT_GROUP";
CREATE SEQUENCE "SCM"."SEQUENCE_CAT_GROUP"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 42
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_CAT_GROUPPROPERTY
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_CAT_GROUPPROPERTY";
CREATE SEQUENCE "SCM"."SEQUENCE_CAT_GROUPPROPERTY"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 328
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_CAT_PROPERTY
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_CAT_PROPERTY";
CREATE SEQUENCE "SCM"."SEQUENCE_CAT_PROPERTY"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 21
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_HOP_ELESUB
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_HOP_ELESUB";
CREATE SEQUENCE "SCM"."SEQUENCE_HOP_ELESUB"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 362
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_HOP_EVALUTE
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_HOP_EVALUTE";
CREATE SEQUENCE "SCM"."SEQUENCE_HOP_EVALUTE"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 430
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
 START WITH 48281
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_HOP_INC_LOC
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_HOP_INC_LOC";
CREATE SEQUENCE "SCM"."SEQUENCE_HOP_INC_LOC"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 41
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
-- Sequence structure for SEQUENCE_HOP_INCNEWS
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_HOP_INCNEWS";
CREATE SEQUENCE "SCM"."SEQUENCE_HOP_INCNEWS"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 221
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_HOP_MANF
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_HOP_MANF";
CREATE SEQUENCE "SCM"."SEQUENCE_HOP_MANF"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 4201
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_HOP_VENDOR
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_HOP_VENDOR";
CREATE SEQUENCE "SCM"."SEQUENCE_HOP_VENDOR"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 15282
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_ORD_DETAIL
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_ORD_DETAIL";
CREATE SEQUENCE "SCM"."SEQUENCE_ORD_DETAIL"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 470
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_ORD_EXESTATE
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_ORD_EXESTATE";
CREATE SEQUENCE "SCM"."SEQUENCE_ORD_EXESTATE"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 692
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
-- Sequence structure for SEQUENCE_ORD_PLAN
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_ORD_PLAN";
CREATE SEQUENCE "SCM"."SEQUENCE_ORD_PLAN"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 7
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_ORD_SHOPPING
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_ORD_SHOPPING";
CREATE SEQUENCE "SCM"."SEQUENCE_ORD_SHOPPING"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 674
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_ORD_STATE
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_ORD_STATE";
CREATE SEQUENCE "SCM"."SEQUENCE_ORD_STATE"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 62
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_SYS_APPNO
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_SYS_APPNO";
CREATE SEQUENCE "SCM"."SEQUENCE_SYS_APPNO"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 427
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_SYS_CTLOC
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_SYS_CTLOC";
CREATE SEQUENCE "SCM"."SEQUENCE_SYS_CTLOC"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 221
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_SYS_CTLOC_DESTINATION
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_SYS_CTLOC_DESTINATION";
CREATE SEQUENCE "SCM"."SEQUENCE_SYS_CTLOC_DESTINATION"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 204
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
 START WITH 6529
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_VEN_INC_PIC
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_VEN_INC_PIC";
CREATE SEQUENCE "SCM"."SEQUENCE_VEN_INC_PIC"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999
 START WITH 444
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_VEN_INC_PROPERTY
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_VEN_INC_PROPERTY";
CREATE SEQUENCE "SCM"."SEQUENCE_VEN_INC_PROPERTY"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 840
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_VEN_QUALIF_PIC
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_VEN_QUALIF_PIC";
CREATE SEQUENCE "SCM"."SEQUENCE_VEN_QUALIF_PIC"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 403
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_VEN_QUALIF_TYPE
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_VEN_QUALIF_TYPE";
CREATE SEQUENCE "SCM"."SEQUENCE_VEN_QUALIF_TYPE"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 43
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_VEN_QUALIFICATION
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_VEN_QUALIFICATION";
CREATE SEQUENCE "SCM"."SEQUENCE_VEN_QUALIFICATION"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 384
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
-- Sequence structure for SEQUENCE_VENINCADVICE
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_VENINCADVICE";
CREATE SEQUENCE "SCM"."SEQUENCE_VENINCADVICE"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 181
 CACHE 20;

-- ----------------------------
-- Indexes structure for table T_APP_LOG
-- ----------------------------

-- ----------------------------
-- Checks structure for table T_APP_LOG
-- ----------------------------
ALTER TABLE "SCM"."T_APP_LOG" ADD CHECK ("LOG_ID" IS NOT NULL);
ALTER TABLE "SCM"."T_APP_LOG" ADD CHECK ("LOG_ID" IS NOT NULL);
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
ALTER TABLE "SCM"."T_APP_LOG_AUDIT" ADD CHECK ("AUDIT_ID" IS NOT NULL);
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
ALTER TABLE "SCM"."T_CAT_DRUGGROUP" ADD CHECK ("SDG_ID" IS NOT NULL);
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
ALTER TABLE "SCM"."T_CAT_DRUGGROUPITM" ADD CHECK ("SDGI_ID" IS NOT NULL);
ALTER TABLE "SCM"."T_CAT_DRUGGROUPITM" ADD CHECK ("SDGI_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_CAT_DRUGGROUPITM
-- ----------------------------
ALTER TABLE "SCM"."T_CAT_DRUGGROUPITM" ADD PRIMARY KEY ("SDGI_ID");

-- ----------------------------
-- Indexes structure for table T_CAT_GROUP
-- ----------------------------

-- ----------------------------
-- Checks structure for table T_CAT_GROUP
-- ----------------------------
ALTER TABLE "SCM"."T_CAT_GROUP" ADD CHECK ("SG_ID" IS NOT NULL);
ALTER TABLE "SCM"."T_CAT_GROUP" ADD CHECK ("SG_ID" IS NOT NULL);
ALTER TABLE "SCM"."T_CAT_GROUP" ADD CHECK ("SG_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_CAT_GROUP
-- ----------------------------
ALTER TABLE "SCM"."T_CAT_GROUP" ADD PRIMARY KEY ("SG_ID");

-- ----------------------------
-- Checks structure for table T_CAT_GROUPPROPERTY
-- ----------------------------
ALTER TABLE "SCM"."T_CAT_GROUPPROPERTY" ADD CHECK ("GRP_PRO_ID" IS NOT NULL);
ALTER TABLE "SCM"."T_CAT_GROUPPROPERTY" ADD CHECK ("GRP_PRO_ID" IS NOT NULL);
ALTER TABLE "SCM"."T_CAT_GROUPPROPERTY" ADD CHECK ("GRP_PRO_ID" IS NOT NULL);

-- ----------------------------
-- Checks structure for table T_HOP_CTLOC
-- ----------------------------
ALTER TABLE "SCM"."T_HOP_CTLOC" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "SCM"."T_HOP_CTLOC" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "SCM"."T_HOP_CTLOC" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Indexes structure for table T_HOP_EVALUTE
-- ----------------------------

-- ----------------------------
-- Checks structure for table T_HOP_EVALUTE
-- ----------------------------
ALTER TABLE "SCM"."T_HOP_EVALUTE" ADD CHECK ("ELE_ID" IS NOT NULL);
ALTER TABLE "SCM"."T_HOP_EVALUTE" ADD CHECK ("ELE_ID" IS NOT NULL);
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
ALTER TABLE "SCM"."T_HOP_INC" ADD CHECK ("INC_ID" IS NOT NULL);
ALTER TABLE "SCM"."T_HOP_INC" ADD CHECK ("INC_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_HOP_INC
-- ----------------------------
ALTER TABLE "SCM"."T_HOP_INC" ADD PRIMARY KEY ("INC_ID");

-- ----------------------------
-- Uniques structure for table T_HOP_INC_LOC
-- ----------------------------
ALTER TABLE "SCM"."T_HOP_INC_LOC" ADD UNIQUE ("INCLOC_ID");

-- ----------------------------
-- Checks structure for table T_HOP_INC_LOC
-- ----------------------------
ALTER TABLE "SCM"."T_HOP_INC_LOC" ADD CHECK ("INCLOC_ID" IS NOT NULL);
ALTER TABLE "SCM"."T_HOP_INC_LOC" ADD CHECK ("INCLOC_ID" IS NOT NULL);
ALTER TABLE "SCM"."T_HOP_INC_LOC" ADD CHECK ("INCLOC_ID" IS NOT NULL);

-- ----------------------------
-- Indexes structure for table T_HOP_INC_PIC
-- ----------------------------

-- ----------------------------
-- Checks structure for table T_HOP_INC_PIC
-- ----------------------------
ALTER TABLE "SCM"."T_HOP_INC_PIC" ADD CHECK ("INC_PIC_ID" IS NOT NULL);
ALTER TABLE "SCM"."T_HOP_INC_PIC" ADD CHECK ("INC_PIC_ID" IS NOT NULL);
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
ALTER TABLE "SCM"."T_HOP_INCALIAS" ADD CHECK ("INCALIAS_ID" IS NOT NULL);
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
ALTER TABLE "SCM"."T_HOP_MANF" ADD CHECK ("ID" IS NOT NULL);
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
ALTER TABLE "SCM"."T_HOP_VENDOR" ADD CHECK ("H_VENID" IS NOT NULL);
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
ALTER TABLE "SCM"."T_LOG_CONFIGURE" ADD CHECK ("LOG_ID" IS NOT NULL);
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
ALTER TABLE "SCM"."T_ORD_EXESTATE" ADD CHECK ("EXESTATE_ID" IS NOT NULL);
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
ALTER TABLE "SCM"."T_ORD_ORDER" ADD CHECK ("ORDER_ID" IS NOT NULL);
ALTER TABLE "SCM"."T_ORD_ORDER" ADD CHECK ("ORDER_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_ORD_ORDER
-- ----------------------------
ALTER TABLE "SCM"."T_ORD_ORDER" ADD PRIMARY KEY ("ORDER_ID");

-- ----------------------------
-- Indexes structure for table T_ORD_ORDERDETAIL
-- ----------------------------

-- ----------------------------
-- Checks structure for table T_ORD_ORDERDETAIL
-- ----------------------------
ALTER TABLE "SCM"."T_ORD_ORDERDETAIL" ADD CHECK ("ORDER_ID" IS NOT NULL);
ALTER TABLE "SCM"."T_ORD_ORDERDETAIL" ADD CHECK ("ORDER_ID" IS NOT NULL);

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
ALTER TABLE "SCM"."T_ORD_ORDERDETAILSUB" ADD CHECK ("ORDSUB_ID" IS NOT NULL);
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
ALTER TABLE "SCM"."T_ORD_ORDERITM" ADD CHECK ("ORDERITM_ID" IS NOT NULL);
ALTER TABLE "SCM"."T_ORD_ORDERITM" ADD CHECK ("ORDERITM_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_ORD_ORDERITM
-- ----------------------------
ALTER TABLE "SCM"."T_ORD_ORDERITM" ADD PRIMARY KEY ("ORDERITM_ID");

-- ----------------------------
-- Checks structure for table T_ORD_PLAN
-- ----------------------------
ALTER TABLE "SCM"."T_ORD_PLAN" ADD CHECK ("PLAN_ID" IS NOT NULL);
ALTER TABLE "SCM"."T_ORD_PLAN" ADD CHECK ("PLAN_ID" IS NOT NULL);
ALTER TABLE "SCM"."T_ORD_PLAN" ADD CHECK ("PLAN_ID" IS NOT NULL);

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
ALTER TABLE "SCM"."T_ORD_SHOPPING" ADD CHECK ("SHOP_ID" IS NOT NULL);
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
ALTER TABLE "SCM"."T_ORD_STATE" ADD CHECK ("STATE_ID" IS NOT NULL);
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
ALTER TABLE "SCM"."T_SYS_APPNO" ADD CHECK ("APPNO_ID" IS NOT NULL);
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
ALTER TABLE "SCM"."T_SYS_CTLOC" ADD CHECK ("CTLOC_ID" IS NOT NULL);
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
ALTER TABLE "SCM"."T_SYS_CTLOC_DESTINATION" ADD CHECK ("CTLOCDES_ID" IS NOT NULL);
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
ALTER TABLE "SCM"."T_SYS_DICT" ADD CHECK ("DIC_ID" IS NOT NULL);
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
ALTER TABLE "SCM"."T_SYS_HOSPITAL" ADD CHECK ("HOSPITAL_ID" IS NOT NULL);
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
ALTER TABLE "SCM"."T_SYS_IMPMODEL" ADD CHECK ("IMPMODEL_ID" IS NOT NULL);
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
ALTER TABLE "SCM"."T_SYS_LOG" ADD CHECK ("ID" IS NOT NULL);
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
ALTER TABLE "SCM"."T_SYS_NORMAL_ACCOUNT" ADD CHECK ("ACCOUNT_ID" IS NOT NULL);
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
ALTER TABLE "SCM"."T_SYS_NORMAL_USER" ADD CHECK ("USER_ID" IS NOT NULL);
ALTER TABLE "SCM"."T_SYS_NORMAL_USER" ADD CHECK ("USER_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_SYS_NORMAL_USER
-- ----------------------------
ALTER TABLE "SCM"."T_SYS_NORMAL_USER" ADD PRIMARY KEY ("USER_ID");

-- ----------------------------
-- Checks structure for table T_SYS_ROLE
-- ----------------------------
ALTER TABLE "SCM"."T_SYS_ROLE" ADD CHECK ("ROLE_ID" IS NOT NULL);
ALTER TABLE "SCM"."T_SYS_ROLE" ADD CHECK ("ROLE_ID" IS NOT NULL);
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
ALTER TABLE "SCM"."T_SYS_VEN_ROLE" ADD CHECK ("SYS_VEN_ROLE_ID" IS NOT NULL);
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
ALTER TABLE "SCM"."T_VEN_DELIVER" ADD CHECK ("DELIVER_ROWID" IS NOT NULL);
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
ALTER TABLE "SCM"."T_VEN_DELIVERITM" ADD CHECK ("DELIVERITM_ID" IS NOT NULL);
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
ALTER TABLE "SCM"."T_VEN_HOP_INC" ADD CHECK ("VEN_HOP_INC_ID" IS NOT NULL);
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
ALTER TABLE "SCM"."T_VEN_INC" ADD CHECK ("VEN_INC_ROWID" IS NOT NULL);
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
ALTER TABLE "SCM"."T_VEN_INC_PIC" ADD CHECK ("VEN_INC_PIC_ID" IS NOT NULL);
ALTER TABLE "SCM"."T_VEN_INC_PIC" ADD CHECK ("VEN_INC_PIC_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_VEN_INC_PIC
-- ----------------------------
ALTER TABLE "SCM"."T_VEN_INC_PIC" ADD PRIMARY KEY ("VEN_INC_PIC_ID");

-- ----------------------------
-- Checks structure for table T_VEN_INC_PROPERTY
-- ----------------------------
ALTER TABLE "SCM"."T_VEN_INC_PROPERTY" ADD CHECK ("INCPRO_ID" IS NOT NULL);
ALTER TABLE "SCM"."T_VEN_INC_PROPERTY" ADD CHECK ("INCPRO_ID" IS NOT NULL);
ALTER TABLE "SCM"."T_VEN_INC_PROPERTY" ADD CHECK ("INCPRO_ID" IS NOT NULL);

-- ----------------------------
-- Checks structure for table T_VEN_QUALIF
-- ----------------------------
ALTER TABLE "SCM"."T_VEN_QUALIF" ADD CHECK ("QUALIFID" IS NOT NULL);
ALTER TABLE "SCM"."T_VEN_QUALIF" ADD CHECK ("QUALIFID" IS NOT NULL);
ALTER TABLE "SCM"."T_VEN_QUALIF" ADD CHECK ("QUALIFID" IS NOT NULL);

-- ----------------------------
-- Indexes structure for table T_VEN_QUALIF_PIC
-- ----------------------------

-- ----------------------------
-- Checks structure for table T_VEN_QUALIF_PIC
-- ----------------------------
ALTER TABLE "SCM"."T_VEN_QUALIF_PIC" ADD CHECK ("QUALIF_PIC_ID" IS NOT NULL);
ALTER TABLE "SCM"."T_VEN_QUALIF_PIC" ADD CHECK ("QUALIF_PIC_ID" IS NOT NULL);
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
ALTER TABLE "SCM"."T_VEN_QUALIF_PIC_LOG" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "SCM"."T_VEN_QUALIF_PIC_LOG" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_VEN_QUALIF_PIC_LOG
-- ----------------------------
ALTER TABLE "SCM"."T_VEN_QUALIF_PIC_LOG" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Checks structure for table T_VEN_QUALIF_TYPE
-- ----------------------------
ALTER TABLE "SCM"."T_VEN_QUALIF_TYPE" ADD CHECK ("VENQUALIFTYPE_ID" IS NOT NULL);
ALTER TABLE "SCM"."T_VEN_QUALIF_TYPE" ADD CHECK ("VENQUALIFTYPE_ID" IS NOT NULL);
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
ALTER TABLE "SCM"."T_VEN_QUALIFICATION" ADD CHECK ("QUALIFICATION_ID" IS NOT NULL);
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
ALTER TABLE "SCM"."T_VEN_QUALIFICATION_LOG" ADD CHECK ("ID" IS NOT NULL);
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
ALTER TABLE "SCM"."T_VEN_VENDOR" ADD CHECK ("VEN_ID" IS NOT NULL);
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
ALTER TABLE "SCM"."T_VEN_VENDOR_LOG" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "SCM"."T_VEN_VENDOR_LOG" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_VEN_VENDOR_LOG
-- ----------------------------
ALTER TABLE "SCM"."T_VEN_VENDOR_LOG" ADD PRIMARY KEY ("ID");

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
-- Foreign Key structure for table "SCM"."T_HOP_INC_LOC"
-- ----------------------------
ALTER TABLE "SCM"."T_HOP_INC_LOC" ADD FOREIGN KEY ("INCLOC_PARREFID") REFERENCES "SCM"."T_HOP_INC" ("INC_ID") ON DELETE SET NULL;
ALTER TABLE "SCM"."T_HOP_INC_LOC" ADD FOREIGN KEY ("INCLOC_LOCID") REFERENCES "SCM"."T_SYS_CTLOC" ("CTLOC_ID") ON DELETE SET NULL;

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
-- Foreign Key structure for table "SCM"."T_ORD_ORDERDETAILSUB"
-- ----------------------------
ALTER TABLE "SCM"."T_ORD_ORDERDETAILSUB" ADD FOREIGN KEY ("ORDSUB_DETAIL_ID") REFERENCES "SCM"."T_ORD_ORDERDETAIL" ("ORDER_ID");

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
ALTER TABLE "SCM"."T_VEN_INC" ADD FOREIGN KEY ("VEN_INC_MANFID") REFERENCES "SCM"."T_HOP_MANF" ("ID") ON DELETE SET NULL;
ALTER TABLE "SCM"."T_VEN_INC" ADD FOREIGN KEY ("VEN_INC_VENID") REFERENCES "SCM"."T_VEN_VENDOR" ("VEN_ID") ON DELETE SET NULL;
ALTER TABLE "SCM"."T_VEN_INC" ADD FOREIGN KEY ("VEN_INC_CATID") REFERENCES "SCM"."T_CAT_DRUGGROUPITM" ("SDGI_ID") ON DELETE SET NULL;
