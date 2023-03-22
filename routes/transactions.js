var express = require('express');
var router = express.Router();
var database = require('./connect');

//GET TRANSACTION HEADER
router.get('/theader', function (req, res, next) {
  const q = "select * from transactionheader"
  database.query(q, (error, result) => {
    if (error) {
      error = "an Error occured";
      throw (error);
      // res.send("an error occured")
    }
    res.send(result);
  })

});

//GET TRANSACTION DETAIL
router.get('/tdetail', function (req, res, next) {
    const q = "select * from transactiondetail"
    database.query(q, (error, result) => {
      if (error) {
        error = "an Error occured";
        throw (error);
        // res.send("an error occured")
      }
      res.send(result);
    })
  
  });

//POST TRANSACTION HEADER
router.post('/TransactionHeaderPost', (req, res) => {
    const data = req.body
    const q = `insert into transactionheader (totalHarga, userID)
                values ('${data.totalHarga}', '${data.userID}')`
  
    database.query(q, (error, result) => {
      if (error) {
        throw error
      }
      res.send(result)
    }) 
  })

//POST TRANSACTION DETAIL
router.post('/TransactionDetailPost', (req, res) => {
  const data = req.body
  const q = `insert into transactiondetail (metode)
              values ('${data.metode}')`
  database.query(q, (error, result) => {
    if (error) {
      throw error
    }
    res.send(result)
  }) 
})


module.exports = router;
