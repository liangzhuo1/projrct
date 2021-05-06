CREATE DATABASE IF NOT EXISTS leadnews_wemedia DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE leadnews_wemedia;
SET NAMES utf8;
/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : leadnews_wemedia

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2020-10-09 18:27:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for undo_log
-- ----------------------------
DROP TABLE IF EXISTS `undo_log`;
CREATE TABLE `undo_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `branch_id` bigint(20) NOT NULL,
  `xid` varchar(100) NOT NULL,
  `context` varchar(128) NOT NULL,
  `rollback_info` longblob NOT NULL,
  `log_status` int(11) NOT NULL,
  `log_created` datetime NOT NULL,
  `log_modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_undo_log` (`xid`,`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of undo_log
-- ----------------------------

-- ----------------------------
-- Table structure for wm_fans_portrait
-- ----------------------------
DROP TABLE IF EXISTS `wm_fans_portrait`;
CREATE TABLE `wm_fans_portrait` (
  `id` int(11) unsigned NOT NULL COMMENT '主键',
  `user_id` int(11) unsigned DEFAULT NULL COMMENT '账号ID',
  `name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '画像项目',
  `value` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '资源名称',
  `burst` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='自媒体粉丝画像信息表';

-- ----------------------------
-- Records of wm_fans_portrait
-- ----------------------------

-- ----------------------------
-- Table structure for wm_fans_statistics
-- ----------------------------
DROP TABLE IF EXISTS `wm_fans_statistics`;
CREATE TABLE `wm_fans_statistics` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) unsigned DEFAULT NULL COMMENT '主账号ID',
  `article` int(11) unsigned DEFAULT NULL COMMENT '子账号ID',
  `read_count` int(11) unsigned DEFAULT NULL,
  `comment` int(11) unsigned DEFAULT NULL,
  `follow` int(11) unsigned DEFAULT NULL,
  `collection` int(11) unsigned DEFAULT NULL,
  `forward` int(11) unsigned DEFAULT NULL,
  `likes` int(11) unsigned DEFAULT NULL,
  `unlikes` int(11) unsigned DEFAULT NULL,
  `unfollow` int(11) unsigned DEFAULT NULL,
  `burst` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_time` date DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_user_id_time` (`user_id`,`created_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='自媒体粉丝数据统计表';

-- ----------------------------
-- Records of wm_fans_statistics
-- ----------------------------

-- ----------------------------
-- Table structure for wm_material
-- ----------------------------
DROP TABLE IF EXISTS `wm_material`;
CREATE TABLE `wm_material` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) unsigned DEFAULT NULL COMMENT '自媒体用户ID',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图片地址',
  `type` tinyint(1) unsigned DEFAULT NULL COMMENT '素材类型\r\n            0 图片\r\n            1 视频',
  `is_collection` tinyint(1) DEFAULT NULL COMMENT '是否收藏',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='自媒体图文素材信息表';

-- ----------------------------
-- Records of wm_material
-- ----------------------------
INSERT INTO `wm_material` VALUES ('29', '1102', 'group1/M00/00/00/wKjIgl892suAAHHxAACr_szTy3c449.jpg', '0', '0', '2020-08-20 10:07:07');
INSERT INTO `wm_material` VALUES ('30', '1102', 'group1/M00/00/00/wKjIgl892tOART1DAAD7FZJ4USo775.jpg', '0', '0', '2020-08-20 10:07:16');
INSERT INTO `wm_material` VALUES ('31', '1102', 'group1/M00/00/00/wKjIgl892tyAFc60AAMUNUuOKPA619.jpg', '0', '0', '2020-08-20 10:07:24');
INSERT INTO `wm_material` VALUES ('32', '1102', 'group1/M00/00/00/wKjIgl892uyAR12rAADi7UxPXeM267.jpg', '0', '0', '2020-08-20 10:07:40');
INSERT INTO `wm_material` VALUES ('33', '1102', 'group1/M00/00/00/wKjIgl892vOASiunAAGzs3UZ1Cg252.jpg', '0', '0', '2020-08-20 10:07:48');
INSERT INTO `wm_material` VALUES ('34', '1102', 'group1/M00/00/00/wKjIgl892vuAXr_MAASCMYD0yzc919.jpg', '0', '0', '2020-08-20 10:07:56');
INSERT INTO `wm_material` VALUES ('35', '1102', 'group1/M00/00/00/wKjIgl892wKAZLhtAASZUi49De0836.jpg', '0', '0', '2020-08-20 10:08:03');
INSERT INTO `wm_material` VALUES ('36', '1102', 'group1/M00/00/00/wKjIgl892wqAANwOAAJW8oQUlAc087.jpg', '0', '1', '2020-08-20 10:08:10');
INSERT INTO `wm_material` VALUES ('37', '1102', 'group1/M00/00/00/wKjIgl892xGANV6qAABzWOH8KDY775.jpg', '0', '0', '2020-08-20 10:08:18');
INSERT INTO `wm_material` VALUES ('38', '1102', 'group1/M00/00/00/wKjIgl892xmAG_yjAAB6OkkuJd4819.jpg', '0', '0', '2020-08-20 10:08:25');
INSERT INTO `wm_material` VALUES ('40', '1102', 'group1/M00/00/00/wKjIgl899vKABXIQAAE4r9f28T8508.jpg', '0', '1', '2020-08-20 12:07:14');
INSERT INTO `wm_material` VALUES ('41', '1102', 'group1/M00/00/00/wKjIgl9V2CqAZe18AAOoOOsvWPc041.png', '0', '0', '2020-09-07 14:50:18');
INSERT INTO `wm_material` VALUES ('42', '1102', 'group1/M00/00/00/wKjIgl9V2F6AdQxAAAGyaOdp4gk784.png', '0', '0', '2020-09-07 14:51:11');
INSERT INTO `wm_material` VALUES ('43', '1102', 'group1/M00/00/00/wKjIgl9V2n6AArZsAAGMmaPdt7w502.png', '0', '0', '2020-09-07 15:00:15');
INSERT INTO `wm_material` VALUES ('44', '1102', 'group1/M00/00/00/wKjIgl9W6iOAD2doAAFY4E1K7-g384.png', '0', '0', '2020-09-08 10:19:16');

-- ----------------------------
-- Table structure for wm_news
-- ----------------------------
DROP TABLE IF EXISTS `wm_news`;
CREATE TABLE `wm_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) unsigned DEFAULT NULL COMMENT '自媒体用户ID',
  `title` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
  `content` longtext COLLATE utf8mb4_unicode_ci COMMENT '图文内容',
  `type` tinyint(1) unsigned DEFAULT NULL COMMENT '文章布局\r\n            0 无图文章\r\n            1 单图文章\r\n            3 多图文章',
  `channel_id` int(11) unsigned DEFAULT NULL COMMENT '图文频道ID',
  `labels` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `submited_time` datetime DEFAULT NULL COMMENT '提交时间',
  `status` tinyint(2) unsigned DEFAULT NULL COMMENT '当前状态\r\n            0 草稿\r\n            1 提交（待审核）\r\n            2 审核失败\r\n            3 人工审核\r\n            4 人工审核通过\r\n            8 审核通过（待发布）\r\n            9 已发布',
  `publish_time` datetime DEFAULT NULL COMMENT '定时发布时间，不定时则为空',
  `reason` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '拒绝理由',
  `article_id` bigint(20) unsigned DEFAULT NULL COMMENT '发布库文章ID',
  `images` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '//图片用逗号分隔',
  `enable` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6223 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='自媒体图文内容信息表';

-- ----------------------------
-- Records of wm_news
-- ----------------------------
INSERT INTO `wm_news` VALUES ('6209', '1102', '美媒:中国在西藏修建新防空阵地', '[{\"type\":\"text\",\"value\":\"11111111111\"},{\"type\":\"image\",\"value\":\"http://192.168.200.130/group1/M00/00/00/wKjIgl899vKABXIQAAE4r9f28T8508.jpg\"},{\"type\":\"text\",\"value\":\"请在这里输入正文\"}]', '1', '1', '西藏', '2020-08-26 17:41:06', '2020-08-26 17:41:06', '9', '2020-01-01 17:41:04', '审核通过', '1302545498296557570', 'group1/M00/00/00/wKjIgl899vKABXIQAAE4r9f28T8508.jpg', '1');
INSERT INTO `wm_news` VALUES ('6210', '1102', '国产新冠灭活疫苗实物首次亮相', '[{\"type\":\"text\",\"value\":\"2222222222\"},{\"type\":\"image\",\"value\":\"http://192.168.200.130/group1/M00/00/00/wKjIgl899vKABXIQAAE4r9f28T8508.jpg\"},{\"type\":\"image\",\"value\":\"http://192.168.200.130/group1/M00/00/00/wKjIgl892xmAG_yjAAB6OkkuJd4819.jpg\"},{\"type\":\"text\",\"value\":\"请在这里输入正文\"}]', '3', '1', '疫苗', '2020-08-26 17:41:44', '2020-08-26 17:41:44', '9', '2020-01-01 17:41:33', '审核通过', '1302545503833038850', 'group1/M00/00/00/wKjIgl892xmAG_yjAAB6OkkuJd4819.jpg,group1/M00/00/00/wKjIgl892xGANV6qAABzWOH8KDY775.jpg,group1/M00/00/00/wKjIgl892wKAZLhtAASZUi49De0836.jpg', '0');
INSERT INTO `wm_news` VALUES ('6211', '1102', '黄龄工作室发视频回应', '[{\"type\":\"text\",\"value\":\"3黄龄工作室发视频回应黄龄工作室发视频回应黄龄工作室发视频回应黄龄工作室发视频回应黄龄工作室发视频回应黄龄工作室发视频回应黄龄工作室发视频回应黄龄工作室发视频回应黄龄工作室发视频回应黄龄工作室发视频回应黄龄工作室发视频回应黄龄工作室发视频回应黄龄工作室发视频回应黄龄工作室发视频回应黄龄工作室发视频回应\"},{\"type\":\"image\",\"value\":\"http://192.168.200.130/group1/M00/00/00/wKjIgl892vuAXr_MAASCMYD0yzc919.jpg\"},{\"type\":\"text\",\"value\":\"请在这里输入正文黄龄工作室发视频回应黄龄工作室发视频回应黄龄工作室发视频回应黄龄工作室发视频回应黄龄工作室发视频回应黄龄工作室发视频回应黄龄工作室发视频回应黄龄工作室发视频回应黄龄工作室发视频回应黄龄工作室发视频回应黄龄工作室发视频回应黄龄工作室发视频回应\"}]', '1', '4', '黄龄', '2020-09-07 22:31:18', '2020-09-07 22:31:18', '9', '2020-08-26 17:42:04', '审核通过', '1302977754114826241', 'group1/M00/00/00/wKjIgl892vuAXr_MAASCMYD0yzc919.jpg', '1');
INSERT INTO `wm_news` VALUES ('6212', '1102', '杨澜回应一秒变脸', '[{\"type\":\"text\",\"value\":\"杨澜回应一秒变脸杨澜回应一秒变脸杨澜回应一秒变脸杨澜回应一秒变脸杨澜回应一秒变脸杨澜回应一秒变脸\"},{\"type\":\"image\",\"value\":\"http://192.168.200.130/group1/M00/00/00/wKjIgl892wKAZLhtAASZUi49De0836.jpg\"},{\"type\":\"text\",\"value\":\"杨澜回应一秒变脸杨澜回应一秒变脸杨澜回应一秒变脸杨澜回应一秒变脸杨澜回应一秒变脸杨澜回应一秒变脸杨澜回应一秒变脸杨澜回应一秒变脸\"},{\"type\":\"text\",\"value\":\"请在这里输入正文\"}]', '1', '1', '杨澜', '2020-09-07 22:30:31', '2020-09-07 22:30:31', '9', '2020-08-26 17:42:24', '审核通过', '1302977558807060482', 'group1/M00/00/00/wKjIgl892wKAZLhtAASZUi49De0836.jpg', '1');
INSERT INTO `wm_news` VALUES ('6213', '1102', '10多名陌生人合力托举悬窗女童', '[{\"type\":\"text\",\"value\":\"510多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童\"},{\"type\":\"image\",\"value\":\"http://192.168.200.130/group1/M00/00/00/wKjIgl892vOASiunAAGzs3UZ1Cg252.jpg\"},{\"type\":\"image\",\"value\":\"http://192.168.200.130/group1/M00/00/00/wKjIgl892uyAR12rAADi7UxPXeM267.jpg\"},{\"type\":\"text\",\"value\":\"10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童v\"},{\"type\":\"text\",\"value\":\"请10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童v\"}]', '1', '1', '女童', '2020-09-07 22:30:07', '2020-09-07 22:30:07', '9', '2020-08-26 17:42:50', '审核通过', '1302977458215067649', 'group1/M00/00/00/wKjIgl892vOASiunAAGzs3UZ1Cg252.jpg', '1');
INSERT INTO `wm_news` VALUES ('6214', '1102', '央视曝光境外医疗豪华旅游套路', '[{\"type\":\"text\",\"value\":\"央视曝光境外医疗豪华旅游套路央视曝光境外医疗豪华旅游套路央视曝光境外医疗豪华旅游套路央视曝光境外医疗豪华旅游套路央视曝光境外医疗豪华旅游套路央视曝光境外医疗豪华旅游套路央视曝光境外医疗豪华旅游套路央视曝光境外医疗豪华旅游套路央视曝光境外医疗豪华旅游套路央视曝光境外医疗豪华旅游套路央视曝光境外医疗豪华旅游套路央视曝光境外医疗豪华旅游套路\"},{\"type\":\"image\",\"value\":\"http://192.168.200.130/group1/M00/00/00/wKjIgl892wqAANwOAAJW8oQUlAc087.jpg\"}]', '0', '1', '境外医疗', '2020-09-07 22:29:01', '2020-09-07 22:29:01', '9', '2020-08-26 17:43:19', '审核通过', '1302977178887004162', 'group1/M00/00/00/wKjIgl892wqAANwOAAJW8oQUlAc087.jpg', '1');
INSERT INTO `wm_news` VALUES ('6215', '1102', '武汉高校开学典礼万人歌唱祖国', '[{\"type\":\"text\",\"value\":\"武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国\"},{\"type\":\"image\",\"value\":\"http://192.168.200.130/group1/M00/00/00/wKjIgl892vuAXr_MAASCMYD0yzc919.jpg\"},{\"type\":\"text\",\"value\":\"武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国v\"}]', '3', '1', '武汉', '2020-09-07 15:04:27', '2020-09-07 15:04:27', '9', '2020-08-26 17:43:36', '审核通过', '1302865306489733122', 'group1/M00/00/00/wKjIgl892vuAXr_MAASCMYD0yzc919.jpg,group1/M00/00/00/wKjIgl892xGANV6qAABzWOH8KDY775.jpg,group1/M00/00/00/wKjIgl892wqAANwOAAJW8oQUlAc087.jpg', '1');
INSERT INTO `wm_news` VALUES ('6216', '1102', '过山车故障20名游客倒挂空中', '[{\"type\":\"text\",\"value\":\"过山车故障20名游客倒挂空中过山车故障20名游客倒挂空中过山车故障20名游客倒挂空中过山车故障20名游客倒挂空中过山车故障20名游客倒挂空中过山车故障20名游客倒挂空中过山车故障20名游客倒挂空中过山车故障20名游客倒挂空中过山车故障20名游客倒挂空中过山车故障20名游客倒挂空中\"},{\"type\":\"image\",\"value\":\"http://192.168.200.130/group1/M00/00/00/wKjIgl892uyAR12rAADi7UxPXeM267.jpg\"},{\"type\":\"text\",\"value\":\"过山车故障20名游客倒挂空中过山车故障20名游客倒挂空中过山车故障20名游客倒挂空中过山车故障20名游客倒挂空中过山车故障20名游客倒挂空中过山车故障20名游客倒挂空中过山车故障20名游客倒挂空中\"},{\"type\":\"text\",\"value\":\"请在这里输入正文\"}]', '3', '1', '过山车故障', '2020-09-07 15:03:16', '2020-09-07 15:03:16', '9', '2020-08-26 17:44:08', '审核通过', '1302865008438296577', 'group1/M00/00/00/wKjIgl892wqAANwOAAJW8oQUlAc087.jpg,group1/M00/00/00/wKjIgl892xmAG_yjAAB6OkkuJd4819.jpg,group1/M00/00/00/wKjIgl892wKAZLhtAASZUi49De0836.jpg', '1');
INSERT INTO `wm_news` VALUES ('6217', '1102', '天降铁球砸死女婴整栋楼被判赔', '[{\"type\":\"text\",\"value\":\"天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔\"},{\"type\":\"image\",\"value\":\"http://192.168.200.130/group1/M00/00/00/wKjIgl892tyAFc60AAMUNUuOKPA619.jpg\"},{\"type\":\"text\",\"value\":\"天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔vv\"},{\"type\":\"text\",\"value\":\"请在这里输入正文\"}]', '1', '1', '判赔', '2020-09-07 15:05:07', '2020-09-07 15:05:07', '9', '2020-08-26 17:44:42', '审核通过', '1302865474094120961', 'group1/M00/00/00/wKjIgl892tyAFc60AAMUNUuOKPA619.jpg', '1');
INSERT INTO `wm_news` VALUES ('6218', '1102', '4宝宝做平板支撑5秒倒下', '[{\"type\":\"text\",\"value\":\"000000000000000000000000000\"},{\"type\":\"image\",\"value\":\"http://192.168.200.130/group1/M00/00/00/wKjIgl892xmAG_yjAAB6OkkuJd4819.jpg\"},{\"type\":\"text\",\"value\":\"请在这里输入正文\"}]', '1', '3', '宝宝', '2020-08-26 17:45:07', '2020-08-26 17:45:07', '3', '2020-08-26 17:45:02', '', null, 'group1/M00/00/00/wKjIgl892xmAG_yjAAB6OkkuJd4819.jpg', '1');
INSERT INTO `wm_news` VALUES ('6219', '1102', '我是一个测试标题', '[{\"type\":\"text\",\"value\":\"这些都是测试这些都是测试这些都是测试这些都是测试这些都是测试这些都是测试\"},{\"type\":\"image\",\"value\":\"http://192.168.200.130/group1/M00/00/00/wKjIgl892wqAANwOAAJW8oQUlAc087.jpg\"},{\"type\":\"text\",\"value\":\"这些都是测试这些都是测试这些都是测试这些都是测试\"}]', '1', '1', '测试', '2020-09-07 15:02:11', '2020-09-07 15:02:11', '9', '2020-08-31 17:45:49', '审核通过', '1302864730402078722', 'group1/M00/00/00/wKjIgl892wqAANwOAAJW8oQUlAc087.jpg', '1');
INSERT INTO `wm_news` VALUES ('6220', '1102', '什么是Java语言', '[{\"type\":\"text\",\"value\":\"Java语言是美国Sun公司（Stanford University Network），在1995年推出的高级的编程语言。所谓编程语言，是计算机的语言，人们可以使用编程语言对计算机下达命令，让计算机完成人们需要的功能。\\n\\n2009年，Sun公司被甲骨文公司收购，所以我们现在访问oracle官网即可：https://www.oracle.com\\nJava语言共同创始人之一：詹姆斯·高斯林 （James Gosling），被称为“Java之父”\\n\"},{\"type\":\"image\",\"value\":\"http://192.168.200.130/group1/M00/00/00/wKjIgl9V2CqAZe18AAOoOOsvWPc041.png\"},{\"type\":\"text\",\"value\":\"Java语言发展历史\\n\\n- 1995年Sun公司推出Java语言\\n- 1996年发布Java 1.0版本\\n- 1997年发布Java 1.1版本\\n- 1998年发布Java 1.2版本\\n- 2000年发布Java 1.3版本\\n- 2002年发布Java 1.4版本\\n- 2004年发布Java 5.0版本\\n- 2006年发布Java 6.0版本\\n- 2009年Oracle甲骨文公司收购Sun公司\\n- 2011年发布Java 7.0版本\\n- 2014年发布Java 8.0版本\\n- 2017年9月发布Java 9.0版本\\n- 2018年3月发布Java 10.0版本\\n- 2018年9月发布Java 11.0版本\\n\"},{\"type\":\"text\",\"value\":\"Java 语言的三个版本\\n\\n- JavaSE：标准版，用于桌面应用的开发，是其他两个版本的基础。\\n  - 学习JavaSE的目的, 是为了就业班要学习的JavaEE打基础.\\n\"},{\"type\":\"image\",\"value\":\"http://192.168.200.130/group1/M00/00/00/wKjIgl9V2F6AdQxAAAGyaOdp4gk784.png\"},{\"type\":\"text\",\"value\":\"- JavaEE：企业版，用于Web方向的网站开发\\n  - 网站：网页 + 后台服务器\\n\\nJava语言主要应用在互联网程序的开发领域。常见的互联网程序比如天猫、京东、物流系统、网银系统等，以及服务器后台处理大数据的存储、查询、数据挖掘等也有很多应用。\\n\"}]', '1', '1', 'java语言', '2020-09-07 14:52:51', '2020-09-07 14:52:51', '9', '2020-09-07 14:51:55', '审核通过', '1302862387124125698', 'group1/M00/00/00/wKjIgl9V2CqAZe18AAOoOOsvWPc041.png', '1');
INSERT INTO `wm_news` VALUES ('6221', '1102', 'Java语言跨平台原理', '[{\"type\":\"text\",\"value\":\"Java虚拟机——JVM\\n\\n- JVM（Java Virtual Machine ）：Java虚拟机，简称JVM，是运行所有Java程序的假想计算机，是Java程序的运行环境，是Java 最具吸引力的特性之一。我们编写的Java代码，都运行在JVM 之上。\\n- 跨平台：任何软件的运行，都必须要运行在操作系统之上，而我们用Java编写的软件可以运行在任何的操作系统上，这个特性称为Java语言的跨平台特性。该特性是由JVM实现的，我们编写的程序运行在JVM上，而JVM运行在操作系统上。\\n\"},{\"type\":\"image\",\"value\":\"http://192.168.200.130/group1/M00/00/00/wKjIgl9V2n6AArZsAAGMmaPdt7w502.png\"},{\"type\":\"text\",\"value\":\"如图所示，Java的虚拟机本身不具备跨平台功能的，每个操作系统下都有不同版本的虚拟机。\\n\\n问题1: Java 是如何实现跨平台的呢？\\n\\n- 答：因为在不同操作系统中都安装了对应版本的 JVM 虚拟机\\n- 注意: Java程序想要运行, 必须依赖于JVM虚拟机.\\n\\n问题2: JVM 本身是否允许跨平台呢？\\n\\n- 答：不允许，允许跨平台的是 Java 程序，而不是虚拟机。\\n\"}]', '1', '1', 'java语言', '2020-09-07 15:00:59', '2020-09-07 15:00:59', '9', '2020-09-07 15:00:45', '审核通过', '1302864436297482242', 'group1/M00/00/00/wKjIgl9V2n6AArZsAAGMmaPdt7w502.png', '1');
INSERT INTO `wm_news` VALUES ('6222', '1102', '全国抗击新冠肺炎疫情表彰大会', '[{\"type\":\"image\",\"value\":\"http://192.168.200.130/group1/M00/00/00/wKjIgl9W6iOAD2doAAFY4E1K7-g384.png\"},{\"type\":\"text\",\"value\":\"全国抗击新冠肺炎疫情表彰大会开始15家“文化会客厅”展现产业发展的集群效应全球疫情简报:印度新冠确诊病例超420万 升至全球第二中方提出《全球数据安全倡议》\"}]', '1', '1', '表彰', '2020-09-08 10:20:11', '2020-09-08 10:20:11', '9', '2020-09-08 10:19:31', '审核通过', '1303156149041758210', 'group1/M00/00/00/wKjIgl9W6iOAD2doAAFY4E1K7-g384.png', '1');

-- ----------------------------
-- Table structure for wm_news_material
-- ----------------------------
DROP TABLE IF EXISTS `wm_news_material`;
CREATE TABLE `wm_news_material` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `material_id` int(11) unsigned DEFAULT NULL COMMENT '素材ID',
  `news_id` int(11) unsigned DEFAULT NULL COMMENT '图文ID',
  `type` tinyint(1) unsigned DEFAULT NULL COMMENT '引用类型\r\n            0 内容引用\r\n            1 主图引用',
  `ord` tinyint(1) unsigned DEFAULT NULL COMMENT '引用排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=237 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='自媒体图文引用素材信息表';

-- ----------------------------
-- Records of wm_news_material
-- ----------------------------
INSERT INTO `wm_news_material` VALUES ('158', '38', '6204', '0', '0');
INSERT INTO `wm_news_material` VALUES ('159', '38', '6204', '1', '0');
INSERT INTO `wm_news_material` VALUES ('166', '35', '6205', '0', '0');
INSERT INTO `wm_news_material` VALUES ('167', '36', '6205', '0', '1');
INSERT INTO `wm_news_material` VALUES ('168', '37', '6205', '0', '2');
INSERT INTO `wm_news_material` VALUES ('169', '40', '6205', '1', '0');
INSERT INTO `wm_news_material` VALUES ('170', '40', '6208', '0', '0');
INSERT INTO `wm_news_material` VALUES ('171', '38', '6208', '0', '1');
INSERT INTO `wm_news_material` VALUES ('172', '40', '6208', '1', '0');
INSERT INTO `wm_news_material` VALUES ('173', '40', '6209', '0', '0');
INSERT INTO `wm_news_material` VALUES ('174', '40', '6209', '1', '0');
INSERT INTO `wm_news_material` VALUES ('175', '40', '6210', '0', '0');
INSERT INTO `wm_news_material` VALUES ('176', '38', '6210', '0', '1');
INSERT INTO `wm_news_material` VALUES ('177', '38', '6210', '1', '0');
INSERT INTO `wm_news_material` VALUES ('178', '37', '6210', '1', '1');
INSERT INTO `wm_news_material` VALUES ('179', '35', '6210', '1', '2');
INSERT INTO `wm_news_material` VALUES ('194', '38', '6218', '0', '0');
INSERT INTO `wm_news_material` VALUES ('195', '38', '6218', '1', '0');
INSERT INTO `wm_news_material` VALUES ('202', '38', '6221', '0', '0');
INSERT INTO `wm_news_material` VALUES ('203', '38', '6221', '1', '0');
INSERT INTO `wm_news_material` VALUES ('207', '41', '6220', '0', '0');
INSERT INTO `wm_news_material` VALUES ('208', '42', '6220', '0', '1');
INSERT INTO `wm_news_material` VALUES ('209', '41', '6220', '1', '0');
INSERT INTO `wm_news_material` VALUES ('210', '43', '6221', '0', '0');
INSERT INTO `wm_news_material` VALUES ('211', '43', '6221', '1', '0');
INSERT INTO `wm_news_material` VALUES ('212', '36', '6219', '0', '0');
INSERT INTO `wm_news_material` VALUES ('213', '36', '6219', '1', '0');
INSERT INTO `wm_news_material` VALUES ('214', '32', '6216', '0', '0');
INSERT INTO `wm_news_material` VALUES ('215', '36', '6216', '1', '0');
INSERT INTO `wm_news_material` VALUES ('216', '38', '6216', '1', '1');
INSERT INTO `wm_news_material` VALUES ('217', '35', '6216', '1', '2');
INSERT INTO `wm_news_material` VALUES ('218', '34', '6215', '0', '0');
INSERT INTO `wm_news_material` VALUES ('219', '34', '6215', '1', '0');
INSERT INTO `wm_news_material` VALUES ('220', '37', '6215', '1', '1');
INSERT INTO `wm_news_material` VALUES ('221', '36', '6215', '1', '2');
INSERT INTO `wm_news_material` VALUES ('222', '31', '6217', '0', '0');
INSERT INTO `wm_news_material` VALUES ('223', '31', '6217', '1', '0');
INSERT INTO `wm_news_material` VALUES ('225', '36', '6214', '0', '0');
INSERT INTO `wm_news_material` VALUES ('226', '33', '6213', '0', '0');
INSERT INTO `wm_news_material` VALUES ('227', '32', '6213', '0', '1');
INSERT INTO `wm_news_material` VALUES ('228', '33', '6213', '1', '0');
INSERT INTO `wm_news_material` VALUES ('229', '35', '6212', '0', '0');
INSERT INTO `wm_news_material` VALUES ('230', '35', '6212', '1', '0');
INSERT INTO `wm_news_material` VALUES ('231', '34', '6211', '0', '0');
INSERT INTO `wm_news_material` VALUES ('232', '34', '6211', '1', '0');
INSERT INTO `wm_news_material` VALUES ('235', '44', '6222', '0', '0');
INSERT INTO `wm_news_material` VALUES ('236', '44', '6222', '1', '0');

-- ----------------------------
-- Table structure for wm_news_statistics
-- ----------------------------
DROP TABLE IF EXISTS `wm_news_statistics`;
CREATE TABLE `wm_news_statistics` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) unsigned DEFAULT NULL COMMENT '主账号ID',
  `article` int(11) unsigned DEFAULT NULL COMMENT '子账号ID',
  `read_count` int(11) unsigned DEFAULT NULL COMMENT '阅读量',
  `comment` int(11) unsigned DEFAULT NULL COMMENT '评论量',
  `follow` int(11) unsigned DEFAULT NULL COMMENT '关注量',
  `collection` int(11) unsigned DEFAULT NULL COMMENT '收藏量',
  `forward` int(11) unsigned DEFAULT NULL COMMENT '转发量',
  `likes` int(11) unsigned DEFAULT NULL COMMENT '点赞量',
  `unlikes` int(11) unsigned DEFAULT NULL COMMENT '不喜欢',
  `unfollow` int(11) unsigned DEFAULT NULL COMMENT '取消关注量',
  `burst` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_time` date DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_user_id_time` (`user_id`,`created_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='自媒体图文数据统计表';

-- ----------------------------
-- Records of wm_news_statistics
-- ----------------------------

-- ----------------------------
-- Table structure for wm_sub_user
-- ----------------------------
DROP TABLE IF EXISTS `wm_sub_user`;
CREATE TABLE `wm_sub_user` (
  `id` int(11) unsigned NOT NULL COMMENT '主键',
  `parent_id` int(11) unsigned DEFAULT NULL COMMENT '主账号ID',
  `children_id` int(11) unsigned DEFAULT NULL COMMENT '子账号ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='自媒体子账号信息表';

-- ----------------------------
-- Records of wm_sub_user
-- ----------------------------

-- ----------------------------
-- Table structure for wm_user
-- ----------------------------
DROP TABLE IF EXISTS `wm_user`;
CREATE TABLE `wm_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ap_user_id` int(11) DEFAULT NULL,
  `ap_author_id` int(11) DEFAULT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '登录用户名',
  `password` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '登录密码',
  `salt` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '盐',
  `nickname` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '昵称',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像',
  `location` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '归属地',
  `phone` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `status` tinyint(11) unsigned DEFAULT NULL COMMENT '状态\r\n            0 暂时不可用\r\n            1 永久不可用\r\n            9 正常可用',
  `email` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `type` tinyint(1) unsigned DEFAULT NULL COMMENT '账号类型\r\n            0 个人 \r\n            1 企业\r\n            2 子账号',
  `score` tinyint(3) unsigned DEFAULT NULL COMMENT '运营评分',
  `login_time` datetime DEFAULT NULL COMMENT '最后一次登录时间',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='自媒体用户信息表';

-- ----------------------------
-- Records of wm_user
-- ----------------------------
INSERT INTO `wm_user` VALUES ('1100', null, null, 'zhangsan', 'ab8c7c1e66a164ab6891b927550ea39a', 'abc', '小张', null, null, '13588996789', '1', null, null, null, '2020-02-17 23:51:15', '2020-02-17 23:51:18');
INSERT INTO `wm_user` VALUES ('1101', null, null, 'lisi', 'a6ecab0c246bbc87926e0fba442cc014', 'def', '小李', null, null, '13234567656', '1', null, null, null, null, null);
INSERT INTO `wm_user` VALUES ('1102', null, null, 'admin', 'a66abb5684c45962d887564f08346e8d', '123456', '管理', null, null, '13234567657', '1', null, null, null, null, '2020-03-14 09:35:13');
INSERT INTO `wm_user` VALUES ('1118', null, null, 'lisi1', '123', '123', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `wm_user` VALUES ('1119', null, null, 'shaseng', '1234', null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for wm_user_auth
-- ----------------------------
DROP TABLE IF EXISTS `wm_user_auth`;
CREATE TABLE `wm_user_auth` (
  `id` int(11) unsigned NOT NULL COMMENT '主键',
  `user_id` int(11) unsigned DEFAULT NULL COMMENT '账号ID',
  `type` tinyint(1) unsigned DEFAULT NULL COMMENT '资源类型\r\n            0 菜单\r\n            1 频道\r\n            2 按钮',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '资源名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='自媒体子账号权限信息表';

-- ----------------------------
-- Records of wm_user_auth
-- ----------------------------

-- ----------------------------
-- Table structure for wm_user_equipment
-- ----------------------------
DROP TABLE IF EXISTS `wm_user_equipment`;
CREATE TABLE `wm_user_equipment` (
  `id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned DEFAULT NULL COMMENT '用户ID',
  `type` tinyint(1) unsigned DEFAULT NULL COMMENT '0PC\r\n            1ANDROID\r\n            2IOS\r\n            3PAD\r\n            9 其他',
  `version` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '设备版本',
  `sys` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '设备系统',
  `no` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '设备唯一号，MD5加密',
  `created_time` datetime DEFAULT NULL COMMENT '登录时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='自媒体用户设备信息表';

-- ----------------------------
-- Records of wm_user_equipment
-- ----------------------------

-- ----------------------------
-- Table structure for wm_user_login
-- ----------------------------
DROP TABLE IF EXISTS `wm_user_login`;
CREATE TABLE `wm_user_login` (
  `id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned DEFAULT NULL COMMENT '用户ID',
  `equipment_id` int(11) unsigned DEFAULT NULL COMMENT '登录设备ID',
  `ip` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '登录IP',
  `address` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '登录地址',
  `longitude` decimal(5,5) DEFAULT NULL COMMENT '经度',
  `latitude` decimal(5,5) DEFAULT NULL COMMENT '纬度',
  `created_time` datetime DEFAULT NULL COMMENT '登录时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='自媒体用户登录行为信息表';

-- ----------------------------
-- Records of wm_user_login
-- ----------------------------
