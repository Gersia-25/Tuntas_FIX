-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 04, 2021 at 09:02 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tuntas`
--

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `no_event` int(11) NOT NULL,
  `kd_ruang` char(2) NOT NULL,
  `judul_event` varchar(50) NOT NULL,
  `tgl_event` date NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `nik` char(8) NOT NULL,
  `kd_unit` char(4) NOT NULL,
  `nama_karyawan` varchar(50) NOT NULL,
  `jabatan` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`nik`, `kd_unit`, `nama_karyawan`, `jabatan`, `email`, `no_hp`, `username`, `password`) VALUES
('1111111', 'B1', 'Sinta dewi', 'Sekretariat', 'sinta.dewi@staff.ukdw.ac.id', '085674837533', '11111111', 'sekre');

-- --------------------------------------------------------

--
-- Table structure for table `penerima`
--

CREATE TABLE `penerima` (
  `nik` char(8) NOT NULL,
  `no_surat` int(11) NOT NULL,
  `kd_unit` char(4) NOT NULL,
  `nama_penerima` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  `no_hp` int(15) NOT NULL,
  `no_penerima` int(11) NOT NULL,
  `konfir_hadir` tinyint(1) NOT NULL,
  `tgl_masuk` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ruang`
--

CREATE TABLE `ruang` (
  `kd_ruang` char(2) NOT NULL,
  `nama_ruang` varchar(50) NOT NULL,
  `kapasitas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ruang`
--

INSERT INTO `ruang` (`kd_ruang`, `nama_ruang`, `kapasitas`) VALUES
('C2', 'Chara', 50);

-- --------------------------------------------------------

--
-- Table structure for table `surat`
--

CREATE TABLE `surat` (
  `no_surat` int(11) NOT NULL,
  `no_event` int(11) NOT NULL,
  `nik` char(8) NOT NULL,
  `tgl_surat` date NOT NULL,
  `perihal` varchar(30) NOT NULL,
  `isi` text NOT NULL,
  `tembusan` text NOT NULL,
  `sifat` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `kd_unit` char(4) NOT NULL,
  `nama_unit` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  `no_hp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`kd_unit`, `nama_unit`, `email`, `no_hp`) VALUES
('B1', 'Biro 1', 'Biro1@staff.ukdw.ac.id', '081345873412');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`no_event`),
  ADD KEY `kd_ruang` (`kd_ruang`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`nik`),
  ADD KEY `kd_unit` (`kd_unit`);

--
-- Indexes for table `penerima`
--
ALTER TABLE `penerima`
  ADD PRIMARY KEY (`no_penerima`),
  ADD UNIQUE KEY `nik` (`nik`),
  ADD UNIQUE KEY `no_surat` (`no_surat`),
  ADD KEY `kd_unit` (`kd_unit`);

--
-- Indexes for table `ruang`
--
ALTER TABLE `ruang`
  ADD PRIMARY KEY (`kd_ruang`);

--
-- Indexes for table `surat`
--
ALTER TABLE `surat`
  ADD PRIMARY KEY (`no_surat`),
  ADD KEY `no_event` (`no_event`),
  ADD KEY `nik` (`nik`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`kd_unit`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `no_event` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `penerima`
--
ALTER TABLE `penerima`
  MODIFY `no_penerima` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
