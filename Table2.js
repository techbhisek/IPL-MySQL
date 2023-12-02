const { createPool } = require('mysql');
const pool = createPool({
  host: 'localhost',
  user: 'root',
  password: 'Abhishek@123',
});
let index = 0;
const data = require('./deliveriesInJson.json');

inserter(data[index]).catch((error) => {
  console.log(error);
});

function inserter(element) {
  return new Promise((resolve, reject) => {
    pool.query(
      `INSERT INTO db.Deliveries values (${index + 1},${
        element.match_id
      },${element.inning},"${element.batting_team}","${
        element.bowling_team
      }",${element.over},${element.ball},"${element.batsman}","${
        element.non_striker
      }","${element.bowler}",${element.is_super_over},${
        element.wide_runs
      },${element.bye_runs},${element.legbye_runs},${
        element.noball_runs
      },${element.penalty_runs},${element.batsman_runs},${
        element.extra_runs
      },${element.total_runs},"${element.player_dismissed}","${
        element.dismissal_kind
      }","${element.fielder}")`,
      (err) => {
        if (err) {
          reject(err);
        } else {
          if (index < data.length) {
            index++;
            inserter(data[index]);
          } else {
            resolve('done');
            console.log('done insertion');
            pool.end();
          }
        }
      }
    );
  });
}
