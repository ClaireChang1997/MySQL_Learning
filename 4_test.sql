SELECT COUNT(*) FROM `employee`;
-- 統計總資料筆數
SELECT COUNT(`sup_id`) FROM `employee`;
-- 看有這個屬性的資料有幾筆 AKA 該隔空白的就不會被計算

SELECT COUNT(*) FROM `employee` WHERE `birth_date` > '1970-01-01' AND `sex` = 'F';
-- 統計所有出生於 1970-01-01 之後的女性員工總數

SELECT AVG(`salary`) FROM `employee`;
-- 取得所有員工的平均薪水
SELECT SUM(`salary`) FROM `employee`;
-- 取得所有員工的薪水總和

SELECT MAX(`salary`) FROM `employee`;
-- 取得薪水最高的員工薪資
SELECT MIN(`salary`) FROM `employee`;
-- 取得薪水最低的員工薪資

------------------

SELECT * FROM `client` WHERE `phone` LIKE '%335';
-- 取得電話號碼是 "xx...xx335" 的顧客
SELECT * FROM `client` WHERE `phone` LIKE '%354%';
-- 取得電話號碼是 "xx..354.xx" 的顧客

SELECT * FROM `client` WHERE `client_name` LIKE 'e%';
-- 取得名稱是 "e"開頭 的顧客

SELECT * FROM `employee` WHERE `birth_date` LIKE '_____12%';
-- 取得生日是 12月 的顧客 
-- 因為我們設定的日期格式，要規定12月的話，會是第六個字元=1，第七個字元=2

------------------

SELECT `name` FROM `employee` UNION SELECT `client_name` FROM `client`;
-- 同時呈現(聯集) 所有的員工名 與 顧客名

SELECT `emp_id`,`name` FROM `employee` UNION SELECT `client_id`,`client_name` FROM `client`;
-- 同時呈現(聯集) 所有的員工ID+名 與 顧客ID+名
SELECT `emp_id` AS `total_id`, `name` AS `total_name` FROM `employee` UNION SELECT `client_id`,`client_name` FROM `client`;
-- 可以在聯集的第一個條件去設定表格的 Title

------------------

SELECT * FROM `employee` JOIN `branch` ON `emp_id` = `manager_id`;
-- 當員工ID=經理ID，就會合併表格並回傳資料 (在這個範例中，員工209及210並沒有主管職，因此不會被回傳)
SELECT `emp_id`,`name`,`branch_name` FROM `employee` JOIN `branch` ON `emp_id` = `manager_id`;
-- 整理出我想要看的資料 AKA 每個部門的主管是誰

SELECT employee.emp_id , employee.`name`, branch.branch_name 
FROM `employee` JOIN `branch` ON `emp_id` = `manager_id`;
-- 如果合併的兩個表格中，有名稱相同的，就要在前面寫清楚這是哪個表格的該屬性
SELECT em.emp_id , em.`name`, br.branch_name 
FROM `employee` AS em JOIN `branch` AS br ON `emp_id` = `manager_id`;
-- 可以使用 AS 來幫表格取簡稱

SELECT `emp_id`,`name`,`branch_name` FROM `employee` LEFT JOIN `branch` ON `emp_id` = `manager_id`;
-- LEFT JOIN 表示 JOIN 左邊表格無論條件有否成立，都會回傳；如果右邊條件成立才會回傳
SELECT `emp_id`,`name`,`branch_name` FROM `employee` RIGHT JOIN `branch` ON `emp_id` = `manager_id`;
-- 反之

------------------

SELECT `manager_id` FROM `branch` WHERE `branch_name` = 'RD';
SELECT `name` FROM `employee` WHERE `emp_id` = 206 ;
-- 原本要透過第一條得到206，才能寫第二條。縣再將這兩個查詢合併
SELECT `name` FROM `employee` WHERE `emp_id` = (
	SELECT `manager_id` FROM `branch` WHERE `branch_name` = 'RD'
    ) ;
    
SELECT `name` FROM `employee` WHERE `emp_id`IN(
	SELECT `emp_id` FROM `work_with` WHERE `total_sales` > 50000
    ) ;
-- 當回傳資料超過一筆時，需要把 "=" 改為 "IN"

------------------

DELETE FROM `employee` WHERE `emp_id` = 207;
SELECT * FROM `branch`;
SELECT * FROM `work_with`;
