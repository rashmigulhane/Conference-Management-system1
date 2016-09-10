-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2016 at 09:13 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `con_man1`
--

-- --------------------------------------------------------

--
-- Table structure for table `author_conf`
--

CREATE TABLE IF NOT EXISTS `author_conf` (
  `user_id` int(11) NOT NULL,
  `conf_id` int(11) NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `conf_id` (`conf_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `author_conf`
--

INSERT INTO `author_conf` (`user_id`, `conf_id`) VALUES
(37, 13),
(41, 14),
(41, 14);

-- --------------------------------------------------------

--
-- Table structure for table `conference_table`
--

CREATE TABLE IF NOT EXISTS `conference_table` (
  `conf_id` int(11) NOT NULL AUTO_INCREMENT,
  `conf_name` varchar(35) NOT NULL,
  `description` varchar(100) NOT NULL,
  `Registration_start_date` varchar(50) NOT NULL,
  `Registration_end_date` varchar(50) NOT NULL,
  `abs_sub_deadline` varchar(50) NOT NULL,
  `paper_sub_deadline` varchar(50) NOT NULL,
  `paper_accepted_deadline` varchar(50) NOT NULL,
  `charge` int(11) NOT NULL,
  `Area_conference` varchar(200) NOT NULL,
  PRIMARY KEY (`conf_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `conference_table`
--

INSERT INTO `conference_table` (`conf_id`, `conf_name`, `description`, `Registration_start_date`, `Registration_end_date`, `abs_sub_deadline`, `paper_sub_deadline`, `paper_accepted_deadline`, `charge`, `Area_conference`) VALUES
(13, 'con1', 'con1', '22/02/2015', '22/06/2015', '22/06/2015', '22/08/2015', '22/10/2015', 333, 'con1con'),
(14, 'IEEE', 'science', '22/02/2016', '22/04/2016', '22/06/2016', '22/08/2016', '22/10/2016', 33, 'science');

-- --------------------------------------------------------

--
-- Table structure for table `conference_topics`
--

CREATE TABLE IF NOT EXISTS `conference_topics` (
  `conf_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_name` varchar(35) NOT NULL,
  PRIMARY KEY (`topic_id`,`conf_id`),
  KEY `conf_id` (`conf_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `conference_topics`
--

INSERT INTO `conference_topics` (`conf_id`, `topic_id`, `topic_name`) VALUES
(13, 13, 'topic1'),
(13, 14, 'topic2'),
(13, 15, 'topic3'),
(14, 16, 'science'),
(14, 17, 'technology');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `username` varchar(90) NOT NULL,
  `password` varchar(90) NOT NULL,
  `role` int(11) NOT NULL,
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  KEY `userid` (`userid`),
  KEY `userid_2` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=42 ;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `password`, `role`, `userid`) VALUES
('admin', '1234', 3, 36),
('akansha', '1234', 1, 37),
('tpc', '1234', 4, 38),
('rev1', '1234', 2, 39),
('tpc2', '1234', 4, 40),
('rashmiauthor', '1234', 1, 41);

-- --------------------------------------------------------

--
-- Table structure for table `paper_table`
--

CREATE TABLE IF NOT EXISTS `paper_table` (
  `paper_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `conf_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `title` varchar(70) NOT NULL,
  `status` text NOT NULL,
  `abstract_name` varchar(500) NOT NULL,
  `paper_name` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`paper_id`),
  UNIQUE KEY `user_id_2` (`user_id`,`conf_id`,`topic_id`),
  KEY `conf_id` (`conf_id`),
  KEY `topic_id` (`topic_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=47 ;

--
-- Dumping data for table `paper_table`
--

INSERT INTO `paper_table` (`paper_id`, `user_id`, `conf_id`, `topic_id`, `title`, `status`, `abstract_name`, `paper_name`) VALUES
(46, 37, 13, 13, 'ABC', 'Payment made', 'Lab_Sheet_5.pdf', 'Lab_Sheet_1.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `registration_table`
--

CREATE TABLE IF NOT EXISTS `registration_table` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `email_id` varchar(40) NOT NULL,
  `password` varchar(16) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `middle_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `role` varchar(20) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `gender` varchar(10) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=42 ;

--
-- Dumping data for table `registration_table`
--

INSERT INTO `registration_table` (`user_id`, `email_id`, `password`, `first_name`, `middle_name`, `last_name`, `role`, `username`, `gender`) VALUES
(36, 'admin@gmail.com', '1234', 'admin', 'admin', 'admin', '3', 'admin', 'Male'),
(37, 'akansha@gmail.com', '1234', 'akansha', 'akansha', 'akansha', '1', 'akansha', 'female'),
(38, 'tpc@gmail.com', '1234', 'tpc', 'tpc', 'tpc', '4', 'tpc', 'male'),
(39, 'rev1@gmail.com', '1234', 'rev1', 'rev1', 'rev1', '2', 'rev1', 'male'),
(40, 'tpc2@gmail.com', '1234', 'tpc2', 'tpc2', 'tpc2', '4', 'tpc2', 'male'),
(41, 'rashmiauthor@gmail.com', '1234', 'rashmiauthor', 'rashmiauthor', 'rashmiauthor', '1', 'rashmiauthor', 'male');

-- --------------------------------------------------------

--
-- Table structure for table `reviewer_conf_table`
--

CREATE TABLE IF NOT EXISTS `reviewer_conf_table` (
  `user_id` int(11) NOT NULL,
  `conf_id` int(11) NOT NULL,
  `expertize_area` varchar(40) NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `conf_id` (`conf_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reviewer_conf_table`
--

INSERT INTO `reviewer_conf_table` (`user_id`, `conf_id`, `expertize_area`) VALUES
(39, 13, '');

-- --------------------------------------------------------

--
-- Table structure for table `reviewer_interest`
--

CREATE TABLE IF NOT EXISTS `reviewer_interest` (
  `user_id` int(11) NOT NULL,
  `paper_id` int(11) NOT NULL,
  `conf_id` int(11) NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `paper_id` (`paper_id`),
  KEY `conf_id` (`conf_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reviewer_interest`
--

INSERT INTO `reviewer_interest` (`user_id`, `paper_id`, `conf_id`) VALUES
(39, 46, 13),
(39, 46, 13),
(39, 46, 13);

-- --------------------------------------------------------

--
-- Table structure for table `reviewer_table`
--

CREATE TABLE IF NOT EXISTS `reviewer_table` (
  `user_id` int(11) NOT NULL,
  `paper_id` int(11) NOT NULL,
  `conf_id` int(11) NOT NULL,
  `comments` varchar(200) NOT NULL,
  `technical_quality` int(11) NOT NULL,
  `relevance` int(11) NOT NULL,
  `WritingStyle` int(11) NOT NULL,
  `Standard_English` int(11) NOT NULL,
  `UseOfReference` int(11) NOT NULL,
  `AppropriateTitle` int(11) NOT NULL,
  `lenght` int(11) NOT NULL,
  `abstract` int(11) NOT NULL,
  `finalScore` varchar(20) NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `paper_id` (`paper_id`),
  KEY `conf_id` (`conf_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reviewer_table`
--

INSERT INTO `reviewer_table` (`user_id`, `paper_id`, `conf_id`, `comments`, `technical_quality`, `relevance`, `WritingStyle`, `Standard_English`, `UseOfReference`, `AppropriateTitle`, `lenght`, `abstract`, `finalScore`) VALUES
(39, 46, 13, 'Please give your comments regarding paper herecc', 5, 5, 5, 5, 5, 5, 5, 2, '4.625');

-- --------------------------------------------------------

--
-- Table structure for table `tpc_conf`
--

CREATE TABLE IF NOT EXISTS `tpc_conf` (
  `TPC_id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `confid` int(11) NOT NULL,
  PRIMARY KEY (`TPC_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `tpc_conf`
--

INSERT INTO `tpc_conf` (`TPC_id`, `userid`, `confid`) VALUES
(14, 38, 13),
(15, 40, 14);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `author_conf`
--
ALTER TABLE `author_conf`
  ADD CONSTRAINT `author_conf_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `registration_table` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `author_conf_ibfk_2` FOREIGN KEY (`conf_id`) REFERENCES `conference_table` (`conf_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `conference_topics`
--
ALTER TABLE `conference_topics`
  ADD CONSTRAINT `conference_topics_ibfk_1` FOREIGN KEY (`conf_id`) REFERENCES `conference_table` (`conf_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `paper_table`
--
ALTER TABLE `paper_table`
  ADD CONSTRAINT `paper_table_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `registration_table` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `paper_table_ibfk_2` FOREIGN KEY (`conf_id`) REFERENCES `conference_table` (`conf_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `paper_table_ibfk_3` FOREIGN KEY (`topic_id`) REFERENCES `conference_topics` (`topic_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reviewer_conf_table`
--
ALTER TABLE `reviewer_conf_table`
  ADD CONSTRAINT `reviewer_conf_table_ibfk_2` FOREIGN KEY (`conf_id`) REFERENCES `conference_table` (`conf_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reviewer_interest`
--
ALTER TABLE `reviewer_interest`
  ADD CONSTRAINT `reviewer_interest_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `registration_table` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reviewer_interest_ibfk_2` FOREIGN KEY (`paper_id`) REFERENCES `paper_table` (`paper_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reviewer_interest_ibfk_3` FOREIGN KEY (`conf_id`) REFERENCES `conference_table` (`conf_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reviewer_table`
--
ALTER TABLE `reviewer_table`
  ADD CONSTRAINT `reviewer_table_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `registration_table` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reviewer_table_ibfk_2` FOREIGN KEY (`paper_id`) REFERENCES `paper_table` (`paper_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reviewer_table_ibfk_3` FOREIGN KEY (`conf_id`) REFERENCES `conference_table` (`conf_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
