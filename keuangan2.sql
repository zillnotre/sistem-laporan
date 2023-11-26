-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2023 at 04:13 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `keuangan2`
--

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `bank_id` int(11) NOT NULL,
  `bank_nama` varchar(255) NOT NULL,
  `bank_nomor` varchar(255) NOT NULL,
  `bank_pemilik` varchar(255) NOT NULL,
  `bank_saldo` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`bank_id`, `bank_nama`, `bank_nomor`, `bank_pemilik`, `bank_saldo`) VALUES
(1, 'Bank Asep Jaya', 'asep', '151261', 343000),
(3, 'Bank Aston', 'mauir', '1803843', 2795000),
(5, 'BANKANG', 'jek', '151261', 421000);

-- --------------------------------------------------------

--
-- Table structure for table `hutang`
--

CREATE TABLE `hutang` (
  `hutang_id` int(11) NOT NULL,
  `hutang_tanggal` text DEFAULT NULL,
  `hutang_nominal` int(11) NOT NULL,
  `hutang_keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `hutang`
--

INSERT INTO `hutang` (`hutang_id`, `hutang_tanggal`, `hutang_nominal`, `hutang_keterangan`) VALUES
(11, 'PAJAK AIR', 144444, 'wfw');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `kategori_id` int(11) NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `target_pajak` bigint(255) DEFAULT NULL,
  `sampai_dgn_bulan_lalu` bigint(255) NOT NULL,
  `bulan_now` bigint(255) NOT NULL,
  `sampai_dgn_bulan_ini` bigint(255) NOT NULL,
  `tambah_kurang` bigint(255) NOT NULL,
  `persentase` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`kategori_id`, `kategori`, `target_pajak`, `sampai_dgn_bulan_lalu`, `bulan_now`, `sampai_dgn_bulan_ini`, `tambah_kurang`, `persentase`) VALUES
(118, 'PAJAK HOTEL', 12500000000, 6070314378, 1327744822, 7398059200, 5101940800, 59),
(119, 'PAJAK RESTORANT', 22130000000, 13299491394, 2112991832, 15412483226, 6717516774, 70),
(120, 'PAJAK HIBURAN', 7700000000, 3561491762, 472031084, 4033522846, 3666477154, 52),
(121, 'PAJAK REKLAME', 7000000000, 2666184643, 636992643, 3303177286, 3696822714, 47),
(122, 'PAJAK PENERANGAN JALAN', 34000000000, 22240903575, 3228244411, 25469147986, 8530852014, 75),
(123, 'PAJAK MINERAL BUKAN LOGAM ', 2100000000, 777948910, 169943870, 947892780, 1152107220, 45),
(124, 'PAJAK PARKIR', 966800000, 419268392, 55250230, 474518622, 492281378, 49),
(125, 'PAJAK AIR TANAH', 860000000, 213882017, 37969427, 251851444, 608148556, 29),
(126, 'PAJAK SARANG BURUNG WALET', 15200000, 14900000, 1000000, 15900000, -700000, 105),
(127, 'PAJAK BPHTB', 36500000000, 23945839489, 3572598354, 27518437843, 8981562157, 75),
(128, 'PAJAK BUMI DAN BANGUNAN PERKOTAAN DAN PEDESAAN', 48200000000, 16065325936, 7822409524, 23887735460, 24312264540, 50);

-- --------------------------------------------------------

--
-- Table structure for table `piutang`
--

CREATE TABLE `piutang` (
  `piutang_id` int(11) NOT NULL,
  `piutang_tanggal` date NOT NULL,
  `piutang_nominal` int(11) NOT NULL,
  `piutang_keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `piutang`
--

INSERT INTO `piutang` (`piutang_id`, `piutang_tanggal`, `piutang_nominal`, `piutang_keterangan`) VALUES
(1, '2019-06-22', 1000000, 'Hutang oleh rahman'),
(3, '2019-06-23', 70000, 'Hutang oleh jony untuk belu pulsa');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `transaksi_id` int(11) NOT NULL,
  `transaksi_tanggal` date NOT NULL,
  `transaksi_jenis` enum('Pengeluaran','Pemasukan') NOT NULL,
  `transaksi_kategori` int(11) NOT NULL,
  `transaksi_nominal` int(11) NOT NULL,
  `transaksi_keterangan` text DEFAULT NULL,
  `transaksi_foto` varchar(255) NOT NULL,
  `transaksi_bank` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`transaksi_id`, `transaksi_tanggal`, `transaksi_jenis`, `transaksi_kategori`, `transaksi_nominal`, `transaksi_keterangan`, `transaksi_foto`, `transaksi_bank`) VALUES
(8, '2023-09-01', 'Pemasukan', 1, 70000, 'RESTO DEDEN SUPRI', '1855554000_WIN_20230510_14_49_53_Pro (2).jpg', 1),
(9, '2023-08-17', 'Pemasukan', 1, 70000, 'HOTEL AMALANDA', '1126382337_WIN_20230510_14_49_54_Pro.jpg', 1),
(10, '2023-11-18', 'Pemasukan', 1, 70000, 'RESTO LAUK', '771241222_WIN_20230510_14_49_54_Pro.jpg', 1),
(12, '2023-08-24', 'Pemasukan', 1, 140000, 'ZAKI PARKIR', '1113801038_WIN_20230510_14_49_54_Pro.jpg', 1),
(13, '2023-11-20', 'Pemasukan', 1, 140000, 'BANK BRI', '727620274_WIN_20230510_14_49_54_Pro.jpg', 1),
(14, '2023-11-20', 'Pemasukan', 1, 140000, 'NASI GOYENG', '1027923189_WIN_20230510_14_49_53_Pro (3).jpg', 1),
(19, '2023-11-21', 'Pemasukan', 1, 140000, 'RESTO EMYU JAYA', '811083782_559000016_contoh nota.jpg', 3),
(21, '2023-09-14', 'Pemasukan', 1, 140000, 'RESTO USOP', '62417102_WIN_20230510_14_49_54_Prodogg.jpg', 5),
(23, '2023-09-14', 'Pemasukan', 1, 140000, 'PABRIK BUWUNG PUYUH', '157539241_WIN_20230510_14_49_54_Pro.jpg', 3),
(24, '2023-11-20', 'Pemasukan', 1, 70000, 'RESTO ABC', '1482319529_191820588_contoh faktur.jpg', 1),
(25, '2023-11-24', 'Pemasukan', 1, 2300000, 'w', '1905775255_62417102_WIN_20230510_14_49_54_Prodogg.jpg', 3),
(26, '2023-10-02', 'Pemasukan', 1, 140000, 's', '2086490295_62417102_WIN_20230510_14_49_54_Prodogg.jpg', 3),
(27, '2023-10-12', 'Pemasukan', 1, 70000, 'M', '1019705156_353176356_Penguins.jpg', 5),
(28, '2023-10-21', 'Pemasukan', 1, 70000, 'V', '531908955_766001531_fotoan.jpg', 1),
(29, '2023-10-24', 'Pemasukan', 1, 140000, 'X', '1871354454_892079347_fnx.jpg', 5),
(30, '2023-10-29', 'Pemasukan', 1, 70000, 'VB', '1065100522_531908955_766001531_fotoan.jpg', 1),
(31, '2023-11-06', 'Pemasukan', 1, 70000, 'CV', '1235828398_LS_bapak.jpg', 5),
(32, '2023-10-01', 'Pemasukan', 119, 70000, 'RESTO ASEP', '116682064_WIN_20230510_14_49_54_Pro (2).jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_nama` varchar(100) NOT NULL,
  `user_username` varchar(100) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_foto` varchar(100) DEFAULT NULL,
  `user_level` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_nama`, `user_username`, `user_password`, `user_foto`, `user_level`) VALUES
(1, 'Administrator', 'naufal', 'a7ef174d3ed272acd2b72913a7ef9d40', '1495601301_WIN_20230510_14_49_54_Prodogg.jpg', 'administrator'),
(2, 'manajemen', 'anan', '63e62e141c89f160f6b0f2dc14fbefa0', '1215276191_NBLSTORELOGO.jpg', 'manajemen'),
(3, 'Administrator', 'admin', '21232f297a57a5a743894a0e4a801fc3', '1215276191_NBLSTORELOGO.jpg', 'manajemen'),
(4, 'Administrator', 'nazil', 'cf546169d06d54aab677e25f0bf7be1c', '1215276191_NBLSTORELOGO.jpg', 'Administrator');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`bank_id`);

--
-- Indexes for table `hutang`
--
ALTER TABLE `hutang`
  ADD PRIMARY KEY (`hutang_id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Indexes for table `piutang`
--
ALTER TABLE `piutang`
  ADD PRIMARY KEY (`piutang_id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`transaksi_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bank`
--
ALTER TABLE `bank`
  MODIFY `bank_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `hutang`
--
ALTER TABLE `hutang`
  MODIFY `hutang_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `kategori_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `piutang`
--
ALTER TABLE `piutang`
  MODIFY `piutang_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `transaksi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
