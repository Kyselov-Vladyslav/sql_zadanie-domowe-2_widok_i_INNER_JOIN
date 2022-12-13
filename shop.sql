-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 13 Gru 2022, 23:50
-- Wersja serwera: 10.4.24-MariaDB
-- Wersja PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `shop`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `addresses`
--

CREATE TABLE `addresses` (
  `id_address` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `town` varchar(60) COLLATE utf8mb4_polish_ci NOT NULL,
  `street_name` varchar(60) COLLATE utf8mb4_polish_ci NOT NULL,
  `zip_code` char(6) COLLATE utf8mb4_polish_ci NOT NULL,
  `id_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `addresses`
--

INSERT INTO `addresses` (`id_address`, `id_user`, `town`, `street_name`, `zip_code`, `id_type`) VALUES
(1, 1, 'Kraków', 'Rynek', '20-123', 1),
(2, 1, 'Olkusz', 'Rynek', '32-200', 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `basket`
--

CREATE TABLE `basket` (
  `id_basket` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `date_add` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `basket`
--

INSERT INTO `basket` (`id_basket`, `id_product`, `id_user`, `date_add`) VALUES
(1, 2, 1, '2022-11-19 16:13:32');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `phone_code`
--

CREATE TABLE `phone_code` (
  `id_phonecode` int(11) NOT NULL,
  `phone_code` varchar(10) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `phone_code`
--

INSERT INTO `phone_code` (`id_phonecode`, `phone_code`) VALUES
(1, '+48'),
(2, '+380'),
(3, '+420'),
(4, '+375');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `products`
--

CREATE TABLE `products` (
  `id_product` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_polish_ci NOT NULL,
  `description` text COLLATE utf8mb4_polish_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `picture` varchar(60) COLLATE utf8mb4_polish_ci NOT NULL,
  `date_add` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `products`
--

INSERT INTO `products` (`id_product`, `name`, `description`, `price`, `picture`, `date_add`) VALUES
(1, 'Telewizor LG 1000V.', 'Najlepszy TV.', '3999.99', 'lg.jpeg', '2022-11-19 16:08:02'),
(2, 'Laptop Lenovo 3000P', 'Fajny laptop', '4900.00', 'laptop.png', '2022-11-19 16:08:44'),
(3, 'Telewizor LG 2000V.', 'Najlepszy TV 2.', '4999.99', 'lg2.jpeg', '2022-11-20 15:17:13'),
(4, 'Laptop HP 1000V', 'Fajny laptop 2', '5999.00', 'laptop.png', '2022-11-19 16:08:44'),
(5, 'Telewizor SONY 4000VA.', 'Najlepszy TV Sony.', '6999.99', 'lg4.jpeg', '2022-11-20 16:08:02');

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `products_and_supplier`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `products_and_supplier` (
`name` varchar(150)
,`supplier_name` varchar(80)
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `supplier_of_goods`
--

CREATE TABLE `supplier_of_goods` (
  `id_supplier` int(11) NOT NULL,
  `supplier_name` varchar(80) COLLATE utf8mb4_polish_ci NOT NULL,
  `id_phonecode` int(11) NOT NULL,
  `telephone` int(9) NOT NULL,
  `email` varchar(80) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `supplier_of_goods`
--

INSERT INTO `supplier_of_goods` (`id_supplier`, `supplier_name`, `id_phonecode`, `telephone`, `email`) VALUES
(1, 'Dostawca Telewizorów LG 1000V', 1, 789987789, 'lg1000v@lg.pl'),
(2, 'Dostawca lenowo 3000p', 4, 456789123, 'lenovo3000p@len.bl'),
(3, 'Dostawca Telewizorów LG 2000V', 1, 147852369, 'lg2000v@lg.pl'),
(4, 'Dostawca laptopów HP 1000V', 2, 123645789, 'hp@hp.ua'),
(5, 'Dostawca Telewizorów SONY 4000VA', 3, 963741852, 'sony@sony.cz');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `type_address`
--

CREATE TABLE `type_address` (
  `id_type` int(11) NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `type_address`
--

INSERT INTO `type_address` (`id_type`, `type`) VALUES
(1, 'zamieszkania'),
(2, 'faktura'),
(3, 'dostawy'),
(4, 'tymczasowy'),
(5, 'typ 2'),
(6, 'typ 3');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `login` varchar(20) COLLATE utf8mb4_polish_ci NOT NULL,
  `pass` varchar(40) COLLATE utf8mb4_polish_ci NOT NULL,
  `surname` varchar(50) COLLATE utf8mb4_polish_ci NOT NULL,
  `firstname` varchar(30) COLLATE utf8mb4_polish_ci NOT NULL,
  `email` varchar(80) COLLATE utf8mb4_polish_ci NOT NULL,
  `date_mod` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id_user`, `login`, `pass`, `surname`, `firstname`, `email`, `date_mod`) VALUES
(1, 'pkania', 'a74d41be49e933836818f577170b75d957c3389f', 'Kania', 'Piotr', 'uuu@wp.pl', NULL),
(2, 'jnowak', '9ccbef383120409c1c209b777bcdecd53d3bfec2', 'Nowak', 'Zbigniew', 'ssdfdf@wp.pl', '2022-12-04 13:40:09'),
(4, 'anowak', 'dfdsfds', 'Nowak', 'Anna', '', NULL),
(5, 'znowak', 'kjksdjfiodufods', 'Nowak', 'Zbigniew', '', NULL);

--
-- Wyzwalacze `users`
--
DELIMITER $$
CREATE TRIGGER `dataModyfikacjiUrzytkownika` BEFORE UPDATE ON `users` FOR EACH ROW SET NEW.date_mod = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura widoku `products_and_supplier`
--
DROP TABLE IF EXISTS `products_and_supplier`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `products_and_supplier`  AS SELECT `products`.`name` AS `name`, `supplier_of_goods`.`supplier_name` AS `supplier_name` FROM (`products` join `supplier_of_goods` on(`products`.`id_product` = `supplier_of_goods`.`id_supplier`))  ;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id_address`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `type` (`id_type`);

--
-- Indeksy dla tabeli `basket`
--
ALTER TABLE `basket`
  ADD PRIMARY KEY (`id_basket`),
  ADD KEY `id_product` (`id_product`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeksy dla tabeli `phone_code`
--
ALTER TABLE `phone_code`
  ADD PRIMARY KEY (`id_phonecode`);

--
-- Indeksy dla tabeli `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id_product`);

--
-- Indeksy dla tabeli `supplier_of_goods`
--
ALTER TABLE `supplier_of_goods`
  ADD PRIMARY KEY (`id_supplier`),
  ADD KEY `id_phonecode` (`id_phonecode`);

--
-- Indeksy dla tabeli `type_address`
--
ALTER TABLE `type_address`
  ADD PRIMARY KEY (`id_type`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id_address` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `basket`
--
ALTER TABLE `basket`
  MODIFY `id_basket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `phone_code`
--
ALTER TABLE `phone_code`
  MODIFY `id_phonecode` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `products`
--
ALTER TABLE `products`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `supplier_of_goods`
--
ALTER TABLE `supplier_of_goods`
  MODIFY `id_supplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `type_address`
--
ALTER TABLE `type_address`
  MODIFY `id_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `addresses_ibfk_2` FOREIGN KEY (`id_type`) REFERENCES `type_address` (`id_type`);

--
-- Ograniczenia dla tabeli `basket`
--
ALTER TABLE `basket`
  ADD CONSTRAINT `basket_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `basket_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`);

--
-- Ograniczenia dla tabeli `supplier_of_goods`
--
ALTER TABLE `supplier_of_goods`
  ADD CONSTRAINT `supplier_of_goods_ibfk_1` FOREIGN KEY (`id_phonecode`) REFERENCES `phone_code` (`id_phonecode`),
  ADD CONSTRAINT `supplier_of_goods_ibfk_2` FOREIGN KEY (`id_supplier`) REFERENCES `products` (`id_product`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
