-- phpMyAdmin SQL Dump
-- version 4.1.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Giu 27, 2017 alle 10:30
-- Versione del server: 5.6.33-log
-- PHP Version: 5.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `my_moodlamp`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `analisi`
--

CREATE TABLE IF NOT EXISTS `analisi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idEmozioneRes` int(11) DEFAULT NULL,
  `idUtente` varchar(20) DEFAULT NULL,
  `dataAnalisi` datetime DEFAULT NULL,
  `testo` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idEmozioneRes` (`idEmozioneRes`),
  KEY `idUtente` (`idUtente`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dump dei dati per la tabella `analisi`
--

INSERT INTO `analisi` (`id`, `idEmozioneRes`, `idUtente`, `dataAnalisi`, `testo`) VALUES
(1, 1, 'AndreaNocito', '2017-06-25 00:00:00', 'sono felice');

-- --------------------------------------------------------

--
-- Struttura della tabella `appartenenze`
--

CREATE TABLE IF NOT EXISTS `appartenenze` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idGruppo` int(11) DEFAULT NULL,
  `idLampadaAssociata` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idGruppo` (`idGruppo`),
  KEY `idLampadaAssociata` (`idLampadaAssociata`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dump dei dati per la tabella `appartenenze`
--

INSERT INTO `appartenenze` (`id`, `idGruppo`, `idLampadaAssociata`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 6),
(5, 2, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `associazioni`
--

CREATE TABLE IF NOT EXISTS `associazioni` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idUtente` varchar(20) DEFAULT NULL,
  `idLampada` varchar(15) DEFAULT NULL,
  `alias` varchar(20) NOT NULL,
  `timer` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idUtente` (`idUtente`),
  KEY `idLampada` (`idLampada`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dump dei dati per la tabella `associazioni`
--

INSERT INTO `associazioni` (`id`, `idUtente`, `idLampada`, `alias`, `timer`) VALUES
(3, 'Andrea', 'Mason', 'Cookie', NULL),
(1, 'Andrea', 'A113', 'Lily', NULL),
(2, 'Andrea', 'Moody', 'Cube', NULL),
(6, 'AndreaNocito', 'A113', 'Lily', 20),
(4, 'AndreaNocito', 'Moody', 'Cube', 30);

-- --------------------------------------------------------

--
-- Struttura della tabella `colori`
--

CREATE TABLE IF NOT EXISTS `colori` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `colore` varchar(15) DEFAULT NULL,
  `codice` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dump dei dati per la tabella `colori`
--

INSERT INTO `colori` (`id`, `colore`, `codice`) VALUES
(1, 'Giallo', 'y'),
(2, 'Verde', 'g'),
(3, 'Azzurro', 'a'),
(4, 'Blu', 'b'),
(5, 'Viola', 'v'),
(6, 'Rosa', 'p'),
(7, 'Rosso', 'r'),
(8, 'Arancione', 'o'),
(9, 'Bianco', 'w'),
(10, 'Fade', 'f'),
(11, 'On', 'l'),
(12, 'Off', 'n');

-- --------------------------------------------------------

--
-- Struttura della tabella `corrispondenze`
--

CREATE TABLE IF NOT EXISTS `corrispondenze` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idEmozione` int(11) DEFAULT NULL,
  `idParola` int(11) DEFAULT NULL,
  `punteggio` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idEmozione` (`idEmozione`),
  KEY `idParola` (`idParola`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dump dei dati per la tabella `corrispondenze`
--

INSERT INTO `corrispondenze` (`id`, `idEmozione`, `idParola`, `punteggio`) VALUES
(1, 1, 21, 2),
(2, 1, 22, 3),
(3, 1, 23, 3),
(4, 1, 24, 3),
(5, 2, 1, 3),
(6, 2, 2, 3),
(7, 2, 3, 2),
(8, 2, 4, 2),
(9, 1, 4, 1),
(10, 3, 5, 3),
(11, 3, 20, 3),
(12, 4, 6, 3),
(13, 4, 7, 1),
(14, 8, 7, 2),
(15, 4, 8, 2),
(16, 5, 9, 3),
(17, 5, 10, 3),
(18, 7, 11, 3),
(19, 7, 12, 2),
(20, 7, 13, 3),
(21, 7, 14, 3),
(22, 2, 15, 2),
(23, 6, 16, 3),
(24, 6, 17, 2),
(25, 8, 18, 3),
(26, 8, 19, 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `emozioni`
--

CREATE TABLE IF NOT EXISTS `emozioni` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emozione` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dump dei dati per la tabella `emozioni`
--

INSERT INTO `emozioni` (`id`, `emozione`) VALUES
(1, 'Gioia'),
(2, 'Tristezza'),
(3, 'Speranza'),
(4, 'Amore'),
(5, 'Disprezzo'),
(6, 'Paura'),
(7, 'Rabbia'),
(8, 'Entusiasmo');

-- --------------------------------------------------------

--
-- Struttura della tabella `gruppi`
--

CREATE TABLE IF NOT EXISTS `gruppi` (
  `nome` varchar(30) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userCreatore` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userCreatore` (`userCreatore`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dump dei dati per la tabella `gruppi`
--

INSERT INTO `gruppi` (`nome`, `id`, `userCreatore`) VALUES
('maturità', 1, 'moodlamp'),
('quellebelle', 2, 'AndreaNocito');

-- --------------------------------------------------------

--
-- Struttura della tabella `illumina`
--

CREATE TABLE IF NOT EXISTS `illumina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idLampada` varchar(15) DEFAULT NULL,
  `idAnalisi` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idLampada` (`idLampada`),
  KEY `idAnalisi` (`idAnalisi`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dump dei dati per la tabella `illumina`
--

INSERT INTO `illumina` (`id`, `idLampada`, `idAnalisi`) VALUES
(1, 'A113', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `lampade`
--

CREATE TABLE IF NOT EXISTS `lampade` (
  `id` varchar(15) NOT NULL,
  `password` char(32) DEFAULT NULL,
  `display` tinyint(1) DEFAULT NULL,
  `stato` varchar(15) DEFAULT NULL,
  `colore` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `colore` (`colore`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `lampade`
--

INSERT INTO `lampade` (`id`, `password`, `display`, `stato`, `colore`) VALUES
('A113', '0a89c133d3906c8bebbfe3cbf1598476', 0, 'analisi', 4),
('Moody', '0a89c133d3906c8bebbfe3cbf1598476', 1, NULL, NULL),
('Mason', '0a89c133d3906c8bebbfe3cbf1598476', 0, NULL, 4),
('Mushroom', 'c82ebfbd10cbe6ea691d8127819798d5', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `parole`
--

CREATE TABLE IF NOT EXISTS `parole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parola` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dump dei dati per la tabella `parole`
--

INSERT INTO `parole` (`id`, `parola`) VALUES
(1, 'triste'),
(2, 'depressione'),
(3, 'malinconia'),
(4, 'lacrime'),
(5, 'speranza'),
(6, 'amore'),
(7, 'passione'),
(8, 'bene'),
(9, 'schifo'),
(10, 'ribrezzo'),
(11, 'ira'),
(12, 'nervoso'),
(13, 'rabbioso'),
(14, 'innervosire'),
(15, 'delusione'),
(16, 'terrorizzato'),
(17, 'ansia'),
(18, 'entusiasta'),
(19, 'evviva'),
(20, 'spero'),
(21, 'felicità'),
(22, 'gioia'),
(23, 'felice'),
(24, 'gioioso');

-- --------------------------------------------------------

--
-- Struttura della tabella `preferenze`
--

CREATE TABLE IF NOT EXISTS `preferenze` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idUtente` varchar(20) DEFAULT NULL,
  `idEmozione` int(11) DEFAULT NULL,
  `idColore` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idUtente` (`idUtente`),
  KEY `idColore` (`idColore`),
  KEY `idEmozione` (`idEmozione`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=38 ;

--
-- Dump dei dati per la tabella `preferenze`
--

INSERT INTO `preferenze` (`id`, `idUtente`, `idEmozione`, `idColore`) VALUES
(1, 'AndreaNocito', 1, 1),
(2, 'AndreaNocito', 2, 4),
(3, 'AndreaNocito', 3, 2),
(4, 'AndreaNocito', 4, 6),
(5, 'AndreaNocito', 5, 5),
(6, 'AndreaNocito', 6, 3),
(7, 'AndreaNocito', 7, 7),
(8, 'AndreaNocito', 8, 8),
(14, 'Andrea', 2, 4),
(13, 'Andrea', 1, 1),
(15, 'Andrea', 3, 2),
(16, 'Andrea', 4, 6),
(17, 'Andrea', 5, 5),
(18, 'Andrea', 6, 3),
(19, 'Andrea', 7, 7),
(20, 'Andrea', 8, 8),
(21, 'moodlamp', 1, 1),
(22, 'moodlamp', 2, 4),
(23, 'moodlamp', 3, 2),
(24, 'moodlamp', 4, 6),
(25, 'moodlamp', 5, 5),
(26, 'moodlamp', 6, 3),
(27, 'moodlamp', 7, 7),
(28, 'moodlamp', 8, 8),
(29, 'missMe', 1, 1),
(30, 'missMe', 2, 4),
(31, 'missMe', 3, 2),
(32, 'missMe', 4, 6),
(33, 'missMe', 5, 5),
(34, 'missMe', 6, 3),
(35, 'missMe', 7, 7),
(36, 'missMe', 8, 8),
(37, 'Andrea', 1, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `utenti`
--

CREATE TABLE IF NOT EXISTS `utenti` (
  `username` varchar(20) NOT NULL,
  `password` char(32) DEFAULT NULL,
  `nome` varchar(15) DEFAULT NULL,
  `cognome` varchar(15) DEFAULT NULL,
  `dataNascita` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `utenti`
--

INSERT INTO `utenti` (`username`, `password`, `nome`, `cognome`, `dataNascita`) VALUES
('Andrea', '0a89c133d3906c8bebbfe3cbf1598476', 'Andrea', 'Bernardo', '04/06/1998'),
('AndreaNocito', '104004214ebf2a9e7840ed8d280a887d', 'Andrea', 'Nocito', '07/10/1998'),
('moodlamp', '488d04ab0562567363d0981b818d1b55', 'mood', 'lamp', '03/02/1986'),
('missMe', '2d2c57c85f2eace9aa5b3a6430897b56', 'Jim', 'Moriarty', '21/10/1976');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
