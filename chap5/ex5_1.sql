--1
--c1이 11이고 c2가 2인 row의 id, c3, c5 조회
SELECT `id`, `c3`, `c5` FROM `crud` WHERE `c1` = 11 AND `c2` = 2;

--2
--c1 > 18 or c2 < 2 모든 column 조회
SELECT * FROM `crud` WHERE `c1` > 18 OR `c2` < 2;

--3
--생성, id, c4 default, c1 = 7, c2 = 4, c3 = "col101", c5 = 0
INSERT INTO `crud` VALUES (DEFAULT, 7, 4, 'col101', DEFAULT, 0);

--4
--생성 id = 103, c1 = 3, c2 =3 , c3 = "col103", c4 = default, c5 = 1
INSERT INTO `crud` VALUES (103, 3, 3, 'col103', DEFAULT, 1);

--5 
--조회 id > 100 모든 column
SELECT * FROM `crud` WHERE `id` > 100;

--6 
--c1 > 4 c1 <9, c2 = 1, 수정 c3 = "col0", c5 = 0;
UPDATE `crud` SET `c3` = 'col0', `c5` = 0 WHERE `c1` > 4 AND `c1` < 9 AND `c2` = 1;

--7
--조회 c1 > 4 c1 <9, c2 = 1,
SELECT * FROM `crud` WHERE `c1` > 4 AND `c1` < 9 AND `c2` = 1;

--8 
-- c5 = 0 row 삭제
DELETE FROM `crud` WHERE `c5` = 0;

--9 
-- c5 = 0 row의 모든 column 조회
SELECT * FROM `crud` WHERE `c5` = 0;

