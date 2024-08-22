-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Agu 2024 pada 12.08
-- Versi server: 10.4.25-MariaDB
-- Versi PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lokasi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `markers`
--

CREATE TABLE `markers` (
  `id` int(11) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `info` text NOT NULL,
  `layer` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `markers`
--

INSERT INTO `markers` (`id`, `latitude`, `longitude`, `info`, `layer`) VALUES
(1, 1.1280856786842166, 104.05119314851001, '<strong>Kantor Pelayanan Pelanggan</strong><br>Lokasi : Batam Center <br> <br><img src=\"images/kpp2.png\" width=\"200px\">', 'kpp'),
(2, 1.103467071980878, 103.95405121349647, '<strong>WTP Sei Harapan</strong><br>Kapasitas Produksi : 230 lpd <br>Alamat : Kel. Sungai Harapan, Kec. Sekupang,<br>Kota Batam - Kepulauan Riau<br><br><img src=\"images/seiharapan.png\" width=\"200px\">', 'wtp'),
(3, 1.0421701745747476, 103.98413234048391, '<strong>Kantor Pelayanan Pelanggan</strong><br>Lokasi : Batu Aji <br> <br><img src=\"images/kpp1.png\" width=\"200px\">', 'kpp'),
(4, 1.1587912401786145, 104.02915766551087, '<strong>Kantor Pelayanan Pelanggan</strong><br>Lokasi : Bengkong <br> <br><img src=\"images/kpp3.png\" width=\"200px\">', 'kpp'),
(5, 1.1668154935556434, 104.09617595590244, '<strong>WTP Nongsa</strong><br>Kapasitas Produksi : 60 lpd <br>Alamat : Kelurahan Sambau, Kecamatan Nongsa,<br>Kota Batam, Kepulauan Riau <br><br><img src=\"images/nongsa.png\" width=\"200px\">', 'wtp'),
(6, 1.058254166816622, 104.11179411268446, '<strong>WTP Duriangkang</strong><br>Kapasitas Produksi : 2200 lpd <br>Alamat : Jln. Bagan Raya, Kel. Tanjung Piayu, kec.<br>Sungai Beduk, Kota Batam - Kepulauan Riau<br><br><img src=\"images/duriangkang.png\" width=\"200px\">', 'wtp'),
(7, 1.0265638158754768, 104.06306042433879, '<strong>WTP Tanjung Piayu</strong><br>Kapasitas Produksi : 300 lpd <br>Alamat : Jln. S. Parman, Kel. Tanjung Piayu, Kec.<br>Sungai Beduk, Kota Batam - Kepulauan Riau<br><br><img src=\"images/piayu.png\" width=\"200px\">', 'wtp'),
(8, 1.0660551077190092, 104.0129847021869, '<strong>WTP Mukakuning</strong><br>Kapasitas Produksi : 600 lpd <br>Alamat : Jln. Letjen Suprapto No.1, Kel. Mukakuning,<br>Kec. Sungai Beduk, Kota Batam - Kepulauan Riau <br><br><img src=\"images/mukakuning.png\" width=\"200px\">', 'wtp'),
(9, 1.1153046009274372, 104.00369752248527, '<strong>WTP Sei Ladi</strong><br>Kapasitas Produksi : 240 lpd <br>Alamat : Jln. Gajah Mada Kel. Baloi Indah, Kec.<br>Lubuk Baja, Kota Batam - Kepulauan Riau<br><br><img src=\"images/seiladi.png\" width=\"200px\">', 'wtp');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `markers`
--
ALTER TABLE `markers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `markers`
--
ALTER TABLE `markers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
