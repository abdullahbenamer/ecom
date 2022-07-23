-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 23, 2022 at 11:39 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecom_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(11) NOT NULL,
  `cat_title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'example1'),
(2, 'example2');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_category_id` int(11) NOT NULL,
  `product_price` float NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `short_desc` text NOT NULL,
  `product_description` text NOT NULL,
  `product_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_title`, `product_category_id`, `product_price`, `product_quantity`, `short_desc`, `product_description`, `product_image`) VALUES
(1, 'product1', 1, 34.5, 5, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Natus cum, officia nam porro quisquam eos veniam repudiandae.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Natus cum, officia nam porro quisquam eos veniam repudiandae. Lorem ipsum dolor sit amet consectetur adipisicing elit. Natus cum, officia nam porro quisquam eos veniam repudiandae. Lorem ipsum dolor sit amet consectetur adipisicing elit. Natus cum, officia nam porro quisquam eos veniam repudiandae.', 'https://picsum.photos/500/300'),
(2, 'product2', 2, 55.9, 5, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Natus cum, officia nam porro quisquam eos veniam repudiandae.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Natus cum, officia nam porro quisquam eos veniam repudiandae. Lorem ipsum dolor sit amet consectetur adipisicing elit. Natus cum, officia nam porro quisquam eos veniam repudiandae. Lorem ipsum dolor sit amet consectetur adipisicing elit. Natus cum, officia nam porro quisquam eos veniam repudiandae.', 'https://picsum.photos/500/300'),
(3, 'Product3', 1, 38.23, 0, 'Product 3 description, Lorem ipsum dolor sit amet consectetur adipisicing elit. Natus cum, officia nam porro quisquam eos veniam repudiandae.', 'Product 3 description, Lorem ipsum dolor sit amet consectetur adipisicing elit. Natus cum, officia nam porro quisquam eos veniam repudiandae. Product 3 description, Lorem ipsum dolor sit amet consectetur adipisicing elit. Natus cum, officia nam porro quisquam eos veniam repudiandae. Product 3 description, Lorem ipsum dolor sit amet consectetur adipisicing elit. Natus cum, officia nam porro quisquam eos veniam repudiandae.', 'https://picsum.photos/500/300'),
(4, 'product4', 1, 77.98, 4, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Natus cum, officia nam porro quisquam eos veniam repudiandae.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Natus cum, officia nam porro quisquam eos veniam repudiandae. Lorem ipsum dolor sit amet consectetur adipisicing elit. Natus cum, officia nam porro quisquam eos veniam repudiandae. Lorem ipsum dolor sit amet consectetur adipisicing elit. Natus cum, officia nam porro quisquam eos veniam repudiandae.', 'https://picsum.photos/500/300'),
(5, 'Product5', 2, 22.89, 8, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Natus cum, officia nam porro quisquam eos veniam repudiandae.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Natus cum, officia nam porro quisquam eos veniam repudiandae. Lorem ipsum dolor sit amet consectetur adipisicing elit. Natus cum, officia nam porro quisquam eos veniam repudiandae. Lorem ipsum dolor sit amet consectetur adipisicing elit. Natus cum, officia nam porro quisquam eos veniam repudiandae.', 'https://picsum.photos/500/300');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`) VALUES
(1, 'rico', 'rico@hotmail.com', '1773'),
(2, 'edwin', 'edwin@edwindiaz.com', '1773'),
(3, 'edwin', 'support@edwindiaz.com', '1773'),
(4, 'abdullah', 'benamer@gmail.com', '1773');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
