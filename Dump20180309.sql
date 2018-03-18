-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: onepiece
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `article_articles`
--

DROP TABLE IF EXISTS `article_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `file` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `article_articles_created_by_id_98a7a7db_fk_journal_journals_id` (`created_by_id`),
  CONSTRAINT `article_articles_created_by_id_98a7a7db_fk_journal_journals_id` FOREIGN KEY (`created_by_id`) REFERENCES `journal_journals` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_articles`
--

LOCK TABLES `article_articles` WRITE;
/*!40000 ALTER TABLE `article_articles` DISABLE KEYS */;
INSERT INTO `article_articles` VALUES (1,'basic instrumentation','01_Extension_Manager_pfTt1x5_p7CQOYv.png','basic_instrumentation_system_aazydcM.pdf','2018-03-07 15:38:19','2018-03-07 15:38:19',1),(2,'article1','get_it_erOY1Qb.jpg','A_Color_Edge_Detection_Algorithm_in_RGB_Color_Space.pdf','2018-03-08 18:16:15','2018-03-08 18:16:15',2);
/*!40000 ALTER TABLE `article_articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add user profile',1,'add_userprofile'),(2,'Can change user profile',1,'change_userprofile'),(3,'Can delete user profile',1,'delete_userprofile'),(4,'Can add journals',2,'add_journals'),(5,'Can change journals',2,'change_journals'),(6,'Can delete journals',2,'delete_journals'),(7,'Can add articles',3,'add_articles'),(8,'Can change articles',3,'change_articles'),(9,'Can delete articles',3,'delete_articles'),(10,'Can add editorials',4,'add_editorials'),(11,'Can change editorials',4,'change_editorials'),(12,'Can delete editorials',4,'delete_editorials'),(13,'Can add log entry',5,'add_logentry'),(14,'Can change log entry',5,'change_logentry'),(15,'Can delete log entry',5,'delete_logentry'),(16,'Can add group',6,'add_group'),(17,'Can change group',6,'change_group'),(18,'Can delete group',6,'delete_group'),(19,'Can add permission',7,'add_permission'),(20,'Can change permission',7,'change_permission'),(21,'Can delete permission',7,'delete_permission'),(22,'Can add user',8,'add_user'),(23,'Can change user',8,'change_user'),(24,'Can delete user',8,'delete_user'),(25,'Can add content type',9,'add_contenttype'),(26,'Can change content type',9,'change_contenttype'),(27,'Can delete content type',9,'delete_contenttype'),(28,'Can add session',10,'add_session'),(29,'Can change session',10,'change_session'),(30,'Can delete session',10,'delete_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (2,'pbkdf2_sha256$36000$Jy6zfyrSgY2t$ivQWTESrlThrEE+/3WhBp+IU7ECSq7rI/Twwz/sfTsk=','2018-03-07 17:41:00',1,'admin','','','',1,1,'2018-03-07 15:21:10'),(5,'pbkdf2_sha256$36000$ZlWB6Cy4rgOV$bvizrTguGsjOtOq10JuLFrQrsvf1P4TZlJcY9GExTtk=','2018-03-08 19:12:23',0,'naveenyadav','naveen','yadav','naveenyadaviitkgp@gmail.com',0,1,'2018-03-07 16:09:56'),(6,'pbkdf2_sha256$36000$gJIZBkZnoDL9$UcJ2MVGlHjXJvk5BPjMcA16ao/xM1hWMN+L+QZlOJ88=','2018-03-08 19:11:15',0,'user1','user1','test','user1.test@gmail.com',0,1,'2018-03-07 16:13:15');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-03-07 15:22:11','1','naveen',3,'',8,2),(2,'2018-03-07 15:27:55','2','naveen',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',1,2),(3,'2018-03-07 15:29:47','3','user',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',1,2),(4,'2018-03-07 16:08:02','4','user',3,'',8,2),(5,'2018-03-07 16:08:16','3','naveen',3,'',8,2),(6,'2018-03-07 16:12:32','1','naveenyadav',2,'[{\"changed\": {\"fields\": [\"description\", \"city\", \"phone\", \"image\"]}}]',1,2),(7,'2018-03-07 17:41:22','1','naveenyadav',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',1,2),(8,'2018-03-07 17:41:58','2','user1',2,'[{\"changed\": {\"fields\": [\"description\", \"city\", \"phone\", \"image\"]}}]',1,2);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (5,'admin','logentry'),(3,'article','articles'),(6,'auth','group'),(7,'auth','permission'),(8,'auth','user'),(9,'contenttypes','contenttype'),(4,'editor','editorials'),(2,'journal','journals'),(10,'sessions','session'),(1,'users','userprofile');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-03-07 15:13:21'),(2,'auth','0001_initial','2018-03-07 15:13:33'),(3,'admin','0001_initial','2018-03-07 15:13:35'),(4,'admin','0002_logentry_remove_auto_add','2018-03-07 15:13:35'),(5,'journal','0001_initial','2018-03-07 15:13:35'),(6,'article','0001_initial','2018-03-07 15:13:37'),(7,'contenttypes','0002_remove_content_type_name','2018-03-07 15:13:38'),(8,'auth','0002_alter_permission_name_max_length','2018-03-07 15:13:39'),(9,'auth','0003_alter_user_email_max_length','2018-03-07 15:13:40'),(10,'auth','0004_alter_user_username_opts','2018-03-07 15:13:40'),(11,'auth','0005_alter_user_last_login_null','2018-03-07 15:13:41'),(12,'auth','0006_require_contenttypes_0002','2018-03-07 15:13:41'),(13,'auth','0007_alter_validators_add_error_messages','2018-03-07 15:13:41'),(14,'auth','0008_alter_user_username_max_length','2018-03-07 15:13:43'),(15,'editor','0001_initial','2018-03-07 15:13:45'),(16,'sessions','0001_initial','2018-03-07 15:13:46'),(17,'users','0001_initial','2018-03-07 15:13:48'),(18,'users','0002_auto_20180307_2047','2018-03-07 15:18:02'),(19,'users','0003_auto_20180307_2119','2018-03-07 15:50:28'),(20,'users','0004_auto_20180307_2120','2018-03-07 15:50:28'),(21,'users','0002_userprofile','2018-03-07 16:06:49'),(22,'users','0003_remove_userprofile_image','2018-03-07 16:14:47'),(23,'journal','0002_journals_created_by','2018-03-07 16:25:09'),(24,'users','0004_userprofile_image','2018-03-07 17:39:59'),(25,'users','0005_auto_20180307_2350','2018-03-07 18:21:04');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('ejh7fq3nmt2ez0mlv57xpp1w2ua84fnf','ZTRlN2E4ZTZmNjcwMjAxMzE4MTczMDhmZDVhMzMwMjdhNjA4YThkODp7Il9hdXRoX3VzZXJfaGFzaCI6ImM1ZWM2MGFhOWNmNWMwOGFjM2VhNjBkMWY2MDIzMGRjY2FhMDRiMWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-03-21 17:41:00'),('qi64kx6mm3admvo9kpe1hql02j50n6cp','NmEzYjkzZWI2ODliNzBkMThhZmJiMDJlNjYzZWMxOTQ5NzE1MWEwZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImI5YTZhOTgyN2I0OTJjYzVjMjIxM2FkOWFkY2QyMzUxZTJlMzZhMjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2In0=','2018-03-21 18:22:05'),('x2ytu41pawljui5u4irz3wxzi48rhqp0','MmNkNWJmOGI1OWY2ZWIxOTBlNjkyNGEyMDM3ZTZlZTdmZDgxZWMzYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ2YmFhYjdlYzY5MDcyNzIxYzQzZmQxM2ZiZjRiOTRkNjE1YmNiMzIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1In0=','2018-03-22 18:01:17');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editor_editorials`
--

DROP TABLE IF EXISTS `editor_editorials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `editor_editorials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `file` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `editor_editorials_created_by_id_d2011ac2_fk_journal_journals_id` (`created_by_id`),
  CONSTRAINT `editor_editorials_created_by_id_d2011ac2_fk_journal_journals_id` FOREIGN KEY (`created_by_id`) REFERENCES `journal_journals` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editor_editorials`
--

LOCK TABLES `editor_editorials` WRITE;
/*!40000 ALTER TABLE `editor_editorials` DISABLE KEYS */;
INSERT INTO `editor_editorials` VALUES (1,'editor','01_Extension_Manager_pfTt1x5_L8wiH6i.png','basic_instrumentation_system_aazydcM_7CDQMBW.pdf','2018-03-07 15:40:12','2018-03-07 15:40:12',1),(2,'test','tiger_wallpaper_desktop_photo.jpg','Nano_Technology_Based_Storage_Devices_kEBYrF3.pdf','2018-03-08 18:47:53','2018-03-08 18:47:53',2);
/*!40000 ALTER TABLE `editor_editorials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journal_journals`
--

DROP TABLE IF EXISTS `journal_journals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journal_journals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `file` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `journal_journals_created_by_id_5aefe59f_fk_auth_user_id` (`created_by_id`),
  CONSTRAINT `journal_journals_created_by_id_5aefe59f_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal_journals`
--

LOCK TABLES `journal_journals` WRITE;
/*!40000 ALTER TABLE `journal_journals` DISABLE KEYS */;
INSERT INTO `journal_journals` VALUES (1,'nano technology','Copy_of_224411_290561194377110_1317864733_n_zOlCk81_KYVmh1B.jpg','Nano_Technology_Based_Storage_Devices_GQD2O9g.pdf','2018-03-07 15:37:54','2018-03-07 15:37:54',2),(2,'journal1','desktop-year-of-the-tiger-images-wallpaper.jpg','Constitution_of_India.pdf','2018-03-07 16:29:27','2018-03-07 16:29:27',5),(3,'naveen','desktop-year-of-the-tiger-images-wallpaper_pa7Vi6x.jpg','morning_fitness_motivation.jpg','2018-03-07 16:30:56','2018-03-07 16:30:56',6),(4,'journals2','morning_fitness_motivation_fIIBXi8.jpg','get_it_KvF4ihV.jpg','2018-03-07 16:31:59','2018-03-07 16:31:59',5),(5,'Testing Journal','morning_fitness_motivation_o3hX0Pu.jpg','basic_instrumentation_system_ucwyJlr.pdf','2018-03-08 17:59:30','2018-03-08 17:59:30',5);
/*!40000 ALTER TABLE `journal_journals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile`
--

DROP TABLE IF EXISTS `users_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(8000) NOT NULL,
  `city` varchar(100) NOT NULL,
  `phone` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `users_userprofile_user_id_87251ef1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile`
--

LOCK TABLES `users_userprofile` WRITE;
/*!40000 ALTER TABLE `users_userprofile` DISABLE KEYS */;
INSERT INTO `users_userprofile` VALUES (1,'Welcome to science world','hyderabad',234,5,'desktop-year-of-the-tiger-images-wallpaper_rXbrCcB.jpg'),(2,'iam a test user','matrix world',10101,6,'get_it_mh518kj.jpg');
/*!40000 ALTER TABLE `users_userprofile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-09  0:57:04
