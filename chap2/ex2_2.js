//KWEB-assignment-2023-2R Exercise 2.2

const fs = require('fs');
const util = require('util');
const path = require('path');

const readDirectory = util.promisify(fs.readdir);
const readFileStat = util.promisify(fs.stat);

const PATH = '.';

const printFileDirectory = async directory => {
    const files = await readDirectory(directory);
    files.forEach(async file => {
        const filePath = path.join(directory, file);
        const stat = await readFileStat(filePath);

        if(stat.isDirectory()) await printFileDirectory(filePath);//여전히 Directory면
        else if (path.extname(filePath) == '.js') console.log(filePath);
        
    });
};

(async () =>{
    try{
        await printFileDirectory(PATH);
    } catch (err){
        console.error(err);
    }
})(); //괄호 조심하기

//•fs (File System):readdir,stat,stats.isDirectory 
//• path: extname, join
