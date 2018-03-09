-- phpMyAdmin SQL Dump
-- version 4.7.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 08, 2018 at 08:43 PM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eei_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log_t`
--

CREATE TABLE `activity_log_t` (
  `activity_log_id` int(5) NOT NULL,
  `ticket_id` int(3) UNSIGNED ZEROFILL NOT NULL,
  `activity_log_details` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `logger` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `activity_log_t`
--

INSERT INTO `activity_log_t` (`activity_log_id`, `ticket_id`, `activity_log_details`, `timestamp`, `logger`) VALUES
(1, 001, 'Contacted vendor.', '2018-02-19 08:12:21', 681),
(3, 015, 'Ticket assigned to User Technician', '2018-02-20 23:03:58', 678),
(4, 005, 'Ticket assigned to User Technician', '2018-02-20 23:06:44', 678),
(5, 002, 'Ticket assigned to User Technician', '2018-02-20 23:08:30', 678),
(6, 002, 'Contacted vendor.', '2018-02-20 23:08:54', 681),
(8, 014, 'Ticket assigned to User Requestor Six', '2018-02-21 09:24:03', 678),
(9, 125, 'Ticket assigned to User Technician', '2018-03-04 18:07:20', 678),
(10, 125, 'Ticket assigned to User Technician', '2018-03-04 18:28:44', 678),
(11, 006, 'holler', '2018-03-06 16:38:38', 681),
(12, 006, '', '2018-03-06 16:39:28', 681),
(13, 006, '', '2018-03-06 16:47:45', 681),
(14, 006, '', '2018-03-06 16:48:02', 681),
(15, 006, '', '2018-03-06 16:49:59', 681),
(16, 006, 'q', '2018-03-06 16:58:49', 681),
(17, 006, 'j', '2018-03-06 17:12:08', 681),
(18, 006, 'Hi', '2018-03-07 05:47:20', 681),
(19, 006, 'Fixed screen', '2018-03-07 05:48:23', 681),
(20, 003, 'Ticket assigned to User Technician', '2018-03-08 18:41:52', 678),
(21, 003, 'Ticket forwarded to Technicals Supervisor - User Technicals Manager', '2018-03-08 18:46:17', 0);

-- --------------------------------------------------------

--
-- Table structure for table `attachment_t`
--

CREATE TABLE `attachment_t` (
  `file_id` int(11) NOT NULL,
  `file` text,
  `user_id` int(5) NOT NULL,
  `ticket_id` int(3) UNSIGNED ZEROFILL NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attachment_t`
--

INSERT INTO `attachment_t` (`file_id`, `file`, `user_id`, `ticket_id`, `description`) VALUES
(6, '27990024_1975075939171719_687338424_o.jpg', 680, 001, 'hi'),
(7, 'Hanney.jpg', 680, 001, 'profile picture '),
(8, 'VDAB.pdf', 677, 088, '');

-- --------------------------------------------------------

--
-- Table structure for table `faq_article_t`
--

CREATE TABLE `faq_article_t` (
  `article_id` int(3) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  `category` enum('Technicals','Access','Network') NOT NULL,
  `article_title` varchar(40) NOT NULL,
  `article_body` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faq_article_t`
--

INSERT INTO `faq_article_t` (`article_id`, `subcategory_id`, `category`, `article_title`, `article_body`) VALUES
(15, 1, 'Technicals', 'Monitor Not Working', '<div>\r\n\r\n\r\n\r\n\r\n<style type=\"text/css\">\r\np.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px \'Helvetica Neue\'; color: #454545}\r\np.p2 {margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px \'Helvetica Neue\'; color: #454545; min-height: 14.0px}\r\n</style>\r\n\r\n\r\n<p class=\"p1\">&nbsp; &nbsp; &nbsp; &nbsp; 1. Check if monitor is plugged in socket</p>\r\n<p class=\"p1\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; If monitor is not plugged in socket, plug it in and check for screen action.</p>\r\n<p class=\"p2\"><br></p>\r\n<p class=\"p1\">&nbsp; &nbsp; &nbsp; &nbsp; 2. If it is plugged in and still not working, check if monitor is connected to the CPU</p>\r\n<p class=\"p1\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Ensure tight connection if it is not connected</p>\r\n<p class=\"p2\"><br></p>\r\n<p class=\"p1\">&nbsp; &nbsp; &nbsp; &nbsp; 3. If the monitor is still not working, kindly create a service ticket.</p>\r\n<p class=\"p2\"><br></p></div>'),
(23, 2, 'Technicals', 'Printer not turning on', '<div>\r\n\r\n\r\n\r\n\r\n<style type=\"text/css\">\r\np.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px \'Helvetica Neue\'; color: #454545}\r\np.p2 {margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px \'Helvetica Neue\'; color: #454545; min-height: 14.0px}\r\n</style>\r\n\r\n\r\n<p class=\"p1\">&nbsp; &nbsp; &nbsp; &nbsp; 1. Check if printer is plugged in socket</p>\r\n<p class=\"p1\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; If printer is not plugged in socket, plug it in and check for screen action.</p>\r\n<p class=\"p2\"><br></p>\r\n<p class=\"p1\">&nbsp; &nbsp; &nbsp; &nbsp; 2. If it is plugged in and still not working, check if printer is connected to the CPU</p>\r\n<p class=\"p1\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Ensure tight connection if it is not connected</p>\r\n<p class=\"p2\"><br></p>\r\n<p class=\"p1\">&nbsp; &nbsp; &nbsp; &nbsp; 3. If the printer is still not turning on, kindly create a service ticket.</p>\r\n<p class=\"p2\"><br></p></div>'),
(24, 2, 'Technicals', 'Printer won\'t connect to computer', '\r\n\r\n\r\n\r\n\r\n<!--[if gte mso 9]><xml>\r\n <o:OfficeDocumentSettings>\r\n  <o:AllowPNG/>\r\n </o:OfficeDocumentSettings>\r\n</xml><![endif]-->\r\n\r\n\r\n<!--[if gte mso 9]><xml>\r\n <w:WordDocument>\r\n  <w:View>Normal</w:View>\r\n  <w:Zoom>0</w:Zoom>\r\n  <w:TrackMoves/>\r\n  <w:TrackFormatting/>\r\n  <w:PunctuationKerning/>\r\n  <w:ValidateAgainstSchemas/>\r\n  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>\r\n  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>\r\n  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>\r\n  <w:DoNotPromoteQF/>\r\n  <w:LidThemeOther>EN-US</w:LidThemeOther>\r\n  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>\r\n  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>\r\n  <w:Compatibility>\r\n   <w:BreakWrappedTables/>\r\n   <w:SnapToGridInCell/>\r\n   <w:WrapTextWithPunct/>\r\n   <w:UseAsianBreakRules/>\r\n   <w:DontGrowAutofit/>\r\n   <w:SplitPgBreakAndParaMark/>\r\n   <w:EnableOpenTypeKerning/>\r\n   <w:DontFlipMirrorIndents/>\r\n   <w:OverrideTableStyleHps/>\r\n  </w:Compatibility>\r\n  <m:mathPr>\r\n   <m:mathFont m:val=\"Cambria Math\"/>\r\n   <m:brkBin m:val=\"before\"/>\r\n   <m:brkBinSub m:val=\"&#45;-\"/>\r\n   <m:smallFrac m:val=\"off\"/>\r\n   <m:dispDef/>\r\n   <m:lMargin m:val=\"0\"/>\r\n   <m:rMargin m:val=\"0\"/>\r\n   <m:defJc m:val=\"centerGroup\"/>\r\n   <m:wrapIndent m:val=\"1440\"/>\r\n   <m:intLim m:val=\"subSup\"/>\r\n   <m:naryLim m:val=\"undOvr\"/>\r\n  </m:mathPr></w:WordDocument>\r\n</xml><![endif]--><!--[if gte mso 9]><xml>\r\n <w:LatentStyles DefLockedState=\"false\" DefUnhideWhenUsed=\"false\"\r\n  DefSemiHidden=\"false\" DefQFormat=\"false\" DefPriority=\"99\"\r\n  LatentStyleCount=\"375\">\r\n  <w:LsdException Locked=\"false\" Priority=\"0\" QFormat=\"true\" Name=\"Normal\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 7\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 8\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 9\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 6\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 7\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 8\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 9\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 7\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 8\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 9\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Normal Indent\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"footnote text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"annotation text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"header\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"footer\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index heading\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"35\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"caption\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"table of figures\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"envelope address\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"envelope return\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"footnote reference\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"annotation reference\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"line number\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"page number\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"endnote reference\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"endnote text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"table of authorities\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"macro\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"toa heading\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Bullet\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Number\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Bullet 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Bullet 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Bullet 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Bullet 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Number 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Number 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Number 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Number 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"10\" QFormat=\"true\" Name=\"Title\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Closing\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Signature\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"1\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"Default Paragraph Font\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text Indent\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Continue\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Continue 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Continue 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Continue 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Continue 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Message Header\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"11\" QFormat=\"true\" Name=\"Subtitle\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Salutation\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Date\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text First Indent\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text First Indent 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Note Heading\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text Indent 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text Indent 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Block Text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Hyperlink\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"FollowedHyperlink\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"22\" QFormat=\"true\" Name=\"Strong\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"20\" QFormat=\"true\" Name=\"Emphasis\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Document Map\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Plain Text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"E-mail Signature\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Top of Form\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Bottom of Form\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Normal (Web)\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Acronym\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Address\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Cite\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Code\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Definition\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Keyboard\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Preformatted\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Sample\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Typewriter\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Variable\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Normal Table\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"annotation subject\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"No List\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Outline List 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Outline List 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Outline List 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Simple 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Simple 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Simple 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Classic 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Classic 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Classic 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Classic 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Colorful 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Colorful 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Colorful 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Columns 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Columns 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Columns 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Columns 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Columns 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 6\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 7\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 8\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 6\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 7\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 8\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table 3D effects 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table 3D effects 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table 3D effects 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Contemporary\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Elegant\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Professional\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Subtle 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Subtle 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Web 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Web 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Web 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Balloon Text\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"Table Grid\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Theme\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" Name=\"Placeholder Text\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"1\" QFormat=\"true\" Name=\"No Spacing\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" Name=\"Revision\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"34\" QFormat=\"true\"\r\n   Name=\"List Paragraph\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"29\" QFormat=\"true\" Name=\"Quote\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"30\" QFormat=\"true\"\r\n   Name=\"Intense Quote\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"19\" QFormat=\"true\"\r\n   Name=\"Subtle Emphasis\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"21\" QFormat=\"true\"\r\n   Name=\"Intense Emphasis\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"31\" QFormat=\"true\"\r\n   Name=\"Subtle Reference\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"32\" QFormat=\"true\"\r\n   Name=\"Intense Reference\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"33\" QFormat=\"true\" Name=\"Book Title\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"37\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"Bibliography\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"TOC Heading\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"41\" Name=\"Plain Table 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"42\" Name=\"Plain Table 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"43\" Name=\"Plain Table 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"44\" Name=\"Plain Table 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"45\" Name=\"Plain Table 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"40\" Name=\"Grid Table Light\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\" Name=\"Grid Table 1 Light\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\" Name=\"Grid Table 6 Colorful\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\" Name=\"Grid Table 7 Colorful\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\" Name=\"List Table 1 Light\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\" Name=\"List Table 6 Colorful\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\" Name=\"List Table 7 Colorful\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Mention\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Smart Hyperlink\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Hashtag\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Unresolved Mention\"/>\r\n </w:LatentStyles>\r\n</xml><![endif]-->\r\n<style>\r\n<!--\r\n /* Font Definitions */\r\n @font-face\r\n	{font-family:\"Cambria Math\";\r\n	panose-1:2 4 5 3 5 4 6 3 2 4;\r\n	mso-font-charset:0;\r\n	mso-generic-font-family:roman;\r\n	mso-font-pitch:variable;\r\n	mso-font-signature:3 0 0 0 1 0;}\r\n@font-face\r\n	{font-family:Calibri;\r\n	panose-1:2 15 5 2 2 2 4 3 2 4;\r\n	mso-font-charset:0;\r\n	mso-generic-font-family:swiss;\r\n	mso-font-pitch:variable;\r\n	mso-font-signature:-536859905 -1073732485 9 0 511 0;}\r\n /* Style Definitions */\r\n p.MsoNormal, li.MsoNormal, div.MsoNormal\r\n	{mso-style-unhide:no;\r\n	mso-style-qformat:yes;\r\n	mso-style-parent:\"\";\r\n	margin:0cm;\r\n	margin-bottom:.0001pt;\r\n	mso-pagination:widow-orphan;\r\n	font-size:12.0pt;\r\n	font-family:\"Calibri\",sans-serif;\r\n	mso-ascii-font-family:Calibri;\r\n	mso-ascii-theme-font:minor-latin;\r\n	mso-fareast-font-family:Calibri;\r\n	mso-fareast-theme-font:minor-latin;\r\n	mso-hansi-font-family:Calibri;\r\n	mso-hansi-theme-font:minor-latin;\r\n	mso-bidi-font-family:\"Times New Roman\";\r\n	mso-bidi-theme-font:minor-bidi;\r\n	mso-ansi-language:EN-US;\r\n	mso-fareast-language:EN-US;}\r\n.MsoChpDefault\r\n	{mso-style-type:export-only;\r\n	mso-default-props:yes;\r\n	font-family:\"Calibri\",sans-serif;\r\n	mso-ascii-font-family:Calibri;\r\n	mso-ascii-theme-font:minor-latin;\r\n	mso-fareast-font-family:Calibri;\r\n	mso-fareast-theme-font:minor-latin;\r\n	mso-hansi-font-family:Calibri;\r\n	mso-hansi-theme-font:minor-latin;\r\n	mso-bidi-font-family:\"Times New Roman\";\r\n	mso-bidi-theme-font:minor-bidi;\r\n	mso-ansi-language:EN-US;\r\n	mso-fareast-language:EN-US;}\r\n@page WordSection1\r\n	{size:612.0pt 792.0pt;\r\n	margin:72.0pt 72.0pt 72.0pt 72.0pt;\r\n	mso-header-margin:35.4pt;\r\n	mso-footer-margin:35.4pt;\r\n	mso-paper-source:0;}\r\ndiv.WordSection1\r\n	{page:WordSection1;}\r\n /* List Definitions */\r\n @list l0\r\n	{mso-list-id:2127576947;\r\n	mso-list-template-ids:-1615192778;}\r\nol\r\n	{margin-bottom:0cm;}\r\nul\r\n	{margin-bottom:0cm;}\r\n-->\r\n</style>\r\n<!--[if gte mso 10]>\r\n<style>\r\n /* Style Definitions */\r\n table.MsoNormalTable\r\n	{mso-style-name:\"Table Normal\";\r\n	mso-tstyle-rowband-size:0;\r\n	mso-tstyle-colband-size:0;\r\n	mso-style-noshow:yes;\r\n	mso-style-priority:99;\r\n	mso-style-parent:\"\";\r\n	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;\r\n	mso-para-margin:0cm;\r\n	mso-para-margin-bottom:.0001pt;\r\n	mso-pagination:widow-orphan;\r\n	font-size:12.0pt;\r\n	font-family:\"Calibri\",sans-serif;\r\n	mso-ascii-font-family:Calibri;\r\n	mso-ascii-theme-font:minor-latin;\r\n	mso-hansi-font-family:Calibri;\r\n	mso-hansi-theme-font:minor-latin;\r\n	mso-bidi-font-family:\"Times New Roman\";\r\n	mso-bidi-theme-font:minor-bidi;\r\n	mso-ansi-language:EN-US;\r\n	mso-fareast-language:EN-US;}\r\n</style>\r\n<![endif]-->\r\n\r\n\r\n\r\n<!--StartFragment-->\r\n\r\n<p class=\"MsoNormal\"><b><span style=\"font-size: 11.5pt;\">CONNECT IT KASI AMP</span></b><span style=\"font-size: 11.5pt;\"><o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;margin-right:18.75pt;\r\nmso-margin-bottom-alt:auto;margin-left:18.75pt;text-indent:-18.0pt;mso-list:\r\nl0 level1 lfo1;tab-stops:list 36.0pt\"><!--[if !supportLists]--><span style=\"font-size: 11.5pt;\">1.<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><b><span style=\"font-size: 11.5pt;\">Check if\r\nprinter is plugged in</span></b><span style=\"font-size: 11.5pt;\"><o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;margin-right:18.75pt;\r\nmso-margin-bottom-alt:auto;margin-left:18.75pt;text-indent:-18.0pt;mso-list:\r\nl0 level1 lfo1;tab-stops:list 36.0pt\"><!--[if !supportLists]--><span style=\"font-size: 11.5pt;\">2.<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><b><span style=\"font-size: 11.5pt;\">Check if\r\ncomputer is connected to the same network as the printe</span></b><span style=\"font-size: 11.5pt;\"><o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\"><span lang=\"EN-US\">&nbsp;</span></p>\r\n\r\n<!--EndFragment-->');

-- --------------------------------------------------------

--
-- Table structure for table `faq_subcategory_t`
--

CREATE TABLE `faq_subcategory_t` (
  `subcategory_id` int(11) NOT NULL,
  `subcategory_name` char(40) NOT NULL,
  `category` enum('Technicals','Access','Network') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faq_subcategory_t`
--

INSERT INTO `faq_subcategory_t` (`subcategory_id`, `subcategory_name`, `category`) VALUES
(1, 'Monitor', 'Technicals'),
(2, 'Printer', 'Technicals'),
(3, 'Wifi', 'Network'),
(4, 'LAN', 'Network'),
(5, 'Password', 'Access'),
(6, 'CPU', 'Technicals'),
(7, 'Laptop', 'Technicals');

-- --------------------------------------------------------

--
-- Table structure for table `notification_t`
--

CREATE TABLE `notification_t` (
  `notification_id` int(4) NOT NULL,
  `ticket_id` int(3) UNSIGNED ZEROFILL DEFAULT NULL,
  `user_id` int(5) NOT NULL,
  `notification_description` varchar(100) NOT NULL,
  `isRead` tinyint(1) NOT NULL DEFAULT '0',
  `isSeen` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notification_t`
--

INSERT INTO `notification_t` (`notification_id`, `ticket_id`, `user_id`, `notification_description`, `isRead`, `isSeen`) VALUES
(1, 001, 676, 'Ticket No. : 2018001 needs your review', 1, 1),
(2, 001, 678, '2018001 has been assigned to you', 1, 1),
(3, 002, 676, 'Ticket No. : 2018002 needs your review', 1, 1),
(4, 003, 676, 'Ticket No. : 2018003 needs your review', 1, 1),
(5, 004, 676, 'Ticket No. : 2018004 needs your review', 1, 1),
(6, 005, 676, 'Ticket No. : 2018005 needs your review', 0, 1),
(7, 006, 676, 'Ticket No. : 2018006 needs your review', 0, 1),
(8, 006, 678, '2018006 has been assigned to you', 1, 1),
(9, 007, 676, 'Ticket No. : 2018007 needs your review', 0, 1),
(10, 008, 676, 'Ticket No. : 2018008 needs your review', 0, 1),
(11, 008, 678, '2018008 has been assigned to you', 1, 1),
(12, 007, 678, '2018007 has been assigned to you', 1, 1),
(13, 009, 683, 'Ticket No. : 2018009 needs your review', 1, 1),
(14, 010, 683, 'Ticket No. : 2018010 needs your review', 1, 1),
(15, 011, 680, 'Ticket No. : 2018011 needs your review', 1, 1),
(16, 012, 685, 'Ticket No. : 2018012 needs your review', 1, 1),
(17, 013, 683, 'Ticket No. : 2018013 needs your review', 1, 1),
(18, 013, 685, 'New ticket 2018013 for approval', 1, 1),
(19, 013, 676, 'Ticket No. : 2018013 has been approved', 1, 1),
(20, 013, 678, '2018013 has been assigned to you', 1, 1),
(21, 014, 683, 'Ticket No. : 2018014 needs your review', 1, 1),
(22, 014, 685, 'New ticket 2018014 for approval', 0, 1),
(23, 015, 680, 'Ticket No. : 2018015 needs your review', 1, 1),
(24, 015, 683, 'New ticket 2018015 for approval', 1, 1),
(25, 015, 676, 'Ticket No. : 2018015 has been approved', 0, 1),
(26, 016, 680, 'Ticket No. : 2018016 needs your review', 1, 1),
(27, 016, 683, 'New ticket 2018016 for approval', 1, 1),
(28, 017, 683, 'Ticket No. : 2018017 needs your review', 1, 1),
(29, 017, 685, 'New ticket 2018017 for approval', 0, 1),
(30, 018, 685, 'Ticket No. : 2018018 needs your review', 0, 1),
(31, 019, 676, 'Ticket No. : 2018019 needs your review', 1, 1),
(32, 019, 678, '2018019 has been assigned to you', 1, 1),
(33, 020, 676, 'Ticket No. : 2018020 needs your review', 1, 1),
(34, 020, 678, '2018020 has been assigned to you', 1, 1),
(35, 021, 676, 'Ticket No. : 2018021 needs your review', 1, 1),
(36, 021, 678, '2018021 has been assigned to you', 1, 1),
(37, 015, 678, '2018015 has been assigned to you', 1, 1),
(38, 015, 681, '2018015 has been assigned to you', 0, 1),
(39, 005, 678, '2018005 has been assigned to you', 0, 1),
(40, 004, 678, '2018004 has been assigned to you', 0, 1),
(41, 005, 681, '2018005 has been assigned to you', 0, 1),
(42, 003, 678, '2018003 has been assigned to you', 0, 1),
(43, 002, 678, '2018002 has been assigned to you', 1, 1),
(44, 002, 681, '2018002 has been assigned to you', 1, 1),
(45, 022, 676, 'Ticket No. : 2018022 needs your review', 1, 1),
(46, 022, 678, '2018022 has been assigned to you', 1, 1),
(47, 022, 681, '2018022 has been assigned to you', 1, 1),
(48, 023, 683, 'Ticket No. : 2018023 needs your review', 0, 1),
(49, 023, 685, 'New ticket 2018023 for approval', 0, 1),
(50, 014, 676, 'Ticket No. : 2018014 has been approved', 1, 1),
(51, 014, 678, '2018014 has been assigned to you', 1, 1),
(52, 014, 688, '2018014 has been assigned to you', 1, 1),
(53, 024, 680, 'Ticket No. : 2018024 needs your review', 0, 1),
(54, 025, 676, 'Ticket No. : 2018025 needs your review', 0, 1),
(55, 026, 676, 'Ticket No. : 2018026 needs your review', 0, 1),
(56, 027, 680, 'Ticket No. : 2018027 needs your review', 0, 1),
(57, 028, 676, 'Ticket No. : 2018028 needs your review', 0, 1),
(58, 029, 683, 'Ticket No. : 2018029 needs your review', 0, 0),
(59, 030, 677, 'Ticket No. : 2018030 needs your review', 0, 1),
(60, 031, 683, 'Ticket No. : 2018031 needs your review', 0, 0),
(61, 032, 683, 'Ticket No. : 2018032 needs your review', 0, 0),
(62, 033, 683, 'Ticket No. : 2018033 needs your review', 0, 0),
(63, 034, 678, 'Ticket No. : 2018034 needs your review', 0, 1),
(64, 035, 683, 'Ticket No. : 2018035 needs your review', 0, 0),
(65, 036, 680, 'Ticket No. : 2018036 needs your review', 0, 1),
(66, 037, 680, 'Ticket No. : 2018037 needs your review', 0, 1),
(67, 038, 683, 'Ticket No. : 2018038 needs your review', 0, 0),
(68, 039, 680, 'Ticket No. : 2018039 needs your review', 0, 1),
(69, 040, 680, 'Ticket No. : 2018040 needs your review', 0, 1),
(70, 041, 685, 'Ticket No. : 2018041 needs your review', 0, 0),
(71, 042, 680, 'Ticket No. : 2018042 needs your review', 0, 1),
(72, 043, 680, 'Ticket No. : 2018043 needs your review', 0, 1),
(73, 044, 680, 'Ticket No. : 2018044 needs your review', 0, 1),
(74, 045, 680, 'Ticket No. : 2018045 needs your review', 0, 1),
(75, 046, 679, 'Ticket No. : 2018046 needs your review', 0, 0),
(76, 047, 680, 'Ticket No. : 2018047 needs your review', 0, 1),
(77, 048, 685, 'Ticket No. : 2018048 needs your review', 0, 0),
(78, 049, 680, 'Ticket No. : 2018049 needs your review', 0, 1),
(79, 050, 680, 'Ticket No. : 2018050 needs your review', 0, 1),
(80, 051, 680, 'Ticket No. : 2018051 needs your review', 0, 1),
(81, 052, 680, 'Ticket No. : 2018052 needs your review', 0, 1),
(82, 053, 683, 'Ticket No. : 2018053 needs your review', 0, 0),
(83, 054, 680, 'Ticket No. : 2018054 needs your review', 0, 1),
(84, 055, 683, 'Ticket No. : 2018055 needs your review', 0, 0),
(85, 056, 680, 'Ticket No. : 2018056 needs your review', 0, 1),
(86, 057, 680, 'Ticket No. : 2018057 needs your review', 0, 1),
(87, 058, 680, 'Ticket No. : 2018058 needs your review', 0, 1),
(88, 059, 680, 'Ticket No. : 2018059 needs your review', 0, 1),
(89, 060, 676, 'Ticket No. : 2018060 needs your review', 0, 1),
(90, 061, 676, 'Ticket No. : 2018061 needs your review', 0, 1),
(91, 062, 678, 'Ticket No. : 2018062 needs your review', 0, 1),
(92, 063, 680, 'Ticket No. : 2018063 needs your review', 0, 1),
(93, 064, 680, 'Ticket No. : 2018064 needs your review', 0, 1),
(94, 065, 680, 'Ticket No. : 2018065 needs your review', 0, 1),
(95, 066, 676, 'Ticket No. : 2018066 needs your review', 0, 1),
(96, 067, 676, 'Ticket No. : 2018067 needs your review', 0, 1),
(97, 068, 680, 'Ticket No. : 2018068 needs your review', 0, 1),
(98, 069, 680, 'Ticket No. : 2018069 needs your review', 0, 1),
(99, 070, 683, 'Ticket No. : 2018070 needs your review', 0, 0),
(100, 071, 680, 'Ticket No. : 2018071 needs your review', 0, 1),
(101, 072, 680, 'Ticket No. : 2018072 needs your review', 0, 1),
(102, 073, 680, 'Ticket No. : 2018073 needs your review', 0, 1),
(103, 074, 680, 'Ticket No. : 2018074 needs your review', 0, 1),
(104, 075, 676, 'Ticket No. : 2018075 needs your review', 0, 1),
(105, 076, 680, 'Ticket No. : 2018076 needs your review', 0, 1),
(106, 077, 683, 'Ticket No. : 2018077 needs your review', 0, 0),
(107, 078, 676, 'Ticket No. : 2018078 needs your review', 0, 1),
(108, 079, 676, 'Ticket No. : 2018079 needs your review', 0, 1),
(109, 080, 676, 'Ticket No. : 2018080 needs your review', 0, 1),
(110, 081, 676, 'Ticket No. : 2018081 needs your review', 0, 1),
(111, 082, 676, 'Ticket No. : 2018082 needs your review', 0, 1),
(112, 083, 676, 'Ticket No. : 2018083 needs your review', 0, 1),
(113, 084, 676, 'Ticket No. : 2018084 needs your review', 0, 1),
(114, 085, 676, 'Ticket No. : 2018085 needs your review', 0, 1),
(115, 086, 676, 'Ticket No. : 2018086 needs your review', 0, 1),
(116, 088, 676, 'Ticket No. : 2018088 needs your review', 0, 1),
(117, 089, 676, 'Ticket No. : 2018089 needs your review', 0, 1),
(118, 000, 676, 'Ticket No. :  needs your review', 0, 1),
(119, 000, 676, 'Ticket No. :  needs your review', 0, 1),
(120, 102, 712, 'Ticket No. : 2018102 needs your review', 1, 1),
(121, 103, 676, 'Ticket No. : 2018103 needs your review', 0, 1),
(122, 104, 676, 'Ticket No. : 2018104 needs your review', 0, 1),
(123, 105, 676, 'Ticket No. : 2018105 needs your review', 0, 1),
(124, 106, 676, 'Ticket No. : 2018106 needs your review', 0, 1),
(125, 107, 676, 'Ticket No. : 2018107 needs your review', 0, 1),
(126, 108, 676, 'Ticket No. : 2018108 needs your review', 0, 1),
(127, 109, 676, 'Ticket No. : 2018109 needs your review', 0, 1),
(128, 110, 676, 'Ticket No. : 110 needs your review', 0, 1),
(129, 111, 676, 'Ticket No. : 2018111 needs your review', 0, 1),
(130, 112, 676, 'Ticket No. : 2018112 needs your review', 0, 1),
(131, 113, 676, 'Ticket No. : 2018113 needs your review', 0, 1),
(132, 114, 676, 'Ticket No. : 2018114 needs your review', 0, 1),
(133, 115, 676, 'Ticket No. : 2018115 needs your review', 0, 1),
(134, 116, 676, 'Ticket No. : 2018116 needs your review', 0, 1),
(135, 117, 676, 'Ticket No. : 2018117 needs your review', 0, 1),
(136, 118, 676, 'Ticket No. : 2018118 needs your review', 0, 1),
(137, 119, 676, 'Ticket No. : 2018119 needs your review', 0, 1),
(138, 120, 676, 'Ticket No. : 2018120 needs your review', 0, 1),
(139, 121, 676, 'Ticket No. : 2018121 needs your review', 0, 1),
(140, 122, 676, 'Ticket No. : 2018122 needs your review', 0, 1),
(141, 123, 676, 'Ticket No. : 2018123 needs your review', 0, 1),
(142, 124, 676, 'Ticket No. : 2018124 needs your review', 0, 1),
(143, 125, 676, 'Ticket No. : 2018125 needs your review', 0, 1),
(144, 126, 676, 'Ticket No. : 2018126 needs your review', 0, 1),
(145, 127, 676, 'Ticket No. : 2018127 needs your review', 0, 1),
(146, 128, 676, 'Ticket No. : 2018128 needs your review', 0, 1),
(147, 129, 676, 'Ticket No. : 2018129 needs your review', 0, 1),
(148, 130, 676, 'Ticket No. : 2018130 needs your review', 0, 1),
(149, 131, 676, 'Ticket No. : 2018131 needs your review', 0, 1),
(150, 132, 676, 'Ticket No. : 2018132 needs your review', 0, 1),
(151, 133, 712, 'Ticket No. : 2018133 needs your review', 0, 1),
(152, 134, 712, 'Ticket No. : 2018134 needs your review', 0, 1),
(153, 135, 712, 'Ticket No. : 2018135 needs your review', 0, 1),
(154, 136, 712, 'Ticket No. : 2018136 needs your review', 0, 1),
(155, 125, 678, '2018125 has been assigned to you', 1, 1),
(156, 125, 681, '2018125 has been assigned to you', 1, 1),
(157, 125, 681, '2018125 has been assigned to you', 1, 1),
(158, 125, 712, 'Your ticket 2018125 has been resolved', 0, 0),
(159, 125, 712, 'Your ticket 2018125 has been resolved', 0, 0),
(160, 125, 712, 'Your ticket 2018125 has been resolved', 0, 0),
(161, 125, 712, 'Your ticket 2018125 has been resolved', 0, 0),
(162, 125, 712, 'Your ticket 2018125 has been resolved', 0, 0),
(163, 006, 680, 'Your ticket 2018006 has been resolved', 0, 0),
(164, 007, 676, 'Your ticket 2018007 has been resolved', 0, 1),
(165, 005, 680, 'Your ticket 2018005 has been resolved', 0, 0),
(166, 007, 676, 'Your ticket 2018007 has been resolved', 0, 1),
(167, 001, 680, 'Your ticket 2018001 has been resolved', 0, 0),
(168, 007, 676, 'Your ticket 2018007 has been resolved', 0, 1),
(169, 005, 680, 'Your ticket 2018005 has been resolved', 0, 0),
(170, 005, 680, 'Your ticket 2018005 has been resolved', 0, 0),
(171, 006, 680, 'Your ticket 2018006 has been resolved', 0, 0),
(172, 006, 680, 'Your ticket 2018006 has been resolved', 0, 0),
(173, 006, 680, 'Your ticket 2018006 has been resolved', 0, 0),
(174, 006, 680, 'Your ticket 2018006 has been resolved', 0, 0),
(175, 006, 680, 'Your ticket 2018006 has been resolved', 0, 0),
(176, 006, 680, 'Your ticket 2018006 has been resolved', 0, 0),
(177, 006, 680, 'Your ticket 2018006 has been resolved', 0, 0),
(178, 006, 680, 'Your ticket 2018006 has been resolved', 0, 0),
(179, 006, 680, 'Your ticket 2018006 has been resolved', 0, 0),
(180, 006, 680, 'Your ticket 2018006 has been resolved', 0, 0),
(181, 006, 680, 'Your ticket 2018006 has been resolved', 0, 0),
(182, 006, 680, 'Your ticket 2018006 has been resolved', 0, 0),
(183, 006, 680, 'Your ticket 2018006 has been resolved', 0, 0),
(184, 006, 680, 'Your ticket 2018006 has been resolved', 0, 0),
(185, 137, 680, 'Ticket No. : 2018137 needs your review', 0, 0),
(186, 138, 685, 'Ticket No. : 2018138 needs your review', 0, 0),
(187, 139, 683, 'Ticket No. : 2018139 needs your review', 0, 0),
(188, 140, 712, 'Ticket No. : 2018140 needs your review', 0, 0),
(189, 141, 683, 'Ticket No. : 2018141 needs your review', 0, 0),
(190, 003, 681, '2018003 has been assigned to you', 0, 0),
(191, 003, 680, 'Your ticket 2018003 has been resolved', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `request_details_t`
--

CREATE TABLE `request_details_t` (
  `details_id` int(11) NOT NULL,
  `ticket_id` int(3) UNSIGNED ZEROFILL NOT NULL,
  `name` char(40) NOT NULL,
  `request_type` enum('New','Additional','Reset Password','Deactivate') NOT NULL,
  `application_name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `request_details_t`
--

INSERT INTO `request_details_t` (`details_id`, `ticket_id`, `name`, `request_type`, `application_name`) VALUES
(1, 002, 'Zairra', 'New', 'Lotus'),
(2, 002, 'Sheila', 'Additional', 'IBM Notes');

-- --------------------------------------------------------

--
-- Table structure for table `service_ticket_t`
--

CREATE TABLE `service_ticket_t` (
  `ticket_id` int(3) UNSIGNED ZEROFILL NOT NULL,
  `findings` varchar(250) DEFAULT NULL,
  `request_details` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service_ticket_t`
--

INSERT INTO `service_ticket_t` (`ticket_id`, `findings`, `request_details`) VALUES
(001, NULL, 'broken '),
(002, NULL, 'hi'),
(003, NULL, 'h'),
(004, NULL, 'hi'),
(005, NULL, 'sa'),
(006, NULL, 'sa'),
(007, NULL, 'hi'),
(008, NULL, 'hi'),
(025, NULL, 'hi'),
(026, NULL, 'hi'),
(028, NULL, 'hi'),
(078, NULL, 'hi'),
(079, NULL, 'hi'),
(080, NULL, 'hi'),
(081, NULL, 'gu'),
(082, NULL, 'hi'),
(083, NULL, 'jo'),
(084, NULL, 'hi'),
(085, NULL, 'hi'),
(086, NULL, 'hi'),
(087, NULL, 'hi'),
(088, NULL, 'pkpkp'),
(089, NULL, 'hi'),
(090, NULL, 'oj'),
(091, NULL, 'oj'),
(092, NULL, 'oj'),
(093, NULL, 'oj'),
(094, NULL, 'oj'),
(095, NULL, 'oj'),
(096, NULL, 'oj'),
(097, NULL, 'oj'),
(098, NULL, 'oj'),
(099, NULL, 'oj'),
(100, NULL, 'HI'),
(101, NULL, 'HI'),
(103, NULL, 'hi hello'),
(104, NULL, 'sasw'),
(105, NULL, 'we'),
(106, NULL, 'kjkj'),
(107, NULL, 'km'),
(108, NULL, 'klk'),
(109, NULL, 'er'),
(110, NULL, 'kmk'),
(111, NULL, 'km'),
(112, NULL, 'l,k;'),
(113, NULL, 'lll'),
(114, NULL, 'kl'),
(115, NULL, 'kkk'),
(116, NULL, 'wrw'),
(117, NULL, ',lml'),
(118, NULL, 'HI'),
(119, NULL, 'EYE'),
(120, NULL, 'Table'),
(121, NULL, 'kl'),
(122, NULL, 'kml'),
(123, NULL, 'HEHE'),
(124, NULL, 'waaaah'),
(125, NULL, 'wqe'),
(126, NULL, 'njnj'),
(127, NULL, '3r1'),
(128, NULL, 'lllll'),
(129, NULL, 'haha'),
(130, NULL, 'wq'),
(131, NULL, 'afe'),
(132, NULL, 'aa');

-- --------------------------------------------------------

--
-- Table structure for table `sla_t`
--

CREATE TABLE `sla_t` (
  `id` int(3) NOT NULL,
  `severity_level` varchar(4) NOT NULL,
  `description` varchar(30) NOT NULL,
  `resolution_time` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sla_t`
--

INSERT INTO `sla_t` (`id`, `severity_level`, `description`, `resolution_time`) VALUES
(1, 'SEV1', 'Critical', 4),
(2, 'SEV2', 'Important', 6),
(3, 'SEV3', 'Normal', 8),
(4, 'SEV4', 'Low', 24),
(5, 'SEV5', 'Very Low', 48);

-- --------------------------------------------------------

--
-- Table structure for table `ticket_status_t`
--

CREATE TABLE `ticket_status_t` (
  `status_id` int(1) NOT NULL,
  `ticket_status` varchar(15) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket_status_t`
--

INSERT INTO `ticket_status_t` (`status_id`, `ticket_status`, `description`) VALUES
(1, 'New', NULL),
(2, 'Checked', NULL),
(3, 'Approved', NULL),
(4, 'Rejected', NULL),
(5, 'Pending', NULL),
(6, 'Assigned', NULL),
(7, 'Resolved', NULL),
(8, 'Closed', NULL),
(9, 'Cancelled', NULL),
(10, 'Rejected', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ticket_t`
--

CREATE TABLE `ticket_t` (
  `ticket_id` int(3) UNSIGNED ZEROFILL NOT NULL,
  `ticket_number` int(11) NOT NULL,
  `ticket_title` varchar(40) NOT NULL,
  `date_prepared` timestamp NULL DEFAULT NULL,
  `ticket_type` enum('Service','User Access') DEFAULT NULL,
  `ticket_category` enum('Technicals','Access','Network') DEFAULT NULL,
  `severity_level` int(1) DEFAULT NULL,
  `ticket_status` int(1) DEFAULT NULL,
  `date_assigned` datetime NOT NULL,
  `date_required` datetime DEFAULT NULL,
  `remarks` varchar(250) DEFAULT NULL,
  `resolution_date` datetime DEFAULT NULL,
  `auto_close_date` datetime DEFAULT NULL,
  `user_id` int(5) NOT NULL,
  `ticket_agent_id` int(5) DEFAULT NULL,
  `it_group_manager_id` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket_t`
--

INSERT INTO `ticket_t` (`ticket_id`, `ticket_number`, `ticket_title`, `date_prepared`, `ticket_type`, `ticket_category`, `severity_level`, `ticket_status`, `date_assigned`, `date_required`, `remarks`, `resolution_date`, `auto_close_date`, `user_id`, `ticket_agent_id`, `it_group_manager_id`) VALUES
(001, 2018001, 'Lennon trial', '2018-01-20 02:58:46', 'Service', 'Technicals', 5, 8, '2018-02-19 16:09:25', '2018-02-21 16:09:25', NULL, '2018-03-05 14:30:28', '2018-03-05 14:31:00', 680, 681, 678),
(002, 2018002, 'January', '2018-02-20 23:09:02', 'Service', 'Technicals', 1, 8, '2018-02-21 07:08:08', '2018-02-21 11:08:08', NULL, NULL, NULL, 680, 681, 678),
(003, 2018003, 'trial', '2018-02-20 23:07:17', 'Service', 'Technicals', 1, 7, '2018-03-09 02:46:17', '2018-02-21 11:07:17', NULL, NULL, '2018-03-15 00:00:00', 680, 681, 678),
(004, 2018004, 'hi', '2018-02-20 23:05:46', 'Service', 'Technicals', 1, 5, '2018-02-21 07:05:46', '2018-02-21 11:05:46', NULL, NULL, NULL, 680, NULL, 678),
(005, 2018005, 'hola', '2018-02-20 23:06:44', 'Service', 'Technicals', 1, 8, '2018-02-21 07:04:37', '2018-02-21 11:04:37', NULL, '2018-03-07 00:16:39', '2000-03-05 14:31:00', 680, 681, 678),
(006, 2018006, 'hola', '2018-02-20 22:43:53', 'Service', 'Technicals', 1, 8, '2018-02-20 15:02:11', '2018-02-20 19:02:11', NULL, '2018-03-07 13:48:23', '2018-03-06 00:00:00', 680, 681, 678),
(007, 2018007, 'hi', '2018-02-20 22:40:58', 'Service', 'Technicals', 3, 8, '2018-02-20 22:35:32', '2018-02-21 06:35:32', NULL, '2018-03-07 00:13:18', '2018-03-05 14:31:00', 676, 681, 678),
(008, 2018008, 'hi', '2018-02-20 22:43:31', 'Service', 'Technicals', 1, 8, '2018-02-20 20:33:41', '2018-02-21 00:33:41', NULL, NULL, NULL, 676, 681, 678),
(009, 2018009, 'Marketing System Access', '2018-02-20 14:41:05', 'User Access', NULL, NULL, 2, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(010, 2018010, 'Payroll System Access', '2018-02-20 15:01:19', 'User Access', NULL, NULL, 2, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 685, NULL, NULL),
(011, 2018011, 'h', '2018-02-20 15:08:26', 'User Access', NULL, NULL, 2, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 685, NULL, NULL),
(012, 2018012, 'o', '2018-02-20 15:14:07', 'User Access', NULL, NULL, 2, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 683, NULL, NULL),
(013, 2018013, 'ho', '2018-02-20 15:23:02', 'User Access', 'Technicals', 3, 8, '2018-02-20 23:19:43', '2018-02-21 07:19:43', NULL, NULL, NULL, 680, 681, 678),
(014, 2018014, 'O', '2018-02-21 09:26:08', 'User Access', 'Technicals', 3, 8, '2018-02-21 17:22:42', '2018-02-22 01:22:42', NULL, NULL, NULL, 685, 688, 678),
(015, 2018015, 'OH', '2018-02-20 23:03:57', 'User Access', 'Technicals', 2, 7, '2018-02-21 07:03:42', '2018-02-21 13:03:42', NULL, NULL, NULL, 685, 681, 678),
(016, 2018016, 'OH', '2018-02-20 16:30:12', 'User Access', NULL, NULL, 2, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 685, NULL, NULL),
(017, 2018017, 'hi', '2018-02-20 16:32:49', 'User Access', NULL, NULL, 2, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 680, NULL, NULL),
(023, 2018023, 'New System Access', '2018-02-21 09:01:44', 'User Access', NULL, NULL, 10, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 680, NULL, NULL),
(024, 2018024, 'hi', '2018-02-21 09:59:33', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(025, 2018025, 'hi', '2018-02-21 15:03:20', 'Service', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(026, 2018026, 'hi', '2018-02-21 15:04:32', 'Service', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(027, 2018027, 'ih', '2018-02-21 15:11:24', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(028, 2018028, 'hi', '2018-02-21 15:15:49', 'Service', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(029, 2018029, 'HI', '2018-02-28 09:37:59', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(030, 2018030, 'hi', '2018-02-28 09:42:02', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(031, 2018031, 'h', '2018-02-28 09:43:10', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(032, 2018032, 'ih', '2018-02-28 09:52:46', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(033, 2018033, 'hi', '2018-02-28 09:54:53', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(034, 2018034, 'ihi', '2018-02-28 09:56:42', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(035, 2018035, 'ihih', '2018-02-28 09:58:15', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(036, 2018036, 'ih', '2018-02-28 10:01:35', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(037, 2018037, 'hi', '2018-02-28 10:03:15', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(038, 2018038, 'hi', '2018-02-28 10:09:36', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(039, 2018039, 'hi', '2018-02-28 10:14:39', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(040, 2018040, 'ojoj', '2018-02-28 10:24:34', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(041, 2018041, 'hi', '2018-02-28 10:26:28', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(042, 2018042, 'hi', '2018-02-28 10:27:32', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(043, 2018043, 'ih', '2018-02-28 10:28:34', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(044, 2018044, 'hi', '2018-02-28 10:30:09', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(045, 2018045, 'h', '2018-02-28 10:44:17', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(046, 2018046, 'hi', '2018-02-28 11:02:04', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(047, 2018047, 'ih', '2018-02-28 11:12:36', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(048, 2018048, 'hi', '2018-02-28 11:19:26', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(049, 2018049, 'hi', '2018-02-28 11:20:48', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(050, 2018050, 'hi', '2018-02-28 11:49:39', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(051, 2018051, 'hi', '2018-02-28 11:51:28', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(052, 2018052, 'My Access Request', '2018-02-28 11:56:36', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(053, 2018053, 'Desktop access', '2018-02-28 12:01:17', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(054, 2018054, 'Marketing Campaign Access', '2018-02-28 12:03:25', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(055, 2018055, 'hi', '2018-02-28 12:17:24', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(056, 2018056, 'hi', '2018-02-28 12:23:50', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(057, 2018057, 'hi', '2018-02-28 12:23:55', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(058, 2018058, 'i', '2018-02-28 12:24:25', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(059, 2018059, 'HIH', '2018-02-28 12:30:23', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(060, 2018060, 'hi', '2018-02-28 12:35:23', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(061, 2018061, 'o', '2018-02-28 12:37:47', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(062, 2018062, 'ih', '2018-02-28 12:43:10', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(063, 2018063, 'hi', '2018-02-28 12:43:47', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(064, 2018064, 'i', '2018-02-28 12:51:44', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(065, 2018065, 'ih', '2018-02-28 12:53:45', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(066, 2018066, 'u', '2018-02-28 12:55:13', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(067, 2018067, 'hi', '2018-02-28 12:56:12', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(068, 2018068, 'hi', '2018-02-28 12:59:38', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(069, 2018069, 'o', '2018-02-28 13:00:11', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(070, 2018070, 'ih', '2018-02-28 13:01:21', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(071, 2018071, 'ih', '2018-02-28 13:02:04', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(072, 2018072, 'h', '2018-02-28 13:03:05', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(073, 2018073, 'HR System Acces', '2018-02-28 13:04:52', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(074, 2018074, 'J', '2018-02-28 13:05:34', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(075, 2018075, 'JSQOJ', '2018-02-28 13:06:25', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(076, 2018076, 'HIHI', '2018-02-28 13:59:15', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL),
(077, 2018077, 'h', '2018-02-28 23:34:36', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 677, NULL, NULL),
(078, 2018078, 'hi', '2018-03-03 12:22:43', 'Service', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 677, NULL, NULL),
(079, 2018079, 'hi', '2018-03-03 12:23:35', 'Service', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 677, NULL, NULL),
(080, 2018080, 'hi', '2018-03-03 12:23:58', 'Service', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 677, NULL, NULL),
(081, 2018081, 'gu', '2018-03-03 12:25:52', 'Service', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 677, NULL, NULL),
(082, 2018082, 'hihi', '2018-03-03 12:35:50', 'Service', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 677, NULL, NULL),
(083, 2018083, 'jo', '2018-03-03 12:37:53', 'Service', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 677, NULL, NULL),
(084, 2018084, 'hi', '2018-03-03 12:41:06', 'Service', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 677, NULL, NULL),
(085, 2018085, 'hanny', '2018-03-03 12:49:11', 'Service', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 677, NULL, NULL),
(086, 2018086, 'hi', '2018-03-03 13:03:36', 'Service', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 677, NULL, NULL),
(087, 2018087, 'hi', '2018-03-03 13:12:15', 'Service', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 677, NULL, NULL),
(088, 2018088, 'pkpk', '2018-03-03 13:18:08', 'Service', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 677, NULL, NULL),
(089, 2018089, 'i', '2018-03-03 13:27:56', 'Service', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 677, NULL, NULL),
(090, 2018090, 'ji', '2018-03-03 13:36:30', 'Service', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 677, NULL, NULL),
(091, 2018091, 'ji', '2018-03-03 13:37:09', 'Service', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 677, NULL, NULL),
(092, 2018092, 'ji', '2018-03-03 13:37:10', 'Service', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 677, NULL, NULL),
(093, 2018093, 'ji', '2018-03-03 13:37:16', 'Service', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 677, NULL, NULL),
(094, 2018094, 'ji', '2018-03-03 13:37:19', 'Service', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 677, NULL, NULL),
(095, 2018095, 'ji', '2018-03-03 13:37:30', 'Service', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 677, NULL, NULL),
(096, 2018096, 'ji', '2018-03-03 13:39:02', 'Service', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 677, NULL, NULL),
(097, 2018097, 'ji', '2018-03-03 13:39:32', 'Service', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 677, NULL, NULL),
(098, 2018098, 'ji', '2018-03-03 13:40:04', 'Service', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 677, NULL, NULL),
(099, 2018099, 'ji', '2018-03-03 13:40:13', 'Service', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 677, NULL, NULL),
(100, 2018100, 'HI', '2018-03-03 13:40:46', 'Service', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 677, NULL, NULL),
(101, 2018101, 'HI', '2018-03-03 13:41:05', 'Service', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 677, NULL, NULL),
(102, 2018102, 'Sims 4 Access', '2018-03-04 15:52:21', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 712, NULL, NULL),
(103, 2018103, 'Mouse not working', '2018-03-04 15:57:21', 'Service', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 712, NULL, NULL),
(104, 2018104, 'eweq', '2018-03-04 16:00:37', 'Service', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 712, NULL, NULL),
(105, 2018105, 'eq', '2018-03-04 16:03:05', 'Service', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 712, NULL, NULL),
(106, 2018106, 'ada', '2018-03-04 16:07:01', 'Service', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 712, NULL, NULL),
(107, 2018107, 'lol', '2018-03-04 16:08:19', 'Service', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 712, NULL, NULL),
(108, 2018108, 'ad', '2018-03-04 16:09:34', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 712, NULL, NULL),
(109, 2018109, 'ad', '2018-03-04 16:10:37', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 712, NULL, NULL),
(110, 110, 'ade', '2018-03-04 16:10:55', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 712, NULL, NULL),
(111, 2018111, 'fw', '2018-03-04 16:11:50', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 712, NULL, NULL),
(112, 2018112, '12t', '2018-03-04 16:13:11', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 712, NULL, NULL),
(113, 2018113, 'lll', '2018-03-04 16:13:31', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 712, NULL, NULL),
(114, 2018114, 'k;', '2018-03-04 16:14:02', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 712, NULL, NULL),
(115, 2018115, 'kkk', '2018-03-04 16:17:46', 'Service', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 712, NULL, NULL),
(116, 2018116, 'as', '2018-03-04 16:18:06', 'Service', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 712, NULL, NULL),
(117, 2018117, 'qw', '2018-03-02 01:00:00', 'Service', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 712, NULL, NULL),
(118, 2018118, 'HEEBIJEEBIE', '2018-03-06 00:00:00', 'Service', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 712, NULL, NULL),
(119, 2018119, 'QUEER', '2018-03-06 00:00:00', 'Service', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 712, NULL, NULL),
(120, 2018120, 'Chef\'s', '2018-03-06 00:00:00', 'Service', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 712, NULL, NULL),
(121, 2018121, 'lk', '2018-03-06 00:00:00', 'Service', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 712, NULL, NULL),
(122, 2018122, 'eqw', '2018-03-06 00:00:00', '', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 712, NULL, NULL),
(123, 2018123, 'GIMME HEEBEEJEEBIES', '2018-03-05 00:00:00', 'Service', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 712, NULL, NULL),
(124, 2018124, 'WHITE HOUSE DoWN', '2018-03-07 00:00:00', 'Service', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 712, NULL, NULL),
(125, 2018125, 'weq', '2018-03-07 00:00:00', 'Service', 'Technicals', 2, 7, '2018-03-05 02:04:26', '2018-03-05 08:04:26', NULL, '2018-03-05 02:57:09', NULL, 712, 681, 678),
(126, 2018126, 'anuna', '2018-03-07 00:00:00', '', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 712, NULL, NULL),
(127, 2018127, 'wqe', '2018-03-07 00:00:00', '', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 712, NULL, NULL),
(128, 2018128, '6', '2018-03-07 00:00:00', '', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 712, NULL, NULL),
(129, 2018129, '6', '2018-03-07 00:00:00', '', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 712, NULL, NULL),
(130, 2018130, '2018-03-05', '2018-03-07 00:00:00', '', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 712, NULL, NULL),
(131, 2018131, '2018-03-05', '2018-03-07 00:00:00', '', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 712, NULL, NULL),
(132, 2018132, 'aaaa', '2018-03-05 00:00:00', 'Service', NULL, NULL, 8, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 712, NULL, NULL),
(133, 2018133, 'mkmk', '2018-03-05 00:00:00', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 712, NULL, NULL),
(134, 2018134, 'kkl', '2018-03-05 00:00:00', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 712, NULL, NULL),
(135, 2018135, 'kjk', '2018-03-05 00:00:00', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 712, NULL, NULL),
(136, 2018136, 'klklk', '2018-03-05 00:00:00', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 712, NULL, NULL),
(137, 2018137, 'AutoCad Access', '2018-03-06 16:00:00', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 681, NULL, NULL),
(138, 2018138, 'AutoCad Access', '2018-03-09 08:00:00', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 681, NULL, NULL),
(139, 2018139, 'Sims 4 Access', '2018-03-08 00:00:00', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 681, NULL, NULL),
(140, 2018140, 'Microsoft Office', '2018-03-12 00:00:00', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 681, NULL, NULL),
(141, 2018141, 'NEW EMPLOYEE ACCESS', '2018-03-12 00:00:00', 'User Access', NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 676, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `token_t`
--

CREATE TABLE `token_t` (
  `email_address` varchar(50) NOT NULL,
  `token` varchar(40) NOT NULL,
  `is_used` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `token_t`
--

INSERT INTO `token_t` (`email_address`, `token`, `is_used`) VALUES
('dondumaliang@gmail.com', 'BPX47Q1DU7', 0),
('dondumaliang@gmail.com', 'Y9BRXYENQF', 1),
('dondumaliang@gmail.com', 'Z38QVS6ZAR', 1),
('dondumaliang@gmail.com', '8LXY8RT613', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_access_ticket_t`
--

CREATE TABLE `user_access_ticket_t` (
  `ticket_id` int(3) UNSIGNED ZEROFILL NOT NULL,
  `company` varchar(45) NOT NULL,
  `dept_proj` char(20) NOT NULL,
  `rc_no` int(5) NOT NULL,
  `name` text NOT NULL,
  `access_type` enum('New','Additional','Reset Password','Deactivate') NOT NULL,
  `application_name` varchar(40) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `approver` int(11) DEFAULT NULL,
  `isApproved` tinyint(1) DEFAULT NULL,
  `checker` int(11) DEFAULT NULL,
  `isChecked` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_access_ticket_t`
--

INSERT INTO `user_access_ticket_t` (`ticket_id`, `company`, `dept_proj`, `rc_no`, `name`, `access_type`, `application_name`, `expiry_date`, `approver`, `isApproved`, `checker`, `isChecked`) VALUES
(009, 'Petron Corpo.', 'Marketing', 12345, 'Dons Dumaliang', '', 'MSA', NULL, 685, NULL, 683, 1),
(010, 'Shell Corp.', 'HR', 67890, 'Trina Tan', 'Additional', 'Payroll System', NULL, 680, NULL, 683, NULL),
(011, 'hi', 'hi', 10, 'ih', '', 'ih', NULL, 683, NULL, 680, 1),
(012, 'oh', 'h', 8108, 'ho', '', 'ho', NULL, 680, NULL, 685, 1),
(013, 'ho', 'ho', 2810, 'h', '', 'ho', NULL, 685, 1, 683, 1),
(014, 'HO', 'O', 110, 'HO', '', 'H', NULL, 685, 1, 683, 1),
(015, 'OH', 'OH', 120, 'OH', '', 'OH', NULL, 683, 1, 680, 1),
(016, 'OH', 'OH', 10280, 'HO', '', 'OHOH', NULL, 683, NULL, 680, 1),
(017, 'ho', 'hi', 2308, 'hi', '', 'hi', NULL, 685, NULL, 683, 1),
(023, 'Unilever Philippines', 'Meet and Greet', 12345, 'Christiana Tan', 'New', 'Externals Visitor System', NULL, 685, NULL, 683, 1),
(024, 'hello', 'hi', 2810281, 'hi', '', 'hi', NULL, 683, NULL, 680, NULL),
(027, 'hi', 'hih', 12345, 'hi', '', 'ih', NULL, 683, NULL, 680, NULL),
(029, 'HI', 'HI', 12180, 'HI', '', 'HI', NULL, 685, NULL, 683, NULL),
(030, 'hi', 'hihi', 1201, 'h', '', 'hi', NULL, 678, NULL, 677, NULL),
(031, 'hi', 'hi', 100, 'ih', '', 'ih', NULL, 680, NULL, 683, NULL),
(032, 'hih', 'ih', 1080, 'iih', '', 'ih', NULL, 680, NULL, 683, NULL),
(033, 'hi', 'hi', 20180, 'ih', '', 'h', NULL, 680, NULL, 683, NULL),
(034, 'hhi', 'hih', 10, 'hih', '', 'hi', NULL, 676, NULL, 678, NULL),
(035, 'hih', 'ih', 20810, 'i', '', 'ih', NULL, 680, NULL, 683, NULL),
(036, 'ih', 'ih', 20801, 'hi', '', 'i', NULL, 683, NULL, 680, NULL),
(037, 'hi', 'hi', 10921029, 'ih', '', 'hi', NULL, 683, NULL, 680, NULL),
(038, 'hi', 'hi', 1010, 'h', '', 'hi', NULL, 685, NULL, 683, NULL),
(039, 'hi', 'hi', 1810, 'h', '', 'hihi', NULL, 683, NULL, 680, NULL),
(040, 'dwodoqj', 'oj', 2102, 'jo', '', 'ojojo', NULL, 680, NULL, 680, NULL),
(041, 'hi', 'hi', 210, 'ih', '', 'hi', NULL, 680, NULL, 685, NULL),
(042, 'hi', 'hi', 20810281, 'h', '', 'hi', NULL, 683, NULL, 680, NULL),
(043, 'hi', 'h', 1928198, 'ih', '', 'ih', NULL, 683, NULL, 680, NULL),
(044, 'hi', 'hi', 281081, 'ihi', '', 'h', NULL, 683, NULL, 680, NULL),
(045, 'hi', 'hi', 192710, 'ih', '', 'ih', NULL, 683, NULL, 680, NULL),
(046, 'hi', 'hi', 182012810, 'hi', '', 'hi', NULL, 680, NULL, 679, NULL),
(047, 'hih', 'h', 8210, 'hi', '', 'ih', NULL, 683, NULL, 680, NULL),
(048, 'hi', 'hi', 201, 'h', '', 'hi', NULL, 683, NULL, 685, NULL),
(049, 'hi', 'hi', 123456, 'ihi', '', 'hi', NULL, 683, NULL, 680, NULL),
(050, 'hi', 'hi', 123536, 'hi', '', 'hi', NULL, 683, NULL, 680, NULL),
(051, 'hi', 'hi', 1235, 'hi', '', 'hi', NULL, 680, NULL, 680, NULL),
(052, 'My Company', 'My Department', 12345, 'April Angelo', 'New', 'Payroll System', NULL, 683, NULL, 680, NULL),
(053, 'EEI Corporation', 'MRT7', 12345, 'Trina Tan', 'New', 'Desktop', NULL, 680, NULL, 683, NULL),
(054, 'Nestle PH', 'CCSD', 12345, 'Hanney Angelo', 'Additional', 'Cycle Plan Operations', NULL, 683, NULL, 680, NULL),
(055, 'hi', 'hi', 1021, 'ih', '', 'hi', NULL, 683, NULL, 683, NULL),
(056, 'hi', 'hi', 10, 'ih', '', 'h', NULL, 683, NULL, 680, NULL),
(057, 'hi', 'hi', 10, 'ih', '', 'h', NULL, 683, NULL, 680, NULL),
(058, 'hi', 'h', 21, 'hih', '', 'hih', NULL, 676, NULL, 680, NULL),
(059, 'HI', 'HIHI', 91829, 'IH', '', 'IH', NULL, 683, NULL, 680, NULL),
(060, 'hi', 'hi', 33, 'ih', '', 'h', NULL, 676, NULL, 676, NULL),
(061, 'no', 'j', 3820, 'jo', '', 'jo', NULL, 676, NULL, 676, NULL),
(062, 'hi', 'ih', 21927, 'hihi', '', 'ih', NULL, 676, NULL, 678, NULL),
(063, 'i', 'hi', 1, 'ih', '', 'hi', NULL, 676, NULL, 680, NULL),
(064, 'ih', 'ih', 21, 'ih', '', 'hi', NULL, 676, NULL, 680, NULL),
(065, 'hi', 'h', 2, 'hi', '', 'ih', NULL, 676, NULL, 680, NULL),
(066, 'ig', 'ug', 9271, 'u', '', 'gu', NULL, 676, NULL, 676, NULL),
(067, 'hi', 'hi', 238, 'i', '', 'h', NULL, 676, NULL, 676, NULL),
(068, 'hi', 'hi', 9101, 'i', '', 'h', NULL, 680, NULL, 680, NULL),
(069, 'u', 'u', 3, 'o', '', 'j', NULL, 676, NULL, 680, NULL),
(070, 'hi', 'h', 1212, 'ih', '', 'ih', NULL, 676, NULL, 683, NULL),
(071, 'hi', 'h', 780, 'ihr', '', 'ih', NULL, 683, NULL, 680, NULL),
(072, 'hi', 'hi', 3820, 'i', '', 'ih', NULL, 676, NULL, 680, NULL),
(073, 'Shell Corp.', 'HR', 12345, 'Lennon Villanueva', 'New', 'HR Member System', NULL, 683, NULL, 680, NULL),
(074, 'J', 'OJO', 121, 'O', '', 'OJ', NULL, 680, NULL, 680, NULL),
(075, 'Petron Corpo.', 'Purchasing', 1018281, 'OJ', '', 'JO', NULL, 680, NULL, 676, NULL),
(076, 'HI', 'HI', 382108, 'HI', '', 'HI', NULL, 686, NULL, 680, NULL),
(077, 'hi', 'hi', 123456, 'hi', '', 'ihih', NULL, 680, NULL, 683, NULL),
(102, 'EEI', 'MRT 8', 11109, 'Lennon Villanueva', '', 'Sims 4', NULL, 683, NULL, 712, NULL),
(133, 'EEI', 'EEI', 11111, 'Lennon Villanueva', '', 'mkmk', NULL, 683, NULL, 712, NULL),
(134, 'k', 'kl', 13190, 'Lennon Villanueva', '', 'EEI', NULL, 683, NULL, 712, NULL),
(135, 'jkj', 'kj', 9898, 'Lennon Villanueva', '', 'WIOI', NULL, 685, NULL, 712, NULL),
(136, 'klkl', 'klkl', 239, 'Lennon Villanueva', 'New', 'kjoijij', NULL, 685, NULL, 712, NULL),
(137, 'EEI', 'Panglao Airport', 7, 'User Technician', 'New', 'AutoCad', NULL, 683, NULL, 680, NULL),
(138, 'EEI', 'Panglao Airport', 1010101, 'User Technician', 'New', 'AutoCad', NULL, 683, NULL, 685, NULL),
(139, 'EEI', 'MRT 8', 11111, 'User Technician', 'New', 'User Technician', NULL, 680, NULL, 683, NULL),
(140, 'EEI', 'Bataan Project', 9999, 'User Technician', 'New', 'User Technician', NULL, 683, NULL, 712, NULL),
(141, 'EEI', 'IT', 90909, '', 'New', '', NULL, 677, NULL, 683, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_t`
--

CREATE TABLE `user_t` (
  `user_id` int(5) NOT NULL,
  `first_name` char(30) NOT NULL,
  `last_name` char(20) NOT NULL,
  `userid` char(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email_address` varchar(50) NOT NULL,
  `user_type` enum('Administrator','Requestor','Technicals Group Manager','Access Group Manager','Network Group Manager','Technician','Network Engineer') NOT NULL,
  `is_firstlogin` tinyint(1) DEFAULT NULL,
  `last_update` datetime DEFAULT NULL,
  `next_update` datetime DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `deactivation_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_t`
--

INSERT INTO `user_t` (`user_id`, `first_name`, `last_name`, `userid`, `password`, `email_address`, `user_type`, `is_firstlogin`, `last_update`, `next_update`, `isActive`, `deactivation_date`) VALUES
(676, 'User', 'Administrator', 'administrator', 'aa15a654dad571bb6a60a3c5ac1f6eae', 'dondumaliang@gmail.com', 'Administrator', 1, '2018-03-09 02:32:39', '2018-06-07 02:32:39', 1, NULL),
(677, 'User', 'Access Manager', 'accessmanager', 'aa15a654dad571bb6a60a3c5ac1f6eae', 'dondumaliang@gmail.com', 'Access Group Manager', 1, '0000-00-00 00:00:00', NULL, 1, '2018-03-02 12:40:31'),
(678, 'User', 'Technicals Manager', 'technicalsmanager', 'aa15a654dad571bb6a60a3c5ac1f6eae', 'dondumaliang@gmail.com', 'Technicals Group Manager', 1, '0000-00-00 00:00:00', NULL, 1, NULL),
(679, 'User', 'Network Manager', 'networkmanager', 'aa15a654dad571bb6a60a3c5ac1f6eae', 'dondumaliang@gmail.com', 'Network Group Manager', 1, '0000-00-00 00:00:00', NULL, 1, NULL),
(680, 'User', 'Requestor', 'requestor', 'aa15a654dad571bb6a60a3c5ac1f6eae', 'dondumaliang@gmail.com', 'Requestor', 1, '0000-00-00 00:00:00', NULL, 1, NULL),
(681, 'User', 'Technician', 'technician', 'aa15a654dad571bb6a60a3c5ac1f6eae', 'dondumaliang@gmail.com', 'Technician', 1, '0000-00-00 00:00:00', NULL, 1, NULL),
(682, 'User', 'Network Engineer', 'networkengineer', 'aa15a654dad571bb6a60a3c5ac1f6eae', 'dondumaliang@gmail.com', 'Network Engineer', NULL, '0000-00-00 00:00:00', NULL, 1, NULL),
(683, 'User', 'Requestor Two', 'requestortwo', 'aa15a654dad571bb6a60a3c5ac1f6eae', 'dondumaliang@gmail.com', 'Requestor', 1, '0000-00-00 00:00:00', NULL, 0, NULL),
(685, 'User', 'Requestor Four', 'requestorfour', 'aa15a654dad571bb6a60a3c5ac1f6eae', 'dondumaliang@gmail.com', 'Requestor', 1, '0000-00-00 00:00:00', NULL, 1, NULL),
(686, 'User', 'Requestor Five', 'requestorfive', 'aa15a654dad571bb6a60a3c5ac1f6eae', 'dondumaliang@gmail.com', 'Requestor', 1, '2018-03-08 10:12:41', '2018-06-06 10:12:41', 1, NULL),
(688, 'User', 'Requestor Six', 'requestorsix', 'aa15a654dad571bb6a60a3c5ac1f6eae', 'dondumaliang@gmail.com', 'Technician', 1, '0000-00-00 00:00:00', NULL, 1, NULL),
(689, 'User', 'Requestor Seven', 'requestorseven', 'aa15a654dad571bb6a60a3c5ac1f6eae', 'dondumaliang@gmail.com', 'Technician', NULL, '0000-00-00 00:00:00', NULL, 1, NULL),
(712, 'Lennon', 'Villanueva', 'lvillanueva', 'aa15a654dad571bb6a60a3c5ac1f6eae', 'dondumaliang@gmail.com', 'Requestor', 1, '0000-00-00 00:00:00', NULL, 1, NULL),
(4762, 'Miggy', 'Lopez', 'jmblopez', 'd625e51aa3d2fed8c1b25a3eac69dae2', 'dondumaliang@gmail.com', 'Requestor', NULL, '0000-00-00 00:00:00', NULL, 1, '2018-03-02 15:00:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log_t`
--
ALTER TABLE `activity_log_t`
  ADD PRIMARY KEY (`activity_log_id`),
  ADD KEY `ticket_id` (`ticket_id`);

--
-- Indexes for table `attachment_t`
--
ALTER TABLE `attachment_t`
  ADD PRIMARY KEY (`file_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `ticket_id` (`ticket_id`);

--
-- Indexes for table `faq_article_t`
--
ALTER TABLE `faq_article_t`
  ADD PRIMARY KEY (`article_id`),
  ADD KEY `subcategory_id` (`subcategory_id`);

--
-- Indexes for table `faq_subcategory_t`
--
ALTER TABLE `faq_subcategory_t`
  ADD PRIMARY KEY (`subcategory_id`);

--
-- Indexes for table `notification_t`
--
ALTER TABLE `notification_t`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `ticket_id` (`ticket_id`);

--
-- Indexes for table `request_details_t`
--
ALTER TABLE `request_details_t`
  ADD PRIMARY KEY (`details_id`),
  ADD KEY `ticket_id` (`ticket_id`);

--
-- Indexes for table `service_ticket_t`
--
ALTER TABLE `service_ticket_t`
  ADD KEY `service_ticket_t_ibfk_1` (`ticket_id`);

--
-- Indexes for table `sla_t`
--
ALTER TABLE `sla_t`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_status_t`
--
ALTER TABLE `ticket_status_t`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `ticket_t`
--
ALTER TABLE `ticket_t`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `requestor_id` (`user_id`),
  ADD KEY `ticket_number` (`ticket_number`),
  ADD KEY `severity_level` (`severity_level`),
  ADD KEY `ticket_status` (`ticket_status`);

--
-- Indexes for table `user_access_ticket_t`
--
ALTER TABLE `user_access_ticket_t`
  ADD UNIQUE KEY `ticket_id_2` (`ticket_id`),
  ADD KEY `ticket_id` (`ticket_id`);

--
-- Indexes for table `user_t`
--
ALTER TABLE `user_t`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log_t`
--
ALTER TABLE `activity_log_t`
  MODIFY `activity_log_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `attachment_t`
--
ALTER TABLE `attachment_t`
  MODIFY `file_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `faq_article_t`
--
ALTER TABLE `faq_article_t`
  MODIFY `article_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `faq_subcategory_t`
--
ALTER TABLE `faq_subcategory_t`
  MODIFY `subcategory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `notification_t`
--
ALTER TABLE `notification_t`
  MODIFY `notification_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=192;

--
-- AUTO_INCREMENT for table `request_details_t`
--
ALTER TABLE `request_details_t`
  MODIFY `details_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sla_t`
--
ALTER TABLE `sla_t`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ticket_status_t`
--
ALTER TABLE `ticket_status_t`
  MODIFY `status_id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ticket_t`
--
ALTER TABLE `ticket_t`
  MODIFY `ticket_id` int(3) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `user_t`
--
ALTER TABLE `user_t`
  MODIFY `user_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4763;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_log_t`
--
ALTER TABLE `activity_log_t`
  ADD CONSTRAINT `activity_log_t_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `ticket_t` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `attachment_t`
--
ALTER TABLE `attachment_t`
  ADD CONSTRAINT `attachment_t_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_t` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `attachment_t_ibfk_2` FOREIGN KEY (`ticket_id`) REFERENCES `ticket_t` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `faq_article_t`
--
ALTER TABLE `faq_article_t`
  ADD CONSTRAINT `faq_article_t_ibfk_1` FOREIGN KEY (`subcategory_id`) REFERENCES `faq_subcategory_t` (`subcategory_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notification_t`
--
ALTER TABLE `notification_t`
  ADD CONSTRAINT `notification_t_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_t` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `request_details_t`
--
ALTER TABLE `request_details_t`
  ADD CONSTRAINT `request_details_t_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `ticket_t` (`ticket_id`);

--
-- Constraints for table `service_ticket_t`
--
ALTER TABLE `service_ticket_t`
  ADD CONSTRAINT `service_ticket_t_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `ticket_t` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ticket_t`
--
ALTER TABLE `ticket_t`
  ADD CONSTRAINT `ticket_t_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_t` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_t_ibfk_3` FOREIGN KEY (`severity_level`) REFERENCES `sla_t` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_t_ibfk_4` FOREIGN KEY (`ticket_status`) REFERENCES `ticket_status_t` (`status_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_access_ticket_t`
--
ALTER TABLE `user_access_ticket_t`
  ADD CONSTRAINT `user_access_ticket_t_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `ticket_t` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
