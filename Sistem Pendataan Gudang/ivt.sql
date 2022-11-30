-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2022 at 06:53 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ivt`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `nib` int(11) NOT NULL,
  `tanggal_tambah` date DEFAULT NULL,
  `nama` varchar(256) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `harga_jual` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`nib`, `tanggal_tambah`, `nama`, `jumlah`, `harga_jual`) VALUES
(2, '2016-10-26', 'Susu Milo', 2, 50000),
(3, '2016-10-26', 'Susu Bear Brand', 2, 40000),
(4, '2016-10-27', 'Indomie Rasa Goreng', 4, 15000),
(7, '2016-10-26', 'Indomie Rasa Kari', 4, 20000);

-- --------------------------------------------------------

--
-- Table structure for table `barang_rusak`
--

CREATE TABLE `barang_rusak` (
  `id_barang_rusak` int(11) NOT NULL,
  `nipg` int(11) DEFAULT NULL,
  `nib` int(11) DEFAULT NULL,
  `Keterangan` varchar(256) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang_rusak`
--

INSERT INTO `barang_rusak` (`id_barang_rusak`, `nipg`, `nib`, `Keterangan`, `jumlah`) VALUES
(1, 1, 3, 'Kalengnya Penyok', 5);

-- --------------------------------------------------------

--
-- Table structure for table `manajer`
--

CREATE TABLE `manajer` (
  `nim` int(11) NOT NULL,
  `nama` varchar(256) DEFAULT NULL,
  `no_tlp` varchar(256) DEFAULT NULL,
  `username` varchar(256) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manajer`
--

INSERT INTO `manajer` (`nim`, `nama`, `no_tlp`, `username`, `password`) VALUES
(1, 'ilham', '082313131', 'manajer', 'manajer');

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `nipg` int(11) NOT NULL,
  `nama` varchar(256) DEFAULT NULL,
  `alamat` varchar(256) DEFAULT NULL,
  `no_tlp` varchar(256) DEFAULT NULL,
  `username` varchar(11) DEFAULT NULL,
  `password` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`nipg`, `nama`, `alamat`, `no_tlp`, `username`, `password`) VALUES
(1, 'harvito', 'Sleman', '08122665960', 'pegawai', 'pegawai');

-- --------------------------------------------------------

--
-- Table structure for table `pemasok`
--

CREATE TABLE `pemasok` (
  `nip` int(11) NOT NULL,
  `nama` varchar(256) DEFAULT NULL,
  `alamat` varchar(256) DEFAULT NULL,
  `no_tlp` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pemasok`
--

INSERT INTO `pemasok` (`nip`, `nama`, `alamat`, `no_tlp`) VALUES
(1, 'UPN Shop', 'UPN Kampus 2', '082313131');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian_barang`
--

CREATE TABLE `pembelian_barang` (
  `id_pembelian` int(11) NOT NULL,
  `nim` int(11) DEFAULT NULL,
  `nip` int(11) DEFAULT NULL,
  `nib` int(11) DEFAULT NULL,
  `id_tra` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembelian_barang`
--

INSERT INTO `pembelian_barang` (`id_pembelian`, `nim`, `nip`, `nib`, `id_tra`) VALUES
(1, 1, 1, 2, 2),
(2, 1, 1, 3, 3),
(4, 1, 1, 4, 4),
(7, 1, 1, 7, 7);

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_barang`
--

CREATE TABLE `penjualan_barang` (
  `id_penjualan` int(11) NOT NULL,
  `nipg` int(11) DEFAULT NULL,
  `nib` int(11) DEFAULT NULL,
  `id_tra` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjualan_barang`
--

INSERT INTO `penjualan_barang` (`id_penjualan`, `nipg`, `nib`, `id_tra`) VALUES
(1, 1, 4, 8),
(3, 1, 7, 9),
(4, 1, 3, 10);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_tra` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `pengeluaran` int(11) DEFAULT NULL,
  `pemasukan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_tra`, `tanggal`, `pengeluaran`, `pemasukan`) VALUES
(2, '2016-10-26', 50000, 0),
(3, '2016-10-26', 30000, 0),
(4, '2016-10-26', 50000, 0),
(7, '2016-10-26', 30000, 0),
(8, '2016-10-27', 0, 49000),
(9, '2016-10-26', 0, 123),
(10, '2016-10-27', 0, 20000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`nib`);

--
-- Indexes for table `barang_rusak`
--
ALTER TABLE `barang_rusak`
  ADD PRIMARY KEY (`id_barang_rusak`),
  ADD KEY `nib` (`nib`),
  ADD KEY `nipg` (`nipg`);

--
-- Indexes for table `manajer`
--
ALTER TABLE `manajer`
  ADD PRIMARY KEY (`nim`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`nipg`);

--
-- Indexes for table `pemasok`
--
ALTER TABLE `pemasok`
  ADD PRIMARY KEY (`nip`);

--
-- Indexes for table `pembelian_barang`
--
ALTER TABLE `pembelian_barang`
  ADD PRIMARY KEY (`id_pembelian`),
  ADD KEY `nip` (`nip`),
  ADD KEY `nib` (`nib`),
  ADD KEY `id_tra` (`id_tra`),
  ADD KEY `nim` (`nim`);

--
-- Indexes for table `penjualan_barang`
--
ALTER TABLE `penjualan_barang`
  ADD PRIMARY KEY (`id_penjualan`),
  ADD KEY `id_tra` (`id_tra`),
  ADD KEY `nib` (`nib`),
  ADD KEY `nipg` (`nipg`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_tra`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `nib` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `barang_rusak`
--
ALTER TABLE `barang_rusak`
  MODIFY `id_barang_rusak` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `manajer`
--
ALTER TABLE `manajer`
  MODIFY `nim` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `nipg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pemasok`
--
ALTER TABLE `pemasok`
  MODIFY `nip` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pembelian_barang`
--
ALTER TABLE `pembelian_barang`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `penjualan_barang`
--
ALTER TABLE `penjualan_barang`
  MODIFY `id_penjualan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_tra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang_rusak`
--
ALTER TABLE `barang_rusak`
  ADD CONSTRAINT `barang_rusak_ibfk_2` FOREIGN KEY (`nib`) REFERENCES `barang` (`nib`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `barang_rusak_ibfk_3` FOREIGN KEY (`nipg`) REFERENCES `pegawai` (`nipg`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pembelian_barang`
--
ALTER TABLE `pembelian_barang`
  ADD CONSTRAINT `pembelian_barang_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `pemasok` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pembelian_barang_ibfk_3` FOREIGN KEY (`nib`) REFERENCES `barang` (`nib`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pembelian_barang_ibfk_4` FOREIGN KEY (`id_tra`) REFERENCES `transaksi` (`id_tra`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pembelian_barang_ibfk_5` FOREIGN KEY (`nim`) REFERENCES `manajer` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `penjualan_barang`
--
ALTER TABLE `penjualan_barang`
  ADD CONSTRAINT `penjualan_barang_ibfk_1` FOREIGN KEY (`id_tra`) REFERENCES `transaksi` (`id_tra`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penjualan_barang_ibfk_3` FOREIGN KEY (`nib`) REFERENCES `barang` (`nib`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penjualan_barang_ibfk_4` FOREIGN KEY (`nipg`) REFERENCES `pegawai` (`nipg`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
