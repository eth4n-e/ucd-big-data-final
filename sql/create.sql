/* Create and begin using database */
CREATE DATABASE IF NOT EXISTS big_five;
USE big_five;

/* Create tables */
CREATE TABLE IF NOT EXISTS user (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    dateload DATETIME, /* Timestamp when survey started */
    screenw INT, /* Screen width in pixels */
    screenh INT, /* Screen height in pixels */
    introelapse INT, /* Number of seconds spent on intro page */
    testelapse INT, /* Number of seconds spent taking test */
    endelapse INT, /* Number of seconds spent on finalization page */
    IPC INT, /* Number of responses from this IP */
    country VARCHAR(2), 
    latitude FLOAT, /* Approximate latitude of user */
    longitude FLOAT /* Approximate longitude of user */
);

CREATE TABLE IF NOT EXISTS question (
    question_id INT PRIMARY KEY, 
    question_text VARCHAR(255),
    trait_category VARCHAR(3) /*3 letter code representing the trait*/
);

CREATE TABLE IF NOT EXISTS response (
    response_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    question_id INT, /* Must create columns before using as foreign key */
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (question_id) REFERENCES question(question_id),
    response_value TINYINT /* User's response on a 1-5 scale */
);
