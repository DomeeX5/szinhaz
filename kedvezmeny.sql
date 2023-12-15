-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Dec 15. 08:30
-- Kiszolgáló verziója: 10.4.24-MariaDB
-- PHP verzió: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `szinhazdolgozat`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kedvezmeny`
--

CREATE TABLE `kedvezmeny` (
  `id` int(11) NOT NULL,
  `title` varchar(1000) COLLATE utf8_hungarian_ci NOT NULL,
  `percentage` int(11) NOT NULL,
  `code` varchar(11) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `kedvezmeny`
--

INSERT INTO `kedvezmeny` (`id`, `title`, `percentage`, `code`) VALUES
(1, 'Rómeó és Júlia', 10, 'ASDF-123456'),
(2, 'Hamlet', 15, 'QWER-987654');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `kedvezmeny`
--
ALTER TABLE `kedvezmeny`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `kedvezmeny`
--
ALTER TABLE `kedvezmeny`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
