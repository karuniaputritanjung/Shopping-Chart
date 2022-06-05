-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2021 at 12:40 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_cart`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail_pembelian`
--

CREATE TABLE `detail_pembelian` (
  `iddetail` int(11) NOT NULL,
  `idpembelian` int(100) DEFAULT NULL,
  `produk_id` int(10) DEFAULT NULL,
  `produk_harga` int(10) NOT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_pembelian`
--

INSERT INTO `detail_pembelian` (`iddetail`, `idpembelian`, `produk_id`, `produk_harga`, `qty`) VALUES
(50, 1621846071, 3, 470000, 1),
(51, 1621846172, 3, 470000, 1),
(52, 1621846312, 3, 470000, 1),
(53, 1621846375, 1, 470000, 4),
(54, 1621846375, 2, 470000, 1),
(55, 1621846375, 3, 470000, 2),
(56, 1621852567, 2, 105000, 1),
(57, 1621852587, 2, 105000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `idpembelian` int(100) NOT NULL,
  `waktu` timestamp NULL DEFAULT current_timestamp(),
  `pembeli` varchar(10) DEFAULT 'isnayni'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`idpembelian`, `waktu`, `pembeli`) VALUES
(1621838393, '2021-05-24 06:39:53', 'neni'),
(1621846071, '2021-05-24 08:47:51', 'neni'),
(1621846172, '2021-05-24 08:49:32', 'neni'),
(1621846312, '2021-05-24 08:51:52', 'neni'),
(1621846375, '2021-05-24 08:52:55', 'neni'),
(1621852567, '2021-05-24 10:36:07', 'neni'),
(1621852587, '2021-05-24 10:36:27', 'neni');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_produk`
--

CREATE TABLE `tbl_produk` (
  `produk_id` int(11) NOT NULL,
  `produk_nama` varchar(100) DEFAULT NULL,
  `produk_harga` double DEFAULT NULL,
  `produk_image` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_produk`
--

INSERT INTO `tbl_produk` (`produk_id`, `produk_nama`, `produk_harga`, `produk_image`) VALUES
(1, 'Buku Bimbingan Belajar Edisi 1', 100000, '1.jpg'),
(2, 'Buku Sukses Bimbingan Belajar Edisi 1', 105000, '2.jpg'),
(3, 'Buku Bimbingan Belajar Edisi 2', 100000, '3.jpg'),
(4, 'Buku Bimbingan Belajar Super', 120000, '4.jpg'),
(5, 'Buku Sukses Bimbingan Belajar Edisi 2', 140000, '5.jpg'),
(6, 'Buku Bimbingan Belajar Mandiri', 130000, '6.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_pembelian`
--
ALTER TABLE `detail_pembelian`
  ADD PRIMARY KEY (`iddetail`),
  ADD KEY `idpembelian` (`idpembelian`),
  ADD KEY `produk_id` (`produk_id`) USING BTREE;

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`idpembelian`);

--
-- Indexes for table `tbl_produk`
--
ALTER TABLE `tbl_produk`
  ADD PRIMARY KEY (`produk_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_pembelian`
--
ALTER TABLE `detail_pembelian`
  MODIFY `iddetail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `tbl_produk`
--
ALTER TABLE `tbl_produk`
  MODIFY `produk_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_pembelian`
--
ALTER TABLE `detail_pembelian`
  ADD CONSTRAINT `detail_pembelian_ibfk_1` FOREIGN KEY (`produk_id`) REFERENCES `tbl_produk` (`produk_id`),
  ADD CONSTRAINT `detail_pembelian_ibfk_2` FOREIGN KEY (`idpembelian`) REFERENCES `pembelian` (`idpembelian`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
