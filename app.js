const express = require("express");
const bodyParser = require("body-parser");
const mysql = require("mysql");
const cookieParser = require("cookie-parser");

const app = express();
const port = 3000;

app.use(bodyParser.urlencoded({
    extended: true
}));

app.use(cookieParser());

// set the user credentials to use the database server
const db = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "YourRootPassword",
    database: "health_app"
});

// connect to database
db.connect((err) => {
    if (err)
    {
        console.log(err);
    }
    else
    {
        console.log("Connected to database."); // success message
    }
});
global.db = db;

require("./routes/main")(app);

app.use(express.static(__dirname + '/views'));
app.use(express.static(__dirname + '/css'));

app.set("view engine", "ejs");
app.engine("html", require("ejs").renderFile);
app.listen(port, () => console.log(`Example app listening at port ${port}!`));
