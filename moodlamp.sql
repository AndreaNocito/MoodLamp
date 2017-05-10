-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mag 10, 2017 alle 15:31
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
  `idUtente` varchar(20) DEFAULT NULL,
  `idLampada` int(8) DEFAULT NULL,
  `idEmozione` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `associazioni`
--

CREATE TABLE `associazioni` (
  `id` int(11) NOT NULL,
  `idUtente` varchar(20) DEFAULT NULL,
  `idLampada` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `emozioni`
--

CREATE TABLE `emozioni` (
  `id` int(11) NOT NULL,
  `nome` varchar(20) DEFAULT NULL,
  `colore` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `emozioni`
--

INSERT INTO `emozioni` (`id`, `nome`, `colore`) VALUES
(1, 'Tristezza', 'Blu'),
(2, 'Amore', 'Rosa'),
(3, 'Rabbia', 'Rosso'),
(4, 'Gioia', 'Giallo'),
(5, 'Entusiasmo', 'Arancione'),
(6, 'Disprezzo', 'Viola'),
(7, 'Speranza', 'Verde');

-- --------------------------------------------------------

--
-- Struttura della tabella `lampade`
--

CREATE TABLE `lampade` (
  `codice` int(8) NOT NULL,
  `password` char(32) DEFAULT NULL,
  `nome` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `parole`
--

CREATE TABLE `parole` (
  `id` int(11) NOT NULL,
  `parola` varchar(20) DEFAULT NULL,
  `punteggio` int(11) DEFAULT NULL,
  `idEmozione` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `utenti`
--

CREATE TABLE `utenti` (
  `codice` varchar(20) NOT NULL,
  `password` char(32) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `nome` varchar(25) DEFAULT NULL,
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
-- Indici per le tabelle `emozioni`
--
ALTER TABLE `emozioni`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `lampade`
--
ALTER TABLE `lampade`
  ADD PRIMARY KEY (`codice`);

--
-- Indici per le tabelle `parole`
--
ALTER TABLE `parole`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idEmozione` (`idEmozione`);

--
-- Indici per le tabelle `utenti`
--
ALTER TABLE `utenti`
  ADD PRIMARY KEY (`codice`);

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
-- AUTO_INCREMENT per la tabella `emozioni`
--
ALTER TABLE `emozioni`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT per la tabella `parole`
--
ALTER TABLE `parole`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `analisi`
--
ALTER TABLE `analisi`
  ADD CONSTRAINT `analisi_ibfk_1` FOREIGN KEY (`idUtente`) REFERENCES `utenti` (`codice`),
  ADD CONSTRAINT `analisi_ibfk_2` FOREIGN KEY (`idLampada`) REFERENCES `lampade` (`codice`),
  ADD CONSTRAINT `analisi_ibfk_3` FOREIGN KEY (`idEmozione`) REFERENCES `emozioni` (`id`);

--
-- Limiti per la tabella `associazioni`
--
ALTER TABLE `associazioni`
  ADD CONSTRAINT `associazioni_ibfk_1` FOREIGN KEY (`idUtente`) REFERENCES `utenti` (`codice`),
  ADD CONSTRAINT `associazioni_ibfk_2` FOREIGN KEY (`idLampada`) REFERENCES `lampade` (`codice`);

--
-- Limiti per la tabella `parole`
--
ALTER TABLE `parole`
  ADD CONSTRAINT `parole_ibfk_1` FOREIGN KEY (`idEmozione`) REFERENCES `emozioni` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
