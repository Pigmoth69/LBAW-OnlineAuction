DROP TABLE IF EXISTS "Pais";
DROP TABLE IF EXISTS "Categoria";
DROP TABLE IF EXISTS "EstadoLeilao";





INSERT INTO "EstadoLeilao" (id_estado_leilao,valor_actual,estado_leilao,motivo) VALUES (1,'€88.71','aberto','nec, mollis vitae, posuere at, velit. Cras lorem'),(2,'€11.93','fechado','natoque penatibus et magnis dis'),(3,'€68.23','cancelado','ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam'),(4,'€29.44','aberto','facilisis vitae, orci.'),(5,'€12.35','aberto','lorem lorem, luctus ut, pellentesque eget, dictum placerat,'),(6,'€33.46','aberto','Sed dictum. Proin eget odio. Aliquam'),(7,'€20.10','cancelado','per conubia nostra, per inceptos hymenaeos. Mauris'),(8,'€94.94','cancelado.','nostra, per inceptos hymenaeos. Mauris ut quam vel sapien'),(9,'€37.29','cancelado','urna convallis erat, eget tincidunt dui augue eu tellus.'),(10,'€25.17','orci','cancelado. Mauris ut quam vel sapien imperdiet ornare. In'),(11,'€58.34','fechado','eget, volutpat ornare, facilisis eget,'),(12,'€20.40','fechado','id, ante. Nunc mauris'),(13,'€53.67','fechado.','vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus,'),(14,'€66.33','fechado','velit. Pellentesque ultricies dignissim'),(15,'€50.04','fechado.','Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet'),(16,'€64.82','fechado','ipsum cursus vestibulum. Mauris magna.'),(17,'€48.39','fechado','et ultrices posuere cubilia Curae; Phasellus ornare. Fusce mollis.'),(18,'€16.68','fechado','neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc'),(19,'€89.00','fechado','dolor quam, elementum at, egestas a, scelerisque'),(20,'€17.45','aberto','egestas rhoncus. Proin nisl sem, consequat'),(21,'€82.18','aberto','ligula tortor, dictum eu, placerat eget, venenatis a, magna.'),(22,'€58.81','aberto','mollis dui, in sodales elit erat vitae risus. Duis'),(23,'€2.12','aberto','euismod mauris eu elit. Nulla facilisi. Sed'),(24,'€56.93','aberto','vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante.'),(25,'€53.88','aberto','urna suscipit nonummy. Fusce fermentum fermentum'),(26,'€5.84','aberto','pharetra ut, pharetra sed, hendrerit a,'),(27,'€91.36','aberto','viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis,'),(28,'€52.90','aberto','Sed eget lacus. Mauris non dui nec'),(29,'€65.65','aberto','libero et tristique pellentesque, tellus sem mollis dui,'),(30,'€60.20','aberto','eros. Proin ultrices. Duis volutpat nunc sit amet'),(31,'€11.00','aberto','est. Nunc ullamcorper,'),(32,'€31.21','aberto','Phasellus libero mauris, aliquam eu, accumsan'),(33,'€22.16','aberto','semper. Nam tempor diam dictum sapien. Aenean massa.'),(34,'€48.16','aberto','orci lacus vestibulum'),(35,'€32.80','aberto','Donec est mauris,'),(36,'€43.05','aberto','sagittis augue, eu tempor erat neque non quam.'),(37,'€37.75','aberto','dolor sit amet, consectetuer adipiscing elit. Etiam'),(38,'€98.02','aberto','euismod in, dolor.'),(39,'€95.50','aberto','feugiat. Sed nec metus facilisis lorem tristique aliquet.'),(40,'€53.99','lectus','condimentum eget, volutpat ornare,'),(41,'€6.53','faucibus','lorem, luctus ut, pellentesque'),(42,'€77.84','Nam','nunc sed libero. Proin sed'),(43,'€38.81','interdum','eu eros. Nam consequat'),(44,'€65.43','dui.','pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam'),(45,'€67.98','Nulla','ultrices posuere cubilia Curae; Phasellus ornare. Fusce'),(46,'€24.40','volutpat.','Nulla dignissim. Maecenas ornare egestas ligula. Nullam'),(47,'€91.40','ligula','ipsum sodales purus, in molestie tortor'),(48,'€68.39','non','Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna.'),(49,'€1.68','eu','per inceptos hymenaeos. Mauris ut quam'),(50,'€18.07','faucibus','adipiscing elit. Curabitur sed'),(51,'€2.60','pede','Quisque imperdiet, erat'),(52,'€98.65','eu,','in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris'),(53,'€63.15','dolor','auctor non, feugiat nec, diam. Duis mi enim, condimentum'),(54,'€86.42','lectus','dui. Cum sociis natoque penatibus et magnis dis parturient'),(55,'€70.63','Nam','ante ipsum primis in faucibus orci luctus'),(56,'€62.46','Class','eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris'),(57,'€97.28','luctus','lobortis augue scelerisque'),(58,'€96.20','blandit','In nec orci. Donec nibh. Quisque'),(59,'€38.00','blandit.','arcu. Sed eu nibh vulputate mauris sagittis'),(60,'€72.58','Nunc','sem molestie sodales. Mauris blandit enim'),(61,'€28.85','amet,','justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor'),(62,'€78.41','ullamcorper.','sit amet lorem semper auctor. Mauris'),(63,'€51.37','rutrum,','sem magna nec quam. Curabitur'),(64,'€34.48','semper','feugiat. Lorem ipsum dolor sit amet, consectetuer adipiscing'),(65,'€56.67','enim','Nunc lectus pede, ultrices a, auctor'),(66,'€75.28','aberto','mattis semper, dui lectus rutrum urna, nec'),(67,'€55.24','aberto,','est ac facilisis facilisis, magna tellus faucibus leo, in lobortis'),(68,'€87.26','aberto','Donec felis orci, adipiscing non, luctus sit amet,'),(69,'€88.00','cancelado','orci lacus vestibulum lorem, sit amet ultricies'),(70,'€29.42','cancelado','at pede. Cras vulputate velit eu sem.'),(71,'€81.10','cancelado','eget odio. Aliquam vulputate ullamcorper magna.'),(72,'€61.25','cancelado','gravida molestie arcu. Sed eu nibh vulputate'),(73,'€68.30','cancelado','lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim'),(74,'€17.46','fechado.','quis urna. Nunc quis arcu vel quam'),(75,'€26.54','fechado','Curae; Donec tincidunt. Donec vitae'),(76,'€28.95','fechado,','Integer in magna. Phasellus dolor elit, pellentesque'),(77,'€2.50','fechado.','arcu. Aliquam ultrices iaculis odio. Nam interdum enim non'),(78,'€72.78','fechado','ligula elit, pretium et, rutrum'),(79,'€31.04','fechado,','Vivamus rhoncus. Donec est. Nunc ullamcorper,'),(80,'€8.77','fechado,','elit. Etiam laoreet, libero'),(81,'€72.25','fechado','arcu et pede. Nunc sed orci lobortis augue scelerisque'),(82,'€31.59','fechado','cursus luctus, ipsum leo elementum'),(83,'€27.76','fechado','sit amet, consectetuer adipiscing elit. Etiam laoreet, libero'),(84,'€84.07','aberto,','leo elementum sem, vitae'),(85,'€68.28','aberto','Phasellus dapibus quam quis diam. Pellentesque'),(86,'€67.49','aberto.','et, rutrum non, hendrerit id,'),(87,'€41.31','aberto','odio semper cursus. Integer mollis. Integer tincidunt aliquam'),(88,'€40.72','aberto','Aliquam auctor, velit eget laoreet posuere, enim nisl elementum'),(89,'€58.12','aberto','tincidunt, nunc ac mattis ornare,'),(90,'€38.27','erat','ipsum non arcu.'),(91,'€92.00','aberto.','tellus id nunc interdum feugiat. Sed nec metus'),(92,'€88.27','aberto','mauris, aliquam eu, accumsan sed, facilisis'),(93,'€25.15','aberto,','urna, nec luctus felis purus ac tellus.'),(94,'€23.42','aberto','Vivamus euismod urna. Nullam lobortis quam a'),(95,'€84.09','aberto','habitant morbi tristique senectus et'),(96,'€17.05','aberto','amet, risus. Donec nibh enim, gravida sit amet, dapibus'),(97,'€85.96','aberto','ornare lectus justo eu'),(98,'€21.09','aberto.','ut, nulla. Cras eu tellus eu augue porttitor'),(99,'€39.73','aberto,','eros. Proin ultrices. Duis volutpat'),(100,'€15.77','aberto,','odio a purus. Duis elementum, dui');
INSERT INTO "Pais" (id_pais,nome_pais) VALUES (1,'Oman'),(2,'Honduras'),(3,'Martinique'),(4,'Saint Kitts and Nevis'),(5,'Zambia'),(6,'Saint Helena, Ascension and Tristan da Cunha'),(7,'Thailand'),(8,'Western Sahara'),(9,'Bulgaria'),(10,'Nepal'),(11,'Cambodia'),(12,'Myanmar'),(13,'Moldova'),(14,'Wallis and Futuna'),(15,'Equatorial Guinea'),(16,'Namibia'),(17,'Mali'),(18,'Haiti'),(19,'Brazil'),(20,'Syria'),(21,'Martinique'),(22,'Luxembourg'),(23,'Netherlands'),(24,'Korea, South'),(25,'Bulgaria'),(26,'Kiribati'),(27,'Oman'),(28,'Viet Nam'),(29,'Sweden'),(30,'Paraguay'),(31,'Falkland Islands'),(32,'Cape Verde'),(33,'Guadeloupe'),(34,'Anguilla'),(35,'Spain'),(36,'Honduras'),(37,'Congo, the Democratic Republic of the'),(38,'Mayotte'),(39,'Andorra'),(40,'Aruba'),(41,'Tanzania'),(42,'British Indian Ocean Territory'),(43,'Brazil'),(44,'Burkina Faso'),(45,'Monaco'),(46,'Austria'),(47,'Afghanistan'),(48,'Malta'),(49,'Burkina Faso'),(50,'Croatia'),(51,'Poland'),(52,'Greenland'),(53,'Senegal'),(54,'Hungary'),(55,'Niger'),(56,'Mauritius'),(57,'Togo'),(58,'Nauru'),(59,'Bhutan'),(60,'Algeria'),(61,'Dominica'),(62,'Mauritius'),(63,'Wallis and Futuna'),(64,'Solomon Islands'),(65,'Guatemala'),(66,'Virgin Islands, United States'),(67,'Bahrain'),(68,'Switzerland'),(69,'Guam'),(70,'Saint Kitts and Nevis'),(71,'Namibia'),(72,'Afghanistan'),(73,'Côte D''Ivoire (Ivory Coast)'),(74,'Brunei'),(75,'Egypt'),(76,'Algeria'),(77,'Congo, the Democratic Republic of the'),(78,'Burkina Faso'),(79,'Kazakhstan'),(80,'Germany'),(81,'Slovenia'),(82,'Niger'),(83,'Zimbabwe'),(84,'Kyrgyzstan'),(85,'Japan'),(86,'Peru'),(87,'Faroe Islands'),(88,'Chile'),(89,'Mauritania'),(90,'Switzerland'),(91,'Togo'),(92,'Brunei'),(93,'Zambia'),(94,'San Marino'),(95,'Latvia'),(96,'Cape Verde'),(97,'Tokelau'),(98,'Benin'),(99,'Croatia'),(100,'American Samoa');
INSERT INTO "Categoria" (id_categoria,descricao) VALUES (1,'orci'),(2,'imperdiet'),(3,'est'),(4,'mi'),(5,'parturient'),(6,'sed'),(7,'egestas,'),(8,'nisi'),(9,'Sed'),(10,'Curabitur'),(11,'lacus,'),(12,'magna.'),(13,'nisi'),(14,'ac,'),(15,'sed,'),(16,'felis'),(17,'ante.'),(18,'vehicula'),(19,'mi,'),(20,'et'),(21,'nec'),(22,'Cras'),(23,'eget,'),(24,'Duis'),(25,'cursus.'),(26,'Nam'),(27,'sed'),(28,'magnis'),(29,'nulla'),(30,'sollicitudin'),(31,'et'),(32,'ac'),(33,'Mauris'),(34,'ac'),(35,'eu'),(36,'ligula.'),(37,'morbi'),(38,'fermentum'),(39,'ligula'),(40,'Mauris'),(41,'arcu.'),(42,'at'),(43,'metus'),(44,'metus'),(45,'blandit'),(46,'a,'),(47,'eros'),(48,'Sed'),(49,'Sed'),(50,'leo.'),(51,'auctor'),(52,'elit'),(53,'nunc.'),(54,'semper'),(55,'tincidunt'),(56,'lorem,'),(57,'ipsum.'),(58,'Sed'),(59,'interdum.'),(60,'malesuada'),(61,'taciti'),(62,'bibendum'),(63,'ipsum.'),(64,'ac,'),(65,'lobortis'),(66,'morbi'),(67,'ut,'),(68,'pede'),(69,'dictum'),(70,'et,'),(71,'Suspendisse'),(72,'Duis'),(73,'vitae,'),(74,'interdum.'),(75,'vulputate,'),(76,'mollis.'),(77,'dignissim'),(78,'at,'),(79,'amet'),(80,'porttitor'),(81,'posuere,'),(82,'id,'),(83,'quis'),(84,'eu,'),(85,'nulla.'),(86,'laoreet'),(87,'neque'),(88,'pharetra'),(89,'vitae'),(90,'malesuada'),(91,'nunc'),(92,'sapien'),(93,'ultrices.'),(94,'vitae'),(95,'adipiscing,'),(96,'Sed'),(97,'felis'),(98,'sem'),(99,'laoreet'),(100,'a');
