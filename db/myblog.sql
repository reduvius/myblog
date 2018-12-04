-- MySQL dump 10.13  Distrib 5.5.61, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: myblog
-- ------------------------------------------------------
-- Server version	5.5.61-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `content` varchar(500) NOT NULL,
  `post_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `name` varchar(300) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `images_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (11,'2018-11-28 20:20:54','15434364548252.jpg',5),(12,'2018-11-28 20:21:10','15434364702664.jpg',5),(13,'2018-11-28 20:21:18','15434364783783.jpg',5),(14,'2018-11-28 20:21:27','15434364873129.jpg',5),(15,'2018-11-28 20:21:49','15434365096725.jpg',5),(16,'2018-11-28 20:22:36','15434365569464.jpg',5),(17,'2018-11-28 20:22:43','15434365638933.jpg',5),(18,'2018-11-28 20:22:52','15434365726297.jpg',5),(19,'2018-11-28 20:22:59','15434365794036.jpg',5);
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `title` varchar(300) NOT NULL,
  `content` text NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `title` (`title`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'2018-02-24 21:16:37','UX - Ultimate Experience Reloaded','Kissthesound Records is proud to present Ultimate Experience Reloaded, a remastered and enhanced version of the only album-length release by UX, a legendary Goa trance project formed by Kris Kylven and Pete Martin in the mid-nineties. Championed by Dragonfly Records, their pioneering style of cyberdelic night-time trance set a new standard for raw, unrestrained intensity in the golden age of the genre. This special re-release features many extras: a new intro and outro written by Kris Kylven, the only remaining member of the band; an unreleased mix of Syb Unity Nettwerkâ€™s Space Puppy, written at the UX studio at the same time as the album; the full-length version of Millennium Generation, rescued from an old DAT tape; and Children Of The Night, a more recent track featuring Jan Rechberger from the Finnish progressive metal band Amorphis on drums. This project is dedicated to all of UXâ€™s hardcore fans for their vivid support and enthusiasm over the years. Mastered by Den Kozlov at Spiral Starship, London, U.K., with new artwork by Kris Kylven.',5),(2,'2018-02-24 21:18:03','12 Moons - Solid State','Solid State is the full-length debut of 12 Moons AKA Michael Andresen, an artist who helped to define the â€œScandosoundâ€, a particularly artful and refined style of minimal and progressive psytrance that emerged around the turn of the millennium. Popularized by the legendary Spiral Trax imprint and acts like Human Blue, Vibrasphere, Atmos, S>Range, Noma, Ticon, and Son Kite, the Swedes redefined the parameters of the genre by stripping psychedelic trance down to the bare essentials. Originally released on Candyflip Records in 2004, several years after the Scandosound first rose to prominence, Solid State represents the culmination of many years of artistic development for 12 Moons. Expect to hear emotionally charged trance music with brilliant arrangements of simple sounds, lush atmospheres, pulsating beats, and drifting melodies that seem to go on forever. The end effect, on each and every highly polished song, is a deep experience of an era that is now fading into history. This re-release features new artwork by Michael Andresen. Mastered by Son Kite.',5),(3,'2018-02-24 21:18:36','Microcosm - Higher Levels','Microcosm was an old school Goa trance project formed by Norwegian musicians Fredrik Larsen and Georg Simonsen in the late 1990s. Their debut album, Higher Levels, was never meant to be released, but thanks to the efforts of a close friend, it is now possible to experience the wondrous majesty of these lost classics. Microcosmâ€™s sound embraces the original conception of â€œfull-onâ€, combining layered melodies, acid-drenched, cosmic atmospheres, and peak-time energy. Behind the music, there is also a cautionary tale of dreams, obsession, and excess, all in the pursuit of accessing the higher levels of trance for which this album is named. Engineered by Karlsen and mastered by Jay (Southwild) @ Trailer Park Studios, Toronto.',5),(4,'2018-02-24 21:19:33','OOOD - aLIVE','OOOD have been creating their own unique brand of psytrance since 1994. The first OOOD album aLIVE was released on Cabbaged Records (UK) in 1997 and was probably the first ever live album released as a debut by a psytrance act. A stunning exposition of the unique psychedelic sound of OOOD, the album was recorded live at parties across the UK including Paganâ€™s fabled New Years Eve party, Science Fiction and Otherworld at the Fridge in London. True to the authentic spirit of mid-nineties Goa trance, aLIVE is an exuberant combination of dazzling old school melodies, sizzling acid lines, and upbeat rhythms. Enjoy this blast from the pastâ€“free of charge!',5),(5,'2018-02-24 21:20:59','Cybernetika - The Scythe Of Orion','Ektoplazm is tremendously proud to present The Scythe Of Orion, the latest science fiction masterpiece by Cybernetika, a German producer revered for his eclectic genre-bending experimentation and heavy use of epic storytelling elements in electronic dance music. Cybernetikaâ€™s synthetic fusion of dark and energetic psychedelic trance with elements of industrial, drum â€˜n bass, and classic Goa trance will send your mind spinning into the far reaches of outer space as the tale unfolds. As with his other album releases, Cybernetika has composed an epigraph to set the mood:\r\n\r\nâ€œInvisible yet observing, the strangers transcended to a higher form of existence eons ago. As legend tells, the strangers once were like us, before they evolved into invisible deities no longer bound by time and space. Only a single relic of their ascension remains, holding the wisdom and the secrets of this superior civilization: The Scythe of Orion.â€',3),(6,'2018-02-24 21:21:54','Cybernetika - Nanospheric','Nanospheric is the fourth album from Cybernetika, an independent German producer from Cologne. Since 2003 he has been writing many different types of electronic music with science fiction influences: psychedelic trance, techno, industrial, and drum â€˜n bass. Hints of these other styles can be heard on Nanospheric, but it is primarily an atmospheric psytrance album with a heavy emphasis on story-telling. Cybernetika begins the tale with a virtual epigram:\r\nâ€œBoth universe and infinitesimal particle, the Nanospheric is an abstract construct beyond our imagination and comprehension. It is a machine deity that forms matter in its own will.â€\r\n\r\nThis album was written in FL Studio, mastered with Wavelab, and features cover artwork by Angie Fouquette.',3),(7,'2018-02-24 21:22:48','Dimensional Gateway 4: Veil Of The Moon','This new chapter in the Dimensional Gateway series, Veil Of The Moon, ritualizes the annular Solar Eclipse wth Goa trance over three different stages, making for the most fitting soundtrack to this event. Even though it has been more than four years since the last Dimensional Gateway compilation appeared (and in the meantime, the team behind Neogoa Records introduced other interesting ideas and concepts on releases such as The World Beyond, Svemirski Hod, and Celestial Transvibrations), this moment is perfect to return to our own roots and unleash fresh works by some new projects, but also welcome back a few of our contributors from the early days. Veil Of The Moon offers plenty of darker and acidic vibes, but yet it keeps the melodic aspect present in competent and solid Goa trance form. Mastering by Igor ÄŒeraniÄ‡ at Deimos Soundlabs with artwork design by Richpa at Neogoa Design.',3),(8,'2018-02-24 21:24:52','Negans - Danse Macabre','Negansâ€™ sobriquet is Latin for â€œdenyingâ€. His music is a blend of proto-Goa trance sonic blasts, saturated with eclectic psychedelic grooves inspired by early â€™90s Goa sound, with slices of industrial and horror-happy vibes and original storytelling. With Neogoa Records, the torrents of insanity can now be unleashed through his debut EP release, Danse Macabre, a 4-track journey into classic Goa soundscapes made for old and new Goa-heads with a lot of passion and engaging moments.\r\n\r\nAll tracks written and produced by Elie Seigneur (Negans). Mastering by Igor ÄŒeraniÄ‡ (Deimos) at Deimos Soundlabs, with artwork design by Svem & Richpa at Neogoa Design.',4),(9,'2018-02-24 21:25:19','Ultimate Xperience - Lazarus Rising','Neogoa Records is proud to present the long-awaited new Ultimate Xperience (UX) release Lazarus Rising featuring new productions by this legendary psychedelic trance act. This conceptual mini-album is the introduction for the upcoming Ultimate Xperience double-CD album, The Realm Of A New Dawn, which will include most of the music from this release and should come out sometime in early 2017 under the Neogoa Records banner. Kris Kylven, the mastermind behind the project, put a lot of effort and time into making this release possible. Here he introduces a new vision and direction for the project, an important and vital part of the Goa trance scene with vast experience and knowledge spanning two decades. Now, Ultimate Xperience is ready to take one step further and present this music to the world in the best possible fashion!\r\n\r\nAll tracks written, performed, engineered, and produced by Kris Kylven @ Universum Maschine Studio (Laibach, Slovenia) except track 5, originally written by Ben Watkins & Mike Maguire (appearing here with kind permission). Mastered by Charles Michaud @ PrÃ©fÃ©rence Mastering. Track 7 post-production mastering by Mark Nomen at dB Factory. Artwork design by Kris Kylven and Richpa at Neogoa Design.',4),(10,'2018-02-25 13:28:46','Pyramidal Trancendence','Pyramidal Trancendence is the debut compilation from Metapsychic Records. It is an impressive piece of work, charting a course through the mystic realms of spiritual Goa trance. Nine artists provide modern interpretations of the classic style popularized by bands such as Etnica and Astral Projection ten years ago. Perhaps the most impressive aspect of this release is the sheer quality of the presentation. With an excellent cover design by Astrancer and mastering by Kenneth of Colorbox, Pyramidal Trancendence has been assembled with quality in mind.',2),(11,'2018-02-25 13:30:29','Mindsphere - Inner Cyclone','Inner Cyclone, the debut album by Mindsphere (Ali AkgÃ¼n), was originally released in 2007 by the now defunct Metapsychic Records. It became an instant hit here on Ektoplazm despite problems with the mastering. Because this full power Goa trance stormer deserved better, Suntrip Records decided to re-release the album in higher quality with professional mastering by Tim Schuldt at 4CN Studios as the second disc of Mindsphereâ€™s newest album, Patience For Heaven, which was released in October 2012. Now it returns to Ektoplazm as a free download!\r\n\r\nThe aim of Inner Cyclone is to propel the listener and dancer into the middle of a whirling vortex of highly sensitive feelings and authentic emotions directly inspired by Aliâ€™s experiences in life. Old school Goa trance fans are certain to find themselves touched and bewitched by the diverse oriental tonalities of this dynamic and melodic album. Take a subliminal trip to â€œmythic Anatoliaâ€ with this revitalized creation!',2),(12,'2018-02-25 13:32:46','HelixNebula - Trip To Infinity','Gliese 581C presents Trip To Infinity, the full-length debut of HelixNebula (Stanislav Tiptsov), a Russian producer already known for his MentalImage project, which previous released Dreams Vol. 2 here on Ektoplazm. This time the focus is on active dance floor music inspired by the retrodelic sound of Goa trance, finishing off with a few cover songs that will bring back memories. Mastering by Mental Reason with cover artwork by Sasha Martinsen.',2),(13,'2018-02-25 13:35:34','Ekoplex - Creatures Of The Forest','Ektoplazm is proud to present Creatures Of The Forest, the eagerly anticipated second album by Canadian psytrance producer Ekoplex (Ray Vincent). Following the immense underground success of Journey Of The Turtle, his full-length debut in 2008, Ekoplex returned to his Toronto studio to undertake the evolution of his unique brand of full-on psychedelic morning trance. Now, after nearly two years of intensive work and brazen experimentation, it is time to share the results with the world! Creatures Of The Forest is a seamlessly mixed journey into the heart of the forest ecosystem, where all life is interconnected and the ancient spirit of nature is revealed. This album features vocals by Adam Aves and Viki Ebadi, mastering by Jay Kerner (Southwild), and cover art by Rompfndasl of Neuromantix.',2),(14,'2018-02-25 18:11:54','Primal Drive','Universal Tribe Records are pleased to announce the release of their very first compilation, Primal Drive. This release features tracks from across the psychedelic spectrum, from deep progressive sounds to more upbeat material. Featured here are both established and upcoming Australian artists, a mix of familiar names and new faces. The goal, in essence, is to introduce you to whatâ€™s stirring in the psychedelic underground down under! All tracks mastered by Interpulse with artwork by Point Zero Productions.',1),(17,'2018-03-19 19:07:10','Phone Booth Robbers - Falling Into One','01 - Signals From Inner Space (98 BPM)\r\n02 - DRTFM (96 BPM)\r\n03 - Circuit Bending The Universe At Your Desk (96 BPM)\r\n04 - Greasy Mechanism (104 BPM)\r\n05 - Electric Insects Crawling Through A Greener Universe (100 BPM)\r\n06 - Dangerous Creatures (68 BPM)\r\n07 - I Can\\\'t Sleep Because You Can (112 BPM)\r\n08 - Short But Untold Stories (88 BPM)\r\n09 - The Hills Of Faraway (104 BPM)\r\n10 - Six Hour Holiday (112 BPM)\r\n11 - Voodoo Lab (148 BPM)\r\n12 - Winter At Zabriskie Point (78 BPM)\r\n\r\nOmnitropic presents Falling Into One, the debut full-length album by Phone Booth Robbers (Bastiaan van Staaveren), a psychedelic downtempo project from the town of Hoofddorp in The Netherlands. Phone Booth Robbers began creating music in the mid-nineties, gradually shifting from early trance music to richly melodic downtempo and electronica inspired by acts like Shpongle, Ott, Bluetech, Ozric Tentacles, and Easily Embarrassed. Mastered by Jeffrey van der Schilden at EE Music Studio, The Netherlands, with photography by Steven Willis.',5),(18,'2018-03-19 19:08:52','Next Destination','01 :: Capsula - Dendreamers & Dreamers\r\n02 :: Phobosphere - Aelita\r\n03 :: Ocelot - Echoes of Silence\r\n04 :: Yudhisthira - Next Destination\r\n05 :: Atriohm - Furia\r\n06 :: Big Noise - Free Space\r\n07 :: Encephalopaticys - Master\r\n08 :: Para Halu - A Week of Sundays\r\n09 :: Mindex - Meditation\r\n\r\nNext Destination features 68 minutes of downtempo, chill-out, and ambient compiled by The Supreme and mastered by Kindzadza. This free release is made in tribute to Viktor Zolodarenko, widely known throughout the psytrance scene for his involvement in Parasense, Terminator, Freaking, Big Noise, Burned Processor, and Fabrique. His music has inspired many artists worldwide and has already given rise to one previous tribute compilation: Lost In The Forests. A quote from the liner notes:',5),(19,'2018-03-19 19:09:25','Koan - Fulfilled Wish','01 :: In The Forest Castle 6:21\r\n02 :: Wheels Of Fortune 6:18\r\n03 :: Priceless Diamonds 4:46\r\n04 :: Fulfilled Wish 7:40\r\n05 :: Forgotten Path 5:55\r\n\r\nFollowing up on their debut full-length album Two Moon Butterflies, the Russian downtempo project Koan (Daniel Roeth and William Grey) returns with an enchanting release on the SunStation netlabel. With the Fulfilled Wish EP, Koan deepen their exploration of the â€œethno-loungeâ€ style with a conceptual exploration of Middle Eastern themes. Described in the promotional text as â€œcalm and gradually evolving,â€ this release lives up to expectations, offering an incredibly smooth listening experience.\r\n\r\nThe Fulfilled Wish EP is available in a variety of formats, both compressed and lossless: WAV, FLAC, MP3, and OGG. Visit archive.org for a full list of options or try the download links below.',5),(20,'2018-03-19 19:10:25','Koan - The Signs: Entanglement','01 - At The Sunset (Early Mix)\r\n02 - Entanglement\r\n03 - Cave Entrance\r\n04 - Return To The Pearl Island\r\n05 - Evening Flight With Souram\r\n06 - Secret Map Of Cortes\r\n07 - By the Crystalline Cliffs\r\n08 - On The Red Flatland\r\n09 - Shanu\\\'s Vision\r\n10 - The Chase\r\n11 - Vaiteri\\\'s Trial\r\n12 - The Return Of The Conquistadors\r\n13 - Aerial Cricket\r\n14 - Big Trouble In Rio Grande\r\n15 - Diego The Pirate\\\'s Broken Circle\r\n16 - Shadows Around The Corner\r\n17 - Night-Time Talk With Coyote\r\n18 - Meeting At Mercedos\r\n19 - House In The Wilderness Part 1 (Meeting With Jose)\r\n20 - After The Taste Of Rose The Gypsy\\\'s Brew\r\n21 - A Firefly Wearing A Blue Hat With A Small Lamp\r\n22 - Inside Oko-Shika\r\n23 - House In The Wilderness Part 2 (Night Flights Over Sonora Desert)\r\n24 - Meeting With Don Ernesto\\\'s Shades\r\n25 - Santiago\\\'s Passes\r\n26 - Trapped\r\n27 - Boarding Action\r\n28 - Under The Waterfall\r\n29 - Night Rendezvous With Mercedes\r\n30 - Lone Wagon (feat. Tatyana Kalmykova)\r\n31 - At The Dwarf\\\'s Cave\r\n32 - Riding A Crocodile\r\n33 - Nebula\r\n34 - Exposure\r\n35 - Jaguar Fights Don Ernesto\r\n36 - Sabotage (feat. Tatyana Kalmykova)\r\n37 - Return\r\n38 - Shanu And The Bear\r\n39 - Liberation\r\n40 - At Dawn (Later Mix)\r\n\r\nOmnitropic is proud to present The Signs: Entanglement, an epic world-beat, deep tribal trance, cinematic downtempo album by Koan (Daniel Roeth & William Grey). Spanning more than two hours of airtime with a total of 40 tracks, this release is a mega-mix of selected works from 2004-2009. Through evocative storytelling Koan invites you to take an unforgettable journey into the heart of magic and mystery. Cover design by Basilisk using original photography by Alex E. Proimos.',5),(21,'2018-03-19 19:11:10','Ekoplex - Discovering The Ancient','01 - Turtle Island (120 BPM)\r\n02 - Hip Shiva Wigga (100 BPM)\r\n03 - Follow The Music (100 BPM)\r\n04 - Shamanic Drumz (110 BPM)\r\n05 - Before The Sun (110 BPM)\r\n06 - Aya (110 BPM)\r\n07 - Shapeshifter (112-119 BPM)\r\n08 - Crossroads (114 BPM)\r\n09 - End Of The Cycle, Beginning Of... (110 BPM)\r\n\r\nOmnitropic, Ektoplazmâ€™s downtempo imprint, proudly presents Discovering The Ancient, the third studio album by Canadian producer Ekoplex (Ray Vincent). After the success of his previous albums, Journey Of The Turtle and Creatures Of The Forest, Ekoplex now turns inward to explore the cosmic potential of deep tribal trance and downtempo. Featuring live instrumentation, guest vocalists, and experiments in alternate tuning, this is an incredibly vibrant album filled with hidden messages and memorable moments. For greater insight into the creative process behind the music, please consult the extensive liner notes. Mastered by Michael Phillips with original photography by Su MaShakti.',5),(22,'2018-03-19 19:11:51','Jikkenteki - The Long Walk Home','Part 1: Revelations And Moments Of Clarity\r\n01 :: False Sense Of Security (6:48)\r\n02 :: Ambiguity (12:54)\r\n03 :: An Angel Takes Flight (27:22)\r\n04 :: Chasing Raindrops (7:17)\r\n05 :: Warmth In Cold Places (15:31)\r\n\r\nPart 2: Moving Forward In The Real World\r\n06 :: Temporary Distractions (14:00)\r\n07 :: Automagic (8:46)\r\n08 :: Quietly Screaming (8:33)\r\n09 :: Days Of The Weak (7:12)\r\n10 :: Something New (6:20)\r\n11 :: Different Paths (8:20)\r\n12 :: Stepping Forward (9:11)\r\n13 :: Warmth In Other Places (9:10)\r\n\r\nJikkentekiâ€˜s ambitious debut album The Long Walk Home was conceived as an exploration of the nature of duality. Originally released in 2006 by PAR-2 Productions, this epic sonic journey begins with drifting downtempo and ambient soundscapes before shifting into high gear with ripping psychedelic trance and energetic grooves. Inspired by real events, Jikkenteki touches upon the full range of human emotionsâ€“from utter joy to devastating lossâ€“and the strange sensation that results from experiencing these conflicting feelings simultaneously. This is a concept album like no other!',5),(23,'2018-03-20 18:59:36','Frost-RAVEN - Deep In Blue','01 - The Big Nothing\r\n02 - Mission\r\n03 - The Void\r\n04 - Nebula\r\n05 - Hunter\r\n06 - Ka\\\'thas\r\n07 - Infected Trench\r\n08 - Solar Wind\r\n09 - Zenite Nest\r\n10 - Ne\\\'nemis\r\n\r\nA truly masterful work of slow magic, Deep In Blue is an ambient, IDM, and downtempo album by Frost-RAVEN (Dustin Musser), an American producer based in San Francisco. Inviting curiosity into this realm with the use of his mysterious tones, this album has a psychedelic, otherworldly feel to it. Carefully chosen instrumentation and subtle effects make it easy to get lost in the atmosphere of this soundtrack to a blue water world released by Elephant Head Records. Mastering by Frost-RAVEN with artwork by Modcam (Cameron Gaut).',5),(24,'2018-10-27 17:26:41','Proton Kinoun â€“ Apeiron','01 :: Skyward Dreams\r\n02 :: Silver Satellite\r\n03 :: Peripheral System\r\n04 :: Stars Wobbling...\r\n05 :: ...Life\\\'s Bubbling\r\n06 :: Light Echoes\r\n07 :: Illimitable\r\n\r\nApeiron marks the formal debut of Proton Kinoun (Kasper Weensgaard), a Danish ambient producer, on Ektoplazmâ€™s new ambient and downtempo sublabel, Omnitropic. This album is a mixture of deep drifting soundscapes, beatless ambient atmospheres, thick airy pads, and throbbing, liquid electronic percussion. Inspired by the breathtaking images of our universe captured by the sharp eyes of the Hubble Space Telescope, Apeiron is a meditative exploration of the quickening of life on cosmic scales of space and time. The use of headphones and complete darkness is recommended for a completely immersive listening experience! Mastered by Akhentek with artwork by Basilisk.  ',1),(37,'2018-11-19 18:13:27','Trik za savrÅ¡enu kajganu','GreÅ¡ka je kod pravljenja kajgane zaÄinjavati jaja pre nego Å¡to ih ubacimo u tiganj, a ne treba ih ni mutiti pre nego Å¡to ih stavimo na vatru. So i biber treba dodati na samom kraju\r\n\r\n\r\nDELUJE jednostavno, ali nije baÅ¡ tako lako napraviti savrÅ¡enu kajganu. Jedan od najpoznatijih svetskih kuvara Gordon Remzi kaÅ¾e da je prva greÅ¡ka koju pravimo zaÄinjavanje jaja pre nego Å¡to ih ubacimo u tiganj. Kad to uradimo, dobiÄ‡emo vodenast obrok jer so razbija jaja i ona gube kompaktnost. Druga greÅ¡ka je muÄ‡enje jaja pre nego Å¡to ih ubacimo na vatru. MuÄ‡enje, kao i zaÄini, takoÄ‘e razbija jaja. Tek kad su jaja u tiganju, na vatri, treba ih meÅ¡ati, bez pauze, kao riÅ¾oto, savetuje Remzi.\r\n\r\nJedan od trikova za dobru kajganu krije se u promeni temperature. Tiganj treba skinuti sa vatre, pa ga vratiti, pa opet skinuti. Tako Ä‡ete dobiti vazduÅ¡astu, kremastu i veoma ukusnu kajganu, obeÄ‡ava kuvar.\r\n\r\nSo i biber treba dodati na samom kraju, nekoliko trenutaka pre nego Å¡to sklonite tiganj sa vatre. Remzi ima i tajni sastojak - kaÅ¡iÄicu kisele pavlake koja, kako kaÅ¾e, izdiÅ¾e ovaj svakodnevni obrok na viÅ¡i nivo.',1),(38,'2018-11-28 20:51:40','PORUKA INDIJANSKOG POGLAVICE BELOM ÄŒOVEKU','MoÅ¾emo biti braÄ‡a, posle svega\r\n\r\n\r\nâ€œKako moÅ¾ete kupiti ili prodati nebo, toplinu zemlje? Ta ideja nam je strana.\r\n\r\nAko mi ne posedujemo sveÅ¾inu vazduha i bistrinu vode, kako vi to moÅ¾ete kupiti?\r\n\r\nSvaki deo te zemlje svet je za moj narod. Svaka sjajna borova iglica, svaka peÅ¡Äana obala, svaka magla u tamnoj Å¡umi, svaki insekt, sveti su u pamÄ‡enju i iskustvu moga naroda. Sokovi koji kruÅ¾e kroz drveÄ‡e nose seÄ‡anje na crvenog Äoveka.\r\n\r\nMrtvi beli ljudi zaboravljaju zemlju svog roÄ‘enja kada odu u Å¡etnju meÄ‘u zvezdama. NaÅ¡i mrtvi nikad ne zaboravljaju ovu lepu zemlju jer ona je majka crvenog Äoveka. Mi smo deo zemlje i ona je deo nas. Mirisavo cveÄ‡e naÅ¡e su sestre, jelen, konj, veliki orao, svi oni su naÅ¡a braÄ‡a.Stenoviti vrhunci, soÄni paÅ¡njaci, tela ponija i Äovek â€“ svi pripadaju istoj porodici.\r\n\r\nTako, kad Veliki poglavica iz VaÅ¡ingtona Å¡alje glas da Å¾eli kupiti naÅ¡u zemlju, traÅ¾i previÅ¡e od nas. Veliki poglavica Å¡alje glas da Ä‡e nam saÄuvati mesto tako da Ä‡emo mi sami moÄ‡i Å¾iveti udobno. On Ä‡e nam biti otac i mi Ä‡emo biti njegova deca. Mi Ä‡emo razmatrati vaÅ¡u ponudu da kupite naÅ¡u zemlju. Ali to neÄ‡e biti lako. Jer ta zemlja je sveta za nas.\r\n\r\nTa sjajna voda Å¡to teÄe brzacima i rekama nije samo voda veÄ‡ i krv naÅ¡ih predaka. Ako vam prodamo zemlju morate se setiti da je to sveto i morate uÄiti vaÅ¡u decu da je to sveto i da svaki odraz u bistroj vodi jezera priÄa dogaÄ‘aje i seÄ‡anja moga naroda. Å½ubor vode glas je oca moga oca.\r\n\r\nReke su naÅ¡a braÄ‡a, one nam utuÅ¾uju Å¾eÄ‘. Reke nose naÅ¡e kanue i hrane naÅ¡u decu. Ako vam prodamo naÅ¡u zemlju morate se setiti i uÄiti naÅ¡u decu da su reke naÅ¡a braÄ‡a, i vaÅ¡a, i morate od sada dati rekama dobrotu kakvu biste pruÅ¾ili svakome bratu.\r\n\r\nMi znamo da beli Äovek ne razume naÅ¡ Å¾ivot. Jedan deo zemlje njemu je isti kao i drugi, jer on je stranac koji doÄ‘e noÄ‡u i uzima od zemlje sve Å¡to Å¾eli. Zemlja nije njegov brat nego njegov neprijatelj i kada je pokori on kreÄ‡e dalje. On za sobom ostavlja grobove otaca i ne brine se. On otima zemlju od svoje dece i ne brine se. Grobovi njegovih otaca i zemlja Å¡to mu decu raÄ‘a zaboravljeni su. Odnosi se prema majci â€“ zemlji, prema bratu â€“ nebu kao prema stvarima Å¡to se mogu kupiti, opljaÄkati, prodati kao stado ili sjajan nakit.Njegov apetit proÅ¾derat Ä‡e zemlju i ostaviti samo pustoÅ¡.\r\n\r\nNe znam. NaÅ¡ naÄin je drukÄiji nego vaÅ¡. Izgled vaÅ¡ih gradova boli oÄi crvenog Äoveka. Ali moÅ¾da je to jer crveni Äovek je divlji i ne razume.\r\n\r\nNema mirnog mesta u gradovima belog Äoveka. Nema mesta da se Äuje otvaranje cvetova u proleÄ‡e ili drhtaj krilaca vilinog konjica. Ali moÅ¾da je to jer sam divlji i ne razumem. Buka jedino deluje kao uvreda za uÅ¡i. I Å¡ta je to ako Äovek ne moÅ¾e Äuti usamljeni krik kozoroga ili noÄ‡u prepirku Å¾aba u bari? Ja sam crveni Äovek i ne razumem. Indijanac viÅ¡e voli blagi zvuk vetra kad se poigrava licem moÄvare kao i miris vetra oÄiÅ¡Ä‡en podnevnom kiÅ¡om, namirisan borovinom.\r\n\r\nVazduh je skupocen za crvenog Äoveka jer sve Å¾ivo deli jedan dah â€“ Å¾ivotinja, drvo, Äovek. Beli Äovek ne izgleda kao da opaÅ¾a vazduh koji diÅ¡e. Kao Äovek koji umire mnogo dana on je otupio na smrad. Ali ako vam prodamo naÅ¡u zemlju morate se setiti da je vazduh skupocen za nas, da vazduh deli svoj dah sa svim Å¾ivotom koji podrÅ¾ava. Vetar Å¡to je mom dedu dao prvi dah takoÄ‘e Ä‡e prihvatiti i njegov poslednji uzadah. Ali ako vam prodamo naÅ¡u zemlju morate je Äuvati kao svetinju, kao mesto gde Ä‡e i beli Äovek moÄ‡i da okusi vetar Å¡to je zaslaÄ‘en mirisom poljskog cveÄ‡a.\r\n\r\nTako Ä‡emo razmatrati vaÅ¡u ponudu da kupite naÅ¡u zemlju. Ako odluÄimo da prihvatimo, postaviÄ‡u jedan uslov: beli Äovek mora se odnositi prema Å¾ivotinjama ove zemlje kao prema svojoj braÄ‡i.\r\n\r\nJa sam divljak i ne razumem neki drugi naÄin. Video sam hiljade raspadajuÄ‡ih bizona u preriji Å¡to ih je ostavio beli Äovek ustrelivÅ¡i ih iz prolazeÄ‡eg voza. Ja sam divljak i ne razumem kako dimeÄ‡i gvozdeni konj moÅ¾e biti vaÅ¾niji nego bizon koga mi ubijamo samo da ostanemo Å¾ivi.\r\n\r\nÅ ta je Äovek bez Å¾ivotinja? Ako sve Å¾ivotinje odu, Äovek Ä‡e umreti od velike usamljenosti duha. Å to god se desilo Å¾ivotinjama, ubrzo Ä‡e se dogoditi i Äoveku. Sve stvari su povezane.Morate nauÄiti svoju decu da je tle pod njihovim stopama pepeo njihovih dedova. Tako Ä‡e oni poÅ¡tovati zemlju, recite vaÅ¡oj deci da je zemlja s nama u srodstvu. UÄite vaÅ¡u decu kao Å¡to Äinimo mi s naÅ¡om da je zemlja naÅ¡a majka. Å to god snaÄ‘e zemlju snaÄ‡i Ä‡e i sinove zemlje. Ako Äovek pljuju na tle pljuje i na sebe samog.\r\n\r\nTo mi znamo: zemlja ne pripada Äoveku; Äovek pripada zemlji. To mi znamo. Sve stvari povezane su kao krv koja ujedinjuje porodicu. Sve stvari su povezane.\r\n\r\nÅ ta god snaÄ‘e zemlju snaÄ‡i Ä‡e i sinove zemlje. ÄŒovek ne tka tkivo Å¾ivota; on je samo struk u tome. Å ta god Äini tkanju Äini i sebi samome.\r\n\r\nÄŒak i beli Äovek, Äiji Bog govori i Å¡eta s njime kao prijatelj sa prijateljem, ne moÅ¾e biti izuzet od zajedniÄke sudbine. Mi moÅ¾emo biti braÄ‡a posle svega. VideÄ‡emo. Jednu stvar znamo, koju Ä‡e beli Äovek jednog dana otkriti â€“ naÅ¡ Bog je isti Bog. Vi sada moÅ¾ete misliti da ga vi imate kao Å¡to Å¾elite imati naÅ¡u zemlju; ali to ne moÅ¾ete. On je Bog Äoveka i njegova samilost jednaka je za crvenog Äoveka kao i za belog. Ta zemlja je draga Njemu i Å¡koditi zemlji jeste prezirati njenog Stvoritelja. Beli takoÄ‘e trebaju prolaz; moÅ¾da brÅ¾e nego sva druga plemena. Zaprljajte vaÅ¡ krevet i jedne noÄ‡i uguÅ¡it Ä‡ete se u vlastitom smeÄ‡u.\r\n\r\nAli u vaÅ¡oj propasti svetleÄ‡ete sjajno, potpaljeni snagom od Boga koji vas je doneo na tu zemlju i za neku posebnu svrhu dao vam vlast nad njome kao i nad crvenim Äovekom. Sudbina je misterija za nas jer mi ne znamo kad Ä‡e svi bizoni biti poklani i divlji konji pripitomljeni, tajni kutovi Å¡ume teÅ¡ki zbog mirisa mnogih ljudi i pogled na zrele breÅ¾uljke zamrljan brbljajuÄ‡om Å¾icom. Gde je praÅ¡uma? OtiÅ¡la je. Gde je orao? OtiÅ¡ao je. To je konac Å¾ivljenja i poÄetak borbe za preÅ¾ivljavanje.â€',5);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Zed','zed@mail.com','zedicus123'),(2,'Rahl','rahl@mail.com','rahl456'),(3,'Kahlan','kahlan@mail.com','amnel789'),(4,'Cypher','cypher@mail.com','seeker123'),(5,'Egremont','egremont@mail.com','general123'),(6,'Thaddicus','thad@mail.com','thad123'),(7,'Chief','chief@mail.com','spartan123');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-04  9:34:09