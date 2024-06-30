-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql308.byethost14.com
-- Generation Time: Jun 30, 2024 at 07:11 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `b14_36793314_enigmadb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `AdminID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `Nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`AdminID`, `UserID`, `Nama`) VALUES
(1, 1, 'Admin Satu');

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE `guru` (
  `GuruID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `Nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `guru`
--

INSERT INTO `guru` (`GuruID`, `UserID`, `Nama`) VALUES
(1, 2, 'Guru Satu');

-- --------------------------------------------------------

--
-- Table structure for table `hasil_quiz`
--

CREATE TABLE `hasil_quiz` (
  `HasilID` int(11) NOT NULL,
  `QuizID` int(11) DEFAULT NULL,
  `SiswaID` int(11) DEFAULT NULL,
  `Nilai` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hasil_quiz`
--

INSERT INTO `hasil_quiz` (`HasilID`, `QuizID`, `SiswaID`, `Nilai`) VALUES
(1, 1, 1, 85);

-- --------------------------------------------------------

--
-- Table structure for table `jawaban_tugas`
--

CREATE TABLE `jawaban_tugas` (
  `JawabanID` int(11) NOT NULL,
  `TugasID` int(11) DEFAULT NULL,
  `SiswaID` int(11) DEFAULT NULL,
  `Jawaban` text DEFAULT NULL,
  `Nilai` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jawaban_tugas`
--

INSERT INTO `jawaban_tugas` (`JawabanID`, `TugasID`, `SiswaID`, `Jawaban`, `Nilai`) VALUES
(1, 1, 1, 'Jawaban Tugas 1', 90);

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `KelasID` int(11) NOT NULL,
  `Nama_Kelas` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`KelasID`, `Nama_Kelas`) VALUES
(1, '5A'),
(2, '5B');

-- --------------------------------------------------------

--
-- Table structure for table `materi`
--

CREATE TABLE `materi` (
  `MateriID` int(11) NOT NULL,
  `Judul` varchar(100) NOT NULL,
  `Deskripsi` text DEFAULT NULL,
  `Konten` text DEFAULT NULL,
  `GuruID` int(11) DEFAULT NULL,
  `KelasID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `materi`
--

INSERT INTO `materi` (`MateriID`, `Judul`, `Deskripsi`, `Konten`, `GuruID`, `KelasID`) VALUES
(1, 'Materi 1', 'Deskripsi Materi 1', 'Konten Materi 1', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE `quiz` (
  `QuizID` int(11) NOT NULL,
  `Judul` varchar(100) NOT NULL,
  `Deskripsi` text DEFAULT NULL,
  `KelasID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`QuizID`, `Judul`, `Deskripsi`, `KelasID`) VALUES
(1, 'Quiz 1', 'Deskripsi Quiz 1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `SiswaID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `Nama` varchar(100) NOT NULL,
  `Kelas` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`SiswaID`, `UserID`, `Nama`, `Kelas`) VALUES
(1, 3, 'Siswa Satu', '5A');

-- --------------------------------------------------------

--
-- Table structure for table `soal_quiz`
--

CREATE TABLE `soal_quiz` (
  `SoalID` int(11) NOT NULL,
  `Pertanyaan` text DEFAULT NULL,
  `Jawaban_Benar` varchar(255) DEFAULT NULL,
  `QuizID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `soal_quiz`
--

INSERT INTO `soal_quiz` (`SoalID`, `Pertanyaan`, `Jawaban_Benar`, `QuizID`) VALUES
(1, 'Pertanyaan 1', 'Jawaban Benar 1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tugas`
--

CREATE TABLE `tugas` (
  `TugasID` int(11) NOT NULL,
  `Judul` varchar(100) NOT NULL,
  `Deskripsi` text DEFAULT NULL,
  `Batas_Waktu` date DEFAULT NULL,
  `GuruID` int(11) DEFAULT NULL,
  `KelasID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tugas`
--

INSERT INTO `tugas` (`TugasID`, `Judul`, `Deskripsi`, `Batas_Waktu`, `GuruID`, `KelasID`) VALUES
(1, 'Tugas 1', 'Deskripsi Tugas 1', '2024-07-01', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Role` enum('Admin','Guru','Siswa') NOT NULL,
  `Nama` varchar(100) NOT NULL,
  `Tanggal_Lahir` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserID`, `Username`, `Password`, `Email`, `Role`, `Nama`, `Tanggal_Lahir`) VALUES
(1, 'admin1', 'password', 'admin1@example.com', 'Admin', 'Admin Satu', '1980-01-01'),
(2, 'guru1', 'password', 'guru1@example.com', 'Guru', 'Guru Satu', '1985-01-01'),
(3, 'siswa1', 'password', 'siswa1@example.com', 'Siswa', 'Siswa Satu', '2010-01-01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`AdminID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`GuruID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `hasil_quiz`
--
ALTER TABLE `hasil_quiz`
  ADD PRIMARY KEY (`HasilID`),
  ADD KEY `QuizID` (`QuizID`),
  ADD KEY `SiswaID` (`SiswaID`);

--
-- Indexes for table `jawaban_tugas`
--
ALTER TABLE `jawaban_tugas`
  ADD PRIMARY KEY (`JawabanID`),
  ADD KEY `TugasID` (`TugasID`),
  ADD KEY `SiswaID` (`SiswaID`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`KelasID`);

--
-- Indexes for table `materi`
--
ALTER TABLE `materi`
  ADD PRIMARY KEY (`MateriID`),
  ADD KEY `GuruID` (`GuruID`),
  ADD KEY `KelasID` (`KelasID`);

--
-- Indexes for table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`QuizID`),
  ADD KEY `KelasID` (`KelasID`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`SiswaID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `soal_quiz`
--
ALTER TABLE `soal_quiz`
  ADD PRIMARY KEY (`SoalID`),
  ADD KEY `QuizID` (`QuizID`);

--
-- Indexes for table `tugas`
--
ALTER TABLE `tugas`
  ADD PRIMARY KEY (`TugasID`),
  ADD KEY `GuruID` (`GuruID`),
  ADD KEY `KelasID` (`KelasID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `AdminID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `guru`
--
ALTER TABLE `guru`
  MODIFY `GuruID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hasil_quiz`
--
ALTER TABLE `hasil_quiz`
  MODIFY `HasilID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jawaban_tugas`
--
ALTER TABLE `jawaban_tugas`
  MODIFY `JawabanID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `KelasID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `materi`
--
ALTER TABLE `materi`
  MODIFY `MateriID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `quiz`
--
ALTER TABLE `quiz`
  MODIFY `QuizID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `SiswaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `soal_quiz`
--
ALTER TABLE `soal_quiz`
  MODIFY `SoalID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tugas`
--
ALTER TABLE `tugas`
  MODIFY `TugasID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);

--
-- Constraints for table `guru`
--
ALTER TABLE `guru`
  ADD CONSTRAINT `guru_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);

--
-- Constraints for table `hasil_quiz`
--
ALTER TABLE `hasil_quiz`
  ADD CONSTRAINT `hasil_quiz_ibfk_1` FOREIGN KEY (`QuizID`) REFERENCES `quiz` (`QuizID`),
  ADD CONSTRAINT `hasil_quiz_ibfk_2` FOREIGN KEY (`SiswaID`) REFERENCES `siswa` (`SiswaID`);

--
-- Constraints for table `jawaban_tugas`
--
ALTER TABLE `jawaban_tugas`
  ADD CONSTRAINT `jawaban_tugas_ibfk_1` FOREIGN KEY (`TugasID`) REFERENCES `tugas` (`TugasID`),
  ADD CONSTRAINT `jawaban_tugas_ibfk_2` FOREIGN KEY (`SiswaID`) REFERENCES `siswa` (`SiswaID`);

--
-- Constraints for table `materi`
--
ALTER TABLE `materi`
  ADD CONSTRAINT `materi_ibfk_1` FOREIGN KEY (`GuruID`) REFERENCES `guru` (`GuruID`),
  ADD CONSTRAINT `materi_ibfk_2` FOREIGN KEY (`KelasID`) REFERENCES `kelas` (`KelasID`);

--
-- Constraints for table `quiz`
--
ALTER TABLE `quiz`
  ADD CONSTRAINT `quiz_ibfk_1` FOREIGN KEY (`KelasID`) REFERENCES `kelas` (`KelasID`);

--
-- Constraints for table `siswa`
--
ALTER TABLE `siswa`
  ADD CONSTRAINT `siswa_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);

--
-- Constraints for table `soal_quiz`
--
ALTER TABLE `soal_quiz`
  ADD CONSTRAINT `soal_quiz_ibfk_1` FOREIGN KEY (`QuizID`) REFERENCES `quiz` (`QuizID`);

--
-- Constraints for table `tugas`
--
ALTER TABLE `tugas`
  ADD CONSTRAINT `tugas_ibfk_1` FOREIGN KEY (`GuruID`) REFERENCES `guru` (`GuruID`),
  ADD CONSTRAINT `tugas_ibfk_2` FOREIGN KEY (`KelasID`) REFERENCES `kelas` (`KelasID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
