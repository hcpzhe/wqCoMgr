/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50508
Source Host           : localhost:3306
Source Database       : wqerp

Target Server Type    : MYSQL
Target Server Version : 50508
File Encoding         : 65001

<<<<<<< HEAD
Date: 2015-02-10 10:44:20
=======
<<<<<<< HEAD
Date: 2015-02-07 17:09:31
=======
Date: 2015-02-04 14:53:01
>>>>>>> 39a32b55aa1bce646f64cd3e774a205cda91af28
>>>>>>> ef0add2d1cd09f4bc251842f1eca6e0044df7d75
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `erp_article`
-- ----------------------------
DROP TABLE IF EXISTS `erp_article`;
CREATE TABLE `erp_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL COMMENT '员工id',
  `class` tinyint(1) NOT NULL DEFAULT '2' COMMENT '1:公司通知 2：文章杂谈',
  `content` text NOT NULL COMMENT '文章内容',
  `time` varchar(32) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '文章状态：为1正常，为0禁用,-1为删除',
  `title` varchar(50) NOT NULL COMMENT '标题',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='文章表';

-- ----------------------------
-- Records of erp_article
-- ----------------------------
INSERT INTO `erp_article` VALUES ('1', '1', '1', '公司自2003年成立以来一直凭着过硬的质量和良好的服务体系为多家大型企业服务，我们现拥有优秀的设计师和裁剪师、先进的生产设备能确保生产和出货时 间，满足您的各种需求。公司坚定不移的奉行\"质量第一、客户至上的经营理念,为您和您的企业制作更多款式新颖、质量优等的服饰。', '1413792785', '1', '企业文化');
INSERT INTO `erp_article` VALUES ('2', '8', '2', '一件好衣服，如果不注意他的放置，不小心生了霉菌就会很恼火，扔了吧，不舍得，好几百块钱呢，可是不扔吧，那些霉菌看着真没法穿，那么现在洛阳工作服订做专家就告诉你一些去除霉菌的小窍门吧！   \r\n    一、皮革衣服上生了霉斑，可先用毛巾蘸些肥皂水、反复擦拭、去掉污垢后，立即用清水擦洗，然后晾干，再涂上一层夹克油。 \r\n    二、呢绒衣服出现了霉点，先把衣服放在阳光下晒几个小时，干燥后，用刷子将霉点轻轻刷掉就行了。如果衣服因油渍、汗渍而引起发霉，可以用软毛刷蘸些汽油在有霉点的地方反复刷洗，然后用干净的毛巾反复擦几遍，放在通风处晾干。 \r\n    三、棉线衣服出现霉斑：用几根绿豆牙，在有霉斑地方反复揉搓，然后用清水漂洗干净，霉点就除掉了。\r\n    四、丝绸衣服上有了霉点，将衣服浸在水中用毛刷刷洗，如果霉点较多、很重，可以在霉点的地方，涂些5％的淡氨水，停3———5分钟，再用清水洗干净。  白色丝绸衣服上出现霉点，用50％的酒精溶液，反复擦洗几遍，会很快除去霉斑。\r\n    五、如果是化纤衣服上生了霉斑，用刷子蘸一些浓肥皂水刷洗，再用温水冲洗一遍，霉斑就可除掉。\r\n    以上内容由洛阳花都服饰提供转载，更多来源： http://lyhdfs.net', '1413792795', '1', 'ffffff');
INSERT INTO `erp_article` VALUES ('3', '7', '2', ' 衣服的码数可以分为：\r\n    女装换算情况如下：\r\nS    160   84A    10    36  \r\nM     165   88A    12    38  \r\nL     170   92A    14    40   \r\nXL    175   96A    16    42\r\nXXL   180   100A   18    44标号\r\n    男装换算情况如下：\r\nXS    160   100A    46  \r\nS     165   105A    48  \r\nM     170   110A    50   \r\nL     175   115A    52   \r\nXL    180   120A    54\r\nXXL   185   125A    56\r\n   女裤腰围的换算情况如下：\r\nXS    150     5    25   适合1尺8腰围\r\nXS    155     6    26   适合1尺9腰围\r\nS     160     7    27   适合2尺腰围\r\nM     165     8    28   适合2尺1腰围  \r\nL     170     9    29   适合2尺2腰围\r\nXL    175     10   30   适合2尺3腰围\r\n    男裤腰围的换算情况如下：\r\nXXS   160     27   适合2尺腰围', '1413792888', '1', 'ddddd');
INSERT INTO `erp_article` VALUES ('4', '4', '2', '对公司企业来说，工作服不仅要代表公司的形象还要适合行业的发展，更重要的是穿着的舒服，方便工作。\r\n    第一：涤卡： 这种面料很有质感，并且强度和耐磨性都很好，缩水率很低，不容易变性，且价格实惠，耐用性能好，适合汽修厂家以及一些普通的工厂，都可以使用。\r\n    第二：纯棉帆布， 这种面料会比较坚牢耐磨，也是普通工厂的首选面料，而且是纯棉的穿着更加舒适。\r\n    第三：防尘防静电面料， 此种面料结实耐磨、柔软舒适、吸湿透气，可加工成各种 高档防静电棉工作服，适用于储运、化工、煤气、石油、煤矿、海运、宇航等带有危险的环境，功能性实用性很强大。\r\n    第四：纯棉沙卡 面料，这种面料是组织织物、纹路清晰是他的优势，并且布面光称、品质良好，很适合订做工作服，订做连体工作服。\r\n    第五：无尘工作服，具有过滤性，舒适性，耐久性，难附着性，易穿性，耐高温，耐清洗性，采用进口优质的导电丝确保产品优良的防静电性能，专用涤纶长丝纤维线缝纫机，独特的缝制工艺和技术，先进的进口清洗设备，10级,100级的洁净室能够为要求最严格的客户提供服务。\r\n    以上信息由洛阳工作服订做专家提供，更多请进：http://lyhdfs.net', '1413792895', '1', '测试');
INSERT INTO `erp_article` VALUES ('5', '8', '2', '<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32pt;\">\r\n	<span style=\"font-size:18px;\">春节即将来临，为切实做好春节期间豫西监狱监管改造秩序的安全稳定，防止在押人员非正常死亡、脱逃、行凶、越狱、暴狱等事故的发生，&nbsp;2月</span><span style=\"font-size:18px;\">8</span><span style=\"font-size:18px;\">日主管我院监所工作的副检察长李淑梅同志带领监所检察科全体干警对豫西监狱进行了一次全方位的安全检查：从在押人员食堂到狱内超市，主要对食品安全进行了检查，在检查过程中，李检对监狱陪同领导一再强调，食品安全一定要重视，食堂一定要保持卫生，超市的食品一定不能有过期的商品；</span>\r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32pt;\">\r\n	<span style=\"font-size:18px;\">从监区、禁闭室到接见室，对其有关情况向陪同监狱领导一一进行询问，同时在接见室查看接见记录，其中，在禁闭室，李检专门询问了在押人员在禁闭期间是否吃的饱，向值班干警指出虽然禁闭是一种惩罚方式，但也一定要保证禁闭人员能够吃得饱，吃的卫生，以防止意外情形的发生；在钢球生产车间，看到个别犯人没带口罩，驻狱检察室主任耿燕玲同志立即向监狱带班干警询问不带口罩的原因，监狱干警进行了解释并保证以后不再有类似情况的出现；</span>\r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32pt;\">\r\n	<span style=\"font-size:18px;\">检查结束后，李检对监狱陪同领导及干警指出“安全重于泰山”，安全无小事，对于安全一定要高度重视，她特别强调医院、食堂、超市、禁闭室等四大容易出现安全隐患的死角，一定要加强安全防范，以确保春节期间监狱的安全稳定。</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span> </span> \r\n</p>', '1413792985', '1', '洛阳市老城区检察院监所检察科对豫西监狱监管进行节前安全大检查');
INSERT INTO `erp_article` VALUES ('6', '2', '1', '	<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32pt;\">\r\n		<span style=\"font-size:18px;\">为确保学习贯彻党的十八大精神活动深入扎实开展，要着重把握好以下主要原则：</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32pt;\">\r\n		<span style=\"font-size:18px;\">一是坚持领导带头、全员参与。从领导干部到普通干警，人人参与活动，人人受到教育，人人得到提高。区院领导干部要带头学习、带头宣讲、带头实践，学深学透，发挥示范作用。</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32pt;\">\r\n		<span style=\"font-size:18px;\">二是坚持全面学习、突出重点。全面学习党的十八大报告和党章，既要从总体上把握主题主线、基本观点和领会精神实质，又要系统地钻研报告提出的一系列新思想、新观点、新论断。要结合检察工作，重点学习进一步加强和改善党对检察工作的领导；着力加强法律监督和自身监督，推进司法权力运行公开化、规范化，全力维护公平正义的司法环境。</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32pt;\">\r\n		<span style=\"font-size:18px;\">三是坚持群众路线、明确标准。把学习贯彻党的十八大精神和落实党的群众路线结合起来，开门搞学习，广泛听取群众对检察工作的意见建议，及时呼应群众对检察工作的新要求新期待，自觉接受群众监督，把群众是否满意作为衡量和检验学习贯彻活动的根本标准，让群众看到学习贯彻活动的实际效果。</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32pt;\">\r\n		<span style=\"font-size:18px;\">四是坚持注重实践、务求实效。始终做到学习党的十八大精神与检察工作实践相统一、主观世界的改造与客观世界的改造相统一，找准党的十八大精神与检察工作的结合点，注重实践特色，不做表面文章，把党的十八大报告中阐述的科学的理论方法、崇高的理想信念、强烈的宗旨意识转化为推进检察工作的强大动力。</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32pt;\">\r\n		<span style=\"font-size:18px;\">三、学习专题</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32pt;\">\r\n		<span style=\"font-size:18px;\">党的十八大精神内容丰富，内涵深刻，具有很强的思想性、理论性。学习贯彻中，要抓住关键、把握重点，明确学习专题，深入钻研思考。</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32pt;\">\r\n		<span style=\"font-size:18px;\">（一）党的十八大重要学习专题。</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32pt;\">\r\n		<span style=\"font-size:18px;\">1、深刻领会和把握党的十八大的主题，坚定不移地高举中国特色社会主义伟大旗帜；</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32pt;\">\r\n		<span style=\"font-size:18px;\">2、深刻领会和把握过去5年和10年党和国家取得新的历史性成就，更加自觉地贯彻党的理论和路线方针政策；</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32pt;\">\r\n		<span style=\"font-size:18px;\">3、深刻领会和把握科学发展观的历史地位和指导意义，深入贯彻落实科学发展观；</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32pt;\">\r\n		<span style=\"font-size:18px;\">4、深刻领会和把握中国特色社会主义的内涵和要求，坚定中国特色社会主义的共同信念；</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32pt;\">\r\n		<span style=\"font-size:18px;\">5、深刻领会和把握全面建成小康社会和全面深化改革目标的新要求，为夺取全面建成小康社会新胜利而奋斗；</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32pt;\">\r\n		<span style=\"font-size:18px;\">6、深刻领会和把握社会主义建设的重大部署，统筹推进社会主义经济、政治、文化、社会、生态文明建设；</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32pt;\">\r\n		<span style=\"font-size:18px;\">7、深刻领会和把握全面提高党的建设科学化水平，使党始终成为中国特色社会主义事业的坚强领导核心。</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32pt;\">\r\n		<span style=\"font-size:18px;\">（二）党的十八大指导检察工作的重要学习专题</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32pt;\">\r\n		<span style=\"font-size:18px;\">1、坚定不移地高举中国特色社会主义伟大旗帜，自觉履行中国特色社会主义事业建设者、捍卫者的职责使命；</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32pt;\">\r\n		<span style=\"font-size:18px;\">2、坚定不移地用科学发展观统领检察工作，推动检察工作科学发展；</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32pt;\">\r\n		<span style=\"font-size:18px;\">3、坚定不移地把检察工作放在全面建设小康社会中来谋划，充分发挥法律监督职能，为到2020年全面建成小康社会提供司法保障，创造良好社会环境；</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32pt;\">\r\n		<span style=\"font-size:18px;\">4、坚定不移地全面实施依法治国基本方略，树立社会主义法治理念，切实做到严格规范公正文明执法；</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32pt;\">\r\n		<span style=\"font-size:18px;\">5、坚定不移地维护最广大人民根本利益，着力解决人民群众最关心的社会治安、权益保障、公平正义等突出问题；</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32pt;\">\r\n		<span style=\"font-size:18px;\">6、坚定不移地加强和创新社会管理，正确处理人民内部矛盾，不断提高社会管理科学化水平；</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32pt;\">\r\n		<span style=\"font-size:18px;\">7、坚定不移地推进改革创新，落实执法司法公开，有效解决人民群众反映强烈的执法司法问题；</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32pt;\">\r\n		<span style=\"font-size:18px;\">8、坚定不移地加强检察队伍建设，加强党对检察工作的领导，努力建设一支学习型、服务性、创新性检察队伍；</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32pt;\">\r\n		<span style=\"font-size:18px;\">9、坚定不移地加强检察机关党风廉政建设，着力纠正检察领域执法不严、不公等问题，最大限度地预防和减少各类违法违纪案件发生。</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32pt;\">\r\n		<span style=\"font-size:18px;\">四、阶段安排</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32pt;\">\r\n		<span style=\"font-size:18px;\">（一）全面学习阶段（2012年11月15日－2013年1月30日）</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32.15pt;\">\r\n		<b><span style=\"font-size:18px;\">1</span></b><b><span style=\"font-size:18px;\">、全面学习党的十八大报告、党章和习近平同志在十八届一中全会上的重要讲话。</span></b><span style=\"font-size:18px;\">院党组和全体检察干警利用每周集中政治学习、“三会一课”、个人自学等时间，对党的十八大报告等文件进行集中通读，原原本本学习党的十八大报告和党章，全面准确地学习领会党的十八大精神。</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32.15pt;\">\r\n		<b><span style=\"font-size:18px;\">2</span></b><b><span style=\"font-size:18px;\">、分专题重点学习。</span></b><span style=\"font-size:18px;\">按照所列的专题内容，紧密结合本部门检察工作和检察队伍建设实际，分专题重点学习领会。</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32.15pt;\">\r\n		<b><span style=\"font-size:18px;\">3</span></b><b><span style=\"font-size:18px;\">、个人深入自学。</span></b><span style=\"font-size:18px;\">把个人自学作为学习党的十八大精神的基础，要求全体检察干警扎扎实实、原汁原味的学习党的十八大报告和相关文件，充分利用报纸、网络等媒体学习党的十八大的相关评论、报道和深入解读。本阶段个人自学时间不少于15小时，并结合个人思想和工作实际，撰写2-3篇有深度、高质量的学习心得。</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32.15pt;\">\r\n		<b><span style=\"font-size:18px;\">4</span></b><b><span style=\"font-size:18px;\">、组织学习交流活动。</span></b><span style=\"font-size:18px;\">以党组、所在科室、党支部等为单位，组织召开学习交流活动，交流学习心得，畅谈学习体会，理清学习思路，深化学习效果，本阶段各单位组织的学习讨论活动不少于两次。</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32.15pt;\">\r\n		<b><span style=\"font-size:18px;\">5</span></b><b><span style=\"font-size:18px;\">、开展专题辅导。</span></b><span style=\"font-size:18px;\">组织学习党的十八大精神专题报告会或专题辅导活动，邀请党的十八大代表、专家学者、上级领导、英模人物、革命前辈等对党的十八大报告和精神进行深度解读，深化全体检察干警的理解认识。</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32.15pt;\">\r\n		<b><span style=\"font-size:18px;\">6</span></b><b><span style=\"font-size:18px;\">、开办学习园地。</span></b><span style=\"font-size:18px;\">在本单位醒目位置开办学习贯彻党的十八大精神专栏，对单位干警的学习体会进行展示。充分利用检察机关门户网站、政务微博、宣传版面、网络论坛等多种媒体宣传本单位学习贯彻党的十八大精神的具体措施和成效。</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32.15pt;\">\r\n		<b><span style=\"font-size:18px;\">7</span></b><b><span style=\"font-size:18px;\">、举办培训班。</span></b><span style=\"font-size:18px;\">充分发挥检察机关教育培训基地的作用，举办学习贯彻党的十八大精神培训班，集中师资力量，精心编排教程。要把学习贯彻党的十八大精神作为检察机关业务培训的必学课程，保证培训效果。</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32pt;\">\r\n		<span style=\"font-size:18px;\">（二）指导谋划工作阶段（2012年12月1日－2012年12月31日）</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32pt;\">\r\n		<span style=\"font-size:18px;\">紧紧围绕党的十八大报告提出的当前形势、基本要求、指导方针、奋斗目标，自觉运用科学发展观统领检察工作，努力把科学发展观贯彻落实到检察工作的各个方面、体现到检察队伍建设的各个环节。结合本单位、本部门工作实际，精心谋划2013年检察业务工作，制定2013年检察工作的目标任务、工作思路、工作措施，把党的十八大精神贯彻于本单位、本部门全年各项业务工作之中。</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32pt;\">\r\n		<span style=\"font-size:18px;\">（三）学习巩固、推进工作阶段（2013年全年）</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32pt;\">\r\n		<span style=\"font-size:18px;\">按照市委的统一部署，继续深入学习贯彻党的十八大精神，深化教育培训，把党的十八大精神转化为推动检察工作和队伍建设的强大动力，推动全市检察工作再上新台阶，取得新成绩。</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32pt;\">\r\n		<span style=\"font-size:18px;\">五、学习方法</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32pt;\">\r\n		<span style=\"font-size:18px;\">在深入开展学习贯彻党的十八大精神活动中，要注重学习方法，做到“五个结合”。</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32pt;\">\r\n		<span style=\"font-size:18px;\">（一）把组织集中学习与个人自学结合起来。以个人自学为基础，以集中学习讨论为抓手，尤其要围绕党的十八大报告中的重要学习专题；围绕指导检察工作的重要论断；加强党对检察工作领导的重要举措；开展社会管理创新、推进社会矛盾化解、公正廉洁执法的任务要求，组织好集中学习讨论。</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32pt;\">\r\n		<span style=\"font-size:18px;\">（二）把全体干警学习和领导带头学习结合起来。要按照人人参与学习，人人受到教育，人人得到提高的要求，迅速把党的十八大精神传达到每一名机关党员干部。要重点抓好机关领导同志的学习，领导干部要以身作则，先学一步，融会贯通。全市两级院主要领导要带头抓好学习贯彻活动，结合本单位工作实际，对单位全体干警进行一次学习党的十八大精神专题辅导。要面向全体干警，以党员干警为骨干，以创建学习型党组织为平台，以入脑入心为要求，不断激发广大干警学习的积极性、主动性。</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32pt;\">\r\n		<span style=\"font-size:18px;\">（三）把学习原文与教育辅导结合起来。在抓好深入学习党的十八大一系列重要文件的同时，要善于借助专门研究机构的力量，邀请党的十八大代表、专家学者、革命前辈、英模代表进行教育辅导，对十八大精神进行深入解读，提升学习水平。</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32pt;\">\r\n		<span style=\"font-size:18px;\">（四）把理论学习和深入调研结合起来。院领导干部要把调查研究贯穿于学习活动的全过程，深入基层、深入群众，围绕影响检察工作的热点、难点问题进行调查研究，以党的十八大精神和科学发展观为指导，及时总结，形成经验，以十八大最新理论成果推动检察工作取得新进展。</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32pt;\">\r\n		<span style=\"font-size:18px;\">（五）把学习贯彻和推进工作结合起来。要深刻学习党的十八大报告对当前和今后一个时期政法工作的形势分析、目标任务和方法措施，与检察业务工作紧密结合，与社会主义法治理念教育、政法干警核心价值观教育活动紧密衔接，努力在推动检察工作和队伍建设上取得新成效，以检察工作和检察队伍建设整体水平的提高来体现学习活动实际效果。</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32pt;\">\r\n		<span style=\"font-size:18px;\">六、活动要求</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32pt;\">\r\n		<span style=\"font-size:18px;\">（一）提高认识，统一思想。开展学习宣传贯彻党的十八大精神活动是当前和今后一个时期区院检察机关的首要政治任务，是践行科学发展观的思想理论准备，是解决执法司法工作中突出问题的重要载体，是建设一支过硬的检察队伍、推动中国特色社会主义检察事业发展进步的客观要求。广大检察干警要进一步把思想认识统一到中央的部署上来，充分认识开展学习贯彻活动的重要意义，切实增强抓好学习贯彻活动的积极性、自觉性、坚定性。</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32pt;\">\r\n		<span style=\"font-size:18px;\">（二）强化领导，抓好落实。区院主要领导要作为此项活动的责任人，结合本单位实际，研究制定具体的实施方案，积极主动、扎扎实实地抓好组织实施。</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32pt;\">\r\n		<span style=\"font-size:18px;\">（三）丰富载体，突出特色。紧紧围绕学习党的十八大精神的时间安排和方法要求，紧密结合政法干警的思想实际，运用集中学习讨论、学习心得评选、制作学习板报、外出参观学习、专题征文、专题辅导教育等行之有效的载体，把学习活动的内容丰富起来，切实增强学习活动的吸引力、感染力、影响力。</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32pt;\">\r\n		<span style=\"font-size:18px;\">（四）抓好宣传，营造氛围。充分利用检察机关的宣传版面、学习园地、横幅标语，大力营造浓厚的学习氛围。充分发挥新闻媒体、网络媒体的作用，广泛宣传报道检察机关深入学习贯彻党的十八大精神的具体措施和取得的扎实效果。大力宣传开展学习贯彻党的十八大活动中涌现出来的先进典型、好的经验做法和取得的成效。</span>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		<br />\r\n	</p>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span> </span> \r\n</p>', '1413792785', '1', '洛阳市老城区人民检察院集中学习宣传贯彻党的十八大精神活动实施');
INSERT INTO `erp_article` VALUES ('7', '6', '2', '<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32.15pt;\">\r\n	<b><span style=\"font-size:18px;\">第十二条</span></b><span style=\"font-size:18px;\"> 各科室建立门户网站信息登记册，及时将发布信息的电子版文稿（含图片、视频）和《网站发文申请表》归档保存，并一式两份，一份报宣教科，一份存档，以备查阅。</span><span></span> \r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32.15pt;\">\r\n	<b><span style=\"font-size:18px;\">第十三条</span></b><span style=\"font-size:18px;\"> 区院信息员每天要定时查看门户网站，掌握舆论动态，关注网友评论。需要网络回复时，及时进行回复。发现重大问题或涉检网络舆情，及时层报相关领导，启动网络舆情应急处置预案。</span><span></span> \r\n</p>\r\n<p class=\"MsoNormal\" align=\"center\" style=\"margin-left:0cm;text-align:center;\">\r\n	<b><span style=\"font-size:18px;\">第五章</span></b><b> </b><b><span style=\"font-size:18px;\">奖惩</span></b> \r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\">\r\n	<b><span style=\"font-size:18px;\">第十四条</span></b><span style=\"font-size:18px;\"> 区院根据门户网站信息发布数量和内容质量对科室信息发布情况进行评比考核并及时通报，考核结果作为年终考评的重要依据。对工作成绩突出的单位和个人将给予表彰。</span><span></span> \r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:33pt;\">\r\n	<b><span style=\"font-size:18px;\">第十五条</span></b><span style=\"font-size:18px;\"> 对网站栏目疏于管理，信息发布不实，信息泄密或重大敏感问题回应不当，造成不良影响的，取消科室年终评先资格，对责任人按照相关规定进行处理。</span><span></span> \r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:272.8pt;\">\r\n	<span style=\"font-size:18px;\">洛阳市老城区人民检察院</span><span></span> \r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:296.8pt;\">\r\n	<span style=\"font-size:18px;\">2012年</span><span style=\"font-size:18px;\">12</span><span style=\"font-size:18px;\">月</span><span style=\"font-size:18px;\">17</span><span style=\"font-size:18px;\">日</span><span></span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span> </span> \r\n</p>', '1413792995', '1', '洛阳市老城区人民检察院互联网门户网站管理实施细则');
INSERT INTO `erp_article` VALUES ('8', '2', '2', '<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:24pt;\">\r\n	<span style=\"font-size:18px;\">政法干警核心价值观教育实践活动开展以来，在上级党委、市院的安排部署下，在新任检察长宋涛同志的带领下，老城区检察院按照“落实责任，实干争先”的工作思路，立足“小处着手、实处着手，不求标新立异、只把虚工实做”，把教育实践活动作为全心全意为人民服务宗旨在检察工作中的生动实践来抓，及时动员部署，制定方案，坚持走“突出特色、注重实效、统筹推进”之路，取得了阶段性成效。近三年来，我院先后荣获\r\n“全省先进基层党组织”、“全省人民满意的政法单位”、“洛阳市志愿服务工作先进单位”、洛阳市政法系统“结对帮扶工作先进单位”等称号，以实际行动较好的践行了政法干警核心价值观。我们的主要做法是：</span>\r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:24.1pt;\">\r\n	<b><span style=\"font-size:18px;\">一、突出榜样示范特色，让干警在学习先进典型中强化对核心价值观的思想认同。</span></b> \r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:24pt;\">\r\n	<span style=\"font-size:18px;\">思想是行动的先导。我们在开展核心价值观教育实践活动中，注意发掘身边人身边事，树立身边典型，重点宣传“中原卫士”、“省维护妇女儿童合法权益先进个人”\r\n、践行政法干警核心价值观楷模、我院侦查监督科科长全市检察机关践行政法干警核心价值观“十大标兵”梁香敏同志的先进事迹，为广大干警树立标杆，更有效地引导干警在人生观、价值观层面增强对政法核心价值的思想认同，有力提升了教育实效。一是拨亮先进典型的闪光点，发挥榜样的引导作用。组织干警学习典型，注重从理性层面引导干警深入挖掘和提炼先进典型思想深处的闪光点，通过运用内部网络、宣传板报、简报、电子屏等各种宣传方式，让我院干警在理性思考中明白，梁香敏同志身上所体现的精神中，最核心、最闪耀的就是牺牲奉献精神，这种精神切合了“忠诚、为民、公正、廉洁”政法干警核心价值观的特性。选择了检察官这个职业就是选择了牺牲奉献，提高了干警对职能使命和自身价值的思想认识，提升了爱岗敬业、尽职尽责、自觉奉献、勇于牺牲的思想境界。二是挖掘先进典型的社会价值，发挥榜样的教育作用。我们通过梁香敏同志鲜活感人的事例和言传身教，使观念成为习惯、规范变为行动，在学用统一、知行合一、教育与实践相结合的过程中挖掘出其蕴含的社会价值，发挥好其教育人鞭策人鼓舞人激励人的作用。在这种操作性很强的教育示范作用中，核心价值观成为一种看得见摸得着的事物，为广大干警所感知、所认同、所接受。三是揭示先进典型的人格力量，发挥榜样的激励作用。积极的人生态度有助于干警自觉树立政法核心价值观。我们在活动开展过程中，大力宣扬雷锋、白洁、梁香敏等先进典型积极进取、乐观有为的人生态度，引导干警面对基层检察机关的繁重任务和严峻挑战，将核心价值观转化为执法办案的行为习惯，通过实际行动树立和维护人民检察院公正司法、廉洁司法、为民司法的良好形象。</span>\r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:24.1pt;\">\r\n	<b><span style=\"font-size:18px;\">二、注重精神启迪作用，让干警在学习先进典型中强化对核心价值观的理论认同</span></b> \r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:24pt;\">\r\n	<span style=\"font-size:18px;\">理论只有说服人，才能掌握群众。我们注重揭示先进典型对核心价值观真学、真信和真用的坚定性，在宣传先进人物的过程中，营造一种学先进、赶先进的浓厚氛围，充分利用精神启迪作用，帮助干警从理论上认同核心价值观的根本要求。一是老戏台，唱新歌。我们充分利用现有资源，着力打造以党建教育为核心，以政策理论学习为内容，以传统文化为特色的教育活动中心。把市院开展的“两个经常性”工作和主题教育实践活动结合起来，利用周五学习日制度，在全院开展“干警大讲堂”、“河洛文化道德大讲堂”活动，组织干警讲身边事、讲身边人，比照先进找差距，营造浓郁的学习氛围。二是新瓶子，装旧酒。我院针对以往活动开展中，由于形式单一、内容单调、生动性不强，存在检察人员疲于参与的问题，及时转变观念，积极丰富活动载体，把专题辅导与座谈讨论结合起来，组织干警交流学习感悟和心得体会；把理论授课与业务学习结合起来，启迪干警在工作中思索核心价值观的实际意义；把先进人物宣讲与业务竞赛结合起来，引领干警将榜样带来的激励发挥到本职工作中去。三是改旧衣换新装。把开大会变为搞活动，把念文件变为作实践，把读报纸变为作交流，组织先进人物进行事迹报告、组织青年干警结合工作谈领悟、组织人员结合活动做宣传。精心组织开展“文明道德大讲堂”活动，先后邀请市、区道德楷模讲课</span><span style=\"font-size:18px;\">9</span><span style=\"font-size:18px;\">次，做到内容生动化、载体丰富化、形式多样化，干警的参与积极性和教育成效均有了明显提高。</span>\r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:24.1pt;\">\r\n	<b><span style=\"font-size:18px;\">三、树立理念领航坐标，让干警在学习典型中强化对核心价值观的实践认同。</span></b> \r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:24pt;\">\r\n	<span style=\"font-size:18px;\">实践是检验真理的唯一标准。先进典型的根本特征是立足本职岗位创一流、争先进。我们引导干警围绕我院“落实责任、实干争先”的工作思路，努力践行核心价值观，将一项项口头承诺、书面行动，外化为了一份份沉甸甸的责任、一个个强有力的行动。一是请进来、真情换实意。以梁香敏同志先进事迹为动力，按照核心价值观的要求，从增强群众感情入手，凡是群众来访，一律坚持“来访必接、不推脱，有问必答、不敷衍，有求必应、不懈怠”的原则，让群众清清楚楚知缘由，明明白白走出去，近三年，给付群众困难补助金</span><span style=\"font-size:18px;\">68</span><span style=\"font-size:18px;\">万元，先后化解积案</span><span style=\"font-size:18px;\">7</span><span style=\"font-size:18px;\">件，化解率达到了</span><span style=\"font-size:18px;\">100%</span><span style=\"font-size:18px;\">。在</span><span style=\"font-size:18px;\">2010</span><span style=\"font-size:18px;\">年第四季度和</span><span style=\"font-size:18px;\">2011</span><span style=\"font-size:18px;\">年第三季度，全市公众安全感指标和政法机关执法满意率考评排名中我院名列第一名。二是走出去、人心换人心。我院以核心价值观教育活动为载体，把政法干警核心价值观教育实践活动的课堂放在社区、群众家中。组织干警到帮扶村镇、社区开展“开门评警”“走访困难户、关爱空巢老人”活动，通过“走亲戚、认亲家”，先后组织干警</span><span style=\"font-size:18px;\">100</span><span style=\"font-size:18px;\">余人次到辖区各单位走访人大代表、政协要员、人民群众，让干警了解民情听民意，老百姓的艰辛和淳朴给大家上了一堂生动的核心价值观教育课，让同志们切身体会到了“深入群众鱼得水、脱离群众树断根”的深刻内涵。三是献爱心、真诚为公益。引导干警学习梁香敏同志传承爱心、关心他人、回馈社会的工作理念，组织干警积极参与为灾区、困难人群捐款捐物活动、“我为花会添光彩”志愿服务活动、“万名志愿者助交通”服务活动等社会公益活动，让干警在服务社会中增强为民意识、在回馈社会中累积为民情怀，让核心价值观外践于行、内化于心，为检察干警与百姓之间架起了一座“连心桥”。我院志愿服务队在老城区青年宫广场开展的“学习雷锋志愿服务”活动</span><span style=\"font-size:18px;\">，被洛阳电视台进行了专题报道，并得到辖区群众的称赞。</span>\r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:24pt;\">\r\n	<span style=\"font-size:18px;\">典型引航方向，榜样传递力量。我们将深入持久地开展学习雷锋、学习白洁等先进典型活动，更多的树立像梁香敏同志这样的身边榜样，引导干警像先进典型一样坚持信仰，坚定信念，躬身实践，牢固树立和自觉践行“忠诚、为民、公正、廉洁”政法核心价值观，进一步坚守忠诚的政治本色、树牢为民的宗旨理念、坚定公正的价值追求、严守廉洁的基本操守，为党的“十八”大胜利召开，为洛阳经济社会发展做出新的更大贡献。</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span> </span> \r\n</p>', '1413792785', '1', '以榜样的力量践行政法干警核心价值');
INSERT INTO `erp_article` VALUES ('9', '1', '2', '<span style=\"font-size:18px;\"> （三）社会宣传</span><br />\r\n<span style=\"font-size:18px;\"> 1、在辖区主要街道、社区、乡镇机关、学校、厂矿所在地，利用标语横幅、宣传资料、宣传挂图、宣传展板、电子显示屏、普法讲座、现场法律咨询等形式进行街头宣传，配合执法大走访“四项制度”的贯彻落实，适时进行宣传报道。</span><br />\r\n<span style=\"font-size:18px;\"> 2、认真配合“检察开放日”活动，邀请社会各界人士和媒体记者参加，向社会展现检察机关良好形象；适时召开媒体恳谈会，积极配合人大代表座谈会等活动对检察机关进行宣传。</span><br />\r\n<span style=\"font-size:18px;\"> 五、宣传步骤</span><br />\r\n<span style=\"font-size:18px;\"> 第一阶段（12月10日-12月16日）：</span><br />\r\n<span style=\"font-size:18px;\"> 1、各部门严格按照方案要求，结合本部门实际，及时制定本部门活动方案，加强沟通协调，作出安排部署。</span><br />\r\n<span style=\"font-size:18px;\"> 2、各部门要深入挖掘线索、广泛收集材料、及时提供新闻线索和文字图片、视频资料等宣传素材。</span><br />\r\n<span style=\"font-size:18px;\"> 3、紧扣宣传重点，对新闻线索和宣传素材进行整理归类，筛选有价值的线索，组织人员重点挖掘。</span><br />\r\n<span style=\"font-size:18px;\"> 第二阶段（2012年12月17日-2013年1月20日）：</span><br />\r\n<span style=\"font-size:18px;\"> 1、集中宣传，展示成果</span><br />\r\n<span style=\"font-size:18px;\"> 对各部门上报的宣传素材进行整理归纳，集中宣传，认真配合省院做好“走基层、学先进、促工作、树形象”集中宣传活动，努力提高检察机关宣传信息在平面类专栏、电视类专题、广播类访谈节目中的刊播频率。区院门户网站、微博等自有媒体要全力配合平面、电视广播类媒体和网络媒体的宣传进度。</span><br />\r\n<span style=\"font-size:18px;\"> 2、电影《火红的杜鹃花》展映</span><br />\r\n<span style=\"font-size:18px;\"> 按照省院统一部署，12月16日至23日，电影《火红的杜鹃花》将在洛阳集中展映。以此为契机，印制洛阳检察机关宣传册和程建宇同志事迹简介，配合电影的放映向社会公众发放，进一步提升检察机关形象。</span><br />\r\n<span style=\"font-size:18px;\"> 3、微博上线集中宣传</span><br />\r\n<span style=\"font-size:18px;\"> 按市院要求，在前期各项筹备工作到位的基础上，我院政务微博计划于12月中旬，在腾讯网和新浪网同步上线。借微博上线之机，协调腾讯网、新浪网及其他各大网站进行集中宣传，联系“云南检察”、“湖北检察”、“精彩洛阳”、“平安洛阳”等知名微博协助进行集中转播宣传，各部门内勤和区院网络评论员都要开通个人微博，收听并转发市院“洛阳检察”微博相关内容，提升市院政务微博的影响力。</span><br />\r\n<span style=\"font-size:18px;\"> 4、“检察开放日”集中宣传</span><br />\r\n<span style=\"font-size:18px;\"> 按照市院部署，认真配合开展“检察开放日”活动，一是邀请媒体记者参加活动，协调媒体积极发稿；二是在区院门户网站和政务微博上对活动进行图片直播，进一步提升宣传效果。</span><br />\r\n<span style=\"font-size:18px;\"> 5、社会宣传</span><br />\r\n<span style=\"font-size:18px;\"> 积极组织人员，主动走上街头，深入社区、学校、厂矿有针对性的开展成果展示、普法讲座等社会宣传活动，着力提升检察机关整体形象。集中宣传活动不得少于3次；认真配合相关部门落实执法大走访“四项制度”，进一步贴近群众。</span><br />\r\n<span style=\"font-size:18px;\"> 第三阶段（2013年1月21日-2013年2月20日）:</span><br />\r\n<span style=\"font-size:18px;\"> 邀请媒体记者参加媒体恳谈会，通报近年来检察机关工作成果，听取新闻单位对检察宣传工作的意见和建议，争取各新闻单位对检察工作的理解和支持。</span><br />\r\n<span style=\"font-size:18px;\"> 六、工作要求</span><br />\r\n<span style=\"font-size:18px;\"> （一）高度重视，加强领导。各部门要明确责任领导负责此项工作，并指定联络人员与活动领导小组办公室积极沟通，保持联系。结合本部门实际，制定工作方案，成立活动领导机构，加强督查指导，确保集中宣传活动取得扎实成效。</span><br />\r\n<span style=\"font-size:18px;\"> （二）认真策划，切实保证宣传效果。各部门确保将工作亮点、工作特色及模范人物充分发掘并予以展现，要及时将活动开展情况、重要新闻线索和宣传素材报送活动领导小组办公室。区院根据提供的宣传报道线索，确定宣传报道重点，适时组织省、市相关媒体进行集中采访和深度报道。</span><br />\r\n<span style=\"font-size:18px;\"> （三）各部门务必于12月14日前将此次活动的部门责任领导和联络员名单报送政治处，同时上报本部门的活动方案；于12月17日前将新闻线索和宣传素材报送政治处。</span><br />\r\n<span style=\"font-size:18px;\"> 洛阳市老城区人民检察院</span><br />\r\n<span style=\"font-size:18px;\"> 2012年12月10日</span><br />\r\n<br />\r\n<br />\r\n<!--[if !supportLineBreakNewLine]--><br />\r\n<!--[endif]-->\r\n</p>', '0', '-1', '洛阳市老城区人民检察院贯彻落实十八大精神宣传活动方案');
INSERT INTO `erp_article` VALUES ('10', '1', '1', '<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:27.75pt;\">\r\n	<span style=\"font-size:18px;\">（一）侦查方式要与时俱进，侦查谋略要有所加强</span>\r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:27.75pt;\">\r\n	<span style=\"font-size:18px;\">在“侦查技能竞赛”活动中，我局办案要注重案件的侦查工作，注意运用多种类型的侦查手段，降低查处案件的风险度。在讯问过程中，注意讯问技巧，讯问方式，在讯问前要制定好详细完善的讯问预案。在办案过程中要充分运用信息技术手段，加大办案的技术含量，提高办案效率。通过办理案件，来强化业务能力、提高审讯技能，积累工作经验。</span>\r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:27.75pt;\">\r\n	<span style=\"font-size:18px;\">（二）注重办案质量，突出办案重点</span>\r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:28pt;\">\r\n	<span style=\"font-size:18px;\">在办理案件过程中，要依《河南省检察机关反贪部门办案工作考评办法》为指导，既要注重办案数量，更要注重办案质量，提高大要案比例，加快诉讼进程，提高判决率。</span>\r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:28pt;\">\r\n	<span style=\"font-size:18px;\">在完成“侦查技能竞赛”任务的过程中，要紧紧围绕市院办案要突出重点这一要求。集中查办一批涉及社会主义新农村建设、涉及工商领域的贪污贿赂犯罪案件。真正发挥反贪部门在维护保障民生、服务社会建设、构建和谐社会中的职能作用，树立检察机关的良好形象。</span>\r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:28pt;\">\r\n	<span style=\"font-size:18px;\">（三）坚持“三位一体”办案机制，注重办案效果</span>\r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:28pt;\">\r\n	<span style=\"font-size:18px;\">一是自觉服务经济社会发展，保障诉讼参与人合法权益，认真接受社会监督，实现查办职务犯罪工作的服务化、透明化、人性化。二是要不断改进办案的方式方法，依法办案，文明办案，在严惩贪污贿赂犯罪的同时，有效化社会矛盾，维护社会秩序。三是认真贯彻宽严相济的刑事政策，既要严格执法，又要宽严适度，化解社会矛盾，促进社会和谐。</span>\r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:28pt;\">\r\n	<span style=\"font-size:18px;\">（四）严格遵循规章制度，确保办案安全</span>\r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:28pt;\">\r\n	<span style=\"font-size:18px;\">在完成“侦查技能竞赛”的同时，要严格遵守市院各项规章制度，坚持线索报备制度，继续实行立案评估审查制度，在大力推进案件数量的同时，保证案件质量，注重办案效果。紧抓办案安全，牢记种检所提出的“</span><span style=\"font-size:18px;\">100</span><span style=\"font-size:18px;\">－</span><span style=\"font-size:18px;\">1</span><span style=\"font-size:18px;\">＝</span><span style=\"font-size:18px;\">0</span><span style=\"font-size:18px;\">”的办案安全思想。坚持一手抓办案，一手抓安全，确保不发生任何安全问题。</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span> </span> \r\n</p>', '0', '1', '老城区检察院反贪局关于开展“侦查技能竞赛”活动实施方案');
INSERT INTO `erp_article` VALUES ('11', '1', '1', '<p class=\"MsoNormal\" align=\"left\">\r\n	<span style=\"font-size:18px;\">三、下步工作打算</span>\r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32pt;\">\r\n	<span style=\"font-size:18px;\">一是认真开展讨论活动，结合本单位实际，将职业道德准则加以细化，力求突出检察工作特点、贴近检察人员的思想和工作实际，做到什么问题突出，就重点讨论解决什么问题。要组织开展法治热点问题讨论。要通过走近群众，广泛征求群众意见和建议，认真梳理出若干个群众反映强烈的热点问题，组织干警深入讨论，提高思想认识。特别是要有针对性地进一步清理个别干警存在的错误思想，澄清模糊认识。要组织检察人员在深入研讨的基础上撰写学习体会或理论研讨文章，要广泛开展以案析理、网上论坛、警示教育、座谈交流等活动，把学习实践检察官职业道德准则活动不断引向深入，做到入脑入心，熟练掌握检察职业道德各项基本要求，将职业道德的要求习惯化，贯穿于检察工作的方方面面。</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span> </span> \r\n</p>', '0', '1', '老城区人民检察院开展学习实践检察官职业道德准则活动情况报告');
INSERT INTO `erp_article` VALUES ('12', '1', '1', '&lt;p style=&quot;text-align:center;text-indent:2em;&quot;&gt;\r\n	&lt;strong&gt;测试文章编辑器的使用&lt;/strong&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-indent:2em;&quot;&gt;\r\n	测试文章编辑器的使用&lt;span&gt;测试文章编辑器的使用&lt;span&gt;测试文章编辑器的使用&lt;span&gt;测试文章编辑器的使用&lt;span&gt;测试文章编辑器的使用&lt;span&gt;测试文章编辑器的使用&lt;span&gt;测试文章编辑器的使用&lt;span&gt;测试文章编辑器的使用&lt;span&gt;测试文章编辑器的使用&lt;span&gt;测试文章编辑器的使用。&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;\r\n&lt;/p&gt;', '1413854358', '1', '测试文章发布');
INSERT INTO `erp_article` VALUES ('13', '11', '2', '<p style=\"text-align:center;text-indent:2em;\"><strong><span style=\"font-family:KaiTi_GB2312;\">测试文章编辑器的使用</span></strong>\r\n</p>\r\n<p style=\"text-indent:2em;\">\r\n<span style=\"font-family:KaiTi_GB2312;\">测试文章编辑器的使用</span><span><span style=\"font-family:KaiTi_GB2312;\">测试文章编辑器的使用</span><span><span style=\"font-family:KaiTi_GB2312;\">测试文章编辑器的使用</span><span><span style=\"font-family:KaiTi_GB2312;\">测试文章编辑器的使用</span><span><span style=\"font-family:KaiTi_GB2312;\">测试文章编辑器的使用</span><span><span style=\"font-family:KaiTi_GB2312;\">测试文章编辑器的使用</span><span><span style=\"font-family:KaiTi_GB2312;\">测试文章编辑器的使用</span><span><span style=\"font-family:KaiTi_GB2312;\">测试文章编辑器的使用</span><span><span style=\"font-family:KaiTi_GB2312;\">测试文章编辑器的使用</span><span style=\"font-family:KaiTi_GB2312;\">测试文章编辑器的使用。</span></span></span></span></span></span></span></span></span>\r\n</p>', '1413854940', '1', '测试文章编辑器的使用');
INSERT INTO `erp_article` VALUES ('14', '9', '2', '&lt;p&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;ol&gt;\r\n	&lt;li&gt;\r\n		&lt;span style=&quot;font-family:KaiTi_GB2312;line-height:1.5;&quot;&gt;&lt;/span&gt;&lt;span style=&quot;font-family:KaiTi_GB2312;line-height:1.5;&quot;&gt;测试&lt;/span&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		&lt;span style=&quot;font-family:KaiTi_GB2312;line-height:1.5;&quot;&gt;测试&lt;/span&gt;\r\n	&lt;/li&gt;\r\n&lt;/ol&gt;\r\n&lt;p&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;', '1413857049', '0', '测试文章编辑器的使用');
INSERT INTO `erp_article` VALUES ('15', '11', '2', '&lt;ol&gt;\r\n	&lt;li&gt;\r\n		&lt;span style=&quot;font-family:KaiTi_GB2312;&quot;&gt;测试&lt;/span&gt; \r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		&lt;span style=&quot;font-family:KaiTi_GB2312;&quot;&gt;测试&lt;/span&gt; \r\n	&lt;/li&gt;\r\n&lt;/ol&gt;', '1413857267', '1', '测试');
INSERT INTO `erp_article` VALUES ('16', '7', '2', '&lt;div style=&quot;text-align:center;&quot;&gt;\r\n	&lt;span style=&quot;line-height:1.5;&quot;&gt;&lt;strong&gt;成功案例&lt;/strong&gt;&lt;/span&gt;\r\n&lt;/div&gt;', '1413857502', '1', '成功案例');
INSERT INTO `erp_article` VALUES ('17', '4', '2', '<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32pt;\">\r\n	<span style=\"font-size:18px;\">春节即将来临，为切实做好春节期间豫西监狱监管改造秩序的安全稳定，防止在押人员非正常死亡、脱逃、行凶、越狱、暴狱等事故的发生，&nbsp;2月</span><span style=\"font-size:18px;\">8</span><span style=\"font-size:18px;\">日主管我院监所工作的副检察长李淑梅同志带领监所检察科全体干警对豫西监狱进行了一次全方位的安全检查：从在押人员食堂到狱内超市，主要对食品安全进行了检查，在检查过程中，李检对监狱陪同领导一再强调，食品安全一定要重视，食堂一定要保持卫生，超市的食品一定不能有过期的商品；</span>\r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32pt;\">\r\n	<span style=\"font-size:18px;\">从监区、禁闭室到接见室，对其有关情况向陪同监狱领导一一进行询问，同时在接见室查看接见记录，其中，在禁闭室，李检专门询问了在押人员在禁闭期间是否吃的饱，向值班干警指出虽然禁闭是一种惩罚方式，但也一定要保证禁闭人员能够吃得饱，吃的卫生，以防止意外情形的发生；在钢球生产车间，看到个别犯人没带口罩，驻狱检察室主任耿燕玲同志立即向监狱带班干警询问不带口罩的原因，监狱干警进行了解释并保证以后不再有类似情况的出现；</span>\r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:32pt;\">\r\n	<span style=\"font-size:18px;\">检查结束后，李检对监狱陪同领导及干警指出“安全重于泰山”，安全无小事，对于安全一定要高度重视，她特别强调医院、食堂、超市、禁闭室等四大容易出现安全隐患的死角，一定要加强安全防范，以确保春节期间监狱的安全稳定。</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span> </span> \r\n</p>', '1413858958', '1', '洛阳市老城区人民检察院互联网门户网站管理实施细则');
INSERT INTO `erp_article` VALUES ('18', '4', '2', '<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:24pt;\">\r\n	<span style=\"font-size:18px;\">政法干警核心价值观教育实践活动开展以来，在上级党委、市院的安排部署下，在新任检察长宋涛同志的带领下，老城区检察院按照“落实责任，实干争先”的工作思路，立足“小处着手、实处着手，不求标新立异、只把虚工实做”，把教育实践活动作为全心全意为人民服务宗旨在检察工作中的生动实践来抓，及时动员部署，制定方案，坚持走“突出特色、注重实效、统筹推进”之路，取得了阶段性成效。近三年来，我院先后荣获\r\n“全省先进基层党组织”、“全省人民满意的政法单位”、“洛阳市志愿服务工作先进单位”、洛阳市政法系统“结对帮扶工作先进单位”等称号，以实际行动较好的践行了政法干警核心价值观。我们的主要做法是：</span>\r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:24.1pt;\">\r\n	<b><span style=\"font-size:18px;\">一、突出榜样示范特色，让干警在学习先进典型中强化对核心价值观的思想认同。</span></b> \r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:24pt;\">\r\n	<span style=\"font-size:18px;\">思想是行动的先导。我们在开展核心价值观教育实践活动中，注意发掘身边人身边事，树立身边典型，重点宣传“中原卫士”、“省维护妇女儿童合法权益先进个人”\r\n、践行政法干警核心价值观楷模、我院侦查监督科科长全市检察机关践行政法干警核心价值观“十大标兵”梁香敏同志的先进事迹，为广大干警树立标杆，更有效地引导干警在人生观、价值观层面增强对政法核心价值的思想认同，有力提升了教育实效。一是拨亮先进典型的闪光点，发挥榜样的引导作用。组织干警学习典型，注重从理性层面引导干警深入挖掘和提炼先进典型思想深处的闪光点，通过运用内部网络、宣传板报、简报、电子屏等各种宣传方式，让我院干警在理性思考中明白，梁香敏同志身上所体现的精神中，最核心、最闪耀的就是牺牲奉献精神，这种精神切合了“忠诚、为民、公正、廉洁”政法干警核心价值观的特性。选择了检察官这个职业就是选择了牺牲奉献，提高了干警对职能使命和自身价值的思想认识，提升了爱岗敬业、尽职尽责、自觉奉献、勇于牺牲的思想境界。二是挖掘先进典型的社会价值，发挥榜样的教育作用。我们通过梁香敏同志鲜活感人的事例和言传身教，使观念成为习惯、规范变为行动，在学用统一、知行合一、教育与实践相结合的过程中挖掘出其蕴含的社会价值，发挥好其教育人鞭策人鼓舞人激励人的作用。在这种操作性很强的教育示范作用中，核心价值观成为一种看得见摸得着的事物，为广大干警所感知、所认同、所接受。三是揭示先进典型的人格力量，发挥榜样的激励作用。积极的人生态度有助于干警自觉树立政法核心价值观。我们在活动开展过程中，大力宣扬雷锋、白洁、梁香敏等先进典型积极进取、乐观有为的人生态度，引导干警面对基层检察机关的繁重任务和严峻挑战，将核心价值观转化为执法办案的行为习惯，通过实际行动树立和维护人民检察院公正司法、廉洁司法、为民司法的良好形象。</span>\r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:24.1pt;\">\r\n	<b><span style=\"font-size:18px;\">二、注重精神启迪作用，让干警在学习先进典型中强化对核心价值观的理论认同</span></b> \r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:24pt;\">\r\n	<span style=\"font-size:18px;\">理论只有说服人，才能掌握群众。我们注重揭示先进典型对核心价值观真学、真信和真用的坚定性，在宣传先进人物的过程中，营造一种学先进、赶先进的浓厚氛围，充分利用精神启迪作用，帮助干警从理论上认同核心价值观的根本要求。一是老戏台，唱新歌。我们充分利用现有资源，着力打造以党建教育为核心，以政策理论学习为内容，以传统文化为特色的教育活动中心。把市院开展的“两个经常性”工作和主题教育实践活动结合起来，利用周五学习日制度，在全院开展“干警大讲堂”、“河洛文化道德大讲堂”活动，组织干警讲身边事、讲身边人，比照先进找差距，营造浓郁的学习氛围。二是新瓶子，装旧酒。我院针对以往活动开展中，由于形式单一、内容单调、生动性不强，存在检察人员疲于参与的问题，及时转变观念，积极丰富活动载体，把专题辅导与座谈讨论结合起来，组织干警交流学习感悟和心得体会；把理论授课与业务学习结合起来，启迪干警在工作中思索核心价值观的实际意义；把先进人物宣讲与业务竞赛结合起来，引领干警将榜样带来的激励发挥到本职工作中去。三是改旧衣换新装。把开大会变为搞活动，把念文件变为作实践，把读报纸变为作交流，组织先进人物进行事迹报告、组织青年干警结合工作谈领悟、组织人员结合活动做宣传。精心组织开展“文明道德大讲堂”活动，先后邀请市、区道德楷模讲课</span><span style=\"font-size:18px;\">9</span><span style=\"font-size:18px;\">次，做到内容生动化、载体丰富化、形式多样化，干警的参与积极性和教育成效均有了明显提高。</span>\r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:24.1pt;\">\r\n	<b><span style=\"font-size:18px;\">三、树立理念领航坐标，让干警在学习典型中强化对核心价值观的实践认同。</span></b> \r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:24pt;\">\r\n	<span style=\"font-size:18px;\">实践是检验真理的唯一标准。先进典型的根本特征是立足本职岗位创一流、争先进。我们引导干警围绕我院“落实责任、实干争先”的工作思路，努力践行核心价值观，将一项项口头承诺、书面行动，外化为了一份份沉甸甸的责任、一个个强有力的行动。一是请进来、真情换实意。以梁香敏同志先进事迹为动力，按照核心价值观的要求，从增强群众感情入手，凡是群众来访，一律坚持“来访必接、不推脱，有问必答、不敷衍，有求必应、不懈怠”的原则，让群众清清楚楚知缘由，明明白白走出去，近三年，给付群众困难补助金</span><span style=\"font-size:18px;\">68</span><span style=\"font-size:18px;\">万元，先后化解积案</span><span style=\"font-size:18px;\">7</span><span style=\"font-size:18px;\">件，化解率达到了</span><span style=\"font-size:18px;\">100%</span><span style=\"font-size:18px;\">。在</span><span style=\"font-size:18px;\">2010</span><span style=\"font-size:18px;\">年第四季度和</span><span style=\"font-size:18px;\">2011</span><span style=\"font-size:18px;\">年第三季度，全市公众安全感指标和政法机关执法满意率考评排名中我院名列第一名。二是走出去、人心换人心。我院以核心价值观教育活动为载体，把政法干警核心价值观教育实践活动的课堂放在社区、群众家中。组织干警到帮扶村镇、社区开展“开门评警”“走访困难户、关爱空巢老人”活动，通过“走亲戚、认亲家”，先后组织干警</span><span style=\"font-size:18px;\">100</span><span style=\"font-size:18px;\">余人次到辖区各单位走访人大代表、政协要员、人民群众，让干警了解民情听民意，老百姓的艰辛和淳朴给大家上了一堂生动的核心价值观教育课，让同志们切身体会到了“深入群众鱼得水、脱离群众树断根”的深刻内涵。三是献爱心、真诚为公益。引导干警学习梁香敏同志传承爱心、关心他人、回馈社会的工作理念，组织干警积极参与为灾区、困难人群捐款捐物活动、“我为花会添光彩”志愿服务活动、“万名志愿者助交通”服务活动等社会公益活动，让干警在服务社会中增强为民意识、在回馈社会中累积为民情怀，让核心价值观外践于行、内化于心，为检察干警与百姓之间架起了一座“连心桥”。我院志愿服务队在老城区青年宫广场开展的“学习雷锋志愿服务”活动</span><span style=\"font-size:18px;\">，被洛阳电视台进行了专题报道，并得到辖区群众的称赞。</span>\r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:24pt;\">\r\n	<span style=\"font-size:18px;\">典型引航方向，榜样传递力量。我们将深入持久地开展学习雷锋、学习白洁等先进典型活动，更多的树立像梁香敏同志这样的身边榜样，引导干警像先进典型一样坚持信仰，坚定信念，躬身实践，牢固树立和自觉践行“忠诚、为民、公正、廉洁”政法核心价值观，进一步坚守忠诚的政治本色、树牢为民的宗旨理念、坚定公正的价值追求、严守廉洁的基本操守，为党的“十八”大胜利召开，为洛阳经济社会发展做出新的更大贡献。</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span> </span> \r\n</p>', '1413859020', '1', '洛阳市老城区人民检察院贯彻落实十八大精神宣传活动方案');
INSERT INTO `erp_article` VALUES ('19', '7', '2', '&lt;h4 style=&quot;text-indent:2em;&quot;&gt;\r\n	&lt;span style=&quot;line-height:1.5;font-family:KaiTi_GB2312;&quot;&gt;测试文章编辑器的使用&lt;/span&gt;&lt;span style=&quot;font-family:KaiTi_GB2312;line-height:1.5;font-weight:normal;&quot;&gt;&lt;strong&gt;&lt;/strong&gt;&lt;/span&gt;&lt;span style=&quot;font-family:KaiTi_GB2312;line-height:1.5;font-weight:normal;&quot;&gt;&lt;strong&gt;测试文章编辑器的使用&lt;/strong&gt;&lt;/span&gt;\r\n&lt;/h4&gt;', '1413859049', '1', '家具展示');
INSERT INTO `erp_article` VALUES ('20', '5', '2', '测试', '1413861517', '1', '测试');
INSERT INTO `erp_article` VALUES ('21', '7', '2', '&lt;strong&gt;测试测试&lt;/strong&gt;', '1413861646', '1', '产品名称');
INSERT INTO `erp_article` VALUES ('22', '9', '2', '&lt;strong&gt;测试&lt;/strong&gt;', '1413861786', '1', '友情网站');
INSERT INTO `erp_article` VALUES ('23', '5', '2', '&lt;strong&gt;ceshiceshi&lt;/strong&gt;', '1413863157', '1', '家具展示');
INSERT INTO `erp_article` VALUES ('24', '8', '2', '&lt;strong&gt;测试测试测试&lt;/strong&gt;', '1413863849', '1', '友情网站');
INSERT INTO `erp_article` VALUES ('25', '8', '1', '&lt;strong&gt;测试测试测试测试测试测试测试&lt;/strong&gt;', '1413864005', '1', '产品名称');
INSERT INTO `erp_article` VALUES ('26', '7', '1', '&lt;p class=&quot;MsoNormal&quot; align=&quot;left&quot; style=&quot;text-indent:32pt;&quot;&gt;\r\n	&lt;span style=&quot;font-size:18px;&quot;&gt;（四）抓好宣传，营造氛围。充分利用检察机关的宣传版面、学习园地、横幅标语，大力营造浓厚的学习氛围。充分发挥新闻媒体、网络媒体的作用，广泛宣传报道检察机关深入学习贯彻党的十八大精神的具体措施和取得的扎实效果。大力宣传开展学习贯彻党的十八大活动中涌现出来的先进典型、好的经验做法和取得的成效。&lt;/span&gt; \r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span&gt; &lt;/span&gt; \r\n&lt;/p&gt;', '1413870381', '1', '测试侧啊是');
INSERT INTO `erp_article` VALUES ('27', '1', '1', '什么是动态网页？动态网页有哪些特点？', '1413878195', '1', '什么是动态网页？动态网页有哪些特点？');
INSERT INTO `erp_article` VALUES ('28', '7', '2', '心态篇――心态决定成功', '1413878326', '1', '心态篇-心态决定成功');
INSERT INTO `erp_article` VALUES ('29', '5', '2', '	&lt;b&gt;&lt;span style=&quot;color:windowtext;font-size:12pt;font-family:楷体_GB2312;&quot;&gt;&lt;span&gt;我也许不聪明，但我更努力&lt;/span&gt;&lt;/span&gt;&lt;/b&gt;\r\n&lt;/p&gt;\r\n&lt;span&gt;&lt;/span&gt;\r\n&lt;p style=&quot;font-family:Tahoma, Geneva, sans-serif;font-size:14px;&quot;&gt;\r\n	&lt;b&gt;&lt;span style=&quot;color:windowtext;font-size:12pt;font-family:楷体_GB2312;&quot;&gt;&lt;span&gt;惟有成长令我愉悦&lt;/span&gt;&lt;/span&gt;&lt;/b&gt;\r\n&lt;/p&gt;', '1413878420', '1', '励志语句');
INSERT INTO `erp_article` VALUES ('30', '1', '1', '&lt;p style=&quot;font-family:Tahoma, Geneva, sans-serif;font-size:14px;&quot;&gt;\r\n	&lt;b&gt;&lt;span style=&quot;color:windowtext;font-size:12pt;font-family:楷体_GB2312;&quot;&gt;&lt;span&gt;不抛弃，不放弃&lt;/span&gt;&lt;br /&gt;\r\n&lt;span&gt;&lt;/span&gt;&lt;span&gt;不抛弃什么？不抛弃亲情、友情、同事情……&lt;/span&gt;&lt;br /&gt;\r\n&lt;span&gt;&lt;/span&gt;&lt;span&gt;不放弃什么？不放弃信念、理想、原则……&lt;/span&gt;&lt;/span&gt;&lt;/b&gt;\r\n&lt;/p&gt;\r\n&lt;span&gt;&lt;/span&gt;\r\n&lt;p style=&quot;font-family:Tahoma, Geneva, sans-serif;font-size:14px;&quot;&gt;\r\n	&lt;b&gt;&lt;span style=&quot;color:windowtext;font-size:12pt;font-family:楷体_GB2312;&quot;&gt;&lt;span&gt;天道酬勤，不是不到，时候未到&lt;/span&gt;&lt;/span&gt;&lt;/b&gt;\r\n&lt;/p&gt;\r\n&lt;span&gt;&lt;/span&gt;\r\n&lt;p style=&quot;font-family:Tahoma, Geneva, sans-serif;font-size:14px;&quot;&gt;\r\n	&lt;b&gt;&lt;span style=&quot;color:windowtext;font-size:12pt;font-family:楷体_GB2312;&quot;&gt;&lt;span&gt;今天耕种，明天收获&lt;/span&gt;&lt;/span&gt;&lt;/b&gt;\r\n&lt;/p&gt;\r\n&lt;span&gt;&lt;/span&gt;\r\n&lt;p style=&quot;font-family:Tahoma, Geneva, sans-serif;font-size:14px;&quot;&gt;\r\n	&lt;b&gt;&lt;span style=&quot;color:windowtext;font-size:12pt;font-family:楷体_GB2312;&quot;&gt;&lt;span&gt;我也许不聪明，但我更努力&lt;/span&gt;&lt;/span&gt;&lt;/b&gt;\r\n&lt;/p&gt;\r\n&lt;span&gt;&lt;/span&gt;\r\n&lt;p style=&quot;font-family:Tahoma, Geneva, sans-serif;font-size:14px;&quot;&gt;\r\n	&lt;b&gt;&lt;span style=&quot;color:windowtext;font-size:12pt;font-family:楷体_GB2312;&quot;&gt;&lt;span&gt;惟有成长令我愉悦&lt;/span&gt;&lt;/span&gt;&lt;/b&gt;\r\n&lt;/p&gt;', '1413878772', '1', '励志语句');
INSERT INTO `erp_article` VALUES ('31', '1', '1', '&lt;p style=&quot;font-family:Tahoma, Geneva, sans-serif;font-size:14px;&quot;&gt;\r\n	一)、竞争的需要&amp;nbsp;&lt;br /&gt;\r\n国际互联网的用户在迅猛地增长，中国上网用户由1995年的一万户速增至2001年上半年的2650万用户。这增长速度是全世界范围的普遍现象。在美国、欧洲、日本、台湾、港澳及其它许多国家，网站和电子信箱系统已经成为公司立业不可缺少的重要组成部分。人们用电子信箱已经比用电话多了，百分之九十以上的大小企业、学校、政府机关、服务业甚至酒吧都设法在热门网络上设立自己的网站，供数以百万计的人们前来参观、浏览和查询。中国及全世界的上网用户在未来几十年内还会迅速增加。您的企业要为这众多的民众、企业服务就必须建立自己的网站和电子信箱系统，在这信息的高速公路上宣传自己高效的工作。企业网站、电子信箱给客户、潜在客户，特别是大客户及海外客户，带来了便利的联系，增加了了解，增强了信任感。这些企业自然是他们要打交道的首选，没有网站和电子信箱的企业将失去越来越多的机会而最终被淘汰。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;font-family:Tahoma, Geneva, sans-serif;font-size:14px;&quot;&gt;\r\n	二)、可以迅速树立企业形象&amp;nbsp;&lt;br /&gt;\r\n今天，国际互联网络已成为高科技和未来生活的代名词，要显示你公司的实力，提升公司的形象，没有什么比在员工名片、企业信笺、广告及各种公众能看得到的东西上印上自己公司独有的网络地址和专用的集团电子邮件地址更有说服力了。消费者、客户和海外投资者自然对您另眼相看。\r\n&lt;/p&gt;', '1413879586', '1', '企业为什么要做网站？');
INSERT INTO `erp_article` VALUES ('32', '1', '1', '11111', '1423531068', '1', '1111');

-- ----------------------------
-- Table structure for `erp_auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `erp_auth_group`;
CREATE TABLE `erp_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of erp_auth_group
-- ----------------------------
<<<<<<< HEAD
INSERT INTO `erp_auth_group` VALUES ('1', 'admin', '1', '默认用户组', '默认用户组', '1', '1,11,111,112,113,114,12,121,122,123,124,125,126,13,14,141,142,143,144,2,21,211,212,2121,213,214,215,22,23,231,232,233,3,31,311,312,3121,313,314,32,321,322,3221,323,324,4,41,411,412,4121,413,414,42,43,431,432,433,44,441,442,443,444,445,446,5,51,511,512,513,514,515,52,521,522,523,524,525,53,531,532,6,61,611,612,613,614,62,621,7,71,711,712,713,714,715,716,717,718,72,721,722,73,74,741,742,75,751,752,753');
INSERT INTO `erp_auth_group` VALUES ('2', 'admin', '1', '部门领导组', '部门领导组', '1', '1,11,111,112,12,121,122,123,124,125,126,13,14,141,142,143,2,21,211,212,2121,213,214,215,22,23,231,232,233,3,31,311,312,3121,313,314,32,321,322,3221,323,324,4,41,411,412,4121,413,414,42,43,431,432,433,44,441,442,443,444,445,446,5,53,531,532,7,71,716,717');
INSERT INTO `erp_auth_group` VALUES ('7', 'admin', '1', '员工用户组', '员工用户组', '1', '1,11,111,112,12,121,122,123,124,125,13,14,141,142,143,144,2,21,211,212,2121,213,22,23,231,232,233,3,31,311,312,3121,32,321,322,3221,4,41,411,42,44,441,442,444,5,53,531,532');
INSERT INTO `erp_auth_group` VALUES ('8', 'admin', '1', '维护组', '维护组', '1', '5,51,511,512,513,514,52,521,522,523,524,53,531,532,7,71,711,712,713,714,715,716,717');
=======
<<<<<<< HEAD
INSERT INTO `erp_auth_group` VALUES ('1', 'admin', '1', '默认用户组', '默认用户组', '1', '1,11,111,112,12,121,122,123,124,125,126,13,14,141,142,143,144,2,21,211,212,2121,213,214,215,22,23,231,232,233,3,31,311,312,3121,313,314,32,321,322,3221,323,324,4,41,411,412,4121,413,414,42,43,431,432,433,44,441,442,443,444,445,446,5,51,511,512,513,514,52,521,522,523,524,53,531,532,6,61,611,612,613,62,621,7,71,711,712,713,714,715,716,717,72,721,722,73,74,741,742,75,751,752,753');
INSERT INTO `erp_auth_group` VALUES ('2', 'admin', '1', '部门领导组', '部门领导组', '1', '1,11,111,112,12,121,122,123,124,125,126,13,14,141,142,143,144,2,21,211,212,2121,213,214,215,22,23,231,232,233,3,31,311,312,3121,313,314,32,321,322,3221,323,324,4,41,411,412,4121,413,414,42,43,431,432,433,44,441,442,443,444,445,446,5,53,531,532,7,71,716,717');
INSERT INTO `erp_auth_group` VALUES ('7', 'admin', '1', '员工用户组', '员工用户组', '1', '1,11,111,112,12,121,122,123,124,125,13,14,141,142,143,144,2,21,211,212,2121,213,22,23,231,232,233,3,31,311,312,3121,32,321,322,3221,4,41,411,42,44,441,442,444,5,53,531,532');
INSERT INTO `erp_auth_group` VALUES ('8', 'admin', '1', '维护组', '维护组', '1', '5,51,511,512,513,514,52,521,522,523,524,53,531,532,7,71,711,712,713,714,715,716,717');
=======
INSERT INTO `erp_auth_group` VALUES ('1', 'admin', '1', '默认用户组', '默认用户组', '1', '1,2,3,5,7,8,9,10,4,11,12,13,14');
INSERT INTO `erp_auth_group` VALUES ('2', 'admin', '1', '测试用户', '测试用户', '1', '1,2,5,10,3,4,11,12,13,14');
>>>>>>> 39a32b55aa1bce646f64cd3e774a205cda91af28
>>>>>>> ef0add2d1cd09f4bc251842f1eca6e0044df7d75

-- ----------------------------
-- Table structure for `erp_auth_group_access`
-- ----------------------------
DROP TABLE IF EXISTS `erp_auth_group_access`;
CREATE TABLE `erp_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of erp_auth_group_access
-- ----------------------------
INSERT INTO `erp_auth_group_access` VALUES ('1', '1');
INSERT INTO `erp_auth_group_access` VALUES ('2', '1');
INSERT INTO `erp_auth_group_access` VALUES ('4', '1');
INSERT INTO `erp_auth_group_access` VALUES ('5', '1');
INSERT INTO `erp_auth_group_access` VALUES ('6', '1');
INSERT INTO `erp_auth_group_access` VALUES ('7', '1');
INSERT INTO `erp_auth_group_access` VALUES ('8', '1');
INSERT INTO `erp_auth_group_access` VALUES ('9', '1');
INSERT INTO `erp_auth_group_access` VALUES ('10', '1');
INSERT INTO `erp_auth_group_access` VALUES ('11', '1');
INSERT INTO `erp_auth_group_access` VALUES ('12', '1');
INSERT INTO `erp_auth_group_access` VALUES ('13', '1');
INSERT INTO `erp_auth_group_access` VALUES ('14', '1');
INSERT INTO `erp_auth_group_access` VALUES ('15', '1');
INSERT INTO `erp_auth_group_access` VALUES ('16', '1');
INSERT INTO `erp_auth_group_access` VALUES ('17', '1');
INSERT INTO `erp_auth_group_access` VALUES ('18', '1');
INSERT INTO `erp_auth_group_access` VALUES ('21', '2');
INSERT INTO `erp_auth_group_access` VALUES ('22', '2');
INSERT INTO `erp_auth_group_access` VALUES ('23', '1');
INSERT INTO `erp_auth_group_access` VALUES ('24', '1');
INSERT INTO `erp_auth_group_access` VALUES ('25', '1');
INSERT INTO `erp_auth_group_access` VALUES ('26', '8');
INSERT INTO `erp_auth_group_access` VALUES ('27', '8');
<<<<<<< HEAD
INSERT INTO `erp_auth_group_access` VALUES ('28', '1');
INSERT INTO `erp_auth_group_access` VALUES ('29', '1');
INSERT INTO `erp_auth_group_access` VALUES ('30', '2');
INSERT INTO `erp_auth_group_access` VALUES ('31', '2');
INSERT INTO `erp_auth_group_access` VALUES ('32', '2');
INSERT INTO `erp_auth_group_access` VALUES ('33', '1');
INSERT INTO `erp_auth_group_access` VALUES ('34', '2');
INSERT INTO `erp_auth_group_access` VALUES ('35', '2');
INSERT INTO `erp_auth_group_access` VALUES ('36', '2');
INSERT INTO `erp_auth_group_access` VALUES ('37', '2');
INSERT INTO `erp_auth_group_access` VALUES ('38', '1');
INSERT INTO `erp_auth_group_access` VALUES ('39', '2');
INSERT INTO `erp_auth_group_access` VALUES ('40', '2');
INSERT INTO `erp_auth_group_access` VALUES ('41', '2');
INSERT INTO `erp_auth_group_access` VALUES ('42', '7');
INSERT INTO `erp_auth_group_access` VALUES ('43', '7');
INSERT INTO `erp_auth_group_access` VALUES ('44', '7');
INSERT INTO `erp_auth_group_access` VALUES ('45', '7');
INSERT INTO `erp_auth_group_access` VALUES ('46', '7');
INSERT INTO `erp_auth_group_access` VALUES ('47', '7');
INSERT INTO `erp_auth_group_access` VALUES ('48', '7');
INSERT INTO `erp_auth_group_access` VALUES ('49', '7');
INSERT INTO `erp_auth_group_access` VALUES ('50', '7');
INSERT INTO `erp_auth_group_access` VALUES ('51', '7');
INSERT INTO `erp_auth_group_access` VALUES ('52', '7');
INSERT INTO `erp_auth_group_access` VALUES ('53', '7');
INSERT INTO `erp_auth_group_access` VALUES ('54', '7');
INSERT INTO `erp_auth_group_access` VALUES ('55', '7');
INSERT INTO `erp_auth_group_access` VALUES ('56', '7');
INSERT INTO `erp_auth_group_access` VALUES ('57', '7');
INSERT INTO `erp_auth_group_access` VALUES ('58', '7');
INSERT INTO `erp_auth_group_access` VALUES ('59', '7');
INSERT INTO `erp_auth_group_access` VALUES ('60', '7');
INSERT INTO `erp_auth_group_access` VALUES ('61', '7');
INSERT INTO `erp_auth_group_access` VALUES ('62', '7');
INSERT INTO `erp_auth_group_access` VALUES ('63', '7');
INSERT INTO `erp_auth_group_access` VALUES ('64', '7');
INSERT INTO `erp_auth_group_access` VALUES ('65', '7');
INSERT INTO `erp_auth_group_access` VALUES ('66', '7');
INSERT INTO `erp_auth_group_access` VALUES ('67', '2');
INSERT INTO `erp_auth_group_access` VALUES ('68', '7');
INSERT INTO `erp_auth_group_access` VALUES ('69', '2');
INSERT INTO `erp_auth_group_access` VALUES ('70', '2');
INSERT INTO `erp_auth_group_access` VALUES ('71', '7');
INSERT INTO `erp_auth_group_access` VALUES ('72', '7');
INSERT INTO `erp_auth_group_access` VALUES ('73', '7');
INSERT INTO `erp_auth_group_access` VALUES ('74', '7');
INSERT INTO `erp_auth_group_access` VALUES ('75', '7');
INSERT INTO `erp_auth_group_access` VALUES ('76', '7');
INSERT INTO `erp_auth_group_access` VALUES ('77', '7');
INSERT INTO `erp_auth_group_access` VALUES ('78', '7');
INSERT INTO `erp_auth_group_access` VALUES ('79', '2');
=======
>>>>>>> ef0add2d1cd09f4bc251842f1eca6e0044df7d75

-- ----------------------------
-- Table structure for `erp_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `erp_auth_rule`;
CREATE TABLE `erp_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `parent_id` mediumint(8) NOT NULL DEFAULT '0' COMMENT '父级节点   0为顶级',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
<<<<<<< HEAD
) ENGINE=MyISAM AUTO_INCREMENT=4123 DEFAULT CHARSET=utf8;
=======
) ENGINE=MyISAM AUTO_INCREMENT=4122 DEFAULT CHARSET=utf8;
>>>>>>> ef0add2d1cd09f4bc251842f1eca6e0044df7d75

-- ----------------------------
-- Records of erp_auth_rule
-- ----------------------------
INSERT INTO `erp_auth_rule` VALUES ('1', '0', 'home', '2', '', '客户管理', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('2', '0', 'home', '1', '', '订单管理', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('3', '0', 'home', '1', '', '开发管理', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('4', '0', 'home', '1', '', '续费管理', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('5', '0', 'home', '1', '', '综合管理', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('6', '0', 'home', '1', '', '业绩管理', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('7', '0', 'home', '1', '', '系统管理', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('11', '1', 'home', '1', 'Home/publiccust/lists', '公海客户', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('12', '1', 'home', '1', 'Home/customer/lists', '客户列表', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('13', '1', 'home', '1', 'Home/customer/add', '添加客户', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('14', '1', 'home', '1', 'Home/customervisit/visitlists', '拜访记录', '1', '');
<<<<<<< HEAD
INSERT INTO `erp_auth_rule` VALUES ('21', '2', 'home', '1', 'Home/order/order_list', '订单列表', '1', '');
=======
INSERT INTO `erp_auth_rule` VALUES ('21', '2', 'home', '1', 'Home/order-order/list', '订单列表', '1', '');
>>>>>>> ef0add2d1cd09f4bc251842f1eca6e0044df7d75
INSERT INTO `erp_auth_rule` VALUES ('22', '2', 'home', '1', 'Home/order/add_order_form', '添加订单', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('23', '2', 'home', '1', 'Home/orderpay/order_pay_record', '订单付款记录', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('31', '3', 'home', '1', 'Home/depord/dep_list', '网站开发订单', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('32', '3', 'home', '1', 'Home/seoord/seo_list', '优化订单', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('41', '4', 'home', '1', 'Home/order/renewal_order', '待续费订单', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('42', '4', 'home', '1', 'Home/orderrenewal/or_list', '订单续费申请', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('43', '4', 'home', '1', 'Home/domren/dom_ren_app', '域名续费申请', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('44', '4', 'home', '1', 'Home/domain/domain_list', '域名库', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('51', '5', 'home', '1', 'Home/depart/depa_list', '部门管理', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('52', '5', 'home', '1', 'Home/product/pro_list', '产品管理', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('53', '5', 'home', '1', 'Home/article/art_list', '文章管理', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('61', '6', 'home', '1', 'Home/mission/mission_list', '部门任务', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('62', '6', 'home', '1', 'Home/results/show_res', '业绩排行', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('71', '7', 'home', '1', 'Home/user/search_list', '用户管理', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('72', '7', 'home', '1', 'Home/authgroup/user_group', '用户组管理', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('73', '7', 'home', '1', 'Home/authrule/all_rule', '权限列表', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('74', '7', 'home', '1', 'Home/userdepartmgr/lis', '管理者列表', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('75', '7', 'home', '1', 'Home/config/config_list', '配置管理', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('121', '12', '', '1', '', '客户搜索', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('122', '12', '', '1', 'Home/customer/detailed', '查看详细', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('123', '12', '', '1', 'Home/customer/edit', '编辑', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('124', '12', '', '1', 'Home/order/add_order_form', '添加订单', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('125', '12', '', '1', 'Home/Customervisit/addvisit', '添加拜访', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('126', '12', '', '1', 'Home/Usercustprod/lists', '权限分配', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('141', '14', '', '1', '', '搜索拜访记录', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('142', '14', '', '1', 'Home/customervisit/add_visit_prod', '添加拜访记录', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('143', '14', '', '1', 'Home/customervisit/visit_detailed', '查看拜访记录', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('144', '14', '', '1', 'Home/customervisit/add_visit_prod', '添加沟通记录', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('211', '21', '', '1', '', '订单搜索', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('212', '21', '', '1', 'Home/order/order_info', '订单详情', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('213', '21', '', '1', 'Home/order/add_order_form', '添加订单', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('214', '21', '', '1', 'Home/order/push_form', '推送订单', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('215', '21', '', '1', 'Home/order/check_order', '审核订单', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('231', '23', '', '1', '', '订单付款记录搜索', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('232', '23', '', '1', 'Home/orderpay/op_info', '订单付款记录编辑', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('233', '23', '', '1', 'Home/orderpay/ad_form', '添加订单付款记录', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('311', '31', '', '1', '', '搜索网站开发订单', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('312', '31', '', '1', 'Home/depord/dep_info', '查看网站开发订单', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('313', '31', '', '1', 'Home/depord/push_form', '推送网站开发订单', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('314', '31', '', '1', 'Home/depord/dist', '分配网站开发订单', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('321', '32', '', '1', '', '搜索优化开发订单', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('322', '32', '', '1', 'Home/seoord/seo_info', '查看优化开发订单', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('323', '32', '', '1', 'Home/seoord/push_form', '推送优化开发订单', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('324', '32', '', '1', 'Home/seoord/dist', '分配优化开发订单', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('411', '41', '', '1', '', '待续费订单搜索', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('412', '41', '', '1', 'Home/order/order_info', '查看待续费订单', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('413', '41', '', '1', 'Home/order/apy_ren', '待续费订单续费', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('414', '41', '', '1', 'Home/order/stop', '停止开始待续费订单', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('431', '43', '', '1', '', '搜索域名续费申请', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('432', '43', '', '1', '', '查看域名续费申请', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('433', '43', '', '1', '', '审核域名续费申请', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('441', '44', '', '1', '', '搜索域名', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('442', '44', '', '1', 'Home/domain/domain_detailed', '查看域名', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('443', '44', '', '1', 'Home/domain/domain_edit', '编辑域名', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('444', '44', '', '1', '', '域名申请续费', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('445', '44', '', '1', 'Home/domain/domain_del', '删除域名', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('446', '44', '', '1', 'Home/domain/check', '审核域名', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('511', '51', '', '1', 'Home/depart/up_dp_form', '编辑部门', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('512', '51', '', '1', 'Home/depart/del_dp', '删除部门', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('513', '51', '', '1', 'Home/depart/ad_dp_form', '添加部门', '1', '');
<<<<<<< HEAD
INSERT INTO `erp_auth_rule` VALUES ('514', '51', '', '1', 'Home/depart/stop', '审核部门状态停止', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('521', '52', '', '1', 'Home/product/pro_info', '产品详情', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('522', '52', '', '1', 'Home/product/del_pro', '删除产品', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('523', '52', '', '1', 'Home/product/ad_pro_form', '添加产品', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('524', '52', '', '1', 'Home/product/stop', '审核产品状态停止', '1', '');
=======
INSERT INTO `erp_auth_rule` VALUES ('514', '51', '', '1', 'Home/depart/stop', '审核部门状态', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('521', '52', '', '1', 'Home/product/pro_info', '产品详情', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('522', '52', '', '1', 'Home/product/del_pro', '删除产品', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('523', '52', '', '1', 'Home/product/ad_pro_form', '添加产品', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('524', '52', '', '1', 'Home/product/stop', '审核产品状态', '1', '');
>>>>>>> ef0add2d1cd09f4bc251842f1eca6e0044df7d75
INSERT INTO `erp_auth_rule` VALUES ('531', '53', '', '1', 'Home/article/art_detailed', '文章详细内容查看', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('532', '53', '', '1', 'Home/article/art_add', '添加文章', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('611', '61', '', '1', '', '搜索部门任务', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('612', '61', '', '1', 'Home/mission/add', '添加部门任务', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('613', '61', '', '1', '', '编辑部门任务', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('621', '62', '', '1', '', '搜索业绩排行', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('711', '71', '', '1', '', '搜索系统用户', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('712', '71', '', '1', 'Home/user/user_info', '编辑系统用户', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('713', '71', '', '1', 'Home/user/del', '删除系统用户', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('714', '71', '', '1', 'Home/user/ad_user_form', '添加系统用户', '1', '');
<<<<<<< HEAD
INSERT INTO `erp_auth_rule` VALUES ('715', '71', '', '1', 'Home/user/stop', '审核系统用户状态为正常', '1', '');
=======
INSERT INTO `erp_auth_rule` VALUES ('715', '71', '', '1', 'Home/user/stop', '审核系统用户', '1', '');
>>>>>>> ef0add2d1cd09f4bc251842f1eca6e0044df7d75
INSERT INTO `erp_auth_rule` VALUES ('721', '72', '', '1', 'Home/authgroup/info', '查看用户组详情', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('722', '72', '', '1', 'Home/authgroup/up', '编辑用户组详情', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('741', '74', '', '1', 'Home/userdepartmgr/del', '取消管理者', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('742', '74', '', '1', 'Home/Userdepartmgr/ad_form', '添加管理者', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('751', '75', '', '1', 'Home/config/update', '更新配置项', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('752', '75', '', '1', 'Home/config/del', '删除配置项', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('753', '75', '', '1', 'Home/config/add', '添加配置项', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('111', '11', '', '1', 'Home/publiccust/uca_lists', '查看公海客户申请列表', '1', '');
<<<<<<< HEAD
INSERT INTO `erp_auth_rule` VALUES ('112', '11', '', '1', 'Home/publiccust/apply', '公海客户权限申请页面', '1', '');
=======
INSERT INTO `erp_auth_rule` VALUES ('112', '11', '', '1', 'Home/publiccust/apply', '公海客户权限申请', '1', '');
>>>>>>> ef0add2d1cd09f4bc251842f1eca6e0044df7d75
INSERT INTO `erp_auth_rule` VALUES ('2121', '212', '', '1', 'Home/order/ord_u_form', '订单修改', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('3121', '312', '', '1', 'Home/depord/ad_record', '添加网站开发沟通 记录', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('3221', '322', '', '1', 'Home/seoord/ad_record', '添加优化开发沟通 记录', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('4121', '412', '', '1', 'Home/order/ord_u_form', '修改待续费订单', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('716', '71', '', '1', 'Home/user/user_update', '登录用户信息修改', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('717', '71', '', '1', 'Home/user/pwd', '登录用户密码修改', '1', '');
<<<<<<< HEAD
INSERT INTO `erp_auth_rule` VALUES ('113', '11', '', '1', 'Home/publiccust/check', '公海客户申请审核', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('718', '71', '', '1', 'Home/user/star', '审核系统用户状态为禁用', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('114', '11', '', '1', 'Home/publiccust/apply_insert', '公海客户权限申请操作', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('515', '51', '', '1', 'Home/depart/star', '审核部门状态开始', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('525', '52', '', '1', 'Home/product/star', '审核产品状态开始', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('614', '61', '', '1', 'Home/mission/addmission', '部门任务添加操作', '1', '');
=======
>>>>>>> ef0add2d1cd09f4bc251842f1eca6e0044df7d75

-- ----------------------------
-- Table structure for `erp_comment`
-- ----------------------------
DROP TABLE IF EXISTS `erp_comment`;
CREATE TABLE `erp_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL COMMENT '评论人id',
  `art_id` int(10) unsigned NOT NULL COMMENT '评论文章的id',
  `content` text NOT NULL COMMENT '评论的内容',
  `add_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '评论时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='文章评论表';

-- ----------------------------
-- Records of erp_comment
-- ----------------------------
INSERT INTO `erp_comment` VALUES ('1', '1', '9', '评论测试', '1413795192');
INSERT INTO `erp_comment` VALUES ('2', '1', '9', '我要评论', '1413795192');
INSERT INTO `erp_comment` VALUES ('3', '2', '9', 'ceshi', '1413795192');
INSERT INTO `erp_comment` VALUES ('4', '1', '13', '测试评论发布', '1413856616');
INSERT INTO `erp_comment` VALUES ('5', '1', '25', '评论测试', '1413869577');
INSERT INTO `erp_comment` VALUES ('6', '1', '26', '评论已发', '1413873129');
INSERT INTO `erp_comment` VALUES ('7', '1', '26', '文章已阅读', '1413873167');
INSERT INTO `erp_comment` VALUES ('20', '1', '21', '测试评论', '1413876107');
INSERT INTO `erp_comment` VALUES ('21', '1', '29', '评论', '1413878476');
INSERT INTO `erp_comment` VALUES ('30', '0', '0', '很励志', '0');
INSERT INTO `erp_comment` VALUES ('31', '1', '30', '评论测试', '1413879403');
INSERT INTO `erp_comment` VALUES ('32', '1', '30', '测试评论功能', '1413879441');
INSERT INTO `erp_comment` VALUES ('33', '1', '31', '文章已读过', '1413879612');
INSERT INTO `erp_comment` VALUES ('34', '1', '31', '111', '1421289755');

-- ----------------------------
-- Table structure for `erp_config`
-- ----------------------------
DROP TABLE IF EXISTS `erp_config`;
CREATE TABLE `erp_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of erp_config
-- ----------------------------
INSERT INTO `erp_config` VALUES ('1', 'WEB_SITE_TITLE', '1', '网站标题', '1', '', '网站标题前台显示标题', '1378898976', '1379235274', '1', 'OneThink内容管理框架', '0');
INSERT INTO `erp_config` VALUES ('2', 'WEB_SITE_DESCRIPTION', '2', '网站描述', '1', '', '网站搜索引擎描述\r\n\r\n', '1378898976', '1379235841', '1', 'OneThink内容管理框架', '1');
INSERT INTO `erp_config` VALUES ('3', 'WEB_SITE_KEYWORD', '2', '网站关键字', '1', '', '网站搜索引擎关键字\r\n\r\n', '1378898976', '1381390100', '1', 'ThinkPHP,OneThink', '8');
INSERT INTO `erp_config` VALUES ('4', 'WEB_SITE_CLOSE', '4', '关闭站点', '1', '0:关闭,1:开启', '站点关闭\r\n\r\n后其他用户不能访问，管理员可以正常访问', '1378898976', '1379235296', '1', '1', '1');
INSERT INTO `erp_config` VALUES ('9', 'CONFIG_TYPE_LIST', '3', '配置类型列表', '4', '', '主要用于数据解析\r\n\r\n和页面表单的生成', '1378898976', '1379235348', '1', '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', '2');
INSERT INTO `erp_config` VALUES ('10', 'WEB_SITE_ICP', '1', '网站备案号', '1', '', '设置在网站底部显示的\r\n\r\n备案号，如“沪ICP备12007941号-2', '1378900335', '1379235859', '1', '', '9');
INSERT INTO `erp_config` VALUES ('11', 'DOCUMENT_POSITION', '3', '文档推荐位', '2', '', '文档推荐位，推荐\r\n\r\n到多个位置KEY值相加即可', '1379053380', '1379235329', '1', '1:列表页推荐\r\n2:频道页推荐\r\n4:网站首页推\r\n\r\n荐', '3');
INSERT INTO `erp_config` VALUES ('12', 'DOCUMENT_DISPLAY', '3', '文档可见性', '2', '', '文章可见性仅影响\r\n\r\n前台显示，后台不收影响', '1379056370', '1379235322', '1', '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员\r\n\r\n可见', '4');
INSERT INTO `erp_config` VALUES ('13', 'COLOR_STYLE', '4', '后台色系', '1', 'default_color:默认\r\n\r\n\r\nblue_color:紫罗兰', '后台颜色风格', '1379122533', '1379235904', '1', 'default_color', '10');
INSERT INTO `erp_config` VALUES ('20', 'CONFIG_GROUP_LIST', '3', '配置分组', '4', '', '配置分组', '1379228036', '1384418383', '1', '1:基本\r\n2:内容\r\n3:用户\r\n4:系统', '4');
INSERT INTO `erp_config` VALUES ('21', 'HOOKS_TYPE', '3', '钩子的类型', '4', '', '类型 1-用于扩展显示内容\r\n\r\n，2-用于扩展业务处理', '1379313397', '1379313407', '1', '1:视图\r\n2:控制器', '6');
INSERT INTO `erp_config` VALUES ('23', 'OPEN_DRAFTBOX', '4', '是否开启草稿功能', '2', '0:关闭草稿功能\r\n\r\n\r\n1:开启草稿功能\r\n', '新增文章时的草稿功能配置', '1379484332', '1379484591', '1', '1', '1');
INSERT INTO `erp_config` VALUES ('24', 'DRAFT_AOTOSAVE_INTERVAL', '0', '自动保存草稿时间', '2', '', '自动\r\n\r\n保存草稿的时间间隔，单位：秒', '1379484574', '1386143323', '1', '60', '2');
INSERT INTO `erp_config` VALUES ('25', 'LIST_ROWS', '0', '后台每页记录数', '2', '', '后台数据每页显示记录\r\n\r\n数', '1379503896', '1380427745', '1', '10', '10');
INSERT INTO `erp_config` VALUES ('26', 'USER_ALLOW_REGISTER', '4', '是否允许用户注册', '3', '0:关闭注册\r\n\r\n\r\n1:允许注册', '是否开放用户注册', '1379504487', '1379504580', '1', '1', '3');
INSERT INTO `erp_config` VALUES ('27', 'CODEMIRROR_THEME', '4', '预览插件的CodeMirror主题', '4', '3024-\r\n\r\nday:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-\r\n\r\nlight:base16 \r\n\r\nlight\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-\r\n\r\ndark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidn', '详情见CodeMirror官网', '1379814385', '1384740813', '1', 'ambiance', '3');
INSERT INTO `erp_config` VALUES ('28', 'DATA_BACKUP_PATH', '1', '数据库备份根路径', '4', '', '路径必须以 \r\n\r\n/ 结尾', '1381482411', '1381482411', '1', './Data/', '5');
INSERT INTO `erp_config` VALUES ('29', 'DATA_BACKUP_PART_SIZE', '0', '数据库备份卷大小', '4', '', '该值用\r\n\r\n于限制压缩后的分卷最大长度。单位：B；建议设置20M', '1381482488', '1381729564', '1', '20971520', '7');
INSERT INTO `erp_config` VALUES ('30', 'DATA_BACKUP_COMPRESS', '4', '数据库备份文件是否启用压缩', '4', '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', '1381713345', '1381729544', '1', '1', '9');
INSERT INTO `erp_config` VALUES ('31', 'DATA_BACKUP_COMPRESS_LEVEL', '4', '数据库备份文件压缩级别', '4', '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '1381713408', '1381713408', '1', '9', '10');
INSERT INTO `erp_config` VALUES ('32', 'DEVELOP_MODE', '4', '开启开发者模式', '4', '0:关闭\r\n1:开启', '\r\n\r\n是否开启开发者模式', '1383105995', '1383291877', '1', '1', '11');
INSERT INTO `erp_config` VALUES ('33', 'ALLOW_VISIT', '3', '不受限控制器方法', '0', '', '', '1386644047', '1386644741', '1', '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:fi\r\n\r\nle/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNi\r\n\r\nckname\r\n10:file/uploadpicture', '0');
INSERT INTO `erp_config` VALUES ('34', 'DENY_VISIT', '3', '超管专限控制器方法', '0', '', '仅超级管理员可\r\n\r\n访问的控制器方法', '1386644141', '1386644659', '1', '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n\r\n\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', '0');
INSERT INTO `erp_config` VALUES ('35', 'REPLY_LIST_ROWS', '0', '回复列表每页条数', '2', '', '', '1386645376', '1387178083', '1', '10', '0');
INSERT INTO `erp_config` VALUES ('36', 'ADMIN_ALLOW_IP', '2', '后台允许访问IP', '4', '', '多个用逗号分隔\r\n\r\n，如果不配置表示不限制IP访问', '1387165454', '1418008384', '1', '', '12');
INSERT INTO `erp_config` VALUES ('37', 'SHOW_PAGE_TRACE', '4', '是否显示页面Trace', '4', '0:关闭\r\n1:开\r\n\r\n启', '是否显示页面Trace信息', '1387165685', '1418694527', '1', '1', '1');
INSERT INTO `erp_config` VALUES ('38', 'QUANXIANGUOQI', '0', '客户权限过期时间', '0', '', '客户权限过期时间  单位：天', '1387165685', '1387165685', '1', '30', '0');

-- ----------------------------
-- Table structure for `erp_customer`
-- ----------------------------
DROP TABLE IF EXISTS `erp_customer`;
CREATE TABLE `erp_customer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '客户名称',
  `contacts` varchar(255) NOT NULL COMMENT '联系人',
  `phone` varchar(15) NOT NULL COMMENT '联系电话',
  `fax` varchar(15) DEFAULT NULL COMMENT '传真',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `add_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '添加日期',
  `check` tinyint(1) NOT NULL DEFAULT '0' COMMENT '-1:拒绝 0:待审 >1:通过',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '-1:删除 0:禁用 1:正常',
  `check_time` varchar(32) DEFAULT '0' COMMENT '审核时间',
  `user_id` int(10) DEFAULT NULL COMMENT '提交人id',
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
<<<<<<< HEAD
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='客户表';
=======
<<<<<<< HEAD
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='客户表';
=======
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='客户表';
>>>>>>> 39a32b55aa1bce646f64cd3e774a205cda91af28
>>>>>>> ef0add2d1cd09f4bc251842f1eca6e0044df7d75

-- ----------------------------
-- Records of erp_customer
-- ----------------------------
INSERT INTO `erp_customer` VALUES ('1', '洛阳万谦网络科技有限公司', '张三种', '0379-63233333', '0379-632600', '紫金城1', '1411021523', '1', '1', '1413428532', '1', '1111111111');
INSERT INTO `erp_customer` VALUES ('2', '智慧云', '李', '0379-63233333', null, '西工区', '1411022133', '1', '1', '1413428538', '1', '1111111111');
INSERT INTO `erp_customer` VALUES ('3', 'zhang', '张', '0379-63233333', '0379-63260014', '西工区', '1411092302', '0', '1', '0', '4', '1111111111');
INSERT INTO `erp_customer` VALUES ('4', '网易', '网', '15867925589', '0379-63596521', '北京', '1411352953', '1', '1', '1413428545', '4', '1111111111');
INSERT INTO `erp_customer` VALUES ('5', '邙山苗圃', '孙经理', '0379-63233333', '0379-65368914', '涧西区', '1411443090', '1', '1', '1413438283', '5', '1111111111');
INSERT INTO `erp_customer` VALUES ('6', '花都服饰', '张总', '15736975858', '0379-63265519', '洛阳栾川', '1411443256', '1', '1', '1413441857', '6', '1111111111');
INSERT INTO `erp_customer` VALUES ('7', '锦城布艺', '赵经理', '0379-63260019', null, '伊川', '1411443372', '1', '1', '1413442117', '7', '1111111111');
INSERT INTO `erp_customer` VALUES ('8', '北京庆丰弹簧', '钱总', '0379-63233333', null, '北京朝阳区', '1411443461', '1', '1', '1413442476', '8', '1111111111');
INSERT INTO `erp_customer` VALUES ('9', '三门峡隆鑫商贸', '何女士', '13154968792', null, '三门峡', '1411443590', '1', '1', '1413515662', '9', '1111111111');
INSERT INTO `erp_customer` VALUES ('10', '刘波门业', '刘经理', '17958964525', '0379-63260014', '王城大\r\n\r\n道', '1411443670', '1', '1', '1413443113', '10', '1111111111');
INSERT INTO `erp_customer` VALUES ('11', '吉源商城', '李驰', '0379-63233333', '0379-63260014', '西工区', '1411443768', '1', '1', '1413429772', '11', '1111111111');
INSERT INTO `erp_customer` VALUES ('12', '三门峡机床', '李', '17958964525', '0379-63260014', '三门峡', '1411455803', '0', '1', '0', '12', '1111111111');
INSERT INTO `erp_customer` VALUES ('14', '是是是', '刘经理', '17958964525', '0379-63260019', '涧西区', '1411551423', '0', '1', '0', '14', '1111111111');
INSERT INTO `erp_customer` VALUES ('15', 'ewrqwerqwerq', '2435451345', '0379-63233333', '4', '洛阳市涧西\r\n\r\n区', '1411979027', '1', '1', '1413445691', '16', '1111111111');
INSERT INTO `erp_customer` VALUES ('16', '洛阳炘源晶光伏科技有限公司', '小夏', '14589657845', '0345-\r\n\r\n698562', '王城大道', '1413335090', '0', '1', '0', '17', '1111111111');
INSERT INTO `erp_customer` VALUES ('17', '三门峡鑫旺铝业有限公司', '贺总', '15739854652', '0379-\r\n\r\n698655', '紫金城', '1413336834', '0', '1', '1413423434', '15', '1111111111');
INSERT INTO `erp_customer` VALUES ('18', '洛阳九旭办公家具', '张总', '14589657845', '0345-69856236', '涧\r\n\r\n西区', '1413344044', '0', '1', '1413351597', '1', '1111111111');
INSERT INTO `erp_customer` VALUES ('20', '洛阳小于管道', '常经理', '15737928995', '0379-63269974', '洛阳涧西', '1416900079', '0', '1', '0', '4', '网站已做');
INSERT INTO `erp_customer` VALUES ('21', '洛阳佰工工业材料有限公司', '佰先生', '1689347678', '0379-65394588', '洛阳涧西区', '1417769306', '0', '1', '0', '1', '测试权限');
INSERT INTO `erp_customer` VALUES ('22', '测试', '测试', '1689487569', '0379-59687545', '洛阳', '1417769533', '0', '1', '0', '1', '测试');
INSERT INTO `erp_customer` VALUES ('23', '测试', '测试', '1689487569', '0379-59687545', '洛阳', '1417769601', '0', '1', '0', '1', '测试');
<<<<<<< HEAD
INSERT INTO `erp_customer` VALUES ('24', 'erp网络', 'erp', '789456123', '789456123', 'erp路', '1423116781', '0', '1', '0', '26', 'erp');
=======
<<<<<<< HEAD
INSERT INTO `erp_customer` VALUES ('24', 'erp网络', 'erp', '789456123', '789456123', 'erp路', '1423116781', '0', '1', '0', '26', 'erp');
=======
>>>>>>> 39a32b55aa1bce646f64cd3e774a205cda91af28
>>>>>>> ef0add2d1cd09f4bc251842f1eca6e0044df7d75

-- ----------------------------
-- Table structure for `erp_customer_visit`
-- ----------------------------
DROP TABLE IF EXISTS `erp_customer_visit`;
CREATE TABLE `erp_customer_visit` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cust_id` int(10) unsigned NOT NULL COMMENT '客户ID',
  `user_id` int(10) unsigned NOT NULL COMMENT '员工ID',
  `content` text COMMENT '拜访内容',
  `visit_time` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='拜访记录表';

-- ----------------------------
-- Records of erp_customer_visit
-- ----------------------------
INSERT INTO `erp_customer_visit` VALUES ('1', '1', '0', '洛阳万谦网络科技有限公司', null);
INSERT INTO `erp_customer_visit` VALUES ('2', '1', '0', '洛阳万谦网络科技有限公司洛阳万谦网络科技有限公司\r\n\r\n', null);
INSERT INTO `erp_customer_visit` VALUES ('3', '1', '0', '测试数据', null);
INSERT INTO `erp_customer_visit` VALUES ('4', '1', '1', '', null);
INSERT INTO `erp_customer_visit` VALUES ('5', '1', '1', 'ceshi', null);
INSERT INTO `erp_customer_visit` VALUES ('6', '1', '1', '测试', null);
INSERT INTO `erp_customer_visit` VALUES ('7', '4', '1', '网易拜访情况', null);
INSERT INTO `erp_customer_visit` VALUES ('8', '16', '1', '洛阳炘源晶光伏科技有限公司', '1413342627');
INSERT INTO `erp_customer_visit` VALUES ('9', '18', '17', '测试拜访', '1413353068');
INSERT INTO `erp_customer_visit` VALUES ('10', '2', '1', '智慧云', '1413355398');
INSERT INTO `erp_customer_visit` VALUES ('11', '5', '1', '网站已做', '1413355464');
INSERT INTO `erp_customer_visit` VALUES ('12', '7', '12', '锦城布艺', '1413355546');
INSERT INTO `erp_customer_visit` VALUES ('13', '6', '10', '花都服饰', '1413355595');
INSERT INTO `erp_customer_visit` VALUES ('14', '4', '7', '网易拜访', '1413355662');
INSERT INTO `erp_customer_visit` VALUES ('15', '19', '1', '洛阳万谦网络科技有限公司三门峡分公司', '1413356774');
INSERT INTO `erp_customer_visit` VALUES ('16', '5', '10', '邙山苗圃', '1413357787');
INSERT INTO `erp_customer_visit` VALUES ('17', '19', '1', '测试', '1413361394');
INSERT INTO `erp_customer_visit` VALUES ('18', '5', '9', '惆怅长岑长', '1413361431');
INSERT INTO `erp_customer_visit` VALUES ('19', '11', '7', 'ceshi ', '1413438939');
INSERT INTO `erp_customer_visit` VALUES ('20', '8', '11', '北京庆丰弹簧', '1413442571');
INSERT INTO `erp_customer_visit` VALUES ('21', '10', '9', 'liubo', '1413443228');
INSERT INTO `erp_customer_visit` VALUES ('22', '15', '1', 'dd', '1413445721');
INSERT INTO `erp_customer_visit` VALUES ('23', '17', '1', '有意向', '1415694898');
INSERT INTO `erp_customer_visit` VALUES ('24', '20', '1', '已经拜访过', '1417166238');
INSERT INTO `erp_customer_visit` VALUES ('25', '3', '1', '已拜访', '1417223863');
INSERT INTO `erp_customer_visit` VALUES ('26', '1', '38', '1', '1423453505');

-- ----------------------------
-- Table structure for `erp_depart`
-- ----------------------------
DROP TABLE IF EXISTS `erp_depart`;
CREATE TABLE `erp_depart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属部门ID',
  `class` tinyint(1) NOT NULL DEFAULT '0' COMMENT '部门类型 1-销售 2-客服 3-产品客服 4-技术部',
  `name` varchar(32) NOT NULL COMMENT '部门名称',
  `sort` tinyint(4) DEFAULT '100' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '-1:删除 0:禁用 1:正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='部门; 通过class来区别不同类型的部门, 不同\r\n\r\n类型的部门, 管理的数据表不同';

-- ----------------------------
-- Records of erp_depart
-- ----------------------------
INSERT INTO `erp_depart` VALUES ('1', '0', '4', '技术部', '100', '1');
INSERT INTO `erp_depart` VALUES ('2', '11', '3', '网站客服部', '100', '1');
INSERT INTO `erp_depart` VALUES ('3', '1', '4', '网页设计组', '100', '1');
INSERT INTO `erp_depart` VALUES ('4', '12', '1', '销售四部', '100', '-1');
INSERT INTO `erp_depart` VALUES ('5', '1', '4', '网页设计组', '100', '1');
INSERT INTO `erp_depart` VALUES ('6', '6', '5', '综合部', '100', '1');
INSERT INTO `erp_depart` VALUES ('7', '12', '1', '销售一部', '100', '1');
INSERT INTO `erp_depart` VALUES ('8', '12', '1', '销售二部', '100', '1');
INSERT INTO `erp_depart` VALUES ('9', '1', '4', '美工组', '100', '1');
INSERT INTO `erp_depart` VALUES ('10', '11', '3', '产品客服部', '100', '1');
INSERT INTO `erp_depart` VALUES ('11', '0', '2', '客服部', '100', '1');
INSERT INTO `erp_depart` VALUES ('12', '0', '1', '销售部', '100', '1');
INSERT INTO `erp_depart` VALUES ('13', '12', '1', '销售三部', '100', '1');
INSERT INTO `erp_depart` VALUES ('14', '14', '0', '1111111', '100', '-1');
INSERT INTO `erp_depart` VALUES ('15', '12', '0', '三门峡分公司', '100', '1');
INSERT INTO `erp_depart` VALUES ('16', '16', '0', '111', '100', '-1');

-- ----------------------------
-- Table structure for `erp_depart_mission`
-- ----------------------------
DROP TABLE IF EXISTS `erp_depart_mission`;
CREATE TABLE `erp_depart_mission` (
  `depart_id` int(10) NOT NULL COMMENT '部门id',
  `mission_date` int(10) NOT NULL COMMENT '任务的时间',
  `task` int(10) DEFAULT NULL COMMENT '部门任务',
  `update_time` varchar(32) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`depart_id`,`mission_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门任务表';

-- ----------------------------
-- Records of erp_depart_mission
-- ----------------------------
INSERT INTO `erp_depart_mission` VALUES ('0', '201301', null, '0');
INSERT INTO `erp_depart_mission` VALUES ('1', '201301', '2', null);
INSERT INTO `erp_depart_mission` VALUES ('1', '201501', '100000', '1423531641');
INSERT INTO `erp_depart_mission` VALUES ('2', '201301', '70000', null);
INSERT INTO `erp_depart_mission` VALUES ('3', '201301', '35000', '1422844158');
INSERT INTO `erp_depart_mission` VALUES ('4', '201301', '0', '1422863802');
INSERT INTO `erp_depart_mission` VALUES ('5', '201301', '3000', null);
INSERT INTO `erp_depart_mission` VALUES ('6', '201301', '30000', '1422857787');
INSERT INTO `erp_depart_mission` VALUES ('7', '201301', '30000', null);
INSERT INTO `erp_depart_mission` VALUES ('8', '201301', '30000', null);
INSERT INTO `erp_depart_mission` VALUES ('9', '201301', '30000', '0');
INSERT INTO `erp_depart_mission` VALUES ('10', '201301', '3000', null);
INSERT INTO `erp_depart_mission` VALUES ('13', '201301', '30000', null);

-- ----------------------------
-- Table structure for `erp_depart_mission`
-- ----------------------------
DROP TABLE IF EXISTS `erp_depart_mission`;
CREATE TABLE `erp_depart_mission` (
  `depart_id` int(10) NOT NULL COMMENT '部门id',
  `mission_date` int(10) NOT NULL COMMENT '任务的时间',
  `task` int(10) DEFAULT NULL COMMENT '部门任务',
  `update_time` varchar(32) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`depart_id`,`mission_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门任务表';

-- ----------------------------
-- Records of erp_depart_mission
-- ----------------------------
INSERT INTO `erp_depart_mission` VALUES ('0', '201301', null, '0');
INSERT INTO `erp_depart_mission` VALUES ('1', '201301', '60000', null);
INSERT INTO `erp_depart_mission` VALUES ('2', '201301', '70000', null);
INSERT INTO `erp_depart_mission` VALUES ('3', '201301', '35000', '1422844158');
INSERT INTO `erp_depart_mission` VALUES ('4', '201301', '0', '1422863802');
INSERT INTO `erp_depart_mission` VALUES ('5', '201301', '3000', null);
INSERT INTO `erp_depart_mission` VALUES ('6', '201301', '30000', '1422857787');
INSERT INTO `erp_depart_mission` VALUES ('7', '201301', '30000', null);
INSERT INTO `erp_depart_mission` VALUES ('8', '201301', '30000', null);
INSERT INTO `erp_depart_mission` VALUES ('9', '201301', '30000', '0');
INSERT INTO `erp_depart_mission` VALUES ('10', '201301', '3000', null);
INSERT INTO `erp_depart_mission` VALUES ('13', '201301', '30000', null);

-- ----------------------------
-- Table structure for `erp_develop_order`
-- ----------------------------
DROP TABLE IF EXISTS `erp_develop_order`;
CREATE TABLE `erp_develop_order` (
  `order_id` int(10) unsigned NOT NULL COMMENT '订单ID',
  `remark` text COMMENT '制作要求',
  `start_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `finish_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '完成时间',
  `check` tinyint(1) NOT NULL DEFAULT '0' COMMENT '-1:拒绝 0:待审 >1:通过',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '-1:删除 0:禁用 1:正常'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='开发-订单池; 由技术部来管理 , 分配制作人员';

-- ----------------------------
-- Records of erp_develop_order
-- ----------------------------
INSERT INTO `erp_develop_order` VALUES ('3', null, '0', '0', '0', '1', '1');
INSERT INTO `erp_develop_order` VALUES ('4', null, '0', '0', '0', '1', '1');
INSERT INTO `erp_develop_order` VALUES ('5', null, '0', '0', '0', '0', '1');
INSERT INTO `erp_develop_order` VALUES ('1', null, '0', '0', '0', '0', '1');
INSERT INTO `erp_develop_order` VALUES ('14', null, '0', '0', '0', '0', '1');
INSERT INTO `erp_develop_order` VALUES ('21', null, '0', '0', '0', '1', '1');

-- ----------------------------
-- Table structure for `erp_develop_order_comment`
-- ----------------------------
DROP TABLE IF EXISTS `erp_develop_order_comment`;
CREATE TABLE `erp_develop_order_comment` (
  `order_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `post_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '提交时间',
  `content` text COMMENT '内容'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='开发-订单沟通记录表';

-- ----------------------------
-- Records of erp_develop_order_comment
-- ----------------------------
INSERT INTO `erp_develop_order_comment` VALUES ('1', '5', '0', '开发准备中');
INSERT INTO `erp_develop_order_comment` VALUES ('1', '7', '0', '开发准备中');
INSERT INTO `erp_develop_order_comment` VALUES ('1', '8', '0', '开发准备中');
INSERT INTO `erp_develop_order_comment` VALUES ('1', '5', '0', '开发中');
INSERT INTO `erp_develop_order_comment` VALUES ('1', '6', '0', '开发准备中');
INSERT INTO `erp_develop_order_comment` VALUES ('1', '8', '0', '结束');
INSERT INTO `erp_develop_order_comment` VALUES ('21', '5', '1417248427', '准备制作');
INSERT INTO `erp_develop_order_comment` VALUES ('21', '1', '1417598641', 'dfdssdff');
<<<<<<< HEAD
INSERT INTO `erp_develop_order_comment` VALUES ('1', '2', '1423530549', 'zheshi');
=======
>>>>>>> ef0add2d1cd09f4bc251842f1eca6e0044df7d75

-- ----------------------------
-- Table structure for `erp_develop_user`
-- ----------------------------
DROP TABLE IF EXISTS `erp_develop_user`;
CREATE TABLE `erp_develop_user` (
  `order_id` int(10) unsigned NOT NULL COMMENT '订单ID',
  `user_id` int(10) unsigned NOT NULL COMMENT '员工ID',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '获得的总业绩',
  `finish_rate` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '完成率',
  `update_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '完成率更新时间',
  PRIMARY KEY (`order_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='开发 人员表';

-- ----------------------------
-- Records of erp_develop_user
-- ----------------------------
INSERT INTO `erp_develop_user` VALUES ('1', '5', '5002.00', '0', '0');
INSERT INTO `erp_develop_user` VALUES ('1', '7', '5002.00', '0', '0');
INSERT INTO `erp_develop_user` VALUES ('2', '5', '10000.00', '0', '0');
INSERT INTO `erp_develop_user` VALUES ('2', '6', '10000.00', '0', '0');
INSERT INTO `erp_develop_user` VALUES ('2', '7', '10000.00', '0', '0');
INSERT INTO `erp_develop_user` VALUES ('2', '8', '10000.00', '0', '0');
INSERT INTO `erp_develop_user` VALUES ('2', '9', '10000.00', '0', '0');
INSERT INTO `erp_develop_user` VALUES ('2', '10', '10000.00', '0', '0');
INSERT INTO `erp_develop_user` VALUES ('3', '5', '4000.00', '0', '0');
INSERT INTO `erp_develop_user` VALUES ('3', '15', '4000.00', '0', '0');
INSERT INTO `erp_develop_user` VALUES ('4', '5', '5000.00', '0', '0');
INSERT INTO `erp_develop_user` VALUES ('4', '6', '5000.00', '0', '0');
INSERT INTO `erp_develop_user` VALUES ('4', '7', '5000.00', '0', '0');
INSERT INTO `erp_develop_user` VALUES ('4', '8', '5000.00', '0', '0');
INSERT INTO `erp_develop_user` VALUES ('4', '15', '5000.00', '0', '0');
INSERT INTO `erp_develop_user` VALUES ('5', '5', '24135.00', '0', '0');
INSERT INTO `erp_develop_user` VALUES ('5', '6', '24135.00', '0', '0');
INSERT INTO `erp_develop_user` VALUES ('5', '7', '24135.00', '0', '0');
INSERT INTO `erp_develop_user` VALUES ('5', '8', '24135.00', '0', '0');
INSERT INTO `erp_develop_user` VALUES ('8', '5', '41524.00', '0', '0');
INSERT INTO `erp_develop_user` VALUES ('10', '5', '6.00', '0', '0');
INSERT INTO `erp_develop_user` VALUES ('10', '7', '6.00', '0', '0');
INSERT INTO `erp_develop_user` VALUES ('21', '4', '5000.00', '0', '0');
INSERT INTO `erp_develop_user` VALUES ('21', '15', '5000.00', '0', '0');

-- ----------------------------
-- Table structure for `erp_domain`
-- ----------------------------
DROP TABLE IF EXISTS `erp_domain`;
CREATE TABLE `erp_domain` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cust_id` int(10) unsigned NOT NULL COMMENT '所属客户ID',
  `domain` varchar(255) NOT NULL COMMENT '域名',
  `service` varchar(255) DEFAULT NULL COMMENT '域名运营商',
  `reg_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `expired_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '过期时间',
  `check` tinyint(1) NOT NULL DEFAULT '0' COMMENT '-1:拒绝 0:待审 >1:通过',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '-1:删除 0:禁用 1:正常',
  `check_time` varchar(32) DEFAULT '0' COMMENT '审核通过时间',
  `doamin_user` tinyint(4) DEFAULT '0' COMMENT '0域名属于公司，1域名属于客户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='域名库';

-- ----------------------------
-- Records of erp_domain
-- ----------------------------
INSERT INTO `erp_domain` VALUES ('1', '15', 'wanqian.net', '新网互联', '1413273127', '1476345127', '1', '1', '1413273140', '0');
INSERT INTO `erp_domain` VALUES ('2', '18', 'jiuxu.com', '新网互联', '1413353363', '1476425363', '1', '1', '1413363270', '0');
INSERT INTO `erp_domain` VALUES ('3', '19', 'wanqian.com', '新网互联', '1413356899', '1476428899', '1', '1', '1413363634', '0');
INSERT INTO `erp_domain` VALUES ('4', '2', 'zhihuiyun.com', '新网互联', '1413357747', '1476429747', '1', '1', '1417574161', '0');
INSERT INTO `erp_domain` VALUES ('5', '5', 'mangshan.com', '新网互联', '1413357860', '1444893860', '1', '1', '1413532376', '0');
INSERT INTO `erp_domain` VALUES ('6', '4', 'wangyi.com', '新网互联', '1413357882', '1476429882', '1', '-1', '1413362983', '0');
INSERT INTO `erp_domain` VALUES ('7', '11', 'jiyuan.com', '中资源', '1413439007', '1444975007', '1', '1', '1413439911', '1');
INSERT INTO `erp_domain` VALUES ('8', '6', 'huadu.com', '新网互联', '1413441899', '1444977899', '0', '1', '0', '0');
INSERT INTO `erp_domain` VALUES ('9', '8', 'qingfeng.com', '新网互联', '1413442891', '1444978891', '0', '1', '0', '0');
INSERT INTO `erp_domain` VALUES ('10', '7', 'jinchengbuyi.com', '新网互联', '1413443047', '1444979047', '0', '1', '0', '0');
INSERT INTO `erp_domain` VALUES ('11', '10', 'liubo.net', '中资源', '1413443347', '1444979347', '0', '1', '0', '1');
INSERT INTO `erp_domain` VALUES ('12', '17', 'smxxwly.com', '中资源', '1415695130', '1541839130', '1', '1', '1416817761', '0');
INSERT INTO `erp_domain` VALUES ('13', '14', 'shi.com', '新网互联', '1417240664', '1448776664', '1', '1', '1417240677', '0');

-- ----------------------------
-- Table structure for `erp_domain_renewal`
-- ----------------------------
DROP TABLE IF EXISTS `erp_domain_renewal`;
CREATE TABLE `erp_domain_renewal` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domain_id` int(10) unsigned NOT NULL COMMENT '所属域名ID',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '续费金额',
  `org_expired_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '原过期时间',
  `new_expired_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '新过期时间',
  `pay_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '付款时间',
  `check_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '审核时间',
  `check` tinyint(1) NOT NULL DEFAULT '0' COMMENT '-1:拒绝 0:待审 >1:通过',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '-1:删除 0:禁用 1:正常',
  `user_id` int(10) DEFAULT NULL COMMENT '续费申请人id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='域名续费记录表';

-- ----------------------------
-- Records of erp_domain_renewal
-- ----------------------------
INSERT INTO `erp_domain_renewal` VALUES ('1', '1', '600.00', '1444809127', '1476345127', '1413363028', '1413363028', '1', '1', '0');
INSERT INTO `erp_domain_renewal` VALUES ('2', '6', '600.00', '1444893882', '1476429882', '1413443447', '1413443447', '1', '1', '0');
INSERT INTO `erp_domain_renewal` VALUES ('3', '2', '600.00', '1444889363', '1476425363', '1413443663', '1413443663', '1', '1', '16');
INSERT INTO `erp_domain_renewal` VALUES ('4', '2', '600.00', '1444889363', '1476425363', '1413443659', '1413443659', '1', '1', '16');
INSERT INTO `erp_domain_renewal` VALUES ('5', '3', '600.00', '1444892899', '1476428899', '1413443659', '1417597609', '1', '1', '17');
INSERT INTO `erp_domain_renewal` VALUES ('6', '3', '3000.00', '1413356899', '1444892899', '1416931200', '1416970070', '1', '1', '5');
INSERT INTO `erp_domain_renewal` VALUES ('7', '4', '150.00', '1444893747', '1476429747', '', '1417597935', '1', '1', '5');
INSERT INTO `erp_domain_renewal` VALUES ('8', '12', '800.00', '1447231130', '1541839130', '', '1417598174', '1', '1', '5');

-- ----------------------------
-- Table structure for `erp_order`
-- ----------------------------
DROP TABLE IF EXISTS `erp_order`;
CREATE TABLE `erp_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL COMMENT '签单员工ID',
  `cust_id` int(10) unsigned NOT NULL COMMENT '所属客户ID',
  `prod_id` int(10) unsigned NOT NULL COMMENT '所属产品ID',
  `total_fees` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单总金额',
  `remark` text COMMENT '备注',
  `expired_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '到期时间',
  `signed_time` varchar(10) NOT NULL COMMENT '签单日期',
  `check` tinyint(1) NOT NULL DEFAULT '0' COMMENT '-1:拒绝 0:待审 >1:通过',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '-1:删除 0:禁用 1:正常',
  `time_limit` int(10) DEFAULT NULL COMMENT '订单期限',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='订单表; 财务审核后, 由签单人员和签单部门\r\n\r\n来 决定 此订单分配至 哪个订单户池';

-- ----------------------------
-- Records of erp_order
-- ----------------------------
INSERT INTO `erp_order` VALUES ('1', '2', '1', '6', '5002.00', '无', '1510021967', '1415413967', '1', '1', null);
INSERT INTO `erp_order` VALUES ('2', '2', '1', '6', '10000.00', '无', '1510021967', '1415413967', '1', '0', null);
INSERT INTO `erp_order` VALUES ('3', '4', '2', '6', '4000.00', '无', '1510021967', '1415413967', '1', '0', null);
INSERT INTO `erp_order` VALUES ('4', '4', '3', '6', '5000.00', '无', '1510021967', '1415413967', '1', '1', null);
INSERT INTO `erp_order` VALUES ('5', '4', '4', '6', '24135.00', '无', '1510021967', '1415413967', '1', '1', null);
INSERT INTO `erp_order` VALUES ('8', '4', '1', '6', '41524.00', '无', '1510021967', '1415413967', '1', '1', null);
INSERT INTO `erp_order` VALUES ('9', '4', '2', '3', '54545.00', '无', '1510021967', '1415413967', '1', '1', null);
INSERT INTO `erp_order` VALUES ('10', '4', '2', '6', '6.00', '无', '1510021967', '1415413967', '1', '1', null);
INSERT INTO `erp_order` VALUES ('11', '4', '3', '6', '3252.00', '无', '1510021967', '1415413967', '1', '1', null);
INSERT INTO `erp_order` VALUES ('13', '12', '14', '1', '5000.00', 's', '1510021967', '1415413967', '1', '1', null);
INSERT INTO `erp_order` VALUES ('14', '12', '14', '1', '5000.00', 's', '1510021967', '1415413967', '1', '1', null);
INSERT INTO `erp_order` VALUES ('15', '12', '15', '3', '5000.00', 'afgafgqrgqerg', '1510021967', '1415413967', '1', '1', null);
INSERT INTO `erp_order` VALUES ('16', '0', '0', '0', '0.00', null, '1510021967', '1415413967', '0', '1', null);
INSERT INTO `erp_order` VALUES ('17', '0', '0', '0', '0.00', null, '1510021967', '1415413967', '0', '1', null);
INSERT INTO `erp_order` VALUES ('18', '12', '18', '1', '1000.00', '域名未注册', '1510021967', '1415413967', '1', '1', null);
INSERT INTO `erp_order` VALUES ('19', '12', '19', '1', '1000.00', '', '1510021967', '1415413967', '0', '1', null);
INSERT INTO `erp_order` VALUES ('20', '12', '1', '1', '1000.00', '', '1510021967', '1415413967', '0', '1', null);
INSERT INTO `erp_order` VALUES ('21', '12', '10', '1', '5000.00', '组织者', '1510021960', '1415413967', '1', '1', '1');
INSERT INTO `erp_order` VALUES ('22', '12', '1', '1', '0.00', '', '1510021967', '1415413967', '0', '1', '1');
INSERT INTO `erp_order` VALUES ('23', '12', '1', '1', '0.00', '', '1510021967', '1415413967', '1', '1', '1');
INSERT INTO `erp_order` VALUES ('24', '12', '1', '1', '0.00', '', '1510021967', '1415413967', '0', '1', '1');
INSERT INTO `erp_order` VALUES ('25', '12', '6', '4', '5000.00', '111', '1510021967', '1415413967', '1', '1', '5');
INSERT INTO `erp_order` VALUES ('26', '12', '12', '1', '5000.00', '当当当', '1510021967', '1415413967', '1', '1', '2');
INSERT INTO `erp_order` VALUES ('27', '0', '3', '2', '5000.00', '', '1510021967', '1415413967', '0', '1', '3');
INSERT INTO `erp_order` VALUES ('28', '1', '11', '1', '1000.00', '', '1510021967', '1415413967', '1', '1', '1');
INSERT INTO `erp_order` VALUES ('29', '1', '7', '1', '1000.00', '', '1510021967', '1415413967', '1', '1', '1');
INSERT INTO `erp_order` VALUES ('30', '11', '8', '2', '1000.00', '', '1446863567', '1415413967', '1', '1', '1');
INSERT INTO `erp_order` VALUES ('32', '7', '2', '4', '1000.00', '测试跳转', '1510021967', '1415413967', '1', '1', '1');
INSERT INTO `erp_order` VALUES ('33', '5', '5', '3', '1001.00', '', '1446863567', '1415413967', '1', '1', '3');
INSERT INTO `erp_order` VALUES ('34', '1', '17', '1', '3000.00', '已签', '1447231082', '1415695082', '1', '1', '1');
INSERT INTO `erp_order` VALUES ('35', '1', '20', '1', '3000.00', '合同已签', '1448702839', '1417166839', '0', '1', '1');
INSERT INTO `erp_order` VALUES ('36', '1', '11', '1', '3000.00', '', '1448762575', '1417226575', '0', '1', '1');
INSERT INTO `erp_order` VALUES ('37', '1', '4', '1', '3000.00', '', '1511834654', '1417226654', '0', '1', '1');
INSERT INTO `erp_order` VALUES ('38', '9', '5', '3', '1000.00', '已签', '1417227239', '1417227239', '0', '1', '1');
INSERT INTO `erp_order` VALUES ('39', '12', '10', '6', '3000.00', '', '1448785001', '1417249001', '1', '1', '1');
INSERT INTO `erp_order` VALUES ('40', '1', '1', '1', '0.00', '', '1455065431', '1423529431', '0', '1', '1');
INSERT INTO `erp_order` VALUES ('41', '1', '1', '1', '2000.00', '', '1455065742', '1423529742', '1', '1', '1');

-- ----------------------------
-- Table structure for `erp_order_depart`
-- ----------------------------
DROP TABLE IF EXISTS `erp_order_depart`;
CREATE TABLE `erp_order_depart` (
  `order_id` int(10) unsigned NOT NULL,
  `depart_id` int(10) unsigned NOT NULL,
  `last_depart_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上一个经手的部门',
  `is_use` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否应用中 0否 1是; 每个order只能有一条记录为1',
  `create_time` varchar(32) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`,`depart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单-部门 关系表; 记录订单现在处于哪个部门的工作流程中';

-- ----------------------------
-- Records of erp_order_depart
-- ----------------------------

-- ----------------------------
-- Table structure for `erp_order_domain`
-- ----------------------------
DROP TABLE IF EXISTS `erp_order_domain`;
CREATE TABLE `erp_order_domain` (
  `order_id` int(10) unsigned NOT NULL,
  `domain_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`order_id`,`domain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单 域名 关系表';

-- ----------------------------
-- Records of erp_order_domain
-- ----------------------------
INSERT INTO `erp_order_domain` VALUES ('0', '13');
INSERT INTO `erp_order_domain` VALUES ('34', '12');

-- ----------------------------
-- Table structure for `erp_order_pay`
-- ----------------------------
DROP TABLE IF EXISTS `erp_order_pay`;
CREATE TABLE `erp_order_pay` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL COMMENT '所属订单ID',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '付款金额',
  `class` enum('2','1') NOT NULL DEFAULT '1' COMMENT '1-预付款; 2-余款',
  `check` tinyint(1) NOT NULL DEFAULT '0' COMMENT '-1:拒绝 0:待审 >1:通过',
  `pay_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '付款时间',
  `check_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '审核时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '-1:删除 0:禁用 1:正常',
  `user_id` int(11) NOT NULL COMMENT '业绩所属者',
  PRIMARY KEY (`id`)
<<<<<<< HEAD
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='订单付款记录(预付款,余款)';
=======
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='订单付款记录(预付款,余款)';
>>>>>>> ef0add2d1cd09f4bc251842f1eca6e0044df7d75

-- ----------------------------
-- Records of erp_order_pay
-- ----------------------------
INSERT INTO `erp_order_pay` VALUES ('1', '1', '1001.00', '1', '1', '1356969600', '1356969600', '1', '1');
INSERT INTO `erp_order_pay` VALUES ('2', '2', '2000.00', '2', '1', '1356969600', '1356969600', '1', '2');
INSERT INTO `erp_order_pay` VALUES ('3', '3', '56456700.00', '1', '1', '1356969600', '1356969600', '1', '3');
INSERT INTO `erp_order_pay` VALUES ('4', '4', '1324.00', '2', '1', '1356969600', '1356969600', '1', '4');
INSERT INTO `erp_order_pay` VALUES ('5', '5', '34.00', '2', '1', '1356969600', '1356969600', '1', '5');
INSERT INTO `erp_order_pay` VALUES ('6', '6', '23415.00', '1', '1', '1356969600', '1356969600', '1', '6');
INSERT INTO `erp_order_pay` VALUES ('7', '7', '4123.00', '1', '1', '1356969600', '1356969600', '1', '7');
INSERT INTO `erp_order_pay` VALUES ('8', '8', '300.00', '2', '1', '1356969600', '1356969600', '1', '8');
INSERT INTO `erp_order_pay` VALUES ('9', '9', '343.00', '1', '1', '1356969600', '1356969600', '1', '9');
INSERT INTO `erp_order_pay` VALUES ('10', '10', '34.00', '2', '1', '1356969600', '1356969600', '1', '10');
INSERT INTO `erp_order_pay` VALUES ('11', '33', '5000.00', '1', '0', '1356969600', '1356969600', '1', '1');
INSERT INTO `erp_order_pay` VALUES ('12', '0', '0.00', '2', '0', '1356969600', '1356969600', '1', '2');
INSERT INTO `erp_order_pay` VALUES ('13', '0', '0.00', '2', '0', '1356969600', '1356969600', '1', '3');
INSERT INTO `erp_order_pay` VALUES ('14', '0', '0.00', '2', '0', '1356969600', '1356969600', '1', '4');
INSERT INTO `erp_order_pay` VALUES ('15', '0', '0.00', '2', '0', '1356969600', '1356969600', '1', '5');
INSERT INTO `erp_order_pay` VALUES ('16', '0', '0.00', '2', '0', '1356969600', '1356969600', '1', '6');
INSERT INTO `erp_order_pay` VALUES ('17', '34', '1000.00', '1', '0', '1356969600', '1356969600', '1', '7');
INSERT INTO `erp_order_pay` VALUES ('18', '17', '3000.00', '2', '0', '1356969600', '1356969600', '1', '8');
INSERT INTO `erp_order_pay` VALUES ('19', '35', '1000.00', '1', '0', '1356969600', '1356969600', '1', '9');
INSERT INTO `erp_order_pay` VALUES ('20', '36', '1000.00', '1', '0', '1356969600', '1356969600', '1', '10');
INSERT INTO `erp_order_pay` VALUES ('21', '37', '1000.00', '1', '0', '1356969600', '1356969600', '1', '1');
INSERT INTO `erp_order_pay` VALUES ('22', '38', '1000.00', '1', '0', '1356969600', '1356969600', '1', '2');
INSERT INTO `erp_order_pay` VALUES ('23', '39', '2000.00', '1', '0', '1356969600', '1356969600', '1', '3');
<<<<<<< HEAD
INSERT INTO `erp_order_pay` VALUES ('24', '40', '0.00', '1', '0', '1423529431', '0', '1', '0');
INSERT INTO `erp_order_pay` VALUES ('25', '41', '100.00', '1', '0', '1423529742', '0', '1', '0');
=======
>>>>>>> ef0add2d1cd09f4bc251842f1eca6e0044df7d75

-- ----------------------------
-- Table structure for `erp_order_renewal`
-- ----------------------------
DROP TABLE IF EXISTS `erp_order_renewal`;
CREATE TABLE `erp_order_renewal` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL COMMENT '所属订单ID',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '续费金额',
  `org_expired_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '原过期时间',
  `new_expired_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '新过期时间',
  `pay_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '付款时间',
  `check_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '审核时间',
  `check` tinyint(1) NOT NULL DEFAULT '0' COMMENT '-1:拒绝 0:待审 >1:通过',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '-1:删除 0:禁用 1:正常',
  `remark` varchar(225) DEFAULT NULL COMMENT '备注',
  `ren_time` int(10) DEFAULT NULL COMMENT '续费年限',
  `user_id` int(11) DEFAULT NULL COMMENT '业绩所属者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='订单续费记录表';

-- ----------------------------
-- Records of erp_order_renewal
-- ----------------------------
INSERT INTO `erp_order_renewal` VALUES ('1', '2', '300.00', '2015-1-1', '1510021967', '0', '1417146898', '1', '1', null, null, '5');
INSERT INTO `erp_order_renewal` VALUES ('2', '3', '5000.00', '2015-1-1', '1510021967', '0', '1416812799', '1', '1', null, null, '6');
INSERT INTO `erp_order_renewal` VALUES ('3', '3', '5000.00', '2015-1-1', '1510021967', '1415671566', '1416812799', '1', '1', 'ty', '3', '7');
INSERT INTO `erp_order_renewal` VALUES ('4', '31', '1000.00', '2014-10-23', '1510021967', '1415671566', '1415670492', '1', '1', '测试', '1', '5');
INSERT INTO `erp_order_renewal` VALUES ('5', '2', '0.00', '1510021967', '1510021967', '1415671564', '1417146898', '1', '1', null, null, '6');
INSERT INTO `erp_order_renewal` VALUES ('6', '2', '0.00', '1510021967', '1510021967', '1415671565', '1417146898', '1', '1', null, null, '7');
INSERT INTO `erp_order_renewal` VALUES ('7', '2', '0.00', '1510021967', '1510021967', '1415671566', '1417146898', '1', '1', null, null, '5');
INSERT INTO `erp_order_renewal` VALUES ('8', '2', '0.00', '1510021967', '1510021967', '1415671567', '1417146898', '1', '1', null, null, '6');
INSERT INTO `erp_order_renewal` VALUES ('9', '30', '5000.00', '1415327567', '1446863567', '1417660065', '1417661599', '1', '1', '王晨东测试', '1', '6');
INSERT INTO `erp_order_renewal` VALUES ('10', '39', '5000.00', '1417249001', '1448785001', '1417660740', '1417663779', '1', '1', '王晨东测试\r\n', '1', '7');
INSERT INTO `erp_order_renewal` VALUES ('11', '39', '1001.00', '1417249001', '1448785001', '1417660758', '1417663779', '1', '1', '王晨东测试', '1', '6');
INSERT INTO `erp_order_renewal` VALUES ('12', '30', '110.00', '1415327567', '1446863567', '1417661583', '1417661599', '1', '1', '', '1', '5');
INSERT INTO `erp_order_renewal` VALUES ('13', '33', '5000.00', '1415327567', '1446863567', '1417661635', '1417661707', '1', '1', '王晨东测试', '1', '5');
INSERT INTO `erp_order_renewal` VALUES ('14', '33', '5000.00', '1415327567', '1509935567', '1417661690', '1417661707', '1', '1', '', '3', '6');
INSERT INTO `erp_order_renewal` VALUES ('15', '37', '3000.00', '1417226654', '1511834654', '1417661856', '1417661859', '1', '1', '', '3', '7');
INSERT INTO `erp_order_renewal` VALUES ('16', '39', '800.00', '1417249001', '1448785001', '1417663762', '1417663779', '1', '1', '', '1', '6');

-- ----------------------------
-- Table structure for `erp_product`
-- ----------------------------
DROP TABLE IF EXISTS `erp_product`;
CREATE TABLE `erp_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '产品名称',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '-1:删除 0:禁用 1:正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='产品库';

-- ----------------------------
-- Records of erp_product
-- ----------------------------
INSERT INTO `erp_product` VALUES ('1', '手工网站', '1');
INSERT INTO `erp_product` VALUES ('2', '生意宝1', '1');
INSERT INTO `erp_product` VALUES ('3', '智能建站', '1');
INSERT INTO `erp_product` VALUES ('4', '慧聪', '-1');
INSERT INTO `erp_product` VALUES ('5', '搜狗', '1');
INSERT INTO `erp_product` VALUES ('6', '关键词优化', '1');
INSERT INTO `erp_product` VALUES ('7', '赶集', '1');
INSERT INTO `erp_product` VALUES ('8', '手机网站', '0');
INSERT INTO `erp_product` VALUES ('9', '微信', '1');
INSERT INTO `erp_product` VALUES ('10', '一比多', '0');
INSERT INTO `erp_product` VALUES ('11', '推广', '1');

-- ----------------------------
-- Table structure for `erp_public_customer`
-- ----------------------------
DROP TABLE IF EXISTS `erp_public_customer`;
CREATE TABLE `erp_public_customer` (
  `cust_id` int(10) unsigned NOT NULL COMMENT '客户ID',
  `public_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '公开的时间',
  PRIMARY KEY (`cust_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公海客户';

-- ----------------------------
-- Records of erp_public_customer
-- ----------------------------
<<<<<<< HEAD
INSERT INTO `erp_public_customer` VALUES ('1', '1423529446');
=======
INSERT INTO `erp_public_customer` VALUES ('1', '1418284811');
>>>>>>> ef0add2d1cd09f4bc251842f1eca6e0044df7d75

-- ----------------------------
-- Table structure for `erp_seo_order`
-- ----------------------------
DROP TABLE IF EXISTS `erp_seo_order`;
CREATE TABLE `erp_seo_order` (
  `order_id` int(10) unsigned NOT NULL COMMENT '订单ID',
  `remark` text COMMENT '制作要求',
  `start_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `finish_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '完成时间',
  `check` tinyint(1) NOT NULL DEFAULT '0' COMMENT '-1:拒绝 0:待审 >1:通过',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '-1:删除 0:禁用 1:正常',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优化-订单池;  由产品客服部来管理 , 分配制作人员';

-- ----------------------------
-- Records of erp_seo_order
-- ----------------------------
INSERT INTO `erp_seo_order` VALUES ('1', null, '0', '0', '0', '0', '1');
INSERT INTO `erp_seo_order` VALUES ('2', null, '0', '0', '0', '0', '1');
INSERT INTO `erp_seo_order` VALUES ('3', null, '0', '0', '0', '0', '1');
INSERT INTO `erp_seo_order` VALUES ('10', null, '0', '0', '0', '1', '1');
INSERT INTO `erp_seo_order` VALUES ('39', null, '0', '0', '0', '1', '1');

-- ----------------------------
-- Table structure for `erp_seo_order_comment`
-- ----------------------------
DROP TABLE IF EXISTS `erp_seo_order_comment`;
CREATE TABLE `erp_seo_order_comment` (
  `order_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `post_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '提交时间',
  `content` text COMMENT '内容'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优化-订单沟通记录表';

-- ----------------------------
-- Records of erp_seo_order_comment
-- ----------------------------
INSERT INTO `erp_seo_order_comment` VALUES ('1', '9', '1417249731', '正在进行中');
INSERT INTO `erp_seo_order_comment` VALUES ('1', '10', '1417249731', '正在进行中');
INSERT INTO `erp_seo_order_comment` VALUES ('1', '11', '1417249731', '正在进行中');
INSERT INTO `erp_seo_order_comment` VALUES ('1', '12', '1417249731', '正在进行中');
INSERT INTO `erp_seo_order_comment` VALUES ('39', '18', '1417249731', '开始制作');

-- ----------------------------
-- Table structure for `erp_seo_user`
-- ----------------------------
DROP TABLE IF EXISTS `erp_seo_user`;
CREATE TABLE `erp_seo_user` (
  `order_id` int(10) unsigned NOT NULL COMMENT '订单ID',
  `user_id` int(10) unsigned NOT NULL COMMENT '员工ID',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '获得的总业绩',
  `finish_rate` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '完成率',
  `update_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '完成率更新时间',
  PRIMARY KEY (`order_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优化 人员表';

-- ----------------------------
-- Records of erp_seo_user
-- ----------------------------
INSERT INTO `erp_seo_user` VALUES ('1', '9', '5002.00', '0', '0');
INSERT INTO `erp_seo_user` VALUES ('2', '9', '10000.00', '0', '0');
INSERT INTO `erp_seo_user` VALUES ('2', '10', '10000.00', '0', '0');
INSERT INTO `erp_seo_user` VALUES ('2', '11', '10000.00', '0', '0');
INSERT INTO `erp_seo_user` VALUES ('2', '12', '10000.00', '0', '0');
INSERT INTO `erp_seo_user` VALUES ('3', '9', '4000.00', '0', '0');
INSERT INTO `erp_seo_user` VALUES ('4', '9', '5000.00', '0', '0');
INSERT INTO `erp_seo_user` VALUES ('5', '9', '24135.00', '0', '0');
INSERT INTO `erp_seo_user` VALUES ('8', '9', '41524.00', '0', '0');
INSERT INTO `erp_seo_user` VALUES ('10', '4', '6.00', '0', '0');
INSERT INTO `erp_seo_user` VALUES ('39', '18', '3000.00', '0', '0');

-- ----------------------------
-- Table structure for `erp_user`
-- ----------------------------
DROP TABLE IF EXISTS `erp_user`;
CREATE TABLE `erp_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account` varchar(32) NOT NULL COMMENT '帐号',
  `password` char(32) NOT NULL,
  `depart_id` int(10) unsigned NOT NULL COMMENT '所属部门ID',
  `realname` varchar(32) NOT NULL COMMENT '真实姓名',
  `sex` enum('0','1') NOT NULL DEFAULT '1' COMMENT '1男 0女',
  `position` varchar(32) NOT NULL COMMENT '职位',
  `startime` varchar(32) NOT NULL DEFAULT '0' COMMENT '入职时间',
  `birthday` varchar(32) DEFAULT '0' COMMENT '生日',
  `login_times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `last_login_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '上次登录时间',
  `last_login_ip` varchar(32) NOT NULL DEFAULT '0' COMMENT '上次登录IP',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '-1:删除 0:禁用 1:正常',
  PRIMARY KEY (`id`)
<<<<<<< HEAD
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COMMENT='员工表';
=======
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='员工表';
>>>>>>> ef0add2d1cd09f4bc251842f1eca6e0044df7d75

-- ----------------------------
-- Records of erp_user
-- ----------------------------
<<<<<<< HEAD
INSERT INTO `erp_user` VALUES ('1', 'admin', '6fa0446fa9335c25c3cf97b241210b35', '1', '超管', '1', '经理1               ', '1396886400', '724089600', '96', '1423529123', '2130706433', '1');
INSERT INTO `erp_user` VALUES ('2', 'wcd', 'a55e13ed476b60ccafaf60c6f9ab67ac', '1', '王晨东', '1', '', '', '', '4', '1423529173', '2130706433', '1');
INSERT INTO `erp_user` VALUES ('27', 'test', 'b05ba8b0a98c73e182b6341ab6d8999b', '6', '付影', '1', '测试 ', '1388764800', '1388764800', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('30', 'lina', '26e758a54193f4db69ac2527e688e492', '6', '李娜', '0', '人力资源经理', '1418227200', '', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('31', 'songnana', 'a258669d31e44d4804dd63bbd36e8c08', '7', '宋娜娜', '0', '主管', '1291046400', '943891200', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('32', 'sunyupeng', 'c07254894fd778273660c2648bab6df1', '13', '孙育鹏', '1', '主管', '', '943891200', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('34', 'jiayan', 'c75a2e8172aa6e53aa6d5b457f1688fd', '8', '贾燕', '0', '主管', '', '', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('35', 'guoxiao', '265de4f27daf3bce41a51b7889995e26', '2', '郭晓', '0', '主管', '943891200', '', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('36', 'lixuhao', '20eec87e63013b26c4447c4d93be688d', '10', '李旭豪', '1', '主管', '943891200', '943891200', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('37', 'yupeng', 'abb7c105f441e710f47bfe41a427e797', '1', '俞鹏鹏', '1', '组长', '943891200', '943891200', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('38', 'zyh', 'e41d657839d512cd160ca945065a2e96', '1', '赵玉花', '1', '   ', '', '', '2', '1423453002', '2130706433', '1');
INSERT INTO `erp_user` VALUES ('39', 'zhangyaohua', '28929d4904c275e8a33114b2bd85de73', '9', '张耀华', '1', '组长', '943891200', '943891200', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('40', 'suxiao', '4f41ad7aea8e5568e52519fb0afba423', '1', '苏晓', '0', '经理', '943891200', '943891200', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('41', 'weidongdong', '0a2766c3215a4b75d0c40d3bcceb94ed', '12', '魏冬冬', '1', '经理', '1423411200', '', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('42', 'haoxiangfei', '0c5d0865d0c7431431700f6b89f2562d', '7', '郝向飞', '0', '员工', '', '', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('43', 'liuwenlong', '554128f4ed908ba989ddcc81e7c4eb1c', '7', '刘文龙', '1', '员工', '', '', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('44', 'shiyingjie', 'ce027177c90b992667e08106eab10b72', '7', '史莹洁', '1', '员工', '', '1423411200', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('45', 'caojunjun', '6c2dc801f0b11d283152177054b0aa5d', '7', '曹君君', '1', '话务', '', '', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('46', 'zhaocong', '7f7d8839bd38de3fa04bd77e9f86d281', '8', '赵聪', '1', '员工', '', '', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('47', 'zhangzhaowei', '95c322c019cb44ab3a6a9226536554f1', '8', '张照伟', '1', '员工', '', '', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('48', 'dangyanan', 'f780f81c0fc2fa2dc9ea3ed45470176f', '8', '党亚楠', '0', '员工', '1423411200', '', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('49', 'xuewenliang', '9fa48890ffdb1ac14c301630d90a91db', '8', '薛文靓', '0', '话务', '1423411200', '1423411200', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('50', 'tangguicai', '9d4f8445f6b9ebb64686bc2a61651244', '13', '唐贵偲', '1', '员工', '1423411200', '1423411200', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('51', 'qiaoximing', 'b0f2720db73013189131fadb1d5dcf56', '13', '乔喜明', '1', '员工', '', '', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('52', 'liguopeng', '6dbf108ce8884b60ea9f58e08a864a84', '13', '李国鹏', '1', '员工', '', '', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('53', 'wanglili', 'f52a828c9364955c4fb5db968ee159ec', '13', '王莉莉', '0', '话务', '', '', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('54', 'zhangxirui', '6e0d3cea70ad3bb57ffe4f086f8eb200', '2', '张希瑞', '0', '客服', '1423411200', '1423411200', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('55', 'xiawenhua', '565920e433a74f79f2c13b017c380fdb', '2', '夏文华', '0', '客服', '1423411200', '1423411200', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('56', 'changyuling', 'bb72f7d7414bbc3309746f68f37199f9', '2', '常玉玲', '0', '客服', '', '', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('57', 'qiaojingjing', '7b05726a184d72b0859b97a4b898dd78', '2', '乔晶晶', '0', '客服', '1423411200', '1423411200', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('58', 'laifeiyan', '09144b5c0868f45cebe23a6f08b1f267', '10', '来飞燕', '0', '客服', '1423411200', '', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('59', 'liuhuijuan', '8c1a798f0b2b636d943fa883ba7e0adc', '10', '刘慧娟', '0', '客服', '1423411200', '1423411200', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('60', 'lilan', '7ffdf662c14727ced5a81691ef4bda9c', '10', '李兰', '0', '客服', '', '', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('61', 'wangmengting', '3fdff25ace9b592292f1644387cfad29', '10', '王梦婷', '0', '客服', '', '', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('62', 'zhangjie', 'ab0566c146a12df0b9739defca9c5030', '9', '章婕', '0', '美工', '', '', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('63', 'huangbeibei', '23faae9c8916b1a2ca3996a399abed27', '9', '黄蓓蓓', '0', '美工', '', '', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('64', 'duwenyao', '85ff899734b18c70279b8b3a082743f7', '9', '杜文耀', '1', '美工', '', '1423411200', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('65', 'xushichao', '1d287bbeef309217995be7aa640189ce', '3', '徐世超', '1', '网页设计', '', '', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('66', 'fengaimei', 'f80750403755041144b9119c7a1756d1', '5', '冯爱梅', '0', '网页设计', '', '', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('67', 'duanxiangyang', '791abb4cb8aa0f1fa8a2fcc086182131', '6', '段向阳', '0', '财务', '1423411200', '1423411200', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('68', 'lingranran', '750b0f0fbb3177f68f51f0382765c20b', '6', '凌冉冉', '0', '人事', '', '', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('69', 'maoguowei', '7f7d16e3deb45698b12fb7b8c8906874', '15', '毛国伟', '1', '经理', '1423411200', '', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('70', 'qinqinqin', 'df3d8c03321c7803244c2d0ffb4ca9d9', '15', '秦琴琴', '0', '财务', '', '', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('71', 'hexiaojuan', '97bc9e9f1af3d1cea085a8069cfc1081', '15', '贺小娟', '0', '客服', '1423411200', '1423411200', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('72', 'renge', '6b5b90cc0b6e3db34048d70fa2b76ef4', '15', '任歌', '0', '销售', '1423411200', '1423411200', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('73', 'yangningting', '1604d452eec3deb869ec05ba854e0f53', '15', '杨宁婷', '0', '销售', '1423411200', '1423411200', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('74', 'wanglulu', '73f9145771c2928d676391d3eaeee05b', '15', '王露露', '0', '销售', '1423411200', '', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('75', 'yaozhonglin', '8ad891ccf7b8feefd9edff83f4a1f5b4', '15', '姚仲琳', '1', '销售', '', '1423411200', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('76', 'miaomeng', '0ca1d67932537aac8b7b4bc6710b8cb7', '15', '苗猛', '1', '销售', '', '', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('77', 'shiwenjie', 'e11798609702872fa7de85f2c1cb6cca', '15', '史文杰', '1', '销售', '1423411200', '', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('78', 'caiwu', '9961af8e0c978c328236611e5dfae053', '6', '财务', '0', '', '', '', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('79', '', '6382e74572f01784f386363001fe919d', '1', '', '1', '', '', '', '0', '0', '0', '1');
=======
<<<<<<< HEAD
INSERT INTO `erp_user` VALUES ('1', 'admin', '6fa0446fa9335c25c3cf97b241210b35', '1', '超管', '1', '经理              ', '1396886400', '724089600', '87', '1423288857', '2130706433', '1');
INSERT INTO `erp_user` VALUES ('2', 'administrator', '045fb50834e755fc114df5df80f6bd39', '8', '超级管理员', '1', '销售专员     ', '1396972811', '724089611', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('4', 'test', 'b05ba8b0a98c73e182b6341ab6d8999b', '3', '测试人员', '0', '程序员', '1396972800', '724089600', '9', '1423293669', '2130706433', '1');
=======
INSERT INTO `erp_user` VALUES ('1', 'admin', '6fa0446fa9335c25c3cf97b241210b35', '1', '超管', '1', '经理            ', '1396886400', '724089600', '64', '1423028714', '2130706433', '1');
INSERT INTO `erp_user` VALUES ('2', 'administrator', '045fb50834e755fc114df5df80f6bd39', '8', '超级管理员', '1', '销售专员     ', '1396972811', '724089611', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('4', 'test', 'b05ba8b0a98c73e182b6341ab6d8999b', '3', '测试人员', '0', '程序员', '1396972800', '724089600', '8', '1418116016', '2130706433', '1');
>>>>>>> 39a32b55aa1bce646f64cd3e774a205cda91af28
INSERT INTO `erp_user` VALUES ('5', 'zhao', '496293362b7656ff1d8794cfc66247e9', '2', '赵', '1', '客服专员', '1396972800', '724089600', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('6', 'qian', '3722ada7bb681889ad1b3d0fd0171073', '3', '钱', '1', '程序组组长', '1396972800', '724089600', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('7', 'sun', '7364468c55215b419ebb47eea69aec3b', '2', '孙', '1', '网站客服主管', '1396972800', '724089600', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('8', 'lisike', '54b873aa1528b75a8426afa5afc533cb', '12', '李四可', '1', '销售部经理 ', '1396972800', '724089600', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('9', 'zhou', '4993099c65feb0bf3ae593dcf4aeb33e', '6', '周正康', '1', '综合部经理             ', '1396972800', '660931200', '0', '0', '0', '1');
<<<<<<< HEAD
INSERT INTO `erp_user` VALUES ('10', 'wu', '37058f63caa74c8465591194d643d38b', '7', '吴', '1', '销售一部主管', '1396972800', '724089600', '0', '0', '0', '0');
INSERT INTO `erp_user` VALUES ('11', 'zheng', '006c63a0bdcaa86ddaeade9d7b7a3a2f', '8', '郑', '0', '销售二部主管', '1396972800', '724089600', '0', '0', '0', '0');
=======
INSERT INTO `erp_user` VALUES ('10', 'wu', '37058f63caa74c8465591194d643d38b', '7', '吴', '1', '销售一部主管', '1396972800', '724089600', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('11', 'zheng', '006c63a0bdcaa86ddaeade9d7b7a3a2f', '8', '郑', '0', '销售二部主管', '1396972800', '724089600', '0', '0', '0', '1');
>>>>>>> 39a32b55aa1bce646f64cd3e774a205cda91af28
INSERT INTO `erp_user` VALUES ('12', 'wangwu', '3f72d54eade4979f1f43a811afcdc5c1', '9', '王五', '1', '美工组组长 ', '1396972800', '724089600', '1', '1418178486', '2130706433', '1');
INSERT INTO `erp_user` VALUES ('13', 'baidu', '2d1dca36b597fce3beba2fa1d7cf041b', '13', '百度', '1', '销售三部主管', '1396972800', '724089600', '3', '1418777778', '2130706433', '1');
INSERT INTO `erp_user` VALUES ('14', 'wangchendong', 'd105f73986b8287bdfaa0ff9b354fd5b', '3', 'wcd', '1', '程序员', '1396972800', '724089600', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('15', 'ccd', '8288db5658258ca31ac5c7c8fb6bfc72', '5', '愁肠断', '1', '网页设计组组长', '1396972800', '724089600', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('16', 'zhangsan', '0df533e21b78a0274a943de81d249331', '2', '张三', '1', '客服专员', '1396972800', '724089600', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('17', 'lisi', '6fa0446fa9335c25c3cf97b241210b35', '11', '李四', '0', '客服主管', '1396972800', '724089600', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('18', 'wangwu1', '3f72d54eade4979f1f43a811afcdc5c1', '10', '王五', '1', '优化编辑', '1396972800', '724089600', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('21', 'wcd', '4a2383425b471d8dd4dcd4ec94e60149', '1', '王晨东', '1', '程序员', '1396972811', '724089611', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('22', 'user', 'bcf186954019835a13b8750765a215a3', '8', 'user', '0', '销售专员', '1396972800', '724089600', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('23', 'jishuyuan', 'e7c880a82894ed41301fd61bdc14a7a9', '1', 'jushuyuan', '0', '程序员', '1396972800', '724089600', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('24', 'gongsun', '4038af7f629f3c63a860017449119d7f', '10', 'gongsun', '1', '产品客服主管 ', '1418313600', '725644800', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('25', 'zhaoyh', '2ed03053e250c182f4f276ad8f48bcd2', '7', 'zhaoyh', '0', '销售专员', '1396972800', '725644800', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('26', 'test', '6fa0446fa9335c25c3cf97b241210b35', '6', '测试', '1', '    测试 ', '1388505600', '1388505600', '21', '1423276588', '2130706433', '-1');
INSERT INTO `erp_user` VALUES ('27', 'test', 'b05ba8b0a98c73e182b6341ab6d8999b', '6', '测试人员', '1', '测试', '1388764800', '1388764800', '0', '0', '0', '1');
>>>>>>> ef0add2d1cd09f4bc251842f1eca6e0044df7d75

-- ----------------------------
-- Table structure for `erp_user_cust_apply`
-- ----------------------------
DROP TABLE IF EXISTS `erp_user_cust_apply`;
CREATE TABLE `erp_user_cust_apply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL COMMENT '申请人ID',
  `cust_id` int(10) unsigned NOT NULL COMMENT '客户ID',
  `class` enum('delay','new') DEFAULT 'new' COMMENT 'new-新申请 delay-延期',
  `apply_days` tinyint(4) NOT NULL COMMENT '申请天数',
  `agree_days` tinyint(4) NOT NULL DEFAULT '0' COMMENT '批准天数',
  `org_expired_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '原过期时间 0:永久',
  `new_expired_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '新过期时间 0:永久',
  `apply_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '申请的时间',
  `check_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '审核的时间',
  `check_user` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '审核人ID',
  `check` tinyint(1) NOT NULL DEFAULT '0' COMMENT '-1:拒绝 0:待审 >1:通过',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '-1:删除 0:禁用 1:正常',
  PRIMARY KEY (`id`)
<<<<<<< HEAD
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='员工-客户 权限申请记录';
=======
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='员工-客户 权限申请记录';
>>>>>>> ef0add2d1cd09f4bc251842f1eca6e0044df7d75

-- ----------------------------
-- Records of erp_user_cust_apply
-- ----------------------------
INSERT INTO `erp_user_cust_apply` VALUES ('1', '1', '1', 'new', '30', '0', '1423122409', '1425714409', '1423122409', '1423213363', '26', '1', '1');
<<<<<<< HEAD
INSERT INTO `erp_user_cust_apply` VALUES ('2', '1', '1', 'new', '30', '0', '1423213412', '1425805412', '1423213412', '1423470678', '2', '1', '1');
INSERT INTO `erp_user_cust_apply` VALUES ('3', '1', '1', 'new', '30', '0', '1423529407', '1426121407', '1423529407', '1423529410', '2', '1', '1');
=======
INSERT INTO `erp_user_cust_apply` VALUES ('2', '1', '1', 'new', '30', '0', '1423213412', '1425805412', '1423213412', '0', '0', '0', '1');
>>>>>>> ef0add2d1cd09f4bc251842f1eca6e0044df7d75

-- ----------------------------
-- Table structure for `erp_user_cust_prod`
-- ----------------------------
DROP TABLE IF EXISTS `erp_user_cust_prod`;
CREATE TABLE `erp_user_cust_prod` (
  `user_id` int(10) unsigned NOT NULL,
  `cust_id` int(10) unsigned NOT NULL,
  `prod_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '0:所有产品的权限',
  `expired_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '权限过期时间 0:永不过期',
  PRIMARY KEY (`user_id`,`cust_id`,`prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工-客户-产品 权限表; 用于销售,客服 拜访';

-- ----------------------------
-- Records of erp_user_cust_prod
-- ----------------------------
INSERT INTO `erp_user_cust_prod` VALUES ('0', '0', '0', '0');
<<<<<<< HEAD
=======
<<<<<<< HEAD
INSERT INTO `erp_user_cust_prod` VALUES ('1', '1', '0', '1425714409');
=======
>>>>>>> 39a32b55aa1bce646f64cd3e774a205cda91af28
>>>>>>> ef0add2d1cd09f4bc251842f1eca6e0044df7d75
INSERT INTO `erp_user_cust_prod` VALUES ('1', '2', '0', '1418206400');
INSERT INTO `erp_user_cust_prod` VALUES ('1', '18', '0', '1545926400');
INSERT INTO `erp_user_cust_prod` VALUES ('1', '21', '0', '0');
INSERT INTO `erp_user_cust_prod` VALUES ('1', '22', '0', '0');
INSERT INTO `erp_user_cust_prod` VALUES ('1', '23', '0', '1482336000');
INSERT INTO `erp_user_cust_prod` VALUES ('4', '3', '0', '1483027200');
INSERT INTO `erp_user_cust_prod` VALUES ('4', '4', '0', '0');
INSERT INTO `erp_user_cust_prod` VALUES ('4', '20', '0', '1419955200');
INSERT INTO `erp_user_cust_prod` VALUES ('5', '5', '0', '1419955200');
INSERT INTO `erp_user_cust_prod` VALUES ('6', '6', '0', '0');
INSERT INTO `erp_user_cust_prod` VALUES ('7', '7', '0', '1451491200');
INSERT INTO `erp_user_cust_prod` VALUES ('8', '8', '0', '0');
INSERT INTO `erp_user_cust_prod` VALUES ('9', '9', '0', '0');
INSERT INTO `erp_user_cust_prod` VALUES ('10', '10', '0', '0');
INSERT INTO `erp_user_cust_prod` VALUES ('11', '11', '0', '0');
INSERT INTO `erp_user_cust_prod` VALUES ('12', '12', '0', '1480435200');
INSERT INTO `erp_user_cust_prod` VALUES ('14', '14', '0', '0');
INSERT INTO `erp_user_cust_prod` VALUES ('15', '17', '0', '1482940800');
INSERT INTO `erp_user_cust_prod` VALUES ('16', '15', '0', '0');
INSERT INTO `erp_user_cust_prod` VALUES ('17', '16', '0', '0');
INSERT INTO `erp_user_cust_prod` VALUES ('26', '24', '0', '1423584000');

-- ----------------------------
-- Table structure for `erp_user_depart_mgr`
-- ----------------------------
DROP TABLE IF EXISTS `erp_user_depart_mgr`;
CREATE TABLE `erp_user_depart_mgr` (
  `user_id` int(10) unsigned NOT NULL,
  `depart_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`depart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工, 管理 部门 关系表';

-- ----------------------------
-- Records of erp_user_depart_mgr
-- ----------------------------
<<<<<<< HEAD
=======
INSERT INTO `erp_user_depart_mgr` VALUES ('6', '3');
INSERT INTO `erp_user_depart_mgr` VALUES ('7', '2');
INSERT INTO `erp_user_depart_mgr` VALUES ('8', '12');
INSERT INTO `erp_user_depart_mgr` VALUES ('9', '6');
INSERT INTO `erp_user_depart_mgr` VALUES ('10', '7');
INSERT INTO `erp_user_depart_mgr` VALUES ('11', '8');
INSERT INTO `erp_user_depart_mgr` VALUES ('12', '9');
INSERT INTO `erp_user_depart_mgr` VALUES ('13', '13');
>>>>>>> ef0add2d1cd09f4bc251842f1eca6e0044df7d75
INSERT INTO `erp_user_depart_mgr` VALUES ('15', '5');
INSERT INTO `erp_user_depart_mgr` VALUES ('17', '11');
INSERT INTO `erp_user_depart_mgr` VALUES ('30', '6');
INSERT INTO `erp_user_depart_mgr` VALUES ('31', '7');
INSERT INTO `erp_user_depart_mgr` VALUES ('32', '13');
INSERT INTO `erp_user_depart_mgr` VALUES ('34', '8');
INSERT INTO `erp_user_depart_mgr` VALUES ('35', '2');
INSERT INTO `erp_user_depart_mgr` VALUES ('36', '10');
INSERT INTO `erp_user_depart_mgr` VALUES ('37', '3');
INSERT INTO `erp_user_depart_mgr` VALUES ('39', '9');
INSERT INTO `erp_user_depart_mgr` VALUES ('41', '12');
INSERT INTO `erp_user_depart_mgr` VALUES ('69', '15');

-- ----------------------------
-- Table structure for `erp_valadd_comment`
-- ----------------------------
DROP TABLE IF EXISTS `erp_valadd_comment`;
CREATE TABLE `erp_valadd_comment` (
  `valadd_id` int(10) unsigned NOT NULL COMMENT '所属增值服务ID',
  `user_id` int(10) unsigned NOT NULL COMMENT '评论用户ID',
  `post_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '提交时间',
  `content` text COMMENT '内容'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='增值服务-沟通记录表';

-- ----------------------------
-- Records of erp_valadd_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `erp_valadd_order`
-- ----------------------------
DROP TABLE IF EXISTS `erp_valadd_order`;
CREATE TABLE `erp_valadd_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '增值服务主键ID',
  `user_id` int(10) unsigned NOT NULL COMMENT '销售人员ID',
  `cust_id` int(10) unsigned NOT NULL COMMENT '所属客户ID',
  `fees` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '费用',
  `remark` text COMMENT '制作要求',
  `start_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `finish_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '完成时间',
  `is_paid` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:未付款  1:已付款',
  `check` tinyint(1) NOT NULL DEFAULT '0' COMMENT '-1:拒绝 0:待审 >1:通过',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '-1:删除 0:禁用 1:正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户 增值服务池';

-- ----------------------------
-- Records of erp_valadd_order
-- ----------------------------

-- ----------------------------
-- Table structure for `erp_valadd_user`
-- ----------------------------
DROP TABLE IF EXISTS `erp_valadd_user`;
CREATE TABLE `erp_valadd_user` (
  `valadd_id` int(10) unsigned NOT NULL COMMENT '增值服务ID',
  `user_id` int(10) unsigned NOT NULL COMMENT '员工ID',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '获得的总业绩',
  `finish_rate` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '完成率',
  `update_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '完成率更新时间',
  PRIMARY KEY (`valadd_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='增值服务制作 人员表';

-- ----------------------------
-- Records of erp_valadd_user
-- ----------------------------

-- ----------------------------
-- Table structure for `erp_visit_prod`
-- ----------------------------
DROP TABLE IF EXISTS `erp_visit_prod`;
CREATE TABLE `erp_visit_prod` (
  `visit_id` int(10) unsigned NOT NULL COMMENT '所属拜访记录ID',
  `prod_id` int(10) unsigned NOT NULL COMMENT '所属产品ID',
  `content` text COMMENT '沟通内容',
  PRIMARY KEY (`visit_id`,`prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品沟通记录表';

-- ----------------------------
-- Records of erp_visit_prod
-- ----------------------------
INSERT INTO `erp_visit_prod` VALUES ('4', '1', '测试 添加沟通记录');
INSERT INTO `erp_visit_prod` VALUES ('5', '5', '');
INSERT INTO `erp_visit_prod` VALUES ('8', '1', '洛阳炘源晶光伏科技有限公司');
INSERT INTO `erp_visit_prod` VALUES ('9', '1', '测试测试');
INSERT INTO `erp_visit_prod` VALUES ('9', '2', '测试');
INSERT INTO `erp_visit_prod` VALUES ('10', '1', '智慧云');
INSERT INTO `erp_visit_prod` VALUES ('11', '1', '	邙山苗圃');
INSERT INTO `erp_visit_prod` VALUES ('12', '1', '有意向');
INSERT INTO `erp_visit_prod` VALUES ('13', '1', '有意向，需时间');
INSERT INTO `erp_visit_prod` VALUES ('14', '1', '有意向');
INSERT INTO `erp_visit_prod` VALUES ('15', '1', '洛阳万谦网络科技有限公司三门峡分公司');
INSERT INTO `erp_visit_prod` VALUES ('16', '1', '邙山苗圃');
INSERT INTO `erp_visit_prod` VALUES ('17', '1', '洛阳万谦网络科技有限公司三门峡分公司');
INSERT INTO `erp_visit_prod` VALUES ('18', '1', '才踩踩踩踩踩踩');
INSERT INTO `erp_visit_prod` VALUES ('19', '1', 'yiqian');
INSERT INTO `erp_visit_prod` VALUES ('20', '1', '有意向');
INSERT INTO `erp_visit_prod` VALUES ('21', '1', 'll');
INSERT INTO `erp_visit_prod` VALUES ('22', '1', 'dd');
INSERT INTO `erp_visit_prod` VALUES ('23', '1', '需要时间');
INSERT INTO `erp_visit_prod` VALUES ('24', '1', '有意向，跟进');
INSERT INTO `erp_visit_prod` VALUES ('25', '1', '有意向');

-- ----------------------------
-- Event structure for `test`
-- ----------------------------
DROP EVENT IF EXISTS `test`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `test` ON SCHEDULE EVERY 1 DAY STARTS '2014-08-12 00:00:01' ON COMPLETION PRESERVE DISABLE DO INSERT INTO `erp_user_cust_prod` VALUES (1,2,3,4)
;;
DELIMITER ;
