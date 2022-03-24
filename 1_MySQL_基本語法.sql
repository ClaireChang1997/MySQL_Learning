create database `sql_tutorial` ;
show databases;
use `sql_tutorial` ;

SET SQL_SAFE_UPDATES = 0;

CREATE TABLE `student`(
	`student_id` INT AUTO_INCREMENT,
    `name` VARCHAR(20) ,
	`major` VARCHAR(20) ,
	`score` INT ,
    PRIMARY KEY(`student_id`)
);

INSERT INTO `student`(`name`,`major`,`score`) VALUES("小白","英語",50);
INSERT INTO `student`(`name`,`major`,`score`) VALUES("小黃","生物",90);
INSERT INTO `student`(`name`,`major`,`score`) VALUES("小綠","歷史",70);
INSERT INTO `student`(`name`,`major`,`score`) VALUES("小藍","英語",80);
INSERT INTO `student`(`name`,`major`,`score`) VALUES("小黑","化學",20);

DESCRIBE `student`;
DROP TABLE  `student` ;

UPDATE `student` SET `major`="外文"  WHERE `major`="英語";
UPDATE `student` SET `major`="生物化學"  WHERE `major`="生物" OR `major`="化學";
UPDATE `student` SET `name`="小灰", `major`="物理"  WHERE `student_id`= 3;
UPDATE `student` SET `score`= 80;

DELETE FROM `student` WHERE `name`="小綠" and `major`="歷史";
-- 當name=小綠 且 major=歷史時，刪除資料
DELETE FROM `student` WHERE `score`<60;
-- 當成績低於60時，刪除資料
DELETE FROM `student` ;
-- 刪除整個表格的資料


SELECT * FROM `student`;
-- 取得`student`中的所有資料
SELECT `name`, `student_id` FROM `student`;
-- 只取得`student`中的`name` 以及 `student_id`資料
SELECT * FROM `student` ORDER BY `score`;
-- ORDER BY 預設為由低到高排序 (也可以寫ASC)
SELECT * FROM `student` ORDER BY `score` DESC;
-- 由高到低排序
SELECT * FROM `student` ORDER BY `score`,`student_id`;
-- 先由 Score 進行排序，如果排序相同，就看 student_id 來排序
SELECT * FROM `student`LIMIT 3;
-- 取得`student`中的所有資料，但我只要前三筆
SELECT * FROM `student` ORDER BY `score` DESC LIMIT 3;
-- 取得表格經過分數由高到低排序後的前三筆資料
SELECT * FROM `student` WHERE `major`="英語" OR `major`="生物";
SELECT * FROM `student` WHERE `major` IN ("英語" , "生物");
-- 取得`student`中的所有`major`="英語"或"生物" 的資料
SELECT * FROM `student` WHERE `score`<> 70 and `major`<> "生物";
-- 取得`student`中的所有`major`不為"英語"且成績不等於70 的資料
SELECT DISTINCT `major` FROM `student`;
-- 取得所有不重複的 major

-- 可以與 ORDER BY 或 LIMIT 混用
