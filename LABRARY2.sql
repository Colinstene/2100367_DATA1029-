CREATE DATABASE Library2;
DROP DATABASE IF EXISTS library;
USE library2;

CREATE TABLE jobs (
    job_id tinyint(11) NOT NULL,
    job_desc varchar(200) DEFAULT NULL,
    min_lvl enum('STAGIAIRE','JUNIOR','INTERMEDIARE','SEINIOR') DEFAULT NULL,
    max_lvl enum('STAGIAIRE','JUNIOR','INTERMEDIARE','SEINIOR') DEFAULT NULL,
    PRIMARY KEY (job_id)
);

CREATE TABLE publishers (
    pub_id tinyint(11) NOT NULL,
    pub_name varchar(50) DEFAULT NULL,
    city varchar(50) DEFAULT NULL,
    state varchar(50) DEFAULT NULL,
    country varchar(50) DEFAULT NULL,
    email varchar(50),
    PRIMARY KEY (pub_id)
);

CREATE TABLE employees (
    emp_id tinyint(11) NOT NULL,
    emp_name varchar(50),
    fname varchar(50) DEFAULT NULL,
    lname varchar(50) DEFAULT NULL,
    job_id smallint(11),
    job_lvl enum('STAGIAIRE','JUNIOR','INTERMEDIARE','SEINIOR') DEFAULT NULL,
    pub_id tinyint(11) DEFAULT NULL,
    pub_date date DEFAULT NULL,
    email varchar(50),
    salary smallint,
    PRIMARY KEY (emp_id),
    FOREIGN KEY (job_id) REFERENCES jobs(job_id),
    FOREIGN KEY (pub_id) REFERENCES publishers(pub_id)
);

CREATE TABLE authors (
    au_id tinyint(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    au_lname varchar(50) NOT NULL,
    au_fname varchar(50) NOT NULL,
    phone varchar(50) NOT NULL,
    address varchar(50) NOT NULL,
    city varchar(50) NOT NULL,
    zip varchar(10) NOT NULL,
    contract varchar(50) NOT NULL
);

CREATE TABLE sales (
    store_id tinyint(11) NOT NULL,
    ord_num int(11) NOT NULL,
    title_id tinyint(11) NOT NULL,
    order_date datetime DEFAULT NULL,
    qty int(255) DEFAULT NULL,
    PRIMARY KEY (store_id, ord_num, title_id),
    FOREIGN KEY (title_id) REFERENCES titles(title_id)
);

CREATE TABLE stores (
    stor_id tinyint(11) NOT NULL,
    stor_name varchar(50) DEFAULT NULL,
    stor_address varchar(50) DEFAULT NULL,
    city varchar(50) DEFAULT NULL,
    state varchar(50) DEFAULT NULL,
    country varchar(50) DEFAULT NULL,
    PRIMARY KEY (stor_id)
);

CREATE TABLE titles (
    title_id tinyint(11) NOT NULL,
    title_type enum("Roman", "Politique", "Science", "Histoire") DEFAULT NULL,
    pub_id smallint(11) DEFAULT NULL,
    price float DEFAULT NULL,
    advance float DEFAULT NULL,
    notes varchar(255) DEFAULT NULL,
    pub_date date DEFAULT NULL,
    PRIMARY KEY (title_id),
    FOREIGN KEY (pub_id) REFERENCES publishers(pub_id)
);

CREATE TABLE Redaction (
    au_id tinyint(11),
    title_id tinyint(10) NOT NULL,
    royalty float(10) NULL,
    FOREIGN KEY (au_id) REFERENCES authors(au_id),
    FOREIGN KEY (title_id) REFERENCES titles(title_id)
);

