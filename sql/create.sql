CREATE DATABASE big-five IF NOT EXISTS;

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    dateload DATETIME, /* Timestamp when survey started */
    screenw INT, /* Screen width in pixels */
    screenh INT, /* Screen height in pixels */
    introelapse INT, /* Number of seconds spent on intro page */
    testelapse INT, /* Number of seconds spent taking test */
    endelapse INT, /* Number of seconds spent on finalization page */
    IPC INT, /* Number of responses from this IP */
    country VARCHAR(2), 
    lat FLOAT, /* Approximate latitude of user */
    long FLOAT, /* Approximate longitude of user */
);
CREATE TABLE questions (
    question_id INT PRIMARY KEY, 
    question_text VARCHAR(255),
    trait_category VARCHAR(3) /*3 letter code representing the trait*/
);
CREATE TABLE responses (
    response_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT FOREIGN KEY,
    question_id INT FOREIGN KEY,
    response_value TINYINT, /* User's response on a 1-5 scale */
);
