-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Generation Time: Jan 21, 2022 at 05:23 PM
-- Server version: 8.0.27
-- PHP Version: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `atlas-of-smooth-spaces`
--

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `eventId` int NOT NULL,
  `name` varchar(1027) NOT NULL,
  `host` varchar(1027) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `until_date` date DEFAULT NULL,
  `statusId` int DEFAULT NULL,
  `participants` int DEFAULT NULL,
  `gatheringId` int NOT NULL,
  `wo` varchar(1027) NOT NULL,
  `beginn` time NOT NULL,
  `postId` int NOT NULL,
  `virtuell` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`eventId`, `name`, `host`, `email`, `from_date`, `until_date`, `statusId`, `participants`, `gatheringId`, `wo`, `beginn`, `postId`, `virtuell`) VALUES
(1, 'A Syntax for Smooth Spaces', 'Complexity Science Hub Vienna', 'atlasofsmoothspaces@gmail.com', '2021-06-17', '2021-06-18', 3, 16, 1, 'Complexity Science Hub Vienna, Josefstaedter Strasse 39, 1080 Vienna. ', '09:00:00', 1, 0),
(2, 'Ignition Lab -- Kick-off Workshop', 'MDW', 'atlasofsmoothspaces@gmail.com', '2021-09-01', '2021-09-04', 3, 10, 2, 'Großer Saal, Rennweg 8, 1030 Wien.', '09:00:00', 2, 0),
(3, 'Günther Zimmermann — Performance', 'Minoritenkirche Wels and Stadtpfarre Urfahr', NULL, '2021-11-11', '2021-11-12', 3, 40, 3, 'Minoritenkirche, Minoritenplatz 3, Wels;\\n Stadtpfarre Urfahr, Linz', '19:30:00', 3, 0),
(4, 'Conducting Spaces - Ars Electronica', 'Ars Electronica', 'pilgrim@mdw.ac.at', '2021-09-11', '2021-09-11', 3, 40, 4, 'Johannes Kepler University, Campus, Linz', '09:00:00', 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `eventStatus`
--

CREATE TABLE `eventStatus` (
  `statusId` int NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `eventStatus`
--

INSERT INTO `eventStatus` (`statusId`, `description`) VALUES
(0, 'cancelled'),
(1, 'upcoming'),
(2, 'ongoing'),
(3, 'completed');

-- --------------------------------------------------------

--
-- Table structure for table `eventType`
--

CREATE TABLE `eventType` (
  `eventTypeId` int NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `eventType`
--

INSERT INTO `eventType` (`eventTypeId`, `description`) VALUES
(1, 'workshop'),
(2, 'lecture'),
(3, 'performance'),
(4, 'meeting'),
(5, 'experiment'),
(6, 'reading group');

-- --------------------------------------------------------

--
-- Table structure for table `gatherings`
--

CREATE TABLE `gatherings` (
  `gatheringId` int NOT NULL,
  `eventTypeId` int NOT NULL,
  `description` varchar(528) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `gatherings`
--

INSERT INTO `gatherings` (`gatheringId`, `eventTypeId`, `description`) VALUES
(1, 1, 'Syntax of Smooth Spaces workshop at the CSH'),
(2, 1, 'Ignition Lab. Kickoff Workshop'),
(3, 3, 'Dorothe Günther Performances'),
(4, 3, 'Conducting Spaces at the Ars Electronica in September 2021\r\n'),
(5, 4, 'Damian\'s Lecture on Movement Notation'),
(6, 4, 'Urheberrechts Diskussion'),
(7, 4, 'Glover Testing with Adrian, Hanne, Johannes and Leo'),
(8, 4, 'Discussions with UK-based artist Geraldine Cox'),
(9, 4, 'Meeting between Rose and Leo at the Anton Bruckner Privatuniversität'),
(10, 4, 'Meeting at the Cafe Prückel with Rose, Hanne and Leo'),
(11, 4, 'Meeting on Movement in the Large Movement room of the MDW Singerstrasse with Maria and Leo'),
(12, 4, 'Discussion and developing ideas. Meeting at the \"kleines Cafe\" with Maria and Leo'),
(13, 4, 'Meeting with Anna Leon from TQW'),
(14, 4, 'Lux Aeterna November Lab'),
(15, 5, 'Lux Aeterna gestural study with video recording session'),
(16, 4, 'Hanne and Leo meet to discuss the iteration process for the hand gesture study.'),
(17, 4, 'Reading Group turned into discussion on the Smooth Spaces Project'),
(18, 4, 'Discussion of the Choir Lab'),
(19, 4, 'Discussion with Jan Schacher, Steffi, Magdalena, Hanne und Leo'),
(20, 2, 'Jan Schacher held a lecture at the MDW'),
(21, 4, 'End of the Year Smooth Spaces Project Meeting'),
(22, 4, 'Workshop with Rose Breuss at Kunstuni Linz about updates on everyone\'s projects.'),
(23, 4, 'Meeting with Professor Dirmoser in his office and a tour through the library. Gerhard, Hanne and Leo'),
(24, 4, 'Maria and Leo catch up after the New Year to discuss new directions.'),
(25, 4, 'Adrian and Leo catch up after the New Year to discuss research direction'),
(26, 6, 'Reading Group discussion on Adrians Research proposal'),
(27, 4, 'Hanne and Leo discuss the Boom lab and joined talk with the doctoral research students.'),
(28, 4, 'Hanne, Magdalena and Hanne meet to update each other on the current projects and read Steffis text.');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `mediaId` int NOT NULL,
  `mediatypeId` int NOT NULL,
  `path` varchar(1000) NOT NULL,
  `author` varchar(1000) NOT NULL,
  `rights` varchar(5000) NOT NULL,
  `uploaded` date NOT NULL,
  `alt` varchar(527) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`mediaId`, `mediatypeId`, `path`, `author`, `rights`, `uploaded`, `alt`) VALUES
(1, 1, 'img/GuentherZimmermanPerformance_ConstantinGeorgescu_Wels_111121_1.jpeg', 'Constantin Georgescu', 'Constantin Georgescu', '2021-11-16', 'Photo of the Dance Ensemble Choreographia[Inter]Austriaca'),
(2, 1, 'img/GuentherZimmermanPerformance_ConstantinGeorgescu_Wels_111121_2.jpeg', 'Constantin Georgescu', 'Constantin Georgescu', '2021-11-16', 'Photo of the Dance Ensemble Choreographia[Inter]Austriaca'),
(3, 1, 'img/KaiFilmedByHanneBoom_Wien_030921.jpg', 'Leonhard Horstmeyer', 'Leonhard Horstmeyer', '2021-11-18', 'Kai is filmed by Hanne during the Boom experimentation Lab in Vienna on Third of September 21'),
(4, 1, 'img/HanneLuxAeterna_Linz_110921.jpg', 'Leonhard Horstmeyer', 'Leonhard Horstmeyer', '2021-11-18', 'Lux Aeterna performance ... collection before the performance.'),
(5, 1, 'img/damian-cortes-alberti-peter-philipp_orig.jpg', 'Peter Philipp', 'Peter Philipp', '2021-12-09', 'Photo of Damian Cortes Alberti by Peter Philipp'),
(6, 1, 'img/headshot_Adrian.png', 'Adrian Artacho', 'Adrian Artacho', '2021-12-13', 'Profile Picture of Adrian Artacho'),
(7, 1, 'img/Maria.jpg', 'Leonhard Horstmeyer', '', '2022-01-20', 'Maria Shurkhal'),
(8, 1, 'img/Hanne.jpg', 'Hanne Pilgrim', '', '2022-01-20', 'Photo of Hanne Pilgrim'),
(9, 1, 'img/RoseBreuss_closeup.png', 'Rose Breuss', '', '2022-01-20', 'Photo of Rose Breuss'),
(10, 1, 'img/JohannesHiemetsberger_closeup.jpg', 'Johannes Hiemetsberger', '', '2022-01-20', 'Photo of Johannes Hiemetsberger'),
(11, 1, 'img/Leo_closeup.png', 'Leonhard Horstmeyer', '', '2022-01-20', 'Photo of Leonhard Horstmeyer'),
(12, 1, 'img/William_closeup.png', 'William Edouard Franck', '', '2022-01-20', 'Photo of William Edouard Franck'),
(13, 1, 'img/stephanieschroedter21.png', 'Stephanie Schroedter', '', '2022-01-20', 'Photo of Stephanie Schroedter'),
(14, 1, 'img/eidenhammer_c_Well_Ferreira.jpg', 'Well Ferreira', 'Well Ferreira', '2022-01-20', 'Photo of Magdalena Eidenhammer');

-- --------------------------------------------------------

--
-- Table structure for table `mediaInPosts`
--

CREATE TABLE `mediaInPosts` (
  `id` int NOT NULL,
  `mediaId` int NOT NULL,
  `postId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `mediaInPosts`
--

INSERT INTO `mediaInPosts` (`id`, `mediaId`, `postId`) VALUES
(1, 1, 3),
(2, 2, 3),
(3, 3, 2),
(4, 4, 4),
(5, 5, 29),
(7, 6, 30),
(8, 8, 21),
(9, 7, 28),
(10, 9, 22),
(11, 10, 23),
(12, 11, 24),
(13, 12, 25),
(14, 13, 26),
(15, 14, 27);

-- --------------------------------------------------------

--
-- Table structure for table `mediaType`
--

CREATE TABLE `mediaType` (
  `mediatypeId` int NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `mediaType`
--

INSERT INTO `mediaType` (`mediatypeId`, `description`) VALUES
(1, 'image'),
(2, 'video'),
(3, 'audio');

-- --------------------------------------------------------

--
-- Table structure for table `meetings`
--

CREATE TABLE `meetings` (
  `meetingId` int NOT NULL,
  `date` datetime NOT NULL,
  `location` varchar(1000) NOT NULL,
  `description` text NOT NULL,
  `statusTypeId` int NOT NULL,
  `gatheringId` int NOT NULL,
  `postId` int NOT NULL,
  `virtuell` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `meetings`
--

INSERT INTO `meetings` (`meetingId`, `date`, `location`, `description`, `statusTypeId`, `gatheringId`, `postId`, `virtuell`) VALUES
(1, '2021-09-28 10:00:00', 'Anton Bruckner Privatuniversität', 'Damian held a lecture on Movement Notations at the abpu and Leo arrived from Vienna to attend this lecture.', 3, 5, 5, 0),
(2, '2021-09-28 12:00:00', 'Anton Bruckner Privatuniversität', 'Rose and Leo discussed topics on the research project \"Atlas of Smooth spaces\"', 3, 9, 9, 0),
(3, '2021-09-09 13:00:46', 'MDW Administrationsgebäude', 'Meeting with the lawyer regarding intellectual property rights', 3, 6, 6, 0),
(4, '2021-09-10 18:09:34', 'MDW Singerstrasse, Großer Bewegungsraum', 'Preparation for the performance \"Conducting Spaces\" at the Ars technica in Linz with Adrian, Johannes, Hanne and Leo', 3, 7, 7, 0),
(5, '2021-10-20 13:00:00', 'MDW Singergasse', 'Meeting to discuss aggregation, attenuation and addition in movement. Meeting at the Große Bewegungraum (Singergasse), Maria and Leo.', 3, 11, 13, 0),
(6, '2021-10-06 14:00:00', 'Kleines Cafe near MDW (Singergasse)', 'Discussion with Maria and Leo on smooth spaces', 3, 12, 14, 0),
(7, '2021-09-13 17:00:00', 'Zoom Meeting, held at the MDW (Singergasse)', 'Geraldine Cox and Leo discussed the work of Geraldine in the context of dance and foundational physical theories', 3, 8, 15, 0),
(8, '2021-10-05 09:30:00', 'Cafe Prückel', 'Meeting between Hanne, Rose and Leo to discuss the further direction of the projects.', 3, 10, 10, 0),
(9, '2021-11-16 11:00:50', 'MDW Singergasse', 'Meeting with Anna Leon from Tanzquartier Wien', 3, 13, 16, 0),
(10, '2021-10-15 09:30:00', 'MDW (Singergasse and Anton-von-Webern Platz)', 'Lux Aeterna November Lab', 3, 14, 12, 0),
(11, '2021-11-19 15:00:00', 'Adrians Studio Space', 'Lux Aeterna Experimental Video Recording Sessions for Hand gestural study', 3, 15, 17, 0),
(12, '2021-11-30 13:32:00', 'MDW, Singergasse 26', 'Hanne and Leo meet to discuss iteration process for the hand gesture study.', 3, 16, 18, 0),
(13, '2021-12-03 08:00:00', 'Zoom', 'Virtual Discussion on the direction of the reading group', 3, 17, 19, 1),
(14, '2021-12-03 09:00:00', 'Rennweg 8', 'Initial Choir Lab Meeting', 3, 18, 20, 0),
(15, '2021-12-07 16:28:41', 'MDW Singerstrasse', 'Discussion with Jan Schacher about his research and work. ', 3, 19, 37, 0),
(16, '2021-12-21 10:30:37', 'Discussion Room (Lehrerzimmer) at the MDW Singerstrasse', 'Agenda for the Null spaces of Eurythmics, Dance and Choir.', 3, 21, 32, 0),
(17, '2021-12-22 12:00:37', 'Kunstuni Linz', 'Workshop about the ongoing projects in the group of Rose Breuss', 3, 22, 34, 0),
(18, '2021-12-22 10:00:37', 'Bibliothek der Kunstuni Linz', 'Meeting and discussion with Gerhard Dirmoser at the library of the \"Kunstuni Linz\"', 3, 23, 33, 0),
(19, '2022-01-13 16:30:37', 'Schauspielhaus Wien', 'Update and Discussion about the possible research directions for 2022.', 3, 24, 35, 0),
(20, '2022-01-11 15:30:37', 'Adrians Music Studio', 'Discussion on the Research Proposal by Adrian.', 3, 25, 41, 0),
(21, '2022-01-14 09:00:37', 'Zoom', 'Weekly Virtual meeting. Updating each other.', 3, 26, 38, 1),
(22, '2022-01-18 11:39:41', 'MDW Singerstrasse', 'Meeting with Hanne and Leo.', 3, 27, 39, 0),
(23, '2022-01-11 16:39:41', 'MDW Singerstrasse', 'Discussion with Hanne, Magdalena and Leo', 3, 28, 40, 0);

-- --------------------------------------------------------

--
-- Table structure for table `minutes`
--

CREATE TABLE `minutes` (
  `minutesId` int NOT NULL,
  `nameId` int NOT NULL,
  `gatheringId` int NOT NULL,
  `minutes` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `minutes`
--

INSERT INTO `minutes` (`minutesId`, `nameId`, `gatheringId`, `minutes`) VALUES
(1, 5, 18, 'Conducting Spaces\r\nJohannes und Sarah - Nullspaces und Lab\r\nVerbindung Chorleiten mit Parameter im Antrag.\r\n\r\nNullspaces vom Dirigieren oder vom Chor\r\n\r\nHans-Christian Anfrage. Könntet ihr nicht da was machen mit den Handschuhen\r\nDann kam die Idee mit Lux Aeterna. --> Output: Soundprojekt und Bilder\r\n-> Notizen vom Lux Aeterna Lab --> Time Quantities und Space Qualities.\r\n-> Kinetisches Hören. --> Übersetzung der 16 Stimmen in 16 Gesten. \r\n-> Zeitliche Quantitäten in Räumliche Qualitäten.\r\n\r\nJohannes erzählt von einem Stück (Purcel Inszenierung) in dem sie mit dem Chor spontan in den Raum gekommen sind durch Bewegung. Purcel - Hear My Prayer. Erste Stimme betritt als erster die Kirche\r\n\r\n\r\nBei polyphoner Musik gibt es eine Stimme, zwei Stimmen und dann wirds \'viel\'.\r\nÜbertragung von Notenbild in Bewegung\r\n\r\n\r\nDas verdeutlicht auch den Diskurs, die Reibungen und die Kommuniktion der Stimmen. Hierarchien bilen sich. Thema und Kontrapunkt. Was macht das wenn es sichtbar ist. \r\nZum Beispiel bei 8 Stimmiger Fuge gibt es eine Gleichberechtigung. Im Akkord (vertikal) da gibt es auch einen Accord (Die Stimmen einigen sich). \r\n\r\nHanne: Was zwischen dem Ein- und Aussatz passiert. \r\n\r\nJohannes: Es gibt einen Deutschen (Huber).\r\n\r\nSarah schaltet zu. Hanne fasst zusammen.\r\n\r\nJohannes erzählt. Es gab den Handschuh. Auf der einen Seite gibt es die Bewegung.\r\nJohannes berichtet über die Raumwahrnehmung \r\nRuppert Huber (Salzburger gebürtig) begleitet in Deutschland den Rundfunk (Rundfunkchöre). Gilt als schräger Vogel. Wirkungssingen. Gibt nichts schlimmeres als diese Attitüde der westlich ausgebildete Stimme.\r\nDas Wort entfaltet durch die gesungene Form erst seine Wirkung. Man versteht das Wort nicht mehr.\r\n\r\nFrage: Ist eine polyphone Struktur in seiner historischen Form etwas das jemals räumlich gedacht war. Polyphonie eher etwas horizontales... aber warum eigentlich. Johannes: Wenn man sich denkt wo \r\nkommt das her. Vielleicht kommt es aus der Gregorianik. Es ergibt sich eine Linie. Eigenständigkeit. Man empfindet etwas als Linie\r\n\r\nIn der Partitur ist man auf die zwei Dimensionen beschränkt. Aber in der Aufführung kann der Klang eine tiefe bekommen. \r\nAusbreitung von einem \r\n\r\nDiese Vorbereitung. Adrian.. ruhig auch experimentell aussuchen. \r\n\r\nJohannes: Wo ist Raum auch mitkomponiert. Bruckner zum Beispiel. Generalpausentakt.\r\n\r\nHanne: Wir sind wieder beim AUdiokorporeal.\r\n\r\nJohannes: In der REnnaissance gibt es Raumklang-Kompositionen. Bläser hier, Streicher dort etc. AUf Raumklang komponiert. Ist ein eigenes Kapitel.\r\n\r\nAdrian: Es gibt immer den Dirigenten in der Mitte. ABer bei Bewegung nicht. Warum nicht ein Stück komponieren, wo das polyphonische Räumlich gedacht ist. Ein Stück wo kein Ort im Raum privilegiert ist.\r\n\r\nJohannes: Vertikale Musik. Homophone. Braucht immer einen Zeitpunkt.\r\nWenn der Ligeti ganz frei wäre. Wenn es keine Einpflanzungen gäbe, keine horizontale Einpflanzung. \r\n\r\nHannes: Einsatz der Männerstimmen ist auch ein Einsatz. Dann plötzlich bildet sich wieder so eine Vertikale. \r\nJohannes: Wo\'s aufreißt. Im Notenbild wird das.\r\nDie Umsetzung der Partitur ändert das Raumgefühlt.\r\nWie macht es auf? Breit oder hoch?\r\n\r\nHanne: Man kann eben nicht sagen (Naive). Die Stimme geht auf und der Körper auch. \r\nWie fühlt sich das räumlich an. \r\n\r\nAber diese Übersetzung bezieht das Wirken nicht ein. \r\n\r\nHanne: Bei einem explosionsartigen Akkord, manche fallen zu Boden, manche springen hoch. \r\n\r\nJohannes: In welche Richtung öffne ich den Raum. Das öffnet beim Interpreten ganz unterschiedliche Parameter. Bewegung, Cressendo, Höhe.\r\n\r\nHanne: Arnie Cox. Music and Embodied Cognition: Listening, Moving, ...\r\n\r\nHanne: Es gibt vier verschiedene Aktionen ausser Stille. Nutzen Laban Notation. \r\n\r\nHanne erklärt den Chart. Welche Notationen.\r\n\r\nAdrian: Wer hat das Produziert. Für wen ist das interessant? Emitter und Receiver, wer sind die. Ein Floatchart. (Adrians Idee).\r\n\r\nAdrians Vorschlag: Polyphone Struktur mit Räumlichkeit. Bewegung oder Räumlichkeit in andrer Form. Adrian erwähnt: Share, care, dare. Alle ForscherInnen tragen etwas vor. Eine polyphone Partitur\r\nfür Zoom\r\n\r\nAdrian: Bei Soundpainting. Die Leute wissen nicht wann es weiter geht. \r\nAdrian: Der Chor ist in Bewegung, aber es gibt keine zentristische Position. \r\n\r\nJohannes: Was war die Idee hinter dem gemeinsamen Einsatz bei share, care und dare. \r\nHanne erklärt: Mal wieder doch ein Thema.\r\nJohannes: Was ist der Unterschied zwischen Miteinander, Gegeneinander.\r\noder ist es Verordnet, weil der Balken kommt. \r\n\r\nHanne: Was ist jetzt der spezifische Gewinn für uns. Chor dezentralisieren.\r\n\r\nJohannes: Tun wir das, tun wir das nicht. Grob gesagt es gibt das Stück und dann gibts das Fenster in dem das passiert.\r\nWenn ich an einen Bach-Choral denke. Königsdisziplin. Im Bach-Choral gibt es soo viel Freiheit. Als Fenster sehen, dass man das mal überlagert. \r\n\r\nAdrian: Andres Erlebnis wenn man dirigiert wird. Was ist wenn man die Freiheit die man hat. \r\n\r\nHanne: Die Gruppe geht selbstständig als Gruppe in Freitheit. Das sie Zusammen wirken. Am Ende ist das Ensemble allein. Wie war das Ergebnis. \r\nAdrian: Hat man gemerkt das musikalisch etwas passiert, als sie sich selber verwaltetet haben. \r\n\r\nJohannes: Diese Dezentrale Selbstorganisation öffnet Räume. Warum betrachten Wir einen Block als Eines. Beim Chor möchte man aber einen homogenen Block. Der Mehrwert ist, dass diese Gemeinsamkeit\r\nvon einem Zwang oder einer Gemeinsamkeit herauskommen kann.\r\nJohn Cage --> 600 Jahre-Stück. In 15 Jahren gibts einen Wechsel in Halbertstadt. \r\nSich zu freuen auf dieses Ereignes des zusammenkommens. \r\nIst der Treffpunkt eine Pflicht, ist er gewollt, ist es Ritual\r\n\r\nAdrian: Vielleicht ein Vorschlag zum nächsten Treffpunkt.\r\n\r\nJohannes: Kirchenraum gegliedert in drei Teile. Erste Seite vorbereitet mit fragmentarischen Sounds. zweite Region gabs ein Zusammenspiel von Tempis.\r\nEs hatte eine große Wirkung. Plötzlich war es wie ein Stück. Darf viel selber entscheiden. \"Wie kommen wir rein in den Raum\" <- Das \r\n\r\n\r\nHanne: Wir sind über Conducting Spaces in dieses Projekt reingeschlittert. Aber eigentlich haben wir ja gesagt, dass wir eigentlich ja unsere Null-Spaces suchen. Was ist die Basis meiner Disziplin.\r\nNähern wir uns unseren Null-Spaces an. Den performten Null-space.\r\n\r\nWir sind bei Stufe drei eingestiegen, aber wollen eigentlich beim Null-space einsteigen. \r\n\r\nGekoppeltes Pendel. Das Pendel als Null-Space der Physik. Das gekoppelte Pendel als Wasserstoffatom.\r\n\r\nHanne: Spricht noch Honaranote vs Vertrag an.\r\n\r\nJohannes: Zeitraum spübar machen. \r\nHanne: Notationen sichtbar zu machen. Ausprobieren. Das wir das lernen können. \r\n\r\nJohannes: Wünsche von dem Team an \r\n\r\nChor Stimme des Volkes. Der Chor als Stimme des Volkes. \r\n\r\nHanne: Dinge in die Community reingeben, mit der andere arbeiten können. \r\n\r\nJohannes: Das Leben als Alt ist so schwer. Es findet in einer Quinte statt. Gesellschaftsparallelitäten aufzeigen. Das Ensemble oder der Chor als Mikro-Gesellschaft. \r\n\r\nDieter Schnebel - Kontrapunktus eins. Er nimmt aus dem Wohltempereierten Klavier und verteilt das auf zwanzig verschiedene Sänger die räumlich verteilt sind. \r\n\r\nDie beste aller Welten: Voltair. \r\n\r\nAdrian ... Komponist kommt mit fertigem Text. \r\n\r\nAdrian: Ein Produktiver Arbeitszirkel. \r\n\r\nJohannes: Die Idee war mal ein Labor zu entwickeln. \r\nWie kann gemeinsames komponieren funktionieren ohne Frust-Risiko.\r\nDa gibts dann die Geschmacksebene. Die wird komplexer mit der Anzahl der Leute. \r\n\r\nResonanz kriegt der Interpret und nicht der Komponist. \r\nDer leere Raum - Peter Brook.\r\n\r\nLab ins Auge fassen. \r\n\r\n'),
(2, 5, 17, 'Rose: Rollenverteilung, neuen Modus finden für interdisziplinäres Arbeiten. \r\nRose+Hanne: Fokus auf die PEEK Forschung, aber jeder kann in den Diskurs eintreten.\r\nHanne: Ordner mit Vorschlägen. und verabreden uns. \r\nRose: Audio-Corporeal Art. Was ist das? Das zum Thema wird? Ändert sich ein Raum mit Musik. \r\nRose: Zwischenräume zu erforschen. Vielleicht gemeinsam den Dalcroze-Text oder Paullioude-Texte (Musik + Tanz, Musik + Bewegung).\r\nHanne: Ausgangspunkte sind die Null-Spaces und Text danach ausrichten und auswählen.\r\nAdrian: Wichtig der Austausch. Entwicklung eines gemeinsamen Vokabular. Was ist smooth, z.B. Wichtig bei einem komplexen Projekt mit vielen Standorten.\r\nProjekt-kultur entwickeln und Konzepte entwickeln.\r\n\r\nRose: Zeitliche Quantitäten zu einem Raum.\r\nHanne: Skizze über Conducting Spaces dargestellt\r\n\r\nTreffen: Für den 22. Dezember --- UNESCO Tanzsektion, uni linz\r\nRose: Transfer. Laban, Texte? Maria \"Was ist Labour in Tanz\". Elizabeth Grosz kritisiert Deleuze, darüber arbeitet Maria. Andresa --> Dekolonialität. Auch interessant für die Geographie und für Berlin\r\n\r\nRose: spannendes Symposium.. Dekolonialisierung des Wissens. Es geht auch um Praxiologie\r\n\r\nHanne: Future Art Lab ist frei, da Steffis Antrittsvorlesung verschoben wird. Der Raum ist frei (Neuer Konzertsaal). 31ter Januar.\r\n\r\nHanne: Wann sind die Colliding Phases?\r\nRose: Revision des Zeitplans/Phase. Vielleicht Konkretisierung. Weniger Allgemein, sondern Konkretisierungen mit den spezifischen Forschungsfragen.\r\n\r\nHanne: Termine? Vorschlag. 20ter oder 21ter Dezember. z.b. in Wien. \r\nRose: 21ter Dezember in Wien? \r\nUhrzeit? 9 oder 10. Gerne 10 Uhr.\r\n\r\nRose fragt Maria\r\nHanne fragt William und Johannes und Steffi und Magdalena.\r\nAdrian? Ja würde passen.\r\n\r\nDeleuze --> Projektzusammentreffen.\r\nz.b offenes Forum... aber es geht um Texte.\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `paragraphs`
--

CREATE TABLE `paragraphs` (
  `paragraphId` int NOT NULL,
  `postId` int NOT NULL,
  `ordinal` int NOT NULL,
  `text` text NOT NULL,
  `updated` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `paragraphs`
--

INSERT INTO `paragraphs` (`paragraphId`, `postId`, `ordinal`, `text`, `updated`) VALUES
(1, 1, 1, 'How can we construct notational systems of spaces and what do we demand from them? In this workshop, we would like to pursue this question from a performance, as well as a complexity science perspective, and lay emphasis on the experiential dimension rather than the bare physical description. At the same time, we explore various synergies with the work of the CSH. How can we build virtual or artificial spaces? How can virtual spaces help to investigate space experiences? How can notational systems be developed, also beyond a written encoding? In the audio-corporeal arts, space is both shaped by performers as a medium, and shaping the performer as a condition. Despite its important role, notations and means of communicating spaces and their qualities are lacking. The 20th century has seen a range of notational systems for movement and dance, such as the Laban notation. The starting point of this workshop is a brief exposition of the notion of artistic research, followed by theoretical contributions and practical input from performers. The envisioned output is artistic research collaboration between the mdw (University for Music and Performative Art Vienna), the abpu (Anton Brucker Privatuniversität) and the Complexity Science Hub (CSH).', '2021-11-16'),
(2, 3, 1, '\"Die Abonnementkonzerte Wels sind für Oberösterreich ein Geheimtipp für zeitgenössische Musik, wo neue Klänge mit Etabliertem in Verbindung gesetzt werden. Der experimentelle Gedanke wird durchaus weiter gefasst. So war beim Konzert im Veranstaltungszentrum Minoriten Wels am Donnerstag nicht nur das Altenberg Trio Wien zu Gast, sondern auch \"Choreographia[Inter]Austriaca\", ein Tanzensemble von Rose Breuss. Man widmete sich einem sehr eigenwilligen Werk von Bernd Alois Zimmermann, das 1961 als Concerto scénique uraufgeführt wurde und fünf Jahre später als konsequente Weiterentwicklung zum Ballet blanc en cinq scènes \"Présence\" mutierte. Es ist als Schlüsselwerk einer ganzen \"Epoche\" zu verstehen. Choreografin Rose Breuss setzte die \"Eiswüste der Töne\" in eloquente Gesten um. Dadurch wurde die Musik kontrapunktiert und doch wurde ganz eng auf sie reagiert.\"\r\n<br><br>\r\nschreibt OÖNachrichten', '2021-11-16'),
(3, 1, 2, 'This workshop is in collaboration with the Complexity Science Hub Vienna', '2021-11-16'),
(4, 5, 1, 'Damian held a great lecture on the histoy of dance notations and a classification by Ann Hutchinson\r\nGuest. For me one of the most notable insights was the diversity in the choice of representation.\r\nSome systems used existing symbolic systems such as words (alphabet) or musical scores, others\r\nfocussed on the physical track that was drawn in space, others made little figures, and again others\r\nabstracted symbols. Some were used only within a very specific setting (Louis XIV) or specific\r\nschool. What I found interesting in one of the scores that was reminiscent of a musical score, was\r\nthe use of a key. Damian told us that unlike the musical keys, the dance keys stated the departure\r\nposture for the dance. Does one need a key for a dance score? What would be the requirements for a\r\nkey? Does the initial posture have similar significance for the following dance as does the musical\r\nnotation?', '2021-11-25'),
(5, 5, 2, 'A question that was raised during the discussion was: What generates the expression? Intentions etc.\r\nBut maybe anecdotal narratives? Or the actual physical steps? It was furthermore interesting to see\r\nthe progression from notating the steps or actions to notating the movements.  ', '2021-11-25'),
(6, 5, 3, 'We also learned that notations were used as markatable trademarks throughout the history.', '2021-11-25'),
(7, 5, 4, 'Another question that was brought up and which I would paraphrase here: Literacy has played an\r\nimportant role in emancipating the individual from the preachings of teachers and interpreters of\r\nholy scriptures. Would literacy in dance notations empower dancers in a similar manner? Literacy\r\nalso used to be a privilege. Is it a similar case here?', '2021-11-25'),
(8, 9, 1, 'Discussions about the work and relevance of Gerhard Dirmoser for our project. He works on\r\nsystematization of diagrammatic representations, which he outlines in \"Diagrammatik - Reader\".', '2021-11-25'),
(9, 9, 2, 'One of the questions that are recurrent in our discussions is: \"Kann jeder diese Erfahrung machen?\"\r\nThis question addresses the experiential dimension of the performer and how it is shaped by\r\ntraining and by practise. Rose talks about the \"body or movement archive\". Are practitioners the\r\nsum or list of their archived experiences? Is a discipline the intersection or lowest common\r\ndenominator of all its practitioners? ', '2021-11-25'),
(10, 9, 3, 'We discussed the use of sender, recipient and noise channel in communicating experiences. ', '2021-11-25'),
(11, 9, 4, 'In physical experiments it is usually (or arguably never) possible to access the quality or quantity of\r\ninterest. E.g. the expansion rate of the universe is inferred by the red shift of the spectrum of various\r\nlight sources. The experience of a performer cannot be interrogated by a question, but indirectly\r\nthrough her or his interaction with the surrounding. An important example of this would be to\r\nunderstand the shape of a body not by measuring its characteristics, but by letting ants crawl over it\r\nand by recording the behaviour of the ants (which is indirectly a consequence of the curvature of the\r\nbody).', '2021-11-25'),
(12, 9, 5, 'We discussed the idea of concatenations of yes-no-questions to reveal something about an\r\nexperiential state. How far can one get by this procedure? Would a complex experience have more\r\nor less of such questions. Rose and I have been brain storming about various options here.', '2021-11-25'),
(13, 9, 6, 'The question was raised whether the space (\"Raum\") can be null. Historically the space in the\r\ndances was usually considered null. ', '2021-11-25'),
(14, 9, 7, 'What would be a great outcome of the project. If other practitioners can take this atlas, and use it for\r\ntheir own purposes. When we can manage to illustrate the method of capturing smoothness by a\r\nsequence of snapshots via a multitude of communication channels. But what do we mean by\r\nsmoothness, what kind of snapshots do we want? ', '2021-11-25'),
(15, 9, 8, 'Another topic we discussed were decentralized communication protocols, where communication\r\nand interactions happens only on peer-to-peer basis and a larger functionality emerges. Rose was\r\nsaying that a Syrian artist has created a performance in which each actor just had local or nearestneighbour interaction rules and only when every actor follows them would a macroscopic pattern\r\nemerge whereby everyone appeared to follow one person. ', '2021-11-25'),
(16, 9, 9, 'We discussed the idea of the atlas as the collection of maps that aim to capture an amorphous thing\r\nthat cannot be described directly, such as a smooth space. Do we want to capture smooth spaces?\r\nWhich kind of smooth spaces? Those that Deleuze and Guattari were introducing? Or those that we\r\nbelieve we experience in certain performances? We discussed using a canonical reference point as a\r\ncanvas. So that each practise describes what smoothness means there? Or do we want to have\r\nvarious scores (Partituren)? There were some arguments in favour of having one such score. Manet\r\nalso painted the same church in various lights, thus maybe creating an atlas of impressions, rather\r\nthan an atlas of the church. ', '2021-11-25'),
(17, 9, 10, 'We discussed to which extend this figure of \'producing an atlas of charts\' as a method for the artistic\r\npractices would be worth pursuing as an output in written form. The same holds for the figure of\r\nnull spaces. What would be needed to pursue this writing. Maybe some examples. It would even\r\nmake sense to start drafting a text, which Leo would like to start with at some point soon', '2021-11-25'),
(18, 11, 1, 'Here we highlight some associations and ideas in relation to the section\r\nentitled the Mathematical model in the chapter on Smooth and Striated\r\nSpaces of the book A thousand plateaus by Deleuze and Guattari. Henceforth we abbreviate this pair of authors as DeGu', '2021-11-25'),
(19, 11, 2, 'In the first paragraph DeGu fantasize about the comparison of what they call\r\ndeterminations. A few things that they consider determinations are the pitch of\r\na sound, its intensity, the magnitude of a line or even the style of a horse movement. In particular any quantification is a determination for them. Maybe we\r\ncan think of it as the outcome of an inquiry with a numerable range of answers.\r\nIt seems that DeGu do not use the term quantity, as it presupposes some sort of\r\nobjectivity or mathematicality, neither do they use the word measurement as it\r\nwould assume some sort of activity. The term determination on the other hand\r\nhas a positivist touch to it, because it relies on an observation, an exclusion of\r\npossible alternatives and a sort of finality of an assessment (c.f. de-termination).\r\nBeyond the positivist extension of the term it also lays emphasis on the observer\r\nand the event of the observation. To me it appears that DeGu choose this term\r\nto allow for a generality of their elaborations', '2021-11-25'),
(20, 11, 3, 'The reader becomes sensitised to the idea that not all determinations are\r\ncomparable, that the magnitude of a vertical line between two points and a\r\nhorizontal line between two other points may be comparable, but that this\r\ncomparability is not for granted. I guess that here one may think of a pen\r\nheld upright and a pen lying flat on the table. It is a priori not obvious that\r\nthe magnitude (or length in this case) of the upright pen is comparable to\r\nthe lying pen. This is the point that DeGu seem to be attempting to make,\r\nnamely that there are various types of comparabilities out there. Comparing\r\ntwo ”determinations” such as pitch and intensity of sound has a very different\r\ncharacter than comparing two ”determinations” such has height and width. Is\r\nit this comparability that DeGu denote as multiplicity? This is one of\r\nthe key questsions for me in this paragraph.', '2021-11-25'),
(21, 11, 4, 'DeGu put the notion of multiplicity at the beginning of their fantasizing.\r\nThey construct this term as having come into being with Bernhard Riemann.\r\nIndeed this is worth a little excursion, which we will dive into in the following\r\nsection. DeGu envisage a relation between the terms multiplicity and determination. From the quote that ”each multiplicity [is] defined by n determinations” we gather that the relationship is a defining one, but we don’t learn how it defines. Perhaps the most presumptious and maybe arrogant revelation of their\r\nrelation can be found in the following quote which refers to the case of comparing the magnitutes of a vertical and horizontal line: ”...it is clear that the\r\nmultiplicity in this case is metric, that it allows itself to be striated, and that\r\nits determinations are magnitudes.”. They distinguish at least two types of\r\nmultiplicities, namely metric ones and the multiplicities of the second kind, the\r\nformer of which allow for a comparison, the latter evade any such attempts.\r\nDeGu use this term ”multiplicity” to highlight the differences between distance\r\nand magnitude. They write: ”[...] multiplicities of distance are inseparable from\r\na process of continuous variation, whereas multiplicities of magnitude distribute\r\nconstants and variables”. I do not have any suggestion as to what they are\r\ntrying to express here. My feeling, however, is that they want to draw a distinction between multiplicities that refer to an accumulation, namely distances,\r\nand multiplicities that cannot be put together or added atop of one another,\r\nnamely magnitudes. But would that interpretation of DeGu’s concept of magnitude have any relation to any common usage of the word ”magnitude”? I\r\nbelieve that the distinction here is quite important for our project,\r\nnamely the distinction between things that can only accumulate such\r\nas apples or distances and those that can only intensify such as temperature or sound.', '2021-11-25'),
(22, 11, 5, 'Berhard Riemmann was a mathematician who is credited with quite a few contributions to mathematics. He was active in the 19th century. The contribution\r\nthat DeGu refer to in this text is that of a metrization of curved spaces. The\r\ncorresponding mathematical object nowadays goes by the name ”Riemannian\r\nmetric”. The Riemannian metric determines a relation between distances in\r\nvarious spatial directions, which is what DeGu seem to address in their example\r\nof the vertical and the horizontal lines. A priori there is no way in an abstract\r\nor even geometric space to compare the distances between points. To achieve\r\nthis Berhard Riemann introduced a metric (tensor) that is capable of disambiguously comparing the distances of two line segments that may even go in different\r\ndirections. The problem of comparing two sounds with equal pitch and different\r\nintensity to sounds with equal intensity and different pitch can then be phrased\r\nas the problem of finding a Riemannian metric on for the ”space” of these two\r\n”dimensions” (Each dimension would then correspond to the set of outcomes of\r\nan inquiry or in the words of DeGu to one set of determinations).', '2021-11-25'),
(23, 11, 6, 'In mathematics there is an important distinction with respect to natural numbers, namely that of ordinal and cardinal numbers. Ordinal numbers are a\r\ngeneralization of natural numbers. Whereas natural numbers are ”only” an infinite set of elements, ordinal numbers are that same infinite set of elements\r\ntogether with an absolute ordering relation, namely that three comes after two,\r\nwhich in turn comes after 1 etc. Cardinal numbers on the other hand are yet\r\n2\r\nanother, but different, generalization of natural numbers, but with the property\r\nthat they can indicate the size of a set of elements. It is thus a subtle conceptual\r\ndistinction, but a very important one to get the head around. The wikipedia\r\narticle on Ordinal numbers is a good introductory read on this topic.', '2021-11-25'),
(24, 11, 7, 'DeGu seem to refer to this distinction when describing the difference between\r\nthe numbering number and the numbered number: ”The number distributes itself in smooth space; it does not divide without changing nature each time,\r\nwithout changing units, each of which represents a distance and not a magnitude. The ordinal, directional, no- madic, articulated number, the numbering\r\nnumber, pertains to smooth space, just as the numbered number pertains to\r\nstriated space.”', '2021-11-25'),
(25, 11, 8, 'Finally we also spoke a little bit about this sentence: ”Minor science is continually enriching major science, communicating its intuitions to it, its way of\r\nproceeding, its itinerancy, its sense of and taste for matter, singularity, variation, intuitionist geometry and the numbering number.” We didnt speak about\r\nthe distinction of minor and major science (I wonder what DeGu mean by that),\r\nbut we reseted a for a few minutes on the term on an Intuitionist geometry. It\r\nsounds a little contradictory and to me it does not raise any associations with a\r\nmathematical concept that is called the same. Nevertheless intuition of course\r\nplays a very big role in mathematics. Apart from that there are also quite a few\r\nconcepts in mathematics that even bare the name ”intuitionist(ic)” in reference\r\nto the attribute often associated to intuition, that not bad is not necessary good.\r\nSo this idea for instance manifests itself in the field of intuitionistic logic. Read\r\nhere for an introduction.', '2021-11-25'),
(26, 20, 1, 'On Friday, the third of December, we held a meeting at the MDW Rennweg campus to discuss\r\nvarious directions of research into the smooth spaces of choir conducting. We also updated each\r\nother on the current work in progress. Due to illness, the general Corona-madness and different\r\nlocations, we held a hybrid meeting: Johannes Hiemetsberger (representative for choir conducting),\r\nHanne Pilgrim (representative for eurhythmics), Adrian Artacho (composer) and Leonhard\r\nHorstmeyer (complexity scientist) were present in person and Sarah (via zoom).', '2021-12-09'),
(27, 20, 2, 'The discussion was ignited by an overview of the various strands of the “conducting spaces”\r\nproject, given by Hanne, and then revolved around the following topics roughly in that order:\r\n1) Staging and embodiment of the voices in the choir. 2) Where does the spatial analogy come from\r\nin polyphonic music? Was it intended as a spatial figure? 3) polyphonic idea translated into space 4)\r\nMany ways to open up space in choir conducting, e.g: movement, crescendo, pitch. 5) Difference\r\nbetween togetherness and coincidence 6) The choir as a micro-society. Here’s a more detailed\r\nsummary.', '2021-12-09'),
(28, 20, 3, 'Hanne presented the evolution of the “conducting spaces” project and recounted that the initial seed\r\nof the project was Hans-Christian’s suggestion to Johannes and Hanne that the freshly started\r\nproject on smooth spaces could be a good context for a performance with the choir and a virtual\r\nglove at the Ars Technica in Linz. Then came the idea with “Lux Aeterna” by Ligeti as the choir\r\npiece. The performance was well received and pictures, sound and video material was amongst the\r\noutputs. Subsequently we discussed the project in the light of “smooth spaces” during our “Lux\r\nAeterna Lab” in mid October. We talked about time quantities and space qualities (zeitliche\r\nQuantitäten und räumliche Qualitäten) with reference to Julian Caskel. The translation of the 16-\r\nvoices choir piece into a midi format sparked the idea of the embodiment and visualization of one\r\nof the most demanding tasks for a Lux-Aeterna recital: The cue or “when do I start singing”? One\r\ncould view the following as a first proposition in the iterative process of studying the spatial content\r\nof the piece, namely: “The cues are the clues to the spatial listening experience”. Approaching this\r\nproposition, we used the midi scores and the virtual gloves to embody cues.', '2021-12-09'),
(29, 20, 4, 'Johannes then talked about the staging of a piece by Henry Purcell in a cathedral where the question\r\nof the cue was dealt with by having the singers enter when their voices start.', '2021-12-09'),
(30, 20, 5, 'We talked about polyphonic music and the difficulty to use it effectively. Put into one phrase: One\r\nstarts from the first voice, adds another and thereafter it just becomes loud. This again rings bells of\r\nthe number three being special for interactions. We mentioned the translation of a score image\r\n(Notenbild) into movement.', '2021-12-09'),
(31, 20, 6, 'Johannes reflects on the theme of visualizing polyphonic music by touching on a theme that seems\r\nimportant to him, namely the communication and frictions of the choir voices. Is there equality in a\r\nchoir piece, say in a fuge? In homophonic music is there also agreement amongst the voices? Does\r\na vertical “accord” yield an “accord” (agreement) between the singers, too? Keyword: Hierarchies,\r\nfriction, counterpoint.', '2021-12-09'),
(32, 20, 7, 'Johannes talks about a Salzburgian choir conductor called Rupert Huber, who accompanies the\r\n“Rundfunkchöre” (radio choirs) in Germany. According to Johannes Huber coined or propagated\r\nthe term “Wirkungssingen” in response to the dilution of the effect in singing. The content and\r\neffect of a word was enhanced by singing, whereas oftentimes now the word itself is not\r\nreconcilable anymore and thus lost its meaning.', '2021-12-09'),
(33, 20, 8, 'Was there ever any intention of spatiality in the concept of polyphonic music? People often speak of\r\na vertical spatial experience with homophonic music “building on top of each other” and a\r\nhorizontal spatial experience with polyphonic music. But why is that? Where does that come from?\r\nIs it culturally entrenched? Maybe it comes from the Gregorian heritage of lines that makes\r\npolyphonic music horizontal? Each line has a certain independence. Johannes mentioned a few\r\nexamples where the space itself has been co-composed (mitkomponiert) and includes Bruckner into\r\nthat list. He mentions the “Generalpausentakt”.', '2021-12-09'),
(34, 20, 9, 'Adrian adds thoughts about the conductor-centricity. The choir is directed at the conductor. But the\r\nmovement is not. Why not compose a piece where the polyphonic aspect is spatially implemented.\r\nA piece where no space is privileged over any other?', '2021-12-09'),
(35, 20, 10, 'Johannes talks about vertical music (i.e. homophonic music) requiring a point in time, always. In\r\nLigetis micropolyphonic music there is very little vertical rooting, where things come together in a\r\nsingle point in time. What if the music were completely liberated of the vertical rooting? Hanne\r\npoints out that the onset of the tenors is such a point in time where things come together and align\r\nvertically. Johannes agrees that there is this point, where it rips open (aufreißen).', '2021-12-09'),
(36, 20, 11, 'Hanne also raises the point that oftentimes people would think that a rise in pitch would trigger a\r\nrising movement, too. However, Hanne also observes her students collapsing on a rising pitch. So\r\nthe original translation does not include the effect (german: “Wirken”).', '2021-12-09'),
(37, 20, 12, 'Johannes mentions that there are a lot of ways to open things up. One may use an opening gesture to\r\nsignal larger movement, or one may indicate a crescendo or a higher pitch. Hanne mentions Arnie\r\nCox with the title “Music and Embodied Cognition – Listening, Feeling and Thinkin”. Hanne\r\nexplains the performance at the workshop, given by Adrian and Hanne, where participants were\r\nembodying the Lux Aeterna scores with Laban efforts.', '2021-12-09'),
(38, 20, 13, 'Adrian has the idea to include a flow chart with senders and receivers indicating who has produced\r\nwhat and for whom it was interesting. Adrian suggests the polyphonic structure of spaciness.\r\n(“Räumlichkeit”). In this context he then explains the “share, care, dare” performance: During a\r\nzoom meeting all participants were given the freedom to produce any sort of spoken output with the\r\nonly constraint being that at a pre-defined moment participants would use one of the words “share”,\r\n“care” or “dare” (the theme of the workshop). These moments were the only ones notated and\r\ncomposed beforehand. From the documenter’s understanding they were composed in such as way\r\nas to overlap in time for most or all participants. The result was a quasi-polyphonic structure for\r\nmost of the time except at certain times there was some form of “accord” or agreement. Adrian\r\nmentions the ssimilarity but also distinction with respect to “sound painting”. Following this idea\r\nAdrian suggests that the choir is in movement but without a centristic position. Johannes asks what\r\nthe idea had been behind the simultaneous cues of the “share”,”care” and “dare” words. Hanne and\r\nAdrian mentioned the consensus on one theme as far as the documenters writings can tell. This led\r\nJohannes to make a remark about the tantalizing distinction between consensus, coincidence and\r\ncoercion (translated freely by the documenter). Do the performers agree because they want to, they\r\nfeel like it, they are overwhelmed to do so or maybe because they are urged by following a dictated\r\ncue?', '2021-12-09'),
(39, 20, 14, 'Hanne asks what the gain would be for us? She also notes that in saying so she intentionally plays\r\nthe advocatus diaboli. Should the choir be decentralized? Johannes: Decentralized Self-organisation\r\nopens spaces. Why do we consider a block in the choir as one. Somehow in the choir one is accustomed to a homogeneous block, one seeks it. The surplus value can either originate in co-\r\nmmonality (deutsch: “Gemeinsamkeit”) or co-ercion (deutsch: “Zwang”). Johannes mentions the\r\npiece ASLSP (“As slow as possible”) by John Cage in which years pass by until the next chord is\r\nplayed. This nourishes the anticipatory joy of an impending get-together. But is this meeting point a\r\nduty, is it wanted, is it desired, is it a ritual? Adrian remarks that it may be a suggestion for a get-\r\ntogether rather than a coercion. Johannes recounts another recital in the body of a cathedral in\r\nwhich each segment/room had a different form of agreement. The first was infused with fragmented\r\nsounds, the second one exhibited an interplay of tempi. The third one was not captured by the\r\ndocumenter. It had a great effect and participants of the performance could make a lot of choices\r\nwith regard to how and when they would enter into the respective spaces.', '2021-12-09'),
(40, 20, 15, 'Hanne rebases the discussion. Our focus thus far has been to study spatial aspects of choir\r\nconducting and possible experiments. However, also due to Rose’s input we could refocus on our\r\nnullspaces and use that focus as the entrypoint to our research. The concept of nullspaces are an\r\nimportant part of the proposed research and according to its agenda the first part. Finding nullspaces\r\nof the respective disciplines would correspond to the quest for a zero-point, an intersection set of\r\npossible practices in that discipline. Hanne remarks that we have slid into the project sideways and\r\nthereby midway via the “conducting spaces” project. However, we should not loose focus on the\r\nnullspaces and in fact this project has the great benefit of allowing us the sink more properly into\r\nthe entrypoint, namely that of the nullspaces.', '2021-12-09'),
(41, 20, 16, 'For instance, one may argue that the nullspace of physics is the harmonic oscillator. It is not the\r\nnullspace of practicing physics and due to the breadth of research in physics the intersection set of\r\npractices might be quite little. Nevertheless the harmonic oscillator is very basal to most of physics.\r\nIn its purest form the harmonic oscillator represents the phenomenon that occurs when any\r\ndeviation from the status quo yields a force opposing that deviation proportional to the elongation.\r\nThe resulting dynamics shows an oscillating behaviour, where deviations are always penalized by\r\nopposing forces but equilibrium is ideally never reached. The pendulum is a real world example that\r\nis fairly close to a harmonic oscillator. Most things in physics do behave in a similar manner, from\r\nlight to water and sound waves to particles themselves. It also lends itself to a very clean analytical\r\ndescription and indeed entire mathematical frameworks have been build to conform to this\r\ncanonical phenomenon. Much of what is called modern physics stems from coupling together these\r\nharmonic oscillators. Already the simplest of such couplings, namely the double pendulum, gives\r\nrise to a vast phenomenology with chaotic regimes and arguably aesthetically pleasing trajectories.', '2021-12-09'),
(42, 20, 17, 'We then went on to discuss some modalities of the next choir lab. Sarah was interested in joining\r\nthe project and we had some talks about what would work best for her. Some people prefer a\r\ncontract others a payment slip. Regarding the lab Johannes was saying that he would wish from the\r\nteam some questions directed at the discipline of choir.conducting. What does the team wish from\r\nthe lab. We reiterated some of the points mentioned earlier.', '2021-12-09'),
(43, 20, 18, 'Hanne mentioned that the choir as a voice of the people, i.e. the peoples’ voice, was very appealing.\r\nThis again triggered some discussion of the parallels between the choir and a micro-society.\r\nJohannes remarks that the life of an Alt-singer is so difficult. She lives inside a quint and always\r\nneed to demarcate herself from the adjacent singers, whereas the sopran has all that freedom to\r\nspread along multiple octaves. Johannes also mentions Dieter Schnebel in this context. The\r\ndocumenter has noted the name “Kontrapunktus 1” for the mentioned piece, which he was not able\r\nto find. Instead he found the piece “Zwischenstück Nr. 1”. Johannes says that Dieter Schnebel takes\r\nexcerpts from the well-tempered Clavier (deutsch: “Wohltemperiertes Klavier”) and distributes the individual lines to multiple performers. The name “The best of all worlds” comes up. Leo mentions\r\nVoltair’s Candide.', '2021-12-09'),
(44, 20, 19, 'During our discussions the idea of a composition of polyphonic spatialness for the choir came up\r\naround Adrians inputs. He also said that it would be a nice challenge to make such a composition.\r\nOne that he’d be keen to take on. Talking about composition and interpretation we also discussed\r\nfeedback culture and especially Adrian’s draft on the cycle of creation and feedback in composing.\r\nWe also remarked the discrepancy between the feedback given to the interpret and that given to the\r\ncomposer. Hanne recommended the book “Der leere Raum” by Peter Brook.', '2021-12-09'),
(45, 20, 20, 'We concluded this part of the meeting with a search for a good date to have the choir lab. The\r\nconstraining factors were the Corona-measures and availability questions. A preliminary date was\r\nsuggested for the first of February form 9am till 4pm.', '2021-12-09'),
(46, 32, 1, 'Our discussion revolved around the definition of the null spaces in the various disciplines. Also Sara Ganzer joined for the first time via zoom and discussed with us certain directions of the choir project.', '2022-01-20'),
(47, 34, 1, 'The workshop in Linz was very insightful. We have discussed postcolonialism in dance and theatre. We discussed the desire machine briefly and Constantinos dance pieces.', '2022-01-20'),
(48, 33, 1, 'Professor Dirmoser welcomed Hanne and Leo at his office inside the library of the art university of Linz. We discussed diagrammatic aspects of densities and their relation to motion and verbs. Gerhard Dirmoser also showed us his extensive library on diagrammatics.', '2022-01-20'),
(49, 35, 1, 'The work of Adrian in the exhbition at the Schauspielhaus Wien was the starting point for discussions on universal basic income, the \"Freie Szene\" for dance and performing arts, competition, juries, crypto-spaces, Foucault and also a little bit on the \"desire machine\". We also talked about the project as a whole.', '2022-01-20'),
(50, 41, 1, 'We were talking about various problems in the every-day work of performing artists who are not directly aware or savy of tech. Adrian poses three problems: the capture problem, the feature problem and the complexity problem. In a draft for a research proposal he argues for a method to integrate them into the routine of a working artist. We discussed this draft. ', '2022-01-20'),
(51, 41, 2, 'We also discussed the potential of topological methods in capture and feature analysis for performing arts and for gestures. This immediately feeds back into the work on gestures that we have started.', '2022-01-20');

-- --------------------------------------------------------

--
-- Table structure for table `participation`
--

CREATE TABLE `participation` (
  `participationId` int NOT NULL,
  `nameId` int NOT NULL,
  `gatheringId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `participation`
--

INSERT INTO `participation` (`participationId`, `nameId`, `gatheringId`) VALUES
(1, 2, 1),
(2, 9, 1),
(3, 3, 1),
(4, 11, 1),
(5, 5, 1),
(6, 8, 1),
(7, 6, 1),
(8, 7, 1),
(9, 1, 1),
(10, 4, 1),
(11, 2, 2),
(12, 9, 2),
(13, 10, 2),
(14, 11, 2),
(15, 5, 2),
(16, 6, 2),
(17, 8, 2),
(18, 7, 2),
(19, 1, 2),
(20, 4, 2),
(21, 9, 3),
(22, 8, 3),
(23, 7, 3),
(24, 1, 3),
(25, 4, 3),
(26, 5, 5),
(27, 1, 5),
(28, 9, 9),
(29, 5, 9),
(30, 2, 6),
(31, 11, 6),
(32, 5, 6),
(33, 13, 8),
(34, 5, 8),
(35, 3, 7),
(36, 5, 7),
(37, 2, 7),
(38, 12, 7),
(39, 5, 11),
(40, 8, 11),
(41, 2, 10),
(42, 9, 10),
(43, 5, 10),
(44, 8, 12),
(45, 8, 12),
(46, 5, 16),
(47, 2, 16),
(48, 5, 17),
(49, 9, 17),
(50, 2, 17),
(51, 12, 17),
(52, 12, 18),
(53, 3, 18),
(54, 2, 18),
(55, 5, 18),
(56, 14, 18),
(57, 15, 19),
(58, 2, 19),
(59, 5, 19),
(60, 6, 19),
(61, 10, 19),
(62, 2, 21),
(63, 5, 21),
(64, 6, 21),
(65, 14, 21),
(66, 9, 21),
(67, 10, 21),
(68, 2, 22),
(69, 8, 22),
(70, 5, 22),
(71, 9, 22),
(72, 1, 22),
(73, 2, 23),
(74, 16, 23),
(75, 5, 23),
(76, 8, 24),
(77, 5, 24),
(78, 5, 25),
(79, 12, 25),
(80, 9, 26),
(81, 5, 26),
(82, 12, 26),
(83, 8, 26),
(84, 2, 27),
(85, 5, 27),
(86, 6, 28),
(87, 5, 28),
(88, 2, 28);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `postId` int NOT NULL,
  `posttypeId` int NOT NULL,
  `date` date NOT NULL,
  `title` text NOT NULL,
  `subtitle` text NOT NULL,
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'Leonhard Horstmeyer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`postId`, `posttypeId`, `date`, `title`, `subtitle`, `author`) VALUES
(1, 2, '2021-11-16', 'Workshop — A Syntax for Smooth Spaces', '', 'Leonhard Horstmeyer'),
(2, 2, '2021-11-16', 'Ignition Lab — Kick-off Workshop', '', 'Leonhard Horstmeyer'),
(3, 2, '2021-11-16', 'Choreographia[Inter]Austriaca und Altenberg Trio — Performance', '', 'Leonhard Horstmeyer'),
(4, 2, '2021-11-18', 'Conducting Spaces  — Ars Electronica', '', 'Leonhard Horstmeyer'),
(5, 5, '2021-11-25', 'Damian\'s Lecture on Movement Notation', 'A meeting between Damian and Leo', 'Leonhard Horstmeyer'),
(6, 5, '2021-11-25', 'Urheberrecht Diskussion', '', 'Leonhard Horstmeyer'),
(7, 5, '2021-11-25', 'Glover Testing with Adrian, Hanne, Johannes and Leo', '', 'Leonhard Horstmeyer'),
(8, 5, '2021-11-25', 'Discussion with UK-based Artist Geraldine Cox', '', 'Leonhard Horstmeyer'),
(9, 5, '2021-11-25', 'Reflections on the Discussion between Leo and Rose at the abpu', '', 'Leonhard Horstmeyer'),
(10, 5, '2021-11-25', 'Meeting with Rose, Hanne and Leo at the Cafe Prückel', '', 'Leonhard Horstmeyer'),
(11, 5, '2021-11-25', 'Deleuze Reading Group -- Digression on the Mathematical Model', '', 'Leonhard Horstmeyer'),
(12, 5, '2021-11-25', 'Lux Aeterna Lab', 'Was ist ewig, was bleibt immmer?', 'Leonhard Horstmeyer'),
(13, 5, '2021-11-25', 'Meeting on Movement in the Large Movement Room with Maria and Leo', '', 'Leonhard Horstmeyer'),
(14, 5, '2021-11-25', 'Developing Ideas -- Maria and Leo', '', 'Leonhard Horstmeyer'),
(15, 5, '2021-11-25', 'Discussion with Geraldine Cox about movement, dance and foundational concepts of physics', '', 'Leonhard Horstmeyer'),
(16, 5, '2021-11-25', 'Meeting with Anna Leon (TQW) to discuss the PEEK project', '', 'Leonhard Horstmeyer'),
(17, 5, '2021-11-25', 'Lux Aeterna Experimental Lab', 'Hand Gesture Experiments', 'Leonhard Horstmeyer'),
(18, 7, '2021-09-01', '', '', 'Leonhard Horstmeyer'),
(19, 5, '2021-12-04', 'Discussion on the modalities of the reading group', '', 'Leonhard Horstmeyer'),
(20, 5, '2021-12-04', 'Choir Lab Initial Meeting', '', 'Leonhard Horstmeyer'),
(21, 1, '2021-12-09', 'Hanne Pilgrim', 'Professor for Music and Movement Education/ Rhythmics & Head of the MDW’s Department of Music and Movement Education/Rhythmics', 'Leonhard Horstmeyer'),
(22, 1, '2021-12-09', 'Rose Breuss', 'Professor for movement research & Head of the Institute of Dance Arts at Anton Bruckner Private University Upper Austria', 'Leonhard Horstmeyer'),
(23, 1, '2021-12-09', 'Johannes Hiemetsberger', 'Professor for Choral Conducting & head of the MDW’s Department of Choral and Ensemble Directing and Music Theory in Music Education', 'Leonhard Horstmeyer'),
(24, 1, '2021-12-09', 'Leonhard Horstmeyer', 'Complexity Scientist and Mathematician & Associate Faculty at the Complexity Science Hub Vienna', 'Leonhard Horstmeyer'),
(25, 1, '2021-12-09', 'William Edouard Franck', 'Cinematic direct sound producer & Senior Lecturer for Sound at the Film Academy Vienna', 'Leonhard Horstmeyer'),
(26, 1, '2021-12-09', 'Stephanie Schroedter', 'Professor for Theories of Music and Movement/Rhythmics at the Institute for Music and Movement Education/ Rhythmics (MDW)', 'Leonhard Horstmeyer'),
(27, 1, '2021-12-09', 'Magdalena Eidenhammer', 'Voice Artist (Stimmbildnerin) and Pedagogue', 'Leonhard Horstmeyer'),
(28, 1, '2021-12-09', 'Maria Shurkhal', 'Freelance dancer, choreographer and pedagogue', 'Leonhard Horstmeyer'),
(29, 1, '2021-12-09', 'Damian Cortes Alberti', 'Choreographer, dancer, researcher transmediality and dance notation.', 'Leonhard Horstmeyer'),
(30, 1, '2021-12-13', 'Adrian Artacho Bueno', 'Composer', 'Leonhard Horstmeyer'),
(31, 1, '2022-01-20', 'Sara Ganzer', 'Singer', 'Leonhard Horstmeyer'),
(32, 5, '2022-01-21', 'Smooth Space End of Year Meeting', 'Quo Vadis', 'Leonhard Horstmeyer'),
(33, 5, '2021-12-22', 'Meeting with Professor Dirmoser', 'An excursion to the diagrammatic library', 'Leonhard Horstmeyer'),
(34, 5, '2021-12-22', 'Workshop about ongoing projects in Rose\'s group', '', 'Leonhard Horstmeyer'),
(35, 5, '2022-01-13', 'Beginning of the Year Discussion between Maria and Leo', 'Meeting, Discussion and Exhibition', 'Leonhard Horstmeyer'),
(36, 2, '2021-12-07', 'Lecture by Jan Schacher', '', 'Leonhard Horstmeyer'),
(37, 5, '2021-12-07', 'Discussions with Jan Schacher before and after his talk', '', 'Leonhard Horstmeyer'),
(38, 5, '2022-01-14', 'Discussing Adrian\'s Research Proposal', 'An excursion during the weekly reading group', 'Leonhard Horstmeyer'),
(39, 5, '2022-01-18', 'Weekly MDW Meeting', 'Doctoral Artistic Research Projects', 'Leonhard Horstmeyer'),
(40, 5, '2022-01-11', 'Weekly Smooth Space Meeting - Hanne, Magdalena and Leo', 'Discussion on Stephanie\'s Text and lectures on Nothing by John Cage', 'Leonhard Horstmeyer'),
(41, 5, '2022-01-11', 'Meeting and Discussion with Adrian in his Studio', '', 'Leonhard Horstmeyer');

-- --------------------------------------------------------

--
-- Table structure for table `postType`
--

CREATE TABLE `postType` (
  `posttypeId` int NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `postType`
--

INSERT INTO `postType` (`posttypeId`, `description`) VALUES
(1, 'profile'),
(2, 'event'),
(3, 'notation'),
(4, 'publication'),
(5, 'meeting'),
(6, 'reflection'),
(7, 'empty');

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `profileId` int NOT NULL,
  `description` varchar(1000) NOT NULL,
  `nameId` int NOT NULL,
  `postId` int NOT NULL,
  `website` varchar(1000) DEFAULT NULL,
  `date` datetime NOT NULL,
  `website_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'website'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`profileId`, `description`, `nameId`, `postId`, `website`, `date`, `website_text`) VALUES
(1, 'Profile of Hanne Pilgrim', 2, 21, 'https://hannepilgrim.de/', '2021-12-13 12:05:02', 'hannepilgrim.de'),
(2, 'Profile of Rose Breuss', 9, 22, 'http://www.rosebreuss.com/', '2021-12-13 12:05:02', 'www.rosebreuss.com'),
(3, 'Profile of Johannes Hiemetsberger', 3, 23, 'https://www.mdw.ac.at/abi/lehrende/chor--dirigieren--ensemble/johannes-hiemetsberger/', '2021-12-13 12:11:36', 'website of Johannes Hiemetsberger'),
(4, 'Profile of Leonhard Horstmeyer', 5, 24, 'https://www.csh.ac.at/researcher/leonhard-horstmeyer/', '2021-12-13 12:11:36', 'website of Leonhard Horstmeyer'),
(5, 'Profile of William Edouard Franck', 11, 25, 'https://online.mdw.ac.at/mdw_online/visitenkarte.show_vcard?pPersonenId=7E0DCBC93B623725&pPersonenGruppe=3', '2021-12-13 12:11:36', 'website of Wiliam Edouard Franck'),
(6, 'Profile of Stephanie Schroedter', 10, 26, 'https://www.mdw.ac.at/mrm/mbe/?PageId=3586', '2021-12-13 12:11:36', 'website of Stephanie Schroedter'),
(7, 'Profile of Magdalena Eidenhammer', 6, 27, 'https://mdw.ac.at/internationalblog/author/magdalena-eidenhammer/', '2021-12-13 12:11:36', 'website of Magdalena Eidenhammer'),
(8, 'Profile of Maria Shurkhal', 8, 28, 'https://www.mshurkhal.com/', '2021-12-13 12:11:36', 'mshurkhal.com'),
(9, 'Profile of Damian Cortes Alberti', 1, 29, 'https://redsapata.com/portfolio_page/damian-federico-cortes-alberti/', '2021-12-13 12:11:36', 'redsapata profile of Damian Cortes Alberti'),
(10, 'Profile of Adrian Artacho Bueno', 12, 30, 'https://www.youtube.com/c/AdrianArtachoBueno', '2021-12-13 12:45:24', 'youtube site of Adrian Artacho Bueno'),
(11, 'Profile of Sara Ganzer', 14, 31, NULL, '2022-01-20 12:09:18', 'website');

-- --------------------------------------------------------

--
-- Table structure for table `projectRoles`
--

CREATE TABLE `projectRoles` (
  `roleId` int NOT NULL,
  `role` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `roleTypeId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `projectRoles`
--

INSERT INTO `projectRoles` (`roleId`, `role`, `description`, `roleTypeId`) VALUES
(1, 'Experimentalist', 'Preparing, conducting, participating in experiments', 1),
(2, 'Documenter', 'Documenting processes, outputs, discussion, insights during the labs and in between.', 1),
(3, 'Representative for Eurhythmics', 'representing the discipline of Eurythmics. Organizing the labs which have a focus on Eurythmics. Communicating with the people from their discipline.', 2),
(4, 'Representative for Dance', 'representing the discipline of Dance. Organizing the labs which have a focus on Dance. Communicating with the people from their discipline.', 2),
(5, 'Representative for Choir Conducting', 'representing the discipline of Choir Conducting. Organizing the labs which have a focus on Choir Conducting. Communicating with the people from their discipline.', 2),
(6, 'Representative for Direct Cinematic Sound', 'representing the discipline of Direct Cinematic Sound. Organizing the labs which have a focus on Direct Cinematic Sound. Communicating with the people from their discipline.', 2),
(7, 'Complexity Scientist', 'representing the discipline of Complexity Science. Providing input from a complexity science stand point. Communicating with the people from their discipline.', 2),
(8, 'Performer', 'Preparation and participation in performances', 1),
(9, 'Theoretician', 'Literature Review, Analysis, Written digest', 1),
(10, 'Dance Researcher', 'Assisting in the organization of the Smooth Spaces Labs, the preparations of scores, research materials, participating in the research with her specific dance knowledge and working on dissemination of the research in associated projects.', 2),
(11, 'Eurhythmics Researcher', 'Assisting in the organization of the Smooth Spaces Labs, the preparations of scores, research materials, participating in the research with her specific music and movement knowledge and working on dissemination of the research in associated projects.', 2),
(12, 'Principal Investigator (PI)', 'Responsible for the overall research project', 2),
(13, 'Artistic Investigator (AI)', 'Responsible for a particular discipline within the research project.', 2),
(14, 'Theoretical Investigator', 'Researching theoretical foundation and material.', 2);

-- --------------------------------------------------------

--
-- Table structure for table `roleAssignment`
--

CREATE TABLE `roleAssignment` (
  `assignmentId` int NOT NULL,
  `nameId` int NOT NULL,
  `roleId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `roleAssignment`
--

INSERT INTO `roleAssignment` (`assignmentId`, `nameId`, `roleId`) VALUES
(1, 2, 3),
(2, 2, 1),
(3, 2, 2),
(4, 2, 1),
(5, 3, 5),
(6, 1, 1),
(7, 1, 2),
(8, 1, 8),
(9, 4, 8),
(10, 4, 2),
(11, 4, 1),
(12, 5, 2),
(13, 5, 7),
(14, 5, 8),
(15, 5, 1),
(16, 6, 2),
(17, 6, 8),
(18, 6, 1),
(19, 6, 3),
(20, 7, 2),
(21, 7, 8),
(22, 7, 1),
(23, 8, 2),
(24, 8, 1),
(25, 8, 8),
(26, 9, 4),
(27, 9, 2),
(28, 9, 8),
(29, 9, 1),
(30, 10, 2),
(31, 10, 1),
(32, 5, 9),
(33, 10, 9),
(34, 9, 9),
(35, 11, 1),
(36, 11, 2),
(37, 11, 6),
(38, 11, 8),
(39, 12, 1),
(40, 12, 2),
(41, 12, 9),
(42, 12, 8),
(43, 8, 4),
(44, 14, 2),
(45, 14, 5),
(46, 14, 8),
(47, 14, 1),
(48, 2, 12),
(49, 2, 13),
(50, 3, 13),
(51, 9, 13),
(52, 11, 13),
(53, 10, 14);

-- --------------------------------------------------------

--
-- Table structure for table `roleTypes`
--

CREATE TABLE `roleTypes` (
  `roleTypeId` int NOT NULL,
  `roleType` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `roleTypes`
--

INSERT INTO `roleTypes` (`roleTypeId`, `roleType`) VALUES
(1, 'Fluid Role'),
(2, 'Project Role');

-- --------------------------------------------------------

--
-- Table structure for table `teilnehmer`
--

CREATE TABLE `teilnehmer` (
  `id` int NOT NULL,
  `type` int NOT NULL,
  `Name` char(255) CHARACTER SET utf32 COLLATE utf32_bin NOT NULL,
  `Email` char(255) CHARACTER SET utf32 COLLATE utf32_bin DEFAULT NULL,
  `Telephone` char(255) CHARACTER SET utf32 COLLATE utf32_bin DEFAULT NULL,
  `Affiliation` varchar(1000) CHARACTER SET utf32 COLLATE utf32_bin DEFAULT NULL,
  `Since` datetime DEFAULT NULL,
  `Until` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teilnehmer`
--

INSERT INTO `teilnehmer` (`id`, `type`, `Name`, `Email`, `Telephone`, `Affiliation`, `Since`, `Until`) VALUES
(1, 1, 'Damian Cortes Alberti', 'damiancortesalberti@gmail.com', '+436645473009', 'ABPU', '2021-09-01 00:00:00', NULL),
(2, 1, 'Hanne Pilgrim', 'pilgrim@mdw.ac.at', '+4368181586398', 'MDW', '2021-09-01 00:00:00', NULL),
(3, 1, 'Johannes Hiemetsberger', 'hiemetsberger@mdw.ac.at', NULL, 'MDW', '2021-09-01 00:00:00', NULL),
(4, 1, 'Kai Chun Chuang', 'kevin10506@gmail.com', '+4915752687727', NULL, '2021-09-01 00:00:00', NULL),
(5, 1, 'Leonhard Horstmeyer', 'horstmeyer@mdw.ac.at', '+4367762506968', 'MDW, CSH', '2021-09-01 00:00:00', NULL),
(6, 1, 'Magdalena Eidenhammer', 'eidenhammer@mdw.ac.at', '+436603670298', 'MDW', '2021-09-01 00:00:00', NULL),
(7, 1, 'Marcela Lopez', 'yo_marcel@yahoo.com', '+4367762384943', NULL, '2021-09-01 00:00:00', NULL),
(8, 1, 'Maria Shurkhal', 'shurkhal@gmail.com', '+436641763677', NULL, '2021-09-01 00:00:00', NULL),
(9, 1, 'Rose Breuss', 'rose.breuss@bruckneruni.at', '+4369913744346', 'ABPU', '2021-09-01 00:00:00', NULL),
(10, 1, 'Stephanie Schroedter', 'schroedter@mdw.ac.at', '+43613827727', 'MDW', '2021-09-01 00:00:00', NULL),
(11, 1, 'William Edouard Franck', 'williamedouardfranck@yahoo.com', '+4369919208997', 'MDW', '2021-09-01 00:00:00', NULL),
(12, 1, 'Adrian Artacho-Bueno', 'adrian.artacho@gmail.com', '+4369917084525', 'MDW', '2021-09-01 09:36:37', NULL),
(13, 3, 'Geraldine Cox', NULL, NULL, NULL, NULL, NULL),
(14, 1, 'Sara Ganzer', 'ganzer.sara@gmail.com', NULL, NULL, '2021-12-01 23:29:40', NULL),
(15, 4, 'Jan Schacher', NULL, NULL, 'Helsinki', NULL, NULL),
(16, 4, 'Gerhard Dirmoser', 'gerhard.dirmoser@gmail.com', '+436766039078', 'Kunstuniverstität Linz', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userTypes`
--

CREATE TABLE `userTypes` (
  `typeId` int NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `userTypes`
--

INSERT INTO `userTypes` (`typeId`, `description`) VALUES
(1, 'project participant'),
(2, 'project associated'),
(3, 'artist'),
(4, 'academic'),
(5, 'other'),
(6, 'website user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`eventId`),
  ADD KEY `statusId` (`statusId`),
  ADD KEY `postId` (`postId`),
  ADD KEY `gatheringId` (`gatheringId`);

--
-- Indexes for table `eventStatus`
--
ALTER TABLE `eventStatus`
  ADD PRIMARY KEY (`statusId`);

--
-- Indexes for table `eventType`
--
ALTER TABLE `eventType`
  ADD PRIMARY KEY (`eventTypeId`);

--
-- Indexes for table `gatherings`
--
ALTER TABLE `gatherings`
  ADD PRIMARY KEY (`gatheringId`),
  ADD KEY `eventTypeId` (`eventTypeId`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`mediaId`),
  ADD KEY `mediatypeId` (`mediatypeId`);

--
-- Indexes for table `mediaInPosts`
--
ALTER TABLE `mediaInPosts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mediaId` (`mediaId`),
  ADD KEY `postId` (`postId`);

--
-- Indexes for table `mediaType`
--
ALTER TABLE `mediaType`
  ADD PRIMARY KEY (`mediatypeId`);

--
-- Indexes for table `meetings`
--
ALTER TABLE `meetings`
  ADD PRIMARY KEY (`meetingId`),
  ADD KEY `postId` (`postId`),
  ADD KEY `gatheringId` (`gatheringId`),
  ADD KEY `statusTypeId` (`statusTypeId`);

--
-- Indexes for table `minutes`
--
ALTER TABLE `minutes`
  ADD PRIMARY KEY (`minutesId`),
  ADD KEY `nameId` (`nameId`),
  ADD KEY `postId` (`gatheringId`);

--
-- Indexes for table `paragraphs`
--
ALTER TABLE `paragraphs`
  ADD PRIMARY KEY (`paragraphId`),
  ADD KEY `postId` (`postId`);

--
-- Indexes for table `participation`
--
ALTER TABLE `participation`
  ADD PRIMARY KEY (`participationId`),
  ADD KEY `nameId` (`nameId`),
  ADD KEY `eventId` (`gatheringId`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`postId`),
  ADD KEY `posttypeId` (`posttypeId`);

--
-- Indexes for table `postType`
--
ALTER TABLE `postType`
  ADD PRIMARY KEY (`posttypeId`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`profileId`),
  ADD KEY `nameId` (`nameId`),
  ADD KEY `postId` (`postId`);

--
-- Indexes for table `projectRoles`
--
ALTER TABLE `projectRoles`
  ADD PRIMARY KEY (`roleId`),
  ADD KEY `roleTypeId` (`roleTypeId`);

--
-- Indexes for table `roleAssignment`
--
ALTER TABLE `roleAssignment`
  ADD PRIMARY KEY (`assignmentId`),
  ADD KEY `nameId` (`nameId`),
  ADD KEY `roleId` (`roleId`);

--
-- Indexes for table `roleTypes`
--
ALTER TABLE `roleTypes`
  ADD PRIMARY KEY (`roleTypeId`);

--
-- Indexes for table `teilnehmer`
--
ALTER TABLE `teilnehmer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `userTypes`
--
ALTER TABLE `userTypes`
  ADD PRIMARY KEY (`typeId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `minutes`
--
ALTER TABLE `minutes`
  MODIFY `minutesId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `paragraphs`
--
ALTER TABLE `paragraphs`
  MODIFY `paragraphId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `profileId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `projectRoles`
--
ALTER TABLE `projectRoles`
  MODIFY `roleId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `roleAssignment`
--
ALTER TABLE `roleAssignment`
  MODIFY `assignmentId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `roleTypes`
--
ALTER TABLE `roleTypes`
  MODIFY `roleTypeId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`statusId`) REFERENCES `eventStatus` (`statusId`),
  ADD CONSTRAINT `events_ibfk_2` FOREIGN KEY (`gatheringId`) REFERENCES `gatherings` (`gatheringId`);

--
-- Constraints for table `gatherings`
--
ALTER TABLE `gatherings`
  ADD CONSTRAINT `gatherings_ibfk_2` FOREIGN KEY (`eventTypeId`) REFERENCES `eventType` (`eventTypeId`);

--
-- Constraints for table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `media_ibfk_1` FOREIGN KEY (`mediatypeId`) REFERENCES `mediaType` (`mediatypeId`);

--
-- Constraints for table `mediaInPosts`
--
ALTER TABLE `mediaInPosts`
  ADD CONSTRAINT `mediaInPosts_ibfk_1` FOREIGN KEY (`mediaId`) REFERENCES `media` (`mediaId`),
  ADD CONSTRAINT `mediaInPosts_ibfk_2` FOREIGN KEY (`postId`) REFERENCES `posts` (`postId`);

--
-- Constraints for table `meetings`
--
ALTER TABLE `meetings`
  ADD CONSTRAINT `meetings_ibfk_1` FOREIGN KEY (`statusTypeId`) REFERENCES `eventStatus` (`statusId`),
  ADD CONSTRAINT `meetings_ibfk_2` FOREIGN KEY (`gatheringId`) REFERENCES `gatherings` (`gatheringId`),
  ADD CONSTRAINT `meetings_ibfk_3` FOREIGN KEY (`postId`) REFERENCES `posts` (`postId`);

--
-- Constraints for table `minutes`
--
ALTER TABLE `minutes`
  ADD CONSTRAINT `minutes_ibfk_1` FOREIGN KEY (`nameId`) REFERENCES `teilnehmer` (`id`),
  ADD CONSTRAINT `minutes_ibfk_2` FOREIGN KEY (`gatheringId`) REFERENCES `gatherings` (`gatheringId`);

--
-- Constraints for table `paragraphs`
--
ALTER TABLE `paragraphs`
  ADD CONSTRAINT `paragraphs_ibfk_1` FOREIGN KEY (`postId`) REFERENCES `posts` (`postId`);

--
-- Constraints for table `participation`
--
ALTER TABLE `participation`
  ADD CONSTRAINT `participation_ibfk_2` FOREIGN KEY (`nameId`) REFERENCES `teilnehmer` (`id`),
  ADD CONSTRAINT `participation_ibfk_3` FOREIGN KEY (`gatheringId`) REFERENCES `gatherings` (`gatheringId`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`posttypeId`) REFERENCES `postType` (`posttypeId`);

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`nameId`) REFERENCES `teilnehmer` (`id`),
  ADD CONSTRAINT `profile_ibfk_2` FOREIGN KEY (`postId`) REFERENCES `posts` (`postId`);

--
-- Constraints for table `projectRoles`
--
ALTER TABLE `projectRoles`
  ADD CONSTRAINT `projectRoles_ibfk_1` FOREIGN KEY (`roleTypeId`) REFERENCES `roleTypes` (`roleTypeId`);

--
-- Constraints for table `roleAssignment`
--
ALTER TABLE `roleAssignment`
  ADD CONSTRAINT `roleAssignment_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `projectRoles` (`roleId`),
  ADD CONSTRAINT `roleAssignment_ibfk_2` FOREIGN KEY (`nameId`) REFERENCES `teilnehmer` (`id`);

--
-- Constraints for table `teilnehmer`
--
ALTER TABLE `teilnehmer`
  ADD CONSTRAINT `teilnehmer_ibfk_1` FOREIGN KEY (`type`) REFERENCES `userTypes` (`typeId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
