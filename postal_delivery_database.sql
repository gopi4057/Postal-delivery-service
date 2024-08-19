-- MySQL Workbench Forward Engineering

-- SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
-- SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
-- SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


-- -----------------------------------------------------
-- Schema postal_delivery
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS postal_delivery;
CREATE SCHEMA postal_delivery DEFAULT CHARACTER SET utf8 ;
USE postal_delivery ;

-- -----------------------------------------------------
-- Table person
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS person (
  pID INT NOT NULL,
  name VARCHAR(45) NULL,
  buildingNo VARCHAR(45) NULL,
  street VARCHAR(45) NULL,
  city VARCHAR(45) NULL,
  pincode CHAR(6) NULL,
  PRIMARY KEY (pID))
ENGINE = InnoDB
COMMENT = '	';

INSERT INTO person VALUES
(1, 'Aarti Patel', '302', 'Gandhi Nagar', 'Chennai', '600001'), (2, 'Alok Gupta', '110', 'MG Road', 'Mumbai', '400001'),
(3, 'Amit Patel', '104', 'Gandhi Nagar', 'Chennai', '600001'), (4, 'Anil Yadav', '109', 'Model Town', 'Lucknow', '226001'),
(5, 'Anita Mishra', '103', 'Church Street', 'Jaipur', '302001'), (6, 'Anjali Gupta', '301', 'Laxmi Nagar', 'Hyderabad', '500001'),
(7, 'Arun Kumar', '208', 'Main Street', 'Bangalore', '560001'), (8, 'Deepa Devi', '104', 'Laxmi Nagar', 'Hyderabad', '500001'),
(9, 'Kiran Reddy', '102', 'Jubilee Road', 'Ahmedabad', '380001'), (10, 'Manisha Singh', '201', 'Gandhi Nagar', 'Chennai', '600001'),
(11, 'Neha Sharma', '203', 'Station Road', 'Delhi', '110001'), (12, 'Pooja Singh', '209', 'MG Road', 'Mumbai', '400001'),
(13, 'Pooja Tiwari', '102', 'Jubilee Road', 'Ahmedabad', '380001'), (14, 'Priya Sharma', '103', 'Model Town', 'Lucknow', '226001'),
(15, 'Rahul Gupta', '202', 'Park Avenue', 'Kolkata', '700001'), (16, 'Rahul Kumar', '209', 'MG Road', 'Mumbai', '400001'),
(17, 'Rajesh Patel', '304', 'Market Street', 'Pune', '411001'), (18, 'Ravi Saxena', '202', 'Laxmi Nagar', 'Hyderabad', '500001'),
(19, 'Reena Gupta', '304', 'Gandhi Nagar', 'Chennai', '600001'), (20, 'Sachin Sharma', '301', 'Church Street', 'Jaipur', '302001'),
(21, 'Sanjay Singh', '105', 'MG Road', 'Mumbai', '400001'), (22, 'Sneha Singh', '206', 'Laxmi Nagar', 'Hyderabad', '500001'),
(23, 'Suresh Kumar', '105', 'Park Avenue', 'Kolkata', '700001'), (24, 'Vikas Mishra', '305', 'Jubilee Road', 'Ahmedabad', '380001'),
(25, 'Vivek Verma', '201', 'Gandhi Nagar', 'Chennai', '600001');

-- -----------------------------------------------------
-- Table pNumber
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS pNumber (
  pID INT NOT NULL,
  phNo DECIMAL(10,0) NOT NULL,
  PRIMARY KEY (pID, phNo),
  CONSTRAINT pID
    FOREIGN KEY (pID)
    REFERENCES person (pID)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

INSERT INTO pNumber (pID, phNo) VALUES 
(1, 7123456789),(2, 8123456789),(2, 9123456780),(3, 9123456789),(3, 8123456799),(4, 6234567891),(5, 8345678901),(5, 9345678902),
(6, 9456789012),(6, 1456789013),(7, 9567890124),(8, 8678901234),(9, 9789012345),(9, 6789012346),(10, 8023456789),(10, 7023456781),
(11, 7134567890),(11, 8134567892),(12, 8245678901),(13, 9356789012),(13, 9356789014),(14, 7467890123),(15, 8578901234),(15, 1578901236),
(16, 9689012345),(16, 2689012347),(17, 1790123458),(18, 8891234567),(18, 2891234569),(19, 9992345678),(20, 8073456789),(20, 1073456782),
(21, 2114567893),(22, 8225678901),(22, 4225678904),(23, 9336789012),(24, 7447890123),(24, 6447890126),(25, 8558901234),(25, 7558901237);

-- -----------------------------------------------------
-- Table branch
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS branch (
  branchID INT NOT NULL,
  buildingNo VARCHAR(45) NULL,
  street VARCHAR(45) NULL,
  city VARCHAR(45) NULL,
  pincode VARCHAR(6) NULL,
  manager INT NULL,
  PRIMARY KEY (branchID),
  INDEX manager_idx (manager ASC) VISIBLE
    )
ENGINE = InnoDB
COMMENT = '					';

INSERT INTO branch VALUES
(1, '123', 'MG Road', 'Mumbai', '400001', 1), (2, '456', 'Station Road', 'Delhi', '110001', 6),
(3, '789', 'Main Street', 'Bangalore', '560001', 11), (4, '1011', 'Gandhi Nagar', 'Chennai', '600001', 16),
(5, '1213', 'Park Avenue', 'Kolkata', '700001', 21), (6, '1415', 'Laxmi Nagar', 'Hyderabad', '500001', 26),
(7, '1617', 'Market Street', 'Pune', '411001', 31), (8, '1819', 'Jubilee Road', 'Ahmedabad', '380001', 36),
(9, '2021', 'Church Street', 'Jaipur', '302001', 41), (10, '2223', 'Model Town', 'Lucknow', '226001', 46);

-- -----------------------------------------------------
-- Table employee
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS employee (
  empID INT NOT NULL,
  Fname VARCHAR(45) default NULL,
  Mname VARCHAR(45) default NULL,
  Lname VARCHAR(45) default NULL,
  DOB DATE default NULL,
  age INT default NULL,
  homeBranch INT default NULL,
  PRIMARY KEY (empID),
  INDEX homeBranch_idx (homeBranch ASC) VISIBLE,
  CONSTRAINT homeBranch_
    FOREIGN KEY (homeBranch)
    REFERENCES branch (branchID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO employee VALUES
(1, 'Priya', 'Singh', 'Kapoor', '1990-01-01', 34, 1), (2, 'Rahul', 'Kumar', 'Sharma', '1992-07-15', 31, 1), (3, 'Kiran', 'Desai', 'Patel', '1988-04-23', 36, 1),
(4, 'Akash', 'Malhotra', 'Mehta', '1995-11-09', 28, 1), (5, 'Anjali', 'Joshi', 'Gupta', '1991-03-05', 33, 1), (6, 'Maya', 'Menon', 'Nair', '1989-05-20', 34, 2),
(7, 'Aditya', 'Das', 'Roy', '1993-09-12', 30, 2), (8, 'Neha', 'Chatterjee', 'Banerjee', '1994-02-28', 30, 2), (9, 'Rohan', 'Kapoor', 'Singh', '1990-12-10', 33, 2),
(10, 'Riya', 'Bajaj', 'Malhotra', '1992-06-04', 31, 2), (11, 'Shiva', 'Iyer', 'Iyer', '1996-08-23', 27, 3), (12, 'Pooja', 'Shah', 'Desai', '1991-10-11', 32, 3),
(13, 'Nikhil', 'Malhotra', 'Khanna', '1987-02-05', 37, 3), (14, 'Ishaan', 'Mehta', 'Jain', '1994-05-14', 29, 3), (15, 'Sonia', 'Agarwal', 'Kapoor', '1989-12-27', 34, 3),
(16, 'Vikram', 'Singh', 'Chauhan', '1985-06-18', 38, 4), (17, 'Swati', 'Das', 'Bose', '1992-04-09', 32, 4), (18, 'Abhinav', 'Tripathi', 'Mishra', '1993-01-21', 31, 4),
(19, 'Disha', 'Verma', 'Rao', '1990-09-07', 33, 4), (20, 'Aman', 'Chandra', 'Gupta', '1988-03-12', 36, 4), (21, 'Kavita', 'Patel', 'Shah', '1997-02-15', 27, 5),
(22, 'Yuvraj', 'Bajaj', 'Mehta', '1990-07-28', 33, 5), (23, 'Priyanka', 'Joshi', 'Desai', '1986-11-04', 37, 5), (24, 'Sahil', 'Malhotra', 'Kapoor', '1995-04-21', 29, 5),
(25, 'Aarti', 'Agarwal', 'Sharma', '1992-09-19', 31, 5), (26, 'Rohit', 'Singh', 'Rao', '1984-01-10', 40, 6), (27, 'Neha', 'Das', 'Chatterjee', '1993-03-05', 31, 6),
(28, 'Riya', 'Bose', 'Roy', '1991-05-21', 32, 6), (29, 'Rahul', 'Tripathi', 'Verma', '1987-12-16', 36, 6), (30, 'Anjali', 'Chandra', 'Iyer', '1989-02-02', 35, 6),
(31, 'Karan', 'Patel', 'Kapoor', '1994-08-08', 29, 7), (32, 'Preeti', 'Bajaj', 'Mehta', '1990-04-15', 34, 7), (33, 'Amit', 'Joshi', 'Desai', '1988-11-23', 35, 7),
(34, 'Sonia', 'Malhotra', 'Khan', '1992-01-31', 32, 7), (35, 'Vikram', 'Agarwal', 'Sharma', '1985-07-07', 38, 7), (36, 'Swati', 'Singh', 'Rao', '1991-06-24', 32, 8),
(37, 'Abhinav', 'Das', 'Chatterjee', '1994-09-22', 29, 8), (38, 'Disha', 'Tripathi', 'Verma', '1989-12-12', 34, 8), (39, 'Aman', 'Chandra', 'Iyer', '1987-05-04', 36, 8),
(40, 'Kavita', 'Patel', 'Kapoor', '1996-03-18', 28, 8), (41, 'Yuvraj', 'Bajaj', 'Mehta', '1991-11-07', 32, 9), (42, 'Priyanka', 'Joshi', 'Desai', '1985-08-28', 38, 9),
(43, 'Sahil', 'Malhotra', 'Khan', '1993-05-10', 30, 9), (44, 'Aarti', 'Agarwal', 'Sharma', '1990-02-16', 34, 9), (45, 'Rohit', 'Singh', 'Rao', '1983-09-21', 40, 9),
(46, 'Dev', 'Patel', 'Shah', '1978-08-21', 45, 10), (47, 'Anika', 'Agarwal', 'Mishra', '1982-10-25', 41, 10), (48, 'Arjun', 'Tripathi', 'Tiwari', '1979-02-14', 45, 10),
(49, 'Preeti', 'Verma', 'Chauhan', '1981-01-07', 43, 10), (50, 'Amit', 'Chandra', 'Rao', '1980-05-18', 43, 10);

ALTER TABLE branch ADD FOREIGN KEY (manager) REFERENCES employee(empID) ON DELETE SET NULL ON UPDATE CASCADE;

-- -----------------------------------------------------
-- Table empEmail
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS empEmail (
  empID INT NOT NULL,
  email VARCHAR(45) NOT NULL,
  PRIMARY KEY (empID, email),
  CONSTRAINT empID_
    FOREIGN KEY (empID)
    REFERENCES employee (empID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO empEmail VALUES
(1, 'priya.singh@company.com'), (2, 'rahul.kumar1992@company.com'), (4, 'akash.mehta28@company.com'), 
(5, 'anjali.joshi@company.com'), (6, 'maya.menon@company.com'), (4, 'mehta1444@company.com'),
(7, 'aditya.das@company.com'), (8, 'neha.chatterjee@company.com'), (9, 'rohan.kapoor@company.com'), (10, 'riya.bajaj@company.com'), 
(1, 'priya.singh1990@mycompany.com'), (4, 'akash.mehta909@company.com'), (5, 'anjali.joshi0305@mycompany.com'), 
(6, 'maya.menon0520@company.com'), (9, 'rohan.kapoor1210@mycompany.com'), (10, 'riya.bajaj0604@company.com'),
(11, 'shiva.iyer@company.com'), (11, 'shiva.1996@mycompany.com'), (12, 'pooja.shah@company.com'), (12, 'pooja.desai1011@company.in'),
(13, 'nikhil.malhotra@company.com'), (13, 'nikhil.khanna87@mycompany.com'), (14, 'ishaan.jain1405@company.com'),
(15, 'sonia.agarwal@company.com'), (15, 'sonia.kapoor1227@mycompany.com'),
(16, 'vikramaditya.singh@company.com'), (17, 'swati.das@company.com'), (17, 'swati.bose0409@company.in'),
(18, 'abhinav.tripathi@company.com'), (18, 'abhinav.mishra2101@mycompany.com'), (19, 'disha.rao0907@company.com'),
(20, 'aman.chandra@company.com'), (20, 'aman.gupta1203@mycompany.com'),
(21, 'kavita.patel@company.com'), (21, 'kavita.kapoor1502@mycompany.com'),
(22, 'yuvraj.bajaj@company.com'), (22, 'yuvraj.mehta1507@company.com'),
(23, 'priyanka.joshi@company.com'), (23, 'priyanka.desai8611@company.in'), (23, 'priyadesai1168@company.in'),
(24, 'sahil.malhotra@company.com'), (24, 'sahil.khan2104@mycompany.com'),
(25, 'aarti.agarwal@company.com'), (25, 'aarti.sharma1909@company.com'),
(26, 'rohit.singh@company.com'), (26, 'rohit.rao0110@mycompany.com'),
(27, 'neha.das@company.com'), (27, 'neha.chatterjee0305@company.in'),
(28, 'riya.bose@company.com'), (28, 'riya.roy2105@mycompany.com'), (28, 'rroy@mycompany.com'),
(29, 'rahul.tripathi@company.com'), (29, 'rahul.verma1612@company.com'),
(30, 'anjali.chandra@company.com'), (30, 'anjali.iyer0202@mycompany.com'),
(31, 'karan.patel@company.com'), (31, 'karan.kapoor0808@mycompany.com'),
(32, 'preeti.bajaj@company.com'), (32, 'preeti.mehta1504@company.com'),
(33, 'amit.joshi@company.com'), (33, 'amit.desai2311@company.in'),
(34, 'sonia.malhotra@company.com'), (34, 'sonia.khan3101@mycompany.com'),
(35, 'vikramaditya.agarwal@company.com'), (35, 'vikramaditya.sharma0707@mycompany.com'),
(36, 'swati.singh@company.com'), (36, 'swati.rao2406@company.com'),
(37, 'abhinav.das@company.com'), (37, 'abhinav.chatterjee2209@company.in'),
(38, 'disha.tripathi@company.com'), (38, 'disha.verma1212@company.com'),
(39, 'aman.chandra@company.com'), (39, 'aman.iyer0405@mycompany.com'),
(40, 'kavita.patel@company.com'), (40, 'kavita.kapoor1803@mycompany.com'),
(41, 'yuvraj.bajaj@company.com'), (41, 'yuvraj.mehta0711@company.com'),
(42, 'priyanka.joshi@company.com'), (42, 'priyanka.desai8508@company.in'),
(43, 'sahil.malhotra@company.com'), (43, 'sahil.khan1003@mycompany.com'),
(44, 'aarti.agarwal@company.com'), (44, 'aarti.sharma1602@company.com'),
(45, 'rohit.singh@company.com'), (45, 'rohit.rao2109@mycompany.com'),
(46, 'dev.patel@company.com'), (46, 'dev.shah2108@company.com'),
(47, 'anika.agarwal@company.com'), (47, 'anika.mishra2510@mycompany.com'),
(48, 'arjun.tripathi@company.com'), (48, 'arjun.tiwari@company.com'), (48, 'arjun.gupta1906@mycompany.com'),
(49, 'preeti.chauhan@company.com'), (49, 'preeti.verma0701@mycompany.com'),
(50, 'amit.rao@company.com'), (50, 'amit.chandra1805@mycompany.com');

-- -----------------------------------------------------
-- Table eNumber
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS eNumber (
  empID INT NOT NULL,
  phNo CHAR(10) NOT NULL,
  PRIMARY KEY (empID, phNo),
  CONSTRAINT empID_ibb
    FOREIGN KEY (empID)
    REFERENCES employee (empID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO eNumber VALUES
(1, '8356789012'), (2, '8356709012'), (3, '7689012345'), (4, '8689012345'), (5, '8023456789'), (6, '9134567890'), (6, '7689012345'), 
(7, '7689012345'), (8, '9023456789'), (9, '9578901234'), (10, '9578901234'), (11, '8245678901'), (12, '7801234567'), (13, '9023456789'), 
(13, '9023346789'), (14, '7912345678'), (15, '7467890123'), (15, '8689012345'), (16, '9790123456'), (17, '8356789012'), (18, '7912345678'),
(19, '8245678901'), (20, '8023456789'), (21, '7689012345'), (21, '8790123456'), (22, '8023456789'), (22, '7467890123'), (23, '9578901234'), 
(23, '8356789012'), (24, '9134567890'), (25, '8245678901'), (26, '9023433389'), (26, '9023456789'), (27, '7912345678'), (28, '7801234567'),
(29, '8245678901'), (30, '9790123456'),(37, '7890123456'),
(31, '9876543210'), (32, '8765432109'), (33, '7654321098'), (34, '9876543211'), (35, '8765432100'), (36, '7654321099'),(37, '9876543212'),
(38, '8765432111'),(39, '7654321000'),(40, '9876543213'),(41, '8765432102'),(42, '7654321091'),(43, '9876543214'),(44, '8765432103'),
(45, '7654321092'),(46, '9876543215'),(47, '8765432104'),(48, '7654321093'),(49, '9876543216'),(50, '8765432105'),(35, '6789012345'),
(39, '8901234567'),(42, '9012345678'),(43, '6789012340'),(45, '7890123450'),(47, '8901234569'),(48, '5678901237'),(50, '6789012346');

-- -----------------------------------------------------
-- Table container
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS container (
  containerID INT NOT NULL,
  numPackages INT default NULL,
  srcBranch INT NULL,
  dstBranch INT NULL,
  PRIMARY KEY (containerID),
  INDEX srcBranch_idx (srcBranch ASC) VISIBLE,
  INDEX dstBranch_idx (dstBranch ASC) VISIBLE,
  CONSTRAINT srcBranch_
    FOREIGN KEY (srcBranch)
    REFERENCES branch (branchID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT dstBranch
    FOREIGN KEY (dstBranch)
    REFERENCES branch (branchID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


insert into container values
(1, 3, 10, 4), 
(2, 1, 8, 6), 
(3, 1, 7, 5), 
(4, 1, 7, 10), 
(5, 1, 5, 6), 
(6, 1, 8, 2), 
(7, 2, 9, 10), 
(8, 2, 3, 10), 
(9, 1, 4, 5), 
(10, 1, 6, 2),
(11,1,9,8),
(12,3,7,2),
(13,2,4,10),
(14,1,10,6),
(15,1,10,1),
(16,1,3,8),
(17,1,3,2),
(18,2,8,10),
(19,2,5,2),
(20,2,6,10);



-- -----------------------------------------------------
-- Table basket
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS basket (
  basketID INT NOT NULL,
  branchID INT NOT NULL,
  deliveryDate DATE NOT NULL,
  numPackages INT NOT NULL,
  empID INT NOT NULL,
  pickedTime TIME NOT NULL,
  PRIMARY KEY (basketID, branchID),
  INDEX branchID_idx (branchID ASC) VISIBLE,
  INDEX empID_idx (empID ASC) VISIBLE,
  CONSTRAINT branchID_
    FOREIGN KEY (branchID)
    REFERENCES branch (branchID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT empID_ibfx
    FOREIGN KEY (empID)
    REFERENCES employee (empID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    )
ENGINE = InnoDB;

insert into basket values
(1,2,'2024-01-03',1,9,'11:00:00'),(2,2,'2024-01-06',1,10,'12:00:00'),(3,4,'2024-01-05',3,19,'10:00:00'),
(4,5,'2024-01-05',1,24,'09:00:00'),(5,5,'2024-01-05',1,25,'10:00:00'),(6,10,'2024-01-07',2,49,'09:00:00'),
(7,10,'2024-01-07',3,50,'11:00:00'),(8,6,'2024-01-05',2,29,'20:00:00'),
(9,1,'2023-12-19',2,4,'10:00:00'),
(10,2,'2023-12-18',1,9,'07:00:00'),
(11,2,'2023-12-20',4,10,'08:00:00'),
(12,6,'2023-12-18',1,24,'09:00:00'),
(13,8,'2023-12-20',2,39,'11:00:00'),
(14,10,'2023-12-21',3,49,'10:00:00'),
(15,10,'2023-12-21',3,50,'11:00:00');

-- -----------------------------------------------------
-- Table package
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS package (
  packageID INT NOT NULL,
  weight INT NULL,
  sID INT NULL,
  rID INT NULL,
  srcB INT NULL,
  contID INT NULL,
  baskID INT NULL,
  dstB INT NULL,
  delTime TIME NULL,
  expDelTime TIME NULL,
  PRIMARY KEY (packageID),
  INDEX sID_idx (sID ASC) VISIBLE,
  INDEX rID_idx (rID ASC) VISIBLE,
  INDEX srcB_idx (srcB ASC) VISIBLE,
  INDEX contID_idx (contID ASC) VISIBLE,
  INDEX baskID_idx (baskID ASC) VISIBLE,
  INDEX dstB_idx (dstB ASC) VISIBLE,
  CONSTRAINT sID_
    FOREIGN KEY (sID)
    REFERENCES person (pID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT rID_
    FOREIGN KEY (rID)
    REFERENCES person (pID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT srcB_
    FOREIGN KEY (srcB)
    REFERENCES branch (branchID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT contID_
    FOREIGN KEY (contID)
    REFERENCES container (containerID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT baskID_
    FOREIGN KEY (baskID)
    REFERENCES basket (basketID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT dstB_
    FOREIGN KEY (dstB)
    REFERENCES branch (branchID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '									';

insert into package values
(1, 15, 4, 1, 10, 1, 3, 4, '11:00:00', '11:00:00'),
(2, 13, 14, 3, 10, 1, 3, 4, '12:00:00', '11:30:00'),
(3, 11, 4, 19, 10, 1, 3, 4, '12:30:00', '12:00:00'),
(4, 20, 9, 6, 8, 2, 8, 6, '09:30:00', '09:00:00'),
(5, 18, 17, 15, 7, 3, 4, 5, '11:00:00', '11:00:00'),
(6, 12, 17, 4, 7, 4, 7, 10, '12:30:00', '12:00:00'),
(8, 16, 24, 11, 8, 6, 1, 2, '12:30:00', '12:00:00'),
(7, 19, 15, 18, 5, 5, 8, 6, '22:00:00', '21:30:00'),
(9, 14, 20, 4, 9, 7, 7, 10, '12:30:00', '12:00:00'),
(10, 16, 5, 14, 9, 7, 6, 10, '10:00:00', '10:00:00'),
(11, 10, 7, 4, 3, 8, 7, 10, '13:00:00', '12:00:00'),
(12, 18, 7, 14, 3, 8, 6, 10, '11:00:00', '10:30:00'),
(13, 17, 10, 23, 4, 9, 5, 5, '11:30:00', '11:00:00'),
(14, 15, 22, 11, 6, 10, 2, 2, '13:30:00', '13:00:00'),
(15, 16, 20, 24, 9, 11, 13, 8, '13:00:00', '12:00:00'),
(16, 14, 17, 11, 7, 12, 11, 2, '09:00:00', '09:00:00'),
(17, 12, 17, 11, 7, 12, 11, 2, '10:00:00', '09:30:00'),
(18, 20, 1, 4, 4, 13, 14, 10, '11:00:00', '11:00:00'),
(19, 15, 3, 14, 4, 13, 15, 10, '14:00:00', '13:30:00'),
(20, 19, 4, 18, 10, 14, 12, 6, '10:30:00', '10:00:00'),
(21, 17, 14, 21, 10, 15, 9, 1, '12:00:00', '11:00:00'),
(22, 18, 7, 9, 3, 16, 13, 8, '12:30:00', '12:00:00'),
(23, 10, 7, 11, 3, 17, 10, 2, '09:00:00', '08:00:00'),
(24, 11, 9, 4, 8, 18, 14, 10, '11:30:00', '11:30:00'),
(25, 17, 13, 14, 8, 18, 15, 10, '13:00:00', '13:00:00'),
(26, 13, 23, 11, 5, 19, 11, 2, '10:30:00', '10:00:00'),
(27, 14, 15, 11, 5, 19, 11, 2, '11:30:00', '11:00:00'),
(28, 16, 18, 14, 6, 20, 14, 10, '12:00:00', '12:00:00'),
(29, 17, 8, 14, 6, 20, 15, 10, '12:30:00', '12:00:00');

-- insert into package values
-- (30, 34, 21, 22, 7, 1, 9, 8, '2023-08-08 02:17:16', '2023-08-08 13:45:16'), 
-- (22, 86, 13, 20, 2, 7, 7, 7, '2023-10-05 02:17:16', '2023-10-05 10:31:16'), 
-- (25, 88, 6, 16, 2, 9, 9, 9, '2024-04-02 02:17:16', '2024-04-02 09:06:16'), 
-- (23, 53, 25, 13, 6, 9, 5, 9, '2023-10-04 02:17:16', '2023-10-04 02:59:16'), 
-- (36, 36, 17, 25, 10, 2, 9, 5, '2023-08-10 02:17:16', '2023-08-10 08:27:16'), 
-- (9, 70, 1, 16, 10, 3, 4, 4, '2023-06-01 02:17:16', '2023-06-01 16:30:16'), 
-- (16, 2, 21, 13, 6, 5, 3, 2, '2023-06-16 02:17:16', '2023-06-16 21:27:16'), 
-- (19, 47, 25, 8, 5, 5, 3, 7, '2023-09-29 02:17:16', '2023-09-29 17:21:16'), 
-- (50, 19, 19, 18, 8, 2, 10, 3, '2024-01-31 02:17:16', '2024-01-31 07:02:16'), 
-- (19, 40, 22, 2, 5, 4, 9, 6, '2024-03-10 02:17:16', '2024-03-10 07:14:16'), 
-- (6, 87, 7, 1, 5, 5, 2, 2, '2023-11-29 02:17:16', '2023-11-29 06:55:16'), 
-- (1, 7, 19, 5, 6, 7, 3, 6, '2023-06-16 02:17:16', '2023-06-16 10:49:16'), 
-- (30, 41, 2, 16, 6, 2, 1, 8, '2024-03-14 02:17:16', '2024-03-14 04:14:16'), 
-- (12, 57, 22, 13, 8, 9, 3, 10, '2023-06-11 02:17:16', '2023-06-12 02:08:16'), 
-- (38, 33, 17, 5, 4, 5, 4, 8, '2024-03-31 02:17:16', '2024-03-31 04:49:16'), 
-- (34, 3, 13, 4, 4, 5, 1, 9, '2023-08-17 02:17:16', '2023-08-17 08:34:16'), 
-- (49, 96, 9, 22, 10, 4, 2, 6, '2024-03-19 02:17:16', '2024-03-19 04:26:16'), 
-- (34, 94, 12, 4, 3, 4, 1, 3, '2023-06-29 02:17:16', '2023-06-29 23:52:16'), 
-- (47, 17, 19, 7, 7, 1, 1, 1, '2023-09-09 02:17:16', '2023-09-09 09:14:16'), 
-- (22, 25, 7, 20, 2, 1, 7, 10, '2024-03-22 02:17:16', '2024-03-22 09:42:16'), 
-- (49, 51, 9, 6, 3, 3, 3, 1, '2023-09-09 02:17:16', '2023-09-09 10:26:16'), 
-- (24, 93, 14, 9, 9, 5, 9, 6, '2023-11-30 02:17:16', '2023-11-30 15:21:16'), 
-- (22, 2, 20, 4, 4, 3, 4, 2, '2023-12-10 02:17:16', '2023-12-10 10:11:16'), 
-- (47, 78, 9, 1, 5, 2, 5, 6, '2023-05-23 02:17:16', '2023-05-23 12:57:16'), 
-- (35, 19, 6, 11, 2, 4, 2, 1, '2023-04-28 02:17:16', '2023-04-28 19:49:16'), 
-- (19, 52, 19, 18, 5, 5, 1, 6, '2023-06-09 02:17:16', '2023-06-09 23:31:16'), 
-- (37, 34, 8, 1, 9, 4, 7, 3, '2023-04-20 02:17:16', '2023-04-20 23:00:16'), 
-- (49, 21, 11, 5, 8, 5, 5, 6, '2023-06-07 02:17:16', '2023-06-07 09:27:16'), 
-- (22, 61, 9, 1, 5, 6, 1, 5, '2024-03-26 02:17:16', '2024-03-26 23:14:16'), 
-- (27, 77, 14, 4, 7, 4, 1, 1, '2023-04-23 02:17:16', '2023-04-23 02:34:16'), 
-- (50, 13, 13, 16, 8, 2, 1, 10, '2024-03-16 02:17:16', '2024-03-16 08:15:16'), 
-- (39, 58, 8, 2, 3, 2, 8, 7, '2023-12-11 02:17:16', '2023-12-11 22:20:16'), 
-- (32, 54, 9, 3, 4, 5, 3, 4, '2024-03-24 02:17:16', '2024-03-24 20:50:16'), 
-- (8, 66, 20, 10, 5, 4, 6, 1, '2023-12-17 02:17:16', '2023-12-17 15:06:16'), 
-- (41, 95, 20, 2, 2, 6, 6, 5, '2024-03-02 02:17:16', '2024-03-02 09:36:16'), 
-- (20, 61, 25, 24, 3, 4, 6, 1, '2023-12-14 02:17:16', '2023-12-14 10:14:16'), 
-- (40, 74, 9, 17, 7, 10, 4, 7, '2024-01-12 02:17:16', '2024-01-12 12:33:16'), 
-- (38, 58, 22, 7, 7, 3, 4, 2, '2023-06-30 02:17:16', '2023-06-30 04:58:16'), 
-- (14, 92, 18, 20, 4, 7, 3, 10, '2023-12-21 02:17:16', '2023-12-21 04:48:16'), 
-- (15, 51, 1, 16, 8, 1, 3, 2, '2023-10-27 02:17:16', '2023-10-27 07:35:16'), 
-- (49, 1, 5, 19, 3, 9, 5, 4, '2024-02-23 02:17:16', '2024-02-23 04:41:16'), 
-- (46, 61, 18, 12, 8, 2, 9, 1, '2023-09-01 02:17:16', '2023-09-01 22:43:16'), 
-- (21, 8, 10, 4, 8, 4, 5, 2, '2023-05-18 02:17:16', '2023-05-18 15:56:16'), 
-- (34, 40, 4, 9, 8, 1, 7, 7, '2023-10-07 02:17:16', '2023-10-08 01:23:16'), 
-- (34, 87, 18, 8, 1, 1, 5, 9, '2023-11-20 02:17:16', '2023-11-20 03:03:16'), 
-- (34, 8, 3, 1, 9, 3, 5, 7, '2023-12-21 02:17:16', '2023-12-21 21:35:16'), 
-- (21, 95, 12, 25, 9, 8, 1, 5, '2023-12-27 02:17:16', '2023-12-27 15:22:16'), 
-- (21, 60, 12, 25, 10, 5, 4, 1, '2023-11-12 02:17:16', '2023-11-12 07:11:16'), 
-- (46, 67, 14, 2, 7, 6, 8, 4, '2023-11-01 02:17:16', '2023-11-02 00:08:16'), 
-- (16, 49, 10, 14, 9, 5, 7, 1, '2023-09-02 02:17:16', '2023-09-02 16:04:16'), 
-- (47, 19, 13, 2, 10, 5, 5, 8, '2023-08-26 02:17:16', '2023-08-26 12:01:16'), 
-- (16, 3, 20, 3, 2, 9, 6, 4, '2023-06-05 02:17:16', '2023-06-05 16:17:16'), 
-- (3, 38, 4, 14, 8, 5, 4, 7, '2023-09-10 02:17:16', '2023-09-10 23:53:16'), 
-- (14, 83, 21, 19, 7, 10, 9, 7, '2024-01-04 02:17:16', '2024-01-04 09:00:16'), 
-- (47, 80, 22, 3, 9, 6, 5, 7, '2024-02-08 02:17:16', '2024-02-08 23:56:16'), 
-- (26, 11, 23, 17, 2, 2, 10, 8, '2023-06-30 02:17:16', '2023-06-30 07:23:16'), 
-- (26, 8, 1, 19, 9, 3, 1, 1, '2024-02-08 02:17:16', '2024-02-08 20:13:16'), 
-- (50, 60, 13, 8, 5, 5, 10, 7, '2023-04-04 02:17:16', '2023-04-04 05:27:16'), 
-- (27, 6, 16, 22, 4, 7, 9, 8, '2023-08-01 02:17:16', '2023-08-01 04:51:16'), 
-- (12, 96, 22, 3, 8, 3, 3, 5, '2024-02-10 02:17:16', '2024-02-11 01:43:16'), 
-- (25, 81, 17, 21, 1, 1, 10, 9, '2023-11-28 02:17:16', '2023-11-28 16:45:16'), 
-- (13, 90, 10, 18, 6, 8, 6, 8, '2023-11-12 02:17:16', '2023-11-12 03:21:16'), 
-- (8, 27, 6, 3, 10, 8, 5, 1, '2024-03-23 02:17:16', '2024-03-23 15:09:16'), 
-- (7, 29, 20, 5, 1, 8, 7, 3, '2023-06-04 02:17:16', '2023-06-04 14:21:16'), 
-- (24, 73, 23, 7, 7, 8, 7, 5, '2024-01-27 02:17:16', '2024-01-27 05:52:16'), 
-- (27, 49, 13, 23, 1, 4, 2, 7, '2024-03-05 02:17:16', '2024-03-05 11:38:16'), 
-- (8, 12, 1, 22, 6, 7, 7, 8, '2023-12-05 02:17:16', '2023-12-05 05:30:16'), 
-- (47, 38, 6, 15, 3, 8, 4, 1, '2023-10-23 02:17:16', '2023-10-23 05:41:16'), 
-- (40, 35, 9, 8, 3, 6, 4, 10, '2024-03-27 02:17:16', '2024-03-27 21:46:16'), 
-- (46, 36, 16, 21, 8, 7, 6, 4, '2023-11-17 02:17:16', '2023-11-17 03:11:16'), 
-- (45, 29, 5, 17, 4, 2, 1, 3, '2024-02-05 02:17:16', '2024-02-05 16:55:16'), 
-- (48, 32, 11, 2, 3, 5, 3, 10, '2023-06-15 02:17:16', '2023-06-15 19:42:16'), 
-- (4, 28, 24, 4, 3, 8, 7, 10, '2023-05-12 02:17:16', '2023-05-12 12:35:16'), 
-- (44, 66, 9, 23, 2, 9, 3, 2, '2023-09-19 02:17:16', '2023-09-20 00:10:16'), 
-- (31, 72, 9, 13, 6, 8, 5, 6, '2023-07-22 02:17:16', '2023-07-22 05:51:16'), 
-- (38, 80, 3, 24, 8, 5, 4, 4, '2023-11-06 02:17:16', '2023-11-06 07:49:16'), 
-- (39, 55, 11, 16, 9, 4, 9, 1, '2023-05-13 02:17:16', '2023-05-13 18:27:16'), 
-- (30, 66, 16, 11, 2, 2, 2, 1, '2023-09-07 02:17:16', '2023-09-07 06:17:16'), 
-- (20, 83, 18, 6, 5, 3, 2, 2, '2023-05-23 02:17:16', '2023-05-23 07:59:16'), 
-- (15, 22, 15, 16, 6, 10, 2, 6, '2023-04-10 02:17:16', '2023-04-10 17:34:16'), 
-- (28, 12, 13, 9, 8, 6, 3, 6, '2023-09-02 02:17:16', '2023-09-02 05:10:16'), 
-- (12, 66, 22, 2, 9, 7, 6, 8, '2023-04-14 02:17:16', '2023-04-14 08:23:16'), 
-- (18, 90, 9, 25, 6, 3, 1, 4, '2023-12-27 02:17:16', '2023-12-27 16:24:16'), 
-- (50, 95, 1, 6, 3, 4, 4, 4, '2023-04-20 02:17:16', '2023-04-20 20:50:16'), 
-- (5, 82, 23, 23, 10, 5, 10, 7, '2023-09-11 02:17:16', '2023-09-11 02:40:16'), 
-- (6, 17, 5, 16, 8, 7, 8, 8, '2023-07-06 02:17:16', '2023-07-06 18:48:16'), 
-- (30, 93, 21, 13, 6, 6, 8, 9, '2024-03-11 02:17:16', '2024-03-11 07:55:16'), 
-- (38, 6, 1, 5, 8, 8, 8, 1, '2023-09-02 02:17:16', '2023-09-02 09:09:16'), 
-- (28, 45, 22, 2, 3, 10, 2, 3, '2023-06-09 02:17:16', '2023-06-09 02:57:16'), 
-- (42, 36, 16, 4, 1, 1, 7, 3, '2023-10-26 02:17:16', '2023-10-26 06:36:16'), 
-- (27, 60, 13, 21, 9, 5, 2, 3, '2024-03-11 02:17:16', '2024-03-11 02:42:16'), 
-- (30, 42, 10, 15, 10, 10, 4, 2, '2024-03-27 02:17:16', '2024-03-27 15:40:16'), 
-- (20, 31, 22, 3, 7, 3, 8, 9, '2023-07-19 02:17:16', '2023-07-19 12:59:16'), 
-- (46, 29, 19, 1, 8, 3, 5, 3, '2023-05-27 02:17:16', '2023-05-27 11:32:16'), 
-- (16, 18, 15, 2, 1, 2, 5, 5, '2023-07-27 02:17:16', '2023-07-27 16:46:16'), 
-- (24, 17, 7, 24, 4, 10, 7, 3, '2023-07-17 02:17:16', '2023-07-17 23:30:16'), 
-- (10, 56, 10, 8, 10, 2, 10, 10, '2023-12-28 02:17:16', '2023-12-28 13:12:16'), 
-- (11, 97, 14, 22, 10, 2, 8, 2, '2024-03-29 02:17:16', '2024-03-29 22:34:16'), 
-- (35, 19, 1, 15, 10, 9, 8, 8, '2023-06-19 02:17:16', '2023-06-19 12:32:16'), 
-- (9, 82, 4, 22, 5, 1, 2, 10, '2023-09-04 02:17:16', '2023-09-04 18:01:16');


-----------------------------------------------------
-- Table journey
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS journey (
  journeyID INT NOT NULL,
  sBranch INT NULL,
  sTime TIME NULL,
  sDate DATE NULL,
  eBranch INT NULL,
  eTime TIME NULL,
  eDate DATE NULL,
  driver INT NULL,
  PRIMARY KEY (journeyID),
  INDEX sBranch_idx (sBranch ASC) VISIBLE,
  INDEX eBranch_idx (eBranch ASC) VISIBLE,
  INDEX driver_idx (driver ASC) VISIBLE,
  CONSTRAINT sBranch_
    FOREIGN KEY (sBranch)
    REFERENCES branch (branchID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT eBranch_
    FOREIGN KEY (eBranch)
    REFERENCES branch (branchID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT driver_
    FOREIGN KEY (driver)
    REFERENCES employee (empID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

insert into journey values
(1,3,'18:00:00','2024-01-01',6,'06:00:00','2024-01-02',12),
(2,6,'12:00:00','2024-01-04',4,'05:00:00','2024-01-05',28),
(3,4,'17:00:00','2024-01-01',6,'07:00:00','2024-01-02',17),
(4,6,'16:00:00','2024-01-04',5,'08:00:00','2024-01-05',27),
(5,5,'06:00:00','2024-01-01',6,'19:00:00','2024-01-01',22),
(6,5,'15:00:00','2024-01-05',2,'10:00:00','2024-01-06',23);
insert into journey values
(7,10,'11:00:00','2024-01-01',2,'00:00:00','2024-01-02',47),
(8,2,'12:00:00','2024-01-06',10,'20:00:00','2024-01-06',8),
(9,9,'16:00:00','2024-01-01',2,'22:00:00','2024-01-02',42),
(10,2,'15:00:00','2024-01-02',1,'22:00:00','2024-01-02',7),
(11,1,'08:00:00','2024-01-02',2,'10:00:00','2024-01-03',2),
(12,8,'12:00:00','2024-01-01',1,'18:00:00','2024-01-01',37),
(13,7,'10:00:00','2024-01-01',1,'19:00:00','2024-01-01',32),
(14,1,'16:00:00','2024-01-03',6,'06:00:00','2024-01-04',3);
insert into journey values
(15,7,'18:00:00','2023-12-15',1,'09:00:00','2023-12-16',32),
(16,8,'15:00:00','2023-12-15',1,'04:00:00','2023-12-16',37),
(17,1,'14:00:00','2023-12-19',8,'10:00:00','2023-12-20',2),
(18,1,'19:00:00','2023-12-19',2,'07:00:00','2023-12-20',3),
(19,2,'16:00:00','2023-12-16',5,'10:00:00','2023-12-17',7),
(20,2,'12:00:00','2023-12-20',10,'02:00:00','2023-12-21',8),
(21,3,'21:00:00','2023-12-15',6,'07:00:00','2023-12-16',12),
(22,4,'20:00:00','2023-12-15',6,'10:00:00','2023-12-16',17),
(23,5,'18:00:00','2023-12-17',2,'06:00:00','2023-12-18',22),
(24,5,'16:00:00','2023-12-17',6,'08:00:00','2023-12-18',23),
(25,6,'21:00:00','2023-12-18',1,'09:00:00','2023-12-19',27),
(26,6,'22:00:00','2023-12-16',5,'06:00:00','2023-12-17',28),
(27,9,'17:00:00','2023-12-15',2,'08:00:00','2023-12-16',42),
(28,10,'19:30:00','2023-12-15',2,'05:30:00','2023-12-16',47);
-- -----------------------------------------------------
-- Table assignedTo
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS assignedTo (
  containerID INT NOT NULL,
  journeyID INT NOT NULL,
  PRIMARY KEY (containerID, journeyID),
  INDEX journeyID_idx (journeyID ASC) VISIBLE,
  CONSTRAINT containerID_
    FOREIGN KEY (containerID)
    REFERENCES container (containerID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT journeyID_
    FOREIGN KEY (journeyID)
    REFERENCES journey (journeyID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

insert into assignedTo values (1,7),(1,10),(1,14),(1,2),(2,12),(2,14),(3,13),(3,14),(3,4),(4,13),(4,11),(4,8),(5,5),(6,12),(6,11),(7,9),(7,8),
(8,1),(8,4),(8,6),(8,8),(9,3),(9,4),(10,4),(10,6);
insert into assignedTo values (11,27),(11,19),(11,24),(11,25),(11,17),(12,15),(12,18),(13,22),(13,26),(13,23),(13,20),(14,28),
(14,19),(14,24),(15,28),(15,19),(15,24),(15,25),(16,21),(16,25),(16,17),(17,21),(17,26),(17,23),(18,16),(18,18),(18,20),(19,24),
(19,25),(19,18),(20,25),(20,18),(20,20);