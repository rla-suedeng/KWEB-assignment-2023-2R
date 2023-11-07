const mysql = require('mysql2/promise');

const pool = mysql.createPool({
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: '1111',
    database: 'chapter5',
});

const runQuery = async (pstmt, data) => {
    const conn = await pool.getConnection();
    try {
        const sql = conn.format(pstmt, data);
        const [result] = await conn.query(sql);
        return result;
    } finally {
        conn.release();
    }
};

module.exports = { runQuery };

// const express = require("express");

// const app = express();
// const port = 3000;

// app.get('/fare', async (req, res, next) => {
//     try {
//         const { uid } = req.query;
//         const sql = 'SELECT `users`.`name`, ' + 
//             'Sum(Round(`types`.`fare_rate` * (`trains`.`distance` / 1000), -2)) AS `totalFare`' +
//             'FROM `tickets`' +
//             'INNER JOIN `users` ON `tickets`.`user` = `users`.`id` AND `users`.`id`= ?' +
//             'INNER JOIN `trains` ON `tickets`.`train` = `trains`.`id`' +
//             'INNER JOIN `types` ON `trains`.`type` = `types`.`id`';
//         const {name, totFare} = (await runQuery(sql, [uid]))[0];
//         return res.send(`Total fare of ${name} is ${totFare} KRW.`);
//     } catch (err) {
//         console.error(err);
//         return res.sendStatus(500);
//     }
// });

// app.get('/train/status', async (req, res, next) => {
//     try {
//         const {tid} = req.query;
//         const sql = 'SELECT Count(*) AS `occupied`, `max_seats` AS `maximum` FROM `tickets` ' +
//             'INNER JOIN `trains` ON `trains`.`id`= `tickets`.`train` AND `trains`.`id`= ? ' +
//             'INNER JOIN types ON trains.type = types.id';
//             const {occupied, maximum} = (await runQuery(sql, [tid]))[0];
//             const isSoldout = occupied > maximum;
//             return res.send(`Train ${tid} is ${isSoldout ? '' : 'not '}sold out`);
//     } catch (err) {
//         console.error(err);
//         return res.sendStatus(500);
//     }
// });

// app.listen(port, () => console.log(`Server listening on port ${port}!`));

