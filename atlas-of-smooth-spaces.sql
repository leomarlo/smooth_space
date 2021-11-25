-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Generation Time: Nov 25, 2021 at 06:45 PM
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
(5, 'experiment');

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
(15, 5, 'Lux Aeterna gestural study with video recording session');

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
  `postId` int NOT NULL,
  `alt` varchar(527) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`mediaId`, `mediatypeId`, `path`, `author`, `rights`, `uploaded`, `postId`, `alt`) VALUES
(1, 1, 'img/GuentherZimmermanPerformance_ConstantinGeorgescu_Wels_111121_1.jpeg', 'Constantin Georgescu', 'Constantin Georgescu', '2021-11-16', 3, 'Photo of the Dance Ensemble Choreographia[Inter]Austriaca'),
(2, 1, 'img/GuentherZimmermanPerformance_ConstantinGeorgescu_Wels_111121_2.jpeg', 'Constantin Georgescu', 'Constantin Georgescu', '2021-11-16', 3, 'Photo of the Dance Ensemble Choreographia[Inter]Austriaca'),
(3, 1, 'img/KaiFilmedByHanneBoom_Wien_030921.jpg', 'Leonhard Horstmeyer', 'Leonhard Horstmeyer', '2021-11-18', 2, 'Kai is filmed by Hanne during the Boom experimentation Lab in Vienna on Third of September 21'),
(4, 1, 'img/HanneLuxAeterna_Linz_110921.jpg', 'Leonhard Horstmeyer', 'Leonhard Horstmeyer', '2021-11-18', 2, 'Lux Aeterna performance ... collection before the performance.');

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
(4, 4, 4);

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
(11, '2021-11-19 15:00:00', 'Adrians Studio Space', 'Lux Aeterna Experimental Video Recording Sessions for Hand gestural study', 3, 15, 17, 0);

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
(25, 11, 8, 'Finally we also spoke a little bit about this sentence: ”Minor science is continually enriching major science, communicating its intuitions to it, its way of\r\nproceeding, its itinerancy, its sense of and taste for matter, singularity, variation, intuitionist geometry and the numbering number.” We didnt speak about\r\nthe distinction of minor and major science (I wonder what DeGu mean by that),\r\nbut we reseted a for a few minutes on the term on an Intuitionist geometry. It\r\nsounds a little contradictory and to me it does not raise any associations with a\r\nmathematical concept that is called the same. Nevertheless intuition of course\r\nplays a very big role in mathematics. Apart from that there are also quite a few\r\nconcepts in mathematics that even bare the name ”intuitionist(ic)” in reference\r\nto the attribute often associated to intuition, that not bad is not necessary good.\r\nSo this idea for instance manifests itself in the field of intuitionistic logic. Read\r\nhere for an introduction.', '2021-11-25');

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
(45, 8, 12);

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
(17, 5, '2021-11-25', 'Lux Aeterna Experimental Lab', 'Hand Gesture Experiments', 'Leonhard Horstmeyer');

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
(6, 'reflection');

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
(13, 3, 'Geraldine Cox', NULL, NULL, NULL, NULL, NULL);

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
(5, 'other');

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
  ADD KEY `postId` (`postId`),
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
  ADD CONSTRAINT `media_ibfk_1` FOREIGN KEY (`mediatypeId`) REFERENCES `mediaType` (`mediatypeId`),
  ADD CONSTRAINT `media_ibfk_2` FOREIGN KEY (`postId`) REFERENCES `posts` (`postId`);

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
-- Constraints for table `teilnehmer`
--
ALTER TABLE `teilnehmer`
  ADD CONSTRAINT `teilnehmer_ibfk_1` FOREIGN KEY (`type`) REFERENCES `userTypes` (`typeId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
