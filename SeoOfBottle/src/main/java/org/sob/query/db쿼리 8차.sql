-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        5.5.61-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- seaofbottle 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `seaofbottle` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `seaofbottle`;

-- 테이블 seaofbottle.boast 구조 내보내기
CREATE TABLE IF NOT EXISTS `boast` (
  `rno` int(20) NOT NULL AUTO_INCREMENT COMMENT '리플번호',
  `groupid` varchar(100) NOT NULL DEFAULT '0' COMMENT '그룹아이디(해시)',
  `reply` varchar(100) DEFAULT '0' COMMENT '리플내용',
  `indate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '작성시간',
  PRIMARY KEY (`rno`),
  KEY `groupid` (`groupid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='자랑게시판 리플관련 테이블';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 seaofbottle.bottlemain 구조 내보내기
CREATE TABLE IF NOT EXISTS `bottlemain` (
  `letterid` int(20) NOT NULL AUTO_INCREMENT COMMENT '편지번호',
  `from` int(11) NOT NULL DEFAULT '0' COMMENT '보낸사람',
  `to` int(11) NOT NULL DEFAULT '0' COMMENT '받는사람',
  `contents` varchar(200) NOT NULL DEFAULT '0' COMMENT '내용',
  `groupid` varchar(100) NOT NULL DEFAULT '0' COMMENT '그룹아이디(해시)',
  `cnt` int(20) NOT NULL DEFAULT '0' COMMENT '편지이동횟수',
  `categoryid` int(20) NOT NULL DEFAULT '0' COMMENT '카테고리id',
  `boast` varchar(10) NOT NULL DEFAULT 'false' COMMENT '자랑하기게시판 등록여부',
  PRIMARY KEY (`letterid`),
  KEY `213123` (`categoryid`),
  KEY `groupid` (`groupid`),
  CONSTRAINT `FK_bottlemain_boast` FOREIGN KEY (`groupid`) REFERENCES `boast` (`groupid`),
  CONSTRAINT `213123` FOREIGN KEY (`categoryid`) REFERENCES `category` (`categoryid`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='기본적인 rwud 테이블';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 seaofbottle.category 구조 내보내기
CREATE TABLE IF NOT EXISTS `category` (
  `categoryid` int(20) NOT NULL AUTO_INCREMENT COMMENT '카테고리번호',
  `category` varchar(50) NOT NULL DEFAULT '0' COMMENT '카테고리 이름',
  PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='카테고리 관련 테이블';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 seaofbottle.customer 구조 내보내기
CREATE TABLE IF NOT EXISTS `customer` (
  `cno` int(11) NOT NULL AUTO_INCREMENT COMMENT '고객번호',
  `nick` varchar(20) NOT NULL DEFAULT '0' COMMENT '고객닉네임',
  `id` varchar(40) NOT NULL DEFAULT '0' COMMENT '고객id(Email)',
  `pw` varchar(40) NOT NULL DEFAULT '0' COMMENT '고객pw',
  `googleid` varchar(21) DEFAULT NULL COMMENT '구글 로그인 api id',
  PRIMARY KEY (`cno`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='고객테이블';

-- 내보낼 데이터가 선택되어 있지 않습니다.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
