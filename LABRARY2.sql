CREATE DATABASE Library2;
DROP DATABASE IF EXISTS library;
use library2;
CREATE TABLE jobs(
job_id tinyint,
job_desc varchar(100),
min_lvl varchar(50),
max_lvl varchar(50)
);