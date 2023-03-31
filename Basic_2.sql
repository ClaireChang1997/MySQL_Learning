-- 創建表格
CREATE TABLE `employee`(
	`emp_id` INT,
    `name` VARCHAR(20) ,
	`birth_date` DATE,
    `sex` VARCHAR(1) ,
	`salary` INT ,
    `branch_id` INT ,
    `sup_id` INT ,
    PRIMARY KEY(`emp_id`)
);

CREATE TABLE `branch`(
	`branch_id` INT,
    `branch_name` VARCHAR(20) ,
    `manager_id` INT ,
    PRIMARY KEY( `branch_id` ),
    FOREIGN KEY ( `manager_id` ) REFERENCES `employee`( `emp_id` ) ON DELETE SET NULL
);

ALTER TABLE `employee` ADD FOREIGN KEY ( `branch_id` ) REFERENCES `branch`( `branch_ID` ) ON DELETE SET NULL;
ALTER TABLE `employee` ADD FOREIGN KEY ( `SUP_id` ) REFERENCES `employee`( `emp_id` ) ON DELETE SET NULL;

CREATE TABLE `client`(
	`client_id` INT,
    `client_name` VARCHAR(20) ,
    `phone` VARCHAR(20) ,
    PRIMARY KEY( `client_id` )
);

CREATE TABLE `work_with`(
	`emp_id` INT,
    `client_id` INT,
    `total_sales` INT ,
    PRIMARY KEY( `emp_id`,`client_id` ),
    FOREIGN KEY ( `emp_id` ) REFERENCES `employee`( `emp_id` ) ON DELETE CASCADE,
    FOREIGN KEY ( `client_id` ) REFERENCES `client`( `client_id` ) ON DELETE CASCADE
);

-- 填入資料（再這邊要注意填入順序，如果有表格間連動的，就需要對應表格已有數據，不然會顯示錯誤）
INSERT INTO `branch` VALUES( 1 ,"RD", NULL );
INSERT INTO `branch` VALUES( 2 ,"Administration", NULL );
INSERT INTO `branch` VALUES( 3 ,"IT", NULL );
INSERT INTO `branch` VALUES( 4 ,"HR", NULL );

INSERT INTO `employee` VALUES( 206 ,"Yel", "1998-10-08", 'F', 50000 , 1 , NULL );
INSERT INTO `employee` VALUES( 207 ,"Gre", "1985-09-16", 'M', 29000 , 2 , 206 );
INSERT INTO `employee` VALUES( 208 ,"Bla", "2000-12-19", 'M', 35000 , 3 , 206 );
INSERT INTO `employee` VALUES( 209 ,"Whi", "1997-01-22", 'F', 39000 , 3 , 207 );
INSERT INTO `employee` VALUES( 210 ,"Blu", "1925-11-10", 'F', 84000 , 1 , 207 );

UPDATE `branch` SET `manager_id` =206 WHERE `branch_id` = 1;
UPDATE `branch` SET `manager_id` =207 WHERE `branch_id` = 2;
UPDATE `branch` SET `manager_id` =208 WHERE `branch_id` = 3;

INSERT INTO `client` VALUES( 400 ,"dogy", "254354335" );
INSERT INTO `client` VALUES( 401 ,"caty", "25633899" );
INSERT INTO `client` VALUES( 402 ,"wonl", "45354345" );
INSERT INTO `client` VALUES( 403 ,"lucy", "54354365" );
INSERT INTO `client` VALUES( 404 ,"eric", "18783783" );

INSERT INTO `work_with` VALUES( 206 , 400 , "70000" );
INSERT INTO `work_with` VALUES( 207 , 401 , "24000" );
INSERT INTO `work_with` VALUES( 208 , 402 , "9800" );
INSERT INTO `work_with` VALUES( 209 , 403 , "24000" );
INSERT INTO `work_with` VALUES( 210 , 404 , "87940" );

SELECT * FROM `employee`;
SELECT * FROM `branch`;
SELECT * FROM `client`;
SELECT * FROM `work_with`;


-- 基礎練習
-- 1. 取得所有員工資料
SELECT * FROM `employee`;
-- 2. 取得所有客戶資料
SELECT * FROM `client`;
-- 3. 按照薪水 低到高取得員工資料
SELECT * FROM `employee` ORDER BY `salary`;
-- 4. 取得薪水前三高的員工
SELECT * FROM `employee` ORDER BY `salary` DESC LIMIT 3;
-- 5. 取得所有員工的名字
SELECT `name` FROM `employee`;

