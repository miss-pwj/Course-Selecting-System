/*
MySQL Data Transfer
Source Host: localhost
Source Database: demo
Target Host: localhost
Target Database: demo
Date: 2019/6/27 23:25:52
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for course
-- ----------------------------
CREATE TABLE `course` (
  `classId` int(11) NOT NULL AUTO_INCREMENT,
  `className` varchar(200) NOT NULL,
  `classNum` int(11) NOT NULL,
  `teaId` int(11) NOT NULL,
  `classChooseNum` int(11) NOT NULL,
  PRIMARY KEY (`classId`)
) ENGINE=InnoDB AUTO_INCREMENT=1013 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for course_choose
-- ----------------------------
CREATE TABLE `course_choose` (
  `chooseId` int(11) NOT NULL AUTO_INCREMENT,
  `stuId` int(11) NOT NULL,
  `classId` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`chooseId`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for course_limit
-- ----------------------------
CREATE TABLE `course_limit` (
  `limitId` int(11) NOT NULL AUTO_INCREMENT,
  `classId` int(11) NOT NULL,
  `insId` int(11) NOT NULL,
  PRIMARY KEY (`limitId`)
) ENGINE=InnoDB AUTO_INCREMENT=1019 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for institution
-- ----------------------------
CREATE TABLE `institution` (
  `insId` int(11) NOT NULL AUTO_INCREMENT,
  `insName` varchar(200) NOT NULL,
  PRIMARY KEY (`insId`)
) ENGINE=InnoDB AUTO_INCREMENT=1006 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for student
-- ----------------------------
CREATE TABLE `student` (
  `stuId` int(11) NOT NULL,
  `stuName` varchar(200) NOT NULL,
  `stuPass` varchar(200) NOT NULL,
  `insId` int(11) DEFAULT NULL,
  `insName` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`stuId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
CREATE TABLE `teacher` (
  `teaId` int(11) NOT NULL,
  `teaName` varchar(200) NOT NULL,
  `teaPass` varchar(200) NOT NULL,
  PRIMARY KEY (`teaId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `course` VALUES ('1001', 'c语言程序设计', '5', '2018100001', '2');
INSERT INTO `course` VALUES ('1002', '宏观经济学', '3', '2018100002', '3');
INSERT INTO `course` VALUES ('1004', 'java程序设计', '4', '2018100001', '1');
INSERT INTO `course` VALUES ('1005', '市场营销学', '6', '2018100002', '3');
INSERT INTO `course` VALUES ('1006', '大学英语', '3', '2018100003', '2');
INSERT INTO `course` VALUES ('1007', '大学英语', '3', '2018100003', '2');
INSERT INTO `course` VALUES ('1008', '高等数学', '6', '2018100004', '1');
INSERT INTO `course` VALUES ('1010', '长虹剑法第九重', '7', '2018100001', '1');
INSERT INTO `course` VALUES ('1011', '冰魄剑法之白鸟朝凤', '5', '2018100001', '1');
INSERT INTO `course` VALUES ('1012', '长虹剑法之天地同寿', '5', '2018100005', '2');
INSERT INTO `course_choose` VALUES ('2', '2018000003', '1002', '85');
INSERT INTO `course_choose` VALUES ('3', '2018000004', '1002', '60');
INSERT INTO `course_choose` VALUES ('9', '2018000002', '1001', '100');
INSERT INTO `course_choose` VALUES ('10', '2018000001', '1002', '0');
INSERT INTO `course_choose` VALUES ('11', '2018000006', '1001', '0');
INSERT INTO `course_choose` VALUES ('13', '2018000001', '1007', '0');
INSERT INTO `course_choose` VALUES ('14', '2018000002', '1004', '0');
INSERT INTO `course_choose` VALUES ('15', '2018000002', '1006', '0');
INSERT INTO `course_choose` VALUES ('16', '2018000002', '1008', '0');
INSERT INTO `course_choose` VALUES ('17', '2018000004', '1005', '0');
INSERT INTO `course_choose` VALUES ('18', '2018000001', '1005', '0');
INSERT INTO `course_choose` VALUES ('20', '2018000013', '1007', '0');
INSERT INTO `course_choose` VALUES ('21', '2018000013', '1005', '0');
INSERT INTO `course_choose` VALUES ('22', '2018000013', '1011', '0');
INSERT INTO `course_choose` VALUES ('23', '2018000012', '1010', '100');
INSERT INTO `course_choose` VALUES ('24', '2018000012', '1006', '0');
INSERT INTO `course_choose` VALUES ('25', '2018000014', '1012', '100');
INSERT INTO `course_choose` VALUES ('26', '2018000012', '1012', '95');
INSERT INTO `course_limit` VALUES ('1001', '1001', '1001');
INSERT INTO `course_limit` VALUES ('1002', '1002', '1004');
INSERT INTO `course_limit` VALUES ('1003', '1002', '1005');
INSERT INTO `course_limit` VALUES ('1005', '1004', '1001');
INSERT INTO `course_limit` VALUES ('1006', '1005', '1005');
INSERT INTO `course_limit` VALUES ('1007', '1006', '1001');
INSERT INTO `course_limit` VALUES ('1008', '1006', '1002');
INSERT INTO `course_limit` VALUES ('1009', '1007', '1004');
INSERT INTO `course_limit` VALUES ('1010', '1007', '1005');
INSERT INTO `course_limit` VALUES ('1011', '1008', '1001');
INSERT INTO `course_limit` VALUES ('1013', '1010', '1002');
INSERT INTO `course_limit` VALUES ('1014', '1010', '1004');
INSERT INTO `course_limit` VALUES ('1015', '1011', '1002');
INSERT INTO `course_limit` VALUES ('1016', '1011', '1005');
INSERT INTO `course_limit` VALUES ('1017', '1012', '1002');
INSERT INTO `course_limit` VALUES ('1018', '1012', '1005');
INSERT INTO `institution` VALUES ('1001', '信息科学技术学院');
INSERT INTO `institution` VALUES ('1002', '医学院');
INSERT INTO `institution` VALUES ('1004', '管理学院');
INSERT INTO `institution` VALUES ('1005', '经济学院');
INSERT INTO `student` VALUES ('2018000001', '张三', '2018000001', '1005', '经济学院');
INSERT INTO `student` VALUES ('2018000002', '李四', '2018000002', '1001', '信息科学技术学院');
INSERT INTO `student` VALUES ('2018000003', '王五', '2018000003', '1005', '经济学院');
INSERT INTO `student` VALUES ('2018000004', '赵六', '2018000004', '1005', '经济学院');
INSERT INTO `student` VALUES ('2018000005', '孙七', '2018000005', '1004', '管理学院');
INSERT INTO `student` VALUES ('2018000006', '周八', '2018000006', '1001', '信息科学技术学院');
INSERT INTO `student` VALUES ('2018000007', '吴九', '2018000007', '1004', '管理学院');
INSERT INTO `student` VALUES ('2018000008', '郑十', '2018000008', '1001', '信息科学技术学院');
INSERT INTO `student` VALUES ('2018000009', '刘备', '2018000009', '1004', '管理学院');
INSERT INTO `student` VALUES ('2018000010', '关羽', '2018000010', '1002', '医学院');
INSERT INTO `student` VALUES ('2018000011', '张飞', '2018000011', '1002', '医学院');
INSERT INTO `student` VALUES ('2018000012', '虹猫少侠', '2018000012', '1002', '医学院');
INSERT INTO `student` VALUES ('2018000013', '蓝兔宫主', '2018000013', '1005', '经济学院');
INSERT INTO `student` VALUES ('2018000014', '神医逗逗', '2018000014', '1001', '信息科学技术学院');
INSERT INTO `teacher` VALUES ('2018100001', '张老师', '2018100001');
INSERT INTO `teacher` VALUES ('2018100002', '李老师', '2018100002');
INSERT INTO `teacher` VALUES ('2018100003', '王老师', '2018100003');
INSERT INTO `teacher` VALUES ('2018100004', '陈老师', '2018100004');
INSERT INTO `teacher` VALUES ('2018100005', '白猫大侠', '2018100005');
