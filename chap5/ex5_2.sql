--1
SELECT `users`.`id`, `users`.`name`, `seat_number` FROM `tickets`
    INNER JOIN `users` ON `users`.`id` = `tickets`.`user` AND `tickets`.`train` = 11
    ORDER BY `tickets`.`seat_number`;

--2
--각 사용자의 id, name, trains_count, total_distance
--총 거리의 내림차순으로 상위 6명 조회
SELECT `users`.`id`, `users`.`name`, Count(*) AS `trains_count`, Sum(`trains`.`distance`) / 10 AS `total_distance` FROM `tickets`
    INNER JOIN `trains` ON `trains`.`id` = `tickets`.`train`
    INNER JOIN `users` ON `users`.`id` = `tickets`.`user`
    GROUP BY `users`.`id` ORDER BY `total_distance` DESC LIMIT 6;

--3 
--각 노선의 id, 열차 종류type, src_stn, dst_stn, travel_time을 
--travel_time 기준으로 상의 6명만 조회
SELECT `trains`.`id`, `types`.`name` AS `type`, `src`.`name` AS `src_stn`,
    `dest`.`name` AS `dst_stn`, Timediff(`trains`.`arrival`, `trains`.`departure`) AS `travel_time`
    FROM `trains`
    INNER JOIN `types` ON `types`.`id` = `trains`.`type`
    INNER JOIN `stations` AS `src` ON `src`.`id` = `trains`.`source`
    INNER JOIN `stations` AS `dest` ON `dest`.`id` = `trains`.`destination`
    ORDER BY `travel_time` DESC LIMIT 6;

--4
--각 노선의 열차종류 type, src_stn, dst_stb, 출발시각 departure, 도착시각arrival, 운임 fare
--출발시각의 오름차순으로 조회
SELECT `types`.`name` AS `type`, `src`.`name` AS `src_stn`, `dest`.`name` AS `dst_stn`,
    `trains`.`departure`, `trains`.`arrival`, Round(`types`.`fare_rate` * (`trains`.`distance` / 1000), -1) as `fare`
    FROM `trains`
    INNER JOIN `types` ON `types`.`id` = `trains`.`type`
    INNER JOIN `stations` AS `src` ON `src`.`id` = `trains`.`source`
    INNER JOIN `stations` AS `dest` ON `dest`.`id` = `trains`.`destination`
    ORDER BY `departure`;

--5
--각 노선의 id, type, src_stn, dst_stn, 예매된 자석수 occupied,
--최대 좌석 수 maximum, 을 노선 id의 오름차순순으로 모두 조회
--but 예매한 사용자가 없는 노선은 제외
SELECT `trains`.`id`, `types`.`name` AS `type`, `src`.`name` AS `src_stn`, `dest`.`name` AS `dst_stn`,
    Count(*) AS `occupied`, `types`.`max_seats` AS `maximum`
    FROM `tickets`
    INNER JOIN `trains` ON `trains`.`id` = `tickets`.`train`
    INNER JOIN `types` ON `types`.`id` = `trains`.`type`
    INNER JOIN `stations` AS `src` ON `src`.`id` = `trains`.`source`
    INNER JOIN `stations` AS `dest` ON `dest`.`id` = `trains`.`destination`
    GROUP BY `tickets`.`train`
    ORDER BY `trains`.`id`;

--6
--각 노선의 id, type, src_stn, dst_stn, 예매된 자석수 occupied,
--최대 좌석 수 maximum, 을 노선 id의 오름차순순으로 모두 조회
--but 예매한 사용자가 없는 노선도 포함
SELECT `trains`.`id`, `types`.`name` AS `type`, `src`.`name` AS `src_stn`, `dest`.`name` AS `dst_stn`,
    Count(*) AS `occupied`, `types`.`max_seats` AS `maximum`
    FROM `tickets`
    RIGHT JOIN `trains` ON `trains`.`id` = `tickets`.`train`
    INNER JOIN `types` ON `types`.`id` = `trains`.`type`
    INNER JOIN `stations` AS `src` ON `src`.`id` = `trains`.`source`
    INNER JOIN `stations` AS `dest` ON `dest`.`id` = `trains`.`destination`
    GROUP BY `tickets`.`train`
    ORDER BY `trains`.`id`;