//KWEB-assignment-2023-2R Exercise 3.3

const express = require('express');
const app = express();
const port = 3000;
let multiNum = 1;

app.get('/factorial', (req, res)=> {
    const {number} = req.query;
    return res.redirect(`/factorial/${number}`);
});

app.get('/factorial/:number', (req,res)=>{
    const {number} = req.params;
    const factNum = parseInt(number);
    multiNum = 1;
    for(let i = 1; i <= factNum; i++) multiNum *= i;

    return res.send(`${factNum}! = ${multiNum}`);//factorial 값
});
//console.log(`${multiNum}`);
app.listen(port, () => console.log(`Server listening on port ${port}!`));

//be cautious to use ` then '