module.exports = function(app) {
  // render the home page
  app.get("/", (req, res) => {
    // check if user is already signed in
    if(req.cookies.name == null)
    {
      res.render("index.html", {showAlert: false})
    }
    else
    {
      res.render("phome.html", {userName: req.cookies.name}); // render the home page
    }
  });

  // render the medical form page
  app.get("/medicalForm", (req, res) => res.render("medicalForm.html"));

  // render the book appointments page
  app.get("/bookAppointment", (req, res) => {
    // take the user name from the browser cookies and extract the first and last name
    var name = req.cookies.name;
    var array = name.split(' ');
    var fname = array[0];
    var lname = array[1];
    // pass the first and last name as ejs parameters to the bookAppointment page
    res.render("bookAppointment.html", {fname: fname, lname: lname});
  });

  // render the view appointments page
  app.get("/viewAppointments", (req, res) => {
    var name = req.cookies.name;
    var nameRecord = [name];
    // query to get user appointment details from the database
    var query = "SELECT appointment_id, type, date_time, status FROM appointments WHERE name = ?;";

    db.query(query, nameRecord, (err, result) => {
      if (err)
      {
        console.log(err.message);
      }
      else
      {
        var details = result;
        res.render("viewAppointments.html", {details: result})
      }
    })
  });

  // render the manage appointments page
  app.get("/manageAppointment", (req, res) => {
    var name = req.cookies.name;
    var nameRecord = [name];
    // query to get user appointment details from the database
    var query = "SELECT appointment_id, type, date_time, status FROM appointments WHERE name = ?;";

    db.query(query, nameRecord, (err, result) => {
      if (err)
      {
        console.log(err.message);
      }
      else
      {
        var details = result;
        res.render("manageAppointments.html", {details: result})
      }
    })
  });

  // render the reschedule appointments page
  app.get("/rescheduleAppointment", function (req, res) {
    var appointmentId = req.query.buttonId;
    var idRecord = [appointmentId];
    // query to get all the user appointment details from the database
    var query = "SELECT * FROM appointments WHERE appointment_id = ?;";

    db.query(query, idRecord, function (error, data) {
      if (error) {
        console.log(error.message);
      } else {
        res.render("rescheduleAppointment.html", { data: data[0] });
      }
    });
  });

  // render the cancel appointment page
  app.get("/cancelAppointment", (req, res) => {
    var idRecord = [req.query.buttonId];
    // query to get user appointment details from the database
    var query = "SELECT * FROM appointments WHERE appointment_id = ?;";

    db.query(query, idRecord, (err, result) => {
      if (err)
      {
        console.log(err.message);
      }
      else
      {
        res.render("cancelAppointment.html", {details: result[0]});
      }
    })
  });

  // render the emergency appointment page
  app.get("/emergencyAppointment", (req, res) => {
    res.render("emergencyPage.html");
  });

  // render the user's medical record page
  app.get("/medicalRecord", (req, res) => {
    var name = req.cookies.name;
    var nameRecord = [name];
    // query to get user personal details from the database
    var personalQuery = "SELECT name, age, gender, date_of_birth, address FROM personal_data WHERE name = ?;";
    // query to get user medical details from the database
    var medicalQuery = "SELECT family_conditions FROM medical_info WHERE name = ?;";

    // if the first query is successful, then run the second query and pass all the data
    // from the database into the medical records page
    db.query(personalQuery, nameRecord, (err, result) => {
      if (err)
      {
        console.log(err.message);
      }
      else
      {
        db.query(medicalQuery, nameRecord, (err, medicalData) => {
          if (err)
          {
            console.log(err.message);
          }
          else
          {
            res.render("medicalRecords.html", {details: result[0], data: medicalData[0]})
          }
        })
      }
    })
  });

  // delete user's cookie from browser when they log out
  app.get("/logOut", (req, res) => {
    res.clearCookie('name', {domain: 'localhost', path: "/"});
    res.redirect("/");
  });

  // register a new user
  app.post('/registered', (req, res, next) => {
    var name = req.body.fname + " " + req.body.lname;
    var email = req.body.email;
    var password = req.body.password;
    var userCredentials = [name, email, password];
    // query to insert user details into the database
    var query = "INSERT INTO existing_users (name, email, password) VALUES(?,?,?);";

    db.query(query, userCredentials, (err) => {
      if (err) {
        console.log(err.message);
      }
      else
      {
        // create a secure cookie to remember the user who signed in
        res.cookie('name', name, {
        maxAge: 500000, // cookie age before expiry
        secure: false,
        httpOnly: true,
        sameSite: 'lax'
    });
        res.render("signupMedicalForm.html");
      }
    });
  });

  // authenticate a user who is logging in
  app.post("/submitLogin", (req, res) => {
    var userName = req.body.name;
    var password = req.body.password;
    var credRecord = [userName, password];
    // query to authenticate a user who is logging in by checking the credentials
    var query = "SELECT name from existing_users WHERE name = ? AND password = ?;";

    db.query(query, credRecord, (err, result) => {
      if(err)
      {
        console.log(err.message);
      }
      else
      {
        // if user is authenticated one render the home page and store a cookie
        if(result != "")
        {
          res.cookie('name', userName);
          res.render("phome.html", {userName: userName});
        }
        // pass incorrect user details alert parameters
        else
        {
          res.render("index.html", {showAlert: true});
        }
      }
    })
  });

  // allow the user to book a new appointment
  app.post("/bookedAppointment", (req, res) => {
    var name = req.body.fname + " " + req.body.lname;
    var number = req.body.number;
    var dateAndTime = req.body.c_date + " " + req.body.time;
    var reason = req.body.reason;

    var appointmentRecord = [name, number, dateAndTime, reason, "Confirmed"];
    // query to insert user appointment details into the database
    var insertQuery = "INSERT INTO appointments (name, phone_number, date_time, type, status) VALUES (?, ?, ?, ?, ?);";

    db.query(insertQuery, appointmentRecord, (err) => {
      if (err)
      {
        console.log(err.message);
      }
      else
      {
        // render the booking confirmation page
        res.render("bookingConfirmation.html", { service: reason, dateAndTime: dateAndTime });
      }
    });

  });

  // reschedule the user's appointment
  app.post("/rescheduleAppointment", function (req, res) {
      // query to update user appointment details details in the database
      let sqlquery =
        "UPDATE appointments SET phone_number = ?, date_time = ? WHERE appointment_id = ?";
      let id = req.body.appointment_id;
      let date_time = req.body.c_date + " " + req.body.time;

      let newrecord = [
        req.body.number,
        date_time,
        id
      ];
      // if first query is successful, then execute the second query
      db.query(sqlquery, newrecord, (err) => {
        if (err)
        {
          console.log(err.message);
        }
        else
        {
          // query to search user appointment details from the database
          let query = "SELECT * FROM appointments WHERE appointment_id = ?;";
          let idRecord = [id];
          db.query(query, idRecord, function (error, data) {
            if (error)
            {
              console.log(error.message);
            } else
            {
              res.render("rescheduleConfirmation.html", { appointment: data[0] });
            }
          });
        }
      });
    });

    // allow the user to cancel an appointment
    app.post("/cancelAppointment", (req, res) => {
      var idRecord = [req.body.buttonId];
      // query to search user appointment details into the database
      var searchQuery =  "SELECT * FROM appointments WHERE appointment_id = ?;";

      db.query(searchQuery, idRecord, (err, result) => {
        if (err)
        {
          console.log(err.message);
        }
        else
        {
          // pass the cancelled appointment details to the user
          res.render("cancelConfirmation.html", {details: result[0]});
        }
      })
      // query to delete user's appointment from the database
      var deleteQuery = "DELETE FROM appointments WHERE appointment_id = ?;";

      db.query(deleteQuery, idRecord, (err) => {
        if (err)
        {
          console.log(err.message);
        }
      })
    });

    // medical form post to database
    app.post("/submittedMedicalForm", (req, res,next) => {
    // Insert into personal_data db
      var name = req.cookies.name;
      var age = req.body.age;
      var nationality = req.body.nationality;
      var phone = req.body.phone;
      var emergent = req.body.emergencyNum;
      var gender = req.body.gender;
      var birth = req.body.birthDate;
      var address = req.body.address;
      var userInfo = [name, phone , address , emergent, nationality, age, birth, gender];
      var query = "INSERT INTO personal_data (name, phone_number, address, emergency_contact, nationality, age, date_of_birth, gender) VALUES(?,?,?,?,?,?,?,?);";

      // Insert into medical_info db
      var familyHistory = req.body.familyHistory;
      var medication = req.body.medications;
      var allergies = req.body.allergies;
      var vaccination = req.body.vaccination;
      var moreMedicalInfo = req.body.moreInfo;
      var medicalInfo = [name, familyHistory, medication, allergies, vaccination, moreMedicalInfo];
      var mquery = "INSERT INTO medical_info (name, family_conditions, medication, medical_allergies, covid_vaccinedoses, pastmedical_healthconditions) VALUES(?,?,?,?,?,?);";

      // if first query is successful, then execute the next query
      db.query(query, userInfo, (err) => {
        if (err) {
          console.log(err.message);
        } else {
          db.query(mquery, medicalInfo, (err) => {
            if (err) {
              console.log(err.message);
            } else {
              // render the home page to the user
              res.render("phome.html", {userName: name});
            }
          });
        }
      });
    });

  };
