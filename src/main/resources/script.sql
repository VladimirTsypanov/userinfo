CREATE SCHEMA `test` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE `test`.`users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin` bit(1) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;

INSERT INTO users (id, admin, age, name, timestamp) VALUES (1, FALSE , 4, 'Name', '2013-08-05 18:19:03');
INSERT INTO users (id, admin, age, name, timestamp) VALUES (2, FALSE , 4, 'Name', '2013-08-05 18:19:03');
INSERT INTO users (id, admin, age, name, timestamp) VALUES (3, FALSE , 4, 'Name', '2013-08-05 18:19:03');
INSERT INTO users (id, admin, age, name, timestamp) VALUES (4, FALSE , 4, 'Name', '2013-08-05 18:19:03');
INSERT INTO users (id, admin, age, name, timestamp) VALUES (5, FALSE , 4, 'Name', '2013-08-05 18:19:03');
INSERT INTO users (id, admin, age, name, timestamp) VALUES (6, FALSE , 4, 'Name', '2013-08-05 18:19:03');
INSERT INTO users (id, admin, age, name, timestamp) VALUES (7, TRUE , 4, 'Name', '2013-08-05 18:19:03');
INSERT INTO users (id, admin, age, name, timestamp) VALUES (8, FALSE , 4, 'Name', '2013-08-05 18:19:03');
INSERT INTO users (id, admin, age, name, timestamp) VALUES (9, FALSE , 4, 'Name', '2013-08-05 18:19:03');
INSERT INTO users (id, admin, age, name, timestamp) VALUES (10, FALSE , 4, 'Name', '2013-08-05 18:19:03');
INSERT INTO users (id, admin, age, name, timestamp) VALUES (11, FALSE , 4, 'Name', '2013-08-05 18:19:03');
INSERT INTO users (id, admin, age, name, timestamp) VALUES (12, FALSE , 4, 'Name', '2013-08-05 18:19:03');
INSERT INTO users (id, admin, age, name, timestamp) VALUES (13, FALSE , 4, 'Name', '2013-08-05 18:19:03');