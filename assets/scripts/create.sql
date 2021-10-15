CREATE TABLE tasks (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title VARCHAR(50),
  description VARCHAR(250),
  deadline VARCHAR(10),
  status INTEGER
);