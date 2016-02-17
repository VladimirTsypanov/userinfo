CREATE SCHEMA `test` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE `test`.`users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin` bit(1) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;

INSERT INTO users (id, admin, age, name, timestamp) VALUES (100, FALSE , 4, 'Name', '2013-08-05 18:19:03');
INSERT INTO users (id, admin, age, name, timestamp) VALUES (101, FALSE , 4, 'Name', '2013-08-05 18:19:03');
INSERT INTO users (id, admin, age, name, timestamp) VALUES (102, FALSE , 4, 'Name', '2013-08-05 18:19:03');
INSERT INTO users (id, admin, age, name, timestamp) VALUES (103, FALSE , 4, 'Name', '2013-08-05 18:19:03');
INSERT INTO users (id, admin, age, name, timestamp) VALUES (104, FALSE , 4, 'Name', '2013-08-05 18:19:03');
INSERT INTO users (id, admin, age, name, timestamp) VALUES (105, FALSE , 4, 'Name', '2013-08-05 18:19:03');
INSERT INTO users (id, admin, age, name, timestamp) VALUES (106, TRUE , 4, 'Name', '2013-08-05 18:19:03');
INSERT INTO users (id, admin, age, name, timestamp) VALUES (107, FALSE , 4, 'Name', '2013-08-05 18:19:03');
INSERT INTO users (id, admin, age, name, timestamp) VALUES (108, FALSE , 4, 'Name', '2013-08-05 18:19:03');
INSERT INTO users (id, admin, age, name, timestamp) VALUES (109, FALSE , 4, 'Name', '2013-08-05 18:19:03');
INSERT INTO users (id, admin, age, name, timestamp) VALUES (110, FALSE , 4, 'Name', '2013-08-05 18:19:03');
INSERT INTO users (id, admin, age, name, timestamp) VALUES (111, FALSE , 4, 'Name', '2013-08-05 18:19:03');
INSERT INTO users (id, admin, age, name, timestamp) VALUES (112, FALSE , 4, 'Name', '2013-08-05 18:19:03');