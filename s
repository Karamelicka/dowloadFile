const fs = require("fs");
const https = require('https');

const fileUr2 = 'https://raw.githubusercontent.com/4nth0nyl1MHC/UK-Scanning-Directory-2019/77136ccadea675af2345a40a0287f93ebe40e51f/UK%20Scanning%20Directory%20-%20January%202019/Various%20Misc%20Files/UK%20Airports%202019%20(VHF%20%26%20UHF)/London%20Swanwick%20Control%202017.txt';
const FilePath = ".\\document.txt";

// HTTP.GET
https.get(fileUr2, (res) => {
  const file = fs.createWriteStream(FilePath);
  res.pipe(file);

  file.on ('finish', () => {
      console.log('Download complete');

      fs.readFile(FilePath, 'utf8', (error, data) => {
        if (error) return console.error(error);
  
        const lines = data.split('\n').length;
        console.log(`The number of lines in the file: ${lines}`);
      });

      file.close();
  });
})
