/*
이름 (name): VC(10)
학번 (student_id): INT (10자)입학연도 ++ 전공 ++ 개별번호
입학 연도 (adimmsion_year): INT
전공 (major): INT
전화번호 (phone_number): VC(13)
주소 (address): TEXT
누적 이수학점 (credit_sum): INT
평균 평점 (averge_grade): double
재학 여부 (attending) : TINYINT(1)
*/
CREATE TABLE  `students` (
    `student_id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(10) NOT NULL,
    `adimmsion_year` INT NOT NULL,
    `major` INT NOT NULL,
    `phone_number` VARCHAR(13) NOT NULL,
    `address` TEXT NOT NULL,
    `credit_sum` INT NOT NULL DEFAULT 0,
    `average_grade` DOUBLE NOT NULL DEFAULT 0.0,
    `attending` TINYINT(1) NOT NULL DEFAULT 0,
    PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;