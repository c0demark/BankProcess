

 `accounts`.CREATE DATABASE `accounts` /*!40100 DEFAULT CHARACTER SET latin1 */;



DROP TABLE IF EXISTS `accounts`.`account_info`;
CREATE TABLE  `accounts`.`account_info` (
  `account_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_no` varchar(45) NOT NULL DEFAULT '',
  `current_balance` decimal(10,2) NOT NULL DEFAULT '0.00',
  `bank_name` varchar(45) NOT NULL DEFAULT '',
  `bank_branch` varchar(45) NOT NULL DEFAULT '',
  `account_type` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`account_id`,`account_no`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `accounts`.`beneficiaries_details`;
CREATE TABLE  `accounts`.`beneficiaries_details` (
  `beneficiaries_id` int(10) unsigned NOT NULL DEFAULT '0',
  `beneficiaries_account_number` varchar(45) NOT NULL DEFAULT '0',
  `beneficiaries_bank` varchar(45) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `beneficiaries_account_type` varchar(45) NOT NULL DEFAULT '',
  `beneficiaries_account_holder` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`beneficiaries_account_number`),
  KEY `FK_beneficiaries_details_1` (`user_id`),
  CONSTRAINT `FK_beneficiaries_details_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `accounts`.`transaction`;
CREATE TABLE  `accounts`.`transaction` (
  `transaction_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_type` varchar(45) NOT NULL DEFAULT '',
  `amount` decimal(10,0) DEFAULT NULL,
  `recipient_account_number` varchar(45) NOT NULL DEFAULT '',
  `recipient_account_bank` varchar(45) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `transaction_no` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`transaction_id`),
  KEY `FK_transaction_1` (`user_id`),
  CONSTRAINT `FK_transaction_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `accounts`.`user_info`;
CREATE TABLE  `accounts`.`user_info` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_name` varchar(200) NOT NULL DEFAULT '',
  `first_name` varchar(45) NOT NULL DEFAULT '',
  `last_name` varchar(45) NOT NULL DEFAULT '',
  `Date_of_birth` varchar(45) NOT NULL DEFAULT '',
  `address` varchar(45) NOT NULL DEFAULT '',
  `password` varchar(45) NOT NULL DEFAULT '',
  `pin_code` int(10) unsigned DEFAULT NULL,
  `account_id` int(10) unsigned NOT NULL DEFAULT '0',
  `Gender` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`,`user_name`),
  KEY `FK_user_info_1` (`account_id`),
  CONSTRAINT `FK_user_info_1` FOREIGN KEY (`account_id`) REFERENCES `account_info` (`account_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;