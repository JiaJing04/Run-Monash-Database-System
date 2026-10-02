// *****PLEASE ENTER YOUR DETAILS BELOW*****
// T6-rm-mongo.mongodb.js

// Student ID: 33589739
// Student Name: Hew Jia Jing

// Comments for your marker:

// ===================================================================================
// DO NOT modify or remove any of the comments below (items marked with //)
// ===================================================================================

// Use (connect to) your database - you MUST update xyz001
// with your authcate username

use("jhew0010");

// (b)
// PLEASE PLACE REQUIRED MONGODB COMMAND TO CREATE THE COLLECTION HERE
// YOU MAY PICK ANY COLLECTION NAME
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer

// Drop collection

db.team_collection.drop();

// Create collection and insert documents

db.team_collection.insertMany([

  {"_id":1,"carn_name":"RM Spring Series Clayton 2024","carn_date":"22-Sep-2024","team_name":"TEAM A","team_leader":{"name":"Jia Jing Hew","phone":"1234567890","email":"jiajing@gmail.com"},"team_no_of_members":5,"team_members":[{"competitor_name":"Jia Jing Hew","competitor_phone":"1234567890","event_type":"5 Km Run","entry_no":1,"starttime":"09:30:08","finishtime":"10:45:12","elapsedtime":"01:15:04"},{"competitor_name":"Max Chong","competitor_phone":"6234567894","event_type":"10 Km Run","entry_no":2,"starttime":"-","finishtime":"-","elapsedtime":"-"},{"competitor_name":"Queenie Teh","competitor_phone":"6234567893","event_type":"10 Km Run","entry_no":1,"starttime":"08:30:03","finishtime":"09:49:04","elapsedtime":"01:19:01"},{"competitor_name":"Xiao Qian Boon","competitor_phone":"4234567890","event_type":"5 Km Run","entry_no":4,"starttime":"09:30:01","finishtime":"10:49:03","elapsedtime":"01:19:02"},{"competitor_name":"Ming Er Chok","competitor_phone":"3234567890","event_type":"5 Km Run","entry_no":3,"starttime":"09:30:11","finishtime":"10:49:11","elapsedtime":"01:19:00"}]},
  {"_id":2,"carn_name":"RM Spring Series Clayton 2024","carn_date":"22-Sep-2024","team_name":"TEAM B","team_leader":{"name":"Yue Hua Chow","phone":"2234567890","email":"yuehua@gmail.com"},"team_no_of_members":5,"team_members":[{"competitor_name":"Yue Hua Chow","competitor_phone":"2234567890","event_type":"5 Km Run","entry_no":2,"starttime":"09:30:05","finishtime":"10:49:15","elapsedtime":"01:19:10"},{"competitor_name":"Brandon Lee","competitor_phone":"6234567895","event_type":"10 Km Run","entry_no":3,"starttime":"08:30:34","finishtime":"09:44:45","elapsedtime":"01:14:11"},{"competitor_name":"Jolin Cai","competitor_phone":"6234567892","event_type":"5 Km Run","entry_no":7,"starttime":"-","finishtime":"-","elapsedtime":"-"},{"competitor_name":"Celine Kang","competitor_phone":"6234567891","event_type":"5 Km Run","entry_no":6,"starttime":"-","finishtime":"-","elapsedtime":"-"},{"competitor_name":"Jia Ming Wah","competitor_phone":"5234567890","event_type":"5 Km Run","entry_no":5,"starttime":"09:30:02","finishtime":"10:49:02","elapsedtime":"01:19:00"}]},
  {"_id":3,"carn_name":"RM Autumn Series Clayton 2025","carn_date":"15-Mar-2025","team_name":"Hello","team_leader":{"name":"Queenie Teh","phone":"6234567893","email":"queenie@gmail.com"},"team_no_of_members":3,"team_members":[{"competitor_name":"Celine Kang","competitor_phone":"6234567891","event_type":"3 Km Community Run/Walk","entry_no":1,"starttime":"08:00:25","finishtime":"09:19:50","elapsedtime":"01:19:25"},{"competitor_name":"Queenie Teh","competitor_phone":"6234567893","event_type":"3 Km Community Run/Walk","entry_no":3,"starttime":"08:00:20","finishtime":"09:13:22","elapsedtime":"01:13:02"},{"competitor_name":"Jolin Cai","competitor_phone":"6234567892","event_type":"3 Km Community Run/Walk","entry_no":2,"starttime":"08:00:10","finishtime":"09:19:42","elapsedtime":"01:19:32"}]},
  {"_id":4,"carn_name":"RM Spring Series Caulfield 2024","carn_date":"05-Oct-2024","team_name":"TEAM D","team_leader":{"name":"Yue Hua Chow","phone":"2234567890","email":"yuehua@gmail.com"},"team_no_of_members":3,"team_members":[{"competitor_name":"Yue Hua Chow","competitor_phone":"2234567890","event_type":"5 Km Run","entry_no":2,"starttime":"09:00:07","finishtime":"10:11:17","elapsedtime":"01:11:10"},{"competitor_name":"Queenie Teh","competitor_phone":"6234567893","event_type":"10 Km Run","entry_no":1,"starttime":"08:30:14","finishtime":"09:42:18","elapsedtime":"01:12:04"},{"competitor_name":"Jia Ming Wah","competitor_phone":"5234567890","event_type":"5 Km Run","entry_no":5,"starttime":"09:00:12","finishtime":"10:19:13","elapsedtime":"01:19:01"}]},
  {"_id":5,"carn_name":"RM Spring Series Caulfield 2024","carn_date":"05-Oct-2024","team_name":"Team A","team_leader":{"name":"Jia Jing Hew","phone":"1234567890","email":"jiajing@gmail.com"},"team_no_of_members":7,"team_members":[{"competitor_name":"Jia Jing Hew","competitor_phone":"1234567890","event_type":"5 Km Run","entry_no":1,"starttime":"09:00:05","finishtime":"10:19:06","elapsedtime":"01:19:01"},{"competitor_name":"Emily Tan","competitor_phone":"9234567893","event_type":"21.1 Km Half Marathon","entry_no":2,"starttime":"08:00:11","finishtime":"09:32:13","elapsedtime":"01:32:02"},{"competitor_name":"Marcus Chan","competitor_phone":"9234567892","event_type":"21.1 Km Half Marathon","entry_no":1,"starttime":"08:00:23","finishtime":"09:22:34","elapsedtime":"01:22:11"},{"competitor_name":"Brandon Lee","competitor_phone":"6234567895","event_type":"10 Km Run","entry_no":3,"starttime":"-","finishtime":"-","elapsedtime":"-"},{"competitor_name":"Max Chong","competitor_phone":"6234567894","event_type":"10 Km Run","entry_no":2,"starttime":"08:30:34","finishtime":"09:42:45","elapsedtime":"01:12:11"},{"competitor_name":"Xiao Qian Boon","competitor_phone":"4234567890","event_type":"5 Km Run","entry_no":4,"starttime":"09:00:23","finishtime":"10:11:34","elapsedtime":"01:11:11"},{"competitor_name":"Ming Er Chok","competitor_phone":"3234567890","event_type":"5 Km Run","entry_no":3,"starttime":"09:00:08","finishtime":"10:13:39","elapsedtime":"01:13:31"}]},
  {"_id":6,"carn_name":"RM Summer Series Caulfield 2025","carn_date":"02-Feb-2025","team_name":"We Can","team_leader":{"name":"Jia Jing Hew","phone":"1234567890","email":"jiajing@gmail.com"},"team_no_of_members":3,"team_members":[{"competitor_name":"Jia Jing Hew","competitor_phone":"1234567890","event_type":"3 Km Community Run/Walk","entry_no":1,"starttime":"08:30:10","finishtime":"09:41:19","elapsedtime":"01:41:09"},{"competitor_name":"Xiao Qian Boon","competitor_phone":"4234567890","event_type":"3 Km Community Run/Walk","entry_no":4,"starttime":"08:30:12","finishtime":"09:54:23","elapsedtime":"01:24:11"},{"competitor_name":"Ming Er Chok","competitor_phone":"3234567890","event_type":"3 Km Community Run/Walk","entry_no":3,"starttime":"08:30:22","finishtime":"09:34:44","elapsedtime":"01:04:22"}]},
  {"_id":7,"carn_name":"RM Summer Series Caulfield 2025","carn_date":"02-Feb-2025","team_name":"We Believe","team_leader":{"name":"Yue Hua Chow","phone":"2234567890","email":"yuehua@gmail.com"},"team_no_of_members":4,"team_members":[{"competitor_name":"Yue Hua Chow","competitor_phone":"2234567890","event_type":"3 Km Community Run/Walk","entry_no":2,"starttime":"08:30:23","finishtime":"09:44:45","elapsedtime":"01:44:22"},{"competitor_name":"Sophia Ng","competitor_phone":"9234567891","event_type":"5 Km Run","entry_no":2,"starttime":"08:30:37","finishtime":"09:34:38","elapsedtime":"01:14:01"},{"competitor_name":"Brandon Lee","competitor_phone":"6234567895","event_type":"5 Km Run","entry_no":1,"starttime":"08:30:34","finishtime":"09:40:45","elapsedtime":"01:10:11"},{"competitor_name":"Jia Ming Wah","competitor_phone":"5234567890","event_type":"3 Km Community Run/Walk","entry_no":5,"starttime":"08:30:45","finishtime":"09:41:55","elapsedtime":"01:11:10"}]}

]);

// List all documents you added

db.team_collection.countDocuments();

db.team_collection.find();

// (c)
// PLEASE PLACE REQUIRED MONGODB COMMAND/S FOR THIS PART HERE
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer

db.team_collection.find(
  {
    "$or": [
      {
        "team_members.event_type": /.*10 K.*/
      },
      {
        "team_members.event_type": /.*5 K.*/
      }
    ]
  },
  { 
    "_id":0, 
    "carn_date": 1, 
    "carn_name": 1, 
    "team_name": 1, 
    "team_leader.name": 1 
  }
);



// (d)
// PLEASE PLACE REQUIRED MONGODB COMMAND/S FOR THIS PART HERE
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer


// (i) Add new team

db.team_collection.insertOne({
  "_id": 8,
  "carn_name": "RM WINTER SERIES CAULFIELD 2025",
  "carn_date": "29-Jun-2025",
  "team_name": "The Great Runners",
  "team_leader": {
    "name": "Jackson Bull",
    "phone": "0422412524",
    "email": "jacksonbull@gmail.com"
  },
  "team_no_of_members": 1,
  "team_members": [
    {
      "competitor_name": "Jackson Bull",
      "competitor_phone": "0422412524",
      "event_type": "5 Km Run",
      "entry_no": 105,
      "starttime": "-",
      "finishtime": "-",
      "elapsedtime": "-"
    }
  ]
});


// Illustrate/confirm changes made

db.team_collection.find(
  { "team_name": "The Great Runners", "carn_date": "29-Jun-2025"}
);


// (ii) Add new team member

db.team_collection.updateOne(
  { "team_name": "The Great Runners", "carn_date": "29-Jun-2025"},
  {
    "$push": {
      "team_members": {
        "competitor_name": "Steve Bull",
        "competitor_phone": "0422251427",
        "event_type": "10 Km Run",
        "entry_no": 55,
        "starttime": "-",
        "finishtime": "-",
        "elapsedtime": "-"
      }
    },
    "$inc": { "team_no_of_members": 1 }
  }
);


// Illustrate/confirm changes made


db.team_collection.find(
  { "team_name": "The Great Runners", "carn_date": "29-Jun-2025"},
  { "_id": 0 }
);
