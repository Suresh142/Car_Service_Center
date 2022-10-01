-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 30, 2022 at 09:08 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `car_service_center_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `category` varchar(250) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `status`, `date_created`) VALUES
(1, 'Hatchback', 1, '2022-09-26 11:05:25'),
(2, 'Minivan', 1, '2022-09-26 11:05:35'),
(3, 'Sports car', 1, '2022-09-26 11:05:49'),
(4, 'Compact car', 1, '2022-09-26 11:06:08'),
(5, 'Luxury car', 1, '2022-09-26 11:06:41');

-- --------------------------------------------------------

--
-- Table structure for table `mechanics_list`
--

CREATE TABLE `mechanics_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `contact` varchar(50) NOT NULL,
  `email` varchar(150) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mechanics_list`
--

INSERT INTO `mechanics_list` (`id`, `name`, `contact`, `email`, `status`, `date_created`) VALUES
(1, 'Prajwal', '9080911425', 'prajwal123@gmail.com', 1, '2022-09-26 11:19:55'),
(2, 'Omkar', '9080945321', 'omkar432@gmail.com', 1, '2022-09-26 11:20:25');

-- --------------------------------------------------------

--
-- Table structure for table `request_meta`
--

CREATE TABLE `request_meta` (
  `request_id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `request_meta`
--

INSERT INTO `request_meta` (`request_id`, `meta_field`, `meta_value`) VALUES
(5, 'contact', '9080999778'),
(5, 'email', 'nagesh@gmail.com'),
(5, 'address', 'Bangalore'),
(5, 'vehicle_name', 'Car'),
(5, 'vehicle_registration_number', 'WD001425'),
(5, 'vehicle_model', '2020'),
(5, 'service_id', '3'),
(5, 'pickup_address', 'Bangalore'),
(4, 'contact', '9080997675'),
(4, 'email', 'ravi@gmail.com'),
(4, 'address', 'koppal'),
(4, 'vehicle_name', 'Car'),
(4, 'vehicle_registration_number', 'WD001444'),
(4, 'vehicle_model', '2016'),
(4, 'service_id', '2'),
(4, 'pickup_address', 'Bangalore'),
(3, 'contact', '9080999321'),
(3, 'email', 'ramesh34@gmail.com'),
(3, 'address', 'Bangalore'),
(3, 'vehicle_name', 'Car'),
(3, 'vehicle_registration_number', 'WD001244'),
(3, 'vehicle_model', '2016'),
(3, 'service_id', '4'),
(3, 'pickup_address', 'Bangalore');

-- --------------------------------------------------------

--
-- Table structure for table `service_list`
--

CREATE TABLE `service_list` (
  `id` int(30) NOT NULL,
  `service` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `service_list`
--

INSERT INTO `service_list` (`id`, `service`, `description`, `status`, `date_created`) VALUES
(1, 'Change Oil', '&lt;p&gt;&lt;span style=&quot;background-color: rgb(255, 255, 255);&quot;&gt;&lt;font color=&quot;#000000&quot;&gt;&lt;span style=&quot;font-family: Roboto, sans-serif; font-size: 18px;&quot;&gt;An Oil Change is the act of&lt;/span&gt;&lt;span style=&quot;font-weight: 700; font-family: Roboto, sans-serif; font-size: 18px;&quot;&gt;&amp;nbsp;removing the used oil in your engine&lt;/span&gt;&lt;span style=&quot;font-family: Roboto, sans-serif; font-size: 18px;&quot;&gt;&amp;nbsp;and replacing it with new, clean oil. Over time, oil breaks down and gets dirty. These factors make oil much less slippery and less effective at their job of lubricating engine parts.&lt;/span&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;﻿&lt;/span&gt;&lt;/font&gt;&lt;/span&gt;&lt;/p&gt;', 1, '2022-09-26 11:07:59'),
(2, 'Engine Tune Up', '&lt;p&gt;&lt;span style=&quot;background-color: rgb(255, 255, 255);&quot; source=&quot;&quot; serif=&quot;&quot; pro&quot;,=&quot;&quot; georgia,=&quot;&quot; times,=&quot;&quot; &quot;times=&quot;&quot; new=&quot;&quot; roman&quot;,=&quot;&quot; serif;=&quot;&quot; font-size:=&quot;&quot; 18px;=&quot;&quot; background-color:=&quot;&quot; rgb(66,=&quot;&quot; 66,=&quot;&quot; 66);&quot;=&quot;&quot;&gt;&lt;font color=&quot;#000000&quot;&gt;Doing an engine tune-up isn&rsquo;t as common as it used to be, but it&rsquo;s not lost in time. While today&rsquo;s cars are loaded with all kinds of sensors and highly regulated ECUs, you still want to go ahead and perform a tune-up every now and again. At the very least, it&rsquo;s a way to bond with your car and get you under the hood and give you a better understanding of how everything works in harmony to provide motion.&amp;nbsp;&lt;/font&gt;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2022-09-26 11:08:41'),
(3, 'Overall Checkup', '&lt;p&gt;&lt;span style=&quot;background-color: rgb(255, 255, 255);&quot;&gt;&lt;font color=&quot;#000000&quot;&gt;&lt;span style=&quot;font-family: Roboto, sans-serif; font-size: 18px;&quot;&gt;The inspector must check the belt operations. The inspector must also check the hoses for any leaks or other issues. The inspector must check the exhaust manifold, tailpipes, muffler, and catalytic converter for damage, leaks or cracks. All these are part of a full&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-weight: 700; font-family: Roboto, sans-serif; font-size: 18px;&quot;&gt;car&lt;/span&gt;&lt;span style=&quot;font-family: Roboto, sans-serif; font-size: 18px;&quot;&gt;&amp;nbsp;inspection checklist.&lt;/span&gt;&lt;/font&gt;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2022-09-26 11:09:27'),
(4, 'Tire Replacement', '&lt;p&gt;&lt;span style=&quot;background-color: rgb(255, 255, 255);&quot;&gt;&lt;font color=&quot;#000000&quot;&gt;&lt;span style=&quot;font-size: 18px;&quot; noto=&quot;&quot; sans&quot;,=&quot;&quot; sans-serif;=&quot;&quot; font-size:=&quot;&quot; 1rem;&quot;=&quot;&quot;&gt;All tires have tire descriptions written on the sidewall. These consist of a series of letters and numbers which could look something like one of these:&lt;/span&gt;&lt;br&gt;&lt;/font&gt;&lt;/span&gt;&lt;/p&gt;&lt;ul style=&quot;border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: &quot; open=&quot;&quot; sans&quot;,=&quot;&quot; serif;=&quot;&quot; margin-right:=&quot;&quot; 0px;=&quot;&quot; margin-bottom:=&quot;&quot; 30px;=&quot;&quot; margin-left:=&quot;&quot; outline:=&quot;&quot; padding:=&quot;&quot; 0px=&quot;&quot; 35px;=&quot;&quot; vertical-align:=&quot;&quot; baseline;=&quot;&quot; list-style:=&quot;&quot; square;&quot;=&quot;&quot;&gt;&lt;li style=&quot;border: 0px; font-variant: inherit; font-stretch: inherit; line-height: 1.3; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;&quot;&gt;&lt;em style=&quot;border: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; background-color: rgb(255, 255, 255);&quot;&gt;&lt;font color=&quot;#000000&quot;&gt;P225 / 60 R16 94T&lt;/font&gt;&lt;/em&gt;&lt;/li&gt;&lt;li style=&quot;border: 0px; font-variant: inherit; font-stretch: inherit; line-height: 1.3; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;&quot;&gt;&lt;em style=&quot;border: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; background-color: rgb(255, 255, 255);&quot;&gt;&lt;font color=&quot;#000000&quot;&gt;P205 / 55 R19 92S M+S&lt;/font&gt;&lt;/em&gt;&lt;/li&gt;&lt;li style=&quot;border: 0px; font-variant: inherit; font-stretch: inherit; line-height: 1.3; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;&quot;&gt;&lt;em style=&quot;border: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; background-color: rgb(255, 255, 255);&quot;&gt;&lt;font color=&quot;#000000&quot;&gt;215/45R17 91V&lt;/font&gt;&lt;/em&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p style=&quot;border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: 1.6; font-family: &quot; noto=&quot;&quot; sans&quot;,=&quot;&quot; sans-serif;=&quot;&quot; margin-right:=&quot;&quot; 0px;=&quot;&quot; margin-bottom:=&quot;&quot; 15px;=&quot;&quot; margin-left:=&quot;&quot; outline:=&quot;&quot; padding:=&quot;&quot; vertical-align:=&quot;&quot; baseline;&quot;=&quot;&quot;&gt;&lt;span style=&quot;background-color: rgb(255, 255, 255);&quot;&gt;&lt;font color=&quot;#000000&quot;&gt;To most people, these are just a meaningless array of letters and numbers, however to the informed mechanic or car enthusiast they provide crucial information about the expected performance and suitability of the tire for any given vehicle.&lt;/font&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: 1.6; font-family: &quot; noto=&quot;&quot; sans&quot;,=&quot;&quot; sans-serif;=&quot;&quot; margin-right:=&quot;&quot; 0px;=&quot;&quot; margin-bottom:=&quot;&quot; 15px;=&quot;&quot; margin-left:=&quot;&quot; outline:=&quot;&quot; padding:=&quot;&quot; vertical-align:=&quot;&quot; baseline;&quot;=&quot;&quot;&gt;&lt;span style=&quot;background-color: rgb(255, 255, 255);&quot;&gt;&lt;font color=&quot;#000000&quot;&gt;Whether you are looking for a&lt;span style=&quot;border: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-style: inherit; font-weight: 700; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;a rel=&quot;noreferrer noopener&quot; aria-label=&quot;(opens in a new tab)&quot; href=&quot;https://soundproofpanda.com/quiet-tires/&quot; target=&quot;_blank&quot; style=&quot;border: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; transition: all 0.3s ease 0s;&quot;&gt;&lt;span style=&quot;border: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-style: inherit; font-weight: 700; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;&quot;&gt;smooth silent tire&lt;/span&gt;&lt;/a&gt;&amp;nbsp;or something that will improve your vehicles handling and performance understanding tire descriptions can help you get the best out of your vehicle&lt;/font&gt;&lt;/span&gt;&lt;/p&gt;', 1, '2022-09-26 11:10:08'),
(5, 'Wash', '&lt;p&gt;&lt;span style=&quot;font-size: 18px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;font color=&quot;#000000&quot;&gt;Eco friendly car washing service 99.9%&lt;/font&gt;&lt;/span&gt;&lt;/p&gt;', 1, '2022-09-26 11:11:56');

-- --------------------------------------------------------

--
-- Table structure for table `service_requests`
--

CREATE TABLE `service_requests` (
  `id` int(30) NOT NULL,
  `owner_name` text NOT NULL,
  `category_id` int(30) NOT NULL,
  `service_type` text NOT NULL,
  `mechanic_id` int(30) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `service_requests`
--

INSERT INTO `service_requests` (`id`, `owner_name`, `category_id`, `service_type`, `mechanic_id`, `status`, `date_created`) VALUES
(3, 'Ramesh', 5, 'Drop Off', 1, 2, '2022-09-26 11:29:40'),
(4, 'Ravi', 1, 'Pick Up', 2, 0, '2022-09-26 11:39:37'),
(5, 'Nagesh', 3, 'Pick Up', 1, 3, '2022-09-28 09:38:02');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Car Service Center'),
(2, 'short_name', 'CSC-IT Dreamer&apos;s'),
(3, 'logo', 'uploads/1664172600_logo[1].jpg'),
(4, 'user_avatar', 'uploads/user_avatar.jpg'),
(5, 'cover', 'uploads/1664171220_aaadad.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'IT', 'Dreamers', 'itdreamers', '42b756ef22d46532028443b6f7403860', 'uploads/1664176380_rssd.png', NULL, 1, '2022-09-26 12:43:39', '2022-09-26 12:50:07'),
(2, 'Dayananda', ' ', 'dayanand', '973d81bb2392dc6af4a90bdcc0177f6d', 'uploads/1664176560_rssd.png', NULL, 2, '2022-09-26 11:14:04', '2022-09-26 12:46:13'),
(3, 'Manjunath', 'Walikar', 'manju', '86f9ab6653b3b0151eef76b46ba2f9a5', 'uploads/1664176620_rssd.png', NULL, 2, '2022-09-26 11:14:35', '2022-09-26 12:47:01'),
(4, 'Kiranagouda', 'Patil', 'kiranpatil', 'b1a5b64256e27fa5ae76d62b95209ab3', 'uploads/1664176560_rssd.png', NULL, 2, '2022-09-26 11:13:26', '2022-09-26 12:46:30'),
(5, 'Lakshmikanth', ' ', 'kantu', 'd55b5d43b25435b2529fb4a5b0775966', 'uploads/1664176560_rssd.png', NULL, 2, '2022-09-26 11:15:16', '2022-09-26 12:46:47'),
(6, 'Suresh', 'Kumar', 'sk1425', '0487cc982f7db39c51695026e4bdc692', 'uploads/1664176500_rssd.png', NULL, 1, '2022-09-26 12:45:58', '2022-09-26 12:50:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mechanics_list`
--
ALTER TABLE `mechanics_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_meta`
--
ALTER TABLE `request_meta`
  ADD KEY `request_id` (`request_id`);

--
-- Indexes for table `service_list`
--
ALTER TABLE `service_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_requests`
--
ALTER TABLE `service_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `mechanics_list`
--
ALTER TABLE `mechanics_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `service_list`
--
ALTER TABLE `service_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `service_requests`
--
ALTER TABLE `service_requests`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `request_meta`
--
ALTER TABLE `request_meta`
  ADD CONSTRAINT `request_meta_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `service_requests` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
