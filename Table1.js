const { createPool } = require('mysql');
const { resolve } = require('q-io/fs');
const pool = createPool({
  host: 'localhost',
  user: 'root',
  password: 'Abhishek@123',
});
let index = 0;
const data = require('./matchesInJson.json');
inserter(data[index]).catch((error) => {
  console.log(error);
});

function inserter(element) {
  return new Promise((resolve, reject) => {
    pool.query(
      `INSERT INTO db.Matches values (${element.id},${element.season},"${element.city}","${element.date}","${element.team1}","${element.team2}","${element.toss_winner}","${element.toss_decision}","${element.result}",${element.dl_applied},"${element.winner}",${element.win_by_runs},${element.win_by_wickets},"${element.player_of_match}","${element.venue}","${element.umpire1}","${element.umpire2}","${element.umpire3}")`,
      (err) => {
        if (err) {
          console.log(err);
        } else {
          if (index < data.length) {
            index++;
            resolve(data[index]);
          } else {
            resolve('done');
            pool.end();
          }
        }
      }
    );
  }).then((data1) => {
    if (index < data.length) {
      inserter(data1);
    } else {
      console.log('done');
    }
  });
}
