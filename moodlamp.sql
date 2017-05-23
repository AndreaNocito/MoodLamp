-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mag 23, 2017 alle 16:19
-- Versione del server: 10.1.21-MariaDB
-- Versione PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `moodlamp`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `analisi`
--

CREATE TABLE `analisi` (
  `id` int(11) NOT NULL,
  `soggetto` text,
  `data` date DEFAULT NULL,
  `idUtente` int(11) DEFAULT NULL,
  `idLampada` int(11) DEFAULT NULL,
  `idEmozione` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `associazioni`
--

CREATE TABLE `associazioni` (
  `id` int(11) NOT NULL,
  `idUtente` int(11) DEFAULT NULL,
  `idLampada` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `congiunzioni`
--

CREATE TABLE `congiunzioni` (
  `id` int(11) NOT NULL,
  `testo` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `corrispondenze`
--

CREATE TABLE `corrispondenze` (
  `id` int(11) NOT NULL,
  `idEmozione` int(11) DEFAULT NULL,
  `idParola` int(11) DEFAULT NULL,
  `punteggio` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `emozioni`
--

CREATE TABLE `emozioni` (
  `id` int(11) NOT NULL,
  `nome` varchar(15) NOT NULL,
  `colore` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `lampade`
--

CREATE TABLE `lampade` (
  `id` int(11) NOT NULL,
  `password` char(32) DEFAULT NULL,
  `nome` varchar(20) DEFAULT NULL,
  `led` tinyint(1) DEFAULT NULL,
  `display` tinyint(1) DEFAULT NULL,
  `stato` varchar(15) DEFAULT NULL,
  `colore` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `parole`
--

CREATE TABLE `parole` (
  `id` int(11) NOT NULL,
  `parola` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `punteggiatura`
--

CREATE TABLE `punteggiatura` (
  `id` int(11) NOT NULL,
  `testo` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `utenti`
--

CREATE TABLE `utenti` (
  `id` int(11) NOT NULL,
  `username` varchar(25) DEFAULT NULL,
  `password` char(32) DEFAULT NULL,
  `nome` varchar(15) DEFAULT NULL,
  `cognome` varchar(25) DEFAULT NULL,
  `dataNascita` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `analisi`
--
ALTER TABLE `analisi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUtente` (`idUtente`),
  ADD KEY `idLampada` (`idLampada`),
  ADD KEY `idEmozione` (`idEmozione`);

--
-- Indici per le tabelle `associazioni`
--
ALTER TABLE `associazioni`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUtente` (`idUtente`),
  ADD KEY `idLampada` (`idLampada`);

--
-- Indici per le tabelle `congiunzioni`
--
ALTER TABLE `congiunzioni`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `corrispondenze`
--
ALTER TABLE `corrispondenze`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idEmozione` (`idEmozione`),
  ADD KEY `idParola` (`idParola`);

--
-- Indici per le tabelle `emozioni`
--
ALTER TABLE `emozioni`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `lampade`
--
ALTER TABLE `lampade`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `parole`
--
ALTER TABLE `parole`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `punteggiatura`
--
ALTER TABLE `punteggiatura`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `utenti`
--
ALTER TABLE `utenti`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `analisi`
--
ALTER TABLE `analisi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `associazioni`
--
ALTER TABLE `associazioni`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `congiunzioni`
--
ALTER TABLE `congiunzioni`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `corrispondenze`
--
ALTER TABLE `corrispondenze`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `emozioni`
--
ALTER TABLE `emozioni`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `parole`
--
ALTER TABLE `parole`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `punteggiatura`
--
ALTER TABLE `punteggiatura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `utenti`
--
ALTER TABLE `utenti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `analisi`
--
ALTER TABLE `analisi`
  ADD CONSTRAINT `analisi_ibfk_1` FOREIGN KEY (`idUtente`) REFERENCES `utenti` (`id`),
  ADD CONSTRAINT `analisi_ibfk_2` FOREIGN KEY (`idLampada`) REFERENCES `lampade` (`id`),
  ADD CONSTRAINT `analisi_ibfk_3` FOREIGN KEY (`idEmozione`) REFERENCES `emozioni` (`id`);

--
-- Limiti per la tabella `associazioni`
--
ALTER TABLE `associazioni`
  ADD CONSTRAINT `associazioni_ibfk_1` FOREIGN KEY (`idUtente`) REFERENCES `utenti` (`id`),
  ADD CONSTRAINT `associazioni_ibfk_2` FOREIGN KEY (`idLampada`) REFERENCES `lampade` (`id`);

--
-- Limiti per la tabella `corrispondenze`
--
ALTER TABLE `corrispondenze`
  ADD CONSTRAINT `corrispondenze_ibfk_1` FOREIGN KEY (`idEmozione`) REFERENCES `emozioni` (`id`),
  ADD CONSTRAINT `corrispondenze_ibfk_2` FOREIGN KEY (`idParola`) REFERENCES `parole` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
