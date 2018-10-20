-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2018 at 12:29 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 5.6.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quanlythanhtichabc`
--

-- --------------------------------------------------------

--
-- Table structure for table `nhanvien`
--

CREATE TABLE `nhanvien` (
  `manv` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hoten` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maphongban` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gioitinh` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ngaysinh` date DEFAULT NULL,
  `luong` int(100) DEFAULT '0',
  `capdo` int(2) DEFAULT '0',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dienthoai` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loaitk` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tenhinh` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thoigianthem` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `nhanvien`
--

INSERT INTO `nhanvien` (`manv`, `hoten`, `maphongban`, `gioitinh`, `ngaysinh`, `luong`, `capdo`, `email`, `dienthoai`, `password`, `loaitk`, `tenhinh`, `thoigianthem`) VALUES
('NV1', 'Trần Đại Khái', 'SX', 'Nữ', '2018-04-03', 1500000, 3, 'admin1@gmail.com', '01245456', 'admin1', 'NV', 'fr-11.jpg', '2018-04-26 18:37:47'),
('NV13', 'Nguyễn Xử', 'GD', 'Nữ', '2018-05-01', 5000000, 1, 'nhanvien2@gmail.com', '12412', 'nhanvien2', 'NV', 'fr-10.jpg', '2018-04-25 20:18:42'),
('NV14', 'Nguyễn Thế Quân', 'GD', 'Nữ', '2018-04-24', 2000000, 1, 'nhanvien3@gmail.com', '01652847979', 'nhanvien3', 'NV', 'fr-07.jpg', '2018-04-25 20:18:42'),
('NV15', 'Thiên Phận Chân', 'NS', 'Nữ', '2018-04-25', 4500000, 2, 'nhanvien4@gmail.com', '0165244854', 'nhanvien4', 'NV', 'fr-08.jpg', '2018-04-25 20:18:42'),
('NV16', 'Thiên Hóa Kiên', 'NS', 'Nữ', '2018-04-18', 7000000, 4, 'nhanvien5@gmail.com', '0969357784', 'nhanvien5', 'NV', 'fr-02.jpg', '2018-04-25 20:18:42'),
('NV17', 'Trái Văn Thuần', 'TT', 'Nữ', '2018-04-22', 4000000, 2, 'nhanvien6@gmail.com', '0169452251', 'nhanvien6', 'NV', 'fr-05.jpg', '2018-04-25 20:18:42'),
('NV18', 'Lê Tử Nha', 'BV', 'Nữ', '2018-04-15', 9000000, 1, 'nhanvien7@gmail.com', '0965584451', 'nhanvien7', 'NV', 'fr-06.jpg', '2018-04-25 20:18:42'),
('NV19', 'Phàm Trần', 'BV', 'Nam', '2018-04-17', 15000000, 5, 'admin2@gmail.com', '096999999', 'admin2', 'AD', 'fr-06.jpg', '2018-04-26 18:45:23'),
('NV20', 'Trài Quốc', 'BV', 'Nam', '2018-04-22', 12000000, 5, 'nhanvien9@gmail.com', '016954152', 'nhanvien9', 'NV', 'fr-10.jpg', '2018-04-26 19:45:22'),
('NV4', 'Nguyễn Công Trứ', 'GD', 'Nam', '2018-04-18', 30000000, 7, 'admin@gmail.com', '012456798', 'admin', 'AD', 'fr-11.jpg', '2018-04-25 20:18:42'),
('NV5', 'Nguyễn Khả Ái', 'NS', 'Nữ', '2018-04-16', 5000000, 1, 'admin@gmail.com', '01215645', 'nhanvien', 'NV', 'fr-06.jpg', '2018-04-26 18:17:34'),
('NV6', 'Nguyễn Thị Liên Hoàn', 'KT', 'Nữ', '2018-04-25', 10000000, 3, 'nhanvien1@gmail.com', '0123456789', 'nhanvien1', 'NV', 'fr-06.jpg', '2018-04-25 20:18:42'),
('NV7', 'Trần Thái Giám', 'KT', 'Nam', '2018-04-02', 100000000, 4, 'savsaa@gmail.com', '0165475111', 'sdbvds', 'NV', 'fr-01.jpg', '2018-04-25 20:18:42');

-- --------------------------------------------------------

--
-- Table structure for table `phongban`
--

CREATE TABLE `phongban` (
  `maphong` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tenphong` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `phongban`
--

INSERT INTO `phongban` (`maphong`, `tenphong`) VALUES
('BV', 'Bảo vệ'),
('GD', 'Giám Đốc'),
('KT', 'Kế Toán'),
('NS', 'Nhân Sự'),
('SX', 'Sản Xuất'),
('TT', 'Truyền Thông');

-- --------------------------------------------------------

--
-- Table structure for table `thanhtichkyluat`
--

CREATE TABLE `thanhtichkyluat` (
  `matt` int(11) NOT NULL,
  `manhanvien` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loai` int(1) DEFAULT NULL,
  `lydo` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ngayghinhan` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `maphongb` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `thanhtichkyluat`
--

INSERT INTO `thanhtichkyluat` (`matt`, `manhanvien`, `loai`, `lydo`, `ngayghinhan`, `maphongb`) VALUES
(290, 'NV6', 1, NULL, '2018-04-25 09:09:50', 'KT'),
(291, 'NV7', 1, NULL, '2018-04-25 09:09:50', 'KT'),
(293, 'NV6', 1, NULL, '2018-04-25 09:09:52', 'KT'),
(294, 'NV7', 1, NULL, '2018-04-25 09:09:52', 'KT'),
(296, 'NV1', 1, NULL, '2018-04-25 18:30:31', 'NS'),
(297, 'NV5', 1, NULL, '2018-04-25 18:30:31', 'NS'),
(299, 'NV4', -1, NULL, '2018-04-25 19:44:42', 'GD'),
(300, 'NV4', -1, NULL, '2018-04-25 19:44:48', 'GD'),
(302, 'NV6', -1, NULL, '2018-04-25 19:55:00', 'KT'),
(303, 'NV7', 1, NULL, '2018-04-25 19:55:00', 'KT'),
(304, 'NV13', 1, NULL, '2018-04-25 19:55:03', 'GD'),
(305, 'NV14', -1, NULL, '2018-04-25 19:55:03', 'GD'),
(306, 'NV4', -1, NULL, '2018-04-25 19:55:03', 'GD'),
(307, 'NV13', -1, NULL, '2018-04-25 19:55:07', 'GD'),
(308, 'NV14', -1, NULL, '2018-04-25 19:55:07', 'GD'),
(309, 'NV4', 1, NULL, '2018-04-25 19:55:07', 'GD'),
(310, 'NV13', 1, NULL, '2018-04-25 19:55:09', 'GD'),
(311, 'NV14', 1, NULL, '2018-04-25 19:55:09', 'GD'),
(312, 'NV4', 1, NULL, '2018-04-25 19:55:09', 'GD'),
(313, 'NV1', 1, NULL, '2018-04-25 19:55:13', 'NS'),
(314, 'NV15', -1, NULL, '2018-04-25 19:55:14', 'NS'),
(315, 'NV5', -1, NULL, '2018-04-25 19:55:14', 'NS');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`manv`),
  ADD KEY `maphongban` (`maphongban`);

--
-- Indexes for table `phongban`
--
ALTER TABLE `phongban`
  ADD PRIMARY KEY (`maphong`);

--
-- Indexes for table `thanhtichkyluat`
--
ALTER TABLE `thanhtichkyluat`
  ADD PRIMARY KEY (`matt`),
  ADD KEY `manhanvien` (`manhanvien`),
  ADD KEY `maphongb` (`maphongb`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `thanhtichkyluat`
--
ALTER TABLE `thanhtichkyluat`
  MODIFY `matt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=316;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD CONSTRAINT `nhanvien_ibfk_1` FOREIGN KEY (`maphongban`) REFERENCES `phongban` (`maphong`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `thanhtichkyluat`
--
ALTER TABLE `thanhtichkyluat`
  ADD CONSTRAINT `thanhtichkyluat_ibfk_1` FOREIGN KEY (`manhanvien`) REFERENCES `nhanvien` (`manv`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `thanhtichkyluat_ibfk_2` FOREIGN KEY (`maphongb`) REFERENCES `phongban` (`maphong`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
