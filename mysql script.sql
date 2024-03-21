-- create table
CREATE TABLE `employee_db`.`employee`(
 `id` int not null AUTO_INCREMENT,
  `name` varchar(45) default null,
  `email` varchar(120) default null,
  primary key(`id`)
)ENGINE=InnoDB AUTO_INCREMENT=0 default charset=utf8mb4 collate=utf8mb4_bg_0900_ai_ci;

-- insert 4 employee
LOCK TABLES `employee_db`.`employee` WRITE;
INSERT INTO `employee_db`.`employee` VALUES
(1,'navya','navya@gmail.com'),
(2,'bavya','bavya@gmail.com'),
(3,'savya','savya@gmail.com'),
(4,'mavya','mavya@gmail.com'),
(5,'lavya','lavya@gmail.com');
UNLOCK TABLES;

-- stored procedure - execute withing create procedure window
CREATE PROCEDURE `employee_db`.`usp_employee_add_or_edit` (
IN _id int,
IN _Name varchar(45),
IN _email varchar(250)
)
BEGIN
	IF _id = 0 THEN
		INSERT INTO employees(name,email)
		VALUES (_name,_email);
        
	ELSE
		UPDATE employees
        SET name = _name,
		email = _email,
        WHERE id = _id;
	END IF;
    
    SELECT ROW_COUNT() AS 'affectedRows';
END