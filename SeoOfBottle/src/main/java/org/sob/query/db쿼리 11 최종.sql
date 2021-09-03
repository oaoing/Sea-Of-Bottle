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
  `replyno` int(20) NOT NULL AUTO_INCREMENT COMMENT '리플번호',
  `labelid` int(11) NOT NULL COMMENT '병번호',
  `reply` varchar(100) DEFAULT NULL COMMENT '리플내용',
  `indate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '작성시간',
  `customerno` int(11) NOT NULL COMMENT '작성자',
  PRIMARY KEY (`replyno`),
  KEY `FK_boast_bottle` (`labelid`),
  CONSTRAINT `FK_boast_bottle` FOREIGN KEY (`labelid`) REFERENCES `bottle` (`labelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=238 DEFAULT CHARSET=utf8 COMMENT='자랑게시판 리플관련 테이블';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 seaofbottle.bottle 구조 내보내기
CREATE TABLE IF NOT EXISTS `bottle` (
  `labelid` int(11) NOT NULL AUTO_INCREMENT COMMENT '병 번호',
  `categoryid` int(20) NOT NULL DEFAULT '0' COMMENT '카테고리id',
  `boast` bit(1) NOT NULL DEFAULT b'0' COMMENT '자랑하기게시판 등록여부',
  `from` int(11) NOT NULL DEFAULT '0' COMMENT '최초작성자',
  PRIMARY KEY (`labelid`),
  KEY `FK_bottle_category` (`categoryid`),
  CONSTRAINT `FK_bottle_category` FOREIGN KEY (`categoryid`) REFERENCES `category` (`categoryid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8 COMMENT='기본적인 rwud 테이블';

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
  `customerno` int(11) NOT NULL AUTO_INCREMENT COMMENT '고객번호',
  `nick` varchar(20) NOT NULL DEFAULT '0' COMMENT '고객닉네임',
  `id` varchar(40) NOT NULL DEFAULT '0' COMMENT '고객id(Email)',
  `pw` varchar(40) NOT NULL DEFAULT '0' COMMENT '고객pw',
  `googleid` varchar(21) DEFAULT NULL COMMENT '구글 로그인 api id',
  PRIMARY KEY (`customerno`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='고객테이블';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 seaofbottle.letter 구조 내보내기
CREATE TABLE IF NOT EXISTS `letter` (
  `letterid` int(20) NOT NULL AUTO_INCREMENT COMMENT '편지번호',
  `cnt` int(20) NOT NULL DEFAULT '0' COMMENT '이동횟수',
  `contents` varchar(200) NOT NULL DEFAULT '0' COMMENT '편지내용',
  `labelid` int(11) NOT NULL DEFAULT '0' COMMENT '병 번호',
  PRIMARY KEY (`letterid`),
  KEY `FK_letter_bottle` (`labelid`),
  CONSTRAINT `FK_letter_bottle` FOREIGN KEY (`labelid`) REFERENCES `bottle` (`labelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=347 DEFAULT CHARSET=utf8 COMMENT='편지테이블';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 seaofbottle.receivertable 구조 내보내기
CREATE TABLE IF NOT EXISTS `receivertable` (
  `receiverno` int(11) NOT NULL AUTO_INCREMENT COMMENT '받은사람 인덱스',
  `labelid` int(11) NOT NULL DEFAULT '0' COMMENT '병번호',
  `receiver` int(11) NOT NULL DEFAULT '0' COMMENT '받은사람번호',
  PRIMARY KEY (`receiverno`),
  KEY `FK_recievertable_customer` (`receiver`),
  KEY `FK_recievertable_bottle` (`labelid`),
  CONSTRAINT `FK_recievertable_customer` FOREIGN KEY (`receiver`) REFERENCES `customer` (`customerno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_recievertable_bottle` FOREIGN KEY (`labelid`) REFERENCES `bottle` (`labelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=345 DEFAULT CHARSET=utf8 COMMENT='편지받은 사람 목록';

-- 내보낼 데이터가 선택되어 있지 않습니다.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
