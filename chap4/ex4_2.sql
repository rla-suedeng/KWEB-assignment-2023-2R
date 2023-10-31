/*
table : users
기본 키 user_id
사용자 아이디 user_name : VC(20)
사용자 비밀번호 user_pw : VC(20)
사용자 닉네임 user_nick : VC(20)
프로필 사진 링크 profile_link: VC(100)
프로필 상태 메시지 profile_status: VC(60)
탈퇴 여부 secession : TINYINT(1) 기본 1
가입 날짜 join_date : DATE
*/
CREATE TABLE `users` (
    `user_id` INT NOT NULL AUTO_INCREMENT,
    `user_pw` VARCHAR(32) NOT NULL,
    `user_name` VARCHAR(20) NOT NULL,
    `user_nick` VARCHAR(20) NOT NULL,
    `profile_link` VARCHAR(128) NOT NULL,
    `profile_status` VARCHAR(128) NOT NULL,
    `user_secession` TINYINT(1) NOT NULL DEFAULT 0,
    `join_date` DATETIME NOT NULL,
    PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/* 
table : channels
channel_id : primary key
name : VC(20)
channel_user(foreign key):VC(20)
channel_link:VC(100)
maximum_capacity: INT
channel_secession : TINYINT(1)
generate_date : DATE 
*/
CREATE TABLE `channels` (
    `channel_id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(128) NOT NULL,
    `channel_user` INT NOT NULL,
    `channel_link` VARCHAR(100) NOT NULL,
    `maximum_capacity` INT NOT NULL,
    `channel_secession` TINYINT(1) NOT NULL DEFAULT 0,
    `generate_date` DATETIME NOT NULL,
    PRIMARY KEY (`channel_id`),
    FOREIGN KEY (`channel_user`) REFERENCES `users`(`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/* 
table : chats
primary id : chat
context : text
chat_id: int (foreign key user_id in users)
chat_channel : vc(20) (foreign key name in channels)
chat_generate_date : date
*/

CREATE TABLE `chats` (
    `chat_id` INT NOT NULL AUTO_INCREMENT,
    `chat_channel` INT NOT NULL,
    `chat_user` INT NOT NULL,
    `chat_context` TEXT NOT NULL,
    `chat_generate_date` DATETIME NOT NULL,
    PRIMARY KEY (`chat_id`),
    FOREIGN KEY (`chat_channel`) REFERENCES `channels`(`channel_id`) ON DELETE CASCADE,
    FOREIGN KEY (`chat_user`) REFERENCES `users`(`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/* 
table : follows
primary id : follow_id : int
followee : int (foreign key) users_id
follower : int (foreign key) users_id
follow_date : DATETIME 
*/

CREATE TABLE `follows` (
    `follow_id` INT NOT NULL AUTO_INCREMENT,
    `followee` INT NOT NULL,
    `follower` INT NOT NULL,
    `follow_date` DATETIME NOT NULL,
    PRIMARY KEY (`follow_id`),
    FOREIGN KEY (`followee`) REFERENCES `users`(`user_id`) ON DELETE CASCADE,
    FOREIGN KEY (`follower`) REFERENCES `users`(`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/* 
table : blocks
primary id : block_id : int
blocked_user : int (foreign key) users_id
block_user : int (foreign key) users_id
block_date : DATETIME 
*/

CREATE TABLE `blocks` (
    `block_id` INT NOT NULL AUTO_INCREMENT,
    `blocked_you` INT NOT NULL,
    `block_user` INT NOT NULL,
    `block_date` DATETIME NOT NULL,
    PRIMARY KEY (`block_id`),
    FOREIGN KEY (`blocked_you`) REFERENCES `users`(`user_id`) ON DELETE CASCADE,
    FOREIGN KEY (`block_user`) REFERENCES `users`(`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;