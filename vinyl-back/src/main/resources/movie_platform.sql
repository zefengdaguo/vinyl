/*
 Navicat Premium Data Transfer

 Source Server         : ali
 Source Server Type    : MySQL
 Source Server Version : 50651
 Source Host           : localhost:3306
 Source Schema         : movie_platform

 Target Server Type    : MySQL
 Target Server Version : 50651
 File Encoding         : 65001

 Date: 03/05/2022 14:59:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员登录名',
  `password` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员密码，不再MD5加盐，管理员账户在数据库中直接创建。管理系统可作为另一个项目，部署在公司内网，课设为了方便，在同一系统中',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `login_name`(`login_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin1', '123');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (13, '传记');
INSERT INTO `category` VALUES (18, '冒险');
INSERT INTO `category` VALUES (1, '剧情');
INSERT INTO `category` VALUES (3, '动作');
INSERT INTO `category` VALUES (22, '动漫');
INSERT INTO `category` VALUES (6, '动画');
INSERT INTO `category` VALUES (14, '历史');
INSERT INTO `category` VALUES (2, '喜剧');
INSERT INTO `category` VALUES (17, '奇幻');
INSERT INTO `category` VALUES (9, '恐怖');
INSERT INTO `category` VALUES (7, '悬疑');
INSERT INTO `category` VALUES (8, '惊悚');
INSERT INTO `category` VALUES (15, '战争');
INSERT INTO `category` VALUES (12, '歌舞');
INSERT INTO `category` VALUES (20, '武侠');
INSERT INTO `category` VALUES (19, '灾难');
INSERT INTO `category` VALUES (4, '爱情');
INSERT INTO `category` VALUES (10, '犯罪');
INSERT INTO `category` VALUES (24, '短片');
INSERT INTO `category` VALUES (5, '科幻');
INSERT INTO `category` VALUES (23, '纪录片');
INSERT INTO `category` VALUES (21, '综艺');
INSERT INTO `category` VALUES (16, '西部');
INSERT INTO `category` VALUES (11, '音乐');

-- ----------------------------
-- Table structure for country
-- ----------------------------
DROP TABLE IF EXISTS `country`;
CREATE TABLE `country`  (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `code` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name_zh` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 253 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of country
-- ----------------------------
INSERT INTO `country` VALUES (1, 'AF', 'Afghanistan', '阿富汗');
INSERT INTO `country` VALUES (2, 'AX', 'Aland Islands', '奥兰群岛');
INSERT INTO `country` VALUES (3, 'AL', 'Albania', '阿尔巴尼亚');
INSERT INTO `country` VALUES (4, 'DZ', 'Algeria', '阿尔及利亚');
INSERT INTO `country` VALUES (5, 'AS', 'American Samoa', '美属萨摩亚');
INSERT INTO `country` VALUES (6, 'AD', 'Andorra', '安道尔');
INSERT INTO `country` VALUES (7, 'AO', 'Angola', '安哥拉');
INSERT INTO `country` VALUES (8, 'AI', 'Anguilla', '安圭拉岛');
INSERT INTO `country` VALUES (9, 'AQ', 'Antarctica', '南极洲');
INSERT INTO `country` VALUES (10, 'AG', 'Antigua and Barbuda', '安提瓜和巴布达');
INSERT INTO `country` VALUES (11, 'AR', 'Argentina', '阿根廷');
INSERT INTO `country` VALUES (12, 'AM', 'Armenia', '亚美尼亚');
INSERT INTO `country` VALUES (13, 'AW', 'Aruba', '阿鲁巴岛');
INSERT INTO `country` VALUES (14, 'AU', 'Australia', '澳大利亚');
INSERT INTO `country` VALUES (15, 'AT', 'Austria', '奥地利');
INSERT INTO `country` VALUES (16, 'AZ', 'Azerbaijan', '阿塞拜疆');
INSERT INTO `country` VALUES (17, 'BS', 'Bahamas', '巴哈马');
INSERT INTO `country` VALUES (18, 'BH', 'Bahrain', '巴林');
INSERT INTO `country` VALUES (19, 'BD', 'Bangladesh', '孟加拉国');
INSERT INTO `country` VALUES (20, 'BB', 'Barbados', '巴巴多斯');
INSERT INTO `country` VALUES (21, 'BY', 'Belarus', '白俄罗斯');
INSERT INTO `country` VALUES (22, 'BE', 'Belgium', '比利时');
INSERT INTO `country` VALUES (23, 'BZ', 'Belize', '伯利兹');
INSERT INTO `country` VALUES (24, 'BJ', 'Benin', '贝宁');
INSERT INTO `country` VALUES (25, 'BM', 'Bermuda', '百慕大');
INSERT INTO `country` VALUES (26, 'BT', 'Bhutan', '不丹');
INSERT INTO `country` VALUES (27, 'BO', 'Bolivia', '玻利维亚');
INSERT INTO `country` VALUES (28, 'BQ', 'Bonaire, Sint Eustatius and Saba', '博内尔，圣尤斯特歇斯和萨巴');
INSERT INTO `country` VALUES (29, 'BA', 'Bosnia and Herzegovina', '波斯尼亚和黑塞哥维那（简称：波黑');
INSERT INTO `country` VALUES (30, 'BW', 'Botswana', '博茨瓦纳');
INSERT INTO `country` VALUES (31, 'BV', 'Bouvet Island', '布维岛');
INSERT INTO `country` VALUES (32, 'BR', 'Brazil', '巴西');
INSERT INTO `country` VALUES (33, 'IO', 'British Indian Ocean Territory', '英属印度洋领地');
INSERT INTO `country` VALUES (34, 'BN', 'Brunei Darussalam', '文莱达鲁萨兰国');
INSERT INTO `country` VALUES (35, 'BG', 'Bulgaria', '保加利亚');
INSERT INTO `country` VALUES (36, 'BF', 'Burkina Faso', '布基纳法索');
INSERT INTO `country` VALUES (37, 'BI', 'Burundi', '布隆迪');
INSERT INTO `country` VALUES (38, 'KH', 'Cambodia', '柬埔寨');
INSERT INTO `country` VALUES (39, 'CM', 'Cameroon', '喀麦隆');
INSERT INTO `country` VALUES (40, 'CA', 'Canada', '加拿大');
INSERT INTO `country` VALUES (41, 'CV', 'Cape Verde', '佛得角');
INSERT INTO `country` VALUES (42, 'KY', 'Cayman Islands', '开曼群岛');
INSERT INTO `country` VALUES (43, 'CF', 'Central African Republic', '中非共和国');
INSERT INTO `country` VALUES (44, 'TD', 'Chad', '乍得');
INSERT INTO `country` VALUES (45, 'CL', 'Chile', '智利');
INSERT INTO `country` VALUES (46, 'CN', 'China', '中国');
INSERT INTO `country` VALUES (47, 'CX', 'Christmas Island', '圣诞岛');
INSERT INTO `country` VALUES (48, 'CC', 'Cocos (Keeling) Islands', '科科斯（基林）群岛');
INSERT INTO `country` VALUES (49, 'CO', 'Colombia', '哥伦比亚');
INSERT INTO `country` VALUES (50, 'KM', 'Comoros', '科摩罗');
INSERT INTO `country` VALUES (51, 'CG', 'Congo', '刚果');
INSERT INTO `country` VALUES (52, 'CD', 'Congo, Democratic Republic of the Congo', '刚果民主共和国');
INSERT INTO `country` VALUES (53, 'CK', 'Cook Islands', '库克群岛');
INSERT INTO `country` VALUES (54, 'CR', 'Costa Rica', '哥斯达黎加');
INSERT INTO `country` VALUES (55, 'CI', 'Cote D\'Ivoire', '科特迪瓦');
INSERT INTO `country` VALUES (56, 'HR', 'Croatia', '克罗地亚');
INSERT INTO `country` VALUES (57, 'CU', 'Cuba', '古巴');
INSERT INTO `country` VALUES (58, 'CW', 'Curacao', '库拉索');
INSERT INTO `country` VALUES (59, 'CY', 'Cyprus', '塞浦路斯');
INSERT INTO `country` VALUES (60, 'CZ', 'Czech Republic', '捷克共和国');
INSERT INTO `country` VALUES (61, 'DK', 'Denmark', '丹麦');
INSERT INTO `country` VALUES (62, 'DJ', 'Djibouti', '吉布地');
INSERT INTO `country` VALUES (63, 'DM', 'Dominica', '多米尼加');
INSERT INTO `country` VALUES (64, 'DO', 'Dominican Republic', '多明尼加共和国');
INSERT INTO `country` VALUES (65, 'EC', 'Ecuador', '厄瓜多尔');
INSERT INTO `country` VALUES (66, 'EG', 'Egypt', '埃及');
INSERT INTO `country` VALUES (67, 'SV', 'El Salvador', '萨尔瓦多');
INSERT INTO `country` VALUES (68, 'GQ', 'Equatorial Guinea', '赤道几内亚');
INSERT INTO `country` VALUES (69, 'ER', 'Eritrea', '厄立特里亚');
INSERT INTO `country` VALUES (70, 'EE', 'Estonia', '爱沙尼亚');
INSERT INTO `country` VALUES (71, 'ET', 'Ethiopia', '埃塞俄比亚');
INSERT INTO `country` VALUES (72, 'FK', 'Falkland Islands (Malvinas)', '福克兰群岛（马尔维纳斯）');
INSERT INTO `country` VALUES (73, 'FO', 'Faroe Islands', '法罗群岛');
INSERT INTO `country` VALUES (74, 'FJ', 'Fiji', '斐济');
INSERT INTO `country` VALUES (75, 'FI', 'Finland', '芬兰');
INSERT INTO `country` VALUES (76, 'FR', 'France', '法国');
INSERT INTO `country` VALUES (77, 'GF', 'French Guiana', '法属圭亚那');
INSERT INTO `country` VALUES (78, 'PF', 'French Polynesia', '法属波利尼西亚');
INSERT INTO `country` VALUES (79, 'TF', 'French Southern Territories', '法属南部领地');
INSERT INTO `country` VALUES (80, 'GA', 'Gabon', '加蓬');
INSERT INTO `country` VALUES (81, 'GM', 'Gambia', '冈比亚');
INSERT INTO `country` VALUES (82, 'GE', 'Georgia', '乔治亚州');
INSERT INTO `country` VALUES (83, 'DE', 'Germany', '德国');
INSERT INTO `country` VALUES (84, 'GH', 'Ghana', '加纳');
INSERT INTO `country` VALUES (85, 'GI', 'Gibraltar', '直布罗陀');
INSERT INTO `country` VALUES (86, 'GR', 'Greece', '希腊');
INSERT INTO `country` VALUES (87, 'GL', 'Greenland', '格陵兰');
INSERT INTO `country` VALUES (88, 'GD', 'Grenada', '格林纳达');
INSERT INTO `country` VALUES (89, 'GP', 'Guadeloupe', '瓜德罗普岛');
INSERT INTO `country` VALUES (90, 'GU', 'Guam', '关岛');
INSERT INTO `country` VALUES (91, 'GT', 'Guatemala', '危地马拉');
INSERT INTO `country` VALUES (92, 'GG', 'Guernsey', '根西岛');
INSERT INTO `country` VALUES (93, 'GN', 'Guinea', '几内亚');
INSERT INTO `country` VALUES (94, 'GW', 'Guinea-Bissau', '几内亚比绍');
INSERT INTO `country` VALUES (95, 'GY', 'Guyana', '圭亚那');
INSERT INTO `country` VALUES (96, 'HT', 'Haiti', '海地');
INSERT INTO `country` VALUES (97, 'HM', 'Heard Island and McDonald Islands', '希尔德岛和麦当劳群岛');
INSERT INTO `country` VALUES (98, 'VA', 'Holy See (Vatican City State)', '罗马教廷（梵蒂冈城国）');
INSERT INTO `country` VALUES (99, 'HN', 'Honduras', '洪都拉斯');
INSERT INTO `country` VALUES (100, 'HK', 'Hong Kong', '香港');
INSERT INTO `country` VALUES (101, 'HU', 'Hungary', '匈牙利');
INSERT INTO `country` VALUES (102, 'IS', 'Iceland', '冰岛');
INSERT INTO `country` VALUES (103, 'IN', 'India', '印度');
INSERT INTO `country` VALUES (104, 'ID', 'Indonesia', '印度尼西亚');
INSERT INTO `country` VALUES (105, 'IR', 'Iran, Islamic Republic of', '伊朗伊斯兰共和国');
INSERT INTO `country` VALUES (106, 'IQ', 'Iraq', '伊拉克');
INSERT INTO `country` VALUES (107, 'IE', 'Ireland', '爱尔兰');
INSERT INTO `country` VALUES (108, 'IM', 'Isle of Man', '马恩岛');
INSERT INTO `country` VALUES (109, 'IL', 'Israel', '以色列');
INSERT INTO `country` VALUES (110, 'IT', 'Italy', '意大利');
INSERT INTO `country` VALUES (111, 'JM', 'Jamaica', '的牙买加');
INSERT INTO `country` VALUES (112, 'JP', 'Japan', '日本');
INSERT INTO `country` VALUES (113, 'JE', 'Jersey', '球衣');
INSERT INTO `country` VALUES (114, 'JO', 'Jordan', '约旦');
INSERT INTO `country` VALUES (115, 'KZ', 'Kazakhstan', '哈萨克斯坦');
INSERT INTO `country` VALUES (116, 'KE', 'Kenya', '肯尼亚');
INSERT INTO `country` VALUES (117, 'KI', 'Kiribati', '基里巴斯');
INSERT INTO `country` VALUES (118, 'KP', 'Korea, Democratic People\'s Republic of', '韩国，朝鲜民主主义人民共和国');
INSERT INTO `country` VALUES (119, 'KR', 'Korea, Republic of', '韩国');
INSERT INTO `country` VALUES (120, 'XK', 'Kosovo', '科索沃');
INSERT INTO `country` VALUES (121, 'KW', 'Kuwait', '科威特');
INSERT INTO `country` VALUES (122, 'KG', 'Kyrgyzstan', '吉尔吉斯斯坦');
INSERT INTO `country` VALUES (123, 'LA', 'Lao People\'s Democratic Republic', '老挝人民民主共和国');
INSERT INTO `country` VALUES (124, 'LV', 'Latvia', '拉脱维亚');
INSERT INTO `country` VALUES (125, 'LB', 'Lebanon', '黎巴嫩的');
INSERT INTO `country` VALUES (126, 'LS', 'Lesotho', '莱索托');
INSERT INTO `country` VALUES (127, 'LR', 'Liberia', '利比里亚');
INSERT INTO `country` VALUES (128, 'LY', 'Libyan Arab Jamahiriya', '阿拉伯利比亚民众国');
INSERT INTO `country` VALUES (129, 'LI', 'Liechtenstein', '列支敦士登');
INSERT INTO `country` VALUES (130, 'LT', 'Lithuania', '立陶宛');
INSERT INTO `country` VALUES (131, 'LU', 'Luxembourg', '卢森堡');
INSERT INTO `country` VALUES (132, 'MO', 'Macao', '澳门');
INSERT INTO `country` VALUES (133, 'MK', 'Macedonia, the Former Yugoslav Republic of', '前南斯拉夫共和国马其顿');
INSERT INTO `country` VALUES (134, 'MG', 'Madagascar', '马达加斯加');
INSERT INTO `country` VALUES (135, 'MW', 'Malawi', '马拉维');
INSERT INTO `country` VALUES (136, 'MY', 'Malaysia', '马来西亚');
INSERT INTO `country` VALUES (137, 'MV', 'Maldives', '马尔代夫');
INSERT INTO `country` VALUES (138, 'ML', 'Mali', '马里');
INSERT INTO `country` VALUES (139, 'MT', 'Malta', '马耳他');
INSERT INTO `country` VALUES (140, 'MH', 'Marshall Islands', '马绍尔群岛');
INSERT INTO `country` VALUES (141, 'MQ', 'Martinique', '马提尼克岛');
INSERT INTO `country` VALUES (142, 'MR', 'Mauritania', '毛里塔尼亚');
INSERT INTO `country` VALUES (143, 'MU', 'Mauritius', '毛里求斯');
INSERT INTO `country` VALUES (144, 'YT', 'Mayotte', '马约特岛');
INSERT INTO `country` VALUES (145, 'MX', 'Mexico', '墨西哥');
INSERT INTO `country` VALUES (146, 'FM', 'Micronesia, Federated States of', '密克罗尼西亚联邦');
INSERT INTO `country` VALUES (147, 'MD', 'Moldova, Republic of', '摩尔多瓦共和国');
INSERT INTO `country` VALUES (148, 'MC', 'Monaco', '摩纳哥');
INSERT INTO `country` VALUES (149, 'MN', 'Mongolia', '蒙古');
INSERT INTO `country` VALUES (150, 'ME', 'Montenegro', '黑山共和国');
INSERT INTO `country` VALUES (151, 'MS', 'Montserrat', '蒙特塞拉特');
INSERT INTO `country` VALUES (152, 'MA', 'Morocco', '摩洛哥');
INSERT INTO `country` VALUES (153, 'MZ', 'Mozambique', '莫桑比克');
INSERT INTO `country` VALUES (154, 'MM', 'Myanmar', '缅甸');
INSERT INTO `country` VALUES (155, 'NA', 'Namibia', '纳米比亚');
INSERT INTO `country` VALUES (156, 'NR', 'Nauru', '瑙鲁');
INSERT INTO `country` VALUES (157, 'NP', 'Nepal', '尼尼泊尔');
INSERT INTO `country` VALUES (158, 'NL', 'Netherlands', '荷兰');
INSERT INTO `country` VALUES (159, 'AN', 'Netherlands Antilles', '荷属安的列斯');
INSERT INTO `country` VALUES (160, 'NC', 'New Caledonia', '新喀里多尼亚');
INSERT INTO `country` VALUES (161, 'NZ', 'New Zealand', '新西兰');
INSERT INTO `country` VALUES (162, 'NI', 'Nicaragua', '尼加拉瓜');
INSERT INTO `country` VALUES (163, 'NE', 'Niger', '尼日尔');
INSERT INTO `country` VALUES (164, 'NG', 'Nigeria', '奈及利亚');
INSERT INTO `country` VALUES (165, 'NU', 'Niue', '纽埃');
INSERT INTO `country` VALUES (166, 'NF', 'Norfolk Island', '诺福克岛');
INSERT INTO `country` VALUES (167, 'MP', 'Northern Mariana Islands', '北马里亚纳群岛');
INSERT INTO `country` VALUES (168, 'NO', 'Norway', '挪威');
INSERT INTO `country` VALUES (169, 'OM', 'Oman', '阿曼');
INSERT INTO `country` VALUES (170, 'PK', 'Pakistan', '巴基斯坦');
INSERT INTO `country` VALUES (171, 'PW', 'Palau', 'u琉');
INSERT INTO `country` VALUES (172, 'PS', 'Palestinian Territory, Occupied', '被占领的巴勒斯坦领土');
INSERT INTO `country` VALUES (173, 'PA', 'Panama', '巴拿马');
INSERT INTO `country` VALUES (174, 'PG', 'Papua New Guinea', '巴布亚新几内亚');
INSERT INTO `country` VALUES (175, 'PY', 'Paraguay', '巴拉圭');
INSERT INTO `country` VALUES (176, 'PE', 'Peru', '秘鲁');
INSERT INTO `country` VALUES (177, 'PH', 'Philippines', '菲律宾');
INSERT INTO `country` VALUES (178, 'PN', 'Pitcairn', '皮特凯恩');
INSERT INTO `country` VALUES (179, 'PL', 'Poland', '波兰');
INSERT INTO `country` VALUES (180, 'PT', 'Portugal', '葡萄牙');
INSERT INTO `country` VALUES (181, 'PR', 'Puerto Rico', '波多黎各');
INSERT INTO `country` VALUES (182, 'QA', 'Qatar', '卡塔尔');
INSERT INTO `country` VALUES (183, 'RE', 'Reunion', '团圆');
INSERT INTO `country` VALUES (184, 'RO', 'Romania', '罗马尼亚');
INSERT INTO `country` VALUES (185, 'RU', 'Russian Federation', '俄罗斯联邦');
INSERT INTO `country` VALUES (186, 'RW', 'Rwanda', '卢旺达');
INSERT INTO `country` VALUES (187, 'BL', 'Saint Barthelemy', '圣巴托洛缪岛');
INSERT INTO `country` VALUES (188, 'SH', 'Saint Helena', '圣海伦娜');
INSERT INTO `country` VALUES (189, 'KN', 'Saint Kitts and Nevis', '圣基茨和尼维斯');
INSERT INTO `country` VALUES (190, 'LC', 'Saint Lucia', '圣卢西亚');
INSERT INTO `country` VALUES (191, 'MF', 'Saint Martin', '圣马丁');
INSERT INTO `country` VALUES (192, 'PM', 'Saint Pierre and Miquelon', '圣皮埃尔和密克隆群岛');
INSERT INTO `country` VALUES (193, 'VC', 'Saint Vincent and the Grenadines', '圣文森特和格林纳丁斯');
INSERT INTO `country` VALUES (194, 'WS', 'Samoa', '萨摩亚');
INSERT INTO `country` VALUES (195, 'SM', 'San Marino', '圣马力诺');
INSERT INTO `country` VALUES (196, 'ST', 'Sao Tome and Principe', '圣多美和普林西比');
INSERT INTO `country` VALUES (197, 'SA', 'Saudi Arabia', '沙特阿拉伯');
INSERT INTO `country` VALUES (198, 'SN', 'Senegal', '塞内加尔');
INSERT INTO `country` VALUES (199, 'RS', 'Serbia', '塞尔维亚');
INSERT INTO `country` VALUES (200, 'CS', 'Serbia and Montenegro', '塞尔维亚和黑山');
INSERT INTO `country` VALUES (201, 'SC', 'Seychelles', '塞舌尔');
INSERT INTO `country` VALUES (202, 'SL', 'Sierra Leone', '塞拉利昂');
INSERT INTO `country` VALUES (203, 'SG', 'Singapore', '新加坡');
INSERT INTO `country` VALUES (204, 'SX', 'St Martin', '圣马丁');
INSERT INTO `country` VALUES (205, 'SK', 'Slovakia', '斯洛伐克');
INSERT INTO `country` VALUES (206, 'SI', 'Slovenia', '斯洛文尼亚');
INSERT INTO `country` VALUES (207, 'SB', 'Solomon Islands', '所罗门群岛');
INSERT INTO `country` VALUES (208, 'SO', 'Somalia', '索马里');
INSERT INTO `country` VALUES (209, 'ZA', 'South Africa', '南非');
INSERT INTO `country` VALUES (210, 'GS', 'South Georgia and the South Sandwich Islands', '南乔治亚岛和南桑威奇群岛');
INSERT INTO `country` VALUES (211, 'SS', 'South Sudan', '南苏丹');
INSERT INTO `country` VALUES (212, 'ES', 'Spain', '西班牙');
INSERT INTO `country` VALUES (213, 'LK', 'Sri Lanka', '斯里兰卡');
INSERT INTO `country` VALUES (214, 'SD', 'Sudan', '苏丹');
INSERT INTO `country` VALUES (215, 'SR', 'Suriname', '苏里南');
INSERT INTO `country` VALUES (216, 'SJ', 'Svalbard and Jan Mayen', '斯瓦尔巴和扬·马延');
INSERT INTO `country` VALUES (217, 'SZ', 'Swaziland', '斯威士兰');
INSERT INTO `country` VALUES (218, 'SE', 'Sweden', '瑞典');
INSERT INTO `country` VALUES (219, 'CH', 'Switzerland', '瑞士');
INSERT INTO `country` VALUES (220, 'SY', 'Syrian Arab Republic', '阿拉伯叙利亚共和国');
INSERT INTO `country` VALUES (221, 'TW', 'Taiwan, Province of China', '中国台湾省');
INSERT INTO `country` VALUES (222, 'TJ', 'Tajikistan', '塔吉克斯坦');
INSERT INTO `country` VALUES (223, 'TZ', 'Tanzania, United Republic of', '坦桑尼亚联合共和国');
INSERT INTO `country` VALUES (224, 'TH', 'Thailand', '泰国');
INSERT INTO `country` VALUES (225, 'TL', 'Timor-Leste', '东帝汶');
INSERT INTO `country` VALUES (226, 'TG', 'Togo', '多哥');
INSERT INTO `country` VALUES (227, 'TK', 'Tokelau', '托克劳');
INSERT INTO `country` VALUES (228, 'TO', 'Tonga', '汤加');
INSERT INTO `country` VALUES (229, 'TT', 'Trinidad and Tobago', '特立尼达和多巴哥');
INSERT INTO `country` VALUES (230, 'TN', 'Tunisia', '突尼斯');
INSERT INTO `country` VALUES (231, 'TR', 'Turkey', '火鸡');
INSERT INTO `country` VALUES (232, 'TM', 'Turkmenistan', '土库曼斯坦');
INSERT INTO `country` VALUES (233, 'TC', 'Turks and Caicos Islands', '特克斯和凯科斯群岛');
INSERT INTO `country` VALUES (234, 'TV', 'Tuvalu', '图瓦卢');
INSERT INTO `country` VALUES (235, 'UG', 'Uganda', '乌干达');
INSERT INTO `country` VALUES (236, 'UA', 'Ukraine', '乌克兰');
INSERT INTO `country` VALUES (237, 'AE', 'United Arab Emirates', '阿拉伯联合酋长国');
INSERT INTO `country` VALUES (238, 'GB', 'United Kingdom', '英国');
INSERT INTO `country` VALUES (239, 'US', 'United States', '美国');
INSERT INTO `country` VALUES (240, 'UM', 'United States Minor Outlying Islands', '美国本土外小岛屿');
INSERT INTO `country` VALUES (241, 'UY', 'Uruguay', '乌拉圭');
INSERT INTO `country` VALUES (242, 'UZ', 'Uzbekistan', '乌兹别克斯坦');
INSERT INTO `country` VALUES (243, 'VU', 'Vanuatu', '瓦努阿图');
INSERT INTO `country` VALUES (244, 'VE', 'Venezuela', '委内瑞拉');
INSERT INTO `country` VALUES (245, 'VN', 'Viet Nam', '越南');
INSERT INTO `country` VALUES (246, 'VG', 'Virgin Islands, British', '英属维尔京群岛');
INSERT INTO `country` VALUES (247, 'VI', 'Virgin Islands, U.s.', '美国维尔京群岛');
INSERT INTO `country` VALUES (248, 'WF', 'Wallis and Futuna', '瓦利斯和富图纳群岛');
INSERT INTO `country` VALUES (249, 'EH', 'Western Sahara', '西撒哈拉');
INSERT INTO `country` VALUES (250, 'YE', 'Yemen', '也门');
INSERT INTO `country` VALUES (251, 'ZM', 'Zambia', '赞比亚');
INSERT INTO `country` VALUES (252, 'ZW', 'Zimbabwe', '津巴布韦');

-- ----------------------------
-- Table structure for language
-- ----------------------------
DROP TABLE IF EXISTS `language`;
CREATE TABLE `language`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` char(49) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `iso639` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'iso_639-1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 136 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of language
-- ----------------------------
INSERT INTO `language` VALUES (1, 'English', 'en');
INSERT INTO `language` VALUES (2, 'Afar', 'aa');
INSERT INTO `language` VALUES (3, 'Abkhazian', 'ab');
INSERT INTO `language` VALUES (4, 'Afrikaans', 'af');
INSERT INTO `language` VALUES (5, 'Amharic', 'am');
INSERT INTO `language` VALUES (6, 'Arabic', 'ar');
INSERT INTO `language` VALUES (7, 'Assamese', 'as');
INSERT INTO `language` VALUES (8, 'Aymara', 'ay');
INSERT INTO `language` VALUES (9, 'Azerbaijani', 'az');
INSERT INTO `language` VALUES (10, 'Bashkir', 'ba');
INSERT INTO `language` VALUES (11, 'Belarusian', 'be');
INSERT INTO `language` VALUES (12, 'Bulgarian', 'bg');
INSERT INTO `language` VALUES (13, 'Bihari', 'bh');
INSERT INTO `language` VALUES (14, 'Bislama', 'bi');
INSERT INTO `language` VALUES (15, 'Bengali/Bangla', 'bn');
INSERT INTO `language` VALUES (16, 'Tibetan', 'bo');
INSERT INTO `language` VALUES (17, 'Breton', 'br');
INSERT INTO `language` VALUES (18, 'Catalan', 'ca');
INSERT INTO `language` VALUES (19, 'Corsican', 'co');
INSERT INTO `language` VALUES (20, 'Czech', 'cs');
INSERT INTO `language` VALUES (21, 'Welsh', 'cy');
INSERT INTO `language` VALUES (22, 'Danish', 'da');
INSERT INTO `language` VALUES (23, 'German', 'de');
INSERT INTO `language` VALUES (24, 'Bhutani', 'dz');
INSERT INTO `language` VALUES (25, 'Greek', 'el');
INSERT INTO `language` VALUES (26, 'Esperanto', 'eo');
INSERT INTO `language` VALUES (27, 'Spanish', 'es');
INSERT INTO `language` VALUES (28, 'Estonian', 'et');
INSERT INTO `language` VALUES (29, 'Basque', 'eu');
INSERT INTO `language` VALUES (30, 'Persian', 'fa');
INSERT INTO `language` VALUES (31, 'Finnish', 'fi');
INSERT INTO `language` VALUES (32, 'Fiji', 'fj');
INSERT INTO `language` VALUES (33, 'Faeroese', 'fo');
INSERT INTO `language` VALUES (34, 'French', 'fr');
INSERT INTO `language` VALUES (35, 'Frisian', 'fy');
INSERT INTO `language` VALUES (36, 'Irish', 'ga');
INSERT INTO `language` VALUES (37, 'Scots/Gaelic', 'gd');
INSERT INTO `language` VALUES (38, 'Galician', 'gl');
INSERT INTO `language` VALUES (39, 'Guarani', 'gn');
INSERT INTO `language` VALUES (40, 'Gujarati', 'gu');
INSERT INTO `language` VALUES (41, 'Hausa', 'ha');
INSERT INTO `language` VALUES (42, 'Hindi', 'hi');
INSERT INTO `language` VALUES (43, 'Croatian', 'hr');
INSERT INTO `language` VALUES (44, 'Hungarian', 'hu');
INSERT INTO `language` VALUES (45, 'Armenian', 'hy');
INSERT INTO `language` VALUES (46, 'Interlingua', 'ia');
INSERT INTO `language` VALUES (47, 'Interlingue', 'ie');
INSERT INTO `language` VALUES (48, 'Inupiak', 'ik');
INSERT INTO `language` VALUES (49, 'Indonesian', 'in');
INSERT INTO `language` VALUES (50, 'Icelandic', 'is');
INSERT INTO `language` VALUES (51, 'Italian', 'it');
INSERT INTO `language` VALUES (52, 'Hebrew', 'iw');
INSERT INTO `language` VALUES (53, 'Japanese', 'ja');
INSERT INTO `language` VALUES (54, 'Yiddish', 'ji');
INSERT INTO `language` VALUES (55, 'Javanese', 'jw');
INSERT INTO `language` VALUES (56, 'Georgian', 'ka');
INSERT INTO `language` VALUES (57, 'Kazakh', 'kk');
INSERT INTO `language` VALUES (58, 'Greenlandic', 'kl');
INSERT INTO `language` VALUES (59, 'Cambodian', 'km');
INSERT INTO `language` VALUES (60, 'Kannada', 'kn');
INSERT INTO `language` VALUES (61, 'Korean', 'ko');
INSERT INTO `language` VALUES (62, 'Kashmiri', 'ks');
INSERT INTO `language` VALUES (63, 'Kurdish', 'ku');
INSERT INTO `language` VALUES (64, 'Kirghiz', 'ky');
INSERT INTO `language` VALUES (65, 'Latin', 'la');
INSERT INTO `language` VALUES (66, 'Lingala', 'ln');
INSERT INTO `language` VALUES (67, 'Laothian', 'lo');
INSERT INTO `language` VALUES (68, 'Lithuanian', 'lt');
INSERT INTO `language` VALUES (69, 'Latvian/Lettish', 'lv');
INSERT INTO `language` VALUES (70, 'Malagasy', 'mg');
INSERT INTO `language` VALUES (71, 'Maori', 'mi');
INSERT INTO `language` VALUES (72, 'Macedonian', 'mk');
INSERT INTO `language` VALUES (73, 'Malayalam', 'ml');
INSERT INTO `language` VALUES (74, 'Mongolian', 'mn');
INSERT INTO `language` VALUES (75, 'Moldavian', 'mo');
INSERT INTO `language` VALUES (76, 'Marathi', 'mr');
INSERT INTO `language` VALUES (77, 'Malay', 'ms');
INSERT INTO `language` VALUES (78, 'Maltese', 'mt');
INSERT INTO `language` VALUES (79, 'Burmese', 'my');
INSERT INTO `language` VALUES (80, 'Nauru', 'na');
INSERT INTO `language` VALUES (81, 'Nepali', 'ne');
INSERT INTO `language` VALUES (82, 'Dutch', 'nl');
INSERT INTO `language` VALUES (83, 'Norwegian', 'no');
INSERT INTO `language` VALUES (84, 'Occitan', 'oc');
INSERT INTO `language` VALUES (85, '(Afan)/Oromoor/Oriya', 'om');
INSERT INTO `language` VALUES (86, 'Punjabi', 'pa');
INSERT INTO `language` VALUES (87, 'Polish', 'pl');
INSERT INTO `language` VALUES (88, 'Pashto/Pushto', 'ps');
INSERT INTO `language` VALUES (89, 'Portuguese', 'pt');
INSERT INTO `language` VALUES (90, 'Quechua', 'qu');
INSERT INTO `language` VALUES (91, 'Rhaeto-Romance', 'rm');
INSERT INTO `language` VALUES (92, 'Kirundi', 'rn');
INSERT INTO `language` VALUES (93, 'Romanian', 'ro');
INSERT INTO `language` VALUES (94, 'Russian', 'ru');
INSERT INTO `language` VALUES (95, 'Kinyarwanda', 'rw');
INSERT INTO `language` VALUES (96, 'Sanskrit', 'sa');
INSERT INTO `language` VALUES (97, 'Sindhi', 'sd');
INSERT INTO `language` VALUES (98, 'Sangro', 'sg');
INSERT INTO `language` VALUES (99, 'Serbo-Croatian', 'sh');
INSERT INTO `language` VALUES (100, 'Singhalese', 'si');
INSERT INTO `language` VALUES (101, 'Slovak', 'sk');
INSERT INTO `language` VALUES (102, 'Slovenian', 'sl');
INSERT INTO `language` VALUES (103, 'Samoan', 'sm');
INSERT INTO `language` VALUES (104, 'Shona', 'sn');
INSERT INTO `language` VALUES (105, 'Somali', 'so');
INSERT INTO `language` VALUES (106, 'Albanian', 'sq');
INSERT INTO `language` VALUES (107, 'Serbian', 'sr');
INSERT INTO `language` VALUES (108, 'Siswati', 'ss');
INSERT INTO `language` VALUES (109, 'Sesotho', 'st');
INSERT INTO `language` VALUES (110, 'Sundanese', 'su');
INSERT INTO `language` VALUES (111, 'Swedish', 'sv');
INSERT INTO `language` VALUES (112, 'Swahili', 'sw');
INSERT INTO `language` VALUES (113, 'Tamil', 'ta');
INSERT INTO `language` VALUES (114, 'Telugu', 'te');
INSERT INTO `language` VALUES (115, 'Tajik', 'tg');
INSERT INTO `language` VALUES (116, 'Thai', 'th');
INSERT INTO `language` VALUES (117, 'Tigrinya', 'ti');
INSERT INTO `language` VALUES (118, 'Turkmen', 'tk');
INSERT INTO `language` VALUES (119, 'Tagalog', 'tl');
INSERT INTO `language` VALUES (120, 'Setswana', 'tn');
INSERT INTO `language` VALUES (121, 'Tonga', 'to');
INSERT INTO `language` VALUES (122, 'Turkish', 'tr');
INSERT INTO `language` VALUES (123, 'Tsonga', 'ts');
INSERT INTO `language` VALUES (124, 'Tatar', 'tt');
INSERT INTO `language` VALUES (125, 'Twi', 'tw');
INSERT INTO `language` VALUES (126, 'Ukrainian', 'uk');
INSERT INTO `language` VALUES (127, 'Urdu', 'ur');
INSERT INTO `language` VALUES (128, 'Uzbek', 'uz');
INSERT INTO `language` VALUES (129, 'Vietnamese', 'vi');
INSERT INTO `language` VALUES (130, 'Volapuk', 'vo');
INSERT INTO `language` VALUES (131, 'Wolof', 'wo');
INSERT INTO `language` VALUES (132, 'Xhosa', 'xh');
INSERT INTO `language` VALUES (133, 'Yoruba', 'yo');
INSERT INTO `language` VALUES (134, 'Chinese', 'zh');
INSERT INTO `language` VALUES (135, 'Zulu', 'zu');

-- ----------------------------
-- Table structure for movie
-- ----------------------------
DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `original_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '原名',
  `year` year NOT NULL DEFAULT 0000 COMMENT '上映年份',
  `release_date` date NOT NULL DEFAULT '0000-01-01' COMMENT '上映日期',
  `poster_path` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '海报路径',
  `runtime` smallint(6) NOT NULL DEFAULT 0 COMMENT '片长',
  `is_tv` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否为剧集：0电影；1剧集',
  `episode_number` smallint(6) NOT NULL DEFAULT 0 COMMENT '剧集的集数',
  `rate` float(4, 2) UNSIGNED ZEROFILL NOT NULL DEFAULT 0.00 COMMENT '评分',
  `overview` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '影片简介',
  `is_able` bit(1) NOT NULL DEFAULT b'0' COMMENT '资料经过管理员审核才能通过，默认0',
  `creator` int(11) NOT NULL DEFAULT 0 COMMENT '创建资料的用户的id，0表示管理员',
  `last_update` bigint(20) NOT NULL COMMENT '上次修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `title_index`(`title`) USING BTREE,
  INDEX `otitle_index`(`original_title`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of movie
-- ----------------------------
INSERT INTO `movie` VALUES (1, '四海', 'Only Fools Rush In', 2022, '2022-02-01', 'bddc608e-5272-4393-8d9b-8ce170a9e3d1.webp', 128, 0, 0, 0.00, '　　在码头做摩托车特技表演顺便拉客的年轻人吴仁耀（刘昊然 饰），他多年不见的浪荡父亲吴仁腾（沈腾 饰）；梦想大城市生活的餐馆服务员周欢颂和他浮夸真诚的哥哥周欢歌。一支从没有赢过一场比赛的“不败传说”车队频频出战，一群可笑又可爱的小人物命运交织。阿耀和欢颂都立志活成自己亲人的反面，想彼此取暖，彼此独立，却又总不在一个频道上。世事无常，他们不得不背井离乡，迎接一场未知旅途，阿耀的一身技能竟会用在一个自己都意想不到的场合，他的亲情友情和爱情最终又将会是如何……', b'1', 0, 1651552364104);
INSERT INTO `movie` VALUES (2, '新蝙蝠侠', 'The Batman', 2022, '2022-03-04', '56d9b446-5ef0-4c4b-b0c0-72a763420c45.webp', 176, 0, 0, 0.00, '　　布鲁斯·韦恩（罗伯特·帕丁森 饰）化身蝙蝠侠于哥谭市行侠仗义两年后，罪犯皆闻风丧胆，他也因此深入接触到哥谭市的阴暗面。他潜行于哥谭市腐败的政要名流关系网中，身边仅有的几个值得信赖的盟友——管家阿尔弗雷德·潘尼沃斯（安迪·瑟金斯 饰）与詹姆斯·戈登警长（杰弗里·怀特 饰）。这位独行的“义警侠探”在哥谭市民心中已成为“复仇”二字最当仁不让的代名词。', b'1', 0, 1651553204416);
INSERT INTO `movie` VALUES (3, '皆为爱', 'The Windshield Wiper', 2021, '2021-07-01', 'fdacb3c7-6a92-45b0-b2f3-2b2eada5c506.webp', 15, 0, 0, 0.00, '　　在一家咖啡馆内，当抽着一整包烟时，一个男人提出了一个雄心勃勃的问题。\"什么是爱？\"。一系列的小插曲和情况将引导这个男人达到预期的结论。', b'1', 0, 1651555858871);
INSERT INTO `movie` VALUES (5, '盲流感', 'Blindness', 2008, '2008-05-14', 'e74ee4e3-53a4-4b69-a81b-361100eec884.webp', 121, 0, 0, 0.00, '　　诺贝尔奖得主Jose Saramago的小说《Blindness》将被搬上电影舞台。书中描述了一个陷入致盲病毒的城市，导火线从一名司机点燃，突然失明后，他得到了一个人的善意帮助，这条线继续燃烧下去，眼科医生也来帮助他们了，故事就这样开始了。所有的致盲者都被关进了一座废弃的精神病院，重兵把守，不惜生命的代价也要制止疾病的扩散。 Julianne Moore将扮演唯一没有失明的人——医生的善良妻子， 著名黑人电影人Danny Glover在片中扮演一名致盲的黑人老者。尽管主角来自美国，但这部电影是由日本、巴西、加拿大合拍的国际性电影。', b'1', 0, 1651556469664);
INSERT INTO `movie` VALUES (6, '超新约全书', 'Le tout nouveau testament', 2015, '2015-05-17', 'dc7c6f4f-2be8-4771-91dd-76dadf57049c.webp', 113, 0, 0, 0.00, '　　全能的神确实存在，并且居于布鲁塞尔寻常住宅？还用电脑掌管一切生命？《小英雄杜杜》鬼才导演继《小国民尼谟》后又一奇幻狂放之作，这次斗胆玩转宗教。原来神不只有独生子道成肉身，还有个反叛的十岁女儿，对人间种种不幸看不过眼，决定离家出走改造世界，推翻暴君父亲。先发短讯泄露天机公布大限，再化身小救主，下凡召集六大使徒，聆听各人心曲，开启《超新约全书》。暴怒的神也追到凡间，力阻女儿造反。天马行空出奇制胜，更有凯瑟琳·德纳芙演富婆使徒，与黑猩猩擦出爱火花。', b'1', 0, 1651556840627);
INSERT INTO `movie` VALUES (7, '成长教育', 'An Education', 2009, '2009-10-30', '5d3a1099-6c48-429e-ad41-badb2f485d9d.webp', 100, 0, 0, 0.00, '　　本片根据英国星期日泰晤士报记者琳·巴贝尔（Lynn Barber）的回忆录改编。1961年，16岁的少女珍妮（凯瑞·穆里根 Carey Mulligan 饰）对父母反复督促她学好拉丁文考上牛津的唠叨不厌其烦，而正在追求自己的男孩又不令父亲杰克（阿尔弗雷德·莫里纳 Alf red Molina 饰）满意。一个雨天，珍妮邂逅了成熟男人大卫（彼得·萨斯加德 Peter Sarsgaard 饰），对方的风流倜傥和举手投足的迷人气质深深吸引了珍妮。大卫和朋友不断带珍妮出入高档酒吧、艺术品拍卖行和高级餐厅，甚至说服珍妮的父母带她游览梦寐以求的巴黎。灯红酒绿中珍妮迅速坠入爱河，只可惜事实真相却并非梦想中那样美好……\n　　本片获2009年圣丹斯电影节观众选择奖和摄影奖，被提名剧情片陪审团大奖，并获2009年金球奖最佳女主角提名（凯瑞·穆里根）和奥斯卡最佳电影、最佳女主角（凯瑞·穆里根）和最佳改编剧本三项提名。', b'1', 0, 1651557078474);
INSERT INTO `movie` VALUES (8, '罗小黑战记', '', 2011, '2011-03-18', '2ca2779e-2e38-45a7-a1fe-072b21fb6794.webp', 5, 1, 35, 0.00, '　　雨夜，一只流落街头的小黑猫，被少女罗小白（山新 配音）带回家，起名罗小黑。罗小黑不是一只普通的猫咪，它极通人性，会上厕所，不吃猫粮，长长的尾巴甚至会分裂成一个个名为“嘿咻”的不明生物体。另一方面，名为“谛听”（皇贞季 配音）的神秘人物，发动手下三匹会幻化成鸟的狼，搜寻着罗小黑的下落。不久，罗小白带着小黑到乡下探望堂哥阿根和爷爷，由此发生了种种离奇玄幻事件。\n　　《罗小黑战记》是中国大陆独立动画制作人MTJJ及其工作室于2011年03月出品的一部动画片。', b'1', 0, 1651557391673);
INSERT INTO `movie` VALUES (9, '辛德勒的名单', 'Schindler\'s List', 1993, '1993-11-30', '2ae81110-a48f-4950-8be4-70fd1fcc35be.webp', 195, 0, 0, 0.00, '　　1939年，波兰在纳粹德国的统治下，党卫军对犹太人进行了隔离统治。德国商人奥斯卡·辛德勒（连姆·尼森 Liam Neeson 饰）来到德军统治下的克拉科夫，开设了一间搪瓷厂，生产军需用品。凭着出众的社交能力和大量的金钱，辛德勒和德军建立了良好的关系，他的工厂雇用犹太人工作，大发战争财。\n　　1943年，克拉科夫的犹太人遭到了惨绝人寰的大屠杀，辛德勒目睹这一切，受到了极大的震撼，他贿赂军官，让自己的工厂成为集中营的附属劳役营，在那些疯狂屠杀的日子里，他的工厂也成为了犹太人的避难所。\n　　1944年，德国战败前夕，屠杀犹太人的行动越发疯狂，辛德勒向德军军官开出了1200人的名单，倾家荡产买下了这些犹太人的生命。在那些暗无天日的岁月里，拯救一个人，就是拯救全世界。 ', b'1', 0, 1651557989086);
INSERT INTO `movie` VALUES (10, '前路漫漫', 'ハルフウェイ', 2009, '2009-02-21', 'a2eeaff0-2a29-4552-871a-d98389e1fe52.webp', 85, 0, 0, 0.00, '　　北海道某高中，高三男生筱崎修（冈田将生 饰）阳光帅气，品学兼优，是女孩子们追逐崇拜的偶像。同级的小广（北乃纪伊 饰）也是这群女孩中的一员，每当与筱崎近距离接触时，她就会心跳加速、头脑发懵，甚至贫血昏倒。正因为如此紧张，她迟迟不敢向对方表白。凭借一场篮球赛，筱崎得知了小广的心意，两个人终于走到一起。\n　　只是快乐的时光毕竟有限，毕业的日子越来越近，年少不知愁的男孩女孩们也要为将来筹划。成绩一般的小广决定报考当地的札幌福祉大学，而筱崎的志愿却是名牌学府东京早稻田大学。如果志愿达成，则意味着两人从此要天各一方。小广顿时倍感失落，两个人的关系也变得别扭起来……', b'1', 0, 1651558231888);
INSERT INTO `movie` VALUES (11, '奇迹', '奇蹟', 1989, '1989-06-15', 'a16d33e0-584a-4ee8-ae20-efc5d2e07073.webp', 127, 0, 0, 0.00, '　　青年郭振华（成龙 饰）赴港谋求发展，路见不平之下卷入两派黑帮争斗，却阴差阳错做了帮派大哥，郭振华反思此一段奇遇，发觉是街边卖花的玫瑰夫人（归亚蕾 饰）将好运带给了自己，自此谈判、出门前总要购买玫瑰夫人的玫瑰以求心安。郭振华将帮派所属丽池饭店改为夜总会经营，饭店前任老板之女杨露明（梅艳芳 饰）出于还债在夜总会表演结果大红大紫，郭杨二人更发展出了一段恋情。觊觎夜总会生意多时的福建帮频频向郭振华发难，郭一如既往向玫瑰夫人求运，意外发现玫瑰夫人正身陷更大的麻烦，原来她为使外地的女儿安心读书编造了自己堂皇的身份，而眼下终于面临戳穿，郭出于感激帮助玫瑰夫人圆谎，由此引发了连环笑料……\n　　本片根据Frank Capra的作品《一日贵妇》改编，大量香港明星在本片中客串演出。', b'1', 0, 1651558468972);
INSERT INTO `movie` VALUES (12, '猩球崛起2：黎明之战', 'Dawn of the Planet of the Apes', 2014, '2014-07-11', '552664b1-025f-4a69-8eaf-2fa8578cfbf0.webp', 130, 0, 0, 0.00, '　　十年前，人类为自己的愚蠢付出惨痛代价，凶险致命的猿流感病毒蔓延全球，世界毁灭殆尽。而在毗邻旧金山的原始丛林，凯撒（安迪·瑟金斯 Andy Serkis 饰）带领猩猩伙伴们建立起无忧无虑的王国，直到某一天，猩猩的家园的宁静再度被人类打破。在旧城苟延残喘的人类面临能源危机，他们试图利用森林腹地大坝的发电站提供能源。青年科学家马尔科姆（杰森·克拉科 Jason Clarke 饰）试图说服聚集地负责人德里弗斯（加里·奥德曼 Gary Oldman 饰），希望通过和平手段取得猩猩部落的信任和同意。然而凯撒的好盟友科巴（托比·凯贝尔 Toby Kebbell 饰）却无法摒除对人类的憎恨，他尝试着挑战者凯撒的权威。\n　　人类和猩猩，双方小心翼翼试探，而战争在所难免……', b'1', 0, 1651558647700);
INSERT INTO `movie` VALUES (13, '科洛弗档案', 'Cloverfield', 2008, '2008-01-18', '206d4712-d36a-4ce2-b010-b621445c8d21.webp', 85, 0, 0, 0.00, '　　好友罗布（迈克尔•斯达-大卫 Michael Stahl-David 饰）要去日本工作，他的弟弟杰森（迈克•沃格尔 Mike Vogel 饰）和朋友莉莉（杰西卡•卢卡斯 Jessica Lucas 饰）为他举办了一场欢送派对。看到杰森拎着DV只顾拍摄美女玛莲娜（丽兹•卡潘 Lizzy Caplan 饰），莉莉很恼火，指出他更加关注罗布，因为后者才是今天的主角。\n　　罗布姗姗来迟，并且感到没落。原来他跟好友贝丝（奥黛塔•雅丝曼 Odette Yustman 饰）的地下情刚刚告吹，这令他异常沮丧。正在此时，贝丝携新男友出现在派对现场，这令好友感到既尴尬又愤怒，而真正的地震危险正在悄悄逼近……\n　　本片故事是采用伪DV风格的拍摄而成。', b'1', 0, 1651558750371);
INSERT INTO `movie` VALUES (14, '猩球崛起3：终极之战', 'War for the Planet of the Apes', 2017, '2017-07-14', '185de9af-4e75-4e12-b9ef-fa003a9512d4.webp', 140, 0, 0, 0.00, '　　凯撒（安迪·瑟金斯 饰）领导的猿族将被迫与残暴的Colonel（伍迪·哈里森 饰）领导的人类军队上演一场生死大战。猿族在战斗中遭遇了前所未有的重创，由此激发了凯撒内心中黑暗的一面，心中燃起复仇的烈火。最终，凯撒与Colonel面对面进行了一场关乎猿族和人类命运的终极之战。', b'1', 0, 1651558842594);
INSERT INTO `movie` VALUES (15, '爱，死亡和机器人', 'Love, Death & Robots Season 1', 2019, '2019-03-15', '9c6f04d7-2894-446d-8674-a4c30afbf902.webp', 15, 1, 18, 0.00, '　　这部名为《爱，死亡和机器人》的动画短片合集由18部分组成，每部分时长5-15分钟。这些短片涵盖多种类型，包括科幻、奇幻、恐怖和喜剧；这些短片也将包含多种形式，包括传统2D和3DCGI短片。\n　　18部短片导演列表：\n　　1.桑尼的优势 Dave Wilson\n　　2.三个机器人 Víctor Maldonado&Alfredo Torres\n　　3.证人 Alberto Mielgo\n　　4.机动装甲 Franck Balson\n　　5.噬魂者 Owen Sullivan\n　　6.当酸奶统治世界 Victor Maldonado & Alfredo Torres\n　　7.裂缝以外 Leon Berlue,Dominique Boidin,Remi Kozyra,Maxime Luere\n　　8.祝有好的收获 Oliver Thomas\n　　9.垃圾场 Javier Recio Gracia\n　　10.变形者 Gabriele Pennacchioli\n　　11.帮手 Jon Yeo\n　　12.古鱼复苏 Damian Nenow\n　　13.新运十三 Jerome Chen\n　　14.齐马的作品 Robert Valley\n　　15.盲点 Vitality Shushko\n　　16.冰河时代 Tim Miller\n　　17.不一样的历史 Victor Maldonado & Alfredo Torres\n　　18.秘密战争 Istvan Zorkoczy', b'1', 0, 1651558978009);
INSERT INTO `movie` VALUES (16, '扬名立万', '', 2021, '2021-11-11', '9634ca79-28d9-4211-b1ca-48801bd4578e.webp', 123, 0, 0, 0.00, '　　月黑风高之夜，一群电影人被秘密召集到一起，欲将轰动一时的血案翻拍成电影，借此扬名立万。殊不知他们正身处案发现场，并步步陷入一个巨大迷局之中，而凶手就在他们中间……\n　　伴随着利欲熏天的创作风暴，案件背后的故事似乎也更加扑朔迷离，戏中戏、案中案、局中局、人外人，环环相扣，一场野心与良心的较量愈演愈烈。究竟是命悬一线，还是另有惊天逆转？爱与温暖的血色花又能否从快将干涸的血河中终极绽放？一切都有待揭开。', b'1', 0, 1651559190273);
INSERT INTO `movie` VALUES (17, '飞驰人生', '', 2019, '2019-02-05', '24a0db1b-29f5-4a8b-9814-00ee5c96d873.webp', 98, 0, 0, 0.00, '　　曾经叱咤风云的拉力赛车手张驰（沈腾 饰），五年前因私自赛车而被禁赛。从天堂跌落谷底，张驰饱尝生活的艰辛。他忍辱负重，洗心革面，终于争取到了解禁的判决。在此之后，他重新找到亲如兄弟的领航员孙宇强（尹正 饰），决心共同冲击本年度的巴音布鲁克拉力赛。然而在此之前，张驰必须重考驾照，改装赛车，拉到赞助。每一步都充满艰难，他忍受着旁人的奚落嘲讽，忍受着现实的冰冷残酷，无论如何都不改变前进的目标。当他好不容易走到了赛场，还将面对禁赛这几年崛起的新秀林臻东（黄景瑜 饰）的挑战。\n　　张驰的时代是否就此远去……', b'1', 0, 1651559342142);
INSERT INTO `movie` VALUES (18, '乘风破浪', '', 2017, '2017-01-28', '30bbc1ba-a149-4fbd-8c73-fe22b3e7c478.webp', 102, 0, 0, 0.00, '　　赛车手阿浪（邓超 饰）一直对父亲（彭于晏 饰）反对自己的赛车事业耿耿于怀，在向父亲证明自己的过程中，阿浪却意外卷入了一场奇妙的冒险。他在这段经历中结识了一群兄弟好友，一同闯过许多奇幻的经历，也对自己的身世有了更多的了解。', b'1', 0, 1651559431544);
INSERT INTO `movie` VALUES (19, '后会无期', '', 2014, '2014-07-24', '75db231e-3150-4271-a98a-23cfedf1a4a3.webp', 104, 0, 0, 0.00, '　　故事开始于虚构的中国最东边的小岛“东极岛”，智力低下的青年胡生（高华阳 饰）讲述了关于他的两个哥们儿——马浩汉（冯绍峰 饰）和江河（陈柏霖 饰）的故事。浩汉在外闯荡多年后回到故乡，却发现全岛面临着拆迁问题，而他最好的朋友，岛上唯一的老师江河也将被调到更为偏远的地区。于是 浩汉做出了一个决定，那就是开车送江河去三千多公里外的学校报到。兄弟三人踏上了前所未有的旅程，途中他们见了当临时演员的童年玩伴周沫（陈乔恩 饰），误入歧途的苏米（王珞丹 饰），还有浩汉心仪多年从未见面的笔友刘莺莺（袁泉 饰），以及不羁的摩托车手阿吕（钟汉良 饰）。看似平常的旅程却暗藏伏笔，浩汉和江河最终走到了终点，开始了截然不同的人生轨迹。\n　　本片是著名作家兼赛车手韩寒的电影导演处女作。', b'1', 0, 1651559597170);

-- ----------------------------
-- Table structure for movie_category
-- ----------------------------
DROP TABLE IF EXISTS `movie_category`;
CREATE TABLE `movie_category`  (
  `movie_id` int(11) NOT NULL,
  `category_id` smallint(6) NOT NULL,
  PRIMARY KEY (`movie_id`, `category_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of movie_category
-- ----------------------------
INSERT INTO `movie_category` VALUES (1, 2);
INSERT INTO `movie_category` VALUES (1, 3);
INSERT INTO `movie_category` VALUES (1, 4);
INSERT INTO `movie_category` VALUES (2, 1);
INSERT INTO `movie_category` VALUES (2, 3);
INSERT INTO `movie_category` VALUES (2, 7);
INSERT INTO `movie_category` VALUES (2, 10);
INSERT INTO `movie_category` VALUES (5, 1);
INSERT INTO `movie_category` VALUES (5, 7);
INSERT INTO `movie_category` VALUES (5, 8);
INSERT INTO `movie_category` VALUES (5, 19);
INSERT INTO `movie_category` VALUES (6, 2);
INSERT INTO `movie_category` VALUES (6, 17);
INSERT INTO `movie_category` VALUES (7, 1);
INSERT INTO `movie_category` VALUES (8, 1);
INSERT INTO `movie_category` VALUES (8, 2);
INSERT INTO `movie_category` VALUES (8, 3);
INSERT INTO `movie_category` VALUES (8, 6);
INSERT INTO `movie_category` VALUES (8, 17);
INSERT INTO `movie_category` VALUES (9, 1);
INSERT INTO `movie_category` VALUES (9, 14);
INSERT INTO `movie_category` VALUES (9, 15);
INSERT INTO `movie_category` VALUES (10, 1);
INSERT INTO `movie_category` VALUES (10, 4);
INSERT INTO `movie_category` VALUES (11, 1);
INSERT INTO `movie_category` VALUES (11, 2);
INSERT INTO `movie_category` VALUES (11, 3);
INSERT INTO `movie_category` VALUES (11, 10);
INSERT INTO `movie_category` VALUES (12, 1);
INSERT INTO `movie_category` VALUES (12, 3);
INSERT INTO `movie_category` VALUES (12, 5);
INSERT INTO `movie_category` VALUES (13, 5);
INSERT INTO `movie_category` VALUES (13, 8);
INSERT INTO `movie_category` VALUES (13, 19);
INSERT INTO `movie_category` VALUES (14, 1);
INSERT INTO `movie_category` VALUES (14, 3);
INSERT INTO `movie_category` VALUES (14, 5);
INSERT INTO `movie_category` VALUES (16, 1);
INSERT INTO `movie_category` VALUES (16, 2);
INSERT INTO `movie_category` VALUES (16, 7);
INSERT INTO `movie_category` VALUES (17, 2);
INSERT INTO `movie_category` VALUES (18, 1);
INSERT INTO `movie_category` VALUES (18, 2);
INSERT INTO `movie_category` VALUES (19, 1);

-- ----------------------------
-- Table structure for movie_country
-- ----------------------------
DROP TABLE IF EXISTS `movie_country`;
CREATE TABLE `movie_country`  (
  `movie_id` int(11) NOT NULL,
  `country_id` smallint(6) NOT NULL,
  PRIMARY KEY (`movie_id`, `country_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of movie_country
-- ----------------------------
INSERT INTO `movie_country` VALUES (1, 46);
INSERT INTO `movie_country` VALUES (2, 239);
INSERT INTO `movie_country` VALUES (3, 212);
INSERT INTO `movie_country` VALUES (3, 239);
INSERT INTO `movie_country` VALUES (4, 212);
INSERT INTO `movie_country` VALUES (4, 239);
INSERT INTO `movie_country` VALUES (5, 32);
INSERT INTO `movie_country` VALUES (5, 40);
INSERT INTO `movie_country` VALUES (5, 112);
INSERT INTO `movie_country` VALUES (6, 22);
INSERT INTO `movie_country` VALUES (6, 76);
INSERT INTO `movie_country` VALUES (6, 131);
INSERT INTO `movie_country` VALUES (7, 238);
INSERT INTO `movie_country` VALUES (7, 239);
INSERT INTO `movie_country` VALUES (8, 46);
INSERT INTO `movie_country` VALUES (9, 239);
INSERT INTO `movie_country` VALUES (10, 112);
INSERT INTO `movie_country` VALUES (11, 46);
INSERT INTO `movie_country` VALUES (12, 239);
INSERT INTO `movie_country` VALUES (13, 239);
INSERT INTO `movie_country` VALUES (14, 239);
INSERT INTO `movie_country` VALUES (15, 239);
INSERT INTO `movie_country` VALUES (16, 46);
INSERT INTO `movie_country` VALUES (17, 46);
INSERT INTO `movie_country` VALUES (18, 46);
INSERT INTO `movie_country` VALUES (19, 46);

-- ----------------------------
-- Table structure for movie_language
-- ----------------------------
DROP TABLE IF EXISTS `movie_language`;
CREATE TABLE `movie_language`  (
  `movie_id` int(11) NOT NULL,
  `language_id` smallint(6) NOT NULL,
  PRIMARY KEY (`movie_id`, `language_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of movie_language
-- ----------------------------
INSERT INTO `movie_language` VALUES (1, 134);
INSERT INTO `movie_language` VALUES (2, 1);
INSERT INTO `movie_language` VALUES (5, 1);
INSERT INTO `movie_language` VALUES (5, 53);
INSERT INTO `movie_language` VALUES (6, 23);
INSERT INTO `movie_language` VALUES (6, 34);
INSERT INTO `movie_language` VALUES (7, 1);
INSERT INTO `movie_language` VALUES (8, 134);
INSERT INTO `movie_language` VALUES (9, 1);
INSERT INTO `movie_language` VALUES (9, 23);
INSERT INTO `movie_language` VALUES (9, 52);
INSERT INTO `movie_language` VALUES (9, 87);
INSERT INTO `movie_language` VALUES (10, 53);
INSERT INTO `movie_language` VALUES (11, 1);
INSERT INTO `movie_language` VALUES (11, 134);
INSERT INTO `movie_language` VALUES (12, 1);
INSERT INTO `movie_language` VALUES (13, 1);
INSERT INTO `movie_language` VALUES (13, 94);
INSERT INTO `movie_language` VALUES (14, 1);
INSERT INTO `movie_language` VALUES (16, 134);
INSERT INTO `movie_language` VALUES (17, 134);
INSERT INTO `movie_language` VALUES (18, 134);
INSERT INTO `movie_language` VALUES (19, 134);

-- ----------------------------
-- Table structure for movie_person
-- ----------------------------
DROP TABLE IF EXISTS `movie_person`;
CREATE TABLE `movie_person`  (
  `movie_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `role_id` tinyint(4) NOT NULL,
  `role_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`movie_id`, `person_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of movie_person
-- ----------------------------
INSERT INTO `movie_person` VALUES (1, 1, 2, '导演');
INSERT INTO `movie_person` VALUES (1, 2, 3, '演员');
INSERT INTO `movie_person` VALUES (1, 3, 3, '演员');
INSERT INTO `movie_person` VALUES (2, 4, 3, '演员');
INSERT INTO `movie_person` VALUES (2, 5, 1, '编剧');
INSERT INTO `movie_person` VALUES (2, 5, 2, '导演');
INSERT INTO `movie_person` VALUES (3, 6, 1, '编剧');
INSERT INTO `movie_person` VALUES (3, 6, 2, '导演');
INSERT INTO `movie_person` VALUES (5, 7, 2, '导演');
INSERT INTO `movie_person` VALUES (5, 8, 3, '演员');
INSERT INTO `movie_person` VALUES (5, 9, 3, '演员');
INSERT INTO `movie_person` VALUES (6, 10, 1, '编剧');
INSERT INTO `movie_person` VALUES (6, 10, 2, '导演');
INSERT INTO `movie_person` VALUES (6, 11, 3, '演员');
INSERT INTO `movie_person` VALUES (7, 12, 2, '导演');
INSERT INTO `movie_person` VALUES (7, 13, 3, '演员');
INSERT INTO `movie_person` VALUES (8, 14, 1, '编剧');
INSERT INTO `movie_person` VALUES (8, 14, 2, '导演');
INSERT INTO `movie_person` VALUES (8, 15, 3, '演员');
INSERT INTO `movie_person` VALUES (9, 16, 2, '导演');
INSERT INTO `movie_person` VALUES (9, 17, 3, '演员');
INSERT INTO `movie_person` VALUES (10, 18, 1, '编剧');
INSERT INTO `movie_person` VALUES (10, 18, 2, '导演');
INSERT INTO `movie_person` VALUES (10, 19, 3, '演员');
INSERT INTO `movie_person` VALUES (11, 20, 1, '编剧');
INSERT INTO `movie_person` VALUES (11, 20, 2, '导演');
INSERT INTO `movie_person` VALUES (11, 20, 3, '演员');
INSERT INTO `movie_person` VALUES (12, 5, 2, '导演');
INSERT INTO `movie_person` VALUES (13, 5, 2, '导演');
INSERT INTO `movie_person` VALUES (14, 5, 1, '编剧');
INSERT INTO `movie_person` VALUES (14, 5, 2, '导演');
INSERT INTO `movie_person` VALUES (15, 6, 2, '导演');
INSERT INTO `movie_person` VALUES (16, 1, 6, '制片');
INSERT INTO `movie_person` VALUES (17, 1, 1, '编剧');
INSERT INTO `movie_person` VALUES (17, 1, 2, '导演');
INSERT INTO `movie_person` VALUES (17, 3, 3, '演员');
INSERT INTO `movie_person` VALUES (18, 1, 1, '编剧');
INSERT INTO `movie_person` VALUES (18, 1, 2, '导演');
INSERT INTO `movie_person` VALUES (19, 1, 1, '编剧');
INSERT INTO `movie_person` VALUES (19, 1, 2, '导演');

-- ----------------------------
-- Table structure for person
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '中文名',
  `original_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '原名',
  `profile_path` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '介绍图路径',
  `gender` tinyint(4) NOT NULL DEFAULT 2 COMMENT '性别：0女；1男；2未知',
  `introduction` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '人物简介',
  `country_id` smallint(6) NOT NULL DEFAULT 0 COMMENT '国家id, 0未知',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `enabled` bit(1) NOT NULL DEFAULT b'0' COMMENT '资料经过管理员审核才能通过，默认0',
  `submitter` int(11) NOT NULL COMMENT '创建资料的用户的id，0表示管理员',
  `last_update` bigint(20) NULL DEFAULT NULL COMMENT '上次修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of person
-- ----------------------------
INSERT INTO `person` VALUES (1, '韩寒', 'Han Han', '523e9f3a-b522-4153-9d31-344b4bba519a.jpg', 1, '中国公民，赛车手，作家。', 46, '1982-09-23', b'1', 1, 1651552501530);
INSERT INTO `person` VALUES (2, '刘昊然', 'Haoran Liu', 'c38ee68b-88b2-4f51-8794-578150e46d71.jpg', 1, '刘昊然，本名刘源，1997年10月10日生于河南省平顶山，中国内地男演员。2014年因主演陈思诚执导的电影《北京爱情故事》出道成名，凭借该片入围第21届北京大学生电影节最佳新人奖。2015年4月加盟湖南卫视国防教育特别节目《真正男子汉》，5月出演悬疑喜剧电影《唐人街探案》，该电影票房口碑双丰收 。2015年7月以表演专业全国专业和文化双料第一名的好成绩被中央戏剧学院录取 。', 46, '1997-10-10', b'1', 1, 1651552587823);
INSERT INTO `person` VALUES (3, '沈腾', 'Teng Shen', '8b51f58a-0d7c-4af0-bb98-226f5a0a231c.jpg', 1, '沈腾，中国内地影视演员、导演、编辑，毕业于解放军艺术学院戏剧表演系。曾出演开心麻花舞台剧《想吃麻花现给你拧》、《乌龙山伯爵》、《索马里海盗》、《甜咸配》等经典话剧，并在主演电影《夏洛特烦恼》、《西虹市首富》、《羞羞的铁拳》等作品中取得了不错的票房成绩；五登央视春晚，带来了小品《扶不扶》、《今天的幸福》、《今天的幸福2》、《投其所好》、《一个女婿半个儿》，都获得了观众的一致好评。参加东方卫视《欢乐喜剧人》第一季并获得冠军，同年首次参加真人秀《咱们穿越吧》，并收获大量粉丝；后加盟浙江卫视《王牌对王牌》第三季，担任王牌队长。', 46, '1979-10-23', b'1', 1, 1651552651409);
INSERT INTO `person` VALUES (4, '罗伯特·帕丁森', 'Robert Pattinson', '20462fdf-1ec3-401f-97c4-f355404fe4f7.jpg', 1, '1986年出生英国伦敦的Rob，母亲任职于模特经纪公司，父亲则从事进口美国中古车生意。Rob4岁开始就读于塔尔豪斯私立男校，12岁转入知名的哈罗迪恩私立学校就读，同年开始当模特，且15岁时加入了Barnes Theatre Company，开始了业余性的演艺工作，在Barnes Theatre Club里演出某些角色。\n　　他第一个屏幕角色出现在电影《Ring of the Nibelungs（尼伯龙根的指环）》里。随后也参与了《Vanity Fair（名利场）》里的演出，不过基于剧情考量，该电影最后上映时，Rob的戏份被删除了，但在DVD版本中依然看得到他被删剪的演出。 Rob也是《哈利&middot;波特与火焰杯》导演Mike Newell 在为塞德里克&middot;迪戈里一角挑选演员时面试的第一位人选，对于他&ldquo;典型的轮廓鲜明的英国寄宿学校的学生&rdquo;的外貌留下深刻印象，称赞他有着&ldquo;人们对于霍格沃茨的学生期望中的一切&rdquo;，尽管如此Rob本人承认他在生活中完全没有塞德里克那般领袖的一面。虽然在哈剧中被早早赐死，瞩目度也并不如其他哈剧演员们来得高，但带着浓厚欧洲贵族气息又有着俊美外表的Rob，依然被时人杂志喻为&ldquo;裘德&middot;洛接班人&rdquo;。然而，让Rob真正尝到走红滋味的演出，则是在2008年卖座的奇幻浪漫爱情电影《暮光之城》中饰演神秘迷人又邪气俊美的吸血鬼&mdash;&mdash;爱德华&middot;卡伦（Edward cullen）。 当初《暮光之城》选角时，女主角早已定案由克里斯汀&middot;斯图尔特（Kristen Stewart）担纲，但男主角却迟迟未定案。这时Rob也为此特地由英赴美，在《暮光之城》导演凯瑟琳&middot;哈德威克（Catherine Hardwicke）家参与试镜，并从五千名优秀演员中脱颖而出，获得爱德华&middot;卡伦一角。 克里斯汀受访时曾表示，试镜时安排他俩演出亲密床戏，她在演出中感觉到了化学反应与无比的契合。而导演凯瑟琳也表示，当她看到Rob的演出时，心想&ldquo;就是他了！集邪气俊美的吸血鬼气质与外在于一身的男主角出现了！他的出现，将会将少女心目中的幻想成真，理想中的俊美吸血鬼！&rdquo;\n如今Rob已摇身一变成为风靡全球的英俊男明星，但他曾于受访时提到，杰克尼克尔森为他戏剧表演上的指标。他期许自己能成为和他一样的全方位演技派，而非靠着一张漂亮脸皮掳获观众的少女偶像。 除了演员这个身份之外，自幼学琴的Robert也是位优秀的音乐家，他三岁开始学钢琴，五岁开始学习古典吉他，出道前曾在家乡组过乐团，并在餐厅与俱乐部等地有过演出。而Rob的姐姐Lizzy Pattinson也是位杰出的创作歌手，曾跟乐队Aurora登上十大跳舞歌曲的榜首。 此外，Rob还是位热爱运动的人，从足球田径到滑雪或是雪上滑板等，皆是他喜爱从事并精通的运动。但有趣的是，他似乎对棒球不太在行，也因此拍摄电影《暮光之城》，因不清楚棒球规则。在卡伦家棒球比赛那场戏里闹了不少笑话。', 238, '1986-05-13', b'1', 0, 1651552836386);
INSERT INTO `person` VALUES (5, '马特·里夫斯', 'Matt Reeves', '12916625-7325-4169-bb62-8004f66043a5.jpg', 1, '马特&middot;里夫斯（Matt Reeves），全名马修&middot;乔治&middot;里夫斯（Matthew George Reeves），1966年4月27日出生于美国纽约罗克维尔中心，美国导演、编剧、制片人，毕业于南加利福尼亚大学。\n1993年，执导个人首部电影《未来冲击》。1996年，执导的喜剧片《出殡抱佳人》上映。1998年，与J&middot;J&middot;艾布拉姆斯共同主创的校园剧《大学生费莉希蒂》播出 。2000年，担任犯罪片《家族情仇》的编剧。2008年，执导的科幻片《科洛弗档案》上映；同年，获得第34届土星奖最佳影人展示奖。2011年，凭借惊悚爱情片《美版生人勿进》入围第37届土星奖的最佳导演奖和最佳编剧奖 。2014年，执导科幻片《猩球崛起：黎明之战》，他凭此入围第41届土星奖最佳导演奖 。2016年，担任科幻片《科洛弗道10号》的监制。2017年，宣布执导科幻动作片《蝙蝠侠》。2018年，凭借科幻片《猩球崛起3：终极之战》入围第44届土星奖最佳导演奖。\n马特&middot;里夫斯从8岁时就接触了电影制作，喜欢用超8摄像机拍短片。13岁时，马特&middot;里夫斯在一次电影节上认识了J&middot;J&middot;艾布拉姆斯，他们经常一起拍短片。1981年左右，马特&middot;里夫斯和J&middot;J&middot;艾布拉姆斯获得了一项制作人新秀奖，并被《洛杉矶时报》报道。凯瑟琳&middot;肯尼迪通过《洛杉矶时报》发现了二人，并建议史蒂文&middot;斯皮尔伯格聘请他们工作。二人帮助斯皮尔伯格整理电影，并把斯皮尔伯格年轻时拍摄的一些8mm电影胶片转换成了录影带。', 239, '1966-04-27', b'1', 0, 1651553054433);
INSERT INTO `person` VALUES (6, '阿尔贝托·米尔戈', 'Alberto Mielgo', 'b8e95b08-f72c-4ad3-a811-4061fe9edb00.jpg', 1, 'Alberto Mielgo is known for Love, Death & Robots (2019), The Windshield Wiper (2021) and Spider-Man: Into the Spider-Verse (2018).', 212, '1979-04-29', b'1', 0, 1651555657491);
INSERT INTO `person` VALUES (7, '费尔南多·梅里尔斯', 'Fernando Meirelles', '2f479b55-2924-4e92-b171-c41deb59493f.jpg', 1, '费尔南多·梅里尔斯是巴西著名电影导演、编剧和制片人。他的作品《上帝之城》曾获2004年奥斯卡最佳导演奖提名，《不朽的园丁》也被提名 2005年金球奖最佳导演奖，该片女演员蕾切尔薇兹获奥斯卡奖最佳女配角奖。', 32, '1955-11-09', b'1', 0, 1651556145535);
INSERT INTO `person` VALUES (8, '马克·鲁弗洛', 'Mark Ruffalo', '54b982b2-8013-4c6d-9aa9-67b1b312804f.jpg', 1, '马克·鲁弗洛是美国威斯康辛州人，幼年时与其家人移居至弗吉尼亚，在那儿他度过了少年岁月。高中后，马克·鲁弗洛又与他的家人搬到圣迭戈，接着又搬到北部，最后定居在洛杉矶。\n　　他在斯特拉阿德勒音乐学院学习，随后和人共同创办了“厄狄朗普斯”剧团，开始从事话剧表演。他在各方面努力实践以提升自己的知名度，他干过演员、编剧、导演和制片。尽管如此，他仍然得不到在电影和电视上露脸的机会，以致于当了差不多九年的酒吧招待来维持生计。正当他打算放弃演艺事业时，话剧兼电影编剧肯尼思·朗冈看中了他，这次机会改变了他的一生。\n　　马克在朗冈的戏剧《这是我们的时代》中的表演大获成功，这也使他得以在朗冈的影片《诚信无价》中饰演男主角。他在片中饰演劳拉·琳尼的兄弟，其令人震惊、让人着迷的表演让好莱坞对这位新晋天才演员产生了兴趣。一些评论者甚而拿他与早期的马龙白兰度作对比。尽管事业成功，但马克依然没有离开他深爱的话剧舞台和在洛杉矶的剧团，只是偶尔在一些赚钱的商业大片中参与导演或扮演角色。\n　　尽管马克已经是好莱坞一线演员，但他继续在话剧和电影两个领域中自由来去。他最新的比较有影响的影片包括《我爱染色体》，《没有我的日子》，以及《暖暖内含光》。\n　　据英国《每日邮报》2010年11月29日报道，Mark Ruffalo日前因为呼吁停止开采天然气，被美国官员列入恐怖分子监控名单。今年年初，Mark Ruffalo组织放映了一部有关天然气钻探的新纪录片《天然气之地》，他的目的是唤醒公众意识，要求停止开采天然气。同时他认为美国正面临着全国性水供应短缺的危险。\n　　他的举动引来宾夕法尼亚州国土安全办公室官员的关注。Mark Ruffalo后来发现，自己竟然上了恐怖分子监控名单。尽管他不会被阻止上飞机，但他在机场时，可能要接受美国运输安全管理局官员更严格的检查。Mark Ruffalo自称，他不担心自己被贴上安全威胁的标签，相反感到很有趣。', 239, '1967-11-22', b'1', 0, 1651556228058);
INSERT INTO `person` VALUES (9, '朱丽安·摩尔', 'Julianne Moore', '79d27455-b877-4d0c-a97a-2ef4be6fc5cd.jpg', 0, '朱丽安·摩尔，历史上首位戛纳、柏林、威尼斯三大电影节加奥斯卡影后。《星图》《时时刻刻》《告别天堂》《依然爱丽丝》四部电影成就了摩尔表演事业的满贯。因与罗伯特·奥特曼、保罗·托马斯·安德森、路易·马勒、科恩兄弟、托德·海因斯、格斯·范·桑特、阿方索·卡隆等知名导演合作，让她享有“独立电影皇后”的美誉。\n\n19岁时朱丽安·摩尔选择到波士顿大学学习表演艺术，1985年到1988年间，她因出演肥皂剧《当世界转变》而迈开了荧屏第一步，她在剧中扮演了一对性格迥异的双胞胎，出色的表演为她赢得了1988年的艾美杰出新人奖，一夜成为万千影迷的偶像。 跟大多数人一样，摩尔是从跑龙套开始的影视之路，不论是演主角或是配角，她都是一部电影中最不能忽视的元素之一。 朱丽安·摩尔她所刻画的角色与人物，充满了激情、不畏世俗，洋溢着一种精明老练而又灵性的智慧。 　　\n\n\n朱丽安·摩尔是奥斯卡历史上少见的“双料候选者”之一，在第75届奥斯卡上她凭《时时刻刻》《远离天堂》同时提名最佳女主角与最佳女配角。她共有5次奥斯卡提名，一座奥斯卡影后奖杯。而代替朱迪·福斯特主演2001年的惊悚片《汉尼拔》，以及在系列电影《侏罗纪公园》、《饥饿游戏》中的表演，让这位才华横溢的女演员拥有了广泛的知名度。', 239, '1960-12-03', b'1', 0, 1651556377153);
INSERT INTO `person` VALUES (10, '雅克·范·多梅尔', 'Jaco Van Dormael', 'a4036d88-8a84-4ae1-bb72-b5e2d54cc48a.jpg', 1, '雅克·范·多梅尔，生于1957年2月9日，童年大部分时间都在德国度过，偶尔回比利时看看。小多梅尔十分喜欢和小伙伴玩耍，他还做了一段时间的马戏团小丑。80年代他开始对电影制作产生了浓厚兴趣，期间他制作了大量的短片，展现了非凡的才华。1991年，多梅尔制作了他的第一部电影长片《小英雄托托》，该片讲述了一个非常动人的故事，为他赢得了世界性声誉，拿下了当年的戛纳国际电影节金摄影机最佳导演处女作奖，还赢得欧洲电影节最佳影片，最佳编剧，最佳男主角，最佳摄影奖。使多梅尔一夜成名。他的另一部杰作是《第八日》。', 22, '1957-02-09', b'1', 0, 1651556674143);
INSERT INTO `person` VALUES (11, '凯瑟琳·德纳芙', 'Catherine Deneuve', '0c0e6b02-ada2-472d-84ec-683b8bc18f4c.jpg', 0, '1943年10月22日生于巴黎演员家庭， 法国影坛常青树， 几乎近代所有欧洲著名的导演都和凯萨琳家族合作过，有“冰美人”之称，集美丽和高贵于一身。生于巴黎演艺世家，13岁跨入演艺圈，在明星姐姐引荐下进军影坛。1964年，她在歌舞片《瑟堡的雨伞》中扮演女主角，她发自内心的激情和令人抑郁的幽默使她获戛纳国际电影节大奖。1966年主演《白昼美人》 ，成为国际知名明星。\n\n她一生中最被影迷津津乐道的就是她与西班牙超现实主义导演布努艾尔（Luis Bunuel）合作的《白昼美人》。这是一部改编自三流情色小说的电影，但在布努艾尔的巧斧神工下，成功的利用现实与幻想交错的情境，深入 探讨女人的压抑与寂寞。凯瑟琳.德纳芙因此片获得1968英国学院奖最佳女主角提名。\n\n除了布努艾尔以外，许多国际著名导演，如弗朗索瓦.特吕弗、罗曼.波兰斯基等都曾与之合作。她能扮演地位、身分、经历极不相同的各类女 性，更善于塑造心理十分复杂的人物。最为成功的作品有《厌恶》《白日美人》《特里丝塔娜》等。此外，她还具有杰出的喜剧才能。如在199 9年拍摄的《岳母大人》中，德纳芙扮演让女婿一见钟情的迷人岳母，让这部跨越伦常与年龄的爱情喜剧充满说服力。\n\n1981年，德纳芙因在特吕弗的影片《最后一班地铁》中的出色表演获法国凯撒奖最佳女演员奖。1993，她凭借《印度支那》再度夺得这一奖项 。1998年，她演出《旺多姆广场》而获得威尼斯电影节最佳女演员奖。进入二十一世纪，德纳芙依然拍片不辍。在《黑暗中的舞者》中， 她扮演朴实无华的女工，又歌又舞。在弗朗索瓦.奥桑2001年的歌舞轻喜剧《八美千娇》中，她和另外七位法国影坛顶尖女星联袂主演，风采不减当年。在面临自身年华老去的事实与新起女星的追赶之下，凯瑟琳.德纳芙利用丰富的人生历练与独特的优雅气质征服了一代又一代电影观众。40年来在法国影坛的地位岿然不动，尤其是成为全球各地艺术院线追捧的影人。', 76, '1943-10-22', b'1', 0, 1651556744531);
INSERT INTO `person` VALUES (12, '罗勒·莎菲', 'Lone Scherfig', '83e0f71f-736d-4872-bb9a-527ebe470fca.jpg', 0, '罗勒·莎菲，丹麦电影导演、编剧，执导《成长教育》广为业界评论和观众的认可', 61, '1959-05-02', b'1', 0, 1651556926889);
INSERT INTO `person` VALUES (13, '凯瑞·穆里根', 'Carey Mulligan', '79619361-c184-498e-addb-f7f8ef43a706.jpg', 0, '　　凯芮·穆里根很小就梦想成为演员，但是她的酒店管理顾问父亲和教师母亲并不支持而是让她读大学，但凯芮在演员朱利安·费罗斯妻子的介绍下参加了乔·怀特为《傲慢与偏见》举行的试镜，最终得到了班奈特家的四女儿Kitty的角色，完全没有经验的她从片中扮演小妹妹的吉娜·马隆身上学到了很多东西。之后凯芮·穆里根又出演了《荒凉山庄》、《诺桑觉寺》两部名著改编电视作品，并客串热门科幻剧《神秘博士》的“Blink”一集而被粉丝们票选为“最喜欢的客串女演员”。她还在戏剧舞台上表现抢眼，其灵性十足、敏感到位的表演受到各大媒体的赞扬。\n　　2007年凯芮·穆里根还出演了科林·费尔斯主演的英国影片《崎路父子情》，并在《我的儿子杰克》中出演了丹尼尔·雷德克里夫角色的妹妹。08年她终于迎来了担任主角的机会，《成长教育》的剧本曾被综艺杂志评为“未被拍出的最优秀的英国剧本”之一，讲述的是上世纪六十年代伦敦乡下的女孩遇见年长、成熟而时髦的男人接受“教育”的故事，这也是她第二次和《傲慢与偏见》的罗莎曼德·派克以及《崎路父子情》的马修·比尔德合作。09年她先是带着《最伟大的》亮相美国圣丹斯电影节，紧接着又到德国柏林宣传《成长教育》一片，她也是柏林官方推荐的该年度欧洲闪亮新星之一。她还加盟了两部备受关注的好莱坞影片《兄弟》和《人民公敌》，这朵英伦玫瑰将绽放得更加绚烂。', 238, '1985-05-28', b'1', 0, 1651556977122);
INSERT INTO `person` VALUES (14, '木头', 'MTJJ', 'f08edada-046b-480b-9b2b-ad2455eab0f9.jpg', 1, '人称会画动画的木头，脾气温和，任劳任怨 ，擅长恶搞，害羞腼腆。2009年开始连载漫画，2011年3月发布动画《罗小黑战记》。', 46, '1984-10-04', b'1', 0, 1651557259412);
INSERT INTO `person` VALUES (15, '山新', 'Shuang Wang', 'ea337f90-6379-46ed-8c11-e2caa9a43551.jpg', 0, '山新，国内新生代专业配音演员、北斗企鹅工作室配音演员、声创联盟中文配音社团主力社员之一。声线干净清澈，表演风格真实纯熟，感情收放自如，无论是可爱萝莉、天真正太，还是纯真少女、温柔御姐甚至精灵动物类角色都能轻松演绎。于2012年初为雅马哈公司的VOCALOID3中洛天依提供音源，成为第一个进入VOCALOID家族的中国人。主要作品有动画《十万个冷笑话》、《罗小黑战记》、《星游记》等，游戏《古剑奇谭》系列、《三国杀online》、《仙剑奇侠传4》、《仙剑奇侠传5前传》、《叙事曲》系列等。', 46, '1989-01-01', b'1', 0, 1651557310485);
INSERT INTO `person` VALUES (16, '史蒂文·斯皮尔伯格', 'Steven Spielberg', '46bc504e-d4d3-4ef9-909a-106ab393b2f6.jpg', 1, '史蒂文·艾伦·斯皮尔伯格，（Steven Allan Spielberg，1946年12月18日－），生于美国辛辛那提市，犹太人，美国著名电影导演、编剧、电影制作人、慈善家，主要导演作品包括《头号玩家》、《侏罗纪公园》、《辛德勒的名单》和《拯救大兵瑞恩》等多部影史经典。\n他有三部电影，包括《大白鲨》 （1975） 、《E.T.外星人》 （1982） 与《侏罗纪公园》 （1993），曾打破票房纪录，成为当时最卖座的电影。至今，斯皮尔伯格执导的电影收入在全球粗估逾85亿美元。根据《福布斯》杂志报导，斯皮尔伯格坐拥净值31亿美元的财产，是目前全世界最富有的电影制作人之一。\n2006年，《首映杂志》将斯皮尔伯格列为电影业中最有权威与影响力的人物。《时代》杂志将他列入世纪百大最重要的人物的一员。20世纪末，《生活》杂志将斯皮尔伯格命名为他同代中最有影响力的人物。\n在四十年的电影生涯中，斯皮尔伯格曾触及多种主题与类型。斯皮尔伯格早期以拍摄科幻小说与冒险电影为主，其有时聚焦于儿童，被视为现代好莱坞大成本（Blockbuster）电影制作的典型。此时代表作有：《大白鲨》、《E.T.外星人》、《侏罗纪公园》。\n斯皮尔伯格首部成名作是1975年的《大白鲨》，上映时在全球掀起一阵轰动，但衍生出的续集皆非其执导；1982年斯皮尔伯格开拍《E.T.外星人》，一上映便占据票房榜第一位，高踞了六个星期，而外星人也因此片被冠以“E.T.”之称。\n而1993年《侏罗纪公园》则更是斯皮尔伯格执导生涯最成功之一部，不但打破个人执导生涯最高之票房纪录，还是迄今个人所有作品中最卖座的影片。该片在上映后，曾在全球掀起一股恐龙热潮。而在1997年，斯皮尔伯格拍摄了续集《侏罗纪公园：失落的世界》，但并未执导2001年的《侏罗纪公园3》。\n斯皮尔伯格后来的作品则开始将触角延伸至犹太人大屠杀、奴隶制度、战争与恐怖主义等题材，比较突出的有《辛德勒的名单》、《拯救大兵瑞恩》。前者是关于二战时犹太人大屠杀事件；后者则是关于二战时的战场事迹。斯皮尔伯格凭着此两片进军了奥斯卡，先于1993年借《辛德勒的名单》荣获奥斯卡最佳导演奖；1998年借《拯救大兵瑞恩》获同一奖项。\n近年他创作了第一部动画，《丁丁历险记》，无论在票房或口碑也获得空前成功，先被传媒誉为是“动画版夺宝奇兵”、“本世纪最成功的真人动画”外，更在第69届金球奖首次勇夺最佳动画奖。', 239, '1946-12-18', b'1', 0, 1651557843889);
INSERT INTO `person` VALUES (17, '连姆·尼森', 'Liam Neeson', '3c1d826e-5bda-47ca-9edd-95902461fd3d.jpg', 1, '连姆•尼森出生于北爱尔兰，父母亲是学者，姊妹为教师。尼森曾经在吉尼斯啤酒厂做过叉车工，还当过卡车司机，助理建筑师以及业余拳击手。他也曾为了成为一名教师而在贝尔法斯特的圣\n玛丽师范学院求学。但1976年，他加入贝尔法斯特剧场表演队伍，在戏剧“The Rising People”中奉献了第一次专业表演。\n　　两年后，他来到都柏林的阿比剧院继续演出经典剧目。在那里，他被导演约翰•保曼（John Boorman）发掘，演出了首部电影《黑暗时代》（Excalibur，1981）。随着本片的上映，陆续在20几部电影中演出各式各样的角色，其中包含和梅尔•吉柏逊、安东尼•霍普金斯合演的《叛逆巡航》（1984年）。他在片中饰演一位因质疑信仰而饱受折磨的神职人员，并因此获得Evening Standard戏剧奖。利亚姆•尼森接下来获得赞扬的电影有法庭片《铁律柔情》（1989年），他饰演一位又聋又哑的越战老兵；和戴安•基顿合演的《好母亲》（1989年），饰演一位狂热的雕刻家；及惊悚科幻片《魔侠震天雷》（1990年），饰演一位因意外毁容而被迫隐居的科学家。随后，在《天降神迹》（Leap of Faith，1992）和《贤伉俪》(Husbands and Wives，1992）中的出色表演，为尼森赢得了在史蒂芬•斯皮尔伯格的电影《辛德勒的名单》（Schindler\'s List，1993）中扮演奥斯卡•辛德勒的机会。该片让尼森获得了金球奖和奥斯卡奖提名。', 239, '1952-06-07', b'1', 0, 1651557883128);
INSERT INTO `person` VALUES (18, '北川悦吏子', 'Eriko Kitagawa', 'c1aeb1b3-c111-44b6-ae54-23f523c2f2f5.jpg', 0, '日本的电视剧剧作家，主要以恋爱剧、趋势剧（Trendy Drama）为中心，连续写出优秀作品，被日本剧作界誉为“恋爱之神”。\n大学就读于早稻田大学第一文学部东洋哲学科，毕业后进入日活会社，师事于脚本家佐治干门下，曾以“月岛水树”名义发表作品。以剧作《难得友情人》这部描写女性之间友情的日剧出道，之后创作了《恋爱白皮书》、《美丽人生》、《跟我说爱我》、《悠长假期》等经典的爱情故事。2000年4月，凭借《美丽人生》获第18回向田邦子赏。', 112, '1961-12-24', b'1', 0, 1651558132294);
INSERT INTO `person` VALUES (19, '北乃绮', 'Kie Kitano', '256dc08a-d54b-45aa-b34d-9b034d87f260.jpg', 0, '北乃纪伊，日本一位女模特儿、偶像及演员。2005年3月1日，作为一名新模特于Teen杂志4月号登场，并称为其专属模特。与池田光咲、三浦萌、高桥和美、福永真梨佳、奥谷侑加同期。2005年获得Miss Magazine（杂志小姐）优胜奖。当时14岁的她成为了Miss Magazine史上最年轻并且是第一位获得优胜奖的平成年（1989年后）出生的人。同年7月17日，首次主演了单元日剧「恋爱星期天『夏之记忆』」（恋する日曜日『夏の记忆』）。2007年、在电影『幸福的餐桌』（幸福な食卓）中扮演中原佐和子一角，首次主演电影。同年1月27日，一曲芭蕾曲『樱花飞舞』（桜舞う）以手机铃声的方式限定发行，尝试往歌手发展。同年6月，首次主演电视连续剧，饰演『Life~人生』中椎叶歩一角。 北乃纪伊2007年，出演10月10日发售的LITTLE的单曲「梦惹得祸」（梦のせい）的PV。', 112, '1991-03-15', b'1', 0, 1651558168708);
INSERT INTO `person` VALUES (20, '成龙', 'Jackie Chan', '588c8928-fc3d-4a9e-a77f-6a229f64ac14.jpg', 2, '成龙的父母亲最初在法国领事馆工作，父亲是厨师，也是京剧票友。成龙小时候很喜欢打架，跟那些反对各个外国小孩子打。因为他住在山顶领事馆区，几乎附近的尽是法国人，美国人，这种情况一直到他小学一年级，由于常打架，闹事，所以无法升级。成龙除了喜欢打架之外，还喜欢看武侠片。那时候飞过海 ，武侠片大行其道，曹达华，于素秋是当时最红的明星，成龙崇拜他们，一心想上山学艺。一天，他的父亲带着成龙来到尖沙咀的美丽都大厦，拜访京剧武生于占元师傅，他正是成龙崇拜警察故事的武侠女星于素秋的父亲，成龙看到这边的学生在旁勤奋的练功，觉得非常羡慕。便要求父亲让他在这练武。于是，成龙便成为这的一员，与洪金宝（元龙）﹑元奎 、元华 、成龙（元楼）、元彬 、元德 、元彪 为七小福。于占元师傅的教育方式基本上是老戏行规矩的严厉与苦练。管束孩子做事，练功的方式就打、罚。不到四天，成龙就后悔了。最初的那段日子，成龙常常在晚上暗自哭泣。父亲在把他送进学院之后，就飞去澳洲美大使馆了。\n\n　　1962年在《大小黄天霸》中首登银幕，后又参加《梁山伯与祝英台》、《秦香莲》等影片的拍摄。1971年满师后始任龙虎武师和特技演员。1972 年入大地电影公司。1973年改名陈元龙，出演《女警察》(1973)并任武术指导；同年还主演《广东小老虎》。后一度离港赴澳发展。\n\n　　1976年，罗维游说他重返影坛，并改名成龙，主演《新精武门》、《少林木人巷》、《剑花烟雨江南》、《拳精》、《蛇鹤八步》等，但未能引起注意。1978年思远公司邀他主演《蛇形刁手》和《醉拳》，与导演袁和平找对谐趣功夫戏路，一举成名，此后平步青云。1979年编导演《笑拳怪招》，成绩不俗。\n\n　　1980年转入嘉禾公司，编导演《师弟出马》。后曾往好莱坞拍摄《杀手壕》、《炮弹飞车》等，不大理想。折返香港后编导演《龙少爷》(1982)，再度掀起热潮。后陆续编导演《A计划》(1983)、《警察故事》(1985)、《龙兄虎弟》、《A计划续集》(1987)、《警察故事续集》(1988)、《奇迹》(1989)、《火烧岛》(1990)、《飞鹰计划》(1991)等，皆票房大热。他陆续主演的影片有师兄洪金宝导演的“福星”系列、《快餐车》(1984)、《龙的心》(1985)、《飞龙猛将》等，以及《警察故事III超级警察》、《双龙会》(1992)、《城市猎人》、《重案组》(1993)、《醉拳2》(1994)、《红番区》、《霹雳火》(1995)、《警察故事四之简单任务》(1996)、《一个好人》(1997)、《我是谁》(1998)等。\n\n　　1998年后曾往好莱坞拍摄了《尖峰时刻》两集、《上海正午》两集，终获好莱坞肯定，成为继李小龙之后扬名西方的华人功夫巨星。近年作品有《飞龙再生》(2003，陈嘉上)、《环游地球八十天》(2004)、《新警察故事》(2004)、《神话》(2005)等。《宝贝计划》(2006)。成龙执导的《警察故事》曾获第五届金像奖最佳影片奖，并以《红番区》、《我是谁》分别获第15、18届金像奖最佳动作指导奖；他个人并因主演《超级警察》、《重案组》两度荣获金马奖影帝，2005年获金像奖专业精神奖。2008年，成龙与李连杰携手，主演好莱坞影片《功夫之王》，影片口碑平平，但“双J合作”令无数影迷兴奋。2009年，成龙又与香港导演尔冬升合作《新宿事件》，影片充满血腥暴力与真实震撼，令人惊艳，于导演和主演成龙来说都是一大里程碑式的作品。接下来大哥还将主演好莱坞影片《邻家特工》，是他拿手的功夫喜剧片。\n\n　　由成龙带领的成家班战功彪炳，曾荣获第4、5、7、8、9、14、21届金像奖最佳动作指导奖，以及金马奖第31、32、34届金马奖最佳动作指导奖。', 46, '1954-04-07', b'1', 0, 1651558388253);

-- ----------------------------
-- Table structure for review
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '影评标题',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '摘要',
  `body` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '影评正文',
  `like_number` int(11) NOT NULL DEFAULT 0 COMMENT '点赞量',
  `date` bigint(20) NOT NULL COMMENT '日期，时间戳',
  `movie_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of review
-- ----------------------------
INSERT INTO `review` VALUES (1, 1, '黑色孤儿', 'DC的超英之路——', 'DC的超英之路——\n\n此次《新蝙蝠侠》获得了极佳的口碑，而且上映仅两周就获得了全球5亿美元的票房，可以说是一次全面胜利。看起来，DC已经慢慢明确了其策略：以DCEU（DC电影宇宙）的商业大片，例如《超人》《海王》《神奇女侠》《正义联盟》等来与漫威争夺主要市场；以DC宇宙之外的《小丑》《新蝙蝠侠》等来摆脱超级英雄电影的固有模式，延续诺兰“黑暗骑士三部曲”采取的艺术性与商业性并重路线，请艺术电影、独立电影导演来拍摄更具现实指向性的DC电影，在类型上弱化动作性和视觉奇观刺激，走犯罪片、剧情片、西部片等……\n\n蝙蝠侠一向是DC最重要的漫画角色，其人气甚至超过了超人，改编电影都已经超过了十部：最初形成影响力的，是蒂姆·伯顿和乔尔·舒马赫两位导演在90年代打造的四部蝙蝠侠电影。两位导演采用了一种华丽哥特风格来拍摄，一定程度上确实有漫画感：夸张怪诞的造型、鲜艳妖娆的配色、疯狂惊悚的反派……影片充满了浓厚的超现实气质。1997年，舒马赫执导的《蝙蝠侠与罗宾》口碑票房双双崩盘，直到8年后，才有诺兰接手拍摄了《蝙蝠侠：侠影之谜》。诺兰用好莱坞经典黑帮片的形式，把蝙蝠侠系列拉回到现实中来，特别是《蝙蝠侠：黑暗骑士》，几乎让人联想到了《教父》、《美国往事》、《好家伙》等经典之作。2019年托德·菲利普斯执导的《小丑》，跟诺兰的蝙蝠侠系列一样与DCEU毫无关系，导演放开思路，从当年的“新好莱坞”电影中汲取灵感，瞄准了《出租车司机》《热天午后》等作品。由此，影片获得了奥斯卡11项提名！这是一般超级英雄电影所无法达到的。\n\n黑色孤儿——\n\n马特·里夫斯执导的这部《新蝙蝠侠》，在个人风格化方面比诺兰走得更远。如果说诺兰的蝙蝠侠是具有黑帮片血统的新黑色电影（Neo-noir），那《新蝙蝠侠》的黑色电影气质就更为强烈！\n\n从某种意义上说，马特·里夫斯与拍摄《沙丘》的维伦纽瓦做了同样的选择：让电影摆脱商业类型大片的俗套故事和华丽单调的视觉风格，把电影的质感和美学风格提升到极致！可以说，《新蝙蝠侠》是一部电影质感爆棚，内在的紧张感和惊悚感十足的另类大片。\n\n这一次，《新蝙蝠侠》采用了黑色侦探片的叙事，不再把蝙蝠侠作为一个动作英雄来展现。因为漫画中，蝙蝠侠本来就有一个“世界最伟大侦探”的称号。整部影片，非常像六七十年代法国警匪电影，例如梅尔维尔的《红圈》、《独行杀手》以及1971年的美国电影《法国贩毒网》。蝙蝠侠主要靠的是头脑而不是蛮力，不停地破解谜语人用犯罪杀人方式留下的谜题，试图挖掘出哥谭镇背后的黑幕根源。\n\n影片一开场就是主观镜头的窥视，借罪犯的视角让我们看到了哥谭市长的生活，随后，是一段像恐怖片一样快速、猛烈、冲击力极强的谋杀场景。让我们感到惊悚的，不仅仅是凶手的暴力，更来自于这个自称谜语人的家伙留下的线索，揭开了哥谭市腐化糜烂的真面目。影片前15分钟简洁有力，展现了一个始终笼罩在阴雨和混乱之中的哥谭，蝙蝠侠低沉嗓音的自述，既充满力量，又带着无奈和疲惫——他可以从小混混手中拯救一个无辜路人，却无法消除整个哥谭的犯罪。这样一位打击犯罪的黑暗骑士，无论在身体上还是精神上，无论作为布鲁斯·韦恩还是蝙蝠侠，他都是一个孤儿，孤身一人：警察对其充满戒备，犯罪团伙恨之入骨，老百姓则茫然无知……甚至连老管家阿尔弗雷德也对他有所隐瞒。罗伯特·帕丁森塑造了一个带着诗人敏感气质的蝙蝠侠，孤单、茫然、自我怀疑、身心疲惫……到最后，黑幕的根源直指布鲁斯·韦恩的父亲，让他几乎失去了“正义使者”和“我即复仇”的立身之本。这是之前蝙蝠侠电影所没有触及到的角色内心深处。\n\n蝙蝠侠周围唯一的光亮大概就是猫女了。本片中对两人的情感纠葛点到为止，毫不煽情，却特别动人。它更像是茫茫都市中，两个畸零人偶然的相遇，因为对世界共同的愤怒和失望，使得他们可以互相信任，互相温暖。两人之间的对手戏和对话都不多，但化学反应非常强烈。猫女不再是影片中蝙蝠侠的配角，她拥有着独立的人格和意志。结尾处，猫女选择离开这个混乱黑暗的城市，而蝙蝠侠选择留下，期待改变，两人骑着摩托车，忽而我超过你，忽而你超过我，交错前行；黎明到来之前，车灯在黑暗中闪烁着，两人骑行到路口，短暂停留，对望一眼，分道扬镳——这是我近两年看过的大片中，对男女情感描绘最巧妙又最动人的场景了！\n\n尽管不以动作场面和视觉奇观来吸引观众，《新蝙蝠侠》的视听语言却是非常独特且出色的！整部影片气质沉郁，但绝没有黑成一片让你看不清所以。影片有一段蝙蝠侠与企鹅人的追车戏，完全不同于《速度与激情》那种用豪车竞速来刺激观众肾上腺的做法，整段戏在夜间展开，用了大量中近景而非远景来凸显紧张感，剪辑快速干脆，让你觉得，在追车场面背后，其实是企鹅人的疯狂与蝙蝠侠的果敢产生的对抗。影片的色调并不华丽，很多镜头都是以强烈的光影对比来营造一种画面感：企鹅人从翻倒的车中望出去，蝙蝠侠的倒影映衬着火光，犹如神祇！还有结尾处，一个俯视的远景镜头，蝙蝠侠淌着水举着火把，犹如摩西分开红海般，带领着人们走向未来，走向一个新的哥谭——尽管他内心仍然充满疑虑。\n\n本片在IMAX影厅的放映效果非常出色！除了黑白对比强烈的镜头，影片的音效也可以说是近年大片中少见的出彩！你既能感到头顶淅淅沥沥的雨声，也能领略蝙蝠车启动时强劲的发动机怒吼。你的耳朵不会接受3小时的声音轰炸，反而会像置身其中一样，有种种细微有趣的体验。\n\n无疑，《新蝙蝠侠》是诺兰《黑暗骑士》之后，又一部标杆式的力作！也做到了艺术性与商业性的完美结合。一个黑色孤儿成长为黑暗骑士的故事，让我看到了DC未来电影的无限可能性，而不是仅仅局限于超级英雄打反派的故事模式。我想用自己当年关于诺兰文章中的一段话来概括看《新蝙蝠侠》的感受：\n\n黑暗无处不在，黑暗无法根除；希望之光熹微，然光影摇摇，始终不灭——在今天这个世界上，可以没有超人，可以没有复仇者联盟，却不能没有黑骑士，因为在他黑色的装扮背后，是心灵救赎希望的崛起。\n\nP.S.\n\n当然，影片的不足也比较明显：一是蝙蝠侠与谜语人之间的侦探游戏过于直白，每次谜语人的谜题都被蝙蝠侠一口叫破，缺乏像《七宗罪》那样抽丝剥茧，让观众慢慢发现真相的过程。惊悚和紧张感是有的，但给观众智力上的愉悦就有点欠缺了。\n\n二，结尾还是有些弱，没能深化主题，又回到了以爱和情怀来打动观众的俗套上来。实际上，影片也确实缺乏一个有力且明确的主题，比如在《黑暗骑士》中，小丑信奉人性本恶，而他要通过蝙蝠侠来证实这一点，于是，蝙蝠侠在消灭恶龙和变成恶龙的边缘游走，最终以信任人性获得了惨胜。与此相关，影片结尾不够有力，就是因为谜语人没有像《黑暗骑士》中的小丑那样，给蝙蝠侠制造一个几乎无解的两难困境——救女友还是救检察官丹特，一边是人性与爱，一边是正义，蝙蝠侠无论怎么选择，都不是最优解。由此，丹特变成了双面人，走向自己和蝙蝠侠的反面。而谜语人最后的无政府主义大暴动，仅仅是一个外在的困境，并没有真正影响到蝙蝠侠的内心抉择。\n\n总体上说，我还是非常喜欢这部《新蝙蝠侠》的，因为在商业大片中做独特的尝试，实在是太不容易了。马特·里夫斯也许在思想性上还有所欠缺，但在好莱坞的导演当中，能敢于去做这样的尝试，非常难得了。不敢说他能比肩诺兰或者谁，但真希望他能拍出更多独特有味道的电影来！', 1, 1651553705328, 2);
INSERT INTO `review` VALUES (2, 2, '近万字全解《新蝙蝠侠》33个彩蛋', '他来了，他终于来了！', '他来了，他终于来了！\n\n近日疫情反扑，许多影院暂停营业，但超英大片《新蝙蝠侠》实火，不少影迷特地买好零点场，带着一壶老咖啡去影院接受三个小时的神圣洗礼。\n\n《新蝙蝠侠》国内首映日豆瓣开分7.8，微博开分9.0，淘票票开分9.0，猫眼开分9.0，知乎开分8.6，第一波口碑顶上去了，扑街？绝无可能。不散为大家准备好了33个彩蛋，看完影片的你可以享用这篇文章，还没进影院的话，请收藏。\n\n1.谜语人是谁\n\n在童稚却异常可怖的贺卡中，在一个个精巧的谋杀机关里，在一段段毫无作伪的直播镜头里，「谜语人」无疑成为了今年大银幕的头号反派。\n\n![p7195115.webp](/api/articleImg/40ee8ce3-8325-4a72-a1cc-28697277f82c.webp)\n\n他神经质的语调，戴着面具和眼镜的业余和轻佻，配合无情的摄录，一次次「不要谎言（NoMore Lies）」的大字报，将《新蝙蝠侠》的分级越调越高，将恐怖的氛围推动到底。\n\n他是谁？影片中出现了两次谜语人的身份证，分别叫「Edward Nashton」和「Patrick Parker」，两者都是谜语人在漫画中使用过的名字。', 0, 1651554223124, 2);
INSERT INTO `review` VALUES (3, 2, '历史上最刺眼的红', '一边看电影一边记了五页的“笔记”，可是当真正要开始写的时候却很难下手。\n要从沉重的心情中抽身出来，理性地看待这个问题，也许还需要一段时间。', '一边看电影一边记了五页的“笔记”，可是当真正要开始写的时候却很难下手。\n要从沉重的心情中抽身出来，理性地看待这个问题，也许还需要一段时间。\n\n \n还是一个讲述犹太人的故事，但是和上次看的《美丽人生》有所不同，色调上，角度上。\n《美丽人生》是从犹太人的角度来讲的，而《辛德勒名单》则是将一个德国纳粹人人性逐步被唤醒的过程。\n\n或许我这样概括并不准确，但这却是我最强烈的感觉。\n\n \n\n1939年9月，波兰的犹太人被驱逐到克拉科夫，并且被限制生活在隔离区。\n当时德国企业家辛德勒买下了一间倒闭的公司，创立了一个制作军用品的工厂。\n由于犹太男子7马克一天，妇女小孩5马克一天，而工资全部归政府，同时波兰人佣金比较高。\n于是，辛德勒选择了犹太人。\n也是这一选择，让他的人生发生了本质上的改变。\n\n\n1943年3月13，德国在克拉科夫进行大屠杀，辛德勒看到城里这一幕，心里那种要拯救犹太人的呼声也越来越响。\n重新开了工厂，招揽工人，利用他的财产跟德国纳粹要来一条又一条的人命，还救了一批被送往集中营的女人和孩子。\n最后德国军战败之后，犹太人得以解放。\n\n\n1974年辛德勒去世。一开始，影片就播放着“黑色星期日”，给整部片就定下了一个基调。\n然而在德国军人花天酒地的地方，却是一派的“欣欣向荣”。即使是黑白片，你也能看到灯红酒绿，只是剥了这层皮剩下的不外也就是无声的黑白。\n突然间想起莎士比亚一句对生命的嘲讽：充满了声音和狂热，里面却空无一物。\n我想这已经足够概括那样的场面。犹太人开始被赶往隔离区，是悲剧真正的开始。\n把整整一个家装在几个箱子里，这就是他们2千年来的命运。\n财物的丢失还在接受范围之内，而当时路边一个小女孩兴奋地大喊“goodbye，jews！” 这才让人从心里冒起寒意。\n小孩子，无论在哪里，都应该是作为最纯真的，不被玷污的圣体，然而在这个最恶的民族里，就连小孩都本能地对犹太族产生厌恶。\n还有另外一个镜头，是一群妇女被送往集中营的车上，窗外一个小男孩用大拇指指向喉咙作割颈状。\n那个镜头真的让我非常震惊，不解。\n这绝对不是一句“小孩子闹着玩”而可以解释得过来的，也决不是可以说他们只是有样学样，而是他们已经从对犹太人的虐待中取得了快感。\n是多么深的仇恨，才能在小孩子的身上也有这样的作用？\n这种被扭曲的人性，我真的不知道应该怎么发展下去。\n当时在想，如果犹太人最终没有被解放，那么德国人在毁掉犹太人的同时，是不是也在毁掉自己的下一代？\n但同时也有另一个帮助了一对母女逃脱的德国小男孩，这是让我们稍为宽慰的。\n\n \n\n辛德勒的accountant是让我很欣赏的一个人，偷偷帮一些不合格的犹太人做假证件，好让他们能够进到D.E.F工作。\n辛德勒的父亲说，一辈子必须结识的三种人：a good doctor, a good priest, a good accountant\n斯皮尔伯格没有通过他本身来刻画他是一个good accountant，而是描绘工厂的成功。这比任何笔墨都能说明问题。\n而对于accountant本身，更多的是表现他善良的内心，对民族同胞的关怀忧虑与爱。\n于是这个人物有了两个鲜明的特征。\n\n \n\n这部片不时地都在体现犹太人的聪明，当时那种聪明也不是体现在对什么学科有特殊的见解上，只是把一些珍贵的东西藏起来，把自己躲起来，或者那个小男孩指着地上被枪毙的犹太人说鸡是他偷的。\n\n都是这样的“聪明”。\n\n可这让我对“犹太族是最聪明的民族”这句话有了新的见解。\n\n这并不是天赋的，而就像一个被抛进水的人必须挣扎学会游泳求生，一样的道理。\n\n面对迫害，面对四分五裂的民族，别误选择地只好绞尽脑汁地让自己在这个世界多逗留一秒。\n\n希伯来语的恢复就是一个很好的例证。\n\n他们没有有力的双翅，只有一个把整个民族背负在身上的壳，于是他们做不了老鹰，却成了爬上金字塔顶端的蜗牛。\n\n但如果没有这个壳，我想蜗牛还是到不了金字塔顶端的。\n\n所以当我们说犹太人聪明时，我想，我们要佩服的决不仅仅是他们的智慧，而是他们坚韧的求生的本能。\n\n而对于一个听到别人称赞自己聪明的犹太人，自豪的背后有多少辛酸又有谁知道呢？\n\n投下一片光，就会留下一片影。\n\n \n\n一群妇女和小女孩被送往集中营的场面让我很难受，特别是当她们被剃光了头发脱光了衣服送进集体冲凉室时，那种恐慌甚至爬出了屏幕侵入到我身上。\n\n冲凉室里，满是裸体的女人，满是短发，满是恐慌的眼神，满是挣扎着的呼吸。\n\n她们不知道自己的命运，而我却很害怕，因为我知道集中营有“毒气室”这一设施。\n\n我很怕自己下一秒看到的满室的尸体。\n\n当花洒的水洒下的时候，她们那种解除忧虑的激动，用嘴去接水的表情和渴望，让人感觉到，她们刚刚离死亡是多么的接近。\n\n对于他们来说，生与死是那么接近。\n\n当时的她们连遮体的衣物都没有，就这样赤身裸体的，被丢到了一个陌生的危机四伏的环境。\n\n从这堆女人身上，我看到了犹太民族，被剥夺了任何依附之物，被剥夺了归属感，就这样被任意地丢落四处。\n\n脆弱地碰到一根小刺都会血流成河。\n\n \n\n电影中最震撼我的是一个红衣小女孩。\n\n当时克拉夫正在屠城，辛德勒在山头，看着脚下四处奔跑的犹太人，听着四起的枪声，画面是从远处拍摄的克拉夫城。\n\n一开始，在为他们不公的命运和刺耳的枪声而心灰，心灰的是在他们这样有“神”存在的地方，“神”怎么对他们选择了盲目？更心灰的是作为人类，是什么把稚嫩的心磨成如此的粗糙和坑洼。\n\n我们口口声声的人道和人性呢？不断不断地自己，到底是什么，能让人变得如此残忍！\n\n就在那样一个心都欲哭无泪的场面，一个黑白的凝重的画面，我看到一个身穿红衣的小女孩。\n\n斯皮尔伯格在拍摄这个故事的时候用的是黑和白，但是这个小女孩却一身红的出现。\n\n她并不显眼，那不是耀眼的红，即使红，也红得深沉，以至于一开始我没有看到，但是当我看到的时候，那黯淡无光的红却让整个画面像被光芒罩住一般。\n\n也让我的心重新燃起了希望。\n\n电影史上，不管用过多么细腻的华丽的颜色，或者多么深沉的凝重的颜色，也比不上这一身红，遥遥不及。\n\n它承载的实在太多，是对历史的痛诉，对民族的忠诚，对命运的挣扎，对希望的向往，还有更多更多说不上的情感。\n\n这一抹红，也让人看到斯皮尔伯格，作为一个导演，他艺术的造诣；作为一个犹太人，他对犹太族的痴爱；作为一个人，对人道的追求与人性的执着。\n\n这是我，见到的，最美丽的颜色。\n\n \n\n辛德勒，很难书写的一个人物。\n\n也许他一开始想的只是如何挣钱，但在后来却努力地在挣犹太人的生命。作为一个资本家，他是成功的，成功地把一个倒闭的公司成了主要生产商；但作为一个资本家，他同时也是失败的，没有一心一意地为自己牟利，最后落得过清贫的日子。\n\n但是作为一个人，特别是德国人，他的成功和意义所在，他所创造的财富，是任何一个资本家都无法媲美的。\n\n在一开始，他想的只是想发战争财。\n\n“There\'s no way I could have known this before. But there was always something missing, in every business I tried. I can see now, it wasn\'t me that failed. Something was missing. Even if I\'d known that it was, there\'s nothing I could have done about it. Because you can\'t creative this thing. And it makes all the difference in the world between success and failure.\"\n\n\"luck?\"\n\n \"war.\"\n\n他很好地利用了战争这一点，这时我看到的是一个资本家冷血的一面，只要能谋利，世界大战也与他无关，甚至还成了推动他生意的有效因素。\n\n人们可能会谴责这一点，但这对于一个资本家来说确实是合情合理的。\n\n以至于后来辛德勒会有这样的改变，更让人觉得难得与佩服。\n\n但事实上，他却把factory变成了heaven，犹太人都认为，只要进了他的名单，就可以免遭迫害。\n\n当他发现他一车的妇女和小女孩被送往集中营时，他去要回人，激动地喊着“essential” ，对于他来说，每个人都是essential的。\n\n这句话的呐喊已经远远超出了一个资本家对自己财物所有权的保护，更多的是对生命的尊重。\n\n到后面，为德国军队生产战争武器的时候不合格，但是这也是他故意的，用没有精密的仪器和先进的技术作为借口，没有去生产可以射杀死别人的武器。\n\n这个时候的他与那个赚战争财的他是两个人了。\n\n但他同样面临一个问题，不生产合格的武器，就没有生意来源，也就意味着他的犹太工人全部都要被送往集中营；而生产武器的话更是会让血流成河。\n\n这个资本家面对的却是生命与生命中作抉择的难题。\n\n斯皮尔伯格没有用大篇幅来描写这一段，但我想他是很挣扎的，不管是哪一条路，都是以生命为代价，只是多少的问题。\n\n幸运的是，历史为他解决了问题。\n\n德国战败。\n\n在解放前一天，他在他的犹太工人前忏悔：\n\n “I\'m a member of the Nazi party. I\'m a munitions manufacturer. I\'m a profiteer of slave labor. I\'m a criminal. And midnight you will be free and I\'ll be hunted. I shall remain with you until 5 minutes after midnight. After which time, I hope you will forgive me. I have to flee.”\n\n最后走的时候，犹太工人给他制作了一个戒指，上面刻有字。\n\n“It\'s Hebrew, from the Talmud. It says,\'whoever saves one life,saves the world entire.\' ”\n\n但是这时候他却泣不成声，一直在念着“I could have got more”..\n\n他在后悔自己奢侈的生活，细数一辆车还可以救十个人， 一个pin还可以救2个人， “I could have...but I didn\'t...”\n\n不管是他的忏悔，还是他的后悔，最后这个场景都是他所有感情的迸发，以前一直那么泰然自若的他，现在却泪流满面。\n\n这里面有复杂的情感。\n\n自己的民族，战败了；而自己一直同情并试图拯救的民族，解放了。\n\n痛恨自己曾经的挥霍无度。\n\n但是如果从他的眼泪和他的话中，得出的是他对自己过去生活的否定的话，辛德勒不会成为一个历史上的英雄。\n\n我觉得，他那种悲痛，是出于作为德国民族的一员对犹太族的愧疚。\n\n尽管他做了很多了，但是他拯救相对于德国纳粹残杀的，也不过是大海里一滴水而已。\n\n他为自己的民族感到羞辱，他心里承担了太多的一个民族的错误，所以他把自己也否定了，1100人，对他来说，却完全不够，远远不够。\n\n在犹太人看来，甚至在我们看来，他拯救的不是1100条生命，而是1100个世界。\n\n \n\n其中有一个军官这样说犹太人：委屈求全，这是他们几千年都这样做的。\n\n当一群犹太人聚集在隔离区时，他们聊的话让我心情很沉重。\n\n \"I woke up from a dream this morning, I was broke and sleeping in a room with 12 people I didn\'t know. Only to discover I was broke and sleeping in a room with 12 people I didn\'t know.”\n\n\"You laugh about it?\"\n\n\"I have to laugh.\"\n\n \"You are living behind walls\"\n\n\"The walls I can deal with. It\'s the restrictions to my life I\'m tired of. \" \"Those walls keep them out. That\'s all I care about.\"\n\n \"I like it here. There\'s a kind of , I don\'t know, ancestral squalor to it all.\"\n\n...\n\n\"No one took my business away from me.\"\n\n\"You don\'t really have a business to take.\"\n\n \"There is nowhere down from here. This is the bottom.\"\n\n\"The getto is ... liberty.\"\n\n尽管是在描述多么悲惨的生活，他们仍是平静地像聊家常一样。\n\n有的人会说是斯皮尔伯格用这种对比来表现主题。\n\n可是我想，他们确实就是这样的。被折磨得久了的人，抗议的力量也没有了，锋芒也暗淡了。\n\n这里可以看到不同的人，有的依旧对于自己的现状迷惘，每天醒来都想来到一个陌生的环境。有的对这样的生活选择一笑置之。有的把keep the Jews in的隔离区看成是Keep the Germen out。有的意识到这已经是最糟糕的境界的，庆幸不可能再糟了。有的甚至把这个隔离区就看成是自由的。\n\n我们最怕看到的不是失望，不是绝望，而是麻木。这样的人是行尸走肉。\n\n他们尽管都不满意现在的处境，但他们也习惯了，没有人想要出去。\n\n或许是迁移对于他们来说，太多了，多得承担多任何一次都会是the last straw that breaks the camel.\n以至于后来宣布liberated时，没有欢呼没有兴奋，第一个问题是：\n\n“Where should we go?”\n\n \n\n德国战败后辛德勒遭婚变，并且生活窘困，依靠犹太人的救助金生活。\n\n1974年10月9日辛德勒去世，被犹太人称为“36名正义者”之一，安葬在耶路撒冷。\n\n今天波兰存活的犹太人仅不到4000人，而辛德勒犹太人却在6000人以上。\n\n \n\n93年上印的这部片，捧了7项奥斯卡大奖。\n\n导演斯皮尔伯格是个犹太人，而副导演是集中营的幸存者。\n\n斯皮尔伯格最后把这部电影所有个人盈利都捐给美国大屠杀博物馆。\n\n我一直不解，一个犹太人，拍摄犹太人被迫害的画面，怎么承受得了这样的压力？\n\n而斯皮尔伯格自己也说：“这次我大感到重要的不是我的想象力，而是我的良心，突然间，我惯用来逃避现实的摄像机直面现实了，在拍摄中我哭了，我每天都留下热泪。”\n\n他以此片纪念600多万犹太人。\n\n爱得深沉。\n\n \n\n“辛德勒名单”固然好听，但更吸引我的是犹太人在辛德勒忏悔后齐唱的歌。\n\n那样的音乐才是真正能打动人的音乐，它的悲不在旋律上，伤也不在歌词上，但是它拥有悲壮漫长的历程作为基调。\n\n即使简单的不连贯的音符，都让人泪流满面。\n\n让我想起60年代美国黑人教堂的音乐，那种真正能洗涤心灵音乐。\n\n他们唱的都不是对历史的控诉，而是对未来的向往，对自由的热爱，对信仰的虔诚。\n\n每一声，都能穿透世纪。\n\n \n\n看完，写完，心情依旧很沉重。\n\n我甚至在想如果我一开始就不看，对这段晦暗的历史选择不知，会不会更好。\n\n可是就像斯皮尔伯格的镜头，不能逃避现实生活，只有直面生活才能解决心中的纠结。\n\n没有看到曾经人性暗淡的时光，我也不会看到而人性的发展。\n\n我在看的时候甚至有几度痛恨德国人，但是看完之后却又是另一番心情。\n\n斯皮尔伯格，甚至他镜头下的犹太人，都是平静地叙述这个故事，没有诉诸于仇恨。\n\n那么，他也不是想通过这部片子来赢得世人对犹太人的同情，对德国人的仇恨。\n\n他们用自己亲身走过的血淋淋历史，嘱咐了世界，别重复这条不堪之路了。\n\n也让我们学会了，任何一段历史，都不可能已仇恨来画句点。\n\n当我们更多地把它们看成人性发展的一部份，我们是不是可以更好地学会宽容。\n\n因为那不仅是犹太人的历史，是全人类的历史；那2000年流离失所的不仅是把民族背在背上的犹太人，而是全人类的人性。\n\n他们找到了家，找到了归属，而我们的心，也不应再流浪。', 0, 1651559759152, 9);
INSERT INTO `review` VALUES (4, 2, 'God has/is a girl.', ' 人生啊，不是靠知道自己还有几天而活下去的，而恰恰是因为所有的未知才活下去。   ', '在BFA上过剧作课的同学对于《超新约全书》的导演雅克·范·多梅尔一定不会陌生，这位比利时编导全能鬼才导演的处女作《小英雄托托》（1991）曾被拉片半学期，多梅尔的故事叙述、剪辑水准和音乐品味都令人印象深刻。在我眼中，他是法语区奇幻脑洞三人组之一员，另两位是让-皮埃尔·热内（《天使爱美丽》）和米歇尔·冈瑞（《科学睡眠》），而他俩出片速度可比多梅尔快多了。多梅尔保持着量少而精的原则迄今只推出过四部长片：《小英雄托托》（1991）讲述姐控卢瑟意淫一生；《第八日》（1996）讲述残障人士唤醒迷茫；蛰伏多年后推出的文艺科幻片《无姓之人》（2009）化用《机遇之歌》把选择恐惧、蝴蝶效应、平行人生、时间倒流玩得出神入化；今年新推出的《超新约全书》则脑洞大开重设世界，天马行空颠覆宗教。他的前三部影片虽然也很鬼马但总能嗅到其中的悲观虚无，到了《超新约全书》完全一后现代喜剧真是防不胜防啊！\n\n![p57239.webp](/api/articleImg/11615078-1efc-48d1-9260-0cdcc6bd9087.webp)\n\n在看片前发现海报的字体设计和宗教题材略像《宾虚》和《万世魔星》，再结合剧情果然是恶搞宗教史诗大作：上帝是个邋遢变态大叔，死宅在布鲁塞尔的寻常住所，靠老旧的台式电脑掌控世界，以给人类制造麻烦和困境为乐，脾气狂躁随时暴走抖S（皮带抽女儿简直了）；他老婆-曾经的女神-现在是少女心不死的懦弱扫地大妈，最爱绣花和棒球，幸运数字是18（不是《银河系漫游指南》的42哦）；上帝不只有独生子道成肉身，还有个反叛的十岁女儿，艾薇儿式的朋克少女对人间种种不幸看不过眼，给全人类泄露了死亡倒计时，离家出走改造世界，推翻暴君父亲；打酱油的JC也是与父不睦，授予妹妹方法去人间寻6个使徒写成《超新约全书》完成对人世的救赎。——以上在影片的前半段完全是天神背景下的家庭伦理剧，但是设定一出把细节填补上就是一场好戏。', 0, 1651559945427, 6);
INSERT INTO `review` VALUES (5, 1, '当猩猩变得比人类更配成为“人类”', '这次专程去香港看的几部新片里，除了诺兰的《敦刻尔克》，最期待的无非就是这一部了。', '虽然谈不上热爱，但“猩球三部曲”在我心目中绝对是近年来最难得的商业系列之一。作为一个围绕猩猩展开故事的三部曲，安迪·瑟金斯在动作捕捉下演绎的“凯撒”自始至终都是绝对主角，这点从不忽悠。因为时间的跨度之大，每一部的人类角色都会被替换，即便有商业上的压力，也不为了票房号召力而去留住任何一位大牌，以至在故事上做任何妥协。而这个系列之所以如此优秀，显然不仅因为它文武戏水准俱佳，更贵在一边吃尽好莱坞的工业制作优势，却始终没有被日益轻浮的流水线作风影响，而是坚定秉承着始于上世纪六十年代老版《人猿星球》系列的反思内核，把平等、自由、包容异族等诉求，乃至对照现实的社会性思辨融入故事的每一个起承转合中。 从鲁伯特·瓦耶特执导下偏爆米花兼猎奇向的《猩球崛起》，到马特·里夫斯接手后史诗感初显、沉稳大气的《猩球黎明》，每一部我都很欣赏。 \n\n而对这一部的期待，除了因为北美爆棚的口碑，更多是源于它作为终章“如何收场”的悬念。\n\n![p830688.webp](/api/articleImg/9901609c-bb62-44fc-8594-efee606d291b.webp)', 0, 1651560103162, 14);
INSERT INTO `review` VALUES (6, 1, '起码，我们可以选择自己的悲剧', '其一，这部电影的叙事非常平静，自信而有底气，波澜不惊，', '昨夜深夜开始看《成长教育》，我很喜欢这部电影。\n其一，这部电影的叙事非常平静，自信而有底气，波澜不惊，\n故事平而不淡，在平静无波的叙述中，你感觉到有异样的东西，\n你在等待重重的一击，这种焦虑渐渐累积，加强，直至爆发。\n\n其二，我喜欢这部电影的女主角，这是一个聪明而独立的女孩，\n电影跳脱了年幼无知少女被社会油滑成功男欺骗的俗套，虽然故事本身的层面是俗套，\n但是它塑造了一个独立，有头脑的女孩。她享受艺术，爵士，向往巴黎，厌恶乏味和无聊，\n但是她能掌控自己。她拥有的不仅仅是无辜的天真，还有一份少女的自持，和对自己的珍视。\n\n这份珍视让她俨然是不可侵犯的，我最欣赏两人初夜的那一场戏，她一旦发觉不对，立刻要求停下，\n男主角潜在的男孩心态跳出来，居然要用一只香蕉给她破处，女孩笑着拒绝了，\n她从这里掌握了两人关系的主动权，她拿香蕉开玩笑，她拒绝叫米妮，她要求得到自己该有的对待：\n第一次的温柔，珍贵，还有自己已然是一个成年女人的自觉。\n\n其三，我喜欢这部电影的主题和讨论，时至今日，这仍旧是一个问题：\n女孩子为什么要读书？是为了所谓的独立，还是为了嫁得更好，更贵？\n读了大学，变得优秀，进入社会，独当一面，也未必幸福，\n为什么我们不拿自己最宝贵的青春，来学习其他的东西，比如挑选男人？\n中午我和玛花纤体的人们讨论这部电影，她们请我来为品牌做小小的示范，\n女人依然在为这个问题烦恼，争论，找不到满意的答案。\n\n但是我自以为得到了我内心的答案，那就是，学习让我们有尊严。\n财富不是唯一的权威，所有的财富都在内心忌惮知识，因为他们知道他们不懂。\n是的，也许学习，变得强大也只是形成了我们的悲剧，但是我们仍旧变得可以选择：\n起码，我们选择独自承受悲剧，或者和另外一个人走进悲剧。\n\n我们还谈到了“剩女”，我从来不同情剩女，我欣赏她们，\n没有女人真的嫁不出去，只要你肯放低自己，但是你不肯，情愿孤独。\n她们有能力孤独，这是了不起的。\n\n其四，我和玛花的女孩有了一个共同的感受：\n我们都觉得电影的底牌是一个败笔。男人是有妇之夫，这个事情变得无可选择了。\n最好的讨论应该是女孩是可以选择的，她的最终选择才会变得更有力量。\n\n其五，我喜欢这部电影对每个人物的描写，哪怕是只有一两场戏的小人物。\n我欣赏对女孩爸爸的描写，最后爸爸给女孩送饼干时说的那些话让我潸然泪下。\n还有电影中的其他几个女性角色，代表女人的其他可能：\n没有权力，暗中有主见却无奈的妈妈，孤独而真诚的女老师，\n愚蠢，天真而善良的海伦，她是一只快乐的花瓶，以及男主角的妻子。\n我喜欢女人之间的关系，她们真切体谅，感同身受，没有嫉妒和\n最好的剧作是准确而微妙，我觉得这部电影的人物描写是准确的。\n\n最后说说我的强烈感受：女主角长得好像故事啊！！！！\n那种少女的甜蜜的脸颊，真的很像～～～～\n', 0, 1651560260871, 7);
INSERT INTO `review` VALUES (7, 1, '烂中烂', '烂中烂', '以韩寒为代表的，小布尔乔亚视角臆想的非主流集合，这种符号意义的杂糅，一度以为这是一部意识流作品，这便是现代社会中韩寒这样的导演所能做出的最大的想象了，这种尴尬和无所适从，正是大对体符号秩序意义的匮乏。\n\n南澳就是一个现代符号之外的孤岛，为那些所谓文青营造了一个不存在的乐园，后半段主角去了广州之后，更是把这种对立展露无意。', 0, 1651560318059, 1);
INSERT INTO `review` VALUES (8, 1, '用雨刷器刷掉对爱的阻碍', '什么是爱？短片抛出了问题，却没有回答。', '[原链接](https://movie.douban.com/review/14262529/)\n\n什么是爱？短片抛出了问题，却没有回答。\n\n短评里有人说这部短片有卡佛的风格，我感觉并不是。我最近在读伊朗导演阿巴斯的《樱桃的故事》这本书。阿巴斯的理念是，好的作品能够引发人思考，在看一个作品时，每个人都应该有自己的代入感和理解。“艺术不是将想法强加于人，而是从人们那儿获取想法。”直接给出明确答案的作品并不是好作品。\n\n我看到很多人在说雨刷器这部影片表达的现今社会中的孤独感和对爱情的悲观态度，但当结尾这个听上去很丧的音乐响起的时候，我却认为影片想传递的恰恰相反。\n\nGive me all your love now，cause for all we know，we might be dead by tomorrow.\n\n虽然歌词一直在强调所有人都会死，前面几句歌词也明确表达了因为没有准备好而虚度光阴的错过感，但几句过后歌词直接配上画面开始鼓励人们勇敢去爱：第一段男子和女子擦身而过，男子仅仅回了头，便离开了。第二段桥上远景，男子同样擦身而过，回了头，但这次他奔跑着追了上去。后面同样也配上几对活在当下用力爱的人们：隔着玻璃亲吻的商务男和清洁工，电梯里情不自禁热吻的男女，坐在滑板上亲吻随着坡度而下的年轻人。摩托车出车祸的男女，老人站在墓前，则表达了，we might be dead by tomorrow，我们不知道明天和意外哪个会先来，所以我们要从现在开始勇敢爱，用力爱。\n\n影片中我最喜欢的文字是问关于颜色的对话。你自己是什么颜色？蓝色。在你心里我是什么颜色？红色。那我们一起是什么颜色？男人没有说话，我想是他太害羞以至于没有说出口：和你在一起，我的世界五彩缤纷，璀璨夺目。\n\njk少女跳楼剧情也是非常有张力的一段。少女跳楼的瞬间被风吹拂的头发轻盈灵动，眼神却呆滞无望，跳楼前期身体随风飘下，此处没有任何音乐，随后却是重重地落于地面，引起巨响。轻重的对比恰到好处，让这个片段如少女发丝般轻盈，又如重重落下之声般凝重。\n\n我认为光影处理最出彩的一段是醉酒流浪汉对着高级女装店的独白部分。此处同样也是轻重对比强烈，画面一边是黑暗晦涩颜色沉重如同死水一般的街道，另一边则是透明感强烈光影流淌的浅色服装店。轻盈的高级服装店配上死气沉沉的街道，此处映射出流浪汉前妻离开了流浪汉重新出发，生活可能过得越来越好，而流浪汉每天酗酒沉溺于回忆，如同生命永远停留在了前妻离开的那一天，往后余生的每一天都晦暗绝望。\n\n在超市刷社交软件的小年轻们也是被大家津津乐道的一段剧情，如今闹着玩似的感情也确实充斥着年轻人的生活，这段是个反面例子，那么导演想表达什么呢？讽刺快餐式爱情固然也有，但结合整部作品，我觉得仍然在表达，要勇敢，否则这辈子你遇到真爱的机会，就被你一念之间错过了。我们从上帝视角很好理解这个片段中男女做的傻事，但是回想自己在生活中，是否也有过这种退缩踌躇的时候？\n\n这部短片毋庸置疑给了我们很多反面例子，一部分人守着曾经爱过的执念出不来，如跳楼少女和醉酒流浪汉；另一部分人过于忧虑未来而不敢踏出走向爱的一步，如社交软件男女和让人等到花都谢了都不出现的女孩。在现在的快节奏社会中，所有人也都能很容易地达成共识：想遇到真爱是一件非常难的事。但是，无论是短片结尾的歌曲和场景，还是歌曲结束后的独白，都是导演给人们指明的路：\n\nAnd I feel like when I let go of that，when I let go of tryin\' to figure out where we are going，as supposed to being in that moment……\n\nthey actually go the way that I like.\n\n既然人都会死，干嘛那么纠结，活在当下，好好地创造机会，好好地追求爱，好好地享受生命中的每时每刻。\n\nwhat is love，什么是爱，这件事没人说得清，不管是短暂的荷尔蒙，还是白头偕老，都需要自己体会。站在十字路口踌躇不前，也终有一死，何不放下对过去的执念，放下对未来的忧虑，活在当下，体验人生百态，体验爱，然后再……去死呢？\n\nso let’s love fully，and let’s love loud，let’s love now，cause soon enough we’ll die.', 0, 1651560388219, 3);
INSERT INTO `review` VALUES (9, 1, '失能症候群', '2008年嘎纳电影节开幕影片《盲流感》改编自1998年诺贝尔文学奖得主若泽·萨拉马戈的获奖作品，这本书的中文译名是《失明症漫记》。', '2008年嘎纳电影节开幕影片《盲流感》改编自1998年诺贝尔文学奖得主若泽·萨拉马戈的获奖作品，这本书的中文译名是《失明症漫记》。当年评审委员会授予作家的得奖理由是：“由于他那极富想象力、 同情心和颇具反讽意味的作品,我们得以反复重温那一段难以捉摸的历史。”作品以某个并未指定的西方城市作为背景，叙述了当地居民群体性地失去视力后所发生的人情冷暖，整个故事以失去视力隐喻人类的“道德失明”，仿佛一个彷徨而迷茫的寓言，直接触及人类最丑陋的欲望和无可救药的脆弱。\n\n《盲流感》容易让人想起另一部有着类似风格和指向的影片《人类之子》，后者改编自P·D·詹姆斯的同名小说。在《人类之子》中，人类突然神秘地失去了生育能力，面临灭亡而处于绝望边缘的人类社会被一片黑暗笼罩，战火纷飞、秩序无存。在技术上《人类之子》是一部不可多得的杰作，影片除了极具观赏性的长镜头和极具真实感的枪战场面外，在布景和道具中也几乎处处充满着别有玄机的政治和宗教隐喻，令人称奇。但令影片整体境界得以提升的重要因素，是剧本对现实社会迂回而不失辛辣的鞭笞和讽刺，与其说影片是一部以人类失去生育能力为主要题材的科幻影片，还不如说它直接针对充满种种阴暗和矛盾的人性提出了一个严肃的问题——一旦人类社会失去了得以延续的希望，一切的秩序、道德和文明是否还会在余生延续？\n\n说《盲流感》和《人类之子》两部影片十分相似，除了是因为两者都在科幻外衣下将真正的矛头对准现实社会之外，还由于这两个故事有着一个共同的背景假设——人类群体性地丧失某种重要能力。不论是《盲流感》中的视力，还是《人类之子》中的生育能力，人类社会都因某种重要技能的丧失而面临崩溃的威胁。\n\n这一个假设颇为值得玩味。一是，由失去能力引发的恐惧并非外生，既不像外来物种的突然入侵袭击，也不同于武器泛滥等玩火自焚式自导自演的悲剧，而完全来源于人类自己，最终所引起的所有后果，是人类自身主观推动的。二是，能力的丧失始终并未追溯出什么具体的缘由，或许一开始同《盲流感》中所说的那样，还有许多科学家试图对这一现象进行研究和探索，但随着时间的推移以致所有人群都沦为牺牲品后，对自身命运的恐惧和求生本能的释放远远超过了对失能现象本源的探究和弥补措施的思索。三是，失能虽是对生理机能的破坏，但最终陷入困境的实质上都是人类的心理，从个体的歇斯底里到社会的秩序沦丧，失控的心理状态在其中起了十分关键的作用。\n\n建筑在失能这一假设之上的，是社会规则的无能为力。在不同寻常的状况下，政府的约束和社会成员的自律都不能起到任何的弥补作用，因为恐慌心态一旦在群体中蔓延开来就很难收口。两部作品各自都有着具有隐喻作用的关键人物——《盲流感》中并未失明的医生妻子，以及《人类之子》中神秘怀孕的非洲少女。她们的存在既是失能社会的生理奇迹，也是盲从人群的心理依靠，而从某种角度来说，两个故事的所有情节也都构架于这两个“例外”之上。\n\n有意思的是，美国演员朱莉安·摩尔在两部影片中都扮演了非常重要的角色，在《盲流感》中她出演了那位在失明人群中唯一存有视力的妻子，而《人类之子》中她则扮演了暗中帮助运送婴儿的警察的前妻。其中，《盲流感》中视力尚存的妻子，在故事中所起到的作用是更为显著而主导的。在整体色调较为灰暗的影片中，尚存视力的她，在与丈夫和其他失明宿友共同生存与斗争的过程中，体现出的是理解和关爱，似乎是所谓光明和良知的化身。但不能忽视的一个细节是，她的道德也是有边界的——当她在丈夫的帮助下带着满包库存食物逃离业已荒废的超市时，在她身后的正是其他在辛苦觅食的盲人。他们发自本能的求生手段是把女人拦下，抢夺她手中的食物，但在女人的眼中，这一群“恶狼”是多么地骇人而恐怖——她眼中值得关心并为之奋斗的，只有她的丈夫和那群在隔离所内朝夕相处的患难友人，其他的人即使处境再为艰险，她也不能也不愿关心。更何况那群人还有着如此凶恶的表情和残暴的举止，她甚至可以在之后亲吻一条流浪街头的狗，也不愿再自己回去找寻丢失的衣物。她也不是上帝，放在以前也只不过是一个再普通不过的正常人，她即使再比别人健全、再比别人有良知，也成为不了博爱众生的上帝，现实和理想都告诉她，若要生存下去，靠的是肚子而不是良心。与其说她是代表人类道德和良知的长明灯，还不如说是光亮与热能都有限的蜡烛。这种有边界的道德显得倒更为合理而深刻——既给能够延续的未来生活留下了一丝温暖与希望，也没有逃离全片构筑起的批判与自省的基调。\n\n令人遗憾的是，由于剧本和剪辑的缘故，《盲流感》的叙事有些失当，在一些关键性情节上的交代不够细致和清晰，导致观众许多不必要的疑惑和不解的产生。但纵观全片，《盲流感》虽没有《人类之子》那样极具野心的艺术或技术细节，但在整体上依旧保持着较高的观赏性。', 0, 1651560501159, 5);
INSERT INTO `review` VALUES (10, 1, '人类一思考，上帝就发笑 （别忘了最后的彩蛋）', '上帝的“人类普遍困境”法则', '上帝的“人类普遍困境”法则\n\n2125号法则：掉在地上的，永远是涂有果酱的那一面，不然就是果酱涂错了面\n2126号法则：打破的永远是刚洗好的盘子\n2127号法则：理想的睡眠时长永远比实际多出十分钟\n2128号法则：另一队总是移动的更快（排队的时候）\n2129号法则：当你将身体浸入浴缸时，电话铃声总会适时响起\n2231号法则：祸不单行\n\n还有门徒之一的弗朗索瓦也逃不过的1522号法则：\n“如果有一天 你坠入爱河，很有可能 共度一生的人却不是你爱的那个。”\n\n\n\n电影当然是五分推荐！！！\n不管是从创意还是大开脑洞的奇妙剧情，配乐（非常非常棒）和演员的表现力都无疑是满满的加分项，有影评说到浮士德的主题：伟大之女性，引导人类上升。影片先是女儿开始反抗上帝的父权，到最后女神拯救全世界，或许是想从女性更具有包容性的爱的角度出发，想表达“因为有了爱，世界更美好”这样的主题吧。 Maybe, god is a girl.\n不过，人类一思考，上帝就发笑这句话完全有道理啊，人类的那些挣扎和困境，都只不过是我们万能的上帝创造出来供他享乐消遣的东西而已。但是影片的讽刺意味也很重，上帝来到人间，却什么也做不了...连回也回不去。所以呢，如果上帝变成凡人，他也不一定比我们普通人过得更好吧。\nBtw 如果可以知道自己的死期感觉也未尝不是件美妙的事 至少可以在有限的时间里抓紧时间趁早去寻找那些内心真正热爱的东西。\n\n个人很喜欢的几段是\n断臂少女的那个手指舞的梦\n第二个在公园的门徒，他疑惑鸟为什么可以自由飞翔却一直只待在这个公园，然后鸟儿对他也有同样的问题，可以看到他的眼神里突然有光。\n杀手爱上断臂少女的时候，头被一圈太阳花所包围，还有他对着镜子和自己说：我不爱她，然后拥抱了自己。（他在贝利叶一家里演聋哑爸爸）\n还有小男孩头上浮现那条鱼骨然后对他唱歌的梦境。\n\n当然，别忘了最后的彩蛋。\n那个一直在推特上“作死”的凯文...哈哈哈哈哈哈', 0, 1651560577840, 6);
INSERT INTO `review` VALUES (11, 1, '成龙的经典', '我很喜欢《奇迹》这部电影。如果要与人分享快乐观看电影，第一部我就会想到它。', '最早看到《奇迹》，是在上中学时在家里的电视机上看到的，连名字都没有看到，就看起来了。就记得情节安排得很紧凑，各种明星晃来晃去，既搞笑又好看。后来再找到了片名是《奇迹》，一直觉得它十分经典。刚才看到豆瓣评论里面，有人说，这也是成龙最得意的一部影片，本人十分赞同。\n\n首先，影片的主题很好。不论是黑社会老大、乡间邻里、政府要人，都愿意帮助玫瑰夫人去完成一个弥天大谎，让有情人终成眷属。记得，在中学提交到语文老师的日记里面，我还引用过这个片子，论证说“世界充满爱”啊。\n\n其次，与周星驰系列无厘头的言语搞笑不同，当年的这个喜剧片还是以故事情节的编排见长的。在歌舞厅里、警察局里、宾馆里面，一个地点不同人物为了不同的目的穿插往来，推动故事情节的发展，给人峰回路转之感。没有《疯狂的石头》那样费脑子，各种喜剧情节就这样迎面而来，让人捧腹不已。\n\n最后，演员的表现也很到位。成龙大哥当年的喜剧武打自然是不必说，梅艳芳的英姿燕舞、午马的无奈叹息、彪叔的高超骗术等等，都增加了更多的喜剧气息。呈现在观众眼前的，不仅仅是一个年轻活力的成龙，还有一群鲜活的银幕形象。感觉这是一部关于人的电影，比现在的充斥着很多电脑特效的影片要好看得多。\n\n每次观看《奇迹》，都会被这个人人好心肠的成人童话而感动，也祝愿一起看过的人从中获得欢乐。', 0, 1651560696462, 11);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职位名',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uni_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (8, '其它');
INSERT INTO `role` VALUES (6, '制片');
INSERT INTO `role` VALUES (4, '剪辑');
INSERT INTO `role` VALUES (12, '动作特技');
INSERT INTO `role` VALUES (14, '动画');
INSERT INTO `role` VALUES (11, '化妆');
INSERT INTO `role` VALUES (2, '导演');
INSERT INTO `role` VALUES (9, '摄影');
INSERT INTO `role` VALUES (10, '服装');
INSERT INTO `role` VALUES (3, '演员');
INSERT INTO `role` VALUES (1, '编剧');
INSERT INTO `role` VALUES (5, '美术');
INSERT INTO `role` VALUES (13, '视觉特效');
INSERT INTO `role` VALUES (7, '音效');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `salt` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '盐',
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `avatar_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '头像路径',
  `profile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '个人简介',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态：0正常，1封禁',
  `created` bigint(20) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `last_login` bigint(20) NOT NULL DEFAULT 0 COMMENT '上次登录时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uni_name`(`username`) USING BTREE,
  UNIQUE INDEX `uni_email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'user1', '636434c6d57d0e3a2328796e8492b12e', 'd007bbbd74ac4a7ba3d2174feb03735a', 'user1@qq.com', '', '9daaddb6-1ba0-489e-8df5-24ab56f7aa70.jpg', 'どれだけ生きれば 癒されるのだろう', 0, 1651551652473, 1651560009562);
INSERT INTO `user` VALUES (2, 'user2', 'c754767067ee2f9f2db0038eabbab673', 'd33c076f2a7d4017aa6e4f759cbd589a', 'user2@qq.com', '', 'default.png', '三十年来她戴着黄金的枷。她用那沉重的枷角劈杀了几个人，没死的也送了半条命。', 0, 1651551998069, 1651554090035);
INSERT INTO `user` VALUES (3, 'user3', '6ce5413603a0545de4a6cb450d007422', 'd2876678d0e64ce39249c941bc0c00e3', 'user3@qq.com', '', 'default.png', '我只希望，读了这么多年书，等时候到了的时候，我能够有向前一步的勇气。', 0, 1651552037897, 1651553805324);
INSERT INTO `user` VALUES (4, 'user4', '3869e6635aed38ce589ef47ff83e5569', '709da9dfd1a742449d05c73e514f4d16', 'user4@qq.com', '', 'default.png', '栾总曾对我说，走出半生，她还是最爱跟我聊天。', 0, 1651552066962, 1651553869350);
INSERT INTO `user` VALUES (5, 'user5', 'd53052a0b1f7d550bd485acdb84e7671', '6474a044113f4516962e65a88b0b9c96', 'user5@qq.com', '', '5f0ed86b-bbb2-4332-a4c4-f05b34014605.jpg', '有朝一日，请想起我。\n快乐是人生唯一的追求。', 0, 1651552101765, 1651553931550);
INSERT INTO `user` VALUES (6, '阿庇尔·狄斯', '48fe98eeb75fddc427d337f12891c4e6', 'f5d04df4a3a3421987779a3e586437c8', 'user6@qq.com', '', 'default.png', '徘徊在2亿6661万3333个冷酷仙境', 0, 1651554032246, 0);
INSERT INTO `user` VALUES (7, '托尼·斯塔克', 'bdaa2fb4e33bdabfc1a54b66e880fe3e', '7bc0c1f465504bbfb637f1360ad2f291', 'user7@qq.com', '', 'default.png', 'I am iron man.', 0, 1651554540866, 0);

-- ----------------------------
-- Table structure for user_movie
-- ----------------------------
DROP TABLE IF EXISTS `user_movie`;
CREATE TABLE `user_movie`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `rate` tinyint(4) NOT NULL DEFAULT 0 COMMENT '个人评分',
  `status` tinyint(4) NOT NULL COMMENT '状态：0想看；1已看；2在看',
  `date` bigint(20) NOT NULL DEFAULT 0 COMMENT '日期，时间戳',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '短评',
  `like_number` int(11) NOT NULL DEFAULT 0 COMMENT '短评点赞量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_movie
-- ----------------------------
INSERT INTO `user_movie` VALUES (1, 1, 2, 8, 1, 1651553519265, '谜语人家里，他把布鲁斯的照片和蝙蝠侠的报纸贴在一起，还写道：我知道你的真面目。 说明他早就怀疑蝙蝠侠是布鲁斯。 于是他做了两件事来验证这一猜想： 1.引导蝙蝠侠去孤儿院，与此同时给布鲁斯寄了炸弹。 包裹上明确写着布鲁斯韦恩亲启，结果是阿福被炸伤了。 谜语人叫蝙蝠侠去孤儿院，导致布鲁斯·韦恩不能亲自拆包裹，说明蝙蝠侠和布鲁斯是同一个人。', 0);
INSERT INTO `user_movie` VALUES (2, 2, 2, 6, 1, 1651553796402, '在我看來很多東西都太表面了，外殼做得不錯但內容還是不夠深。不是讓高譚市一直下雨就叫致敬taxi driver，也不是把復仇、正義跟希望掛在嘴邊就可以了，真正的好電影向來是沒說出口的那些更重要，只做到了black沒做到noir。但貓女感情戲倒是挺感人，尤其結尾那段，徹底get到了蝙蝠俠的孤獨，小派的憂鬱蝙蝠俠還不錯啦，not bad but could be better.', 0);
INSERT INTO `user_movie` VALUES (3, 3, 2, 4, 1, 1651553823534, '3个小时干点啥不好', 0);
INSERT INTO `user_movie` VALUES (4, 4, 2, 4, 1, 1651553895220, '我一定看的是个剧情片。难以想象蝙蝠侠每次出去惩奸除恶还得抓紧画个烟熏妆', 0);
INSERT INTO `user_movie` VALUES (5, 5, 2, 6, 1, 1651553942335, '2022年了，我们仍在看一部黑暗、压抑、阴冷而又冗长的蝙蝠侠电影', 0);
INSERT INTO `user_movie` VALUES (6, 2, 9, 10, 1, 1651559724221, '有钱才能保护喜欢的人', 0);
INSERT INTO `user_movie` VALUES (7, 2, 6, 10, 1, 1651559831729, '仅仅是知道了自己的死期，一切就都不一样了，可见死亡的力量多么强大。或许爱情能够治愈孤独，而死亡可以治愈一切。结尾男性上帝被流放乌兹别克斯坦，女性上帝让天空开满鲜花。隔空呼应了《浮士德》的主题：伟大之女性，引导人类上升。', 0);
INSERT INTO `user_movie` VALUES (8, 1, 14, 8, 1, 1651560058010, '接下来该马崛起了吧，咋改朝换代了还只有被骑的份啊', 0);
INSERT INTO `user_movie` VALUES (9, 1, 15, 10, 2, 1651560178768, '啊 羡慕的不是动画技术 而是动画背后想象力自由释放的味道', 0);
INSERT INTO `user_movie` VALUES (10, 1, 10, 0, 0, 1651560187250, '', 0);
INSERT INTO `user_movie` VALUES (11, 1, 7, 8, 1, 1651560231533, '【成长教育】是那么的浪漫，那么的奇妙有趣，这个故事没有丝毫伤痛，它只是让我们看到了一个小女孩的成长，在课堂之外的地方。四星', 0);
INSERT INTO `user_movie` VALUES (12, 1, 1, 4, 1, 1651560300248, '说真的 看不下去 这到底在讲什么啊 谁来告诉我 它在表达着什么', 0);
INSERT INTO `user_movie` VALUES (13, 1, 3, 10, 1, 1651560364922, 'Love is everything and nothing. It is a secret society and it is common life.', 0);
INSERT INTO `user_movie` VALUES (14, 1, 5, 6, 1, 1651560479529, '语焉不详的另一种末世！', 0);
INSERT INTO `user_movie` VALUES (15, 1, 6, 8, 1, 1651560558699, '上帝全家键盘侠，脑洞还得看妈妈。多梅尔的想象力还在，呈现得却是中规中矩，好在最后几分钟童趣回来了...', 0);
INSERT INTO `user_movie` VALUES (16, 1, 8, 10, 1, 1651560627607, '', 0);
INSERT INTO `user_movie` VALUES (17, 1, 11, 10, 1, 1651560672167, '可能是成龙最好的一部电影。', 0);
INSERT INTO `user_movie` VALUES (18, 1, 13, 0, 1, 1651560767892, '', 0);
INSERT INTO `user_movie` VALUES (19, 1, 17, 0, 1, 1651560773476, '', 0);

-- ----------------------------
-- View structure for movie_rate
-- ----------------------------
DROP VIEW IF EXISTS `movie_rate`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `movie_rate` AS select `user_movie`.`movie_id` AS `movie_id`,avg(`user_movie`.`rate`) AS `avg`,count(`user_movie`.`rate`) AS `count` from `user_movie` where ((`user_movie`.`rate` <> 0) and (`user_movie`.`status` <> 0)) group by `user_movie`.`movie_id` having (`count` >= 5);

-- ----------------------------
-- View structure for review_list_dto
-- ----------------------------
DROP VIEW IF EXISTS `review_list_dto`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `review_list_dto` AS select `r`.`id` AS `id`,`r`.`title` AS `title`,`r`.`description` AS `description`,`u`.`id` AS `user_id`,`u`.`username` AS `author_name`,`m`.`id` AS `movie_id`,`m`.`title` AS `movie_title`,`m`.`poster_path` AS `movie_poster`,`r`.`date` AS `date`,`r`.`like_number` AS `like_number` from ((`review` `r` join `user` `u` on((`u`.`id` = `r`.`user_id`))) join `movie` `m` on((`r`.`movie_id` = `m`.`id`)));

-- ----------------------------
-- Event structure for update_rate_event
-- ----------------------------
DROP EVENT IF EXISTS `update_rate_event`;
delimiter ;;
CREATE EVENT `update_rate_event`
ON SCHEDULE
EVERY '1' DAY STARTS '2022-04-29 15:45:02'
DO update movie,movie_rate 
set movie.rate = movie_rate.avg 
WHERE movie.id = movie_rate.movie_id
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
