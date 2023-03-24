-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th3 11, 2023 lúc 04:02 AM
-- Phiên bản máy phục vụ: 8.0.17
-- Phiên bản PHP: 7.3.10

CREATE DATABASE IF NOT EXISTS DDTruyen;

USE DDTruyen;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `ddtruyen`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `author`
--

CREATE TABLE IF NOT EXISTS `author` (
  `id` int(11) NOT NULL COMMENT 'mã tác giả' PRIMARY KEY,
  `name` varchar(255) NOT NULL COMMENT 'tên tác giả',
  `address` varchar(255) NOT NULL COMMENT 'quê quán tác giả',
  `avatar` varchar(255) NOT NULL COMMENT 'ảnh tác giả',
  `describe_author` text NOT NULL COMMENT 'mô tả tác giả'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chapter`
--

CREATE TABLE IF NOT EXISTS `chapter` (
  `id` int(11) NOT NULL COMMENT 'mã tập' PRIMARY KEY,
  `id_story` int(11) NOT NULL COMMENT 'mã truyện',
  `chapter_number` int(11) NOT NULL COMMENT 'số thứ tự tập',
  `content` varchar(255) NOT NULL COMMENT 'nội dung truyện'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `story`
--

CREATE TABLE IF NOT EXISTS `story` (
  `id` int(11) NOT NULL COMMENT 'mã truyện' PRIMARY KEY,
  `title` varchar(255) NOT NULL COMMENT 'tiêu đề truyện',
  `release_date` date NOT NULL COMMENT 'ngày phát hành',
  `describe_story` text NOT NULL COMMENT 'mô tả',
  `status` int(11) NOT NULL COMMENT 'trạng thái phát hành truyện'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `story_author`
--

CREATE TABLE IF NOT EXISTS `story_author` (
  `id_story` int(11) NOT NULL COMMENT 'mã truyện' PRIMARY KEY,
  `id_author` int(11) NOT NULL COMMENT 'mã tác giả' PRIMARY KEY
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `story_type`
--

CREATE TABLE IF NOT EXISTS `story_type` (
  `id_story` int(11) NOT NULL COMMENT 'mã truyện' PRIMARY KEY,
  `id_type` int(11) NOT NULL COMMENT 'mã thể loại truyện' PRIMARY KEY
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `type`
--

CREATE TABLE IF NOT EXISTS `type` (
  `id` int(11) NOT NULL COMMENT 'mã thể loại truyện' PRIMARY KEY,
  `name` varchar(255) NOT NULL COMMENT 'tên thể loại truyện'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
