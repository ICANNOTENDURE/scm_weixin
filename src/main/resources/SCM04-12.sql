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

Date: 2015-04-12 23:34:21
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
INSERT INTO "SCM"."T_CAT_DRUGGROUP" VALUES ('办公用品', '办公用品', '14', '23');
INSERT INTO "SCM"."T_CAT_DRUGGROUP" VALUES ('打印纸', '打印纸', '16', '3');
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
INSERT INTO "SCM"."T_CAT_GROUPPROPERTY" VALUES ('101', '58', '棒棒答', '8');
INSERT INTO "SCM"."T_CAT_GROUPPROPERTY" VALUES ('22', '58', '1ml', '6');
INSERT INTO "SCM"."T_CAT_GROUPPROPERTY" VALUES ('81', '58', '1962', '3');
INSERT INTO "SCM"."T_CAT_GROUPPROPERTY" VALUES ('102', '58', '大熊', '8');
INSERT INTO "SCM"."T_CAT_GROUPPROPERTY" VALUES ('104', '58', '大骗子', '8');
INSERT INTO "SCM"."T_CAT_GROUPPROPERTY" VALUES ('105', '58', '好坏好坏的', '8');
INSERT INTO "SCM"."T_CAT_GROUPPROPERTY" VALUES ('106', '58', '神马都是浮云', '8');
INSERT INTO "SCM"."T_CAT_GROUPPROPERTY" VALUES ('9', '58', '1-10', '4');
INSERT INTO "SCM"."T_CAT_GROUPPROPERTY" VALUES ('82', '58', '1983', '3');
INSERT INTO "SCM"."T_CAT_GROUPPROPERTY" VALUES ('15', '58', '20-30', '4');
INSERT INTO "SCM"."T_CAT_GROUPPROPERTY" VALUES ('16', '58', '30-40', '4');
INSERT INTO "SCM"."T_CAT_GROUPPROPERTY" VALUES ('18', '58', '60-70', '4');
INSERT INTO "SCM"."T_CAT_GROUPPROPERTY" VALUES ('63', '58', '1961', '3');
INSERT INTO "SCM"."T_CAT_GROUPPROPERTY" VALUES ('83', '58', '1982', '3');
INSERT INTO "SCM"."T_CAT_GROUPPROPERTY" VALUES ('13', '58', '中外合资1', '10');
INSERT INTO "SCM"."T_CAT_GROUPPROPERTY" VALUES ('17', '58', '50-60', '4');
INSERT INTO "SCM"."T_CAT_GROUPPROPERTY" VALUES ('14', '58', '10-20', '4');
INSERT INTO "SCM"."T_CAT_GROUPPROPERTY" VALUES ('19', '58', '77-99', '4');
INSERT INTO "SCM"."T_CAT_GROUPPROPERTY" VALUES ('64', '58', '1941', '3');
INSERT INTO "SCM"."T_CAT_GROUPPROPERTY" VALUES ('21', '59', '1ml', '6');
INSERT INTO "SCM"."T_CAT_GROUPPROPERTY" VALUES ('23', '58', '100-200', '4');
INSERT INTO "SCM"."T_CAT_GROUPPROPERTY" VALUES ('24', '58', '200-300', '4');
INSERT INTO "SCM"."T_CAT_GROUPPROPERTY" VALUES ('25', '58', '400-500', '4');
INSERT INTO "SCM"."T_CAT_GROUPPROPERTY" VALUES ('26', '58', '600-700', '4');
INSERT INTO "SCM"."T_CAT_GROUPPROPERTY" VALUES ('28', '58', '800-900', '4');
INSERT INTO "SCM"."T_CAT_GROUPPROPERTY" VALUES ('51', '58', '11ml', '6');
INSERT INTO "SCM"."T_CAT_GROUPPROPERTY" VALUES ('45', '58', '4ml', '6');
INSERT INTO "SCM"."T_CAT_GROUPPROPERTY" VALUES ('50', '58', '10ml', '6');
INSERT INTO "SCM"."T_CAT_GROUPPROPERTY" VALUES ('52', '58', '12ml', '6');
INSERT INTO "SCM"."T_CAT_GROUPPROPERTY" VALUES ('53', '58', '13ml', '6');
INSERT INTO "SCM"."T_CAT_GROUPPROPERTY" VALUES ('65', '58', '我就要卖进口的', '10');
INSERT INTO "SCM"."T_CAT_GROUPPROPERTY" VALUES ('66', '58', '国产的最棒', '10');
INSERT INTO "SCM"."T_CAT_GROUPPROPERTY" VALUES ('84', '58', '1981', '3');
INSERT INTO "SCM"."T_CAT_GROUPPROPERTY" VALUES ('103', '58', '我是韩mm', '8');
INSERT INTO "SCM"."T_CAT_GROUPPROPERTY" VALUES ('11', '58', '么么哒', '8');
INSERT INTO "SCM"."T_CAT_GROUPPROPERTY" VALUES ('27', '58', '700-800', '4');
INSERT INTO "SCM"."T_CAT_GROUPPROPERTY" VALUES ('41', '58', '9999999', '4');
INSERT INTO "SCM"."T_CAT_GROUPPROPERTY" VALUES ('42', '58', '1000-2000', '4');
INSERT INTO "SCM"."T_CAT_GROUPPROPERTY" VALUES ('43', '58', '2ml', '6');
INSERT INTO "SCM"."T_CAT_GROUPPROPERTY" VALUES ('44', '58', '3ml', '6');
INSERT INTO "SCM"."T_CAT_GROUPPROPERTY" VALUES ('46', '58', '5ml', '6');
INSERT INTO "SCM"."T_CAT_GROUPPROPERTY" VALUES ('47', '58', '7ml', '6');
INSERT INTO "SCM"."T_CAT_GROUPPROPERTY" VALUES ('48', '58', '8ml', '6');
INSERT INTO "SCM"."T_CAT_GROUPPROPERTY" VALUES ('49', '58', '9ml', '6');

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
INSERT INTO "SCM"."T_CAT_PROPERTY" VALUES ('6', '3', '规格');
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
"ELE_RECSPEED" NUMBER NULL ,
"ELE_VENINCID" NUMBER NULL 
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
INSERT INTO "SCM"."T_HOP_EVALUTE" VALUES ('32', null, '6050', TO_TIMESTAMP(' 2015-02-05 18:45:56:229000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '1', '7121', '1', '2222方芳芳', null, null, '6331');
INSERT INTO "SCM"."T_HOP_EVALUTE" VALUES ('83', null, '3301', TO_TIMESTAMP(' 2015-03-27 12:25:39:495000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '67', '7121', null, '哈哈哈哈哈哈，还不错呀，大家用了多说好！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！', null, null, '6330');
INSERT INTO "SCM"."T_HOP_EVALUTE" VALUES ('84', null, null, TO_TIMESTAMP(' 2015-03-27 12:12:15:299000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '67', null, null, '少时诵诗书', null, null, null);
INSERT INTO "SCM"."T_HOP_EVALUTE" VALUES ('108', null, '4201', TO_TIMESTAMP(' 2015-03-30 11:31:25:816000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '67', '7121', '5', '还不错啊，很好，！', null, null, '6331');
INSERT INTO "SCM"."T_HOP_EVALUTE" VALUES ('128', null, '5201', TO_TIMESTAMP(' 2015-03-30 14:54:34:257000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '67', '7121', '4', '还挺好的', null, null, '6331');
INSERT INTO "SCM"."T_HOP_EVALUTE" VALUES ('43', null, '7051', TO_TIMESTAMP(' 2015-02-05 18:50:35:403000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '1', '7142', '5', '方法', null, null, '6331');
INSERT INTO "SCM"."T_HOP_EVALUTE" VALUES ('44', null, '7050', TO_TIMESTAMP(' 2015-02-05 18:45:52:123000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '1', '7141', '3', '方芳芳', null, null, '6331');
INSERT INTO "SCM"."T_HOP_EVALUTE" VALUES ('101', null, null, TO_TIMESTAMP(' 2015-03-28 10:46:06:524000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '67', null, null, 'adsasdads', null, null, null);
INSERT INTO "SCM"."T_HOP_EVALUTE" VALUES ('102', null, '4056', TO_TIMESTAMP(' 2015-03-28 10:46:37:309000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '67', '7121', null, 'fdddddddddddddddddd', null, null, '6331');
INSERT INTO "SCM"."T_HOP_EVALUTE" VALUES ('41', null, '7053', TO_TIMESTAMP(' 2015-02-05 18:45:35:636000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '1', '7141', '5', '方法', null, null, '6331');
INSERT INTO "SCM"."T_HOP_EVALUTE" VALUES ('42', null, '7052', TO_TIMESTAMP(' 2015-02-09 13:47:28:835000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '1', '7142', '2', '地方法', null, null, '6331');
INSERT INTO "SCM"."T_HOP_EVALUTE" VALUES ('103', null, '4056', TO_TIMESTAMP(' 2015-03-28 10:46:40:762000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '67', '7121', '4', 'fdddddddddddddddddd', null, null, '6331');
INSERT INTO "SCM"."T_HOP_EVALUTE" VALUES ('104', null, '4151', TO_TIMESTAMP(' 2015-03-28 17:11:34:145000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '67', '7121', '4', '232332', null, null, '6331');
INSERT INTO "SCM"."T_HOP_EVALUTE" VALUES ('105', null, '4153', TO_TIMESTAMP(' 2015-03-28 17:45:02:295000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '67', '7121', '4', 'ffffff', null, null, '6331');
INSERT INTO "SCM"."T_HOP_EVALUTE" VALUES ('81', null, null, TO_TIMESTAMP(' 2015-03-27 11:32:02:538000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '67', null, null, null, null, null, null);
INSERT INTO "SCM"."T_HOP_EVALUTE" VALUES ('82', null, '3302', TO_TIMESTAMP(' 2015-03-27 14:29:11:874000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '67', '7121', null, 'good！！good！！good！！good！！good！！good！！good！！good！！good！！good！！good！！good！！good！！good！！good！！good！！good！！good！！good！！good！！good！！good！！good！！good！！good！！good！！good！！good！！good！！good！！good！！good！！good！！good！！good！！good！！good！！good！！good！！good！！good！！good！！good！！good！！good！！good！！good！！good！！good！！good！！good！！good！！', null, null, '6331');
INSERT INTO "SCM"."T_HOP_EVALUTE" VALUES ('85', null, null, TO_TIMESTAMP(' 2015-03-27 14:30:00:777000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '67', null, null, 'sssssssssssssssssssss', null, null, null);
INSERT INTO "SCM"."T_HOP_EVALUTE" VALUES ('86', null, null, TO_TIMESTAMP(' 2015-03-27 14:30:12:479000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '67', null, null, 'dddddddddddddddddddd', null, null, null);
INSERT INTO "SCM"."T_HOP_EVALUTE" VALUES ('87', null, '3352', TO_TIMESTAMP(' 2015-03-27 14:30:20:425000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '67', '7121', null, 'sssssssssssssssssssssssssssssssss', null, null, '6331');
INSERT INTO "SCM"."T_HOP_EVALUTE" VALUES ('106', null, '4152', TO_TIMESTAMP(' 2015-03-28 17:51:32:100000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '67', '7142', '5', 'ffffffffffffffgood', null, null, '6341');
INSERT INTO "SCM"."T_HOP_EVALUTE" VALUES ('107', null, '4150', TO_TIMESTAMP(' 2015-03-28 17:51:38:233000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '67', '7142', '4', 'sssssssssssssssssssss', null, null, '6341');
INSERT INTO "SCM"."T_HOP_EVALUTE" VALUES ('61', null, '8100', TO_TIMESTAMP(' 2015-03-20 10:20:15:917000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '67', '7121', '4', '好', null, null, '6331');

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
INSERT INTO "SCM"."T_HOP_INC" VALUES ('7240', '新绿天章70克A4复印纸', '9', '包', null, null, null, '1941', '19793', null, '7', '2', '得力6600-0.5mm', '25', null, null);
INSERT INTO "SCM"."T_HOP_INC" VALUES ('三黄片', '医用纱布10片装', '包', '包', null, null, null, null, '19795', null, '7', null, null, '24', null, null);
INSERT INTO "SCM"."T_HOP_INC" VALUES ('得力中性笔(黑)', '得力中性笔(黑) ', '17', '支', null, null, null, '1941', '19796', null, '7', null, '得力6600-0.5mm', '25', '24', null);
INSERT INTO "SCM"."T_HOP_INC" VALUES ('999感冒灵', '医用纱布包84cm800cm', '包', '包', null, null, null, null, '19797', null, '7', null, null, '24', '10', null);
INSERT INTO "SCM"."T_HOP_INC" VALUES ('525', '一次性无菌注射器', '17', '支', null, null, null, null, '19788', null, '7', null, '10.00g', '22', null, null);
INSERT INTO "SCM"."T_HOP_INC" VALUES ('中性笔', '中性笔', null, '支', null, null, null, null, '19789', null, '7', null, '支', '21', null, null);
INSERT INTO "SCM"."T_HOP_INC" VALUES ('心脏支架', '心脏支架', '支', '支', null, null, null, null, '19790', null, '7', null, null, '23', null, null);
INSERT INTO "SCM"."T_HOP_INC" VALUES (' 5毫升 6号(注射器)', '一次性无菌注射器', '支', '支', null, null, null, null, '19792', null, '7', null, '双', '25', null, null);
INSERT INTO "SCM"."T_HOP_INC" VALUES ('拖把', '拖把', '把', '把', null, null, null, null, '19794', null, '7', null, '把', '25', null, null);
INSERT INTO "SCM"."T_HOP_INC" VALUES ('手术刀', '手术刀', '把', '把', null, null, null, null, '19801', null, '7', null, null, '26', null, null);
INSERT INTO "SCM"."T_HOP_INC" VALUES ('7696', '注射器524', '17', '支', null, null, null, '1941', '19821', null, '7', null, null, null, null, null);
INSERT INTO "SCM"."T_HOP_INC" VALUES ('525', '注射器525', '17', '盒(12)', null, null, null, '1941', '19822', null, '7', null, null, null, null, null);
INSERT INTO "SCM"."T_HOP_INC" VALUES ('XY00001', '阿莫西林', 'mg', 'mg', null, null, null, null, '19761', null, '7', null, null, '27', null, null);
INSERT INTO "SCM"."T_HOP_INC" VALUES ('XY0002', '国产注射器', '支', '支', null, null, null, null, '19762', null, '7', null, null, '23', null, null);
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
INSERT INTO "SCM"."T_HOP_MANF" VALUES ('1961', '600', '山东蓝翔', null);
INSERT INTO "SCM"."T_HOP_MANF" VALUES ('1962', '601', '广西金嗓子', null);
INSERT INTO "SCM"."T_HOP_MANF" VALUES ('1981', '599', '武汉建民', null);
INSERT INTO "SCM"."T_HOP_MANF" VALUES ('1982', '598', '三金制药', null);
INSERT INTO "SCM"."T_HOP_MANF" VALUES ('1983', '597', '三九制药', null);
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
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6619', '416', 'ZWMK-北京中卫美康科技有限公司
', null, null, null, null, null, null, '7604', 'ZWMKbjzwmkkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6620', '417', 'ZHXT-北京钟汉鑫泰科技发展
', null, null, null, null, null, null, '7605', 'ZHXTbjzhxtkjfz', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6621', '418', 'ZTHF-北京周天华枫医疗仪器有限公司
', null, null, null, null, null, null, '7606', 'ZTHFbjzthfylyqyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6622', '419', 'BK-波科国际
医疗贸易(上海)有限公司', null, null, null, null, null, null, '7607', 'BKbkgjylmyshyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6623', '420', 'DFLG-东方莱格医药科技(北京)有限公司
', null, null, null, null, null, null, '7608', 'DFLGdflgyykjbjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6624', '421', 'GYJT-国药集团北京医疗器械有限公司
', null, null, null, null, null, null, '7609', 'GYJTgyjtbjylqxyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6625', '422', 'NJLS-南京郎森
', null, null, null, null, null, null, '7610', 'NJLSnjls', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6626', '423', 'NJWC-南京微创
', null, null, null, null, null, null, '7611', 'NJWCnjwc', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6627', '424', 'PDH-北京普德鸿医学技术有限公司
', null, null, null, null, null, null, '7612', 'PDHbjpdhyxjsyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6628', '425', 'SDWG-山东威高集团北京销售分公司', null, null, null, null, null, null, '7613', 'SDWGsdwgjtbjxsfgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6629', '426', 'SHKH-上海科华生物工程股份有限公司
', null, null, null, null, null, null, '7614', 'SHKHshkhswgcgfyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6630', '427', 'TJHNH-天津哈娜好医材有限公司
', null, null, null, null, null, null, '7615', 'TJHNHtjhnhycyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6631', '428', 'WHPM-万华普曼生物工程有限公司
', null, null, null, null, null, null, '7616', 'WHPMwhpmswgcyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6632', '429', 'ZJGD-浙江拱东
医用塑料厂北京办事处', null, null, null, null, null, null, '7617', 'ZJGDzjgdyyslcbjbsc', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6633', '430', 'ZHHJ-珠海和佳医疗设备股份有限公司
', null, null, null, null, null, null, '7618', 'ZHHJzhhjylsbgfyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6634', '431', 'GZBJSZ-北京顺展天拓科技有限公司', null, null, null, null, null, null, '7619', 'GZBJSZbjszttkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6635', '432', 'GZHMST-霍姆斯特（北京）环境科技有限公司', null, null, null, null, null, null, '7620', 'GZHMSThmstbjhjkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6636', '433', 'GZBJHY-北京湖源兴科贸有限公司', null, null, null, null, null, null, '7621', 'GZBJHYbjhyxkmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6637', '434', 'CJRD-北京创捷锐达科贸中心', null, null, null, null, null, null, '7622', 'CJRDbjcjrdkmzx', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6638', '435', 'GZQQSYL-北京千千树医疗设备有限公司', null, null, null, null, null, null, '7623', 'GZQQSYLbjqqsylsbyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6639', '436', 'MZXYF-门诊西药房', null, null, null, null, null, null, '7624', 'MZXYFmzxyf', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6640', '437', 'PFXBMZYF-皮肤性病门诊药房', null, null, null, null, null, null, '7625', 'PFXBMZYFpfxbmzyf', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6641', '438', 'GZBJYHHX-北京永和恒信科技发展有限公司', null, null, null, null, null, null, '7626', 'GZBJYHHXbjyhhxkjfzyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6642', '439', 'BJDTYY-北京地坛医院', null, null, null, null, null, null, '7627', 'BJDTYYbjdtyy', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6643', '440', 'ZXYF-中心药房', null, null, null, null, null, null, '7628', 'ZXYFzxyf', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6644', '441', 'MZZYF-门诊中药房', null, null, null, null, null, null, '7629', 'MZZYFmzzyf', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6645', '442', 'JMPYZX-静脉配液中心', null, null, null, null, null, null, '7630', 'JMPYZXjmpyzx', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6646', '444', 'DWSJ-北京大卫世纪生物技术开发有限公司
', null, null, null, null, null, null, '7631', 'DWSJbjdwsjswjskfyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6647', '445', 'dtyy-地坛医院老院库存', null, null, null, null, null, null, '7632', 'dtyydtyylykc', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6648', '446', '北京市富平和文化用品经营部', null, null, null, null, null, null, '7633', 'bjsfphwhypjyb', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6649', '447', 'BJYT-北京永拓动力科技发展有限公司', null, null, null, null, null, null, '7634', 'BJYTbjytdlkjfzyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6650', '448', 'deb-北京得尔贝经贸有限公司', null, null, null, null, null, null, '7635', 'debbjdebjmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6651', '449', 'ycsd-北京永昌盛达科技有限公司', null, null, null, null, null, null, '7636', 'ycsdbjycsdkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6652', '450', 'hxy-北京市华信医疗电子设备公司', null, null, null, null, null, null, '7637', 'hxybjshxyldzsbgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6653', '451', 'dqsd-北京德勤时代生物科技有限公司', null, null, null, null, null, null, '7638', 'dqsdbjdqsdswkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6654', '452', 'bljh-北京百利嘉华商贸有限公司', null, null, null, null, null, null, '7639', 'bljhbjbljhsmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6655', '453', 'dbzy-东北制药总厂', null, null, null, null, null, null, '7640', 'dbzydbzyzc', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6656', '454', 'shdsn-上海迪赛诺生物医药有限公司', null, null, null, null, null, null, '7641', 'shdsnshdsnswyyyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6657', '455', 'HSSJ-北京华顺世纪科技有限公司', null, null, null, null, null, null, '7642', 'HSSJbjhssjkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6658', '456', 'bjdxdlyy-北京大学第六医院', null, null, null, null, null, null, '7643', 'bjdxdlyybjdxdlyy', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6659', '457', 'htzy-北京华天泽宇医疗器械有限公司', null, null, null, null, null, null, '7644', 'htzybjhtzyylqxyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6660', '458', 'kly-北京科利亚生物技术有限公司', null, null, null, null, null, null, '7645', 'klybjklyswjsyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6661', '459', 'layx-北京龙安医学技术开发公司', null, null, null, null, null, null, '7646', 'layxbjlayxjskfgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6662', '460', 'JCTW-北京京朝腾微医学科技有限公司', null, null, null, null, null, null, '7647', 'JCTWbjjctwyxkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6663', '461', 'DSK-北京德善康科技有限公司', null, null, null, null, null, null, '7648', 'DSKbjdskkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6664', '462', 'xctz-北京信诚拓展医疗器械有限公司', null, null, null, null, null, null, '7649', 'xctzbjxctzylqxyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6665', '463', 'LSL-北京来时路医用材料有限责任公司', null, null, null, null, null, null, '7650', 'LSLbjlslyyclyxzrgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6666', '464', 'RSB-北京容圣博投资顾问有限公司', null, null, null, null, null, null, '7651', 'RSBbjrsbtzgwyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6667', '465', 'BSCX-百事创新(北京)科技有限公司', null, null, null, null, null, null, '7652', 'BSCXbscxbjkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6668', '466', 'bjla-北京龙安医学技术开发公司', null, null, null, null, null, null, '7653', 'bjlabjlayxjskfgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6669', '467', 'LHTX-北京利华同兴科贸中心', null, null, null, null, null, null, '7654', 'LHTXbjlhtxkmzx', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6670', '468', 'KYDC-北京开元达成科技中心', null, null, null, null, null, null, '7655', 'KYDCbjkydckjzx', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6671', '469', 'LYY-北京鹭羿岩医药科技有限公司', null, null, null, null, null, null, '7656', 'LYYbjlyyyykjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6672', '470', 'KNSD-北京科诺时代科技有限公司', null, null, null, null, null, null, '7657', 'KNSDbjknsdkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6673', '471', 'HYKY-北京海盈凯悦科技有限责任公司', null, null, null, null, null, null, '7658', 'HYKYbjhykykjyxzrgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6674', '472', 'YFC-北京益福昌医疗设备有限责任公司', null, null, null, null, null, null, '7659', 'YFCbjyfcylsbyxzrgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6675', '473', 'SMH-北京施迈惠商贸有限公司', null, null, null, null, null, null, '7660', 'SMHbjsmhsmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6676', '474', 'JMWSD-北京京门威士达医疗器械有限公司', null, null, null, null, null, null, '7661', 'JMWSDbjjmwsdylqxyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6677', '475', 'bjxhx-北京市鑫河旭印刷厂', null, null, null, null, null, null, '7662', 'bjxhxbjsxhxysc', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6678', '476', 'SSXY-北京盛世兴业科技开发有限公司', null, null, null, null, null, null, '7663', 'SSXYbjssxykjkfyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6679', '477', 'bjrfl-北京日枫霖工装设计制作有限责任公司', null, null, null, null, null, null, '7664', 'bjrflbjrflgzsjzzyxzrgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6680', '478', 'bjfhx-北京丰红兴纺织品有限公司', null, null, null, null, null, null, '7665', 'bjfhxbjfhxfzpyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6681', '479', 'tzxb-北京市通州鑫宝卫生材料厂', null, null, null, null, null, null, '7666', 'tzxbbjstzxbwsclc', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6682', '480', 'jway-北京市京卫安宜技术发展有限公司', null, null, null, null, null, null, '7667', 'jwaybjsjwayjsfzyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6683', '481', 'dfyq-北京东方医用气体有限公司', null, null, null, null, null, null, '7668', 'dfyqbjdfyyqtyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6684', '482', 'BJKCL-北京康齿乐医学科技有限公司', null, null, null, null, null, null, '7669', 'BJKCLbjkclyxkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6685', '483', 'MDKT-北京麦迪科特医疗器械有限责任公司', null, null, null, null, null, null, '7670', 'MDKTbjmdktylqxyxzrgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6686', '484', 'LJC-北京利嘉诚医药科技有限公司', null, null, null, null, null, null, '7671', 'LJCbjljcyykjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6687', '485', 'lykc-老院库存', null, null, null, null, null, null, '7672', 'lykclykc', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6688', '486', 'GJKJ-北京光健科技发展有限公司', null, null, null, null, null, null, '7673', 'GJKJbjgjkjfzyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6689', '487', 'slhm-北京双利华茂工贸有限公司', null, null, null, null, null, null, '7674', 'slhmbjslhmgmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6690', '488', 'ysyj-北京一商宇洁商贸有限公司', null, null, null, null, null, null, '7675', 'ysyjbjysyjsmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6691', '489', 'ryx-北京仁宇鑫工贸有限公司', null, null, null, null, null, null, '7676', 'ryxbjryxgmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6692', '490', 'HKMD-北京惠康美达科技有限公司', null, null, null, null, null, null, '7677', 'HKMDbjhkmdkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6693', '491', 'RFKJ-北京日枫科技有限公司', null, null, null, null, null, null, '7678', 'RFKJbjrfkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6694', '492', 'DFRA-北京东方瑞澳医疗设备有限公司', null, null, null, null, null, null, '7679', 'DFRAbjdfraylsbyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6695', '493', 'FZMX-福州迈新生物技术开发有限公司', null, null, null, null, null, null, '7680', 'FZMXfzmxswjskfyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6696', '494', 'ZSJQ-北京中杉金桥生物技术有限公司', null, null, null, null, null, null, '7681', 'ZSJQbjzsjqswjsyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6697', '495', 'JDLH-北京健德联合口腔医疗设备有限公司', null, null, null, null, null, null, '7682', 'JDLHbjjdlhkqylsbyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6698', '496', 'SM-北京圣曼医疗器材技术有限公司', null, null, null, null, null, null, '7683', 'SMbjsmylqcjsyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6699', '497', 'HSK-北京合盛康科贸有限公司', null, null, null, null, null, null, '7684', 'HSKbjhskkmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6700', '498', 'XTKQ-北京先通康桥医药科技有限公司
', null, null, null, null, null, null, '7685', 'XTKQbjxtkqyykjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6701', '499', 'jyjl-北京市京盐金龙副食经营部', null, null, null, null, null, null, '7686', 'jyjlbjsjyjlfsjyb', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6702', '500', 'xhx-北京市鑫河旭印刷厂', null, null, null, null, null, null, '7687', 'xhxbjsxhxysc', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6703', '501', 'zzhy-北京周庄弘燕农副产品市场中心', null, null, null, null, null, null, '7688', 'zzhybjzzhynfcpsczx', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6704', '502', 'jyjl-北京市京盐金龙副食经营部', null, null, null, null, null, null, '7689', 'jyjlbjsjyjlfsjyb', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6705', '503', 'hlh-北京市恒利和阀门五金销售部', null, null, null, null, null, null, '7690', 'hlhbjshlhfmwjxsb', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6706', '504', 'xrgg-北京新锐广告制作有限公司', null, null, null, null, null, null, '7691', 'xrggbjxrggzzyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6707', '505', 'cszj-北京城市之洁环卫服务中心', null, null, null, null, null, null, '7692', 'cszjbjcszjhwfwzx', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6708', '506', 'rfl-北京日枫霖工装设计制作有限责任公司', null, null, null, null, null, null, '7693', 'rflbjrflgzsjzzyxzrgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6709', '507', 'SHCD-上海长岛抗体诊断试剂有限公司', null, null, null, null, null, null, '7694', 'SHCDshzdktzdsjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6710', '508', 'pay-北京平安银科技发展有限公司', null, null, null, null, null, null, '7695', 'paybjpaykjfzyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6711', '509', 'WSBL-北京旺市百利商业有限公司飘亮购物中心', null, null, null, null, null, null, '7696', 'WSBLbjwsblsyyxgsplgwzx', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6712', '510', 'HXSJ-国药集团化学试剂北京有限公司', null, null, null, null, null, null, '7697', 'HXSJgyjthxsjbjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6713', '511', 'BBKY-北京北博科仪商贸有限公司', null, null, null, null, null, null, '7698', 'BBKYbjbbkysmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6714', '512', 'XMR-北京欣明仁医疗器械技术有限公司', null, null, null, null, null, null, '7699', 'XMRbjxmrylqxjsyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6715', '513', 'ZZFM-涿州福美神盾生物科技有限公司', null, null, null, null, null, null, '7700', 'ZZFMzzfmsdswkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6716', '514', 'KDW-北京康德威医疗设备有限公司', null, null, null, null, null, null, '7701', 'KDWbjkdwylsbyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6221', '0', null, null, null, null, null, null, null, '7221', null, '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6222', '4', 'BWYK-北京北卫粤康医药有限公司', null, null, null, null, null, null, '7222', 'BWYKbjbwykyyyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6223', '5', 'DTKJ-北京德天科技发展公司', null, null, null, null, null, null, '7223', 'DTKJbjdtkjfzgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6224', '6', 'FYD-北京富亚东医药有限公司', null, null, null, null, null, null, '7224', 'FYDbjfydyyyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6225', '7', 'GAYY-北京广安医药联合中心', null, null, null, null, null, null, '7225', 'GAYYbjgayylhzx', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6226', '8', 'HFHK-北京华峰惠康医药有限公司', null, null, null, null, null, null, '7176', 'HFHKbjhfhkyyyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6227', '9', 'HJZY-北京华靳制药有限公司', null, null, null, null, null, null, '7226', 'HJZYbjhjzyyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6228', '10', 'HLKT-北京华立科泰医药有限公司', null, null, null, null, null, null, '7178', 'HLKTbjhlktyyyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6229', '11', 'HLKT-北京华立科泰医药有限责任公司', null, null, null, null, null, null, '7180', 'HLKTbjhlktyyyxzrgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6230', '12', 'YZ-北京华立永正医药有限公司', null, null, null, null, null, null, '7181', 'YZbjhlyzyyyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6231', '13', 'HMTY-北京鹤鸣堂医药有限责任公司', null, null, null, null, null, null, '7183', 'HMTYbjhmtyyyxzrgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6232', '14', 'JRKX-北京今日康旭医药有限公司', null, null, null, null, null, null, '7184', 'JRKXbjjrkxyyyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6233', '15', 'JXFX-北京金象复星医药股份有限公司', null, null, null, null, null, null, '7188', 'JXFXbjjxfxyygfyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6234', '16', 'KCYY-北京康辰医药发展有限公司', null, null, null, null, null, null, '7189', 'KCYYbjkcyyfzyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6235', '17', 'KLH-北京康利华药业', null, null, null, null, null, null, '7192', 'KLHbjklhyy', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6236', '18', 'KYXH-北京科园信海医药经营有限公司', null, null, null, null, null, null, '7195', 'KYXHbjkyxhyyjyyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6237', '19', 'YZSM-北京乐章商贸有限公司', null, null, null, null, null, null, '7196', 'YZSMbjlzsmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6238', '20', 'PRH-北京普仁鸿医药销售有限公司', null, null, null, null, null, null, '7197', 'PRHbjprhyyxsyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6239', '21', 'REZK-北京瑞尔泽康医疗设备有限公司', null, null, null, null, null, null, '7198', 'REZKbjrezkylsbyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6240', '22', 'YBQX-北京市医保全新大药房有限责任公司朱鹤堂药店', null, null, null, null, null, null, '7200', 'YBQXbjsybqxdyfyxzrgszhtyd', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6241', '23', 'DCJQ-北京市东城区疾病预防控制中心', null, null, null, null, null, null, '7201', 'DCJQbjsdcqjbyfkzzx', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6242', '24', 'SHYY-北京双鹤药业经营有限公司', null, null, null, null, null, null, '7227', 'SHYYbjshyyjyyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6243', '25', 'JWGK-北京市京卫国康医药有限公司', null, null, null, null, null, null, '7228', 'JWGKbjsjwgkyyyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6244', '26', 'BJSJYY-北京市燕京医药公司', null, null, null, null, null, null, '7229', 'BJSJYYbjsyjyygs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6245', '27', 'KL-北京市康联医药有限责任公司', null, null, null, null, null, null, '7230', 'KLbjsklyyyxzrgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6246', '28', 'BJSYLC-北京首医临床医学科技中心', null, null, null, null, null, null, '7231', 'BJSYLCbjsylcyxkjzx', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6247', '29', 'BJSYYB-北京市医药保健品进出口公司', null, null, null, null, null, null, '7232', 'BJSYYBbjsyybjpjckgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6248', '30', 'TRKM-北京驼人科贸有限公司', null, null, null, null, null, null, '7233', 'TRKMbjtrkmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6249', '31', 'BJTRTC-北京同仁堂崇文门药店有限责任公司', null, null, null, null, null, null, '7234', 'BJTRTCbjtrtcwmydyxzrgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6250', '32', 'TSL-北京天士力医药有限公司', null, null, null, null, null, null, '7235', 'TSLbjtslyyyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6251', '33', 'TXPX-北京天星普信生物医药有限公司', null, null, null, null, null, null, '7236', 'TXPXbjtxpxswyyyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6252', '34', 'TYHY-北京太洋环宇医药有限责任公司', null, null, null, null, null, null, '7237', 'TYHYbjtyhyyyyxzrgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6253', '35', 'WWYY-北京万维医药有限公司', null, null, null, null, null, null, '7238', 'WWYYbjwwyyyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6254', '36', 'BJXTYY-北京夏图医药有限公司', null, null, null, null, null, null, '7239', 'BJXTYYbjxtyyyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6255', '37', 'BJYBQX-北京医保全新大药房责任有限公司', null, null, null, null, null, null, '7240', 'BJYBQXbjybqxdyfzryxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6256', '38', 'YDYY-北京远东医药发展公司', null, null, null, null, null, null, '7241', 'YDYYbjydyyfzgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6257', '39', 'BJYHYX-北京协和医学科学技术开发公司', null, null, null, null, null, null, '7242', 'BJYHYXbjxhyxkxjskfgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6258', '40', 'YPSH-北京益普四环医药技术开发有限公司', null, null, null, null, null, null, '7243', 'YPSHbjypshyyjskfyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6259', '41', 'JY-北京医药股份有限公司经营分公司', null, null, null, null, null, null, '7244', 'JYbjyygfyxgsjyfgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6260', '42', 'SP-北京医药股份有限公司药品分公司', null, null, null, null, null, null, '7245', 'SPbjyygfyxgsypfgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6261', '43', 'YYXX-中国永裕新兴医药有限公司', null, null, null, null, null, null, '7246', 'YYXXzgyyxxyyyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6262', '44', 'BJZDBF-北京振德北方医用敷料有限公司', null, null, null, null, null, null, '7247', 'BJZDBFbjzdbfyyflyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6263', '45', 'BJZXYY-北京中欣医药经营公司', null, null, null, null, null, null, '7248', 'BJZXYYbjzxyyjygs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6264', '46', 'BJZYKY-北京中预科医药有限公司', null, null, null, null, null, null, '7249', 'BJZYKYbjzykyyyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6265', '47', 'GDSZHS-广东省珠海市康鸣医药有限公司', null, null, null, null, null, null, '7250', 'GDSZHSgdszhskmyyyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6266', '48', 'GYJTYX-国药集团药业股份有限公司', null, null, null, null, null, null, '7251', 'GYJTYXgyjtyygfyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6267', '49', 'HH-国药控股北京华鸿有限公司', null, null, null, null, null, null, '7252', 'HHgykgbjhhyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6268', '50', 'GA-国药控股北京有限公司广安药品分公司', null, null, null, null, null, null, '7253', 'GAgykgbjyxgsgaypfgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6269', '51', 'XTY-国药控股北京有限公司新特药品分司', null, null, null, null, null, null, '7254', 'XTYgykgbjyxgsxtypfs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6270', '52', 'YP-国药控股北京有限公司药品分公司', null, null, null, null, null, null, '7255', 'YPgykgbjyxgsypfgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6271', '53', 'HNPAJT-河南飘安集团有限公司', null, null, null, null, null, null, '7256', 'HNPAJThnpajtyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6272', '54', 'SCYDCY-四川远大蜀阳药业有限公司', null, null, null, null, null, null, '7257', 'SCYDCYscydsyyyyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6273', '55', 'ADF-深圳安多福实业发展有限公司', null, null, null, null, null, null, '7258', 'ADFszadfsyfzyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6274', '56', 'XXSHKW-新乡市华康卫材有限公司', null, null, null, null, null, null, '7259', 'XXSHKWxxshkwcyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6275', '57', 'XXSHXW-新乡市华西卫材有限公司', null, null, null, null, null, null, '7260', 'XXSHXWxxshxwcyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6276', '58', 'ZGYXKX-中国医学科学院肿瘤医院', null, null, null, null, null, null, '7261', 'ZGYXKXzgyxkxyzlyy', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6277', '59', 'TYMKYY-通用美康医药有限公司', null, null, null, null, null, null, '7262', 'TYMKYYtymkyyyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6278', '60', 'DWMY-中国医药对外贸易总公司销售分公司', null, null, null, null, null, null, '7263', 'DWMYzgyydwmyzgsxsfgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6279', '61', 'YYGY-中国医药工业有限公司', null, null, null, null, null, null, '7264', 'YYGYzgyygyyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6280', '62', '北京贝尔达科技发展公司', null, null, null, null, null, null, '7265', 'bjbedkjfzgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6281', '63', '北京北方光电有限公司', null, null, null, null, null, null, '7266', 'bjbfgdyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6282', '64', 'GZBJBJ-北京邦杰康普科贸有限公司', null, null, null, null, null, null, '7267', 'GZBJBJbjbjkpkmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6283', '66', '北京医药股份有限公司医疗器械公司', null, null, null, null, null, null, '7268', 'bjyygfyxgsylqxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6284', '68', '重庆永通信息工程公司', null, null, null, null, null, null, '7269', 'zqytxxgcgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6285', '69', '北京得尔贝经贸公司', null, null, null, null, null, null, '7270', 'bjdebjmgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6286', '70', '北京东方信恒科技发展有限公司', null, null, null, null, null, null, '7271', 'bjdfxhkjfzyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6287', '71', '北京东华原医疗设备公司', null, null, null, null, null, null, '7272', 'bjdhyylsbgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6288', '72', 'bjfph-北京市富平和文化用品经营部', null, null, null, null, null, null, '7273', 'bjfphbjsfphwhypjyb', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6289', '73', '北京国力泰医疗器械公司', null, null, null, null, null, null, '7274', 'bjgltylqxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6290', '74', '国药集团北京医疗器械公司', null, null, null, null, null, null, '7275', 'gyjtbjylqxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6291', '76', 'GZBJHN-北京昊诺斯科技有限公司', null, null, null, null, null, null, '7276', 'GZBJHNbjhnskjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6292', '77', '北京华瑞世纪科技有限公司', null, null, null, null, null, null, '7277', 'bjhrsjkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6293', '78', '杭州嘉益医疗器械有限公司北京分公司', null, null, null, null, null, null, '7278', 'hzjyylqxyxgsbjfgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6294', '79', '北京华正鸣泽信息技术公司', null, null, null, null, null, null, '7279', 'bjhzmzxxjsgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6295', '80', '北京金宝光华医疗器械有限公司', null, null, null, null, null, null, '7280', 'bjjbghylqxyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6296', '81', 'GZBJJD-北京京东科技有限公司', null, null, null, null, null, null, '7281', 'GZBJJDbjjdkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6297', '82', '北京健康广济公司', null, null, null, null, null, null, '7282', 'bjjkgjgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6298', '83', '北京金新亚科技有限公司', null, null, null, null, null, null, '7283', 'bjjxykjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6299', '84', '北京科佳诚科技发展有限公司', null, null, null, null, null, null, '7284', 'bjkjckjfzyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6300', '85', '北京康莱乐医疗器械有限公司', null, null, null, null, null, null, '7285', 'bjkllylqxyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6301', '86', 'GZBJLA-北京龙安医学技术开发公司', null, null, null, null, null, null, '7286', 'GZBJLAbjlayxjskfgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6302', '87', '北京利文商贸公司', null, null, null, null, null, null, '7287', 'bjlwsmgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6303', '88', '北京六一仪器厂', null, null, null, null, null, null, '7288', 'bjlyyqc', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6304', '89', '北京麦迪锦诚医疗器械公司', null, null, null, null, null, null, '7289', 'bjmdjcylqxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6305', '90', '北京南合西有限公司', null, null, null, null, null, null, '7290', 'bjnhxyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6306', '91', '北京瑞迈商贸中心', null, null, null, null, null, null, '7291', 'bjrmsmzx', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6307', '92', '北京瑞康华科技发展中心', null, null, null, null, null, null, '7292', 'bjrkhkjfzzx', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6308', '93', '北京三明益康医疗器械公司', null, null, null, null, null, null, '7293', 'bjsmykylqxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6309', '94', '深圳赛得立公司', null, null, null, null, null, null, '7294', 'szsdlgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6310', '95', '天津开发区合普工贸有限公司', null, null, null, null, null, null, '7295', 'tjkfqhpgmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6311', '96', '桐庐康基伟业医疗器械公司', null, null, null, null, null, null, '7296', 'tlkjwyylqxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6312', '97', '北京鑫荣腾飞商贸公司', null, null, null, null, null, null, '7297', 'bjxrtfsmgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6313', '98', '北京鑫四环消毒技术公司', null, null, null, null, null, null, '7298', 'bjxshxdjsgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6314', '99', '北京鑫舒康医疗设备有限公司', null, null, null, null, null, null, '7299', 'bjxskylsbyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6315', '100', '北京原平皓生物技术公司', null, null, null, null, null, null, '7300', 'bjyphswjsgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6316', '101', '北京元业伯乐科技发展公司', null, null, null, null, null, null, '7301', 'bjyyblkjfzgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6317', '102', '北京中广润通电子技术公司', null, null, null, null, null, null, '7302', 'bjzgrtdzjsgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6318', '103', '北京中广润通电子技术有限公司', null, null, null, null, null, null, '7303', 'bjzgrtdzjsyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6319', '104', '北京德泉科技发展公司', null, null, null, null, null, null, '7304', 'bjdqkjfzgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6320', '105', '北京晶和力科贸有限公司', null, null, null, null, null, null, '7305', 'bjjhlkmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6321', '106', '北京诚志华嘉科技有限公司', null, null, null, null, null, null, '7306', 'bjczhjkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6322', '107', '北京东丰中鸿科研仪器有限公司', null, null, null, null, null, null, '7307', 'bjdfzhkyyqyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6323', '108', '北京东胜创新生物科技有限公司', null, null, null, null, null, null, '7308', 'bjdscxswkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6324', '109', '北京国力泰医疗器械有限公司', null, null, null, null, null, null, '7309', 'bjgltylqxyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6325', '110', '北京恒三江仪器销售公司', null, null, null, null, null, null, '7310', 'bjhsjyqxsgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6326', '111', '北京市华信医疗电子设备公司', null, null, null, null, null, null, '7311', 'bjshxyldzsbgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6327', '112', '北京若华医疗器械有限公司', null, null, null, null, null, null, '7312', 'bjrhylqxyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6328', '113', '上海卡利博有限公司', null, null, null, null, null, null, '7313', 'shklbyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6329', '114', '上海泰莱医疗器械有限公司', null, null, null, null, null, null, '7314', 'shtlylqxyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6330', '115', '北京毅力永医疗器械有限公司', null, null, null, null, null, null, '7315', 'bjylyylqxyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6331', '116', '北京中润汇宝科技有限公司', null, null, null, null, null, null, '7316', 'bjzrhbkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6332', '117', 'GZBJZR-北京中润伟业投资有限公司', null, null, null, null, null, null, '7317', 'GZBJZRbjzrwytzyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6333', '118', '北京泰康弘达科贸有限公司', null, null, null, null, null, null, '7318', 'bjtkhdkmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6334', '119', 'xdbt-北京现代百泰科技有限公司', null, null, null, null, null, null, '7319', 'xdbtbjxdbtkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6335', '120', '北京英科创业科贸有限公司', null, null, null, null, null, null, '7320', 'bjykcykmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6336', '121', '烟台澳斯邦生物工程有限公司', null, null, null, null, null, null, '7321', 'ytasbswgcyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6337', '122', '珠海和佳医疗设备公司', null, null, null, null, null, null, '7322', 'zhhjylsbgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6338', '123', '北京东华原医疗设备有限公司', null, null, null, null, null, null, '7323', 'bjdhyylsbyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6339', '124', '北京德泉兴业商贸有限公司', null, null, null, null, null, null, '7324', 'bjdqxysmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6340', '125', '北京福宏达商贸中心', null, null, null, null, null, null, '7325', 'bjfhdsmzx', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6341', '126', '北京光电联众医疗器械有限公司', null, null, null, null, null, null, '7326', 'bjgdlzylqxyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6342', '127', '国药集团北京医疗器械有限公司', null, null, null, null, null, null, '7327', 'gyjtbjylqxyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6343', '128', '北京海慧信息科技有限公司', null, null, null, null, null, null, '7328', 'bjhhxxkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6344', '129', '北京华瑞世纪科技公司', null, null, null, null, null, null, '7329', 'bjhrsjkjgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6345', '130', '北京鸿瑞兴生物技术发展公司', null, null, null, null, null, null, '7330', 'bjhrxswjsfzgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6346', '131', '杭州嘉益医疗器械公司北京分公司', null, null, null, null, null, null, '7331', 'hzjyylqxgsbjfgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6347', '132', '北京金宝光华医疗器械公司', null, null, null, null, null, null, '7332', 'bjjbghylqxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6348', '133', '北京利嘉诚医疗器械有限公司', null, null, null, null, null, null, '7333', 'bjljcylqxyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6349', '134', '北京欧尼森公司', null, null, null, null, null, null, '7334', 'bjonsgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6350', '135', 'GZBJQX-北京启信科仪贸易有限公司', null, null, null, null, null, null, '7335', 'GZBJQXbjqxkymyyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6351', '136', '北京胜德伟业机电设备有限公司', null, null, null, null, null, null, '7336', 'bjsdwyjdsbyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6352', '137', '北京思路高公司', null, null, null, null, null, null, '7337', 'bjslggs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6353', '138', '北京五洲新桥科技发展公司', null, null, null, null, null, null, '7338', 'bjwzxqkjfzgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6354', '139', '北京西凯华科贸有限公司', null, null, null, null, null, null, '7339', 'bjxkhkmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6355', '140', '北京中美嘉盛科技有限公司', null, null, null, null, null, null, '7340', 'bjzmjskjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6356', '141', '北京网鼎系统集成有限公司', null, null, null, null, null, null, '7341', 'bjwdxtjcyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6357', '142', 'GZBJJA-北京洁安高科医疗器械有限公司', null, null, null, null, null, null, '7342', 'GZBJJAbjjagkylqxyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6358', '143', 'GZBJMZ-北京美众昌盛医疗器械有限公司', null, null, null, null, null, null, '7343', 'GZBJMZbjmzcsylqxyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6359', '144', 'GZWMTR-未名天人中药有限公司', null, null, null, null, null, null, '7344', 'GZWMTRwmtrzyyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6360', '145', 'GZXYDY-协宇东盈医疗科技北京有限公司', null, null, null, null, null, null, '7345', 'GZXYDYxydyylkjbjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6361', '146', 'GZBJDFSG-北京东方双冠科技有限公司', null, null, null, null, null, null, '7346', 'GZBJDFSGbjdfsgkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6362', '147', 'GZBJQQJJ-北京鉴清洁净科技有限责任公司', null, null, null, null, null, null, '7347', 'GZBJQQJJbjjqjjkjyxzrgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6363', '148', 'GZSHMT-上海美太医疗设备有限公司', null, null, null, null, null, null, '7348', 'GZSHMTshmtylsbyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6364', '149', 'GZBJCS-北京昌盛医学技术有限公司', null, null, null, null, null, null, '7349', 'GZBJCSbjcsyxjsyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6365', '150', '北京健德联合口腔医疗设备有限公司', null, null, null, null, null, null, '7350', 'bjjdlhkqylsbyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6366', '151', 'GZBJTP-北京拓普康商贸有限公司', null, null, null, null, null, null, '7351', 'GZBJTPbjtpksmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6367', '152', 'GZJSHS-江苏海狮机械集团有限公司', null, null, null, null, null, null, '7352', 'GZJSHSjshsjxjtyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6368', '153', 'GZSZHP-深圳市普华康健投资有限公司', null, null, null, null, null, null, '7353', 'GZSZHPszsphkjtzyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6369', '154', 'GZBJDHHC-北京东华合创数码科技股份有限公司', null, null, null, null, null, null, '7354', 'GZBJDHHCbjdhhcsmkjgfyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6370', '155', 'GZJDMY-洁定贸易上海有限公司', null, null, null, null, null, null, '7355', 'GZJDMYjdmyshyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6371', '156', 'GZBJNT-北京能通万维网络科技有限公司', null, null, null, null, null, null, '7356', 'GZBJNTbjntwwwlkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6372', '157', 'GZBJXSE-北京西士尔商贸有限公司', null, null, null, null, null, null, '7357', 'GZBJXSEbjxsesmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6373', '158', 'GZBJSOT-北京思奥特科技发展有限公司', null, null, null, null, null, null, '7358', 'GZBJSOTbjsatkjfzyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6374', '159', 'GZBJOMSJ-北京欧迈世纪科技有限公司', null, null, null, null, null, null, '7359', 'GZBJOMSJbjomsjkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6375', '160', 'GZSHTD-上海泰德医疗器械有限公司', null, null, null, null, null, null, '7360', 'GZSHTDshtdylqxyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6376', '161', 'GZZGWT-中国网通集团系统集成有限公司', null, null, null, null, null, null, '7361', 'GZZGWTzgwtjtxtjcyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6377', '162', 'GZBJJBL-北京健百乐科技发展中心', null, null, null, null, null, null, '7362', 'GZBJJBLbjjblkjfzzx', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6378', '163', 'GZBJZTSQ-北京中天双屹环保科技有限公司', null, null, null, null, null, null, '7363', 'GZBJZTSQbjztsyhbkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6379', '164', 'GZBJJLCY-北京嘉联诚业医疗器械销售有限公司', null, null, null, null, null, null, '7364', 'GZBJJLCYbjjlcyylqxxsyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6380', '165', 'GZBJGSYW-北京高视远望科技有限责任公司', null, null, null, null, null, null, '7365', 'GZBJGSYWbjgsywkjyxzrgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6381', '166', 'GZSHLR-上海灵锐医疗器械有限公司', null, null, null, null, null, null, '7366', 'GZSHLRshlrylqxyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6382', '167', 'GZSHKL-上海科林医疗仪器技术有限公司', null, null, null, null, null, null, '7367', 'GZSHKLshklylyqjsyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6383', '168', 'GZBJJD-北京健德联合口腔医疗有限公司', null, null, null, null, null, null, '7368', 'GZBJJDbjjdlhkqylyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6384', '169', 'GZBJSM-北京圣曼医疗器材技术有限公司', null, null, null, null, null, null, '7369', 'GZBJSMbjsmylqcjsyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6385', '170', 'GZBJSJ-北京圣迦天润科技发展有限公司', null, null, null, null, null, null, '7370', 'GZBJSJbjsjtrkjfzyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6386', '171', 'GZBJDFRO-北京东方瑞澳医疗设备有限公司', null, null, null, null, null, null, '7371', 'GZBJDFRObjdfraylsbyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6387', '172', 'GZBJDNYD-北京东南悦达医疗器械有限公司', null, null, null, null, null, null, '7372', 'GZBJDNYDbjdnydylqxyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6388', '173', 'GZBJBR-北京巴瑞医疗器械有限公司', null, null, null, null, null, null, '7373', 'GZBJBRbjbrylqxyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6389', '174', 'GZBJZX-北京执信阳光医疗科技有限公司', null, null, null, null, null, null, '7374', 'GZBJZXbjzxygylkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6390', '175', 'GZBJCT-北京京朝腾微医学科技有限公司', null, null, null, null, null, null, '7375', 'GZBJCTbjjctwyxkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6391', '176', 'GZBJSKX-北京赛科希德科技发展有限公司', null, null, null, null, null, null, '7376', 'GZBJSKXbjskxdkjfzyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6392', '177', 'GZBJLP-北京乐普医疗器械有限公司', null, null, null, null, null, null, '7377', 'GZBJLPbjlpylqxyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6393', '178', 'GZBJHSJ-北京恒三江仪器销售有限公司', null, null, null, null, null, null, '7378', 'GZBJHSJbjhsjyqxsyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6394', '179', 'GZBJTPY-北京平利洋医疗设备有限公司', null, null, null, null, null, null, '7379', 'GZBJTPYbjplyylsbyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6395', '180', 'GZBJSJ-北京世纪凯盈科学仪器有限公司', null, null, null, null, null, null, '7380', 'GZBJSJbjsjkykxyqyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6396', '181', 'GZBJOBT-北京欧比特仪器有限公司', null, null, null, null, null, null, '7381', 'GZBJOBTbjobtyqyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6397', '182', 'GZBJJH-北京嘉和美康医用设备有限公司', null, null, null, null, null, null, '7382', 'GZBJJHbjjhmkyysbyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6398', '183', 'GZBJLJ-北京利嘉诚医药科技有限公司', null, null, null, null, null, null, '7383', 'GZBJLJbjljcyykjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6399', '184', 'GZBJKY-北京科园信海医药经营有限公司', null, null, null, null, null, null, '7384', 'GZBJKYbjkyxhyyjyyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6400', '185', 'GZBJGY-北京国药中北器械有限公司', null, null, null, null, null, null, '7385', 'GZBJGYbjgyzbqxyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6401', '186', 'GZBJBL-北京佰利申科贸有限公司', null, null, null, null, null, null, '7386', 'GZBJBLbjblskmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6402', '187', 'GZBJBL-北京博劢行仪器有限公司', null, null, null, null, null, null, '7387', 'GZBJBLbjbmxyqyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6403', '188', 'GZBJWF-北京万丰大成科学仪器有限公司', null, null, null, null, null, null, '7388', 'GZBJWFbjwfdckxyqyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6404', '189', 'GZZGYY-中国医药对外贸易公司', null, null, null, null, null, null, '7389', 'GZZGYYzgyydwmygs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6405', '190', 'GZSZDX-深圳德夏科技发展有限公司', null, null, null, null, null, null, '7390', 'GZSZDXszdxkjfzyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6406', '191', 'GZZGKX-中国科学器材进出口总公司', null, null, null, null, null, null, '7391', 'GZZGKXzgkxqcjckzgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6407', '192', 'GZBJJL-北京嘉力恒业国际贸易有限公司', null, null, null, null, null, null, '7392', 'GZBJJLbjjlhygjmyyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6408', '193', 'GZBJCM-北京诚茂兴业科技发展有限公司', null, null, null, null, null, null, '7393', 'GZBJCMbjcmxykjfzyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6409', '194', 'GZBJJC-北京检测仪器有限公司', null, null, null, null, null, null, '7394', 'GZBJJCbjjcyqyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6410', '195', 'GZBJYY-北京元业伯乐科技发展有限公司', null, null, null, null, null, null, '7395', 'GZBJYYbjyyblkjfzyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6411', '196', 'GZBJXH-北京信鸿汇天医疗技术开发有限公司', null, null, null, null, null, null, '7396', 'GZBJXHbjxhhtyljskfyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6412', '197', 'GZBJTD-北京铁电通技术开发中心', null, null, null, null, null, null, '7397', 'GZBJTDbjtdtjskfzx', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6413', '198', 'GZRSG-瑞仕格上海商贸有限公司', null, null, null, null, null, null, '7398', 'GZRSGrsgshsmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6414', '199', 'GZBJYS-北京英硕力新柏科技有限公司', null, null, null, null, null, null, '7399', 'GZBJYSbjyslxbkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6415', '200', 'GZGYJT-国药集团联合医疗器械有限公司', null, null, null, null, null, null, '7400', 'GZGYJTgyjtlhylqxyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6416', '201', 'GZBJSQ-北京世奇康商贸有限责任公司', null, null, null, null, null, null, '7401', 'GZBJSQbjsqksmyxzrgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6417', '202', 'GZBJPR-北京普瑞亚科技有限公司', null, null, null, null, null, null, '7402', 'GZBJPRbjprykjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6418', '203', 'GZBJZT-北京周天华枫医疗仪器有限公司', null, null, null, null, null, null, '7403', 'GZBJZTbjzthfylyqyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6419', '204', 'GZBJMK-北京美康百泰医药科技有限公司', null, null, null, null, null, null, '7404', 'GZBJMKbjmkbtyykjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6420', '205', 'GZBJWY-北京唯医静化机电设备有限公司', null, null, null, null, null, null, '7405', 'GZBJWYbjwyjhjdsbyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6421', '206', 'GZBJPD-北京普德鸿医学技术有限公司', null, null, null, null, null, null, '7406', 'GZBJPDbjpdhyxjsyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6423', '208', 'GZNBSD-宁波圣达精工实业有限公司', null, null, null, null, null, null, '7408', 'GZNBSDnbsdjgsyyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6422', '207', 'GZBJKD-北京康德威医疗设备有限公司', null, null, null, null, null, null, '7407', 'GZBJKDbjkdwylsbyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6424', '209', 'GZBJHZ-北京弘舟广际科贸公司', null, null, null, null, null, null, '7409', 'GZBJHZbjhzgjkmgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6425', '210', 'GZBJAT-北京康拓医疗仪器有限公司', null, null, null, null, null, null, '7410', 'GZBJATbjktylyqyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6426', '211', 'GZBJKL-北京快乐一然科技有限公司', null, null, null, null, null, null, '7411', 'GZBJKLbjklyrkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6427', '212', 'CSHGYS-初始化供应商', null, null, null, null, null, null, '7412', 'CSHGYScshgys', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6428', '215', '山东威高集团北京销售分公司', null, null, null, null, null, null, '7413', 'sdwgjtbjxsfgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6429', '216', '北京市科护医疗器材有限公司', null, null, null, null, null, null, '7414', 'bjskhylqcyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6430', '217', '北京仁合康盛医疗用品有限公司', null, null, null, null, null, null, '7415', 'bjrhksylypyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6431', '218', '北京瑞金斯科技有限公司', null, null, null, null, null, null, '7416', 'bjrjskjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6432', '219', '北京健康广济医用品有限公司', null, null, null, null, null, null, '7417', 'bjjkgjyypyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6433', '220', '南京微创', null, null, null, null, null, null, '7418', 'njwc', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6434', '221', '天津哈娜好医材有限公司', null, null, null, null, null, null, '7419', 'tjhnhycyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6435', '222', '北京宜安泰医疗技术开发有限公司', null, null, null, null, null, null, '7420', 'bjyatyljskfyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6436', '223', '北京美高牙科医疗器材有限责任公司', null, null, null, null, null, null, '7421', 'bjmgykylqcyxzrgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6437', '224', '普德鸿医学技术有限公司', null, null, null, null, null, null, '7422', 'pdhyxjsyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6438', '225', '北京市思创新医疗用品有限责任公司', null, null, null, null, null, null, '7423', 'bjsscxylypyxzrgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6439', '226', '浙江拱东', null, null, null, null, null, null, '7424', 'zjgd', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6440', '227', '北京锐康麦德科技有限公司', null, null, null, null, null, null, '7425', 'bjrkmdkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6441', '228', '北京德凯利康商贸有限公司', null, null, null, null, null, null, '7426', 'bjdklksmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6442', '229', '北京欣复春医药科技有限公司', null, null, null, null, null, null, '7427', 'bjxfcyykjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6443', '230', '健康广济', null, null, null, null, null, null, '7428', 'jkgj', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6444', '231', '美高牙科', null, null, null, null, null, null, '7429', 'mgyk', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6445', '232', '朗健嘉德', null, null, null, null, null, null, '7430', 'ljjd', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6446', '233', '珠海市弘科医疗设备有限公司', null, null, null, null, null, null, '7431', 'zhshkylsbyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6447', '234', '福宏达商贸中心', null, null, null, null, null, null, '7432', 'fhdsmzx', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6448', '235', '北京贝尔生物工程', null, null, null, null, null, null, '7433', 'bjbeswgc', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6449', '236', '北京豪迈之星生物技术', null, null, null, null, null, null, '7434', 'bjhmzxswjs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6450', '237', '北京华天泽宇医疗器械有限公司', null, null, null, null, null, null, '7435', 'bjhtzyylqxyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6451', '238', '北京健峰生物技术有限公司', null, null, null, null, null, null, '7436', 'bjjfswjsyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6452', '239', '北京健伦商贸公司', null, null, null, null, null, null, '7437', 'bjjlsmgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6453', '240', '北京康思达睿科贸有限公司', null, null, null, null, null, null, '7438', 'bjksdrkmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6454', '241', '北京莱帮生物技术有限公司', null, null, null, null, null, null, '7439', 'bjlbswjsyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6455', '242', '北京兰野医学科技中心', null, null, null, null, null, null, '7440', 'bjlyyxkjzx', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6456', '243', '北京利文商贸有限公司', null, null, null, null, null, null, '7441', 'bjlwsmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6457', '244', '北京欧蒙生物技术有限公司', null, null, null, null, null, null, '7442', 'bjomswjsyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6458', '245', '北京普力文科贸有限公司', null, null, null, null, null, null, '7443', 'bjplwkmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6459', '246', '北京燃烽医药有限责任公司', null, null, null, null, null, null, '7444', 'bjrfyyyxzrgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6460', '247', '北京探针生物技术有限公司', null, null, null, null, null, null, '7445', 'bjtzswjsyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6461', '248', '北京中德利德曼科技有限公司', null, null, null, null, null, null, '7446', 'bjzdldmkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6462', '249', '北京中盛兴华贸易中心', null, null, null, null, null, null, '7447', 'bjzsxhmyzx', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6463', '250', '北京中天成业生物技术有限公司', null, null, null, null, null, null, '7448', 'bjztcyswjsyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6464', '251', '丽珠医学', null, null, null, null, null, null, '7449', 'lzyx', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6465', '252', '上海长岛抗体诊断试剂有限公司', null, null, null, null, null, null, '7450', 'shzdktzdsjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6466', '253', '上海科华生物工程股份有限公司', null, null, null, null, null, null, '7451', 'shkhswgcgfyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6467', '254', '天合力恩', null, null, null, null, null, null, '7452', 'thle', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6468', '255', '万华普曼生物工程有限公司', null, null, null, null, null, null, '7453', 'whpmswgcyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6469', '256', '北京奥普瑞兴医疗器械有限责任公司', null, null, null, null, null, null, '7454', 'bjaprxylqxyxzrgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6470', '257', '北京福视康华科技发展有限责任公司', null, null, null, null, null, null, '7455', 'bjfskhkjfzyxzrgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6471', '259', 'BJLPYLQXYXGS-北京蓝牌医疗器械有限公司', null, null, null, null, null, null, '7456', 'BJLPYLQXYXGSbjlpylqxyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6472', '262', '北京世纪长科商贸有限公司', null, null, null, null, null, null, '7457', 'bjsjzksmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6473', '264', '泉辉和奕医疗器械有限公司', null, null, null, null, null, null, '7458', 'qhhyylqxyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6474', '266', 'BJWRZY-北京卫仁中药饮片厂', null, null, null, null, null, null, '7459', 'BJWRZYbjwrzyypc', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6475', '267', 'BJHMZY-北京华邈中药工程技术开发中心', null, null, null, null, null, null, '7460', 'BJHMZYbjhmzygcjskfzx', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6476', '268', 'GZZGWT-中国网通(集团)有限公司北京市分公司', null, null, null, null, null, null, '7461', 'GZZGWTzgwtjtyxgsbjsfgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6477', '269', 'GZBJZDXF-北京中电兴发科技有限公司', null, null, null, null, null, null, '7462', 'GZBJZDXFbjzdxfkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6478', '270', 'GZTJHF-天津市海风联合科技有限公司', null, null, null, null, null, null, '7463', 'GZTJHFtjshflhkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6479', '271', 'GZMDS-北京麦德森医疗器械销售中心', null, null, null, null, null, null, '7464', 'GZMDSbjmdsylqxxszx', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6480', '272', 'GZBJAB-北京安博生商贸有限公司', null, null, null, null, null, null, '7465', 'GZBJABbjabssmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6481', '273', 'GZBJKX-北京可喜安医疗科技有限公司', null, null, null, null, null, null, '7466', 'GZBJKXbjkxaylkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6482', '274', 'GZBJYQ-北京云雀商贸有限责任公司', null, null, null, null, null, null, '7467', 'GZBJYQbjyqsmyxzrgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6483', '275', 'GZBJTA-北京泰安怡商贸有限公司', null, null, null, null, null, null, '7468', 'GZBJTAbjtaysmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6484', '276', 'GZBJJR-北京嘉润利贞科技发展有限公司', null, null, null, null, null, null, '7469', 'GZBJJRbjjrlzkjfzyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6485', '277', 'GZBJZQ-北京卓青伟业科技有限公司', null, null, null, null, null, null, '7470', 'GZBJZQbjzqwykjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6486', '278', 'GZSHBR-上海倍榕医疗器械有限公司', null, null, null, null, null, null, '7471', 'GZSHBRshbrylqxyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6487', '279', 'GZBJSM-北京世茂医疗器械贸易有限公司', null, null, null, null, null, null, '7472', 'GZBJSMbjsmylqxmyyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6488', '280', 'GZBJKY-北京康月达科技有限公司', null, null, null, null, null, null, '7473', 'GZBJKYbjkydkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6489', '281', 'GZBJKW-北京科维永道贸易有限公司', null, null, null, null, null, null, '7474', 'GZBJKWbjkwydmyyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6490', '282', 'GZBJMC-北京美承互联数码科技发展有限公司', null, null, null, null, null, null, '7475', 'GZBJMCbjmchlsmkjfzyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6491', '283', 'GZBJZW-北京中网心电信息中心', null, null, null, null, null, null, '7476', 'GZBJZWbjzwxdxxzx', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6492', '284', 'GZBJDH-北京东华原医疗设备有限责任公司', null, null, null, null, null, null, '7477', 'GZBJDHbjdhyylsbyxzrgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6493', '285', 'GZTYMK-通用美康医药有限公司', null, null, null, null, null, null, '7478', 'GZTYMKtymkyyyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6494', '286', 'GZBJJW-北京京卫医疗用品公司', null, null, null, null, null, null, '7479', 'GZBJJWbjjwylypgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6495', '287', 'GZBJKT-北京康泰宏业科技有限责任公司', null, null, null, null, null, null, '7480', 'GZBJKTbjkthykjyxzrgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6496', '288', 'GZBJYJ-北京宇进圣心科技有限公司', null, null, null, null, null, null, '7481', 'GZBJYJbjyjsxkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6497', '289', 'GZBJWL-北京威灵远志科技有限责任公司', null, null, null, null, null, null, '7482', 'GZBJWLbjwlyzkjyxzrgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6498', '290', 'GZBJKD-北京康德宏贸易发展有限公司', null, null, null, null, null, null, '7483', 'GZBJKDbjkdhmyfzyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6499', '291', 'GZBJGK-北京国康东胜医疗科技有限公司', null, null, null, null, null, null, '7484', 'GZBJGKbjgkdsylkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6500', '292', 'GZBJXH-北京信海康医药有限责任公司', null, null, null, null, null, null, '7485', 'GZBJXHbjxhkyyyxzrgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6501', '293', 'GZBJSE-北京芾尔世达医疗器材有限公司', null, null, null, null, null, null, '7486', 'GZBJSEbjfesdylqcyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6502', '294', 'GZDLSY-大连三洋冷链有限公司', null, null, null, null, null, null, '7487', 'GZDLSYdlsyllyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6503', '295', 'GZBJQH-北京泉辉泽惠医疗设备有限公司', null, null, null, null, null, null, '7488', 'GZBJQHbjqhzhylsbyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6504', '296', 'GZMDSD-麦迪斯顿（北京）医疗科技有限公司', null, null, null, null, null, null, '7489', 'GZMDSDmdsdbjylkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6505', '297', 'GZBJYY-北京誉远名扬窗饰用品有限公司', null, null, null, null, null, null, '7490', 'GZBJYYbjyymycsypyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6506', '298', 'GZBJSL-北京圣兰心服装服饰有限责任公司', null, null, null, null, null, null, '7491', 'GZBJSLbjslxfzfsyxzrgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6507', '299', 'GZBJANM-北京阿尼玛经贸有限公司', null, null, null, null, null, null, '7492', 'GZBJANMbjanmjmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6508', '300', 'GZBJRT-北京悦泰行科技发展有限公司', null, null, null, null, null, null, '7493', 'GZBJRTbjytxkjfzyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6509', '301', 'GZBJDEB-北京得尔贝经贸有限公司', null, null, null, null, null, null, '7494', 'GZBJDEBbjdebjmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6510', '302', 'GZBJDF-北京东方耀华厨房设备有限公司', null, null, null, null, null, null, '7495', 'GZBJDFbjdfyhcfsbyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6511', '303', 'GZBJSL-北京森雷普实验室设备有限公司', null, null, null, null, null, null, '7496', 'GZBJSLbjslpsyssbyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6512', '304', 'GZSZZD-深圳市中电电力技术有限公司', null, null, null, null, null, null, '7497', 'GZSZZDszszddljsyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6513', '305', 'GZTFGF-同方股份有限公司', null, null, null, null, null, null, '7498', 'GZTFGFtfgfyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6514', '306', 'GZBJGJ-北京光健科技发展有限公司', null, null, null, null, null, null, '7499', 'GZBJGJbjgjkjfzyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6515', '307', 'GZBJCM-北京创美时代办公家具有限公司', null, null, null, null, null, null, '7500', 'GZBJCMbjcmsdbgjjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6516', '308', 'GZBJXY-北京翔源博润生物科技有限公司', null, null, null, null, null, null, '7501', 'GZBJXYbjxybrswkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6517', '309', 'GZZJSO-浙江圣奥家具制造有限公司', null, null, null, null, null, null, '7502', 'GZZJSOzjsajjzzyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6518', '310', 'GZBJZT-北京志腾飞达科技有限公司', null, null, null, null, null, null, '7503', 'GZBJZTbjztfdkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6519', '313', 'GZBJTS-北京图书大厦有限责任公司', null, null, null, null, null, null, '7504', 'GZBJTSbjtsdsyxzrgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6520', '314', 'GZBJRM-北京瑞迈商贸', null, null, null, null, null, null, '7505', 'GZBJRMbjrmsm', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6521', '315', 'GZBJSYQFT-北京三元桥丰田汽车销售服务中心', null, null, null, null, null, null, '7506', 'GZBJSYQFTbjsyqftqcxsfwzx', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6522', '316', 'GZBJKL-北京康联医用设备有限公司', null, null, null, null, null, null, '7507', 'GZBJKLbjklyysbyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6523', '317', 'GZBWHX-北京博望恒信智能系统工程有限公司', null, null, null, null, null, null, '7508', 'GZBWHXbjbwhxznxtgcyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6121', '3', '武汉建民', null, null, null, null, null, null, '7121', 'lzyfyy', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6141', '广西金嗓子', '广西金嗓子', null, null, null, null, null, null, '7141', 'gxjsz', '7', '药品', null, null, 'Y');
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6142', '3', '武汉建民', null, null, null, null, null, null, '7142', 'whjm', '7', '药品', null, null, 'N');
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6524', '318', 'ALKKJ-北京爱乐康科技发展有限公司
', null, null, null, null, null, null, '7509', 'ALKKJbjalkkjfzyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6525', '319', 'ATKKM-北京爱特康科贸有限责任公司
', null, null, null, null, null, null, '7510', 'ATKKMbjatkkmyxzrgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6526', '320', 'AQSD-北京安桥斯达医疗器械有限责任公司
', null, null, null, null, null, null, '7511', 'AQSDbjaqsdylqxyxzrgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6527', '321', 'APRX-北京奥普瑞兴医疗器械有限责任公司
', null, null, null, null, null, null, '7512', 'APRXbjaprxylqxyxzrgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6528', '322', 'AMYX-北京澳美医信投资顾问有限公司
', null, null, null, null, null, null, '7513', 'AMYXbjamyxtzgwyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6529', '323', 'BRYL-北京巴瑞医疗器械有限公司
', null, null, null, null, null, null, '7514', 'BRYLbjbrylqxyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6530', '324', 'BRLE-北京百瑞利恩商贸有限公司
', null, null, null, null, null, null, '7515', 'BRLEbjbrlesmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6531', '325', 'BLS-北京佰利申科贸有限公司
', null, null, null, null, null, null, '7516', 'BLSbjblskmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6532', '326', 'BEYY-北京贝恩医药科技开发有限责任公司
', null, null, null, null, null, null, '7517', 'BEYYbjbeyykjkfyxzrgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6533', '327', 'BESW-北京贝尔生物工程
有限公司', null, null, null, null, null, null, '7518', 'BESWbjbeswgcyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6534', '328', 'BRXB-北京博瑞祥宝科技有限公司
', null, null, null, null, null, null, '7519', 'BRXBbjbrxbkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6535', '329', 'CRTX-北京长荣同兴科贸
有限公司', null, null, null, null, null, null, '7520', 'CRTXbjzrtxkmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6536', '330', 'DKLK-北京德凯利康商贸
有限公司', null, null, null, null, null, null, '7521', 'DKLKbjdklksmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6537', '331', 'DFSG-北京东方双冠科技有限公司
', null, null, null, null, null, null, '7522', 'DFSGbjdfsgkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6538', '332', 'DLMD-北京东林麦迪商贸有限公司
', null, null, null, null, null, null, '7523', 'DLMDbjdlmdsmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6539', '333', 'DNYD-北京东南悦达医疗器械有限公司
', null, null, null, null, null, null, '7524', 'DNYDbjdnydylqxyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6540', '335', 'GKKJ-北京共康科技发展有限公司
', null, null, null, null, null, null, '7525', 'GKKJbjgkkjfzyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6541', '336', 'HM-北京豪迈生物工程有限公司
', null, null, null, null, null, null, '7526', 'HMbjhmswgcyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6542', '337', 'HLDC-北京合力鼎成科贸有限责任公司
', null, null, null, null, null, null, '7527', 'HLDCbjhldckmyxzrgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6543', '338', 'HRYG-北京和瑞阳光科技有限公司', null, null, null, null, null, null, '7528', 'HRYGbjhrygkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6544', '339', 'HDPR-北京厚德普瑞科技发展有限公司
', null, null, null, null, null, null, '7529', 'HDPRbjhdprkjfzyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6545', '340', 'FJYX-北京富江裕新医疗器械
有限公司', null, null, null, null, null, null, '7530', 'FJYXbjfjyxylqxyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6546', '341', 'HKYL-北京华康永联医疗器械有限公司
', null, null, null, null, null, null, '7531', 'HKYLbjhkylylqxyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6547', '342', 'HRSJ-北京华瑞世纪科技有限公司
', null, null, null, null, null, null, '7532', 'HRSJbjhrsjkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6548', '343', 'HTZC-北京华泰志诚科技发展有限公司
', null, null, null, null, null, null, '7533', 'HTZCbjhtzckjfzyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6549', '344', 'HXZH-北京华旭众和科贸有限公司
', null, null, null, null, null, null, '7534', 'HXZHbjhxzhkmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6550', '345', 'HEL-北京慧而朗商贸有限公司
', null, null, null, null, null, null, '7535', 'HELbjhelsmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6551', '346', 'JYJM-北京嘉洋经贸有限公司
', null, null, null, null, null, null, '7536', 'JYJMbjjyjmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6552', '347', 'JDXQ-北京京大西秦医疗仪器有限公司
', null, null, null, null, null, null, '7537', 'JDXQbjjdxqylyqyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6553', '348', 'JF-北京健峰生物技术有限公司
', null, null, null, null, null, null, '7538', 'JFbjjfswjsyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6554', '349', 'JKGJ-北京健康广济医用品有限公司
', null, null, null, null, null, null, '7539', 'JKGJbjjkgjyypyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6555', '350', 'JDYR-北京金迪盈润医疗器械有限公司
', null, null, null, null, null, null, '7540', 'JDYRbjjdyrylqxyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6556', '351', 'KHY-北京康晖煜科技有限公司
', null, null, null, null, null, null, '7541', 'KHYbjkhykjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6557', '352', 'KYD-北京康月达科技有限公司
', null, null, null, null, null, null, '7542', 'KYDbjkydkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6558', '353', 'LB-北京莱帮生物技术有限公司
', null, null, null, null, null, null, '7543', 'LBbjlbswjsyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6559', '354', 'LY-北京兰野医学科技中心
', null, null, null, null, null, null, '7544', 'LYbjlyyxkjzx', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6560', '355', 'LP-北京蓝牌医疗器械有限公司
', null, null, null, null, null, null, '7545', 'LPbjlpylqxyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6561', '356', 'LJJD-北京朗健嘉德科贸有限公司
', null, null, null, null, null, null, '7546', 'LJJDbjljjdkmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6562', '357', 'LS-北京朗申科技有限公司
', null, null, null, null, null, null, '7547', 'LSbjlskjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6563', '358', 'LW-北京利文商贸有限公司
', null, null, null, null, null, null, '7548', 'LWbjlwsmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6564', '359', 'LSSC-北京龙胜世创科贸有限公司
', null, null, null, null, null, null, '7549', 'LSSCbjlssckmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6565', '360', 'MKT-北京玛珂特医疗设备销售有限公司
', null, null, null, null, null, null, '7550', 'MKTbjmktylsbxsyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6566', '361', 'MDWE-北京迈迪维尔医疗器械有限公司
', null, null, null, null, null, null, '7551', 'MDWEbjmdweylqxyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6567', '362', 'MDJC-北京麦迪锦诚医疗器械有限责任公司
', null, null, null, null, null, null, '7552', 'MDJCbjmdjcylqxyxzrgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6568', '363', 'MDXT-北京美迪信泰商贸有限公司
', null, null, null, null, null, null, '7553', 'MDXTbjmdxtsmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6569', '364', 'MGYK-北京美高牙科医疗器材有限责任公司
', null, null, null, null, null, null, '7554', 'MGYKbjmgykylqcyxzrgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6570', '365', 'MKBT-北京美康百泰医药科技有限公司
', null, null, null, null, null, null, '7555', 'MKBTbjmkbtyykjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6571', '366', 'OM-北京欧蒙生物
技术有限公司', null, null, null, null, null, null, '7556', 'OMbjomswjsyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6572', '367', 'PHYT-北京市普华永泰科技发展有限责任公司
', null, null, null, null, null, null, '7557', 'PHYTbjsphytkjfzyxzrgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6573', '368', 'PLW-北京普力文科贸有限公司
', null, null, null, null, null, null, '7558', 'PLWbjplwkmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6574', '369', 'QLJ-北京千里及科贸有限责任公司
', null, null, null, null, null, null, '7559', 'QLJbjqljkmyxzrgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6575', '370', 'QCKJ-北京勤诚科技发展中心
', null, null, null, null, null, null, '7560', 'QCKJbjqckjfzzx', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6576', '371', 'QG-北京勤耕医疗器械有限公司
', null, null, null, null, null, null, '7561', 'QGbjqgylqxyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6577', '372', 'QHX-北京泉晖新商贸有限公司
', null, null, null, null, null, null, '7562', 'QHXbjqhxsmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6578', '373', 'QHHY-北京泉辉和奕医疗器械有限公司
', null, null, null, null, null, null, '7563', 'QHHYbjqhhyylqxyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6579', '374', 'RF-北京燃烽医药有限责任公司
', null, null, null, null, null, null, '7564', 'RFbjrfyyyxzrgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6580', '375', 'RHKS-北京仁合康盛医疗用品有限公司
', null, null, null, null, null, null, '7565', 'RHKSbjrhksylypyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6581', '376', 'RKMD-北京锐康麦德科技有限公司
', null, null, null, null, null, null, '7566', 'RKMDbjrkmdkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6582', '377', 'RJS-北京瑞金斯科技有限公司
', null, null, null, null, null, null, '7567', 'RJSbjrjskjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6583', '378', 'RMSM-北京瑞迈商贸中心
', null, null, null, null, null, null, '7568', 'RMSMbjrmsmzx', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6584', '379', 'SZHY-北京神州宏宇科技
有限公司', null, null, null, null, null, null, '7569', 'SZHYbjszhykjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6585', '380', 'SAK-北京晟安康医疗器械中心
', null, null, null, null, null, null, '7570', 'SAKbjsakylqxzx', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6586', '381', 'SXY-北京盛翔远科贸有限公司
', null, null, null, null, null, null, '7571', 'SXYbjsxykmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6587', '382', 'SJCK-北京世纪长科商贸有限公司
', null, null, null, null, null, null, '7572', 'SJCKbjsjzksmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6588', '383', 'SJXS-北京世纪兴盛科技有限公司
', null, null, null, null, null, null, '7573', 'SJXSbjsjxskjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6589', '384', 'KHYL-北京市科护医疗器材有限公司
', null, null, null, null, null, null, '7574', 'KHYLbjskhylqcyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6590', '385', 'LY-北京市六一仪器厂
', null, null, null, null, null, null, '7575', 'LYbjslyyqc', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6591', '386', 'MY-北京市密云县益康卫生材料厂
', null, null, null, null, null, null, '7576', 'MYbjsmyxykwsclc', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6592', '387', 'PC-北京市普慈医疗技术有限公司
', null, null, null, null, null, null, '7577', 'PCbjspcyljsyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6593', '389', 'SCX-北京市思创新医疗用品有限责任公司
', null, null, null, null, null, null, '7578', 'SCXbjsscxylypyxzrgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6594', '390', 'THKJ-北京市潭河科技开发中心
', null, null, null, null, null, null, '7579', 'THKJbjsthkjkfzx', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6595', '391', 'TST-北京泰士特商贸有限公司
', null, null, null, null, null, null, '7580', 'TSTbjtstsmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6596', '392', 'TZSW-北京探针生物技术有限公司
', null, null, null, null, null, null, '7581', 'TZSWbjtzswjsyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6597', '393', 'TSHC-北京天时恒创科技发展有限公司
', null, null, null, null, null, null, '7582', 'TSHCbjtshckjfzyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6598', '395', 'TYKD-北京天缘康达医用仪器
', null, null, null, null, null, null, '7583', 'TYKDbjtykdyyyq', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6599', '396', 'WTK-北京威泰科生物技术有限公司
', null, null, null, null, null, null, '7584', 'WTKbjwtkswjsyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6600', '397', 'XQD-北京先起迪科技发展有限公司
', null, null, null, null, null, null, '7585', 'XQDbjxqdkjfzyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6601', '398', 'XSKJ-北京向上科技发展有限责任公司
', null, null, null, null, null, null, '7586', 'XSKJbjxskjfzyxzrgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6602', '399', 'XSX-北京协顺祥医疗科技有限公司
', null, null, null, null, null, null, '7587', 'XSXbjxsxylkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6603', '400', 'XDJC-北京新达精诚科贸有限公司
', null, null, null, null, null, null, '7588', 'XDJCbjxdjckmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6604', '401', 'XLF-北京欣隆福医药销售有限公司
', null, null, null, null, null, null, '7589', 'XLFbjxlfyyxsyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6605', '402', 'XNHH-北京鑫诺汇亨科技发展
有限公司', null, null, null, null, null, null, '7590', 'XNHHbjxnhhkjfzyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6606', '403', 'XRX-北京鑫瑞祥商贸有限责任公司
', null, null, null, null, null, null, '7591', 'XRXbjxrxsmyxzrgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6607', '404', 'YAT-北京宜安泰医疗技术开发有限公司
', null, null, null, null, null, null, '7592', 'YATbjyatyljskfyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6608', '405', 'YSLX-北京英硕力新柏科技有限公司
', null, null, null, null, null, null, '7593', 'YSLXbjyslxbkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6609', '406', 'YLJX-北京益利精细化学品
有限公司', null, null, null, null, null, null, '7594', 'YLJXbjyljxhxpyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6610', '407', 'YYBL-北京元业伯乐科技
发展有限公司', null, null, null, null, null, null, '7595', 'YYBLbjyyblkjfzyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6611', '408', 'YPH-北京原平皓生物技术有限公司
', null, null, null, null, null, null, '7596', 'YPHbjyphswjsyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6612', '409', 'ZPKJ-北京泽平科技有限责任公司
', null, null, null, null, null, null, '7597', 'ZPKJbjzpkjyxzrgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6613', '410', 'ZXYG-北京执信阳光医疗科技有限公司
', null, null, null, null, null, null, '7598', 'ZXYGbjzxygylkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6614', '411', 'ZRKJ-北京志荣科技发展有限公司
', null, null, null, null, null, null, '7599', 'ZRKJbjzrkjfzyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6615', '412', 'LDM-北京中德利德曼科技有限公司
', null, null, null, null, null, null, '7600', 'LDMbjzdldmkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6616', '413', 'ZKZX-北京中科执信医疗设备有限公司
', null, null, null, null, null, null, '7601', 'ZKZXbjzkzxylsbyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6617', '414', 'ZTCY-北京中天成业生物技术有限公司
', null, null, null, null, null, null, '7602', 'ZTCYbjztcyswjsyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6618', '415', 'ZTSH-北京中天四海商贸有限公司
', null, null, null, null, null, null, '7603', 'ZTSHbjztshsmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6717', '515', 'XHT-北京鑫宏涛五金建材商店', null, null, null, null, null, null, '7702', 'XHTbjxhtwjjcsd', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6718', '516', 'CYJLF-北京创益佳家乐福商业有限公司', null, null, null, null, null, null, '7703', 'CYJLFbjcyjjlfsyyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6719', '517', 'zyxd-北京振宇先达科技有限公司', null, null, null, null, null, null, '7704', 'zyxdbjzyxdkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6720', '518', 'mty-北京市石景山名特优食品公司', null, null, null, null, null, null, '7705', 'mtybjssjsmtyspgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6721', '519', 'jxwj-北京市金鑫五金建材商店', null, null, null, null, null, null, '7706', 'jxwjbjsjxwjjcsd', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6722', '520', 'xhys-香河永胜综合加工厂', null, null, null, null, null, null, '7707', 'xhysxhyszhjgc', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6723', '521', 'rskj-北京荣盛康洁日用化学品有限公司', null, null, null, null, null, null, '7708', 'rskjbjrskjryhxpyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6724', '522', 'dfsz-北京东方盛泽东郊农副产品批发市场有限公司', null, null, null, null, null, null, '7709', 'dfszbjdfszdjnfcppfscyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6725', '523', 'XSH-北京鑫四环消毒技术开发中心', null, null, null, null, null, null, '7710', 'XSHbjxshxdjskfzx', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6726', '524', 'SLB-北京索莱宝科技有限公司', null, null, null, null, null, null, '7711', 'SLBbjslbkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6727', '525', 'rthdq-北京瑞天鸿电气有限公司', null, null, null, null, null, null, '7712', 'rthdqbjrthdqyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6728', '526', 'zgjk-中国疾病预防控制中心全球基金采购部', null, null, null, null, null, null, '7713', 'zgjkzgjbyfkzzxqqjjcgb', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6729', '527', 'RH-北京若华医疗器械有限公司', null, null, null, null, null, null, '7714', 'RHbjrhylqxyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6730', '528', 'LKSD-北京朗昆时代科技发展有限公司', null, null, null, null, null, null, '7715', 'LKSDbjlksdkjfzyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6731', '529', 'BHTD-北京博汇天地科技有限公司', null, null, null, null, null, null, '7716', 'BHTDbjbhtdkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6732', '530', 'DH-北京东华合创数码科技股份有限公司', null, null, null, null, null, null, '7717', 'DHbjdhhcsmkjgfyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6733', '531', 'czj-北京市财政局', null, null, null, null, null, null, '7718', 'czjbjsczj', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6734', '532', 'ymcx-北京悦美诚信日化经营部', null, null, null, null, null, null, '7719', 'ymcxbjymcxrhjyb', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6735', '533', 'rlc-北京瑞龙春生物科技有限公司', null, null, null, null, null, null, '7720', 'rlcbjrlcswkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6736', '534', 'jlf-北京家乐福商业有限公司双井店', null, null, null, null, null, null, '7721', 'jlfbjjlfsyyxgssjd', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6737', '535', 'smfz-北京顺美服装股份有限公司', null, null, null, null, null, null, '7722', 'smfzbjsmfzgfyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6738', '536', 'gyjt-国药集团医药物流有限公司', null, null, null, null, null, null, '7723', 'gyjtgyjtyywlyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6739', '537', 'wkt-北京市威卡通服装厂', null, null, null, null, null, null, '7724', 'wktbjswktfzc', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6740', '538', 'aly-北京奥乐宇办公用品商店', null, null, null, null, null, null, '7725', 'alybjalybgypsd', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6741', '539', 'blg-北京市安定门宝兰阁文化用品商店', null, null, null, null, null, null, '7726', 'blgbjsadmblgwhypsd', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6742', '540', 'TJYR-天津市一瑞生物工程有限公司', null, null, null, null, null, null, '7727', 'TJYRtjsyrswgcyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6743', '541', 'hmst-霍姆斯特(北京)环境科技有限公司', null, null, null, null, null, null, '7728', 'hmsthmstbjhjkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6744', '542', 'zshy-北京中盛茂源科技发展有限公司', null, null, null, null, null, null, '7729', 'zshybjzsmykjfzyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6745', '543', 'jgmj-北京京冠毛巾有限责任公司', null, null, null, null, null, null, '7730', 'jgmjbjjgmjyxzrgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6746', '544', 'ycf-北京英才发文化用品经销部', null, null, null, null, null, null, '7731', 'ycfbjycfwhypjxb', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6747', '545', 'RTLC-北京瑞泰林川商贸有限公司', null, null, null, null, null, null, '7732', 'RTLCbjrtlcsmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6748', '546', 'STB-史泰博商贸有限公司北京分公司', null, null, null, null, null, null, '7733', 'STBstbsmyxgsbjfgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6749', '547', 'ZWHR-北京中卫惠瑞医疗器械有限责任公司', null, null, null, null, null, null, '7734', 'ZWHRbjzwhrylqxyxzrgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6750', '548', 'ZZJJ-北京住总家具市场有限公司', null, null, null, null, null, null, '7735', 'ZZJJbjzzjjscyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6751', '549', 'TCHY-北京天成恒业科贸有限公司', null, null, null, null, null, null, '7736', 'TCHYbjtchykmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6752', '550', 'layx-北京龙安医学技术开发公司', null, null, null, null, null, null, '7737', 'layxbjlayxjskfgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6753', '551', 'SHRK-上海日科贸易有限公司', null, null, null, null, null, null, '7738', 'SHRKshrkmyyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6754', '552', 'sygc-唐山市开平区顺如骨质瓷销售部', null, null, null, null, null, null, '7739', 'sygctsskpqsrgzcxsb', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6755', '553', 'CAT-北京诚安堂药房有限公司
', null, null, null, null, null, null, '7740', 'CATbjcatyfyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6756', '554', 'JAGK-北京洁安高科医疗器材有限公司', null, null, null, null, null, null, '7741', 'JAGKbjjagkylqcyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6757', '555', 'YBJY-北京友邦基业科贸有限责任公司', null, null, null, null, null, null, '7742', 'YBJYbjybjykmyxzrgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6758', '556', 'trjc-北京天润佳创经贸有限公司', null, null, null, null, null, null, '7743', 'trjcbjtrjcjmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6759', '557', 'sjdbh-北京世纪丹陛华综合市场有限公司', null, null, null, null, null, null, '7744', 'sjdbhbjsjdbhzhscyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6760', '558', 'qpg-北京青苹果红苹果生殖健康产品科技开发中心', null, null, null, null, null, null, '7745', 'qpgbjqpghpgszjkcpkjkfzx', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6761', '559', 'tjxsm-北京通嘉兴商贸有限公司', null, null, null, null, null, null, '7746', 'tjxsmbjtjxsmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6762', '560', 'jxdd-北京锦绣大地农副食产品批发市场有限责任公司', null, null, null, null, null, null, '7747', 'jxddbjjxddnfscppfscyxzrgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6763', '561', 'xcwy-北京行程伟业商贸有限公司', null, null, null, null, null, null, '7748', 'xcwybjxcwysmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6764', '562', 'hrmj-北京翰荣名家画坊有限公司', null, null, null, null, null, null, '7749', 'hrmjbjhrmjhfyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6765', '563', 'jllfby-北京金龙联发布艺经营中心', null, null, null, null, null, null, '7750', 'jllfbybjjllfbyjyzx', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6766', '564', 'cygs-北京市朝阳区国家税务局', null, null, null, null, null, null, '7751', 'cygsbjscyqgjswj', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6767', '565', 'jpwj-北京市金鹏五金建材商贸中心', null, null, null, null, null, null, '7752', 'jpwjbjsjpwjjcsmzx', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6768', '566', 'sysc-北京三友商场有限责任公司', null, null, null, null, null, null, '7753', 'syscbjsyscyxzrgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6769', '567', 'HBK-北京化玻科仪器有限责任公司', null, null, null, null, null, null, '7754', 'HBKbjhbkyqyxzrgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6770', '568', 'bjxwj-北京兴望金建材商城有限公司', null, null, null, null, null, null, '7755', 'bjxwjbjxwjjcscyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6771', '569', 'htsm-北京市华特商贸公司', null, null, null, null, null, null, '7756', 'htsmbjshtsmgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6772', '570', 'KSDR-北京康思达睿科贸有限公司', null, null, null, null, null, null, '7757', 'KSDRbjksdrkmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6773', '571', 'BTCY-北京博天诚业科技有限公司', null, null, null, null, null, null, '7758', 'BTCYbjbtcykjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6774', '572', 'jlf-北京家乐福商业有限公司通州店', null, null, null, null, null, null, '7759', 'jlfbjjlfsyyxgstzd', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6775', '573', 'hzsc-北京杭州丝绸城市场有限公司', null, null, null, null, null, null, '7760', 'hzscbjhzsccscyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6776', '574', 'thfz-北京天海服装批发市场', null, null, null, null, null, null, '7761', 'thfzbjthfzpfsc', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6777', '575', 'hlhfm-北京市恒利和阀门五金销售部', null, null, null, null, null, null, '7762', 'hlhfmbjshlhfmwjxsb', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6778', '576', 'htfz-北京海天服装批发市场有限公司', null, null, null, null, null, null, '7763', 'htfzbjhtfzpfscyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6779', '577', 'shsc-北京苏杭丝绸城市场有限公司', null, null, null, null, null, null, '7764', 'shscbjshsccscyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6780', '578', 'LZYX-北京丽珠医学技术有限公司', null, null, null, null, null, null, '7765', 'LZYXbjlzyxjsyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6781', '579', 'BFYT-北京北方仪涛商贸有限公司', null, null, null, null, null, null, '7766', 'BFYTbjbfytsmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6782', '580', 'jkl-北京京客隆商业集团股份有限公司回龙观店', null, null, null, null, null, null, '7767', 'jklbjjklsyjtgfyxgshlgd', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6783', '581', 'lgs-蓝格赛-海龙兴电器设备商业有限公司', null, null, null, null, null, null, '7768', 'lgslgshlxdqsbsyyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6784', '582', 'JDMY-洁定贸易(上海)有限公司', null, null, null, null, null, null, '7769', 'JDMYjdmyshyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6785', '583', 'ylfbg-北京银联丰办公设备销售中心', null, null, null, null, null, null, '7770', 'ylfbgbjylfbgsbxszx', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6786', '584', 'qfkj-北京泉发科技发展有限责任公司', null, null, null, null, null, null, '7771', 'qfkjbjqfkjfzyxzrgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6787', '585', 'ztgh-北京中通国洪商贸有限公司', null, null, null, null, null, null, '7772', 'ztghbjztghsmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6788', '586', 'hpl-北京市和平里医院', null, null, null, null, null, null, '7773', 'hplbjshplyy', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6789', '587', 'yhbxg-深圳市耀华不锈钢厨具有限公司', null, null, null, null, null, null, '7774', 'yhbxgszsyhbxgcjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6790', '588', 'jwyl-北京京卫医疗用品公司', null, null, null, null, null, null, '7775', 'jwylbjjwylypgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6791', '589', 'YACX-北京亚奥春晓商贸中心', null, null, null, null, null, null, '7776', 'YACXbjyacxsmzx', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6792', '590', 'LPSW-北京绿平生物技术开发有限公司', null, null, null, null, null, null, '7777', 'LPSWbjlpswjskfyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6793', '591', 'LP-乐普(北京)医疗器械股份有限公司', null, null, null, null, null, null, '7778', 'LPlpbjylqxgfyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6794', '592', 'hd-北京衡达技术服务中心', null, null, null, null, null, null, '7779', 'hdbjhdjsfwzx', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6795', '593', 'ktyl-北京康拓医疗仪器有限公司', null, null, null, null, null, null, '7780', 'ktylbjktylyqyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6796', '594', 'sajj-浙江圣奥家具制造有限公司', null, null, null, null, null, null, '7781', 'sajjzjsajjzzyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6797', '595', 'ztfd-北京志腾飞达科技有限公司', null, null, null, null, null, null, '7782', 'ztfdbjztfdkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6798', '596', 'gjzb-中技国际招标公司', null, null, null, null, null, null, '7783', 'gjzbzjgjzbgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6799', '597', 'NLT-北京诺立特科技开发有限公司', null, null, null, null, null, null, '7784', 'NLTbjnltkjkfyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6800', '598', 'SHMT-上海美太医疗设备有限公司', null, null, null, null, null, null, '7785', 'SHMTshmtylsbyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6801', '599', 'RYX- 北京荣亦兴经贸公司', null, null, null, null, null, null, '7786', 'RYXbjryxjmgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6802', '600', 'JRT-北京京瑞天之威医疗器械销售中心', null, null, null, null, null, null, '7787', 'JRTbjjrtzwylqxxszx', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6803', '601', 'xxlwj-北京市旭鑫隆五金机电经营部', null, null, null, null, null, null, '7788', 'xxlwjbjsxxlwjjdjyb', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6804', '602', 'clxx-北京朝龙新兴五金交电市场有限公司', null, null, null, null, null, null, '7789', 'clxxbjclxxwjjdscyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6805', '603', 'dfom-北京东方欧美华工业装备有限公司', null, null, null, null, null, null, '7790', 'dfombjdfomhgyzbyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6806', '604', 'tdwuj-北京腾达五金建材有限公司', null, null, null, null, null, null, '7791', 'tdwujbjtdwjjcyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6807', '605', 'jssdwj-北京市京顺盛达五金机电商店', null, null, null, null, null, null, '7792', 'jssdwjbjsjssdwjjdsd', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6808', '606', 'xssy-北京市兴胜山鹰线缆有限公司', null, null, null, null, null, null, '7793', 'xssybjsxssyxlyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6809', '607', 'dfyh-北京东方耀华厨房设备有限公司', null, null, null, null, null, null, '7794', 'dfyhbjdfyhcfsbyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6810', '608', 'yfa-北京永福安消防器材销售中心', null, null, null, null, null, null, '7795', 'yfabjyfaxfqcxszx', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6811', '609', 'bjdxdyyy-北京大学第一医院', null, null, null, null, null, null, '7796', 'bjdxdyyybjdxdyyy', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6812', '610', 'ysec-北京印刷集团有限责任公司印刷二厂', null, null, null, null, null, null, '7797', 'ysecbjysjtyxzrgsysec', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6813', '611', 'ykd-北京益康德医疗器械有限公司', null, null, null, null, null, null, '7798', 'ykdbjykdylqxyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6814', '612', 'dhhc-北京东华合创数码科技股份有限公司', null, null, null, null, null, null, '7799', 'dhhcbjdhhcsmkjgfyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6815', '613', 'HFD-北京恒丰达医疗器械有限责任公司', null, null, null, null, null, null, '7800', 'HFDbjhfdylqxyxzrgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6816', '614', 'prbk-普瑞博科（北京）科贸有限公司', null, null, null, null, null, null, '7801', 'prbkprbkbjkmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6817', '615', 'ltsk-北京龙腾书刊发行公司', null, null, null, null, null, null, '7802', 'ltskbjltskfxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6818', '616', 'slp-北京森雷普实验室设备有限公司', null, null, null, null, null, null, '7803', 'slpbjslpsyssbyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6819', '617', 'ZGYY-中国医药对外贸易公司', null, null, null, null, null, null, '7804', 'ZGYYzgyydwmygs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6820', '618', 'QHZH-北京泉辉泽惠医疗设备有限公司', null, null, null, null, null, null, '7805', 'QHZHbjqhzhylsbyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6821', '619', 'ZGKX-中国科学器材进出口总公司', null, null, null, null, null, null, '7806', 'ZGKXzgkxqcjckzgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6822', '620', 'ysgf-北京市永顺广发建材商店', null, null, null, null, null, null, '7807', 'ysgfbjsysgfjcsd', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6823', '621', 'jty-北京金太阳商贸有限公司', null, null, null, null, null, null, '7808', 'jtybjjtysmyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6824', '622', 'ZHKX-北京正瀚科学仪器有限公司', null, null, null, null, null, null, '7809', 'ZHKXbjzhkxyqyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6825', '623', 'jhl-北京久恒隆仪表技术开发有限责任公司', null, null, null, null, null, null, '7810', 'jhlbjjhlybjskfyxzrgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6826', '624', 'zdxf-北京中电兴发科技有限公司', null, null, null, null, null, null, '7811', 'zdxfbjzdxfkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6827', '625', 'mchl-北京美承互联数码科技发展有限公司', null, null, null, null, null, null, '7812', 'mchlbjmchlsmkjfzyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6828', '626', 'zgwt-中国网通（集团）有限公司北京分公司', null, null, null, null, null, null, '7813', 'zgwtzgwtjtyxgsbjfgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6829', '627', 'sat-北京思奥特科技发展有限公司', null, null, null, null, null, null, '7814', 'satbjsatkjfzyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6830', '628', 'XBGR-北京星标格瑞生物技术发展有限公司', null, null, null, null, null, null, '7815', 'XBGRbjxbgrswjsfzyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6831', '629', 'SHTD-上海泰德医疗器械有限公司', null, null, null, null, null, null, '7816', 'SHTDshtdylqxyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6832', '630', 'DHJC-北京道合憬诚医疗器械有限公司', null, null, null, null, null, null, '7817', 'DHJCbjdhjcylqxyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6833', '631', 'YTH-北京悦泰行科技发展有限公司', null, null, null, null, null, null, '7818', 'YTHbjytxkjfzyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6834', '632', 'XHHT-北京信弘汇天医疗技术开发有限公司', null, null, null, null, null, null, '7819', 'XHHTbjxhhtyljskfyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6835', '633', 'lytg-北京绿氧天罡科技开发有限公司', null, null, null, null, null, null, '7820', 'lytgbjlytgkjkfyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6836', '634', 'shsl-上海三菱电梯有限公司', null, null, null, null, null, null, '7821', 'shslshsldtyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6837', '635', 'HNS-北京昊诺斯科技有限公司', null, null, null, null, null, null, '7822', 'HNSbjhnskjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6838', '636', 'slx-北京圣兰心服装服饰有限责任公司', null, null, null, null, null, null, '7823', 'slxbjslxfzfsyxzrgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6839', '637', 'yymy-北京誉远名扬窗饰用品有限公司', null, null, null, null, null, null, '7824', 'yymybjyymycsypyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6840', '638', 'ssfz-北京绅士服装服饰有限公司', null, null, null, null, null, null, '7825', 'ssfzbjssfzfsyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6841', '639', 'JQJJ-北京鉴清洁净科技有限责任公司', null, null, null, null, null, null, '7826', 'JQJJbjjqjjkjyxzrgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6842', '640', 'fxwj-北京市福兴五金建材经营部', null, null, null, null, null, null, '7827', 'fxwjbjsfxwjjcjyb', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6843', '641', 'jgyd-北京旧宫园鼎机械维修部', null, null, null, null, null, null, '7828', 'jgydbjjgydjxwxb', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6844', '642', 'BTRC-北京比特瑞创科技有限公司', null, null, null, null, null, null, '7829', 'BTRCbjbtrckjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6845', '643', 'etyy-首都医科大学附属北京儿童医院', null, null, null, null, null, null, '7830', 'etyysdykdxfsbjetyy', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6846', '644', 'cycdc-北京市朝阳区疾病预防控制中心', null, null, null, null, null, null, '7831', 'cycdcbjscyqjbyfkzzx', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6847', '645', 'dfswj-北京市地方税务局', null, null, null, null, null, null, '7832', 'dfswjbjsdfswj', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6848', '646', 'HYY-北京宏医耀科技发展有限公司', null, null, null, null, null, null, '7833', 'HYYbjhyykjfzyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6849', '647', 'xylp-北京心悦良品科技有限公司', null, null, null, null, null, null, '7834', 'xylpbjxylpkjyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6850', '648', 'xjf-北京市鑫聚发建材商店', null, null, null, null, null, null, '7835', 'xjfbjsxjfjcsd', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6851', '649', 'bjscyfe-北京市朝阳区妇儿医院', null, null, null, null, null, null, '7836', 'bjscyfebjscyqfeyy', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6852', '650', 'GDLZ-北京光电联众医疗器械有限公司', null, null, null, null, null, null, '7837', 'GDLZbjgdlzylqxyxgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6853', '651', 'dwzz-单位自制', null, null, null, null, null, null, '7838', 'dwzzdwzz', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6854', '652', '上海供应商001', null, null, null, null, null, null, '7839', 'shgys001', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6855', '653', '北京知春路供应商', null, null, null, null, null, null, '7840', 'bjzclgys', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6856', '654', '测试供应商', null, null, null, null, null, null, '7841', 'csgys', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6857', '655', '测试供应商2', null, null, null, null, null, null, '7842', 'csgys2', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6858', '656', '阿奇霉素供应商', null, null, null, null, null, null, '7843', 'aqmsgys', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6859', '657', '阿莫西林供应商', null, null, null, null, null, null, '7844', 'amxlgys', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6860', '658', 'zl测试001', null, null, null, null, null, null, '7845', 'zlcs001', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6861', '659', 'zl测试002', null, null, null, null, null, null, '7846', 'zlcs002', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6862', '660', 'zh1供应商', null, null, null, null, null, null, '7847', 'zh1gys', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6863', '661', 'zh2', null, null, null, null, null, null, '7848', 'zh2', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6864', '662', 'zh2供应商', null, null, null, null, null, null, '7849', 'zh2gys', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6865', '663', 'zh4', null, null, null, null, null, null, '7850', 'zh4', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6866', '664', 'zh5', null, null, null, null, null, null, '7851', 'zh5', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6867', '665', 'a', null, null, null, null, null, null, '7852', 'a', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6868', '666', 'as', null, null, null, null, null, null, '7853', 'as', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6869', '667', '泰安', null, null, null, null, null, null, '7854', 'ta', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6870', '668', '北京', null, null, null, null, null, null, '7855', 'bj', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6871', '669', '测试1', null, null, null, null, null, null, '7856', 'cs1', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6872', '670', '测试2', null, null, null, null, null, null, '7857', 'cs2', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6873', '671', '测试3', null, null, null, null, null, null, '7858', 'cs3', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6874', '672', '测试4', null, null, null, null, null, null, '7859', 'cs4', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6875', '673', '测试5', null, null, null, null, null, null, '7860', 'cs5', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6876', '674', '测试6', null, null, null, null, null, null, '7861', 'cs6', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6877', '675', '测试7', null, null, null, null, null, null, '7862', 'cs7', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6878', '676', '测试8', null, null, null, null, null, null, '7863', 'cs8', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6879', '677', '测试9', null, null, null, null, null, null, '7864', 'cs9', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6880', '678', 'BJZY-北京制药', null, null, null, null, null, null, '7865', 'BJZYbjzy', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6881', '679', '上海供应商', null, null, null, null, null, null, '7866', 'shgys', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6882', '680', 'TADHRJ-泰安东华软件', null, null, null, null, null, null, '7867', 'TADHRJtadhrj', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6883', '681', '北京东华软件供应商', null, null, null, null, null, null, '7868', 'bjdhrjgys', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6884', '682', '东华软件股份公司', null, null, null, null, null, null, '7869', 'dhrjgfgs', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6885', '683', 'KPJT-鲲鹏集团', null, null, null, null, null, null, '7870', 'KPJTkpjt', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6886', '684', 'HFH-火凤凰', null, null, null, null, null, null, '7871', 'HFHhfh', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6887', '704', 'BJCSGYS1-北京测试供应商', null, null, null, null, null, null, '7872', 'BJCSGYS1bjcsgys', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6888', '705', 'BJCSGYS2-北京测试供应商', null, null, null, null, null, null, '7873', 'BJCSGYS2bjcsgys', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6889', '707', 'zl测试003', null, null, null, null, null, null, '7874', 'zlcs003', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6890', '708', 'zl测试004', null, null, null, null, null, null, '7875', 'zlcs004', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6891', '709', 'zl测试005', null, null, null, null, null, null, '7876', 'zlcs005', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6892', '710', 'zl测试006', null, null, null, null, null, null, '7877', 'zlcs006', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6893', '711', 'zl测试007', null, null, null, null, null, null, '7878', 'zlcs007', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6894', '712', 'zl测试008', null, null, null, null, null, null, '7879', 'zlcs008', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6895', '713', 'zl测试009', null, null, null, null, null, null, '7880', 'zlcs009', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6896', '714', 'zl测试010', null, null, null, null, null, null, '7881', 'zlcs010', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6897', '715', 'zh测试11', null, null, null, null, null, null, '7882', 'zhcs11', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6898', '716', '供应商', null, null, null, null, null, null, '7883', 'gys', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6899', '717', '测试10', null, null, null, null, null, null, '7884', 'cs10', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6900', '718', '供应商111', null, null, null, null, null, null, '7885', 'gys111', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6901', '719', '供应商', null, null, null, null, null, null, '7886', 'gys', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6902', '720', 'zl供应商', null, null, null, null, null, null, '7887', 'zlgys', '7', null, null, null, null);
INSERT INTO "SCM"."T_HOP_VENDOR" VALUES ('6903', '721', '藏剑山庄供应商', null, null, null, null, null, null, '7888', 'zjszgys', '7', null, null, null, null);

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
INSERT INTO "SCM"."T_ORD_EXESTATE" VALUES ('15253', '4201', '3', TO_TIMESTAMP(' 2015-03-30 11:23:53:942000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '8', null, 'zzzzzz', null);
INSERT INTO "SCM"."T_ORD_EXESTATE" VALUES ('15254', '4201', '3', TO_TIMESTAMP(' 2015-03-30 11:23:53:945000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '8', null, 'xxxxxxxx', null);
INSERT INTO "SCM"."T_ORD_EXESTATE" VALUES ('15255', '4201', '4', TO_TIMESTAMP(' 2015-03-30 11:24:09:769000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '67', null, null, null);
INSERT INTO "SCM"."T_ORD_EXESTATE" VALUES ('16251', '5201', '1', TO_TIMESTAMP(' 2015-03-30 14:49:43:779000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '67', null, null, null);
INSERT INTO "SCM"."T_ORD_EXESTATE" VALUES ('16253', '5201', '3', TO_TIMESTAMP(' 2015-03-30 14:51:48:810000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '8', null, 'yyyyyyy', null);
INSERT INTO "SCM"."T_ORD_EXESTATE" VALUES ('16254', '5201', '3', TO_TIMESTAMP(' 2015-03-30 14:51:48:810000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '8', null, 'xxxxxxxxx', null);
INSERT INTO "SCM"."T_ORD_EXESTATE" VALUES ('16255', '5201', '4', TO_TIMESTAMP(' 2015-03-30 14:52:20:644000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '67', null, null, null);
INSERT INTO "SCM"."T_ORD_EXESTATE" VALUES ('18350', '7300', '1', TO_TIMESTAMP(' 2015-04-12 21:55:00:574000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '107', null, null, null);
INSERT INTO "SCM"."T_ORD_EXESTATE" VALUES ('18351', '7301', '1', TO_TIMESTAMP(' 2015-04-12 21:56:14:908000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '111', null, null, null);
INSERT INTO "SCM"."T_ORD_EXESTATE" VALUES ('15252', '4201', '2', TO_TIMESTAMP(' 2015-03-30 11:23:22:607000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '8', null, null, null);
INSERT INTO "SCM"."T_ORD_EXESTATE" VALUES ('16250', '5200', '1', TO_TIMESTAMP(' 2015-03-30 14:49:43:779000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '67', null, null, null);
INSERT INTO "SCM"."T_ORD_EXESTATE" VALUES ('17250', '6200', '1', TO_TIMESTAMP(' 2015-04-06 16:51:01:608000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '67', null, null, null);
INSERT INTO "SCM"."T_ORD_EXESTATE" VALUES ('17251', '6201', '1', TO_TIMESTAMP(' 2015-04-06 16:51:01:646000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '67', null, null, null);
INSERT INTO "SCM"."T_ORD_EXESTATE" VALUES ('17252', '6202', '1', TO_TIMESTAMP(' 2015-04-06 16:51:01:646000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '67', null, null, null);
INSERT INTO "SCM"."T_ORD_EXESTATE" VALUES ('18250', '7200', '1', TO_TIMESTAMP(' 2015-04-12 10:21:46:349000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '108', null, null, null);
INSERT INTO "SCM"."T_ORD_EXESTATE" VALUES ('18251', '7201', '1', TO_TIMESTAMP(' 2015-04-12 10:21:46:356000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '108', null, null, null);
INSERT INTO "SCM"."T_ORD_EXESTATE" VALUES ('18252', '7202', '1', TO_TIMESTAMP(' 2015-04-12 10:21:46:357000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '108', null, null, null);
INSERT INTO "SCM"."T_ORD_EXESTATE" VALUES ('18253', '7203', '1', TO_TIMESTAMP(' 2015-04-12 10:22:34:617000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '109', null, null, null);
INSERT INTO "SCM"."T_ORD_EXESTATE" VALUES ('18254', '7204', '1', TO_TIMESTAMP(' 2015-04-12 10:22:34:617000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '109', null, null, null);
INSERT INTO "SCM"."T_ORD_EXESTATE" VALUES ('18255', '7205', '1', TO_TIMESTAMP(' 2015-04-12 10:22:34:618000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '109', null, null, null);
INSERT INTO "SCM"."T_ORD_EXESTATE" VALUES ('18256', '7206', '1', TO_TIMESTAMP(' 2015-04-12 10:56:56:122000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '109', null, null, null);
INSERT INTO "SCM"."T_ORD_EXESTATE" VALUES ('18257', '7207', '1', TO_TIMESTAMP(' 2015-04-12 10:57:45:204000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '67', null, null, null);
INSERT INTO "SCM"."T_ORD_EXESTATE" VALUES ('18300', '7250', '1', TO_TIMESTAMP(' 2015-04-12 13:31:52:290000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '110', null, null, null);
INSERT INTO "SCM"."T_ORD_EXESTATE" VALUES ('15250', '4200', '1', TO_TIMESTAMP(' 2015-03-30 11:22:58:122000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '67', null, null, null);
INSERT INTO "SCM"."T_ORD_EXESTATE" VALUES ('15251', '4201', '1', TO_TIMESTAMP(' 2015-03-30 11:22:58:128000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '67', null, null, null);
INSERT INTO "SCM"."T_ORD_EXESTATE" VALUES ('16252', '5201', '2', TO_TIMESTAMP(' 2015-03-30 14:50:32:903000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '8', null, null, null);

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
INSERT INTO "SCM"."T_ORD_ORDERDETAIL" VALUES ('5200', '7', 'ORD201503303', '7142', '19821', '6341', '盒(12)', '盒(12)', '12000', '1000', null, '12', '143', '109', '67', TO_TIMESTAMP(' 2015-02-01 14:49:43:0000000', 'YYYY-MM-DD HH24:MI:SS:FF7'), '12', '1');
INSERT INTO "SCM"."T_ORD_ORDERDETAIL" VALUES ('5201', '7', 'ORD201503304', '7121', '19793', '6331', '箱', '箱', '500', '500', '500', '89', '143', '109', '67', TO_TIMESTAMP(' 2015-01-01 14:49:43:0000000', 'YYYY-MM-DD HH24:MI:SS:FF7'), '1', '5');
INSERT INTO "SCM"."T_ORD_ORDERDETAIL" VALUES ('7300', '7', 'ORD201504126', '7121', '19792', '6326', '箱(24)', '箱(24)', '24', '1', null, '12', '150', null, '107', TO_TIMESTAMP(' 2015-04-12 21:55:00:4530000', 'YYYY-MM-DD HH24:MI:SS:FF7'), '24', '1');
INSERT INTO "SCM"."T_ORD_ORDERDETAIL" VALUES ('7301', '7', 'ORD201504127', '7142', '19822', '6342', '盒(12)', '盒(12)', '1', '1', null, '24', '162', '144', '111', TO_TIMESTAMP(' 2015-04-12 21:56:14:9000000', 'YYYY-MM-DD HH24:MI:SS:FF7'), '1', '1');
INSERT INTO "SCM"."T_ORD_ORDERDETAIL" VALUES ('6200', '7', 'ORD201504061', '7121', '19793', '6331', '箱', '箱', '1', '1', null, '89', '143', '109', '67', TO_TIMESTAMP(' 2015-04-06 16:51:01:0780000', 'YYYY-MM-DD HH24:MI:SS:FF7'), '1', '1');
INSERT INTO "SCM"."T_ORD_ORDERDETAIL" VALUES ('6201', '7', 'ORD201504061', '7121', '19796', '6330', '盒(12支)', '盒(12支)', '36', '3', null, '12', '143', '109', '67', TO_TIMESTAMP(' 2015-04-06 16:51:01:5590000', 'YYYY-MM-DD HH24:MI:SS:FF7'), '12', '1');
INSERT INTO "SCM"."T_ORD_ORDERDETAIL" VALUES ('6202', '7', 'ORD201504061', '7121', '19793', '6331', '箱', '箱', '1', '1', null, '89', '143', '109', '67', TO_TIMESTAMP(' 2015-04-06 16:51:01:5670000', 'YYYY-MM-DD HH24:MI:SS:FF7'), '1', '1');
INSERT INTO "SCM"."T_ORD_ORDERDETAIL" VALUES ('7200', '7', 'ORD201504121', '7121', '19793', '6331', '箱', '箱', '1', '1', null, '89', '164', '141', '108', TO_TIMESTAMP(' 2015-04-12 10:21:46:1930000', 'YYYY-MM-DD HH24:MI:SS:FF7'), '1', '1');
INSERT INTO "SCM"."T_ORD_ORDERDETAIL" VALUES ('7201', '7', 'ORD201504121', '7121', '19788', '6332', '支', '支', '1', '1', null, '1', '164', '141', '108', TO_TIMESTAMP(' 2015-04-12 10:21:46:3330000', 'YYYY-MM-DD HH24:MI:SS:FF7'), '1', '1');
INSERT INTO "SCM"."T_ORD_ORDERDETAIL" VALUES ('7202', '7', 'ORD201504121', '7121', '19791', '6333', '盒(12)', '盒(12)', '12', '1', null, '18', '164', '141', '108', TO_TIMESTAMP(' 2015-04-12 10:21:46:3440000', 'YYYY-MM-DD HH24:MI:SS:FF7'), '12', '1');
INSERT INTO "SCM"."T_ORD_ORDERDETAIL" VALUES ('4200', '7', 'ORD201503301', '7142', '19821', '6341', '盒(12)', '盒(12)', '24', '2', null, '12', '143', '109', '67', TO_TIMESTAMP(' 2015-03-30 11:22:57:9620000', 'YYYY-MM-DD HH24:MI:SS:FF7'), '12', '1');
INSERT INTO "SCM"."T_ORD_ORDERDETAIL" VALUES ('4201', '7', 'ORD201503302', '7121', '19793', '6331', '箱', '箱', '3', '3', '3', '89', '143', '109', '67', TO_TIMESTAMP(' 2015-03-30 11:22:58:1130000', 'YYYY-MM-DD HH24:MI:SS:FF7'), '1', '5');
INSERT INTO "SCM"."T_ORD_ORDERDETAIL" VALUES ('7203', '7', 'ORD201504122', '7121', '19793', '6331', '箱', '箱', '1', '1', null, '89', '165', '142', '109', TO_TIMESTAMP(' 2015-04-12 10:22:34:4310000', 'YYYY-MM-DD HH24:MI:SS:FF7'), '1', '1');
INSERT INTO "SCM"."T_ORD_ORDERDETAIL" VALUES ('7204', '7', 'ORD201504122', '7121', '19789', '6329', '盒(20)', '盒(20)', '20', '1', null, '20', '165', '142', '109', TO_TIMESTAMP(' 2015-04-12 10:22:34:6050000', 'YYYY-MM-DD HH24:MI:SS:FF7'), '20', '1');
INSERT INTO "SCM"."T_ORD_ORDERDETAIL" VALUES ('7205', '7', 'ORD201504122', '7121', '19796', '6330', '盒(12支)', '盒(12支)', '12', '1', null, '12', '165', '142', '109', TO_TIMESTAMP(' 2015-04-12 10:22:34:6160000', 'YYYY-MM-DD HH24:MI:SS:FF7'), '12', '1');
INSERT INTO "SCM"."T_ORD_ORDERDETAIL" VALUES ('7206', '7', 'ORD201504123', '7121', '19791', '6333', '盒(12)', '盒(12)', '119988', '9999', null, '18', '165', '142', '109', TO_TIMESTAMP(' 2015-04-12 10:56:56:1090000', 'YYYY-MM-DD HH24:MI:SS:FF7'), '12', '1');
INSERT INTO "SCM"."T_ORD_ORDERDETAIL" VALUES ('7207', '7', 'ORD201504124', '7121', '19791', '6333', '盒(12)', '盒(12)', '9600', '800', null, '18', '143', '109', '67', TO_TIMESTAMP(' 2015-04-12 10:57:45:1960000', 'YYYY-MM-DD HH24:MI:SS:FF7'), '12', '1');
INSERT INTO "SCM"."T_ORD_ORDERDETAIL" VALUES ('7250', '7', 'ORD201504125', '7121', '19788', '6332', '支', '支', '1', '1', null, '1', '146', '143', '110', TO_TIMESTAMP(' 2015-04-12 13:31:52:1790000', 'YYYY-MM-DD HH24:MI:SS:FF7'), '1', '1');

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
INSERT INTO "SCM"."T_ORD_ORDERDETAILSUB" VALUES ('ff8080814c68ae1c014c68b4c2220000', '4201', 'xxxxxxxx', 'xxxxxxxx', TO_DATE('2015-03-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '8', TO_TIMESTAMP(' 2015-03-30 11:23:39', 'YYYY-MM-DD HH24:MI:SS:'), 'T', '1', '89');
INSERT INTO "SCM"."T_ORD_ORDERDETAILSUB" VALUES ('ff8080814c68ae1c014c68b4f0b60001', '4201', 'zzzzzz', 'zzzzzz', TO_DATE('2015-03-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '8', TO_TIMESTAMP(' 2015-03-30 11:23:51', 'YYYY-MM-DD HH24:MI:SS:'), 'T', '2', '89');
INSERT INTO "SCM"."T_ORD_ORDERDETAILSUB" VALUES ('402881ee4c6933c6014c6972e2eb0001', '5201', 'xxxxxxxxx', 'xxxxxxxxx', TO_DATE('2015-04-03 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '8', TO_TIMESTAMP(' 2015-03-30 14:51:19', 'YYYY-MM-DD HH24:MI:SS:'), 'T', '100', '89');
INSERT INTO "SCM"."T_ORD_ORDERDETAILSUB" VALUES ('402881ee4c6933c6014c697325290002', '5201', 'yyyyyyy', 'yyyyyyy', TO_DATE('2015-04-02 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '8', TO_TIMESTAMP(' 2015-03-30 14:51:36', 'YYYY-MM-DD HH24:MI:SS:'), 'T', '400', '89');

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
INSERT INTO "SCM"."T_ORD_SHOPPING" VALUES ('14300', '19788', '1', '支', '1', null, '6332', '1', '一次性无菌注射器', '7121');
INSERT INTO "SCM"."T_ORD_SHOPPING" VALUES ('14301', '19793', '1', '箱', '1', null, '6331', '89', '新绿天章70克A4复印纸', '7121');
INSERT INTO "SCM"."T_ORD_SHOPPING" VALUES ('14253', '19788', '1', '支', '1', null, '6332', '1', '一次性无菌注射器', '7121');

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
INSERT INTO "SCM"."T_ORD_STATE" VALUES ('2050', '以评价', '以评价', '5');

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
INSERT INTO "SCM"."T_SYS_APPNO" VALUES ('ORD', '2100', '3', TO_DATE('2015-03-27 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "SCM"."T_SYS_APPNO" VALUES ('ORD', '1050', '10', TO_DATE('2015-03-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "SCM"."T_SYS_APPNO" VALUES ('ORD', '3050', '22', TO_DATE('2015-03-28 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "SCM"."T_SYS_APPNO" VALUES ('ORD', '2050', '28', TO_DATE('2015-03-26 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "SCM"."T_SYS_APPNO" VALUES ('ORD', '50', '22', TO_DATE('2015-03-23 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "SCM"."T_SYS_APPNO" VALUES ('ORD', '4100', '1', TO_DATE('2015-04-06 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "SCM"."T_SYS_APPNO" VALUES ('ORD', '1100', '9', TO_DATE('2015-03-25 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "SCM"."T_SYS_APPNO" VALUES ('ORD', '3100', '4', TO_DATE('2015-03-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "SCM"."T_SYS_APPNO" VALUES ('ORD', '5100', '7', TO_DATE('2015-04-12 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));

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
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('143', '30', 'NSKYBQ-内三科一病区', '7', null, '3', '121');
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
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('142', '8661520', '1.2900-帅府药房(药剂科)', '7', null, '3', '123');
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('161', '71', 'PFXBMZYF-皮肤性病门诊药房', '7', null, '3', null);
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('162', '98', 'ZXYF-中心药房', '7', null, '3', null);
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('163', '99', 'MZZYF-门诊中药房', '7', null, '3', null);
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('164', '100', 'MZXYF-门诊西药房', '7', null, '3', null);
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('165', '101', 'JMPYZX-静脉配液中心', '7', null, '3', null);
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('166', '102', 'XYK-西药库', '7', null, '3', null);
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('167', '225', 'ZYK-中药库', '7', null, '3', null);
INSERT INTO "SCM"."T_SYS_CTLOC" VALUES ('168', '274', 'XYK-西药库01', '7', null, '3', null);

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
INSERT INTO "SCM"."T_SYS_CTLOC_DESTINATION" VALUES ('121', '143', '廊坊管道局医院心内一病区', null, null, null, null, null);
INSERT INTO "SCM"."T_SYS_CTLOC_DESTINATION" VALUES ('144', '162', '222222', null, null, null, null, null);
INSERT INTO "SCM"."T_SYS_CTLOC_DESTINATION" VALUES ('109', '143', '甘肃省中医院', '123456789', '4345455@qq.com', null, null, '2100003');
INSERT INTO "SCM"."T_SYS_CTLOC_DESTINATION" VALUES ('122', '142', '三马路', null, null, null, null, null);
INSERT INTO "SCM"."T_SYS_CTLOC_DESTINATION" VALUES ('123', '142', '四马路', null, null, null, null, null);
INSERT INTO "SCM"."T_SYS_CTLOC_DESTINATION" VALUES ('141', '164', '西药房二楼', null, null, null, null, null);
INSERT INTO "SCM"."T_SYS_CTLOC_DESTINATION" VALUES ('142', '165', '专家楼负一层', null, null, null, null, null);
INSERT INTO "SCM"."T_SYS_CTLOC_DESTINATION" VALUES ('143', '146', '科技楼2号', null, null, null, null, null);

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
INSERT INTO "SCM"."T_SYS_FUNC" VALUES ('70', '44', 'icon-picture', '药品图片维护', '24', '1', null, 'hop/hopIncPicCtrl!listMain.htm', '#CE4B27', '2');
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
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('4028b7c64c55a298014c55be08520005', '87', 'webservice', TO_TIMESTAMP(' 2015-03-26 19:00:59:597000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '127.0.0.1', '护士确认收货调用his接口', null, null, null, '{"inPoImInfos":{"getSCIInPoImInfo":[{"inciDr":"524","batNo":"22","invNo":"sp1","expDate":"2015-03-25","realqty":"0.083333336","ctuomdr":"支","realPrice":"1.8333334","realTotal":null,"vendorDR":"武汉建民","phmnfDR":"602","reCTLOCDR":"8661520","pmsInPoID":"4028b7c64c55a298014c55b869910002","ingdReced":null,"receiveDate":null,"receiveTime":null,"orderQty":"12.0"}]}}', '{"resultCode":"1","resultContent":""}');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('40287d814c5a032e014c5a1bce9e0002', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-03-27 15:21:54:001000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his科室信息列表', null, null, null, '{"hisLocItms":[]}', 'success');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('40287d814c5a032e014c5a1bce2f0001', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-03-27 15:21:52:024000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his科室信息列表', null, null, null, '{"hisLocItms":[]}', 'success');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('ff8080814c5ded7e014c5e1f85fb0006', '67', 'webservice', TO_TIMESTAMP(' 2015-03-28 10:04:26:490000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '127.0.0.1', '护士确认收货调用his接口', null, null, null, '{"inPoImInfos":{"getSCIInPoImInfo":[{"inciDr":"524","batNo":"zx","invNo":"1","expDate":"2015-04-03","realqty":"1.0","ctuomdr":"17","realPrice":"1.0","realTotal":null,"vendorDR":"3","phmnfDR":"602","reCTLOCDR":"30","pmsInPoID":"ff8080814c5ded7e014c5e1f06d60005","ingdReced":null,"receiveDate":null,"receiveTime":null,"orderQty":"1.0"}]}}', '{"resultCode":"1","resultContent":""}');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('ff8080814c5ded7e014c5e457e83000d', '67', 'webservice', TO_TIMESTAMP(' 2015-03-28 10:45:54:946000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '127.0.0.1', '护士确认收货调用his接口', null, null, null, '{"inPoImInfos":{"getSCIInPoImInfo":[{"inciDr":"7240","batNo":"zhouxin","invNo":"zhouxin","expDate":"2015-03-31","realqty":"50.0","ctuomdr":"9","realPrice":"1.0","realTotal":null,"vendorDR":"3","phmnfDR":"602","reCTLOCDR":"30","pmsInPoID":"ff8080814c5ded7e014c5e441fd0000a","ingdReced":null,"receiveDate":null,"receiveTime":null,"orderQty":"100.0"},{"inciDr":"7240","batNo":"zhouxinxin","invNo":"zhouxinxin","expDate":"2015-03-30","realqty":"50.0","ctuomdr":"9","realPrice":"1.0","realTotal":null,"vendorDR":"3","phmnfDR":"602","reCTLOCDR":"30","pmsInPoID":"ff8080814c5ded7e014c5e446b5a000b","ingdReced":null,"receiveDate":null,"receiveTime":null,"orderQty":"100.0"}]}}', '{"resultCode":"1","resultContent":""}');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('ff8080814c5ded7e014c5e459037000e', '67', 'webservice', TO_TIMESTAMP(' 2015-03-28 10:45:59:479000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '127.0.0.1', '护士确认收货调用his接口', null, null, null, '{"inPoImInfos":{"getSCIInPoImInfo":[{"inciDr":"7696","batNo":"zhouxinxinxin","invNo":"zhouxinxinxin","expDate":"2015-03-30","realqty":"120.0","ctuomdr":"支","realPrice":"1.0","realTotal":null,"vendorDR":"3","phmnfDR":"602","reCTLOCDR":"30","pmsInPoID":"ff8080814c5ded7e014c5e45252e000c","ingdReced":null,"receiveDate":null,"receiveTime":null,"orderQty":"120.0"}]}}', '{"resultCode":"1","resultContent":""}');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('297ebc044c5edb39014c5ef5a4e40001', '67', 'webservice', TO_TIMESTAMP(' 2015-03-28 13:58:19:103000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '127.0.0.1', '护士确认收货调用his接口', null, null, null, '{"inPoImInfos":{"getSCIInPoImInfo":[{"inciDr":"7240","batNo":"zxzx","invNo":"zxzx","expDate":"2015-03-31","realqty":"100.0","ctuomdr":"9","realPrice":"1.0","realTotal":null,"vendorDR":"3","phmnfDR":"602","reCTLOCDR":"30","pmsInPoID":"297ebc044c5edb39014c5ef52cbb0000","ingdReced":null,"receiveDate":null,"receiveTime":null,"orderQty":"100.0"}]}}', '{"resultCode":"1","resultContent":""}');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('297ebc044c5edb39014c5ef8f4140003', '67', 'webservice', TO_TIMESTAMP(' 2015-03-28 14:01:55:987000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '127.0.0.1', '护士确认收货调用his接口', null, null, null, '{"inPoImInfos":{"getSCIInPoImInfo":[{"inciDr":"7696","batNo":"xxxx","invNo":"xxxx","expDate":"2015-03-31","realqty":"1200.0","ctuomdr":"17","realPrice":"0.083333336","realTotal":null,"vendorDR":"3","phmnfDR":"602","reCTLOCDR":"30","pmsInPoID":"297ebc044c5edb39014c5ef88a350002","ingdReced":null,"receiveDate":null,"receiveTime":null,"orderQty":"1200.0"}]}}', '{"resultCode":"1","resultContent":""}');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('297ebc044c5edb39014c5f2038300004', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-03-28 14:44:31:121000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his科室信息列表', null, null, null, null, 'org.apache.cxf.service.factory.ServiceConstructionException: Failed to create service.');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('297eacb94c510033014c511c332b0001', '67', 'webservice', TO_TIMESTAMP(' 2015-03-25 21:25:44:874000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '127.0.0.1', '护士确认收货调用his接口', null, null, null, null, '{"resultCode":"-2","resultContent":""}');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('297eacb94c510033014c511ea39a0002', '67', 'webservice', TO_TIMESTAMP(' 2015-03-25 21:28:24:724000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '127.0.0.1', '护士确认收货调用his接口', null, null, null, '{"inPoImInfos":{"getSCIInPoImInfo":[{"inciDr":"524525","batNo":"33","invNo":"2","expDate":"2015-03-24","realqty":"2.0","ctuomdr":"17","realPrice":"2.0","realTotal":null,"vendorDR":"3","phmnfDR":null,"reCTLOCDR":"6","pmsInPoID":"4028b7c64c5060b6014c506a80c20001","ingdReced":null,"receiveDate":null,"receiveTime":null,"orderQty":"1.0"}]}}', '{"resultCode":"-2","resultContent":""}');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('297eacb94c510033014c511eca8e0003', '67', 'webservice', TO_TIMESTAMP(' 2015-03-25 21:28:34:701000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '127.0.0.1', '护士确认收货调用his接口', null, null, null, '{"inPoImInfos":{"getSCIInPoImInfo":[{"inciDr":"524525","batNo":"33","invNo":"2","expDate":"2015-03-24","realqty":"2.0","ctuomdr":"17","realPrice":"2.0","realTotal":null,"vendorDR":"3","phmnfDR":null,"reCTLOCDR":"6","pmsInPoID":"4028b7c64c5060b6014c506a80c20001","ingdReced":null,"receiveDate":null,"receiveTime":null,"orderQty":"1.0"}]}}', '{"resultCode":"-2","resultContent":""}');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('297eacb94c510033014c511f65680004', '67', 'webservice', TO_TIMESTAMP(' 2015-03-25 21:29:14:343000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '127.0.0.1', '护士确认收货调用his接口', null, null, null, '{"inPoImInfos":{"getSCIInPoImInfo":[{"inciDr":"524525","batNo":"33","invNo":"2","expDate":"2015-03-24","realqty":"2.0","ctuomdr":"17","realPrice":"2.0","realTotal":null,"vendorDR":"3","phmnfDR":null,"reCTLOCDR":"6","pmsInPoID":"4028b7c64c5060b6014c506a80c20001","ingdReced":null,"receiveDate":null,"receiveTime":null,"orderQty":"1.0"}]}}', '{"resultCode":"1","resultContent":""}');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('40287d814c59ca44014c59d5731c0002', '67', 'webservice', TO_TIMESTAMP(' 2015-03-27 14:05:03:128000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '127.0.0.1', '护士确认收货调用his接口', null, null, null, '{"inPoImInfos":{"getSCIInPoImInfo":[]}}', '{"resultCode":"-1","resultContent":"<UNDEFINED>zSaveDHCInPoImportInfo+28^web.DHCST.INPOImport.1 *Result"}');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('ff8080814c5ded7e014c5dfe9c950002', '67', 'webservice', TO_TIMESTAMP(' 2015-03-28 09:28:29:589000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '127.0.0.1', '护士确认收货调用his接口', null, null, null, '{"inPoImInfos":{"getSCIInPoImInfo":[{"inciDr":"524","batNo":"xxx","invNo":"xxx","expDate":"2015-03-28","realqty":"120.0","ctuomdr":"支","realPrice":"0.16666667","realTotal":null,"vendorDR":"3","phmnfDR":"602","reCTLOCDR":"6","pmsInPoID":"ff8080814c5ded7e014c5dfb31e20000","ingdReced":null,"receiveDate":null,"receiveTime":null,"orderQty":"240.0"},{"inciDr":"524","batNo":"yyy","invNo":"yyyyy","expDate":"2015-03-30","realqty":"120.0","ctuomdr":"支","realPrice":"0.16666667","realTotal":null,"vendorDR":"3","phmnfDR":"602","reCTLOCDR":"6","pmsInPoID":"ff8080814c5ded7e014c5dfb720e0001","ingdReced":null,"receiveDate":null,"receiveTime":null,"orderQty":"240.0"}]}}', '{"resultCode":"1","resultContent":""}');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('ff8080814c5ded7e014c5e2ff94a0009', '67', 'webservice', TO_TIMESTAMP(' 2015-03-28 10:22:24:586000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '127.0.0.1', '护士确认收货调用his接口', null, null, null, '{"inPoImInfos":{"getSCIInPoImInfo":[{"inciDr":"7240","batNo":"zxzx","invNo":"zxzx","expDate":"2015-03-31","realqty":"100.0","ctuomdr":"17","realPrice":"2.0","realTotal":null,"vendorDR":"3","phmnfDR":"602","reCTLOCDR":"30","pmsInPoID":"ff8080814c5ded7e014c5e2f4b810007","ingdReced":null,"receiveDate":null,"receiveTime":null,"orderQty":"200.0"},{"inciDr":"7240","batNo":"xfff","invNo":"xfff","expDate":"2015-03-31","realqty":"100.0","ctuomdr":"17","realPrice":"1.0","realTotal":null,"vendorDR":"3","phmnfDR":"602","reCTLOCDR":"30","pmsInPoID":"ff8080814c5ded7e014c5e2fa51f0008","ingdReced":null,"receiveDate":null,"receiveTime":null,"orderQty":"200.0"}]}}', '{"resultCode":"1","resultContent":""}');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('4028b7c64c55a298014c55c5129e0006', '88', 'webservice', TO_TIMESTAMP(' 2015-03-26 19:08:40:990000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '127.0.0.1', '护士确认收货调用his接口', null, null, null, '{"inPoImInfos":{"getSCIInPoImInfo":[{"inciDr":"525","batNo":"yyy","invNo":"yyy","expDate":"2015-03-27","realqty":"15.0","ctuomdr":"17","realPrice":"2.0","realTotal":null,"vendorDR":"3","phmnfDR":"602","reCTLOCDR":"8661520","pmsInPoID":"4028b7c64c55a298014c55b964580004","ingdReced":null,"receiveDate":null,"receiveTime":null,"orderQty":"23.0"},{"inciDr":"525","batNo":"xxx","invNo":"xxxx","expDate":"2015-04-02","realqty":"3.0","ctuomdr":"17","realPrice":"2.0","realTotal":null,"vendorDR":"3","phmnfDR":"602","reCTLOCDR":"8661520","pmsInPoID":"4028b7c64c55a298014c55b8eb850003","ingdReced":null,"receiveDate":null,"receiveTime":null,"orderQty":"23.0"}]}}', '{"resultCode":"1","resultContent":""}');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('297eacb94c55d6b0014c55e88da10002', '88', 'webservice', TO_TIMESTAMP(' 2015-03-26 19:47:26:231000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '127.0.0.1', '护士确认收货调用his接口', null, null, null, '{"inPoImInfos":{"getSCIInPoImInfo":[{"inciDr":"525","batNo":"aaa","invNo":"aaa","expDate":"2015-03-26","realqty":"1.0","ctuomdr":"17","realPrice":"1.0","realTotal":null,"vendorDR":"3","phmnfDR":"602","reCTLOCDR":"8661520","pmsInPoID":"297eacb94c55d6b0014c55e7c4270000","ingdReced":null,"receiveDate":null,"receiveTime":null,"orderQty":"2.0"},{"inciDr":"525","batNo":"bbb","invNo":"bbb","expDate":"2015-03-26","realqty":"1.0","ctuomdr":"17","realPrice":"1.0","realTotal":null,"vendorDR":"3","phmnfDR":"602","reCTLOCDR":"8661520","pmsInPoID":"297eacb94c55d6b0014c55e8086f0001","ingdReced":null,"receiveDate":null,"receiveTime":null,"orderQty":"2.0"}]}}', '{"resultCode":"1","resultContent":""}');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('40287d814c59ca44014c59d90b3e0003', '67', 'webservice', TO_TIMESTAMP(' 2015-03-27 14:08:58:681000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '127.0.0.1', '护士确认收货调用his接口', null, null, null, '{"inPoImInfos":{"getSCIInPoImInfo":[{"inciDr":"524","batNo":"xxx","invNo":"xxx","expDate":"2015-03-26","realqty":"1.0","ctuomdr":"17","realPrice":"1.0","realTotal":null,"vendorDR":"3","phmnfDR":"602","reCTLOCDR":"6","pmsInPoID":"40287d814c58f6b7014c58fc08e00000","ingdReced":null,"receiveDate":null,"receiveTime":null,"orderQty":"3.0"},{"inciDr":"524","batNo":"yyy","invNo":"yyy","expDate":"2015-03-27","realqty":"1.0","ctuomdr":"17","realPrice":"1.0","realTotal":null,"vendorDR":"3","phmnfDR":"602","reCTLOCDR":"6","pmsInPoID":"40287d814c58f6b7014c58fc404b0001","ingdReced":null,"receiveDate":null,"receiveTime":null,"orderQty":"3.0"}]}}', '{"resultCode":"1","resultContent":""}');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('40287d814c5a032e014c5a1bce2d0000', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-03-27 15:21:53:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his科室信息列表', null, null, null, '{"hisLocItms":[]}', 'success');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('40287d814c5a032e014c5a1bd2530003', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-03-27 15:21:55:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his科室信息列表', null, null, null, '{"hisLocItms":[]}', 'success');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('40287d814c5a032e014c5a1bd6420004', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-03-27 15:21:56:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his科室信息列表', null, null, null, '{"hisLocItms":[]}', 'success');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('40287d814c5a032e014c5a1bda2e0005', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-03-27 15:21:57:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his科室信息列表', null, null, null, '{"hisLocItms":[]}', 'success');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('40287d814c5a032e014c5a1bde140006', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-03-27 15:21:58:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his科室信息列表', null, null, null, '{"hisLocItms":[]}', 'success');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('40287d814c5a032e014c5a1be1ff0007', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-03-27 15:21:59:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his科室信息列表', null, null, null, '{"hisLocItms":[]}', 'success');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('40287d814c5a032e014c5a1be5e80008', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-03-27 15:22:00:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his科室信息列表', null, null, null, '{"hisLocItms":[]}', 'success');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('40287d814c5a032e014c5a1be9bd0009', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-03-27 15:22:01:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his科室信息列表', null, null, null, '{"hisLocItms":[]}', 'success');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('40287d814c5a032e014c5a1eefb2000a', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-03-27 15:25:19:021000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his科室信息列表', null, null, null, '{"hisLocItms":[]}', 'success');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('40287d814c5a032e014c5a1ef325000b', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-03-27 15:25:20:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his科室信息列表', null, null, null, '{"hisLocItms":[]}', 'success');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('40287d814c5a032e014c5a1ef6fd000c', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-03-27 15:25:21:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his科室信息列表', null, null, null, '{"hisLocItms":[]}', 'success');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('40287d814c5a032e014c5a1efae8000d', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-03-27 15:25:22:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his科室信息列表', null, null, null, '{"hisLocItms":[]}', 'success');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('297ec3224c34de4b014c34f9cbe70000', 'nur123', 'excel上传', TO_TIMESTAMP(' 2015-03-20 10:18:46:872000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '127.0.0.1', '医院订单excel导入', null, null, null, null, '<BR>');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('40287d814c5a032e014c5a1efecd000e', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-03-27 15:25:23:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his科室信息列表', null, null, null, '{"hisLocItms":[]}', 'success');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('40287d814c5a032e014c5a1f02cd000f', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-03-27 15:25:24:013000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his科室信息列表', null, null, null, '{"hisLocItms":[]}', 'success');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('40287d814c5a032e014c5a1f069a0010', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-03-27 15:25:25:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his科室信息列表', null, null, null, '{"hisLocItms":[]}', 'success');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('40287d814c5a032e014c5a1f0a8f0011', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-03-27 15:25:26:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his科室信息列表', null, null, null, '{"hisLocItms":[]}', 'success');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('40287d814c5a032e014c5a1f0ea40012', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-03-27 15:25:27:039000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his科室信息列表', null, null, null, '{"hisLocItms":[]}', 'success');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('40287d814c5a032e014c5a1f12590013', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-03-27 15:25:28:001000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his科室信息列表', null, null, null, '{"hisLocItms":[]}', 'success');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('40287d814c5a032e014c5a1f16520014', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-03-27 15:25:29:016000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his科室信息列表', null, null, null, '{"hisLocItms":[]}', 'success');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('40287d814c5a032e014c5a1f1a360015', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-03-27 15:25:30:003000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his科室信息列表', null, null, null, '{"hisLocItms":[]}', 'success');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('40287d814c5a032e014c5a1f1e1e0016', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-03-27 15:25:31:010000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his科室信息列表', null, null, null, '{"hisLocItms":[]}', 'success');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('40287d814c5a032e014c5a1f22060017', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-03-27 15:25:32:007000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his科室信息列表', null, null, null, '{"hisLocItms":[]}', 'success');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('40287d814c5a032e014c5a1f25ec0018', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-03-27 15:25:33:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his科室信息列表', null, null, null, '{"hisLocItms":[]}', 'success');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('40287d814c5a032e014c5a1f29db0019', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-03-27 15:25:34:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his科室信息列表', null, null, null, '{"hisLocItms":[]}', 'success');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('40287d814c5a032e014c5a1f2dc3001a', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-03-27 15:25:35:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his科室信息列表', null, null, null, '{"hisLocItms":[]}', 'success');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('40287d814c5a032e014c5a20d6e1001b', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-03-27 15:25:42:003000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his科室信息列表', null, null, null, '{"hisLocItms":[]}', 'success');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('40287d814c5a032e014c5a20ddbb001c', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-03-27 15:25:41:012000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his科室信息列表', null, null, null, '{"hisLocItms":[]}', 'success');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('40287d814c5a032e014c5a20e0d0001d', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-03-27 15:25:43:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his科室信息列表', null, null, null, '{"hisLocItms":[]}', 'success');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('40287d814c5a032e014c5a20e2d8001e', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-03-27 15:25:44:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his科室信息列表', null, null, null, '{"hisLocItms":[]}', 'success');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('40287d814c5a032e014c5a20e49b001f', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-03-27 15:25:45:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his科室信息列表', null, null, null, '{"hisLocItms":[]}', 'success');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('40287d814c5a032e014c5a21010f0020', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-03-27 15:27:31:001000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his科室信息列表', null, null, null, '{"hisLocItms":[{"locCode":"71","locDesc":"PFXBMZYF-皮肤性病门诊药房"},{"locCode":"98","locDesc":"ZXYF-中心药房"},{"locCode":"99","locDesc":"MZZYF-门诊中药房"},{"locCode":"100","locDesc":"MZXYF-门诊西药房"},{"locCode":"101","locDesc":"JMPYZX-静脉配液中心"},{"locCode":"102","locDesc":"XYK-西药库"},{"locCode":"225","locDesc":"ZYK-中药库"},{"locCode":"274","locDesc":"XYK-西药库01"}]}', 'success');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('40287d814c5a032e014c5a21e4ae0021', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-03-27 15:28:31:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his科室信息列表', null, null, null, '{"hisLocItms":[{"locCode":"71","locDesc":"PFXBMZYF-皮肤性病门诊药房"},{"locCode":"98","locDesc":"ZXYF-中心药房"},{"locCode":"99","locDesc":"MZZYF-门诊中药房"},{"locCode":"100","locDesc":"MZXYF-门诊西药房"},{"locCode":"101","locDesc":"JMPYZX-静脉配液中心"},{"locCode":"102","locDesc":"XYK-西药库"},{"locCode":"225","locDesc":"ZYK-中药库"},{"locCode":"274","locDesc":"XYK-西药库01"}]}', 'success');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('ff8080814c5f87a1014c5f87f4390000', '67', 'webservice', TO_TIMESTAMP(' 2015-03-28 16:38:07:671000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '127.0.0.1', '护士确认收货调用his接口', null, null, null, 'null', '{"resultCode":"-1","resultContent":null}');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('ff8080814c5f87a1014c5f8829910001', '67', 'webservice', TO_TIMESTAMP(' 2015-03-28 16:38:21:329000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '127.0.0.1', '护士确认收货调用his接口', null, null, null, 'null', '{"resultCode":"-1","resultContent":null}');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('ff8080814c5f87a1014c5f88c5f80002', '67', 'webservice', TO_TIMESTAMP(' 2015-03-28 16:39:01:368000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '127.0.0.1', '护士确认收货调用his接口', null, null, null, 'null', '{"resultCode":"-1","resultContent":null}');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('ff8080814c5f87a1014c5f89014d0003', '67', 'webservice', TO_TIMESTAMP(' 2015-03-28 16:39:16:556000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '127.0.0.1', '护士确认收货调用his接口', null, null, null, 'null', '{"resultCode":"-1","resultContent":null}');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('ff8080814c5f87a1014c5f8a109f0004', '67', 'webservice', TO_TIMESTAMP(' 2015-03-28 16:40:26:014000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '127.0.0.1', '护士确认收货调用his接口', null, null, null, 'null', '{"resultCode":"-1","resultContent":null}');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('ff8080814c5f87a1014c5f8a82150005', '67', 'webservice', TO_TIMESTAMP(' 2015-03-28 16:40:55:060000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '127.0.0.1', '护士确认收货调用his接口', null, null, null, 'null', '{"resultCode":"-1","resultContent":null}');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('ff8080814c5f87a1014c5f8ed2ba0008', '67', 'webservice', TO_TIMESTAMP(' 2015-03-28 16:45:37:848000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '127.0.0.1', '护士确认收货调用his接口', null, null, null, 'null', '{"resultCode":"-1","resultContent":null}');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('ff8080814c5f87a1014c5fbbd9a10015', '67', 'webservice', TO_TIMESTAMP(' 2015-03-28 17:34:48:736000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '127.0.0.1', '护士确认收货调用his接口', null, null, null, 'null', '{"resultCode":"1","resultContent":""}');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('ff8080814c5f87a1014c5fcaf9b60019', '67', 'webservice', TO_TIMESTAMP(' 2015-03-28 17:51:19:989000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '127.0.0.1', '护士确认收货调用his接口', null, null, null, 'null', '{"resultCode":"1","resultContent":""}');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('ff8080814c5f87a1014c5fcb0b12001a', '67', 'webservice', TO_TIMESTAMP(' 2015-03-28 17:51:24:433000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '127.0.0.1', '护士确认收货调用his接口', null, null, null, 'null', '{"resultCode":"1","resultContent":""}');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('ff8080814c5f87a1014c5fd91863001d', '67', 'webservice', TO_TIMESTAMP(' 2015-03-28 18:06:45:347000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '127.0.0.1', '护士确认收货调用his接口', null, null, null, 'null', '{"resultCode":"1","resultContent":""}');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('4028b7c64c9cdc87014c9d16103d0001', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-04-09 15:29:53:048000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his供应商信息列表', null, null, null, null, 'org.apache.cxf.service.factory.ServiceConstructionException: Failed to create service.');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('402881ee4c6933c6014c696cb69e0000', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-03-30 14:44:31:015000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his科室信息列表', null, null, null, '{"hisLocItms":[{"locCode":"71","locDesc":"PFXBMZYF-皮肤性病门诊药房"},{"locCode":"98","locDesc":"ZXYF-中心药房"},{"locCode":"99","locDesc":"MZZYF-门诊中药房"},{"locCode":"100","locDesc":"MZXYF-门诊西药房"},{"locCode":"101","locDesc":"JMPYZX-静脉配液中心"},{"locCode":"102","locDesc":"XYK-西药库"},{"locCode":"225","locDesc":"ZYK-中药库"},{"locCode":"274","locDesc":"XYK-西药库01"}]}', 'success');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('402881ee4c6933c6014c6973e6c70003', '67', 'webservice', TO_TIMESTAMP(' 2015-03-30 14:52:25:671000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '127.0.0.1', '护士确认收货调用his接口', null, null, null, 'null', '{"resultCode":"1","resultContent":""}');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('402881ee4c6933c6014c69965f760004', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-03-30 15:29:53:040000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his供应商信息列表', null, null, null, '{"hisVendorItms":[{"venCode":"0","venDesc":null,"venType":null},{"venCode":"3","venDesc":"武汉建民","venType":null},{"venCode":"4","venDesc":"BWYK-北京北卫粤康医药有限公司","venType":null},{"venCode":"5","venDesc":"DTKJ-北京德天科技发展公司","venType":null},{"venCode":"6","venDesc":"FYD-北京富亚东医药有限公司","venType":null},{"venCode":"7","venDesc":"GAYY-北京广安医药联合中心","venType":null},{"venCode":"8","venDesc":"HFHK-北京华峰惠康医药有限公司","venType":null},{"venCode":"9","venDesc":"HJZY-北京华靳制药有限公司","venType":null},{"venCode":"10","venDesc":"HLKT-北京华立科泰医药有限公司","venType":null},{"venCode":"11","venDesc":"HLKT-北京华立科泰医药有限责任公司","venType":null},{"venCode":"12","venDesc":"YZ-北京华立永正医药有限公司","venType":null},{"venCode":"13","venDesc":"HMTY-北京鹤鸣堂医药有限责任公司","venType":null},{"venCode":"14","venDesc":"JRKX-北京今日康旭医药有限公司","venType":null},{"venCode":"15","venDesc":"JXFX-北京金象复星医药股份有限公司","venType":null},{"venCode":"16","venDesc":"KCYY-北京康辰医药发展有限公司","venType":null},{"venCode":"17","venDesc":"KLH-北京康利华药业","venType":null},{"venCode":"18","venDesc":"KYXH-北京科园信海医药经营有限公司","venType":null},{"venCode":"19","venDesc":"YZSM-北京乐章商贸有限公司","venType":null},{"venCode":"20","venDesc":"PRH-北京普仁鸿医药销售有限公司","venType":null},{"venCode":"21","venDesc":"REZK-北京瑞尔泽康医疗设备有限公司","venType":null},{"venCode":"22","venDesc":"YBQX-北京市医保全新大药房有限责任公司朱鹤堂药店","venType":null},{"venCode":"23","venDesc":"DCJQ-北京市东城区疾病预防控制中心","venType":null},{"venCode":"24","venDesc":"SHYY-北京双鹤药业经营有限公司","venType":null},{"venCode":"25","venDesc":"JWGK-北京市京卫国康医药有限公司","venType":null},{"venCode":"26","venDesc":"BJSJYY-北京市燕京医药公司","venType":null},{"venCode":"27","venDesc":"KL-北京市康联医药有限责任公司","venType":null},{"venCode":"28","venDesc":"BJSYLC-北京首医临床医学科技中心","venType":null},{"venCode":"29","venDesc":"BJSYYB-北京市医药保健品进出口公司","venType":null},{"venCode":"30","venDesc":"TRKM-北京驼人科贸有限公司","venType":null},{"venCode":"31","venDesc":"BJTRTC-北京同仁堂崇文门药店有限责任公司","venType":null},{"venCode":"32","venDesc":"TSL-北京天士力医药有限公司","venType":null},{"venCode":"33","venDesc":"TXPX-北京天星普信生物医药有限公司","venType":null},{"venCode":"34","venDesc":"TYHY-北京太洋环宇医药有限责任公司","venType":null},{"venCode":"35","venDesc":"WWYY-北京万维医药有限公司","venType":null},{"venCode":"36","venDesc":"BJXTYY-北京夏图医药有限公司","venType":null},{"venCode":"37","venDesc":"BJYBQX-北京医保全新大药房责任有限公司","venType":null},{"venCode":"38","venDesc":"YDYY-北京远东医药发展公司","venType":null},{"venCode":"39","venDesc":"BJYHYX-北京协和医学科学技术开发公司","venType":null},{"venCode":"40","venDesc":"YPSH-北京益普四环医药技术开发有限公司","venType":null},{"venCode":"41","venDesc":"JY-北京医药股份有限公司经营分公司","venType":null},{"venCode":"42","venDesc":"SP-北京医药股份有限公司药品分公司","venType":null},{"venCode":"43","venDesc":"YYXX-中国永裕新兴医药有限公司","venType":null},{"venCode":"44","venDesc":"BJZDBF-北京振德北方医用敷料有限公司","venType":null},{"venCode":"45","venDesc":"BJZXYY-北京中欣医药经营公司","venType":null},{"venCode":"46","venDesc":"BJZYKY-北京中预科医药有限公司","venType":null},{"venCode":"47","venDesc":"GDSZHS-广东省珠海市康鸣医药有限公司","venType":null},{"venCode":"48","venDesc":"GYJTYX-国药集团药业股份有限公司","venType":null},{"venCode":"49","venDesc":"HH-国药控股北京华鸿有限公司","venType":null},{"venCode":"50","venDesc":"GA-国药控股北京有限公司广安药品分公司","venType":null},{"venCode":"51","venDesc":"XTY-国药控股北京有限公司新特药品分司","venType":null},{"venCode":"52","venDesc":"YP-国药控股北京有限公司药品分公司","venType":null},{"venCode":"53","venDesc":"HNPAJT-河南飘安集团有限公司","venType":null},{"venCode":"54","venDesc":"SCYDCY-四川远大蜀阳药业有限公司","venType":null},{"venCode":"55","venDesc":"ADF-深圳安多福实业发展有限公司","venType":null},{"venCode":"56","venDesc":"XXSHKW-新乡市华康卫材有限公司","venType":null},{"venCode":"57","venDesc":"XXSHXW-新乡市华西卫材有限公司","venType":null},{"venCode":"58","venDesc":"ZGYXKX-中国医学科学院肿瘤医院","venType":null},{"venCode":"59","venDesc":"TYMKYY-通用美康医药有限公司","venType":null},{"venCode":"60","venDesc":"DWMY-中国医药对外贸易总公司销售分公司","venType":null},{"venCode":"61","venDesc":"YYGY-中国医药工业有限公司","venType":null},{"venCode":"62","venDesc":"北京贝尔达科技发展公司","venType":null},{"venCode":"63","venDesc":"北京北方光电有限公司","venType":null},{"venCode":"64","venDesc":"GZBJBJ-北京邦杰康普科贸有限公司","venType":null},{"venCode":"66","venDesc":"北京医药股份有限公司医疗器械公司","venType":null},{"venCode":"68","venDesc":"重庆永通信息工程公司","venType":null},{"venCode":"69","venDesc":"北京得尔贝经贸公司","venType":null},{"venCode":"70","venDesc":"北京东方信恒科技发展有限公司","venType":null},{"venCode":"71","venDesc":"北京东华原医疗设备公司","venType":null},{"venCode":"72","venDesc":"bjfph-北京市富平和文化用品经营部","venType":null},{"venCode":"73","venDesc":"北京国力泰医疗器械公司","venType":null},{"venCode":"74","venDesc":"国药集团北京医疗器械公司","venType":null},{"venCode":"76","venDesc":"GZBJHN-北京昊诺斯科技有限公司","venType":null},{"venCode":"77","venDesc":"北京华瑞世纪科技有限公司","venType":null},{"venCode":"78","venDesc":"杭州嘉益医疗器械有限公司北京分公司","venType":null},{"venCode":"79","venDesc":"北京华正鸣泽信息技术公司","venType":null},{"venCode":"80","venDesc":"北京金宝光华医疗器械有限公司","venType":null},{"venCode":"81","venDesc":"GZBJJD-北京京东科技有限公司","venType":null},{"venCode":"82","venDesc":"北京健康广济公司","venType":null},{"venCode":"83","venDesc":"北京金新亚科技有限公司","venType":null},{"venCode":"84","venDesc":"北京科佳诚科技发展有限公司","venType":null},{"venCode":"85","venDesc":"北京康莱乐医疗器械有限公司","venType":null},{"venCode":"86","venDesc":"GZBJLA-北京龙安医学技术开发公司","venType":null},{"venCode":"87","venDesc":"北京利文商贸公司","venType":null},{"venCode":"88","venDesc":"北京六一仪器厂","venType":null},{"venCode":"89","venDesc":"北京麦迪锦诚医疗器械公司","venType":null},{"venCode":"90","venDesc":"北京南合西有限公司","venType":null},{"venCode":"91","venDesc":"北京瑞迈商贸中心","venType":null},{"venCode":"92","venDesc":"北京瑞康华科技发展中心","venType":null},{"venCode":"93","venDesc":"北京三明益康医疗器械公司","venType":null},{"venCode":"94","venDesc":"深圳赛得立公司","venType":null},{"venCode":"95","venDesc":"天津开发区合普工贸有限公司","venType":null},{"venCode":"96","venDesc":"桐庐康基伟业医疗器械公司","venType":null},{"venCode":"97","venDesc":"北京鑫荣腾飞商贸公司","venType":null},{"venCode":"98","venDesc":"北京鑫四环消毒技术公司","venType":null},{"venCode":"99","venDesc":"北京鑫舒康医疗设备有限公司","venType":null},{"venCode":"100","venDesc":"北京原平皓生物技术公司","venType":null},{"venCode":"101","venDesc":"北京元业伯乐科技发展公司","venType":null},{"venCode":"102","venDesc":"北京中广润通电子技术公司","venType":null},{"venCode":"103","venDesc":"北京中广润通电子技术有限公司","venType":null},{"venCode":"104","venDesc":"北京德泉科技发展公司","venType":null},{"venCode":"105","venDesc":"北京晶和力科贸有限公司","venType":null},{"venCode":"106","venDesc":"北京诚志华嘉科技有限公司","venType":null},{"venCode":"107","venDesc":"北京东丰中鸿科研仪器有限公司","venType":null},{"venCode":"108","venDesc":"北京东胜创新生物科技有限公司","venType":null},{"venCode":"109","venDesc":"北京国力泰医疗器械有限公司","venType":null},{"venCode":"110","venDesc":"北京恒三江仪器销售公司","venType":null},{"venCode":"111","venDesc":"北京市华信医疗电子设备公司","venType":null},{"venCode":"112","venDesc":"北京若华医疗器械有限公司","venType":null},{"venCode":"113","venDesc":"上海卡利博有限公司","venType":null},{"venCode":"114","venDesc":"上海泰莱医疗器械有限公司","venType":null},{"venCode":"115","venDesc":"北京毅力永医疗器械有限公司","venType":null},{"venCode":"116","venDesc":"北京中润汇宝科技有限公司","venType":null},{"venCode":"117","venDesc":"GZBJZR-北京中润伟业投资有限公司","venType":null},{"venCode":"118","venDesc":"北京泰康弘达科贸有限公司","venType":null},{"venCode":"119","venDesc":"xdbt-北京现代百泰科技有限公司","venType":null},{"venCode":"120","venDesc":"北京英科创业科贸有限公司","venType":null},{"venCode":"121","venDesc":"烟台澳斯邦生物工程有限公司","venType":null},{"venCode":"122","venDesc":"珠海和佳医疗设备公司","venType":null},{"venCode":"123","venDesc":"北京东华原医疗设备有限公司","venType":null},{"venCode":"124","venDesc":"北京德泉兴业商贸有限公司","venType":null},{"venCode":"125","venDesc":"北京福宏达商贸中心","venType":null},{"venCode":"126","venDesc":"北京光电联众医疗器械有限公司","venType":null},{"venCode":"127","venDesc":"国药集团北京医疗器械有限公司","venType":null},{"venCode":"128","venDesc":"北京海慧信息科技有限公司","venType":null},{"venCode":"129","venDesc":"北京华瑞世纪科技公司","venType":null},{"venCode":"130","venDesc":"北京鸿瑞兴生物技术发展公司","venType":null},{"venCode":"131","venDesc":"杭州嘉益医疗器械公司北京分公司","venType":null},{"venCode":"132","venDesc":"北京金宝光华医疗器械公司","venType":null},{"venCode":"133","venDesc":"北京利嘉诚医疗器械有限公司","venType":null},{"venCode":"134","venDesc":"北京欧尼森公司","venType":null},{"venCode":"135","venDesc":"GZBJQX-北京启信科仪贸易有限公司","venType":null},{"venCode":"136","venDesc":"北京胜德伟业机电设备有限公司","venType":null},{"venCode":"137","venDesc":"北京思路高公司","venType":null},{"venCode":"138","venDesc":"北京五洲新桥科技发展公司","venType":null},{"venCode":"139","venDesc":"北京西凯华科贸有限公司","venType":null},{"venCode":"140","venDesc":"北京中美嘉盛科技有限公司","venType":null},{"venCode":"141","venDesc":"北京网鼎系统集成有限公司","venType":null},{"venCode":"142","venDesc":"GZBJJA-北京洁安高科医疗器械有限公司","venType":null},{"venCode":"143","venDesc":"GZBJMZ-北京美众昌盛医疗器械有限公司","venType":null},{"venCode":"144","venDesc":"GZWMTR-未名天人中药有限公司","venType":null},{"venCode":"145","venDesc":"GZXYDY-协宇东盈医疗科技北京有限公司","venType":null},{"venCode":"146","venDesc":"GZBJDFSG-北京东方双冠科技有限公司","venType":null},{"venCode":"147","venDesc":"GZBJQQJJ-北京鉴清洁净科技有限责任公司","venType":null},{"venCode":"148","venDesc":"GZSHMT-上海美太医疗设备有限公司","venType":null},{"venCode":"149","venDesc":"GZBJCS-北京昌盛医学技术有限公司","venType":null},{"venCode":"150","venDesc":"北京健德联合口腔医疗设备有限公司","venType":null},{"venCode":"151","venDesc":"GZBJTP-北京拓普康商贸有限公司","venType":null},{"venCode":"152","venDesc":"GZJSHS-江苏海狮机械集团有限公司","venType":null},{"venCode":"153","venDesc":"GZSZHP-深圳市普华康健投资有限公司","venType":null},{"venCode":"154","venDesc":"GZBJDHHC-北京东华合创数码科技股份有限公司","venType":null},{"venCode":"155","venDesc":"GZJDMY-洁定贸易上海有限公司","venType":null},{"venCode":"156","venDesc":"GZBJNT-北京能通万维网络科技有限公司","venType":null},{"venCode":"157","venDesc":"GZBJXSE-北京西士尔商贸有限公司","venType":null},{"venCode":"158","venDesc":"GZBJSOT-北京思奥特科技发展有限公司","venType":null},{"venCode":"159","venDesc":"GZBJOMSJ-北京欧迈世纪科技有限公司","venType":null},{"venCode":"160","venDesc":"GZSHTD-上海泰德医疗器械有限公司","venType":null},{"venCode":"161","venDesc":"GZZGWT-中国网通集团系统集成有限公司","venType":null},{"venCode":"162","venDesc":"GZBJJBL-北京健百乐科技发展中心","venType":null},{"venCode":"163","venDesc":"GZBJZTSQ-北京中天双屹环保科技有限公司","venType":null},{"venCode":"164","venDesc":"GZBJJLCY-北京嘉联诚业医疗器械销售有限公司","venType":null},{"venCode":"165","venDesc":"GZBJGSYW-北京高视远望科技有限责任公司","venType":null},{"venCode":"166","venDesc":"GZSHLR-上海灵锐医疗器械有限公司","venType":null},{"venCode":"167","venDesc":"GZSHKL-上海科林医疗仪器技术有限公司","venType":null},{"venCode":"168","venDesc":"GZBJJD-北京健德联合口腔医疗有限公司","venType":null},{"venCode":"169","venDesc":"GZBJSM-北京圣曼医疗器材技术有限公司","venType":null},{"venCode":"170","venDesc":"GZBJSJ-北京圣迦天润科技发展有限公司","venType":null},{"venCode":"171","venDesc":"GZBJDFRO-北京东方瑞澳医疗设备有限公司","venType":null},{"venCode":"172","venDesc":"GZBJDNYD-北京东南悦达医疗器械有限公司","venType":null},{"venCode":"173","venDesc":"GZBJBR-北京巴瑞医疗器械有限公司","venType":null},{"venCode":"174","venDesc":"GZBJZX-北京执信阳光医疗科技有限公司","venType":null},{"venCode":"175","venDesc":"GZBJCT-北京京朝腾微医学科技有限公司","venType":null},{"venCode":"176","venDesc":"GZBJSKX-北京赛科希德科技发展有限公司","venType":null},{"venCode":"177","venDesc":"GZBJLP-北京乐普医疗器械有限公司","venType":null},{"venCode":"178","venDesc":"GZBJHSJ-北京恒三江仪器销售有限公司","venType":null},{"venCode":"179","venDesc":"GZBJTPY-北京平利洋医疗设备有限公司","venType":null},{"venCode":"180","venDesc":"GZBJSJ-北京世纪凯盈科学仪器有限公司","venType":null},{"venCode":"181","venDesc":"GZBJOBT-北京欧比特仪器有限公司","venType":null},{"venCode":"182","venDesc":"GZBJJH-北京嘉和美康医用设备有限公司","venType":null},{"venCode":"183","venDesc":"GZBJLJ-北京利嘉诚医药科技有限公司","venType":null},{"venCode":"184","venDesc":"GZBJKY-北京科园信海医药经营有限公司","venType":null},{"venCode":"185","venDesc":"GZBJGY-北京国药中北器械有限公司","venType":null},{"venCode":"186","venDesc":"GZBJBL-北京佰利申科贸有限公司","venType":null},{"venCode":"187","venDesc":"GZBJBL-北京博劢行仪器有限公司","venType":null},{"venCode":"188","venDesc":"GZBJWF-北京万丰大成科学仪器有限公司","venType":null},{"venCode":"189","venDesc":"GZZGYY-中国医药对外贸易公司","venType":null},{"venCode":"190","venDesc":"GZSZDX-深圳德夏科技发展有限公司","venType":null},{"venCode":"191","venDesc":"GZZGKX-中国科学器材进出口总公司","venType":null},{"venCode":"192","venDesc":"GZBJJL-北京嘉力恒业国际贸易有限公司","venType":null},{"venCode":"193","venDesc":"GZBJCM-北京诚茂兴业科技发展有限公司","venType":null},{"venCode":"194","venDesc":"GZBJJC-北京检测仪器有限公司","venType":null},{"venCode":"195","venDesc":"GZBJYY-北京元业伯乐科技发展有限公司","venType":null},{"venCode":"196","venDesc":"GZBJXH-北京信鸿汇天医疗技术开发有限公司","venType":null},{"venCode":"197","venDesc":"GZBJTD-北京铁电通技术开发中心","venType":null},{"venCode":"198","venDesc":"GZRSG-瑞仕格上海商贸有限公司","venType":null},{"venCode":"199","venDesc":"GZBJYS-北京英硕力新柏科技有限公司","venType":null},{"venCode":"200","venDesc":"GZGYJT-国药集团联合医疗器械有限公司","venType":null},{"venCode":"201","venDesc":"GZBJSQ-北京世奇康商贸有限责任公司","venType":null},{"venCode":"202","venDesc":"GZBJPR-北京普瑞亚科技有限公司","venType":null},{"venCode":"203","venDesc":"GZBJZT-北京周天华枫医疗仪器有限公司","venType":null},{"venCode":"204","venDesc":"GZBJMK-北京美康百泰医药科技有限公司","venType":null},{"venCode":"205","venDesc":"GZBJWY-北京唯医静化机电设备有限公司","venType":null},{"venCode":"206","venDesc":"GZBJPD-北京普德鸿医学技术有限公司","venType":null},{"venCode":"207","venDesc":"GZBJKD-北京康德威医疗设备有限公司","venType":null},{"venCode":"208","venDesc":"GZNBSD-宁波圣达精工实业有限公司","venType":null},{"venCode":"209","venDesc":"GZBJHZ-北京弘舟广际科贸公司","venType":null},{"venCode":"210","venDesc":"GZBJAT-北京康拓医疗仪器有限公司","venType":null},{"venCode":"211","venDesc":"GZBJKL-北京快乐一然科技有限公司","venType":null},{"venCode":"212","venDesc":"CSHGYS-初始化供应商","venType":null},{"venCode":"215","venDesc":"山东威高集团北京销售分公司","venType":null},{"venCode":"216","venDesc":"北京市科护医疗器材有限公司","venType":null},{"venCode":"217","venDesc":"北京仁合康盛医疗用品有限公司","venType":null},{"venCode":"218","venDesc":"北京瑞金斯科技有限公司","venType":null},{"venCode":"219","venDesc":"北京健康广济医用品有限公司","venType":null},{"venCode":"220","venDesc":"南京微创","venType":null},{"venCode":"221","venDesc":"天津哈娜好医材有限公司","venType":null},{"venCode":"222","venDesc":"北京宜安泰医疗技术开发有限公司","venType":null},{"venCode":"223","venDesc":"北京美高牙科医疗器材有限责任公司","venType":null},{"venCode":"224","venDesc":"普德鸿医学技术有限公司","venType":null},{"venCode":"225","venDesc":"北京市思创新医疗用品有限责任公司","venType":null},{"venCode":"226","venDesc":"浙江拱东","venType":null},{"venCode":"227","venDesc":"北京锐康麦德科技有限公司","venType":null},{"venCode":"228","venDesc":"北京德凯利康商贸有限公司","venType":null},{"venCode":"229","venDesc":"北京欣复春医药科技有限公司","venType":null},{"venCode":"230","venDesc":"健康广济","venType":null},{"venCode":"231","venDesc":"美高牙科","venType":null},{"venCode":"232","venDesc":"朗健嘉德","venType":null},{"venCode":"233","venDesc":"珠海市弘科医疗设备有限公司","venType":null},{"venCode":"234","venDesc":"福宏达商贸中心","venType":null},{"venCode":"235","venDesc":"北京贝尔生物工程","venType":null},{"venCode":"236","venDesc":"北京豪迈之星生物技术","venType":null},{"venCode":"237","venDesc":"北京华天泽宇医疗器械有限公司","venType":null},{"venCode":"238","venDesc":"北京健峰生物技术有限公司","venType":null},{"venCode":"239","venDesc":"北京健伦商贸公司","venType":null},{"venCode":"240","venDesc":"北京康思达睿科贸有限公司","venType":null},{"venCode":"241","venDesc":"北京莱帮生物技术有限公司","venType":null},{"venCode":"242","venDesc":"北京兰野医学科技中心","venType":null},{"venCode":"243","venDesc":"北京利文商贸有限公司","venType":null},{"venCode":"244","venDesc":"北京欧蒙生物技术有限公司","venType":null},{"venCode":"245","venDesc":"北京普力文科贸有限公司","venType":null},{"venCode":"246","venDesc":"北京燃烽医药有限责任公司","venType":null},{"venCode":"247","venDesc":"北京探针生物技术有限公司","venType":null},{"venCode":"248","venDesc":"北京中德利德曼科技有限公司","venType":null},{"venCode":"249","venDesc":"北京中盛兴华贸易中心","venType":null},{"venCode":"250","venDesc":"北京中天成业生物技术有限公司","venType":null},{"venCode":"251","venDesc":"丽珠医学","venType":null},{"venCode":"252","venDesc":"上海长岛抗体诊断试剂有限公司","venType":null},{"venCode":"253","venDesc":"上海科华生物工程股份有限公司","venType":null},{"venCode":"254","venDesc":"天合力恩","venType":null},{"venCode":"255","venDesc":"万华普曼生物工程有限公司","venType":null},{"venCode":"256","venDesc":"北京奥普瑞兴医疗器械有限责任公司","venType":null},{"venCode":"257","venDesc":"北京福视康华科技发展有限责任公司","venType":null},{"venCode":"259","venDesc":"BJLPYLQXYXGS-北京蓝牌医疗器械有限公司","venType":null},{"venCode":"262","venDesc":"北京世纪长科商贸有限公司","venType":null},{"venCode":"264","venDesc":"泉辉和奕医疗器械有限公司","venType":null},{"venCode":"266","venDesc":"BJWRZY-北京卫仁中药饮片厂","venType":null},{"venCode":"267","venDesc":"BJHMZY-北京华邈中药工程技术开发中心","venType":null},{"venCode":"268","venDesc":"GZZGWT-中国网通(集团)有限公司北京市分公司","venType":null},{"venCode":"269","venDesc":"GZBJZDXF-北京中电兴发科技有限公司","venType":null},{"venCode":"270","venDesc":"GZTJHF-天津市海风联合科技有限公司","venType":null},{"venCode":"271","venDesc":"GZMDS-北京麦德森医疗器械销售中心","venType":null},{"venCode":"272","venDesc":"GZBJAB-北京安博生商贸有限公司","venType":null},{"venCode":"273","venDesc":"GZBJKX-北京可喜安医疗科技有限公司","venType":null},{"venCode":"274","venDesc":"GZBJYQ-北京云雀商贸有限责任公司","venType":null},{"venCode":"275","venDesc":"GZBJTA-北京泰安怡商贸有限公司","venType":null},{"venCode":"276","venDesc":"GZBJJR-北京嘉润利贞科技发展有限公司","venType":null},{"venCode":"277","venDesc":"GZBJZQ-北京卓青伟业科技有限公司","venType":null},{"venCode":"278","venDesc":"GZSHBR-上海倍榕医疗器械有限公司","venType":null},{"venCode":"279","venDesc":"GZBJSM-北京世茂医疗器械贸易有限公司","venType":null},{"venCode":"280","venDesc":"GZBJKY-北京康月达科技有限公司","venType":null},{"venCode":"281","venDesc":"GZBJKW-北京科维永道贸易有限公司","venType":null},{"venCode":"282","venDesc":"GZBJMC-北京美承互联数码科技发展有限公司","venType":null},{"venCode":"283","venDesc":"GZBJZW-北京中网心电信息中心","venType":null},{"venCode":"284","venDesc":"GZBJDH-北京东华原医疗设备有限责任公司","venType":null},{"venCode":"285","venDesc":"GZTYMK-通用美康医药有限公司","venType":null},{"venCode":"286","venDesc":"GZBJJW-北京京卫医疗用品公司","venType":null},{"venCode":"287","venDesc":"GZBJKT-北京康泰宏业科技有限责任公司","venType":null},{"venCode":"288","venDesc":"GZBJYJ-北京宇进圣心科技有限公司","venType":null},{"venCode":"289","venDesc":"GZBJWL-北京威灵远志科技有限责任公司","venType":null},{"venCode":"290","venDesc":"GZBJKD-北京康德宏贸易发展有限公司","venType":null},{"venCode":"291","venDesc":"GZBJGK-北京国康东胜医疗科技有限公司","venType":null},{"venCode":"292","venDesc":"GZBJXH-北京信海康医药有限责任公司","venType":null},{"venCode":"293","venDesc":"GZBJSE-北京芾尔世达医疗器材有限公司","venType":null},{"venCode":"294","venDesc":"GZDLSY-大连三洋冷链有限公司","venType":null},{"venCode":"295","venDesc":"GZBJQH-北京泉辉泽惠医疗设备有限公司","venType":null},{"venCode":"296","venDesc":"GZMDSD-麦迪斯顿（北京）医疗科技有限公司","venType":null},{"venCode":"297","venDesc":"GZBJYY-北京誉远名扬窗饰用品有限公司","venType":null},{"venCode":"298","venDesc":"GZBJSL-北京圣兰心服装服饰有限责任公司","venType":null},{"venCode":"299","venDesc":"GZBJANM-北京阿尼玛经贸有限公司","venType":null},{"venCode":"300","venDesc":"GZBJRT-北京悦泰行科技发展有限公司","venType":null},{"venCode":"301","venDesc":"GZBJDEB-北京得尔贝经贸有限公司","venType":null},{"venCode":"302","venDesc":"GZBJDF-北京东方耀华厨房设备有限公司","venType":null},{"venCode":"303","venDesc":"GZBJSL-北京森雷普实验室设备有限公司","venType":null},{"venCode":"304","venDesc":"GZSZZD-深圳市中电电力技术有限公司","venType":null},{"venCode":"305","venDesc":"GZTFGF-同方股份有限公司","venType":null},{"venCode":"306","venDesc":"GZBJGJ-北京光健科技发展有限公司","venType":null},{"venCode":"307","venDesc":"GZBJCM-北京创美时代办公家具有限公司","venType":null},{"venCode":"308","venDesc":"GZBJXY-北京翔源博润生物科技有限公司","venType":null},{"venCode":"309","venDesc":"GZZJSO-浙江圣奥家具制造有限公司","venType":null},{"venCode":"310","venDesc":"GZBJZT-北京志腾飞达科技有限公司","venType":null},{"venCode":"313","venDesc":"GZBJTS-北京图书大厦有限责任公司","venType":null},{"venCode":"314","venDesc":"GZBJRM-北京瑞迈商贸","venType":null},{"venCode":"315","venDesc":"GZBJSYQFT-北京三元桥丰田汽车销售服务中心","venType":null},{"venCode":"316","venDesc":"GZBJKL-北京康联医用设备有限公司","venType":null},{"venCode":"317","venDesc":"GZBWHX-北京博望恒信智能系统工程有限公司","venType":null},{"venCode":"318","venDesc":"ALKKJ-北京爱乐康科技发展有限公司\n","venType":null},{"venCode":"319","venDesc":"ATKKM-北京爱特康科贸有限责任公司\n","venType":null},{"venCode":"320","venDesc":"AQSD-北京安桥斯达医疗器械有限责任公司\n","venType":null},{"venCode":"321","venDesc":"APRX-北京奥普瑞兴医疗器械有限责任公司\n","venType":null},{"venCode":"322","venDesc":"AMYX-北京澳美医信投资顾问有限公司\n","venType":null},{"venCode":"323","venDesc":"BRYL-北京巴瑞医疗器械有限公司\n","venType":null},{"venCode":"324","venDesc":"BRLE-北京百瑞利恩商贸有限公司\n","venType":null},{"venCode":"325","venDesc":"BLS-北京佰利申科贸有限公司\n","venType":null},{"venCode":"326","venDesc":"BEYY-北京贝恩医药科技开发有限责任公司\n","venType":null},{"venCode":"327","venDesc":"BESW-北京贝尔生物工程\n有限公司","venType":null},{"venCode":"328","venDesc":"BRXB-北京博瑞祥宝科技有限公司\n","venType":null},{"venCode":"329","venDesc":"CRTX-北京长荣同兴科贸\n有限公司","venType":null},{"venCode":"330","venDesc":"DKLK-北京德凯利康商贸\n有限公司","venType":null},{"venCode":"331","venDesc":"DFSG-北京东方双冠科技有限公司\n","venType":null},{"venCode":"332","venDesc":"DLMD-北京东林麦迪商贸有限公司\n","venType":null},{"venCode":"333","venDesc":"DNYD-北京东南悦达医疗器械有限公司\n","venType":null},{"venCode":"335","venDesc":"GKKJ-北京共康科技发展有限公司\n","venType":null},{"venCode":"336","venDesc":"HM-北京豪迈生物工程有限公司\n","venType":null},{"venCode":"337","venDesc":"HLDC-北京合力鼎成科贸有限责任公司\n","venType":null},{"venCode":"338","venDesc":"HRYG-北京和瑞阳光科技有限公司","venType":null},{"venCode":"339","venDesc":"HDPR-北京厚德普瑞科技发展有限公司\n","venType":null},{"venCode":"340","venDesc":"FJYX-北京富江裕新医疗器械\n有限公司","venType":null},{"venCode":"341","venDesc":"HKYL-北京华康永联医疗器械有限公司\n","venType":null},{"venCode":"342","venDesc":"HRSJ-北京华瑞世纪科技有限公司\n","venType":null},{"venCode":"343","venDesc":"HTZC-北京华泰志诚科技发展有限公司\n","venType":null},{"venCode":"344","venDesc":"HXZH-北京华旭众和科贸有限公司\n","venType":null},{"venCode":"345","venDesc":"HEL-北京慧而朗商贸有限公司\n","venType":null},{"venCode":"346","venDesc":"JYJM-北京嘉洋经贸有限公司\n","venType":null},{"venCode":"347","venDesc":"JDXQ-北京京大西秦医疗仪器有限公司\n","venType":null},{"venCode":"348","venDesc":"JF-北京健峰生物技术有限公司\n","venType":null},{"venCode":"349","venDesc":"JKGJ-北京健康广济医用品有限公司\n","venType":null},{"venCode":"350","venDesc":"JDYR-北京金迪盈润医疗器械有限公司\n","venType":null},{"venCode":"351","venDesc":"KHY-北京康晖煜科技有限公司\n","venType":null},{"venCode":"352","venDesc":"KYD-北京康月达科技有限公司\n","venType":null},{"venCode":"353","venDesc":"LB-北京莱帮生物技术有限公司\n","venType":null},{"venCode":"354","venDesc":"LY-北京兰野医学科技中心\n","venType":null},{"venCode":"355","venDesc":"LP-北京蓝牌医疗器械有限公司\n","venType":null},{"venCode":"356","venDesc":"LJJD-北京朗健嘉德科贸有限公司\n","venType":null},{"venCode":"357","venDesc":"LS-北京朗申科技有限公司\n","venType":null},{"venCode":"358","venDesc":"LW-北京利文商贸有限公司\n","venType":null},{"venCode":"359","venDesc":"LSSC-北京龙胜世创科贸有限公司\n","venType":null},{"venCode":"360","venDesc":"MKT-北京玛珂特医疗设备销售有限公司\n","venType":null},{"venCode":"361","venDesc":"MDWE-北京迈迪维尔医疗器械有限公司\n","venType":null},{"venCode":"362","venDesc":"MDJC-北京麦迪锦诚医疗器械有限责任公司\n","venType":null},{"venCode":"363","venDesc":"MDXT-北京美迪信泰商贸有限公司\n","venType":null},{"venCode":"364","venDesc":"MGYK-北京美高牙科医疗器材有限责任公司\n","venType":null},{"venCode":"365","venDesc":"MKBT-北京美康百泰医药科技有限公司\n","venType":null},{"venCode":"366","venDesc":"OM-北京欧蒙生物\n技术有限公司","venType":null},{"venCode":"367","venDesc":"PHYT-北京市普华永泰科技发展有限责任公司\n","venType":null},{"venCode":"368","venDesc":"PLW-北京普力文科贸有限公司\n","venType":null},{"venCode":"369","venDesc":"QLJ-北京千里及科贸有限责任公司\n","venType":null},{"venCode":"370","venDesc":"QCKJ-北京勤诚科技发展中心\n","venType":null},{"venCode":"371","venDesc":"QG-北京勤耕医疗器械有限公司\n","venType":null},{"venCode":"372","venDesc":"QHX-北京泉晖新商贸有限公司\n","venType":null},{"venCode":"373","venDesc":"QHHY-北京泉辉和奕医疗器械有限公司\n","venType":null},{"venCode":"374","venDesc":"RF-北京燃烽医药有限责任公司\n","venType":null},{"venCode":"375","venDesc":"RHKS-北京仁合康盛医疗用品有限公司\n","venType":null},{"venCode":"376","venDesc":"RKMD-北京锐康麦德科技有限公司\n","venType":null},{"venCode":"377","venDesc":"RJS-北京瑞金斯科技有限公司\n","venType":null},{"venCode":"378","venDesc":"RMSM-北京瑞迈商贸中心\n","venType":null},{"venCode":"379","venDesc":"SZHY-北京神州宏宇科技\n有限公司","venType":null},{"venCode":"380","venDesc":"SAK-北京晟安康医疗器械中心\n","venType":null},{"venCode":"381","venDesc":"SXY-北京盛翔远科贸有限公司\n","venType":null},{"venCode":"382","venDesc":"SJCK-北京世纪长科商贸有限公司\n","venType":null},{"venCode":"383","venDesc":"SJXS-北京世纪兴盛科技有限公司\n","venType":null},{"venCode":"384","venDesc":"KHYL-北京市科护医疗器材有限公司\n","venType":null},{"venCode":"385","venDesc":"LY-北京市六一仪器厂\n","venType":null},{"venCode":"386","venDesc":"MY-北京市密云县益康卫生材料厂\n","venType":null},{"venCode":"387","venDesc":"PC-北京市普慈医疗技术有限公司\n","venType":null},{"venCode":"389","venDesc":"SCX-北京市思创新医疗用品有限责任公司\n","venType":null},{"venCode":"390","venDesc":"THKJ-北京市潭河科技开发中心\n","venType":null},{"venCode":"391","venDesc":"TST-北京泰士特商贸有限公司\n","venType":null},{"venCode":"392","venDesc":"TZSW-北京探针生物技术有限公司\n","venType":null},{"venCode":"393","venDesc":"TSHC-北京天时恒创科技发展有限公司\n","venType":null},{"venCode":"395","venDesc":"TYKD-北京天缘康达医用仪器\n","venType":null},{"venCode":"396","venDesc":"WTK-北京威泰科生物技术有限公司\n","venType":null},{"venCode":"397","venDesc":"XQD-北京先起迪科技发展有限公司\n","venType":null},{"venCode":"398","venDesc":"XSKJ-北京向上科技发展有限责任公司\n","venType":null},{"venCode":"399","venDesc":"XSX-北京协顺祥医疗科技有限公司\n","venType":null},{"venCode":"400","venDesc":"XDJC-北京新达精诚科贸有限公司\n","venType":null},{"venCode":"401","venDesc":"XLF-北京欣隆福医药销售有限公司\n","venType":null},{"venCode":"402","venDesc":"XNHH-北京鑫诺汇亨科技发展\n有限公司","venType":null},{"venCode":"403","venDesc":"XRX-北京鑫瑞祥商贸有限责任公司\n","venType":null},{"venCode":"404","venDesc":"YAT-北京宜安泰医疗技术开发有限公司\n","venType":null},{"venCode":"405","venDesc":"YSLX-北京英硕力新柏科技有限公司\n","venType":null},{"venCode":"406","venDesc":"YLJX-北京益利精细化学品\n有限公司","venType":null},{"venCode":"407","venDesc":"YYBL-北京元业伯乐科技\n发展有限公司","venType":null},{"venCode":"408","venDesc":"YPH-北京原平皓生物技术有限公司\n","venType":null},{"venCode":"409","venDesc":"ZPKJ-北京泽平科技有限责任公司\n","venType":null},{"venCode":"410","venDesc":"ZXYG-北京执信阳光医疗科技有限公司\n","venType":null},{"venCode":"411","venDesc":"ZRKJ-北京志荣科技发展有限公司\n","venType":null},{"venCode":"412","venDesc":"LDM-北京中德利德曼科技有限公司\n","venType":null},{"venCode":"413","venDesc":"ZKZX-北京中科执信医疗设备有限公司\n","venType":null},{"venCode":"414","venDesc":"ZTCY-北京中天成业生物技术有限公司\n","venType":null},{"venCode":"415","venDesc":"ZTSH-北京中天四海商贸有限公司\n","venType":null},{"venCode":"416","venDesc":"ZWMK-北京中卫美康科技有限公司\n","venType":null},{"venCode":"417","venDesc":"ZHXT-北京钟汉鑫泰科技发展\n","venType":null},{"venCode":"418","venDesc":"ZTHF-北京周天华枫医疗仪器有限公司\n","venType":null},{"venCode":"419","venDesc":"BK-波科国际\n医疗贸易(上海)有限公司","venType":null},{"venCode":"420","venDesc":"DFLG-东方莱格医药科技(北京)有限公司\n","venType":null},{"venCode":"421","venDesc":"GYJT-国药集团北京医疗器械有限公司\n","venType":null},{"venCode":"422","venDesc":"NJLS-南京郎森\n","venType":null},{"venCode":"423","venDesc":"NJWC-南京微创\n","venType":null},{"venCode":"424","venDesc":"PDH-北京普德鸿医学技术有限公司\n","venType":null},{"venCode":"425","venDesc":"SDWG-山东威高集团北京销售分公司","venType":null},{"venCode":"426","venDesc":"SHKH-上海科华生物工程股份有限公司\n","venType":null},{"venCode":"427","venDesc":"TJHNH-天津哈娜好医材有限公司\n","venType":null},{"venCode":"428","venDesc":"WHPM-万华普曼生物工程有限公司\n","venType":null},{"venCode":"429","venDesc":"ZJGD-浙江拱东\n医用塑料厂北京办事处","venType":null},{"venCode":"430","venDesc":"ZHHJ-珠海和佳医疗设备股份有限公司\n","venType":null},{"venCode":"431","venDesc":"GZBJSZ-北京顺展天拓科技有限公司","venType":null},{"venCode":"432","venDesc":"GZHMST-霍姆斯特（北京）环境科技有限公司","venType":null},{"venCode":"433","venDesc":"GZBJHY-北京湖源兴科贸有限公司","venType":null},{"venCode":"434","venDesc":"CJRD-北京创捷锐达科贸中心","venType":null},{"venCode":"435","venDesc":"GZQQSYL-北京千千树医疗设备有限公司","venType":null},{"venCode":"436","venDesc":"MZXYF-门诊西药房","venType":null},{"venCode":"437","venDesc":"PFXBMZYF-皮肤性病门诊药房","venType":null},{"venCode":"438","venDesc":"GZBJYHHX-北京永和恒信科技发展有限公司","venType":null},{"venCode":"439","venDesc":"BJDTYY-北京地坛医院","venType":null},{"venCode":"440","venDesc":"ZXYF-中心药房","venType":null},{"venCode":"441","venDesc":"MZZYF-门诊中药房","venType":null},{"venCode":"442","venDesc":"JMPYZX-静脉配液中心","venType":null},{"venCode":"444","venDesc":"DWSJ-北京大卫世纪生物技术开发有限公司\n","venType":null},{"venCode":"445","venDesc":"dtyy-地坛医院老院库存","venType":null},{"venCode":"446","venDesc":"北京市富平和文化用品经营部","venType":null},{"venCode":"447","venDesc":"BJYT-北京永拓动力科技发展有限公司","venType":null},{"venCode":"448","venDesc":"deb-北京得尔贝经贸有限公司","venType":null},{"venCode":"449","venDesc":"ycsd-北京永昌盛达科技有限公司","venType":null},{"venCode":"450","venDesc":"hxy-北京市华信医疗电子设备公司","venType":null},{"venCode":"451","venDesc":"dqsd-北京德勤时代生物科技有限公司","venType":null},{"venCode":"452","venDesc":"bljh-北京百利嘉华商贸有限公司","venType":null},{"venCode":"453","venDesc":"dbzy-东北制药总厂","venType":null},{"venCode":"454","venDesc":"shdsn-上海迪赛诺生物医药有限公司","venType":null},{"venCode":"455","venDesc":"HSSJ-北京华顺世纪科技有限公司","venType":null},{"venCode":"456","venDesc":"bjdxdlyy-北京大学第六医院","venType":null},{"venCode":"457","venDesc":"htzy-北京华天泽宇医疗器械有限公司","venType":null},{"venCode":"458","venDesc":"kly-北京科利亚生物技术有限公司","venType":null},{"venCode":"459","venDesc":"layx-北京龙安医学技术开发公司","venType":null},{"venCode":"460","venDesc":"JCTW-北京京朝腾微医学科技有限公司","venType":null},{"venCode":"461","venDesc":"DSK-北京德善康科技有限公司","venType":null},{"venCode":"462","venDesc":"xctz-北京信诚拓展医疗器械有限公司","venType":null},{"venCode":"463","venDesc":"LSL-北京来时路医用材料有限责任公司","venType":null},{"venCode":"464","venDesc":"RSB-北京容圣博投资顾问有限公司","venType":null},{"venCode":"465","venDesc":"BSCX-百事创新(北京)科技有限公司","venType":null},{"venCode":"466","venDesc":"bjla-北京龙安医学技术开发公司","venType":null},{"venCode":"467","venDesc":"LHTX-北京利华同兴科贸中心","venType":null},{"venCode":"468","venDesc":"KYDC-北京开元达成科技中心","venType":null},{"venCode":"469","venDesc":"LYY-北京鹭羿岩医药科技有限公司","venType":null},{"venCode":"470","venDesc":"KNSD-北京科诺时代科技有限公司","venType":null},{"venCode":"471","venDesc":"HYKY-北京海盈凯悦科技有限责任公司","venType":null},{"venCode":"472","venDesc":"YFC-北京益福昌医疗设备有限责任公司","venType":null},{"venCode":"473","venDesc":"SMH-北京施迈惠商贸有限公司","venType":null},{"venCode":"474","venDesc":"JMWSD-北京京门威士达医疗器械有限公司","venType":null},{"venCode":"475","venDesc":"bjxhx-北京市鑫河旭印刷厂","venType":null},{"venCode":"476","venDesc":"SSXY-北京盛世兴业科技开发有限公司","venType":null},{"venCode":"477","venDesc":"bjrfl-北京日枫霖工装设计制作有限责任公司","venType":null},{"venCode":"478","venDesc":"bjfhx-北京丰红兴纺织品有限公司","venType":null},{"venCode":"479","venDesc":"tzxb-北京市通州鑫宝卫生材料厂","venType":null},{"venCode":"480","venDesc":"jway-北京市京卫安宜技术发展有限公司","venType":null},{"venCode":"481","venDesc":"dfyq-北京东方医用气体有限公司","venType":null},{"venCode":"482","venDesc":"BJKCL-北京康齿乐医学科技有限公司","venType":null},{"venCode":"483","venDesc":"MDKT-北京麦迪科特医疗器械有限责任公司","venType":null},{"venCode":"484","venDesc":"LJC-北京利嘉诚医药科技有限公司","venType":null},{"venCode":"485","venDesc":"lykc-老院库存","venType":null},{"venCode":"486","venDesc":"GJKJ-北京光健科技发展有限公司","venType":null},{"venCode":"487","venDesc":"slhm-北京双利华茂工贸有限公司","venType":null},{"venCode":"488","venDesc":"ysyj-北京一商宇洁商贸有限公司","venType":null},{"venCode":"489","venDesc":"ryx-北京仁宇鑫工贸有限公司","venType":null},{"venCode":"490","venDesc":"HKMD-北京惠康美达科技有限公司","venType":null},{"venCode":"491","venDesc":"RFKJ-北京日枫科技有限公司","venType":null},{"venCode":"492","venDesc":"DFRA-北京东方瑞澳医疗设备有限公司","venType":null},{"venCode":"493","venDesc":"FZMX-福州迈新生物技术开发有限公司","venType":null},{"venCode":"494","venDesc":"ZSJQ-北京中杉金桥生物技术有限公司","venType":null},{"venCode":"495","venDesc":"JDLH-北京健德联合口腔医疗设备有限公司","venType":null},{"venCode":"496","venDesc":"SM-北京圣曼医疗器材技术有限公司","venType":null},{"venCode":"497","venDesc":"HSK-北京合盛康科贸有限公司","venType":null},{"venCode":"498","venDesc":"XTKQ-北京先通康桥医药科技有限公司\n","venType":null},{"venCode":"499","venDesc":"jyjl-北京市京盐金龙副食经营部","venType":null},{"venCode":"500","venDesc":"xhx-北京市鑫河旭印刷厂","venType":null},{"venCode":"501","venDesc":"zzhy-北京周庄弘燕农副产品市场中心","venType":null},{"venCode":"502","venDesc":"jyjl-北京市京盐金龙副食经营部","venType":null},{"venCode":"503","venDesc":"hlh-北京市恒利和阀门五金销售部","venType":null},{"venCode":"504","venDesc":"xrgg-北京新锐广告制作有限公司","venType":null},{"venCode":"505","venDesc":"cszj-北京城市之洁环卫服务中心","venType":null},{"venCode":"506","venDesc":"rfl-北京日枫霖工装设计制作有限责任公司","venType":null},{"venCode":"507","venDesc":"SHCD-上海长岛抗体诊断试剂有限公司","venType":null},{"venCode":"508","venDesc":"pay-北京平安银科技发展有限公司","venType":null},{"venCode":"509","venDesc":"WSBL-北京旺市百利商业有限公司飘亮购物中心","venType":null},{"venCode":"510","venDesc":"HXSJ-国药集团化学试剂北京有限公司","venType":null},{"venCode":"511","venDesc":"BBKY-北京北博科仪商贸有限公司","venType":null},{"venCode":"512","venDesc":"XMR-北京欣明仁医疗器械技术有限公司","venType":null},{"venCode":"513","venDesc":"ZZFM-涿州福美神盾生物科技有限公司","venType":null},{"venCode":"514","venDesc":"KDW-北京康德威医疗设备有限公司","venType":null},{"venCode":"515","venDesc":"XHT-北京鑫宏涛五金建材商店","venType":null},{"venCode":"516","venDesc":"CYJLF-北京创益佳家乐福商业有限公司","venType":null},{"venCode":"517","venDesc":"zyxd-北京振宇先达科技有限公司","venType":null},{"venCode":"518","venDesc":"mty-北京市石景山名特优食品公司","venType":null},{"venCode":"519","venDesc":"jxwj-北京市金鑫五金建材商店","venType":null},{"venCode":"520","venDesc":"xhys-香河永胜综合加工厂","venType":null},{"venCode":"521","venDesc":"rskj-北京荣盛康洁日用化学品有限公司","venType":null},{"venCode":"522","venDesc":"dfsz-北京东方盛泽东郊农副产品批发市场有限公司","venType":null},{"venCode":"523","venDesc":"XSH-北京鑫四环消毒技术开发中心","venType":null},{"venCode":"524","venDesc":"SLB-北京索莱宝科技有限公司","venType":null},{"venCode":"525","venDesc":"rthdq-北京瑞天鸿电气有限公司","venType":null},{"venCode":"526","venDesc":"zgjk-中国疾病预防控制中心全球基金采购部","venType":null},{"venCode":"527","venDesc":"RH-北京若华医疗器械有限公司","venType":null},{"venCode":"528","venDesc":"LKSD-北京朗昆时代科技发展有限公司","venType":null},{"venCode":"529","venDesc":"BHTD-北京博汇天地科技有限公司","venType":null},{"venCode":"530","venDesc":"DH-北京东华合创数码科技股份有限公司","venType":null},{"venCode":"531","venDesc":"czj-北京市财政局","venType":null},{"venCode":"532","venDesc":"ymcx-北京悦美诚信日化经营部","venType":null},{"venCode":"533","venDesc":"rlc-北京瑞龙春生物科技有限公司","venType":null},{"venCode":"534","venDesc":"jlf-北京家乐福商业有限公司双井店","venType":null},{"venCode":"535","venDesc":"smfz-北京顺美服装股份有限公司","venType":null},{"venCode":"536","venDesc":"gyjt-国药集团医药物流有限公司","venType":null},{"venCode":"537","venDesc":"wkt-北京市威卡通服装厂","venType":null},{"venCode":"538","venDesc":"aly-北京奥乐宇办公用品商店","venType":null},{"venCode":"539","venDesc":"blg-北京市安定门宝兰阁文化用品商店","venType":null},{"venCode":"540","venDesc":"TJYR-天津市一瑞生物工程有限公司","venType":null},{"venCode":"541","venDesc":"hmst-霍姆斯特(北京)环境科技有限公司","venType":null},{"venCode":"542","venDesc":"zshy-北京中盛茂源科技发展有限公司","venType":null},{"venCode":"543","venDesc":"jgmj-北京京冠毛巾有限责任公司","venType":null},{"venCode":"544","venDesc":"ycf-北京英才发文化用品经销部","venType":null},{"venCode":"545","venDesc":"RTLC-北京瑞泰林川商贸有限公司","venType":null},{"venCode":"546","venDesc":"STB-史泰博商贸有限公司北京分公司","venType":null},{"venCode":"547","venDesc":"ZWHR-北京中卫惠瑞医疗器械有限责任公司","venType":null},{"venCode":"548","venDesc":"ZZJJ-北京住总家具市场有限公司","venType":null},{"venCode":"549","venDesc":"TCHY-北京天成恒业科贸有限公司","venType":null},{"venCode":"550","venDesc":"layx-北京龙安医学技术开发公司","venType":null},{"venCode":"551","venDesc":"SHRK-上海日科贸易有限公司","venType":null},{"venCode":"552","venDesc":"sygc-唐山市开平区顺如骨质瓷销售部","venType":null},{"venCode":"553","venDesc":"CAT-北京诚安堂药房有限公司\n","venType":null},{"venCode":"554","venDesc":"JAGK-北京洁安高科医疗器材有限公司","venType":null},{"venCode":"555","venDesc":"YBJY-北京友邦基业科贸有限责任公司","venType":null},{"venCode":"556","venDesc":"trjc-北京天润佳创经贸有限公司","venType":null},{"venCode":"557","venDesc":"sjdbh-北京世纪丹陛华综合市场有限公司","venType":null},{"venCode":"558","venDesc":"qpg-北京青苹果红苹果生殖健康产品科技开发中心","venType":null},{"venCode":"559","venDesc":"tjxsm-北京通嘉兴商贸有限公司","venType":null},{"venCode":"560","venDesc":"jxdd-北京锦绣大地农副食产品批发市场有限责任公司","venType":null},{"venCode":"561","venDesc":"xcwy-北京行程伟业商贸有限公司","venType":null},{"venCode":"562","venDesc":"hrmj-北京翰荣名家画坊有限公司","venType":null},{"venCode":"563","venDesc":"jllfby-北京金龙联发布艺经营中心","venType":null},{"venCode":"564","venDesc":"cygs-北京市朝阳区国家税务局","venType":null},{"venCode":"565","venDesc":"jpwj-北京市金鹏五金建材商贸中心","venType":null},{"venCode":"566","venDesc":"sysc-北京三友商场有限责任公司","venType":null},{"venCode":"567","venDesc":"HBK-北京化玻科仪器有限责任公司","venType":null},{"venCode":"568","venDesc":"bjxwj-北京兴望金建材商城有限公司","venType":null},{"venCode":"569","venDesc":"htsm-北京市华特商贸公司","venType":null},{"venCode":"570","venDesc":"KSDR-北京康思达睿科贸有限公司","venType":null},{"venCode":"571","venDesc":"BTCY-北京博天诚业科技有限公司","venType":null},{"venCode":"572","venDesc":"jlf-北京家乐福商业有限公司通州店","venType":null},{"venCode":"573","venDesc":"hzsc-北京杭州丝绸城市场有限公司","venType":null},{"venCode":"574","venDesc":"thfz-北京天海服装批发市场","venType":null},{"venCode":"575","venDesc":"hlhfm-北京市恒利和阀门五金销售部","venType":null},{"venCode":"576","venDesc":"htfz-北京海天服装批发市场有限公司","venType":null},{"venCode":"577","venDesc":"shsc-北京苏杭丝绸城市场有限公司","venType":null},{"venCode":"578","venDesc":"LZYX-北京丽珠医学技术有限公司","venType":null},{"venCode":"579","venDesc":"BFYT-北京北方仪涛商贸有限公司","venType":null},{"venCode":"580","venDesc":"jkl-北京京客隆商业集团股份有限公司回龙观店","venType":null},{"venCode":"581","venDesc":"lgs-蓝格赛-海龙兴电器设备商业有限公司","venType":null},{"venCode":"582","venDesc":"JDMY-洁定贸易(上海)有限公司","venType":null},{"venCode":"583","venDesc":"ylfbg-北京银联丰办公设备销售中心","venType":null},{"venCode":"584","venDesc":"qfkj-北京泉发科技发展有限责任公司","venType":null},{"venCode":"585","venDesc":"ztgh-北京中通国洪商贸有限公司","venType":null},{"venCode":"586","venDesc":"hpl-北京市和平里医院","venType":null},{"venCode":"587","venDesc":"yhbxg-深圳市耀华不锈钢厨具有限公司","venType":null},{"venCode":"588","venDesc":"jwyl-北京京卫医疗用品公司","venType":null},{"venCode":"589","venDesc":"YACX-北京亚奥春晓商贸中心","venType":null},{"venCode":"590","venDesc":"LPSW-北京绿平生物技术开发有限公司","venType":null},{"venCode":"591","venDesc":"LP-乐普(北京)医疗器械股份有限公司","venType":null},{"venCode":"592","venDesc":"hd-北京衡达技术服务中心","venType":null},{"venCode":"593","venDesc":"ktyl-北京康拓医疗仪器有限公司","venType":null},{"venCode":"594","venDesc":"sajj-浙江圣奥家具制造有限公司","venType":null},{"venCode":"595","venDesc":"ztfd-北京志腾飞达科技有限公司","venType":null},{"venCode":"596","venDesc":"gjzb-中技国际招标公司","venType":null},{"venCode":"597","venDesc":"NLT-北京诺立特科技开发有限公司","venType":null},{"venCode":"598","venDesc":"SHMT-上海美太医疗设备有限公司","venType":null},{"venCode":"599","venDesc":"RYX- 北京荣亦兴经贸公司","venType":null},{"venCode":"600","venDesc":"JRT-北京京瑞天之威医疗器械销售中心","venType":null},{"venCode":"601","venDesc":"xxlwj-北京市旭鑫隆五金机电经营部","venType":null},{"venCode":"602","venDesc":"clxx-北京朝龙新兴五金交电市场有限公司","venType":null},{"venCode":"603","venDesc":"dfom-北京东方欧美华工业装备有限公司","venType":null},{"venCode":"604","venDesc":"tdwuj-北京腾达五金建材有限公司","venType":null},{"venCode":"605","venDesc":"jssdwj-北京市京顺盛达五金机电商店","venType":null},{"venCode":"606","venDesc":"xssy-北京市兴胜山鹰线缆有限公司","venType":null},{"venCode":"607","venDesc":"dfyh-北京东方耀华厨房设备有限公司","venType":null},{"venCode":"608","venDesc":"yfa-北京永福安消防器材销售中心","venType":null},{"venCode":"609","venDesc":"bjdxdyyy-北京大学第一医院","venType":null},{"venCode":"610","venDesc":"ysec-北京印刷集团有限责任公司印刷二厂","venType":null},{"venCode":"611","venDesc":"ykd-北京益康德医疗器械有限公司","venType":null},{"venCode":"612","venDesc":"dhhc-北京东华合创数码科技股份有限公司","venType":null},{"venCode":"613","venDesc":"HFD-北京恒丰达医疗器械有限责任公司","venType":null},{"venCode":"614","venDesc":"prbk-普瑞博科（北京）科贸有限公司","venType":null},{"venCode":"615","venDesc":"ltsk-北京龙腾书刊发行公司","venType":null},{"venCode":"616","venDesc":"slp-北京森雷普实验室设备有限公司","venType":null},{"venCode":"617","venDesc":"ZGYY-中国医药对外贸易公司","venType":null},{"venCode":"618","venDesc":"QHZH-北京泉辉泽惠医疗设备有限公司","venType":null},{"venCode":"619","venDesc":"ZGKX-中国科学器材进出口总公司","venType":null},{"venCode":"620","venDesc":"ysgf-北京市永顺广发建材商店","venType":null},{"venCode":"621","venDesc":"jty-北京金太阳商贸有限公司","venType":null},{"venCode":"622","venDesc":"ZHKX-北京正瀚科学仪器有限公司","venType":null},{"venCode":"623","venDesc":"jhl-北京久恒隆仪表技术开发有限责任公司","venType":null},{"venCode":"624","venDesc":"zdxf-北京中电兴发科技有限公司","venType":null},{"venCode":"625","venDesc":"mchl-北京美承互联数码科技发展有限公司","venType":null},{"venCode":"626","venDesc":"zgwt-中国网通（集团）有限公司北京分公司","venType":null},{"venCode":"627","venDesc":"sat-北京思奥特科技发展有限公司","venType":null},{"venCode":"628","venDesc":"XBGR-北京星标格瑞生物技术发展有限公司","venType":null},{"venCode":"629","venDesc":"SHTD-上海泰德医疗器械有限公司","venType":null},{"venCode":"630","venDesc":"DHJC-北京道合憬诚医疗器械有限公司","venType":null},{"venCode":"631","venDesc":"YTH-北京悦泰行科技发展有限公司","venType":null},{"venCode":"632","venDesc":"XHHT-北京信弘汇天医疗技术开发有限公司","venType":null},{"venCode":"633","venDesc":"lytg-北京绿氧天罡科技开发有限公司","venType":null},{"venCode":"634","venDesc":"shsl-上海三菱电梯有限公司","venType":null},{"venCode":"635","venDesc":"HNS-北京昊诺斯科技有限公司","venType":null},{"venCode":"636","venDesc":"slx-北京圣兰心服装服饰有限责任公司","venType":null},{"venCode":"637","venDesc":"yymy-北京誉远名扬窗饰用品有限公司","venType":null},{"venCode":"638","venDesc":"ssfz-北京绅士服装服饰有限公司","venType":null},{"venCode":"639","venDesc":"JQJJ-北京鉴清洁净科技有限责任公司","venType":null},{"venCode":"640","venDesc":"fxwj-北京市福兴五金建材经营部","venType":null},{"venCode":"641","venDesc":"jgyd-北京旧宫园鼎机械维修部","venType":null},{"venCode":"642","venDesc":"BTRC-北京比特瑞创科技有限公司","venType":null},{"venCode":"643","venDesc":"etyy-首都医科大学附属北京儿童医院","venType":null},{"venCode":"644","venDesc":"cycdc-北京市朝阳区疾病预防控制中心","venType":null},{"venCode":"645","venDesc":"dfswj-北京市地方税务局","venType":null},{"venCode":"646","venDesc":"HYY-北京宏医耀科技发展有限公司","venType":null},{"venCode":"647","venDesc":"xylp-北京心悦良品科技有限公司","venType":null},{"venCode":"648","venDesc":"xjf-北京市鑫聚发建材商店","venType":null},{"venCode":"649","venDesc":"bjscyfe-北京市朝阳区妇儿医院","venType":null},{"venCode":"650","venDesc":"GDLZ-北京光电联众医疗器械有限公司","venType":null},{"venCode":"651","venDesc":"dwzz-单位自制","venType":null},{"venCode":"652","venDesc":"上海供应商001","venType":null},{"venCode":"653","venDesc":"北京知春路供应商","venType":null},{"venCode":"654","venDesc":"测试供应商","venType":null},{"venCode":"655","venDesc":"测试供应商2","venType":null},{"venCode":"656","venDesc":"阿奇霉素供应商","venType":null},{"venCode":"657","venDesc":"阿莫西林供应商","venType":null},{"venCode":"658","venDesc":"zl测试001","venType":null},{"venCode":"659","venDesc":"zl测试002","venType":null},{"venCode":"660","venDesc":"zh1供应商","venType":null},{"venCode":"661","venDesc":"zh2","venType":null},{"venCode":"662","venDesc":"zh2供应商","venType":null},{"venCode":"663","venDesc":"zh4","venType":null},{"venCode":"664","venDesc":"zh5","venType":null},{"venCode":"665","venDesc":"a","venType":null},{"venCode":"666","venDesc":"as","venType":null},{"venCode":"667","venDesc":"泰安","venType":null},{"venCode":"668","venDesc":"北京","venType":null},{"venCode":"669","venDesc":"测试1","venType":null},{"venCode":"670","venDesc":"测试2","venType":null},{"venCode":"671","venDesc":"测试3","venType":null},{"venCode":"672","venDesc":"测试4","venType":null},{"venCode":"673","venDesc":"测试5","venType":null},{"venCode":"674","venDesc":"测试6","venType":null},{"venCode":"675","venDesc":"测试7","venType":null},{"venCode":"676","venDesc":"测试8","venType":null},{"venCode":"677","venDesc":"测试9","venType":null},{"venCode":"678","venDesc":"BJZY-北京制药","venType":null},{"venCode":"679","venDesc":"上海供应商","venType":null},{"venCode":"680","venDesc":"TADHRJ-泰安东华软件","venType":null},{"venCode":"681","venDesc":"北京东华软件供应商","venType":null},{"venCode":"682","venDesc":"东华软件股份公司","venType":null},{"venCode":"683","venDesc":"KPJT-鲲鹏集团","venType":null},{"venCode":"684","venDesc":"HFH-火凤凰","venType":null},{"venCode":"704","venDesc":"BJCSGYS1-北京测试供应商","venType":null},{"venCode":"705","venDesc":"BJCSGYS2-北京测试供应商","venType":null},{"venCode":"707","venDesc":"zl测试003","venType":null},{"venCode":"708","venDesc":"zl测试004","venType":null},{"venCode":"709","venDesc":"zl测试005","venType":null},{"venCode":"710","venDesc":"zl测试006","venType":null},{"venCode":"711","venDesc":"zl测试007","venType":null},{"venCode":"712","venDesc":"zl测试008","venType":null},{"venCode":"713","venDesc":"zl测试009","venType":null},{"venCode":"714","venDesc":"zl测试010","venType":null},{"venCode":"715","venDesc":"zh测试11","venType":null},{"venCode":"716","venDesc":"供应商","venType":null},{"venCode":"717","venDesc":"测试10","venType":null},{"venCode":"718","venDesc":"供应商111","venType":null},{"venCode":"719","venDesc":"供应商","venType":null},{"venCode":"720","venDesc":"zl供应商","venType":null},{"venCode":"721","venDesc":"藏剑山庄供应商","venType":null}]}', 'success');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('4028b7c64c78d943014c78e003c50000', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-04-02 14:44:31:018000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his科室信息列表', null, null, null, null, 'org.apache.cxf.service.factory.ServiceConstructionException: Failed to create service.');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('ff8080814c5f87a1014c5f8cad4a0006', '67', 'webservice', TO_TIMESTAMP(' 2015-03-28 16:43:17:193000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '127.0.0.1', '护士确认收货调用his接口', null, null, null, 'null', '{"resultCode":"-1","resultContent":null}');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('ff8080814c5f87a1014c5f8e64e50007', '1', 'webservice', TO_TIMESTAMP(' 2015-03-28 16:45:09:732000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '127.0.0.1', '护士确认收货调用his接口', null, null, null, 'null', '{"resultCode":"-1","resultContent":null}');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('ff8080814c5f87a1014c5f8ed7f20009', '1', 'webservice', TO_TIMESTAMP(' 2015-03-28 16:45:39:186000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '127.0.0.1', '护士确认收货调用his接口', null, null, null, 'null', '{"resultCode":"-1","resultContent":null}');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('ff8080814c5f87a1014c5f8f85b3000a', '1', 'webservice', TO_TIMESTAMP(' 2015-03-28 16:46:23:667000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '127.0.0.1', '护士确认收货调用his接口', null, null, null, 'null', '{"resultCode":"-1","resultContent":"<ILLEGAL VALUE>zSaveInfoItm+6^web.DHCST.INPOImport.1<BR>null"}');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('ff8080814c5f87a1014c5f902132000b', '67', 'webservice', TO_TIMESTAMP(' 2015-03-28 16:47:03:473000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '127.0.0.1', '护士确认收货调用his接口', null, null, null, 'null', '{"resultCode":"-1","resultContent":"<ILLEGAL VALUE>zSaveInfoItm+6^web.DHCST.INPOImport.1<BR>null"}');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('ff8080814c5f87a1014c5f916e35000c', '67', 'webservice', TO_TIMESTAMP(' 2015-03-28 16:48:28:724000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '127.0.0.1', '护士确认收货调用his接口', null, null, null, 'null', '{"resultCode":"-1","resultContent":"<ILLEGAL VALUE>zSaveInfoItm+6^web.DHCST.INPOImport.1<BR>null"}');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('ff8080814c5f87a1014c5f9be3450010', '67', 'webservice', TO_TIMESTAMP(' 2015-03-28 16:59:54:052000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '127.0.0.1', '护士确认收货调用his接口', null, null, null, 'null', '{"resultCode":"-1","resultContent":"<BR>null"}');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('ff8080814c5f87a1014c5f9cf0440011', '67', 'webservice', TO_TIMESTAMP(' 2015-03-28 17:01:02:915000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '127.0.0.1', '护士确认收货调用his接口', null, null, null, 'null', '{"resultCode":"-1","resultContent":"<BR>null"}');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('ff8080814c5f87a1014c5f9e9c680012', '67', 'webservice', TO_TIMESTAMP(' 2015-03-28 17:02:52:520000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '127.0.0.1', '护士确认收货调用his接口', null, null, null, 'null', '{"resultCode":"-1","resultContent":"<BR>null"}');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('ff8080814c5f87a1014c5f9fbf3f0013', '67', 'webservice', TO_TIMESTAMP(' 2015-03-28 17:04:06:974000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '127.0.0.1', '护士确认收货调用his接口', null, null, null, 'null', '{"resultCode":"1","resultContent":""}');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('4028b7c64c92a72c014c92c95a170000', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-04-07 15:29:53:063000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his供应商信息列表', null, null, null, null, 'org.apache.cxf.service.factory.ServiceConstructionException: Failed to create service.');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('4028b7c64c79053f014c79098d0d0000', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-04-02 15:29:53:016000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his供应商信息列表', null, null, null, null, 'org.apache.cxf.service.factory.ServiceConstructionException: Failed to create service.');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('402882e64c8c36e4014c8d797e8a0000', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-04-06 14:44:31:226000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his科室信息列表', null, null, null, null, 'org.apache.cxf.service.factory.ServiceConstructionException: Failed to create service.');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('402882e64c8c36e4014c8da2fd950001', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-04-06 15:29:53:209000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his供应商信息列表', null, null, null, null, 'org.apache.cxf.service.factory.ServiceConstructionException: Failed to create service.');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('4028b7c64c929159014c929fcfdc0000', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-04-07 14:44:31:023000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his科室信息列表', null, null, null, null, 'org.apache.cxf.service.factory.ServiceConstructionException: Failed to create service.');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('4028b7c64c9cdc87014c9cec87e90000', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-04-09 14:44:31:029000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his科室信息列表', null, null, null, null, 'org.apache.cxf.service.factory.ServiceConstructionException: Failed to create service.');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('2c90573f4ca1f7f2014ca212e3b60000', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-04-10 14:44:31:021000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his科室信息列表', null, null, null, null, 'org.apache.cxf.service.factory.ServiceConstructionException: Failed to create service.');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('8a8a0da94c6d4f7f014c6e934ef00000', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-03-31 14:44:31:112000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his科室信息列表', null, null, null, null, 'org.apache.cxf.service.factory.ServiceConstructionException: Failed to create service.');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('8a8a0da94c6eb86c014c6ebcd4990000', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-03-31 15:29:53:013000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his供应商信息列表', null, null, null, null, 'org.apache.cxf.service.factory.ServiceConstructionException: Failed to create service.');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('4028b7c64c975f8e014c97efb44d0001', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-04-08 15:29:53:053000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his供应商信息列表', null, null, null, null, 'org.apache.cxf.service.factory.ServiceConstructionException: Failed to create service.');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('402882e64cac4a94014cac5f9d200000', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-04-12 14:44:31:027000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his科室信息列表', null, null, null, null, 'org.apache.cxf.service.factory.ServiceConstructionException: Failed to create service.');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('402882e64cac4a94014cac89245b0001', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-04-12 15:29:53:052000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his供应商信息列表', null, null, null, null, 'org.apache.cxf.service.factory.ServiceConstructionException: Failed to create service.');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('ff8080814c68ae1c014c68b5531c0002', '67', 'webservice', TO_TIMESTAMP(' 2015-03-30 11:24:16:027000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '127.0.0.1', '护士确认收货调用his接口', null, null, null, 'null', '{"resultCode":"1","resultContent":""}');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('402882e44c827f7e014c832cbf020000', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-04-04 14:44:31:180000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his科室信息列表', null, null, null, null, 'org.apache.cxf.service.factory.ServiceConstructionException: Failed to create service.');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('402882e44c827f7e014c83564cdc0001', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-04-04 15:29:55:211000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his供应商信息列表', null, null, null, null, 'org.apache.cxf.service.factory.ServiceConstructionException: Failed to create service.');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('4028b7c64c975f8e014c97c62e060000', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-04-08 14:44:31:082000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his科室信息列表', null, null, null, null, 'org.apache.cxf.service.factory.ServiceConstructionException: Failed to create service.');
INSERT INTO "SCM"."T_SYS_LOG" VALUES ('297ebc044c5edb39014c5f49c20a0008', 'bjxh', 'webservice client', TO_TIMESTAMP(' 2015-03-28 15:29:53:125000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '同步his供应商信息列表', null, null, null, null, 'org.apache.cxf.service.factory.ServiceConstructionException: Failed to create service.');

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
INSERT INTO "SCM"."T_SYS_NORMAL_ACCOUNT" VALUES ('108', '1428805218351', 'nur222', '1', null, null, '1', null, TO_DATE('2015-04-12 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), null, null, null, '112');
INSERT INTO "SCM"."T_SYS_NORMAL_ACCOUNT" VALUES ('109', '1428805240732', 'nur333', '1', null, null, '1', null, TO_DATE('2015-04-12 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), null, null, null, '113');
INSERT INTO "SCM"."T_SYS_NORMAL_ACCOUNT" VALUES ('111', '1428846940972', 'nur666', '1', null, null, '2', null, TO_DATE('2015-04-12 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), null, null, null, '115');
INSERT INTO "SCM"."T_SYS_NORMAL_ACCOUNT" VALUES ('67', '1426477103174', 'nur123', '1', null, null, '1', null, TO_DATE('2015-03-16 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), null, '71');
INSERT INTO "SCM"."T_SYS_NORMAL_ACCOUNT" VALUES ('87', '1427366285115', 'dhccvendor', '1', null, null, '1', null, TO_DATE('2015-03-26 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), null, null, null, '91');
INSERT INTO "SCM"."T_SYS_NORMAL_ACCOUNT" VALUES ('88', '1427366358862', 'dhccnurse', '1', null, null, '1', null, TO_DATE('2015-03-26 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), null, null, null, '92');
INSERT INTO "SCM"."T_SYS_NORMAL_ACCOUNT" VALUES ('107', '1428667024823', 'nur555', '1', null, null, '2', null, TO_DATE('2015-04-10 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), null, '111');
INSERT INTO "SCM"."T_SYS_NORMAL_ACCOUNT" VALUES ('110', '1428816636895', 'nur444', '1', null, null, '1', null, TO_DATE('2015-04-12 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), null, '114');

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
INSERT INTO "SCM"."T_SYS_NORMAL_USER" VALUES ('15', '供应商甲', null, null, null, TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '13919007855', null, '2', '7121', null, TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1', null, null, null);
INSERT INTO "SCM"."T_SYS_NORMAL_USER" VALUES ('16', '药库甲', null, null, null, null, null, '908067886@qq.com', '1', null, '62', null, null, '1', null, null, null);
INSERT INTO "SCM"."T_SYS_NORMAL_USER" VALUES ('51', '王校长', null, null, null, null, null, null, '2', '5778', null, TO_DATE('2014-07-28 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), null, '1', null, null, null);
INSERT INTO "SCM"."T_SYS_NORMAL_USER" VALUES ('10', 'II', '1', null, null, TO_DATE('2013-04-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), null, null, '2', '6521', null, TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1', null, null, null);
INSERT INTO "SCM"."T_SYS_NORMAL_USER" VALUES ('31', null, null, null, null, null, null, 'zhouxin@dhcc.com.cn', '1', null, '66', TO_DATE('2014-06-25 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), null, '1', null, null, null);
INSERT INTO "SCM"."T_SYS_NORMAL_USER" VALUES ('52', null, null, null, null, TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), null, null, '2', '5783', null, TO_DATE('2014-07-29 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1', null, null, null);
INSERT INTO "SCM"."T_SYS_NORMAL_USER" VALUES ('112', 'nur2', null, null, null, null, null, null, '3', null, '164', TO_DATE('2015-04-12 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), null, '1', null, null, null);
INSERT INTO "SCM"."T_SYS_NORMAL_USER" VALUES ('113', 'nur333', null, null, null, null, null, null, '3', null, '165', TO_DATE('2015-04-12 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), null, '1', null, null, null);
INSERT INTO "SCM"."T_SYS_NORMAL_USER" VALUES ('115', null, null, null, null, null, null, null, '3', null, '162', TO_DATE('2015-04-12 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), null, '2', null, null, null);
INSERT INTO "SCM"."T_SYS_NORMAL_USER" VALUES ('71', '周医院123312312', '2', '汉', '兰州市七里河区', TO_DATE('1991-03-06 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '13456789876312321', '1234567@qq.com222', '3', null, '143', TO_DATE('2015-03-16 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1', '510333176509093333', null, null);
INSERT INTO "SCM"."T_SYS_NORMAL_USER" VALUES ('91', '王凯', '1', null, null, null, '13919871231', null, '2', '7142', null, TO_DATE('2015-03-26 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), null, '1', null, null, null);
INSERT INTO "SCM"."T_SYS_NORMAL_USER" VALUES ('92', '张东平11', null, null, null, null, '13919007855', null, '3', null, '142', TO_DATE('2015-03-26 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), null, '1', null, null, null);
INSERT INTO "SCM"."T_SYS_NORMAL_USER" VALUES ('111', null, null, null, null, TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), null, null, '3', null, '150', TO_DATE('2015-04-10 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '2', null, null, null);
INSERT INTO "SCM"."T_SYS_NORMAL_USER" VALUES ('114', null, null, null, null, TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), null, null, '3', null, '146', TO_DATE('2015-04-12 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('1970-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1', null, null, null);

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
INSERT INTO "SCM"."T_SYS_NORMALACCOUNT_ROLE" VALUES ('87', '47');
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
INSERT INTO "SCM"."T_SYS_TASKCONFIG" VALUES ('40287d814c59e68c014c59fa39cd0000', null, null, null, 'SCM', '同步his科室信息', TO_TIMESTAMP(' 2015-03-26 14:44:31:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'com.dhcc.pms.blh.task.monitor.GetHisLocXHTask', null, '1', '1', '4', 'SCM', 'SCM');
INSERT INTO "SCM"."T_SYS_TASKCONFIG" VALUES ('40287d814c5a032e014c5a2333e70022', null, null, null, 'scm', '同步供应商信息', TO_TIMESTAMP(' 2015-03-19 15:29:53:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'com.dhcc.pms.blh.task.monitor.GetHisVendorXHTask', null, '1', '1', '4', 'scm', 'scm');

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
INSERT INTO "SCM"."T_VEN_HOP_INC" VALUES ('19788', '6332', '4028b7c64c2f9aaf014c2fb76a0b0002', '1', '1', '1', 'Y');
INSERT INTO "SCM"."T_VEN_HOP_INC" VALUES ('19789', '6329', '4028b7c64c2f9aaf014c2fb78d140003', null, '20', '1', 'Y');
INSERT INTO "SCM"."T_VEN_HOP_INC" VALUES ('19762', '6302', '297eacb94c278c58014c2794d9330000', null, '12', '1', 'Y');
INSERT INTO "SCM"."T_VEN_HOP_INC" VALUES ('19761', '6301', '297eacb94c278c58014c279510990001', '1', '1', '1', 'Y');
INSERT INTO "SCM"."T_VEN_HOP_INC" VALUES ('19821', '6341', '4028b7c64c55a298014c55b0d8a60000', null, '12', '1', 'Y');
INSERT INTO "SCM"."T_VEN_HOP_INC" VALUES ('19793', '6331', '297ec3224c2fb013014c2fbe28290001', '1', '1', '1', 'Y');
INSERT INTO "SCM"."T_VEN_HOP_INC" VALUES ('19797', '6327', '297ec3224c2fb013014c2fbe64000002', '1', '1', '1', 'Y');
INSERT INTO "SCM"."T_VEN_HOP_INC" VALUES ('19791', '6333', '297ec3224c2fb013014c2fbeb1f00003', '12', '12', '1', 'Y');
INSERT INTO "SCM"."T_VEN_HOP_INC" VALUES ('19796', '6330', '297ec3224c2fb013014c2fbeea8f0004', '12', '12', '1', 'Y');
INSERT INTO "SCM"."T_VEN_HOP_INC" VALUES ('19822', '6342', '4028b7c64c55a298014c55b103900001', null, '1', '1', 'Y');
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
"VEN_INC_CATID" NUMBER NULL ,
"VEN_INC_SP" NUMBER NULL ,
"VEN_INC_QTY" NUMBER NULL ,
"VEN_INC_RESQTY" NUMBER NULL ,
"VEN_INC_AVAILQTY" NUMBER NULL ,
"VEN_INC_COMMENT_NUM" NUMBER NULL ,
"VEN_INC_ORDER_QTY" NUMBER NULL ,
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
INSERT INTO "SCM"."T_VEN_INC" VALUES ('SPC0005', '心脏支架', '箱', '箱', null, null, null, null, '6324', null, '7121', '12306', null, 'xzzj', null, null, null, null, null, null, null, null);
INSERT INTO "SCM"."T_VEN_INC" VALUES ('SPCXXX', '手术刀', '箱(100)', '箱(100)', null, null, null, '1983', '6334', null, '7121', '1.20', null, 'ssd', '58', null, null, null, null, null, null, null);
INSERT INTO "SCM"."T_VEN_INC" VALUES ('spc001', '打印纸', '张', null, null, null, null, null, '6321', null, '7121', '29', null, 'dyz', null, null, null, null, null, null, null, null);
INSERT INTO "SCM"."T_VEN_INC" VALUES ('SPC002', '自行车', '辆', null, null, null, null, null, '6322', null, '7121', '9999999', null, 'zxc', null, null, null, null, null, null, null, null);
INSERT INTO "SCM"."T_VEN_INC" VALUES ('SPC0004', '注射器', '支', '支', null, null, null, '1981', '6323', null, '7121', '2', null, 'zsq', '58', null, null, null, null, null, null, null);
INSERT INTO "SCM"."T_VEN_INC" VALUES ('注射器524', '注射器524', '盒(12)', '盒(12)', null, null, null, '1941', '6341', null, '7142', '12', null, 'zsq524', '58', null, null, null, null, null, null, null);
INSERT INTO "SCM"."T_VEN_INC" VALUES ('注射器525', '注射器525', '盒(12)', '盒(12)', null, null, null, '1961', '6342', null, '7142', '24', null, 'zsq525', '58', null, '2222', null, null, null, null, null);
INSERT INTO "SCM"."T_VEN_INC" VALUES ('XY0001', '阿莫西林', 'mg', 'mg', null, null, null, null, '6301', null, '7121', '111', 'xx', 'amxl', null, '123', null, null, null, null, null, null);
INSERT INTO "SCM"."T_VEN_INC" VALUES ('XY0002', '新津事丰一次性无菌加药器注射器含针头 5毫升 6号(注射器)', 'ml', 'ml', 'ml', null, null, null, '6302', null, '7121', '1', null, 'pttzsy', null, null, null, null, null, null, null, null);
INSERT INTO "SCM"."T_VEN_INC" VALUES ('SPC0006', '拖把', '箱', '箱', null, null, null, null, '6325', null, '7121', '20', null, 'tb', null, null, null, null, null, null, null, null);
INSERT INTO "SCM"."T_VEN_INC" VALUES ('SPC0007', '国产注射器', '箱(24)', '箱(24)', null, null, null, '1982', '6326', null, '7121', '12', null, 'tx', '58', null, null, null, null, null, null, null);
INSERT INTO "SCM"."T_VEN_INC" VALUES ('XY00999', '华西医用纱布包(非无菌)84cm800cm', '包', '包', '包', '包', null, null, '6327', null, '7121', '35', null, '999', null, null, null, null, null, null, null, null);
INSERT INTO "SCM"."T_VEN_INC" VALUES ('XY00012', '纱布(纱布块)10片装7.57.5cm-8P', '包', '包', null, null, null, null, '6328', null, '7121', '5.30', null, 'shp', null, null, null, null, null, null, null, null);
INSERT INTO "SCM"."T_VEN_INC" VALUES ('SPC0008', '国产中性笔', '盒(20)', '盒(20)', null, null, null, null, '6329', null, '7121', '20', null, 'zxb', null, null, null, null, null, null, null, null);
INSERT INTO "SCM"."T_VEN_INC" VALUES ('sn0001', '得力（deli）6600 经济实用型中性笔(黑) 0.5mm 12只装', '盒(12支)', '盒(12支)', null, null, null, null, '6330', null, '7121', '12', '得力6600-0.5mm', 'sn', null, null, null, null, null, null, null, null);
INSERT INTO "SCM"."T_VEN_INC" VALUES ('dj0001', '新绿天章70克A4复印纸 5包箱', '箱', '箱', null, null, null, null, '6331', null, '7121', '89', null, 'dj', null, null, null, null, null, null, null, null);
INSERT INTO "SCM"."T_VEN_INC" VALUES ('SPC0009', '一次性无菌注射器', '支', '支', null, null, null, '1962', '6332', null, '7121', '1', null, 'ssq', '58', null, null, null, null, null, null, null);
INSERT INTO "SCM"."T_VEN_INC" VALUES ('524525', '巧护士 全棉纯色手术帽 蓝色手术衣 洗手衣配套帽子 高温高压消毒 蓝色手术帽', '17', '盒(12)', null, null, null, null, '6333', null, '7121', '18', null, 'bz', '59', null, null, null, null, null, null, null);

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
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('197', '6331', '2015-03-24+10-39-12d81c1036-9732-45bf-a6a5-c03ad60cf00a.jpg', '3');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('195', '6331', '2015-03-24+10-39-08f2cc461b-e7ba-4378-a04a-92d3b499a371.jpg', '1');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('196', '6331', '2015-03-24+10-39-10190ed65d-ce74-4d26-9cdd-da4b81685e98.jpg', '2');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('198', '6331', '2015-03-24+10-39-15103fc57d-25ae-4aa2-b893-68934322ad8a.jpg', '4');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('203', '6330', '2015-03-24+10-40-472b5cedf6-ac7f-4b76-9333-9342a5544ac4.jpg', '1');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('204', '6330', '2015-03-24+10-40-50c4688580-a097-4b47-9b14-83f2fa8b2aa8.jpg', '2');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('205', '6330', '2015-03-24+10-40-5370105263-36b0-43e6-84d3-b962795529c5.jpg', '3');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('206', '6330', '2015-03-24+10-40-55ac8d3cfd-f1a9-4d24-b2da-c5d4231354cc.jpg', '4');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('224', '6332', '2015-03-26+10-01-30c171e935-11f6-4167-996d-f85e2b89147f.jpg', '1');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('225', '6332', '2015-03-26+10-01-324e4cbfbe-15ce-41f6-974e-7439b4d00670.jpg', '2');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('226', '6332', '2015-03-26+10-01-354c75ccc1-45b9-4546-88e5-afda7f688198.jpg', '3');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('227', '6332', '2015-03-26+10-01-38b91b90d7-8f96-4a2a-9af1-1f690506adf8.jpg', '4');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('228', '6341', '2015-03-26+18-44-119829c231-e2c8-4686-b8d4-e77cc80c007e.jpg', '1');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('209', '6329', '2015-03-26+09-33-18888d2acf-673b-4edf-829a-5eb3ba35ecbb.jpg', '1');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('210', '6329', '2015-03-26+09-33-207f63b841-e274-40f8-b7b5-d12ed5afb041.jpg', '2');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('164', '6326', '2015-03-20+17-23-10704cb588-be50-42c6-9959-59256c9ae3d2.jpg', '1');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('165', '6326', '2015-03-20+17-23-131a16faff-38b7-4781-ab03-b7bb0f6f96ac.jpg', '2');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('166', '6326', '2015-03-20+17-23-1654e118b1-b838-41a5-94b1-99438492de34.jpg', '3');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('167', '6326', '2015-03-20+17-23-2061d4fabc-df38-4c04-9c24-aadfe971683a.jpg', '4');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('172', '6334', '2015-03-21+21-31-07f3b85ac9-2f9d-4731-abb5-1146123c4511.jpg', '1');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('173', '6334', '2015-03-21+21-31-15d02825ec-21af-4271-94ee-d25e5e00b191.jpg', '2');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('174', '6334', '2015-03-21+21-31-23547d7276-27c2-4f72-90ad-085c202afe5e.jpg', '3');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('175', '6334', '2015-03-21+21-31-35de8a7436-8939-41a6-ae81-42dcc063a529.jpg', '4');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('208', '6329', '2015-03-26+09-33-13da41a4a4-1284-4f7c-9a3d-977e17f9ef09.jpg', '3');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('211', '6329', '2015-03-26+09-33-2416075407-edcc-48ce-ab18-898a22d3f0be.jpg', '4');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('212', '6328', '2015-03-26+09-38-29f868eb95-8fd0-4ff0-8395-3e80279e34fa.jpg', '1');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('213', '6328', '2015-03-26+09-38-3150346554-492c-43ef-b5c2-1df843e323af.jpg', '2');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('214', '6328', '2015-03-26+09-38-342462bfe4-d7ef-417b-9fde-46927b2b96d3.jpg', '3');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('215', '6328', '2015-03-26+09-38-3765febd2b-b953-4ea5-85b5-02d76006684b.jpg', '4');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('216', '6327', '2015-03-26+09-42-148e40f288-b2ea-41d3-8e26-16a5ac1ec330.jpg', '1');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('217', '6327', '2015-03-26+09-42-16a6a12722-16ed-492f-aa92-355c5e60528f.jpg', '2');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('218', '6327', '2015-03-26+09-42-1964083f7e-7fe5-4814-89b5-06bd11ce5fe5.jpg', '3');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('219', '6327', '2015-03-26+09-42-21a41da8df-3226-45e6-a517-76f5cf4cfc31.jpg', '4');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('220', '6302', '2015-03-26+09-46-15732f30b5-fe74-43d4-9a53-d58a3994c796.jpg', '1');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('221', '6302', '2015-03-26+09-46-170cc7ab61-b0f5-4a68-9b4f-cef99077049d.jpg', '2');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('222', '6302', '2015-03-26+09-46-204edba0e9-4373-41a7-8106-41d4486f1f59.jpg', '3');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('223', '6302', '2015-03-26+09-46-22a71af6cd-feaf-4974-a025-cb70542928e8.jpg', '4');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('229', '6341', '2015-03-26+18-44-1495b40777-849f-44fb-a160-8dcd5c2cc775.jpg', '2');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('230', '6341', '2015-03-26+18-44-16919e01d2-0023-4fee-b264-e0fbe1a22750.jpg', '3');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('231', '6341', '2015-03-26+18-44-190ee1da6c-91c3-44e4-a04d-9ea52946fcf1.jpg', '4');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('232', '6342', '2015-03-26+18-44-551137eb7e-9772-4e25-9a38-fd85f13c8185.jpg', '1');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('233', '6342', '2015-03-26+18-45-015d6016d2-d9a6-4969-953a-cc05c898c510.jpg', '2');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('142', '6324', '2015-03-19+09-34-386b0c91a1-868a-4675-ab86-ff2402ce1e83.jpg', '1');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('143', '6325', '2015-03-19+09-35-210169343e-0661-4425-89ea-b29e10be19e0.jpg', '1');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('188', '6333', '2015-03-24+10-34-44b7fe42d9-be82-4336-8b1a-ce7c5c7db2c4.jpg', '1');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('190', '6333', '2015-03-24+10-34-48bf9d4a0a-a377-48bc-babd-0913ac3676d7.jpg', '3');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('189', '6333', '2015-03-24+10-34-4690707097-37b7-4391-b62a-9814c62e37c4.jpg', '2');
INSERT INTO "SCM"."T_VEN_INC_PIC" VALUES ('191', '6333', '2015-03-24+10-34-51e7f8a83d-e169-46dc-9eb4-8be40b3e8c77.jpg', '4');

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
INSERT INTO "SCM"."T_VEN_INC_PROPERTY" VALUES ('112', '6332', '44');
INSERT INTO "SCM"."T_VEN_INC_PROPERTY" VALUES ('113', '6332', '13');
INSERT INTO "SCM"."T_VEN_INC_PROPERTY" VALUES ('114', '6332', '81');
INSERT INTO "SCM"."T_VEN_INC_PROPERTY" VALUES ('110', '6332', '27');
INSERT INTO "SCM"."T_VEN_INC_PROPERTY" VALUES ('111', '6332', '11');
INSERT INTO "SCM"."T_VEN_INC_PROPERTY" VALUES ('151', '6334', '24');
INSERT INTO "SCM"."T_VEN_INC_PROPERTY" VALUES ('152', '6334', '102');
INSERT INTO "SCM"."T_VEN_INC_PROPERTY" VALUES ('153', '6334', '49');
INSERT INTO "SCM"."T_VEN_INC_PROPERTY" VALUES ('154', '6334', '66');
INSERT INTO "SCM"."T_VEN_INC_PROPERTY" VALUES ('155', '6334', '82');
INSERT INTO "SCM"."T_VEN_INC_PROPERTY" VALUES ('156', '6326', '41');
INSERT INTO "SCM"."T_VEN_INC_PROPERTY" VALUES ('157', '6326', '11');
INSERT INTO "SCM"."T_VEN_INC_PROPERTY" VALUES ('158', '6326', '46');
INSERT INTO "SCM"."T_VEN_INC_PROPERTY" VALUES ('159', '6326', '65');
INSERT INTO "SCM"."T_VEN_INC_PROPERTY" VALUES ('160', '6326', '83');
INSERT INTO "SCM"."T_VEN_INC_PROPERTY" VALUES ('161', '6342', '23');
INSERT INTO "SCM"."T_VEN_INC_PROPERTY" VALUES ('162', '6342', '103');
INSERT INTO "SCM"."T_VEN_INC_PROPERTY" VALUES ('163', '6342', '45');
INSERT INTO "SCM"."T_VEN_INC_PROPERTY" VALUES ('164', '6342', '13');
INSERT INTO "SCM"."T_VEN_INC_PROPERTY" VALUES ('165', '6342', '63');
INSERT INTO "SCM"."T_VEN_INC_PROPERTY" VALUES ('146', '6341', '42');
INSERT INTO "SCM"."T_VEN_INC_PROPERTY" VALUES ('147', '6341', '101');
INSERT INTO "SCM"."T_VEN_INC_PROPERTY" VALUES ('148', '6341', '51');
INSERT INTO "SCM"."T_VEN_INC_PROPERTY" VALUES ('149', '6341', '65');
INSERT INTO "SCM"."T_VEN_INC_PROPERTY" VALUES ('150', '6341', '64');
INSERT INTO "SCM"."T_VEN_INC_PROPERTY" VALUES ('127', '6323', '0');
INSERT INTO "SCM"."T_VEN_INC_PROPERTY" VALUES ('128', '6323', '0');
INSERT INTO "SCM"."T_VEN_INC_PROPERTY" VALUES ('129', '6323', '84');
INSERT INTO "SCM"."T_VEN_INC_PROPERTY" VALUES ('125', '6323', '0');
INSERT INTO "SCM"."T_VEN_INC_PROPERTY" VALUES ('61', '6333', '21');
INSERT INTO "SCM"."T_VEN_INC_PROPERTY" VALUES ('126', '6323', '11');

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
INSERT INTO "SCM"."T_VEN_QUALIF_PIC" VALUES ('9053', '2015-03-30+12-12-18aabcf0ea-da31-437d-a4ed-60f6389103bd.jpg', '7050', '53eb4e4fNbc454c46.jpg');
INSERT INTO "SCM"."T_VEN_QUALIF_PIC" VALUES ('9055', '2015-03-30+12-12-28c54dc503-55ef-459c-9741-1d912f647a7a.jpg', '7052', '53eb4e4eNe519ad57.jpg');
INSERT INTO "SCM"."T_VEN_QUALIF_PIC" VALUES ('9054', '2015-03-30+12-12-247108792b-b576-4abb-a168-bcc68ee724f0.jpg', '7051', '53eb4e51N055f8e36.jpg');
INSERT INTO "SCM"."T_VEN_QUALIF_PIC" VALUES ('9056', '2015-03-30+12-12-56a5677b64-091c-4ba4-94e4-714435ca73a2.jpg', '7053', 'rBEhV1KN8SAIAAAAAAKrUL1W6r4AAF6wADr-DEAAqto890.jpg');
INSERT INTO "SCM"."T_VEN_QUALIF_PIC" VALUES ('9057', '2015-03-30+12-13-00e74fe12e-e960-4a22-8a26-85778bc79309.jpg', '7053', 'rBEhVlKN8SAIAAAAAAJ9DE_YQNUAAF6wAD3GgMAAn0k609.jpg');

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
INSERT INTO "SCM"."T_VEN_QUALIF_TYPE" VALUES ('1050', '销售许可证', '销售许可证', '1', '日期');
INSERT INTO "SCM"."T_VEN_QUALIF_TYPE" VALUES ('1100', 'GMP资质认真', 'GMP资质认真', '2', '图片');
INSERT INTO "SCM"."T_VEN_QUALIF_TYPE" VALUES ('1101', '器械销售资格证', '器械销售资格证', '3', '文本');

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
INSERT INTO "SCM"."T_VEN_QUALIFICATION" VALUES ('7053', '7142', null, null, '1050', null);
INSERT INTO "SCM"."T_VEN_QUALIFICATION" VALUES ('7054', '7142', null, null, '1100', null);
INSERT INTO "SCM"."T_VEN_QUALIFICATION" VALUES ('7050', '7121', null, TO_DATE('2015-02-18 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1050', null);
INSERT INTO "SCM"."T_VEN_QUALIFICATION" VALUES ('7051', '7121', null, TO_DATE('2015-02-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1100', null);
INSERT INTO "SCM"."T_VEN_QUALIFICATION" VALUES ('7052', '7121', null, TO_DATE('2015-03-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1101', null);
INSERT INTO "SCM"."T_VEN_QUALIFICATION" VALUES ('8050', '7901', null, null, '1050', null);
INSERT INTO "SCM"."T_VEN_QUALIFICATION" VALUES ('8051', '7901', null, null, '1100', null);
INSERT INTO "SCM"."T_VEN_QUALIFICATION" VALUES ('8052', '7901', null, null, '1101', null);

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
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7646', '459', 'layx-北京龙安医学技术开发公司', null, null, null, null, null, null, null, 'layxbjlayxjskfgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7647', '460', 'JCTW-北京京朝腾微医学科技有限公司', null, null, null, null, null, null, null, 'JCTWbjjctwyxkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7648', '461', 'DSK-北京德善康科技有限公司', null, null, null, null, null, null, null, 'DSKbjdskkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7649', '462', 'xctz-北京信诚拓展医疗器械有限公司', null, null, null, null, null, null, null, 'xctzbjxctzylqxyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7650', '463', 'LSL-北京来时路医用材料有限责任公司', null, null, null, null, null, null, null, 'LSLbjlslyyclyxzrgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7651', '464', 'RSB-北京容圣博投资顾问有限公司', null, null, null, null, null, null, null, 'RSBbjrsbtzgwyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7652', '465', 'BSCX-百事创新(北京)科技有限公司', null, null, null, null, null, null, null, 'BSCXbscxbjkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7653', '466', 'bjla-北京龙安医学技术开发公司', null, null, null, null, null, null, null, 'bjlabjlayxjskfgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7654', '467', 'LHTX-北京利华同兴科贸中心', null, null, null, null, null, null, null, 'LHTXbjlhtxkmzx', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7655', '468', 'KYDC-北京开元达成科技中心', null, null, null, null, null, null, null, 'KYDCbjkydckjzx', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7656', '469', 'LYY-北京鹭羿岩医药科技有限公司', null, null, null, null, null, null, null, 'LYYbjlyyyykjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7657', '470', 'KNSD-北京科诺时代科技有限公司', null, null, null, null, null, null, null, 'KNSDbjknsdkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7658', '471', 'HYKY-北京海盈凯悦科技有限责任公司', null, null, null, null, null, null, null, 'HYKYbjhykykjyxzrgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7659', '472', 'YFC-北京益福昌医疗设备有限责任公司', null, null, null, null, null, null, null, 'YFCbjyfcylsbyxzrgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7660', '473', 'SMH-北京施迈惠商贸有限公司', null, null, null, null, null, null, null, 'SMHbjsmhsmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7661', '474', 'JMWSD-北京京门威士达医疗器械有限公司', null, null, null, null, null, null, null, 'JMWSDbjjmwsdylqxyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7662', '475', 'bjxhx-北京市鑫河旭印刷厂', null, null, null, null, null, null, null, 'bjxhxbjsxhxysc', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7663', '476', 'SSXY-北京盛世兴业科技开发有限公司', null, null, null, null, null, null, null, 'SSXYbjssxykjkfyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7664', '477', 'bjrfl-北京日枫霖工装设计制作有限责任公司', null, null, null, null, null, null, null, 'bjrflbjrflgzsjzzyxzrgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7665', '478', 'bjfhx-北京丰红兴纺织品有限公司', null, null, null, null, null, null, null, 'bjfhxbjfhxfzpyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7666', '479', 'tzxb-北京市通州鑫宝卫生材料厂', null, null, null, null, null, null, null, 'tzxbbjstzxbwsclc', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7667', '480', 'jway-北京市京卫安宜技术发展有限公司', null, null, null, null, null, null, null, 'jwaybjsjwayjsfzyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7668', '481', 'dfyq-北京东方医用气体有限公司', null, null, null, null, null, null, null, 'dfyqbjdfyyqtyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7669', '482', 'BJKCL-北京康齿乐医学科技有限公司', null, null, null, null, null, null, null, 'BJKCLbjkclyxkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7670', '483', 'MDKT-北京麦迪科特医疗器械有限责任公司', null, null, null, null, null, null, null, 'MDKTbjmdktylqxyxzrgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7671', '484', 'LJC-北京利嘉诚医药科技有限公司', null, null, null, null, null, null, null, 'LJCbjljcyykjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7672', '485', 'lykc-老院库存', null, null, null, null, null, null, null, 'lykclykc', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7673', '486', 'GJKJ-北京光健科技发展有限公司', null, null, null, null, null, null, null, 'GJKJbjgjkjfzyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7674', '487', 'slhm-北京双利华茂工贸有限公司', null, null, null, null, null, null, null, 'slhmbjslhmgmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7675', '488', 'ysyj-北京一商宇洁商贸有限公司', null, null, null, null, null, null, null, 'ysyjbjysyjsmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7676', '489', 'ryx-北京仁宇鑫工贸有限公司', null, null, null, null, null, null, null, 'ryxbjryxgmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7677', '490', 'HKMD-北京惠康美达科技有限公司', null, null, null, null, null, null, null, 'HKMDbjhkmdkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7678', '491', 'RFKJ-北京日枫科技有限公司', null, null, null, null, null, null, null, 'RFKJbjrfkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7679', '492', 'DFRA-北京东方瑞澳医疗设备有限公司', null, null, null, null, null, null, null, 'DFRAbjdfraylsbyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7680', '493', 'FZMX-福州迈新生物技术开发有限公司', null, null, null, null, null, null, null, 'FZMXfzmxswjskfyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7681', '494', 'ZSJQ-北京中杉金桥生物技术有限公司', null, null, null, null, null, null, null, 'ZSJQbjzsjqswjsyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7682', '495', 'JDLH-北京健德联合口腔医疗设备有限公司', null, null, null, null, null, null, null, 'JDLHbjjdlhkqylsbyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7683', '496', 'SM-北京圣曼医疗器材技术有限公司', null, null, null, null, null, null, null, 'SMbjsmylqcjsyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7684', '497', 'HSK-北京合盛康科贸有限公司', null, null, null, null, null, null, null, 'HSKbjhskkmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7685', '498', 'XTKQ-北京先通康桥医药科技有限公司
', null, null, null, null, null, null, null, 'XTKQbjxtkqyykjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7686', '499', 'jyjl-北京市京盐金龙副食经营部', null, null, null, null, null, null, null, 'jyjlbjsjyjlfsjyb', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7687', '500', 'xhx-北京市鑫河旭印刷厂', null, null, null, null, null, null, null, 'xhxbjsxhxysc', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7688', '501', 'zzhy-北京周庄弘燕农副产品市场中心', null, null, null, null, null, null, null, 'zzhybjzzhynfcpsczx', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7689', '502', 'jyjl-北京市京盐金龙副食经营部', null, null, null, null, null, null, null, 'jyjlbjsjyjlfsjyb', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7690', '503', 'hlh-北京市恒利和阀门五金销售部', null, null, null, null, null, null, null, 'hlhbjshlhfmwjxsb', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7691', '504', 'xrgg-北京新锐广告制作有限公司', null, null, null, null, null, null, null, 'xrggbjxrggzzyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7692', '505', 'cszj-北京城市之洁环卫服务中心', null, null, null, null, null, null, null, 'cszjbjcszjhwfwzx', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7693', '506', 'rfl-北京日枫霖工装设计制作有限责任公司', null, null, null, null, null, null, null, 'rflbjrflgzsjzzyxzrgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7694', '507', 'SHCD-上海长岛抗体诊断试剂有限公司', null, null, null, null, null, null, null, 'SHCDshzdktzdsjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7695', '508', 'pay-北京平安银科技发展有限公司', null, null, null, null, null, null, null, 'paybjpaykjfzyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7696', '509', 'WSBL-北京旺市百利商业有限公司飘亮购物中心', null, null, null, null, null, null, null, 'WSBLbjwsblsyyxgsplgwzx', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7697', '510', 'HXSJ-国药集团化学试剂北京有限公司', null, null, null, null, null, null, null, 'HXSJgyjthxsjbjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7698', '511', 'BBKY-北京北博科仪商贸有限公司', null, null, null, null, null, null, null, 'BBKYbjbbkysmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7699', '512', 'XMR-北京欣明仁医疗器械技术有限公司', null, null, null, null, null, null, null, 'XMRbjxmrylqxjsyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7700', '513', 'ZZFM-涿州福美神盾生物科技有限公司', null, null, null, null, null, null, null, 'ZZFMzzfmsdswkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7701', '514', 'KDW-北京康德威医疗设备有限公司', null, null, null, null, null, null, null, 'KDWbjkdwylsbyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7702', '515', 'XHT-北京鑫宏涛五金建材商店', null, null, null, null, null, null, null, 'XHTbjxhtwjjcsd', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7703', '516', 'CYJLF-北京创益佳家乐福商业有限公司', null, null, null, null, null, null, null, 'CYJLFbjcyjjlfsyyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7704', '517', 'zyxd-北京振宇先达科技有限公司', null, null, null, null, null, null, null, 'zyxdbjzyxdkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7705', '518', 'mty-北京市石景山名特优食品公司', null, null, null, null, null, null, null, 'mtybjssjsmtyspgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7706', '519', 'jxwj-北京市金鑫五金建材商店', null, null, null, null, null, null, null, 'jxwjbjsjxwjjcsd', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7707', '520', 'xhys-香河永胜综合加工厂', null, null, null, null, null, null, null, 'xhysxhyszhjgc', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7708', '521', 'rskj-北京荣盛康洁日用化学品有限公司', null, null, null, null, null, null, null, 'rskjbjrskjryhxpyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7709', '522', 'dfsz-北京东方盛泽东郊农副产品批发市场有限公司', null, null, null, null, null, null, null, 'dfszbjdfszdjnfcppfscyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7710', '523', 'XSH-北京鑫四环消毒技术开发中心', null, null, null, null, null, null, null, 'XSHbjxshxdjskfzx', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7711', '524', 'SLB-北京索莱宝科技有限公司', null, null, null, null, null, null, null, 'SLBbjslbkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7712', '525', 'rthdq-北京瑞天鸿电气有限公司', null, null, null, null, null, null, null, 'rthdqbjrthdqyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7713', '526', 'zgjk-中国疾病预防控制中心全球基金采购部', null, null, null, null, null, null, null, 'zgjkzgjbyfkzzxqqjjcgb', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7714', '527', 'RH-北京若华医疗器械有限公司', null, null, null, null, null, null, null, 'RHbjrhylqxyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7715', '528', 'LKSD-北京朗昆时代科技发展有限公司', null, null, null, null, null, null, null, 'LKSDbjlksdkjfzyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7716', '529', 'BHTD-北京博汇天地科技有限公司', null, null, null, null, null, null, null, 'BHTDbjbhtdkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7717', '530', 'DH-北京东华合创数码科技股份有限公司', null, null, null, null, null, null, null, 'DHbjdhhcsmkjgfyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7718', '531', 'czj-北京市财政局', null, null, null, null, null, null, null, 'czjbjsczj', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7719', '532', 'ymcx-北京悦美诚信日化经营部', null, null, null, null, null, null, null, 'ymcxbjymcxrhjyb', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7720', '533', 'rlc-北京瑞龙春生物科技有限公司', null, null, null, null, null, null, null, 'rlcbjrlcswkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7721', '534', 'jlf-北京家乐福商业有限公司双井店', null, null, null, null, null, null, null, 'jlfbjjlfsyyxgssjd', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7722', '535', 'smfz-北京顺美服装股份有限公司', null, null, null, null, null, null, null, 'smfzbjsmfzgfyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7723', '536', 'gyjt-国药集团医药物流有限公司', null, null, null, null, null, null, null, 'gyjtgyjtyywlyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7724', '537', 'wkt-北京市威卡通服装厂', null, null, null, null, null, null, null, 'wktbjswktfzc', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7725', '538', 'aly-北京奥乐宇办公用品商店', null, null, null, null, null, null, null, 'alybjalybgypsd', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7726', '539', 'blg-北京市安定门宝兰阁文化用品商店', null, null, null, null, null, null, null, 'blgbjsadmblgwhypsd', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7727', '540', 'TJYR-天津市一瑞生物工程有限公司', null, null, null, null, null, null, null, 'TJYRtjsyrswgcyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7728', '541', 'hmst-霍姆斯特(北京)环境科技有限公司', null, null, null, null, null, null, null, 'hmsthmstbjhjkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7729', '542', 'zshy-北京中盛茂源科技发展有限公司', null, null, null, null, null, null, null, 'zshybjzsmykjfzyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7730', '543', 'jgmj-北京京冠毛巾有限责任公司', null, null, null, null, null, null, null, 'jgmjbjjgmjyxzrgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7731', '544', 'ycf-北京英才发文化用品经销部', null, null, null, null, null, null, null, 'ycfbjycfwhypjxb', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7732', '545', 'RTLC-北京瑞泰林川商贸有限公司', null, null, null, null, null, null, null, 'RTLCbjrtlcsmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7733', '546', 'STB-史泰博商贸有限公司北京分公司', null, null, null, null, null, null, null, 'STBstbsmyxgsbjfgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7734', '547', 'ZWHR-北京中卫惠瑞医疗器械有限责任公司', null, null, null, null, null, null, null, 'ZWHRbjzwhrylqxyxzrgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7735', '548', 'ZZJJ-北京住总家具市场有限公司', null, null, null, null, null, null, null, 'ZZJJbjzzjjscyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7736', '549', 'TCHY-北京天成恒业科贸有限公司', null, null, null, null, null, null, null, 'TCHYbjtchykmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7737', '550', 'layx-北京龙安医学技术开发公司', null, null, null, null, null, null, null, 'layxbjlayxjskfgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7738', '551', 'SHRK-上海日科贸易有限公司', null, null, null, null, null, null, null, 'SHRKshrkmyyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7739', '552', 'sygc-唐山市开平区顺如骨质瓷销售部', null, null, null, null, null, null, null, 'sygctsskpqsrgzcxsb', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7740', '553', 'CAT-北京诚安堂药房有限公司
', null, null, null, null, null, null, null, 'CATbjcatyfyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7741', '554', 'JAGK-北京洁安高科医疗器材有限公司', null, null, null, null, null, null, null, 'JAGKbjjagkylqcyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7742', '555', 'YBJY-北京友邦基业科贸有限责任公司', null, null, null, null, null, null, null, 'YBJYbjybjykmyxzrgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7743', '556', 'trjc-北京天润佳创经贸有限公司', null, null, null, null, null, null, null, 'trjcbjtrjcjmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7744', '557', 'sjdbh-北京世纪丹陛华综合市场有限公司', null, null, null, null, null, null, null, 'sjdbhbjsjdbhzhscyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7745', '558', 'qpg-北京青苹果红苹果生殖健康产品科技开发中心', null, null, null, null, null, null, null, 'qpgbjqpghpgszjkcpkjkfzx', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7746', '559', 'tjxsm-北京通嘉兴商贸有限公司', null, null, null, null, null, null, null, 'tjxsmbjtjxsmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7747', '560', 'jxdd-北京锦绣大地农副食产品批发市场有限责任公司', null, null, null, null, null, null, null, 'jxddbjjxddnfscppfscyxzrgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7748', '561', 'xcwy-北京行程伟业商贸有限公司', null, null, null, null, null, null, null, 'xcwybjxcwysmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7749', '562', 'hrmj-北京翰荣名家画坊有限公司', null, null, null, null, null, null, null, 'hrmjbjhrmjhfyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7221', '0', null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7222', '4', 'BWYK-北京北卫粤康医药有限公司', null, null, null, null, null, null, null, 'BWYKbjbwykyyyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7223', '5', 'DTKJ-北京德天科技发展公司', null, null, null, null, null, null, null, 'DTKJbjdtkjfzgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7224', '6', 'FYD-北京富亚东医药有限公司', null, null, null, null, null, null, null, 'FYDbjfydyyyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7225', '7', 'GAYY-北京广安医药联合中心', null, null, null, null, null, null, null, 'GAYYbjgayylhzx', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7226', '9', 'HJZY-北京华靳制药有限公司', null, null, null, null, null, null, null, 'HJZYbjhjzyyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7227', '24', 'SHYY-北京双鹤药业经营有限公司', null, null, null, null, null, null, null, 'SHYYbjshyyjyyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7228', '25', 'JWGK-北京市京卫国康医药有限公司', null, null, null, null, null, null, null, 'JWGKbjsjwgkyyyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7229', '26', 'BJSJYY-北京市燕京医药公司', null, null, null, null, null, null, null, 'BJSJYYbjsyjyygs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7230', '27', 'KL-北京市康联医药有限责任公司', null, null, null, null, null, null, null, 'KLbjsklyyyxzrgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7231', '28', 'BJSYLC-北京首医临床医学科技中心', null, null, null, null, null, null, null, 'BJSYLCbjsylcyxkjzx', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7232', '29', 'BJSYYB-北京市医药保健品进出口公司', null, null, null, null, null, null, null, 'BJSYYBbjsyybjpjckgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7233', '30', 'TRKM-北京驼人科贸有限公司', null, null, null, null, null, null, null, 'TRKMbjtrkmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7234', '31', 'BJTRTC-北京同仁堂崇文门药店有限责任公司', null, null, null, null, null, null, null, 'BJTRTCbjtrtcwmydyxzrgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7235', '32', 'TSL-北京天士力医药有限公司', null, null, null, null, null, null, null, 'TSLbjtslyyyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7236', '33', 'TXPX-北京天星普信生物医药有限公司', null, null, null, null, null, null, null, 'TXPXbjtxpxswyyyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7237', '34', 'TYHY-北京太洋环宇医药有限责任公司', null, null, null, null, null, null, null, 'TYHYbjtyhyyyyxzrgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7238', '35', 'WWYY-北京万维医药有限公司', null, null, null, null, null, null, null, 'WWYYbjwwyyyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7239', '36', 'BJXTYY-北京夏图医药有限公司', null, null, null, null, null, null, null, 'BJXTYYbjxtyyyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7240', '37', 'BJYBQX-北京医保全新大药房责任有限公司', null, null, null, null, null, null, null, 'BJYBQXbjybqxdyfzryxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7241', '38', 'YDYY-北京远东医药发展公司', null, null, null, null, null, null, null, 'YDYYbjydyyfzgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7242', '39', 'BJYHYX-北京协和医学科学技术开发公司', null, null, null, null, null, null, null, 'BJYHYXbjxhyxkxjskfgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7243', '40', 'YPSH-北京益普四环医药技术开发有限公司', null, null, null, null, null, null, null, 'YPSHbjypshyyjskfyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7244', '41', 'JY-北京医药股份有限公司经营分公司', null, null, null, null, null, null, null, 'JYbjyygfyxgsjyfgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7245', '42', 'SP-北京医药股份有限公司药品分公司', null, null, null, null, null, null, null, 'SPbjyygfyxgsypfgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7246', '43', 'YYXX-中国永裕新兴医药有限公司', null, null, null, null, null, null, null, 'YYXXzgyyxxyyyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7247', '44', 'BJZDBF-北京振德北方医用敷料有限公司', null, null, null, null, null, null, null, 'BJZDBFbjzdbfyyflyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7248', '45', 'BJZXYY-北京中欣医药经营公司', null, null, null, null, null, null, null, 'BJZXYYbjzxyyjygs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7249', '46', 'BJZYKY-北京中预科医药有限公司', null, null, null, null, null, null, null, 'BJZYKYbjzykyyyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7250', '47', 'GDSZHS-广东省珠海市康鸣医药有限公司', null, null, null, null, null, null, null, 'GDSZHSgdszhskmyyyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7251', '48', 'GYJTYX-国药集团药业股份有限公司', null, null, null, null, null, null, null, 'GYJTYXgyjtyygfyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7252', '49', 'HH-国药控股北京华鸿有限公司', null, null, null, null, null, null, null, 'HHgykgbjhhyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7253', '50', 'GA-国药控股北京有限公司广安药品分公司', null, null, null, null, null, null, null, 'GAgykgbjyxgsgaypfgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7254', '51', 'XTY-国药控股北京有限公司新特药品分司', null, null, null, null, null, null, null, 'XTYgykgbjyxgsxtypfs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7255', '52', 'YP-国药控股北京有限公司药品分公司', null, null, null, null, null, null, null, 'YPgykgbjyxgsypfgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7256', '53', 'HNPAJT-河南飘安集团有限公司', null, null, null, null, null, null, null, 'HNPAJThnpajtyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7257', '54', 'SCYDCY-四川远大蜀阳药业有限公司', null, null, null, null, null, null, null, 'SCYDCYscydsyyyyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7258', '55', 'ADF-深圳安多福实业发展有限公司', null, null, null, null, null, null, null, 'ADFszadfsyfzyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7259', '56', 'XXSHKW-新乡市华康卫材有限公司', null, null, null, null, null, null, null, 'XXSHKWxxshkwcyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7260', '57', 'XXSHXW-新乡市华西卫材有限公司', null, null, null, null, null, null, null, 'XXSHXWxxshxwcyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7261', '58', 'ZGYXKX-中国医学科学院肿瘤医院', null, null, null, null, null, null, null, 'ZGYXKXzgyxkxyzlyy', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7262', '59', 'TYMKYY-通用美康医药有限公司', null, null, null, null, null, null, null, 'TYMKYYtymkyyyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7263', '60', 'DWMY-中国医药对外贸易总公司销售分公司', null, null, null, null, null, null, null, 'DWMYzgyydwmyzgsxsfgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7264', '61', 'YYGY-中国医药工业有限公司', null, null, null, null, null, null, null, 'YYGYzgyygyyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7265', '62', '北京贝尔达科技发展公司', null, null, null, null, null, null, null, 'bjbedkjfzgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7266', '63', '北京北方光电有限公司', null, null, null, null, null, null, null, 'bjbfgdyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7267', '64', 'GZBJBJ-北京邦杰康普科贸有限公司', null, null, null, null, null, null, null, 'GZBJBJbjbjkpkmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7268', '66', '北京医药股份有限公司医疗器械公司', null, null, null, null, null, null, null, 'bjyygfyxgsylqxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7269', '68', '重庆永通信息工程公司', null, null, null, null, null, null, null, 'zqytxxgcgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7270', '69', '北京得尔贝经贸公司', null, null, null, null, null, null, null, 'bjdebjmgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7271', '70', '北京东方信恒科技发展有限公司', null, null, null, null, null, null, null, 'bjdfxhkjfzyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7272', '71', '北京东华原医疗设备公司', null, null, null, null, null, null, null, 'bjdhyylsbgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7273', '72', 'bjfph-北京市富平和文化用品经营部', null, null, null, null, null, null, null, 'bjfphbjsfphwhypjyb', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7274', '73', '北京国力泰医疗器械公司', null, null, null, null, null, null, null, 'bjgltylqxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7275', '74', '国药集团北京医疗器械公司', null, null, null, null, null, null, null, 'gyjtbjylqxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7276', '76', 'GZBJHN-北京昊诺斯科技有限公司', null, null, null, null, null, null, null, 'GZBJHNbjhnskjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7277', '77', '北京华瑞世纪科技有限公司', null, null, null, null, null, null, null, 'bjhrsjkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7278', '78', '杭州嘉益医疗器械有限公司北京分公司', null, null, null, null, null, null, null, 'hzjyylqxyxgsbjfgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7279', '79', '北京华正鸣泽信息技术公司', null, null, null, null, null, null, null, 'bjhzmzxxjsgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7280', '80', '北京金宝光华医疗器械有限公司', null, null, null, null, null, null, null, 'bjjbghylqxyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7281', '81', 'GZBJJD-北京京东科技有限公司', null, null, null, null, null, null, null, 'GZBJJDbjjdkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7282', '82', '北京健康广济公司', null, null, null, null, null, null, null, 'bjjkgjgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7283', '83', '北京金新亚科技有限公司', null, null, null, null, null, null, null, 'bjjxykjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7284', '84', '北京科佳诚科技发展有限公司', null, null, null, null, null, null, null, 'bjkjckjfzyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7285', '85', '北京康莱乐医疗器械有限公司', null, null, null, null, null, null, null, 'bjkllylqxyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7286', '86', 'GZBJLA-北京龙安医学技术开发公司', null, null, null, null, null, null, null, 'GZBJLAbjlayxjskfgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7287', '87', '北京利文商贸公司', null, null, null, null, null, null, null, 'bjlwsmgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7288', '88', '北京六一仪器厂', null, null, null, null, null, null, null, 'bjlyyqc', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7289', '89', '北京麦迪锦诚医疗器械公司', null, null, null, null, null, null, null, 'bjmdjcylqxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7290', '90', '北京南合西有限公司', null, null, null, null, null, null, null, 'bjnhxyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7291', '91', '北京瑞迈商贸中心', null, null, null, null, null, null, null, 'bjrmsmzx', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7292', '92', '北京瑞康华科技发展中心', null, null, null, null, null, null, null, 'bjrkhkjfzzx', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7293', '93', '北京三明益康医疗器械公司', null, null, null, null, null, null, null, 'bjsmykylqxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7294', '94', '深圳赛得立公司', null, null, null, null, null, null, null, 'szsdlgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7295', '95', '天津开发区合普工贸有限公司', null, null, null, null, null, null, null, 'tjkfqhpgmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7296', '96', '桐庐康基伟业医疗器械公司', null, null, null, null, null, null, null, 'tlkjwyylqxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7297', '97', '北京鑫荣腾飞商贸公司', null, null, null, null, null, null, null, 'bjxrtfsmgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7298', '98', '北京鑫四环消毒技术公司', null, null, null, null, null, null, null, 'bjxshxdjsgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7299', '99', '北京鑫舒康医疗设备有限公司', null, null, null, null, null, null, null, 'bjxskylsbyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7300', '100', '北京原平皓生物技术公司', null, null, null, null, null, null, null, 'bjyphswjsgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7301', '101', '北京元业伯乐科技发展公司', null, null, null, null, null, null, null, 'bjyyblkjfzgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7302', '102', '北京中广润通电子技术公司', null, null, null, null, null, null, null, 'bjzgrtdzjsgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7303', '103', '北京中广润通电子技术有限公司', null, null, null, null, null, null, null, 'bjzgrtdzjsyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7304', '104', '北京德泉科技发展公司', null, null, null, null, null, null, null, 'bjdqkjfzgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7305', '105', '北京晶和力科贸有限公司', null, null, null, null, null, null, null, 'bjjhlkmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7306', '106', '北京诚志华嘉科技有限公司', null, null, null, null, null, null, null, 'bjczhjkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7307', '107', '北京东丰中鸿科研仪器有限公司', null, null, null, null, null, null, null, 'bjdfzhkyyqyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7308', '108', '北京东胜创新生物科技有限公司', null, null, null, null, null, null, null, 'bjdscxswkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7309', '109', '北京国力泰医疗器械有限公司', null, null, null, null, null, null, null, 'bjgltylqxyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7310', '110', '北京恒三江仪器销售公司', null, null, null, null, null, null, null, 'bjhsjyqxsgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7311', '111', '北京市华信医疗电子设备公司', null, null, null, null, null, null, null, 'bjshxyldzsbgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7312', '112', '北京若华医疗器械有限公司', null, null, null, null, null, null, null, 'bjrhylqxyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7313', '113', '上海卡利博有限公司', null, null, null, null, null, null, null, 'shklbyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7314', '114', '上海泰莱医疗器械有限公司', null, null, null, null, null, null, null, 'shtlylqxyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7315', '115', '北京毅力永医疗器械有限公司', null, null, null, null, null, null, null, 'bjylyylqxyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7316', '116', '北京中润汇宝科技有限公司', null, null, null, null, null, null, null, 'bjzrhbkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7317', '117', 'GZBJZR-北京中润伟业投资有限公司', null, null, null, null, null, null, null, 'GZBJZRbjzrwytzyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7318', '118', '北京泰康弘达科贸有限公司', null, null, null, null, null, null, null, 'bjtkhdkmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7319', '119', 'xdbt-北京现代百泰科技有限公司', null, null, null, null, null, null, null, 'xdbtbjxdbtkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7320', '120', '北京英科创业科贸有限公司', null, null, null, null, null, null, null, 'bjykcykmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7321', '121', '烟台澳斯邦生物工程有限公司', null, null, null, null, null, null, null, 'ytasbswgcyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7322', '122', '珠海和佳医疗设备公司', null, null, null, null, null, null, null, 'zhhjylsbgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7323', '123', '北京东华原医疗设备有限公司', null, null, null, null, null, null, null, 'bjdhyylsbyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7324', '124', '北京德泉兴业商贸有限公司', null, null, null, null, null, null, null, 'bjdqxysmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7325', '125', '北京福宏达商贸中心', null, null, null, null, null, null, null, 'bjfhdsmzx', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7326', '126', '北京光电联众医疗器械有限公司', null, null, null, null, null, null, null, 'bjgdlzylqxyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7327', '127', '国药集团北京医疗器械有限公司', null, null, null, null, null, null, null, 'gyjtbjylqxyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7328', '128', '北京海慧信息科技有限公司', null, null, null, null, null, null, null, 'bjhhxxkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7329', '129', '北京华瑞世纪科技公司', null, null, null, null, null, null, null, 'bjhrsjkjgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7330', '130', '北京鸿瑞兴生物技术发展公司', null, null, null, null, null, null, null, 'bjhrxswjsfzgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7331', '131', '杭州嘉益医疗器械公司北京分公司', null, null, null, null, null, null, null, 'hzjyylqxgsbjfgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7332', '132', '北京金宝光华医疗器械公司', null, null, null, null, null, null, null, 'bjjbghylqxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7333', '133', '北京利嘉诚医疗器械有限公司', null, null, null, null, null, null, null, 'bjljcylqxyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7334', '134', '北京欧尼森公司', null, null, null, null, null, null, null, 'bjonsgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7335', '135', 'GZBJQX-北京启信科仪贸易有限公司', null, null, null, null, null, null, null, 'GZBJQXbjqxkymyyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7336', '136', '北京胜德伟业机电设备有限公司', null, null, null, null, null, null, null, 'bjsdwyjdsbyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7337', '137', '北京思路高公司', null, null, null, null, null, null, null, 'bjslggs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7338', '138', '北京五洲新桥科技发展公司', null, null, null, null, null, null, null, 'bjwzxqkjfzgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7339', '139', '北京西凯华科贸有限公司', null, null, null, null, null, null, null, 'bjxkhkmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7340', '140', '北京中美嘉盛科技有限公司', null, null, null, null, null, null, null, 'bjzmjskjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7341', '141', '北京网鼎系统集成有限公司', null, null, null, null, null, null, null, 'bjwdxtjcyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7342', '142', 'GZBJJA-北京洁安高科医疗器械有限公司', null, null, null, null, null, null, null, 'GZBJJAbjjagkylqxyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7343', '143', 'GZBJMZ-北京美众昌盛医疗器械有限公司', null, null, null, null, null, null, null, 'GZBJMZbjmzcsylqxyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7344', '144', 'GZWMTR-未名天人中药有限公司', null, null, null, null, null, null, null, 'GZWMTRwmtrzyyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7345', '145', 'GZXYDY-协宇东盈医疗科技北京有限公司', null, null, null, null, null, null, null, 'GZXYDYxydyylkjbjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7346', '146', 'GZBJDFSG-北京东方双冠科技有限公司', null, null, null, null, null, null, null, 'GZBJDFSGbjdfsgkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7347', '147', 'GZBJQQJJ-北京鉴清洁净科技有限责任公司', null, null, null, null, null, null, null, 'GZBJQQJJbjjqjjkjyxzrgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7348', '148', 'GZSHMT-上海美太医疗设备有限公司', null, null, null, null, null, null, null, 'GZSHMTshmtylsbyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7349', '149', 'GZBJCS-北京昌盛医学技术有限公司', null, null, null, null, null, null, null, 'GZBJCSbjcsyxjsyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7350', '150', '北京健德联合口腔医疗设备有限公司', null, null, null, null, null, null, null, 'bjjdlhkqylsbyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7351', '151', 'GZBJTP-北京拓普康商贸有限公司', null, null, null, null, null, null, null, 'GZBJTPbjtpksmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7352', '152', 'GZJSHS-江苏海狮机械集团有限公司', null, null, null, null, null, null, null, 'GZJSHSjshsjxjtyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7353', '153', 'GZSZHP-深圳市普华康健投资有限公司', null, null, null, null, null, null, null, 'GZSZHPszsphkjtzyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7354', '154', 'GZBJDHHC-北京东华合创数码科技股份有限公司', null, null, null, null, null, null, null, 'GZBJDHHCbjdhhcsmkjgfyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7355', '155', 'GZJDMY-洁定贸易上海有限公司', null, null, null, null, null, null, null, 'GZJDMYjdmyshyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7356', '156', 'GZBJNT-北京能通万维网络科技有限公司', null, null, null, null, null, null, null, 'GZBJNTbjntwwwlkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7357', '157', 'GZBJXSE-北京西士尔商贸有限公司', null, null, null, null, null, null, null, 'GZBJXSEbjxsesmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7358', '158', 'GZBJSOT-北京思奥特科技发展有限公司', null, null, null, null, null, null, null, 'GZBJSOTbjsatkjfzyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7359', '159', 'GZBJOMSJ-北京欧迈世纪科技有限公司', null, null, null, null, null, null, null, 'GZBJOMSJbjomsjkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7360', '160', 'GZSHTD-上海泰德医疗器械有限公司', null, null, null, null, null, null, null, 'GZSHTDshtdylqxyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7361', '161', 'GZZGWT-中国网通集团系统集成有限公司', null, null, null, null, null, null, null, 'GZZGWTzgwtjtxtjcyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7362', '162', 'GZBJJBL-北京健百乐科技发展中心', null, null, null, null, null, null, null, 'GZBJJBLbjjblkjfzzx', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7363', '163', 'GZBJZTSQ-北京中天双屹环保科技有限公司', null, null, null, null, null, null, null, 'GZBJZTSQbjztsyhbkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7364', '164', 'GZBJJLCY-北京嘉联诚业医疗器械销售有限公司', null, null, null, null, null, null, null, 'GZBJJLCYbjjlcyylqxxsyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7365', '165', 'GZBJGSYW-北京高视远望科技有限责任公司', null, null, null, null, null, null, null, 'GZBJGSYWbjgsywkjyxzrgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7366', '166', 'GZSHLR-上海灵锐医疗器械有限公司', null, null, null, null, null, null, null, 'GZSHLRshlrylqxyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7367', '167', 'GZSHKL-上海科林医疗仪器技术有限公司', null, null, null, null, null, null, null, 'GZSHKLshklylyqjsyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7368', '168', 'GZBJJD-北京健德联合口腔医疗有限公司', null, null, null, null, null, null, null, 'GZBJJDbjjdlhkqylyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7369', '169', 'GZBJSM-北京圣曼医疗器材技术有限公司', null, null, null, null, null, null, null, 'GZBJSMbjsmylqcjsyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7370', '170', 'GZBJSJ-北京圣迦天润科技发展有限公司', null, null, null, null, null, null, null, 'GZBJSJbjsjtrkjfzyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7371', '171', 'GZBJDFRO-北京东方瑞澳医疗设备有限公司', null, null, null, null, null, null, null, 'GZBJDFRObjdfraylsbyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7372', '172', 'GZBJDNYD-北京东南悦达医疗器械有限公司', null, null, null, null, null, null, null, 'GZBJDNYDbjdnydylqxyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7373', '173', 'GZBJBR-北京巴瑞医疗器械有限公司', null, null, null, null, null, null, null, 'GZBJBRbjbrylqxyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7374', '174', 'GZBJZX-北京执信阳光医疗科技有限公司', null, null, null, null, null, null, null, 'GZBJZXbjzxygylkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7375', '175', 'GZBJCT-北京京朝腾微医学科技有限公司', null, null, null, null, null, null, null, 'GZBJCTbjjctwyxkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7376', '176', 'GZBJSKX-北京赛科希德科技发展有限公司', null, null, null, null, null, null, null, 'GZBJSKXbjskxdkjfzyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7377', '177', 'GZBJLP-北京乐普医疗器械有限公司', null, null, null, null, null, null, null, 'GZBJLPbjlpylqxyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7378', '178', 'GZBJHSJ-北京恒三江仪器销售有限公司', null, null, null, null, null, null, null, 'GZBJHSJbjhsjyqxsyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7379', '179', 'GZBJTPY-北京平利洋医疗设备有限公司', null, null, null, null, null, null, null, 'GZBJTPYbjplyylsbyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7380', '180', 'GZBJSJ-北京世纪凯盈科学仪器有限公司', null, null, null, null, null, null, null, 'GZBJSJbjsjkykxyqyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7381', '181', 'GZBJOBT-北京欧比特仪器有限公司', null, null, null, null, null, null, null, 'GZBJOBTbjobtyqyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7382', '182', 'GZBJJH-北京嘉和美康医用设备有限公司', null, null, null, null, null, null, null, 'GZBJJHbjjhmkyysbyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7383', '183', 'GZBJLJ-北京利嘉诚医药科技有限公司', null, null, null, null, null, null, null, 'GZBJLJbjljcyykjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7384', '184', 'GZBJKY-北京科园信海医药经营有限公司', null, null, null, null, null, null, null, 'GZBJKYbjkyxhyyjyyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7385', '185', 'GZBJGY-北京国药中北器械有限公司', null, null, null, null, null, null, null, 'GZBJGYbjgyzbqxyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7386', '186', 'GZBJBL-北京佰利申科贸有限公司', null, null, null, null, null, null, null, 'GZBJBLbjblskmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7387', '187', 'GZBJBL-北京博劢行仪器有限公司', null, null, null, null, null, null, null, 'GZBJBLbjbmxyqyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7388', '188', 'GZBJWF-北京万丰大成科学仪器有限公司', null, null, null, null, null, null, null, 'GZBJWFbjwfdckxyqyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7389', '189', 'GZZGYY-中国医药对外贸易公司', null, null, null, null, null, null, null, 'GZZGYYzgyydwmygs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7390', '190', 'GZSZDX-深圳德夏科技发展有限公司', null, null, null, null, null, null, null, 'GZSZDXszdxkjfzyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7391', '191', 'GZZGKX-中国科学器材进出口总公司', null, null, null, null, null, null, null, 'GZZGKXzgkxqcjckzgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7392', '192', 'GZBJJL-北京嘉力恒业国际贸易有限公司', null, null, null, null, null, null, null, 'GZBJJLbjjlhygjmyyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7393', '193', 'GZBJCM-北京诚茂兴业科技发展有限公司', null, null, null, null, null, null, null, 'GZBJCMbjcmxykjfzyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7394', '194', 'GZBJJC-北京检测仪器有限公司', null, null, null, null, null, null, null, 'GZBJJCbjjcyqyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7395', '195', 'GZBJYY-北京元业伯乐科技发展有限公司', null, null, null, null, null, null, null, 'GZBJYYbjyyblkjfzyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7396', '196', 'GZBJXH-北京信鸿汇天医疗技术开发有限公司', null, null, null, null, null, null, null, 'GZBJXHbjxhhtyljskfyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7397', '197', 'GZBJTD-北京铁电通技术开发中心', null, null, null, null, null, null, null, 'GZBJTDbjtdtjskfzx', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7398', '198', 'GZRSG-瑞仕格上海商贸有限公司', null, null, null, null, null, null, null, 'GZRSGrsgshsmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7399', '199', 'GZBJYS-北京英硕力新柏科技有限公司', null, null, null, null, null, null, null, 'GZBJYSbjyslxbkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7400', '200', 'GZGYJT-国药集团联合医疗器械有限公司', null, null, null, null, null, null, null, 'GZGYJTgyjtlhylqxyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7401', '201', 'GZBJSQ-北京世奇康商贸有限责任公司', null, null, null, null, null, null, null, 'GZBJSQbjsqksmyxzrgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7402', '202', 'GZBJPR-北京普瑞亚科技有限公司', null, null, null, null, null, null, null, 'GZBJPRbjprykjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7403', '203', 'GZBJZT-北京周天华枫医疗仪器有限公司', null, null, null, null, null, null, null, 'GZBJZTbjzthfylyqyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7404', '204', 'GZBJMK-北京美康百泰医药科技有限公司', null, null, null, null, null, null, null, 'GZBJMKbjmkbtyykjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7405', '205', 'GZBJWY-北京唯医静化机电设备有限公司', null, null, null, null, null, null, null, 'GZBJWYbjwyjhjdsbyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7406', '206', 'GZBJPD-北京普德鸿医学技术有限公司', null, null, null, null, null, null, null, 'GZBJPDbjpdhyxjsyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7407', '207', 'GZBJKD-北京康德威医疗设备有限公司', null, null, null, null, null, null, null, 'GZBJKDbjkdwylsbyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7408', '208', 'GZNBSD-宁波圣达精工实业有限公司', null, null, null, null, null, null, null, 'GZNBSDnbsdjgsyyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7409', '209', 'GZBJHZ-北京弘舟广际科贸公司', null, null, null, null, null, null, null, 'GZBJHZbjhzgjkmgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7410', '210', 'GZBJAT-北京康拓医疗仪器有限公司', null, null, null, null, null, null, null, 'GZBJATbjktylyqyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7411', '211', 'GZBJKL-北京快乐一然科技有限公司', null, null, null, null, null, null, null, 'GZBJKLbjklyrkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7412', '212', 'CSHGYS-初始化供应商', null, null, null, null, null, null, null, 'CSHGYScshgys', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7413', '215', '山东威高集团北京销售分公司', null, null, null, null, null, null, null, 'sdwgjtbjxsfgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7414', '216', '北京市科护医疗器材有限公司', null, null, null, null, null, null, null, 'bjskhylqcyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7415', '217', '北京仁合康盛医疗用品有限公司', null, null, null, null, null, null, null, 'bjrhksylypyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7416', '218', '北京瑞金斯科技有限公司', null, null, null, null, null, null, null, 'bjrjskjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7417', '219', '北京健康广济医用品有限公司', null, null, null, null, null, null, null, 'bjjkgjyypyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7418', '220', '南京微创', null, null, null, null, null, null, null, 'njwc', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7419', '221', '天津哈娜好医材有限公司', null, null, null, null, null, null, null, 'tjhnhycyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7420', '222', '北京宜安泰医疗技术开发有限公司', null, null, null, null, null, null, null, 'bjyatyljskfyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7421', '223', '北京美高牙科医疗器材有限责任公司', null, null, null, null, null, null, null, 'bjmgykylqcyxzrgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7422', '224', '普德鸿医学技术有限公司', null, null, null, null, null, null, null, 'pdhyxjsyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7423', '225', '北京市思创新医疗用品有限责任公司', null, null, null, null, null, null, null, 'bjsscxylypyxzrgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7424', '226', '浙江拱东', null, null, null, null, null, null, null, 'zjgd', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7425', '227', '北京锐康麦德科技有限公司', null, null, null, null, null, null, null, 'bjrkmdkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7426', '228', '北京德凯利康商贸有限公司', null, null, null, null, null, null, null, 'bjdklksmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7427', '229', '北京欣复春医药科技有限公司', null, null, null, null, null, null, null, 'bjxfcyykjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7428', '230', '健康广济', null, null, null, null, null, null, null, 'jkgj', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7429', '231', '美高牙科', null, null, null, null, null, null, null, 'mgyk', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7430', '232', '朗健嘉德', null, null, null, null, null, null, null, 'ljjd', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7431', '233', '珠海市弘科医疗设备有限公司', null, null, null, null, null, null, null, 'zhshkylsbyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7432', '234', '福宏达商贸中心', null, null, null, null, null, null, null, 'fhdsmzx', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7433', '235', '北京贝尔生物工程', null, null, null, null, null, null, null, 'bjbeswgc', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7434', '236', '北京豪迈之星生物技术', null, null, null, null, null, null, null, 'bjhmzxswjs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7435', '237', '北京华天泽宇医疗器械有限公司', null, null, null, null, null, null, null, 'bjhtzyylqxyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7436', '238', '北京健峰生物技术有限公司', null, null, null, null, null, null, null, 'bjjfswjsyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7437', '239', '北京健伦商贸公司', null, null, null, null, null, null, null, 'bjjlsmgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7438', '240', '北京康思达睿科贸有限公司', null, null, null, null, null, null, null, 'bjksdrkmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7439', '241', '北京莱帮生物技术有限公司', null, null, null, null, null, null, null, 'bjlbswjsyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7440', '242', '北京兰野医学科技中心', null, null, null, null, null, null, null, 'bjlyyxkjzx', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7441', '243', '北京利文商贸有限公司', null, null, null, null, null, null, null, 'bjlwsmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7442', '244', '北京欧蒙生物技术有限公司', null, null, null, null, null, null, null, 'bjomswjsyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7443', '245', '北京普力文科贸有限公司', null, null, null, null, null, null, null, 'bjplwkmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7444', '246', '北京燃烽医药有限责任公司', null, null, null, null, null, null, null, 'bjrfyyyxzrgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7445', '247', '北京探针生物技术有限公司', null, null, null, null, null, null, null, 'bjtzswjsyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7446', '248', '北京中德利德曼科技有限公司', null, null, null, null, null, null, null, 'bjzdldmkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7447', '249', '北京中盛兴华贸易中心', null, null, null, null, null, null, null, 'bjzsxhmyzx', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7448', '250', '北京中天成业生物技术有限公司', null, null, null, null, null, null, null, 'bjztcyswjsyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7449', '251', '丽珠医学', null, null, null, null, null, null, null, 'lzyx', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7450', '252', '上海长岛抗体诊断试剂有限公司', null, null, null, null, null, null, null, 'shzdktzdsjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7451', '253', '上海科华生物工程股份有限公司', null, null, null, null, null, null, null, 'shkhswgcgfyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7452', '254', '天合力恩', null, null, null, null, null, null, null, 'thle', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7453', '255', '万华普曼生物工程有限公司', null, null, null, null, null, null, null, 'whpmswgcyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7454', '256', '北京奥普瑞兴医疗器械有限责任公司', null, null, null, null, null, null, null, 'bjaprxylqxyxzrgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7455', '257', '北京福视康华科技发展有限责任公司', null, null, null, null, null, null, null, 'bjfskhkjfzyxzrgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7456', '259', 'BJLPYLQXYXGS-北京蓝牌医疗器械有限公司', null, null, null, null, null, null, null, 'BJLPYLQXYXGSbjlpylqxyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7457', '262', '北京世纪长科商贸有限公司', null, null, null, null, null, null, null, 'bjsjzksmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7458', '264', '泉辉和奕医疗器械有限公司', null, null, null, null, null, null, null, 'qhhyylqxyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7459', '266', 'BJWRZY-北京卫仁中药饮片厂', null, null, null, null, null, null, null, 'BJWRZYbjwrzyypc', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7460', '267', 'BJHMZY-北京华邈中药工程技术开发中心', null, null, null, null, null, null, null, 'BJHMZYbjhmzygcjskfzx', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7461', '268', 'GZZGWT-中国网通(集团)有限公司北京市分公司', null, null, null, null, null, null, null, 'GZZGWTzgwtjtyxgsbjsfgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7462', '269', 'GZBJZDXF-北京中电兴发科技有限公司', null, null, null, null, null, null, null, 'GZBJZDXFbjzdxfkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7176', '8', '彭州市投资促进局', null, '管理员', null, null, null, '1.0', null, '1', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7463', '270', 'GZTJHF-天津市海风联合科技有限公司', null, null, null, null, null, null, null, 'GZTJHFtjshflhkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7178', '10', '彭州市司法局', null, '管理员', null, null, null, '1.0', null, '1', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7464', '271', 'GZMDS-北京麦德森医疗器械销售中心', null, null, null, null, null, null, null, 'GZMDSbjmdsylqxxszx', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7180', '11', '彭州市国土资源局', null, '助理工程师', null, null, null, '2.0', null, '2', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7181', '12', '彭州市发展和改革局', null, '管理员', null, null, null, '1.0', null, '2', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7465', '272', 'GZBJAB-北京安博生商贸有限公司', null, null, null, null, null, null, null, 'GZBJABbjabssmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7183', '13', '彭州市工业和科学技术信息化局', null, '技术员', null, null, null, '2.0', null, '2', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7184', '14', '彭州市文体广电新闻出版局', null, '图书管理员', null, null, null, '1.0', null, '2', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7466', '273', 'GZBJKX-北京可喜安医疗科技有限公司', null, null, null, null, null, null, null, 'GZBJKXbjkxaylkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7467', '274', 'GZBJYQ-北京云雀商贸有限责任公司', null, null, null, null, null, null, null, 'GZBJYQbjyqsmyxzrgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7468', '275', 'GZBJTA-北京泰安怡商贸有限公司', null, null, null, null, null, null, null, 'GZBJTAbjtaysmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7188', '15', '彭州市交通运输局', null, '管理员', null, null, null, '1.0', null, '1', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7189', '16', '彭州市农村发展局', null, '农技员', null, null, null, '1.0', null, '1', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7469', '276', 'GZBJJR-北京嘉润利贞科技发展有限公司', null, null, null, null, null, null, null, 'GZBJJRbjjrlzkjfzyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7470', '277', 'GZBJZQ-北京卓青伟业科技有限公司', null, null, null, null, null, null, null, 'GZBJZQbjzqwykjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7192', '17', '彭州市规划管理局', null, '技术员', null, null, null, '1.0', null, '3', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7471', '278', 'GZSHBR-上海倍榕医疗器械有限公司', null, null, null, null, null, null, null, 'GZSHBRshbrylqxyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7472', '279', 'GZBJSM-北京世茂医疗器械贸易有限公司', null, null, null, null, null, null, null, 'GZBJSMbjsmylqxmyyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7195', '18', '彭州市气象局', null, '会计员', null, null, null, '1.0', null, '1', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7196', '19', '彭州市环境保护局', null, '环境保护员', null, null, null, '16.0', null, '16', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7197', '20', '共青团彭州市委', null, '管理员', null, null, null, '1.0', null, '1', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7198', '21', '彭州市人民政府政务服务中心', null, '管理员', null, null, null, '1.0', null, '2', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7473', '280', 'GZBJKY-北京康月达科技有限公司', null, null, null, null, null, null, null, 'GZBJKYbjkydkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7200', '22', '彭州市林业和园林管理局', null, '林业助理工程师', null, null, null, '3.0', null, '3', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7201', '23', '彭州市信访和群众工作局', null, '接待员', null, null, null, '1.0', null, '1', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7474', '281', 'GZBJKW-北京科维永道贸易有限公司', null, null, null, null, null, null, null, 'GZBJKWbjkwydmyyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7475', '282', 'GZBJMC-北京美承互联数码科技发展有限公司', null, null, null, null, null, null, null, 'GZBJMCbjmchlsmkjfzyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7476', '283', 'GZBJZW-北京中网心电信息中心', null, null, null, null, null, null, null, 'GZBJZWbjzwxdxxzx', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7477', '284', 'GZBJDH-北京东华原医疗设备有限责任公司', null, null, null, null, null, null, null, 'GZBJDHbjdhyylsbyxzrgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7478', '285', 'GZTYMK-通用美康医药有限公司', null, null, null, null, null, null, null, 'GZTYMKtymkyyyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7479', '286', 'GZBJJW-北京京卫医疗用品公司', null, null, null, null, null, null, null, 'GZBJJWbjjwylypgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7480', '287', 'GZBJKT-北京康泰宏业科技有限责任公司', null, null, null, null, null, null, null, 'GZBJKTbjkthykjyxzrgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7481', '288', 'GZBJYJ-北京宇进圣心科技有限公司', null, null, null, null, null, null, null, 'GZBJYJbjyjsxkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7482', '289', 'GZBJWL-北京威灵远志科技有限责任公司', null, null, null, null, null, null, null, 'GZBJWLbjwlyzkjyxzrgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7483', '290', 'GZBJKD-北京康德宏贸易发展有限公司', null, null, null, null, null, null, null, 'GZBJKDbjkdhmyfzyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7484', '291', 'GZBJGK-北京国康东胜医疗科技有限公司', null, null, null, null, null, null, null, 'GZBJGKbjgkdsylkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7485', '292', 'GZBJXH-北京信海康医药有限责任公司', null, null, null, null, null, null, null, 'GZBJXHbjxhkyyyxzrgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7486', '293', 'GZBJSE-北京芾尔世达医疗器材有限公司', null, null, null, null, null, null, null, 'GZBJSEbjfesdylqcyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7487', '294', 'GZDLSY-大连三洋冷链有限公司', null, null, null, null, null, null, null, 'GZDLSYdlsyllyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7488', '295', 'GZBJQH-北京泉辉泽惠医疗设备有限公司', null, null, null, null, null, null, null, 'GZBJQHbjqhzhylsbyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7489', '296', 'GZMDSD-麦迪斯顿（北京）医疗科技有限公司', null, null, null, null, null, null, null, 'GZMDSDmdsdbjylkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7490', '297', 'GZBJYY-北京誉远名扬窗饰用品有限公司', null, null, null, null, null, null, null, 'GZBJYYbjyymycsypyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7491', '298', 'GZBJSL-北京圣兰心服装服饰有限责任公司', null, null, null, null, null, null, null, 'GZBJSLbjslxfzfsyxzrgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7492', '299', 'GZBJANM-北京阿尼玛经贸有限公司', null, null, null, null, null, null, null, 'GZBJANMbjanmjmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7493', '300', 'GZBJRT-北京悦泰行科技发展有限公司', null, null, null, null, null, null, null, 'GZBJRTbjytxkjfzyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7494', '301', 'GZBJDEB-北京得尔贝经贸有限公司', null, null, null, null, null, null, null, 'GZBJDEBbjdebjmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7495', '302', 'GZBJDF-北京东方耀华厨房设备有限公司', null, null, null, null, null, null, null, 'GZBJDFbjdfyhcfsbyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7496', '303', 'GZBJSL-北京森雷普实验室设备有限公司', null, null, null, null, null, null, null, 'GZBJSLbjslpsyssbyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7497', '304', 'GZSZZD-深圳市中电电力技术有限公司', null, null, null, null, null, null, null, 'GZSZZDszszddljsyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7498', '305', 'GZTFGF-同方股份有限公司', null, null, null, null, null, null, null, 'GZTFGFtfgfyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7499', '306', 'GZBJGJ-北京光健科技发展有限公司', null, null, null, null, null, null, null, 'GZBJGJbjgjkjfzyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7500', '307', 'GZBJCM-北京创美时代办公家具有限公司', null, null, null, null, null, null, null, 'GZBJCMbjcmsdbgjjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7501', '308', 'GZBJXY-北京翔源博润生物科技有限公司', null, null, null, null, null, null, null, 'GZBJXYbjxybrswkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7502', '309', 'GZZJSO-浙江圣奥家具制造有限公司', null, null, null, null, null, null, null, 'GZZJSOzjsajjzzyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7503', '310', 'GZBJZT-北京志腾飞达科技有限公司', null, null, null, null, null, null, null, 'GZBJZTbjztfdkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7504', '313', 'GZBJTS-北京图书大厦有限责任公司', null, null, null, null, null, null, null, 'GZBJTSbjtsdsyxzrgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7505', '314', 'GZBJRM-北京瑞迈商贸', null, null, null, null, null, null, null, 'GZBJRMbjrmsm', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7506', '315', 'GZBJSYQFT-北京三元桥丰田汽车销售服务中心', null, null, null, null, null, null, null, 'GZBJSYQFTbjsyqftqcxsfwzx', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7507', '316', 'GZBJKL-北京康联医用设备有限公司', null, null, null, null, null, null, null, 'GZBJKLbjklyysbyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7508', '317', 'GZBWHX-北京博望恒信智能系统工程有限公司', null, null, null, null, null, null, null, 'GZBWHXbjbwhxznxtgcyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7509', '318', 'ALKKJ-北京爱乐康科技发展有限公司
', null, null, null, null, null, null, null, 'ALKKJbjalkkjfzyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7510', '319', 'ATKKM-北京爱特康科贸有限责任公司
', null, null, null, null, null, null, null, 'ATKKMbjatkkmyxzrgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7511', '320', 'AQSD-北京安桥斯达医疗器械有限责任公司
', null, null, null, null, null, null, null, 'AQSDbjaqsdylqxyxzrgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7512', '321', 'APRX-北京奥普瑞兴医疗器械有限责任公司
', null, null, null, null, null, null, null, 'APRXbjaprxylqxyxzrgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7513', '322', 'AMYX-北京澳美医信投资顾问有限公司
', null, null, null, null, null, null, null, 'AMYXbjamyxtzgwyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7514', '323', 'BRYL-北京巴瑞医疗器械有限公司
', null, null, null, null, null, null, null, 'BRYLbjbrylqxyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7515', '324', 'BRLE-北京百瑞利恩商贸有限公司
', null, null, null, null, null, null, null, 'BRLEbjbrlesmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7516', '325', 'BLS-北京佰利申科贸有限公司
', null, null, null, null, null, null, null, 'BLSbjblskmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7517', '326', 'BEYY-北京贝恩医药科技开发有限责任公司
', null, null, null, null, null, null, null, 'BEYYbjbeyykjkfyxzrgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7518', '327', 'BESW-北京贝尔生物工程
有限公司', null, null, null, null, null, null, null, 'BESWbjbeswgcyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7519', '328', 'BRXB-北京博瑞祥宝科技有限公司
', null, null, null, null, null, null, null, 'BRXBbjbrxbkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7520', '329', 'CRTX-北京长荣同兴科贸
有限公司', null, null, null, null, null, null, null, 'CRTXbjzrtxkmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7521', '330', 'DKLK-北京德凯利康商贸
有限公司', null, null, null, null, null, null, null, 'DKLKbjdklksmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7522', '331', 'DFSG-北京东方双冠科技有限公司
', null, null, null, null, null, null, null, 'DFSGbjdfsgkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7523', '332', 'DLMD-北京东林麦迪商贸有限公司
', null, null, null, null, null, null, null, 'DLMDbjdlmdsmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7524', '333', 'DNYD-北京东南悦达医疗器械有限公司
', null, null, null, null, null, null, null, 'DNYDbjdnydylqxyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7525', '335', 'GKKJ-北京共康科技发展有限公司
', null, null, null, null, null, null, null, 'GKKJbjgkkjfzyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7526', '336', 'HM-北京豪迈生物工程有限公司
', null, null, null, null, null, null, null, 'HMbjhmswgcyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7527', '337', 'HLDC-北京合力鼎成科贸有限责任公司
', null, null, null, null, null, null, null, 'HLDCbjhldckmyxzrgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7528', '338', 'HRYG-北京和瑞阳光科技有限公司', null, null, null, null, null, null, null, 'HRYGbjhrygkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7529', '339', 'HDPR-北京厚德普瑞科技发展有限公司
', null, null, null, null, null, null, null, 'HDPRbjhdprkjfzyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7530', '340', 'FJYX-北京富江裕新医疗器械
有限公司', null, null, null, null, null, null, null, 'FJYXbjfjyxylqxyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7531', '341', 'HKYL-北京华康永联医疗器械有限公司
', null, null, null, null, null, null, null, 'HKYLbjhkylylqxyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7532', '342', 'HRSJ-北京华瑞世纪科技有限公司
', null, null, null, null, null, null, null, 'HRSJbjhrsjkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7533', '343', 'HTZC-北京华泰志诚科技发展有限公司
', null, null, null, null, null, null, null, 'HTZCbjhtzckjfzyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7534', '344', 'HXZH-北京华旭众和科贸有限公司
', null, null, null, null, null, null, null, 'HXZHbjhxzhkmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7535', '345', 'HEL-北京慧而朗商贸有限公司
', null, null, null, null, null, null, null, 'HELbjhelsmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7536', '346', 'JYJM-北京嘉洋经贸有限公司
', null, null, null, null, null, null, null, 'JYJMbjjyjmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7537', '347', 'JDXQ-北京京大西秦医疗仪器有限公司
', null, null, null, null, null, null, null, 'JDXQbjjdxqylyqyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7538', '348', 'JF-北京健峰生物技术有限公司
', null, null, null, null, null, null, null, 'JFbjjfswjsyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7539', '349', 'JKGJ-北京健康广济医用品有限公司
', null, null, null, null, null, null, null, 'JKGJbjjkgjyypyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7121', '3', '兰州远方药业', null, null, null, null, null, null, null, 'lzyfyy', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7141', '广西金嗓子', '广西金嗓子', null, null, null, null, null, null, null, 'gxjsz', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7142', '武汉建民', '武汉建民', null, null, null, null, null, null, null, 'whjm', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7540', '350', 'JDYR-北京金迪盈润医疗器械有限公司
', null, null, null, null, null, null, null, 'JDYRbjjdyrylqxyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7541', '351', 'KHY-北京康晖煜科技有限公司
', null, null, null, null, null, null, null, 'KHYbjkhykjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7542', '352', 'KYD-北京康月达科技有限公司
', null, null, null, null, null, null, null, 'KYDbjkydkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7543', '353', 'LB-北京莱帮生物技术有限公司
', null, null, null, null, null, null, null, 'LBbjlbswjsyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7544', '354', 'LY-北京兰野医学科技中心
', null, null, null, null, null, null, null, 'LYbjlyyxkjzx', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7545', '355', 'LP-北京蓝牌医疗器械有限公司
', null, null, null, null, null, null, null, 'LPbjlpylqxyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7546', '356', 'LJJD-北京朗健嘉德科贸有限公司
', null, null, null, null, null, null, null, 'LJJDbjljjdkmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7547', '357', 'LS-北京朗申科技有限公司
', null, null, null, null, null, null, null, 'LSbjlskjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7548', '358', 'LW-北京利文商贸有限公司
', null, null, null, null, null, null, null, 'LWbjlwsmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7549', '359', 'LSSC-北京龙胜世创科贸有限公司
', null, null, null, null, null, null, null, 'LSSCbjlssckmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7550', '360', 'MKT-北京玛珂特医疗设备销售有限公司
', null, null, null, null, null, null, null, 'MKTbjmktylsbxsyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7551', '361', 'MDWE-北京迈迪维尔医疗器械有限公司
', null, null, null, null, null, null, null, 'MDWEbjmdweylqxyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7552', '362', 'MDJC-北京麦迪锦诚医疗器械有限责任公司
', null, null, null, null, null, null, null, 'MDJCbjmdjcylqxyxzrgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7553', '363', 'MDXT-北京美迪信泰商贸有限公司
', null, null, null, null, null, null, null, 'MDXTbjmdxtsmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7554', '364', 'MGYK-北京美高牙科医疗器材有限责任公司
', null, null, null, null, null, null, null, 'MGYKbjmgykylqcyxzrgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7555', '365', 'MKBT-北京美康百泰医药科技有限公司
', null, null, null, null, null, null, null, 'MKBTbjmkbtyykjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7556', '366', 'OM-北京欧蒙生物
技术有限公司', null, null, null, null, null, null, null, 'OMbjomswjsyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7557', '367', 'PHYT-北京市普华永泰科技发展有限责任公司
', null, null, null, null, null, null, null, 'PHYTbjsphytkjfzyxzrgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7558', '368', 'PLW-北京普力文科贸有限公司
', null, null, null, null, null, null, null, 'PLWbjplwkmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7559', '369', 'QLJ-北京千里及科贸有限责任公司
', null, null, null, null, null, null, null, 'QLJbjqljkmyxzrgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7560', '370', 'QCKJ-北京勤诚科技发展中心
', null, null, null, null, null, null, null, 'QCKJbjqckjfzzx', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7561', '371', 'QG-北京勤耕医疗器械有限公司
', null, null, null, null, null, null, null, 'QGbjqgylqxyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7562', '372', 'QHX-北京泉晖新商贸有限公司
', null, null, null, null, null, null, null, 'QHXbjqhxsmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7563', '373', 'QHHY-北京泉辉和奕医疗器械有限公司
', null, null, null, null, null, null, null, 'QHHYbjqhhyylqxyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7564', '374', 'RF-北京燃烽医药有限责任公司
', null, null, null, null, null, null, null, 'RFbjrfyyyxzrgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7565', '375', 'RHKS-北京仁合康盛医疗用品有限公司
', null, null, null, null, null, null, null, 'RHKSbjrhksylypyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7566', '376', 'RKMD-北京锐康麦德科技有限公司
', null, null, null, null, null, null, null, 'RKMDbjrkmdkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7567', '377', 'RJS-北京瑞金斯科技有限公司
', null, null, null, null, null, null, null, 'RJSbjrjskjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7568', '378', 'RMSM-北京瑞迈商贸中心
', null, null, null, null, null, null, null, 'RMSMbjrmsmzx', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7569', '379', 'SZHY-北京神州宏宇科技
有限公司', null, null, null, null, null, null, null, 'SZHYbjszhykjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7570', '380', 'SAK-北京晟安康医疗器械中心
', null, null, null, null, null, null, null, 'SAKbjsakylqxzx', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7571', '381', 'SXY-北京盛翔远科贸有限公司
', null, null, null, null, null, null, null, 'SXYbjsxykmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7572', '382', 'SJCK-北京世纪长科商贸有限公司
', null, null, null, null, null, null, null, 'SJCKbjsjzksmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7573', '383', 'SJXS-北京世纪兴盛科技有限公司
', null, null, null, null, null, null, null, 'SJXSbjsjxskjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7574', '384', 'KHYL-北京市科护医疗器材有限公司
', null, null, null, null, null, null, null, 'KHYLbjskhylqcyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7575', '385', 'LY-北京市六一仪器厂
', null, null, null, null, null, null, null, 'LYbjslyyqc', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7576', '386', 'MY-北京市密云县益康卫生材料厂
', null, null, null, null, null, null, null, 'MYbjsmyxykwsclc', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7577', '387', 'PC-北京市普慈医疗技术有限公司
', null, null, null, null, null, null, null, 'PCbjspcyljsyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7578', '389', 'SCX-北京市思创新医疗用品有限责任公司
', null, null, null, null, null, null, null, 'SCXbjsscxylypyxzrgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7579', '390', 'THKJ-北京市潭河科技开发中心
', null, null, null, null, null, null, null, 'THKJbjsthkjkfzx', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7580', '391', 'TST-北京泰士特商贸有限公司
', null, null, null, null, null, null, null, 'TSTbjtstsmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7581', '392', 'TZSW-北京探针生物技术有限公司
', null, null, null, null, null, null, null, 'TZSWbjtzswjsyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7582', '393', 'TSHC-北京天时恒创科技发展有限公司
', null, null, null, null, null, null, null, 'TSHCbjtshckjfzyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7583', '395', 'TYKD-北京天缘康达医用仪器
', null, null, null, null, null, null, null, 'TYKDbjtykdyyyq', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7584', '396', 'WTK-北京威泰科生物技术有限公司
', null, null, null, null, null, null, null, 'WTKbjwtkswjsyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7585', '397', 'XQD-北京先起迪科技发展有限公司
', null, null, null, null, null, null, null, 'XQDbjxqdkjfzyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7586', '398', 'XSKJ-北京向上科技发展有限责任公司
', null, null, null, null, null, null, null, 'XSKJbjxskjfzyxzrgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7587', '399', 'XSX-北京协顺祥医疗科技有限公司
', null, null, null, null, null, null, null, 'XSXbjxsxylkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7588', '400', 'XDJC-北京新达精诚科贸有限公司
', null, null, null, null, null, null, null, 'XDJCbjxdjckmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7589', '401', 'XLF-北京欣隆福医药销售有限公司
', null, null, null, null, null, null, null, 'XLFbjxlfyyxsyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7590', '402', 'XNHH-北京鑫诺汇亨科技发展
有限公司', null, null, null, null, null, null, null, 'XNHHbjxnhhkjfzyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7591', '403', 'XRX-北京鑫瑞祥商贸有限责任公司
', null, null, null, null, null, null, null, 'XRXbjxrxsmyxzrgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7592', '404', 'YAT-北京宜安泰医疗技术开发有限公司
', null, null, null, null, null, null, null, 'YATbjyatyljskfyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7593', '405', 'YSLX-北京英硕力新柏科技有限公司
', null, null, null, null, null, null, null, 'YSLXbjyslxbkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7594', '406', 'YLJX-北京益利精细化学品
有限公司', null, null, null, null, null, null, null, 'YLJXbjyljxhxpyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7595', '407', 'YYBL-北京元业伯乐科技
发展有限公司', null, null, null, null, null, null, null, 'YYBLbjyyblkjfzyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7596', '408', 'YPH-北京原平皓生物技术有限公司
', null, null, null, null, null, null, null, 'YPHbjyphswjsyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7597', '409', 'ZPKJ-北京泽平科技有限责任公司
', null, null, null, null, null, null, null, 'ZPKJbjzpkjyxzrgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7598', '410', 'ZXYG-北京执信阳光医疗科技有限公司
', null, null, null, null, null, null, null, 'ZXYGbjzxygylkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7599', '411', 'ZRKJ-北京志荣科技发展有限公司
', null, null, null, null, null, null, null, 'ZRKJbjzrkjfzyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7600', '412', 'LDM-北京中德利德曼科技有限公司
', null, null, null, null, null, null, null, 'LDMbjzdldmkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7601', '413', 'ZKZX-北京中科执信医疗设备有限公司
', null, null, null, null, null, null, null, 'ZKZXbjzkzxylsbyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7602', '414', 'ZTCY-北京中天成业生物技术有限公司
', null, null, null, null, null, null, null, 'ZTCYbjztcyswjsyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7603', '415', 'ZTSH-北京中天四海商贸有限公司
', null, null, null, null, null, null, null, 'ZTSHbjztshsmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7604', '416', 'ZWMK-北京中卫美康科技有限公司
', null, null, null, null, null, null, null, 'ZWMKbjzwmkkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7605', '417', 'ZHXT-北京钟汉鑫泰科技发展
', null, null, null, null, null, null, null, 'ZHXTbjzhxtkjfz', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7606', '418', 'ZTHF-北京周天华枫医疗仪器有限公司
', null, null, null, null, null, null, null, 'ZTHFbjzthfylyqyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7607', '419', 'BK-波科国际
医疗贸易(上海)有限公司', null, null, null, null, null, null, null, 'BKbkgjylmyshyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7608', '420', 'DFLG-东方莱格医药科技(北京)有限公司
', null, null, null, null, null, null, null, 'DFLGdflgyykjbjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7609', '421', 'GYJT-国药集团北京医疗器械有限公司
', null, null, null, null, null, null, null, 'GYJTgyjtbjylqxyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7610', '422', 'NJLS-南京郎森
', null, null, null, null, null, null, null, 'NJLSnjls', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7611', '423', 'NJWC-南京微创
', null, null, null, null, null, null, null, 'NJWCnjwc', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7612', '424', 'PDH-北京普德鸿医学技术有限公司
', null, null, null, null, null, null, null, 'PDHbjpdhyxjsyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7613', '425', 'SDWG-山东威高集团北京销售分公司', null, null, null, null, null, null, null, 'SDWGsdwgjtbjxsfgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7614', '426', 'SHKH-上海科华生物工程股份有限公司
', null, null, null, null, null, null, null, 'SHKHshkhswgcgfyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7615', '427', 'TJHNH-天津哈娜好医材有限公司
', null, null, null, null, null, null, null, 'TJHNHtjhnhycyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7616', '428', 'WHPM-万华普曼生物工程有限公司
', null, null, null, null, null, null, null, 'WHPMwhpmswgcyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7617', '429', 'ZJGD-浙江拱东
医用塑料厂北京办事处', null, null, null, null, null, null, null, 'ZJGDzjgdyyslcbjbsc', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7618', '430', 'ZHHJ-珠海和佳医疗设备股份有限公司
', null, null, null, null, null, null, null, 'ZHHJzhhjylsbgfyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7619', '431', 'GZBJSZ-北京顺展天拓科技有限公司', null, null, null, null, null, null, null, 'GZBJSZbjszttkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7620', '432', 'GZHMST-霍姆斯特（北京）环境科技有限公司', null, null, null, null, null, null, null, 'GZHMSThmstbjhjkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7621', '433', 'GZBJHY-北京湖源兴科贸有限公司', null, null, null, null, null, null, null, 'GZBJHYbjhyxkmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7622', '434', 'CJRD-北京创捷锐达科贸中心', null, null, null, null, null, null, null, 'CJRDbjcjrdkmzx', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7623', '435', 'GZQQSYL-北京千千树医疗设备有限公司', null, null, null, null, null, null, null, 'GZQQSYLbjqqsylsbyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7624', '436', 'MZXYF-门诊西药房', null, null, null, null, null, null, null, 'MZXYFmzxyf', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7625', '437', 'PFXBMZYF-皮肤性病门诊药房', null, null, null, null, null, null, null, 'PFXBMZYFpfxbmzyf', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7626', '438', 'GZBJYHHX-北京永和恒信科技发展有限公司', null, null, null, null, null, null, null, 'GZBJYHHXbjyhhxkjfzyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7627', '439', 'BJDTYY-北京地坛医院', null, null, null, null, null, null, null, 'BJDTYYbjdtyy', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7628', '440', 'ZXYF-中心药房', null, null, null, null, null, null, null, 'ZXYFzxyf', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7629', '441', 'MZZYF-门诊中药房', null, null, null, null, null, null, null, 'MZZYFmzzyf', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7630', '442', 'JMPYZX-静脉配液中心', null, null, null, null, null, null, null, 'JMPYZXjmpyzx', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7631', '444', 'DWSJ-北京大卫世纪生物技术开发有限公司
', null, null, null, null, null, null, null, 'DWSJbjdwsjswjskfyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7632', '445', 'dtyy-地坛医院老院库存', null, null, null, null, null, null, null, 'dtyydtyylykc', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7633', '446', '北京市富平和文化用品经营部', null, null, null, null, null, null, null, 'bjsfphwhypjyb', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7634', '447', 'BJYT-北京永拓动力科技发展有限公司', null, null, null, null, null, null, null, 'BJYTbjytdlkjfzyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7635', '448', 'deb-北京得尔贝经贸有限公司', null, null, null, null, null, null, null, 'debbjdebjmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7636', '449', 'ycsd-北京永昌盛达科技有限公司', null, null, null, null, null, null, null, 'ycsdbjycsdkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7637', '450', 'hxy-北京市华信医疗电子设备公司', null, null, null, null, null, null, null, 'hxybjshxyldzsbgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7638', '451', 'dqsd-北京德勤时代生物科技有限公司', null, null, null, null, null, null, null, 'dqsdbjdqsdswkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7639', '452', 'bljh-北京百利嘉华商贸有限公司', null, null, null, null, null, null, null, 'bljhbjbljhsmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7640', '453', 'dbzy-东北制药总厂', null, null, null, null, null, null, null, 'dbzydbzyzc', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7641', '454', 'shdsn-上海迪赛诺生物医药有限公司', null, null, null, null, null, null, null, 'shdsnshdsnswyyyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7642', '455', 'HSSJ-北京华顺世纪科技有限公司', null, null, null, null, null, null, null, 'HSSJbjhssjkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7643', '456', 'bjdxdlyy-北京大学第六医院', null, null, null, null, null, null, null, 'bjdxdlyybjdxdlyy', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7644', '457', 'htzy-北京华天泽宇医疗器械有限公司', null, null, null, null, null, null, null, 'htzybjhtzyylqxyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7645', '458', 'kly-北京科利亚生物技术有限公司', null, null, null, null, null, null, null, 'klybjklyswjsyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7750', '563', 'jllfby-北京金龙联发布艺经营中心', null, null, null, null, null, null, null, 'jllfbybjjllfbyjyzx', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7751', '564', 'cygs-北京市朝阳区国家税务局', null, null, null, null, null, null, null, 'cygsbjscyqgjswj', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7752', '565', 'jpwj-北京市金鹏五金建材商贸中心', null, null, null, null, null, null, null, 'jpwjbjsjpwjjcsmzx', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7753', '566', 'sysc-北京三友商场有限责任公司', null, null, null, null, null, null, null, 'syscbjsyscyxzrgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7754', '567', 'HBK-北京化玻科仪器有限责任公司', null, null, null, null, null, null, null, 'HBKbjhbkyqyxzrgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7755', '568', 'bjxwj-北京兴望金建材商城有限公司', null, null, null, null, null, null, null, 'bjxwjbjxwjjcscyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7756', '569', 'htsm-北京市华特商贸公司', null, null, null, null, null, null, null, 'htsmbjshtsmgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7757', '570', 'KSDR-北京康思达睿科贸有限公司', null, null, null, null, null, null, null, 'KSDRbjksdrkmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7758', '571', 'BTCY-北京博天诚业科技有限公司', null, null, null, null, null, null, null, 'BTCYbjbtcykjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7759', '572', 'jlf-北京家乐福商业有限公司通州店', null, null, null, null, null, null, null, 'jlfbjjlfsyyxgstzd', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7760', '573', 'hzsc-北京杭州丝绸城市场有限公司', null, null, null, null, null, null, null, 'hzscbjhzsccscyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7761', '574', 'thfz-北京天海服装批发市场', null, null, null, null, null, null, null, 'thfzbjthfzpfsc', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7762', '575', 'hlhfm-北京市恒利和阀门五金销售部', null, null, null, null, null, null, null, 'hlhfmbjshlhfmwjxsb', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7763', '576', 'htfz-北京海天服装批发市场有限公司', null, null, null, null, null, null, null, 'htfzbjhtfzpfscyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7764', '577', 'shsc-北京苏杭丝绸城市场有限公司', null, null, null, null, null, null, null, 'shscbjshsccscyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7765', '578', 'LZYX-北京丽珠医学技术有限公司', null, null, null, null, null, null, null, 'LZYXbjlzyxjsyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7766', '579', 'BFYT-北京北方仪涛商贸有限公司', null, null, null, null, null, null, null, 'BFYTbjbfytsmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7767', '580', 'jkl-北京京客隆商业集团股份有限公司回龙观店', null, null, null, null, null, null, null, 'jklbjjklsyjtgfyxgshlgd', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7768', '581', 'lgs-蓝格赛-海龙兴电器设备商业有限公司', null, null, null, null, null, null, null, 'lgslgshlxdqsbsyyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7769', '582', 'JDMY-洁定贸易(上海)有限公司', null, null, null, null, null, null, null, 'JDMYjdmyshyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7770', '583', 'ylfbg-北京银联丰办公设备销售中心', null, null, null, null, null, null, null, 'ylfbgbjylfbgsbxszx', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7771', '584', 'qfkj-北京泉发科技发展有限责任公司', null, null, null, null, null, null, null, 'qfkjbjqfkjfzyxzrgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7772', '585', 'ztgh-北京中通国洪商贸有限公司', null, null, null, null, null, null, null, 'ztghbjztghsmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7773', '586', 'hpl-北京市和平里医院', null, null, null, null, null, null, null, 'hplbjshplyy', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7774', '587', 'yhbxg-深圳市耀华不锈钢厨具有限公司', null, null, null, null, null, null, null, 'yhbxgszsyhbxgcjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7775', '588', 'jwyl-北京京卫医疗用品公司', null, null, null, null, null, null, null, 'jwylbjjwylypgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7776', '589', 'YACX-北京亚奥春晓商贸中心', null, null, null, null, null, null, null, 'YACXbjyacxsmzx', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7777', '590', 'LPSW-北京绿平生物技术开发有限公司', null, null, null, null, null, null, null, 'LPSWbjlpswjskfyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7778', '591', 'LP-乐普(北京)医疗器械股份有限公司', null, null, null, null, null, null, null, 'LPlpbjylqxgfyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7779', '592', 'hd-北京衡达技术服务中心', null, null, null, null, null, null, null, 'hdbjhdjsfwzx', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7780', '593', 'ktyl-北京康拓医疗仪器有限公司', null, null, null, null, null, null, null, 'ktylbjktylyqyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7781', '594', 'sajj-浙江圣奥家具制造有限公司', null, null, null, null, null, null, null, 'sajjzjsajjzzyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7782', '595', 'ztfd-北京志腾飞达科技有限公司', null, null, null, null, null, null, null, 'ztfdbjztfdkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7783', '596', 'gjzb-中技国际招标公司', null, null, null, null, null, null, null, 'gjzbzjgjzbgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7784', '597', 'NLT-北京诺立特科技开发有限公司', null, null, null, null, null, null, null, 'NLTbjnltkjkfyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7785', '598', 'SHMT-上海美太医疗设备有限公司', null, null, null, null, null, null, null, 'SHMTshmtylsbyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7786', '599', 'RYX- 北京荣亦兴经贸公司', null, null, null, null, null, null, null, 'RYXbjryxjmgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7787', '600', 'JRT-北京京瑞天之威医疗器械销售中心', null, null, null, null, null, null, null, 'JRTbjjrtzwylqxxszx', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7788', '601', 'xxlwj-北京市旭鑫隆五金机电经营部', null, null, null, null, null, null, null, 'xxlwjbjsxxlwjjdjyb', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7789', '602', 'clxx-北京朝龙新兴五金交电市场有限公司', null, null, null, null, null, null, null, 'clxxbjclxxwjjdscyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7790', '603', 'dfom-北京东方欧美华工业装备有限公司', null, null, null, null, null, null, null, 'dfombjdfomhgyzbyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7791', '604', 'tdwuj-北京腾达五金建材有限公司', null, null, null, null, null, null, null, 'tdwujbjtdwjjcyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7792', '605', 'jssdwj-北京市京顺盛达五金机电商店', null, null, null, null, null, null, null, 'jssdwjbjsjssdwjjdsd', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7793', '606', 'xssy-北京市兴胜山鹰线缆有限公司', null, null, null, null, null, null, null, 'xssybjsxssyxlyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7794', '607', 'dfyh-北京东方耀华厨房设备有限公司', null, null, null, null, null, null, null, 'dfyhbjdfyhcfsbyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7795', '608', 'yfa-北京永福安消防器材销售中心', null, null, null, null, null, null, null, 'yfabjyfaxfqcxszx', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7796', '609', 'bjdxdyyy-北京大学第一医院', null, null, null, null, null, null, null, 'bjdxdyyybjdxdyyy', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7797', '610', 'ysec-北京印刷集团有限责任公司印刷二厂', null, null, null, null, null, null, null, 'ysecbjysjtyxzrgsysec', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7798', '611', 'ykd-北京益康德医疗器械有限公司', null, null, null, null, null, null, null, 'ykdbjykdylqxyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7799', '612', 'dhhc-北京东华合创数码科技股份有限公司', null, null, null, null, null, null, null, 'dhhcbjdhhcsmkjgfyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7800', '613', 'HFD-北京恒丰达医疗器械有限责任公司', null, null, null, null, null, null, null, 'HFDbjhfdylqxyxzrgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7801', '614', 'prbk-普瑞博科（北京）科贸有限公司', null, null, null, null, null, null, null, 'prbkprbkbjkmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7802', '615', 'ltsk-北京龙腾书刊发行公司', null, null, null, null, null, null, null, 'ltskbjltskfxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7803', '616', 'slp-北京森雷普实验室设备有限公司', null, null, null, null, null, null, null, 'slpbjslpsyssbyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7804', '617', 'ZGYY-中国医药对外贸易公司', null, null, null, null, null, null, null, 'ZGYYzgyydwmygs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7805', '618', 'QHZH-北京泉辉泽惠医疗设备有限公司', null, null, null, null, null, null, null, 'QHZHbjqhzhylsbyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7806', '619', 'ZGKX-中国科学器材进出口总公司', null, null, null, null, null, null, null, 'ZGKXzgkxqcjckzgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7807', '620', 'ysgf-北京市永顺广发建材商店', null, null, null, null, null, null, null, 'ysgfbjsysgfjcsd', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7808', '621', 'jty-北京金太阳商贸有限公司', null, null, null, null, null, null, null, 'jtybjjtysmyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7809', '622', 'ZHKX-北京正瀚科学仪器有限公司', null, null, null, null, null, null, null, 'ZHKXbjzhkxyqyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7810', '623', 'jhl-北京久恒隆仪表技术开发有限责任公司', null, null, null, null, null, null, null, 'jhlbjjhlybjskfyxzrgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7811', '624', 'zdxf-北京中电兴发科技有限公司', null, null, null, null, null, null, null, 'zdxfbjzdxfkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7812', '625', 'mchl-北京美承互联数码科技发展有限公司', null, null, null, null, null, null, null, 'mchlbjmchlsmkjfzyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7813', '626', 'zgwt-中国网通（集团）有限公司北京分公司', null, null, null, null, null, null, null, 'zgwtzgwtjtyxgsbjfgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7814', '627', 'sat-北京思奥特科技发展有限公司', null, null, null, null, null, null, null, 'satbjsatkjfzyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7815', '628', 'XBGR-北京星标格瑞生物技术发展有限公司', null, null, null, null, null, null, null, 'XBGRbjxbgrswjsfzyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7816', '629', 'SHTD-上海泰德医疗器械有限公司', null, null, null, null, null, null, null, 'SHTDshtdylqxyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7817', '630', 'DHJC-北京道合憬诚医疗器械有限公司', null, null, null, null, null, null, null, 'DHJCbjdhjcylqxyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7818', '631', 'YTH-北京悦泰行科技发展有限公司', null, null, null, null, null, null, null, 'YTHbjytxkjfzyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7819', '632', 'XHHT-北京信弘汇天医疗技术开发有限公司', null, null, null, null, null, null, null, 'XHHTbjxhhtyljskfyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7820', '633', 'lytg-北京绿氧天罡科技开发有限公司', null, null, null, null, null, null, null, 'lytgbjlytgkjkfyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7821', '634', 'shsl-上海三菱电梯有限公司', null, null, null, null, null, null, null, 'shslshsldtyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7822', '635', 'HNS-北京昊诺斯科技有限公司', null, null, null, null, null, null, null, 'HNSbjhnskjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7823', '636', 'slx-北京圣兰心服装服饰有限责任公司', null, null, null, null, null, null, null, 'slxbjslxfzfsyxzrgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7824', '637', 'yymy-北京誉远名扬窗饰用品有限公司', null, null, null, null, null, null, null, 'yymybjyymycsypyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7825', '638', 'ssfz-北京绅士服装服饰有限公司', null, null, null, null, null, null, null, 'ssfzbjssfzfsyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7826', '639', 'JQJJ-北京鉴清洁净科技有限责任公司', null, null, null, null, null, null, null, 'JQJJbjjqjjkjyxzrgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7827', '640', 'fxwj-北京市福兴五金建材经营部', null, null, null, null, null, null, null, 'fxwjbjsfxwjjcjyb', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7828', '641', 'jgyd-北京旧宫园鼎机械维修部', null, null, null, null, null, null, null, 'jgydbjjgydjxwxb', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7829', '642', 'BTRC-北京比特瑞创科技有限公司', null, null, null, null, null, null, null, 'BTRCbjbtrckjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7830', '643', 'etyy-首都医科大学附属北京儿童医院', null, null, null, null, null, null, null, 'etyysdykdxfsbjetyy', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7831', '644', 'cycdc-北京市朝阳区疾病预防控制中心', null, null, null, null, null, null, null, 'cycdcbjscyqjbyfkzzx', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7832', '645', 'dfswj-北京市地方税务局', null, null, null, null, null, null, null, 'dfswjbjsdfswj', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7833', '646', 'HYY-北京宏医耀科技发展有限公司', null, null, null, null, null, null, null, 'HYYbjhyykjfzyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7834', '647', 'xylp-北京心悦良品科技有限公司', null, null, null, null, null, null, null, 'xylpbjxylpkjyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7835', '648', 'xjf-北京市鑫聚发建材商店', null, null, null, null, null, null, null, 'xjfbjsxjfjcsd', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7836', '649', 'bjscyfe-北京市朝阳区妇儿医院', null, null, null, null, null, null, null, 'bjscyfebjscyqfeyy', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7837', '650', 'GDLZ-北京光电联众医疗器械有限公司', null, null, null, null, null, null, null, 'GDLZbjgdlzylqxyxgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7838', '651', 'dwzz-单位自制', null, null, null, null, null, null, null, 'dwzzdwzz', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7839', '652', '上海供应商001', null, null, null, null, null, null, null, 'shgys001', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7840', '653', '北京知春路供应商', null, null, null, null, null, null, null, 'bjzclgys', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7841', '654', '测试供应商', null, null, null, null, null, null, null, 'csgys', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7842', '655', '测试供应商2', null, null, null, null, null, null, null, 'csgys2', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7843', '656', '阿奇霉素供应商', null, null, null, null, null, null, null, 'aqmsgys', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7844', '657', '阿莫西林供应商', null, null, null, null, null, null, null, 'amxlgys', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7845', '658', 'zl测试001', null, null, null, null, null, null, null, 'zlcs001', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7846', '659', 'zl测试002', null, null, null, null, null, null, null, 'zlcs002', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7847', '660', 'zh1供应商', null, null, null, null, null, null, null, 'zh1gys', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7848', '661', 'zh2', null, null, null, null, null, null, null, 'zh2', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7849', '662', 'zh2供应商', null, null, null, null, null, null, null, 'zh2gys', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7850', '663', 'zh4', null, null, null, null, null, null, null, 'zh4', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7851', '664', 'zh5', null, null, null, null, null, null, null, 'zh5', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7852', '665', 'a', null, null, null, null, null, null, null, 'a', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7853', '666', 'as', null, null, null, null, null, null, null, 'as', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7854', '667', '泰安', null, null, null, null, null, null, null, 'ta', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7855', '668', '北京', null, null, null, null, null, null, null, 'bj', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7856', '669', '测试1', null, null, null, null, null, null, null, 'cs1', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7857', '670', '测试2', null, null, null, null, null, null, null, 'cs2', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7858', '671', '测试3', null, null, null, null, null, null, null, 'cs3', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7859', '672', '测试4', null, null, null, null, null, null, null, 'cs4', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7860', '673', '测试5', null, null, null, null, null, null, null, 'cs5', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7861', '674', '测试6', null, null, null, null, null, null, null, 'cs6', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7862', '675', '测试7', null, null, null, null, null, null, null, 'cs7', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7863', '676', '测试8', null, null, null, null, null, null, null, 'cs8', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7864', '677', '测试9', null, null, null, null, null, null, null, 'cs9', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7865', '678', 'BJZY-北京制药', null, null, null, null, null, null, null, 'BJZYbjzy', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7866', '679', '上海供应商', null, null, null, null, null, null, null, 'shgys', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7867', '680', 'TADHRJ-泰安东华软件', null, null, null, null, null, null, null, 'TADHRJtadhrj', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7868', '681', '北京东华软件供应商', null, null, null, null, null, null, null, 'bjdhrjgys', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7869', '682', '东华软件股份公司', null, null, null, null, null, null, null, 'dhrjgfgs', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7870', '683', 'KPJT-鲲鹏集团', null, null, null, null, null, null, null, 'KPJTkpjt', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7871', '684', 'HFH-火凤凰', null, null, null, null, null, null, null, 'HFHhfh', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7872', '704', 'BJCSGYS1-北京测试供应商', null, null, null, null, null, null, null, 'BJCSGYS1bjcsgys', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7873', '705', 'BJCSGYS2-北京测试供应商', null, null, null, null, null, null, null, 'BJCSGYS2bjcsgys', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7874', '707', 'zl测试003', null, null, null, null, null, null, null, 'zlcs003', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7875', '708', 'zl测试004', null, null, null, null, null, null, null, 'zlcs004', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7876', '709', 'zl测试005', null, null, null, null, null, null, null, 'zlcs005', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7877', '710', 'zl测试006', null, null, null, null, null, null, null, 'zlcs006', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7878', '711', 'zl测试007', null, null, null, null, null, null, null, 'zlcs007', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7879', '712', 'zl测试008', null, null, null, null, null, null, null, 'zlcs008', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7880', '713', 'zl测试009', null, null, null, null, null, null, null, 'zlcs009', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7881', '714', 'zl测试010', null, null, null, null, null, null, null, 'zlcs010', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7882', '715', 'zh测试11', null, null, null, null, null, null, null, 'zhcs11', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7883', '716', '供应商', null, null, null, null, null, null, null, 'gys', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7884', '717', '测试10', null, null, null, null, null, null, null, 'cs10', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7885', '718', '供应商111', null, null, null, null, null, null, null, 'gys111', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7886', '719', '供应商', null, null, null, null, null, null, null, 'gys', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7887', '720', 'zl供应商', null, null, null, null, null, null, null, 'zlgys', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7888', '721', '藏剑山庄供应商', null, null, null, null, null, null, null, 'zjszgys', null);
INSERT INTO "SCM"."T_VEN_VENDOR" VALUES ('7901', null, null, null, null, null, null, null, null, null, null, null);

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
INSERT INTO "SCM"."T_VEN_VENDOR_LOG" VALUES ('ff8080814c68ae1c014c68e14d810006', '7121', null, TO_TIMESTAMP(' 2015-03-30 12:12:18:176000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'P', '127.0.0.1', null, '2015-03-30+12-12-18aabcf0ea-da31-437d-a4ed-60f6389103bd.jpg', 'vendor', '销售许可证');
INSERT INTO "SCM"."T_VEN_VENDOR_LOG" VALUES ('ff8080814c68ae1c014c68e164770007', '7121', null, TO_TIMESTAMP(' 2015-03-30 12:12:24:054000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'P', '127.0.0.1', null, '2015-03-30+12-12-247108792b-b576-4abb-a168-bcc68ee724f0.jpg', 'vendor', 'GMP资质认真');
INSERT INTO "SCM"."T_VEN_VENDOR_LOG" VALUES ('ff8080814c68ae1c014c68e174f20008', '7121', null, TO_TIMESTAMP(' 2015-03-30 12:12:28:274000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'P', '127.0.0.1', null, '2015-03-30+12-12-28c54dc503-55ef-459c-9741-1d912f647a7a.jpg', 'vendor', '器械销售资格证');
INSERT INTO "SCM"."T_VEN_VENDOR_LOG" VALUES ('ff8080814c68ae1c014c68e1e2f20009', '7142', null, TO_TIMESTAMP(' 2015-03-30 12:12:56:433000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'P', '127.0.0.1', null, '2015-03-30+12-12-56a5677b64-091c-4ba4-94e4-714435ca73a2.jpg', 'dhccvendor', '销售许可证');
INSERT INTO "SCM"."T_VEN_VENDOR_LOG" VALUES ('ff8080814c68ae1c014c68e1f229000a', '7142', null, TO_TIMESTAMP(' 2015-03-30 12:13:00:329000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'P', '127.0.0.1', null, '2015-03-30+12-13-00e74fe12e-e960-4a22-8a26-85778bc79309.jpg', 'dhccvendor', '销售许可证');
INSERT INTO "SCM"."T_VEN_VENDOR_LOG" VALUES ('4028b7c64b594088014b594238f50000', '7141', null, TO_TIMESTAMP(' 2015-02-05 18:21:27:157000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '增加', '127.0.0.1', null, ' 邮箱: 地址: 联系人:', 'system', null);

-- ----------------------------
-- Sequence structure for SEQ_NORMALUSER
-- ----------------------------
DROP SEQUENCE "SCM"."SEQ_NORMALUSER";
CREATE SEQUENCE "SCM"."SEQ_NORMALUSER"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 132
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQ_SYS_FUNC
-- ----------------------------
DROP SEQUENCE "SCM"."SEQ_SYS_FUNC";
CREATE SEQUENCE "SCM"."SEQ_SYS_FUNC"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 203
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQ_SYS_NORMAL_ACCOUNT
-- ----------------------------
DROP SEQUENCE "SCM"."SEQ_SYS_NORMAL_ACCOUNT";
CREATE SEQUENCE "SCM"."SEQ_SYS_NORMAL_ACCOUNT"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 128
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
 START WITH 7902
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
 START WITH 61
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_CAT_CATGROUPITM
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_CAT_CATGROUPITM";
CREATE SEQUENCE "SCM"."SEQUENCE_CAT_CATGROUPITM"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 128
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
 START WITH 107
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
-- Sequence structure for SEQUENCE_HOP_EVALUTE
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_HOP_EVALUTE";
CREATE SEQUENCE "SCM"."SEQUENCE_HOP_EVALUTE"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 148
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
 START WITH 19841
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
 START WITH 2001
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_HOP_VENDOR
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_HOP_VENDOR";
CREATE SEQUENCE "SCM"."SEQUENCE_HOP_VENDOR"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 6921
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_ORD_DETAIL
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_ORD_DETAIL";
CREATE SEQUENCE "SCM"."SEQUENCE_ORD_DETAIL"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 164
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_ORD_EXESTATE
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_ORD_EXESTATE";
CREATE SEQUENCE "SCM"."SEQUENCE_ORD_EXESTATE"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 385
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
 START WITH 307
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_ORD_STATE
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_ORD_STATE";
CREATE SEQUENCE "SCM"."SEQUENCE_ORD_STATE"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 42
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_SYS_APPNO
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_SYS_APPNO";
CREATE SEQUENCE "SCM"."SEQUENCE_SYS_APPNO"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 122
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_SYS_CTLOC
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_SYS_CTLOC";
CREATE SEQUENCE "SCM"."SEQUENCE_SYS_CTLOC"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 181
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_SYS_CTLOC_DESTINATION
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_SYS_CTLOC_DESTINATION";
CREATE SEQUENCE "SCM"."SEQUENCE_SYS_CTLOC_DESTINATION"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 161
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
 START WITH 6361
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_VEN_INC_PIC
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_VEN_INC_PIC";
CREATE SEQUENCE "SCM"."SEQUENCE_VEN_INC_PIC"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999
 START WITH 248
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_VEN_INC_PROPERTY
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_VEN_INC_PROPERTY";
CREATE SEQUENCE "SCM"."SEQUENCE_VEN_INC_PROPERTY"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 166
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_VEN_QUALIF_PIC
-- ----------------------------
DROP SEQUENCE "SCM"."SEQUENCE_VEN_QUALIF_PIC";
CREATE SEQUENCE "SCM"."SEQUENCE_VEN_QUALIF_PIC"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 201
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
 START WITH 162
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
-- Indexes structure for table T_CAT_GROUP
-- ----------------------------

-- ----------------------------
-- Checks structure for table T_CAT_GROUP
-- ----------------------------
ALTER TABLE "SCM"."T_CAT_GROUP" ADD CHECK ("SG_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_CAT_GROUP
-- ----------------------------
ALTER TABLE "SCM"."T_CAT_GROUP" ADD PRIMARY KEY ("SG_ID");

-- ----------------------------
-- Checks structure for table T_CAT_GROUPPROPERTY
-- ----------------------------
ALTER TABLE "SCM"."T_CAT_GROUPPROPERTY" ADD CHECK ("GRP_PRO_ID" IS NOT NULL);

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
-- Checks structure for table T_VEN_INC_PROPERTY
-- ----------------------------
ALTER TABLE "SCM"."T_VEN_INC_PROPERTY" ADD CHECK ("INCPRO_ID" IS NOT NULL);

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
