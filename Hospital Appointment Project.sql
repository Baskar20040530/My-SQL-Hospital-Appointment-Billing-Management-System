create database Hospital_Management;


use Hospital_Management;



create table patients(         
patient_id  int primary key auto_increment, 
patient_name varchar(30),
date_of_birth date,
gender varchar(10),
phone varchar(12),
address varchar(235)
);
desc patients;


insert into patients (patient_name,date_of_birth,gender,phone,address) values
('Rahul Kumar', '2000-05-14', 'Male', '9876543210', 'Chennai'),
('Priya Sharma', '1998-08-22', 'Female', '9123456789', 'Bengaluru'),
('Arun Singh', '1995-12-10', 'Male', '9012345678', 'Hyderabad'),
('Sneha Reddy', '2001-03-18', 'Female', '9988776655', 'Vijayawada'),
('Karan Patel', '1997-11-25', 'Male', '9090909090', 'Ahmedabad'),
('Anjali Verma', '2002-01-30', 'Female', '9345678901', 'Delhi'),
('Vikram Rao', '1994-09-05', 'Male', '9871234567', 'Pune'),
('Meera Nair', '1999-07-12', 'Female', '9445566778', 'Kochi'),
('Suresh Babu', '1993-04-08', 'Male', '9786543210', 'Coimbatore'),
('Divya Joshi', '2000-10-19', 'Female', '9654321870', 'Mumbai');
select*from patients;

set sql_safe_updates=0;
update patients set address = 'chennai' where patient_name='sneha reddy';
set sql_safe_updates=1;

create table Departments(
department_id int primary key auto_increment,
department_name varchar(50) not null,
location varchar(30)
);

insert into Departments(department_name,location) values

('Cardiology', 'First Floor'),
('Neurology', 'Second Floor'),
('Orthopedics', 'Ground Floor'),
('Pediatrics', 'First Floor'),
('Gynecology', 'Second Floor'),
('Dermatology', 'Third Floor'),
('Oncology', 'Fourth Floor'),
('Radiology', 'Ground Floor'),
('Emergency', 'Ground Floor'),
('General Medicine', 'First Floor');
select*from departments;

create table Doctors(
doctor_id int primary key auto_increment,
doctor_name varchar(40),
department_id int,
specialization varchar(50),
phone varchar(10),
foreign key(department_id)
references departments(department_id)
);

Insert Into Doctors (doctor_name, department_id, specialization, phone)
Values
('Dr. Rajesh Kumar', 1, 'Cardiologist', '9876543210'),
('Dr. Priya Sharma', 2, 'Neurologist', '9123456789'),
('Dr. Arun Patel', 3, 'Orthopedic Surgeon', '9012345678'),
('Dr. Sneha Reddy', 4, 'Pediatrician', '9988776655'),
('Dr. Kiran Mehta', 5, 'Gynecologist', '9090909090'),
('Dr. Divya Nair', 6, 'Dermatologist', '9345678901'),
('Dr. Vikram Singh', 7, 'Oncologist', '9871234567'),
('Dr. Meera Joshi', 8, 'Radiologist', '9445566778'),
('Dr. Suresh Babu', 9, 'Emergency Physician', '9786543210'),
('Dr. Anjali Verma', 10, 'General Physician', '9654321870');
select*from doctors;

create table Appointment(
appointment_id int primary key auto_increment,
patient_id int not null,
doctor_id  int not null,
appointment_date date not null,
appointment_time time not null,
appointment_status varchar(20) default 'scheduled',

foreign key (patient_id)
references patients(patient_id),

foreign key(doctor_id)
references doctors(doctor_id)
);

ALTER TABLE patients
CHANGE patients_id patient_id INT AUTO_INCREMENT;

INSERT INTO Appointment 
(patient_id, doctor_id, appointment_date, appointment_time, appointment_status)
VALUES
(1, 1, '2026-08-10', '09:30:00', 'Scheduled'),
(2, 2, '2026-08-11', '10:00:00', 'Confirmed'),
(3, 3, '2026-08-12', '11:15:00', 'Completed'),
(4, 4, '2026-08-13', '12:30:00', 'Cancelled'),
(5, 5, '2026-08-14', '09:45:00', 'Scheduled'),
(6, 6, '2026-08-15', '14:00:00', 'Confirmed'),
(7, 7, '2026-08-16', '15:30:00', 'Completed'),
(8, 8, '2026-08-17', '16:00:00', 'Cancelled'),
(9, 9, '2026-08-18', '10:45:00', 'Scheduled'),
(10, 10, '2026-08-19', '13:15:00', 'Confirmed');
select*from appointment;

create table treatments(
treatment_id int primary key auto_increment,
appointment_id int not null,
diagnosis varchar(200),
treatment_details text,
treatment_date date,

foreign key(appointment_id)
references appointment(appointment_id)
);

INSERT INTO treatments 
(appointment_id, diagnosis, treatment_details, treatment_date)
VALUES
(1, 'High Blood Pressure', 'Prescribed medication and advised regular blood pressure monitoring.', '2026-08-10'),

(2, 'Migraine', 'Recommended pain relief medication and lifestyle changes.', '2026-08-11'),

(3, 'Fractured Arm', 'Applied cast and advised physiotherapy after healing.', '2026-08-12'),

(4, 'Child Fever', 'Provided fever medication and advised proper hydration.', '2026-08-13'),

(5, 'Pregnancy Checkup', 'Routine pregnancy examination and health guidance provided.', '2026-08-14'),

(6, 'Skin Allergy', 'Prescribed ointment and allergy medication.', '2026-08-15'),

(7, 'Cancer Screening', 'Performed screening tests and planned further treatment.', '2026-08-16'),

(8, 'Chest X-Ray Review', 'Reviewed radiology reports and suggested follow-up consultation.', '2026-08-17'),

(9, 'Emergency Injury', 'Provided emergency care and wound treatment.', '2026-08-18'),

(10, 'Common Cold', 'Prescribed medicines and advised rest and fluids.', '2026-08-19');
select*from treatments;

create table bills(
bill_id int primary key auto_increment,
patient_id int not null,
treatment_id int not null,
total_amount decimal(10,2) not null,
bill_date date,
bill_status varchar(20) default 'unpaid',
foreign key (patient_id)
references patients(patient_id),
foreign key(treatment_id)
references treatments(treatment_id)
);
desc patients;
desc bills;
drop table bills;

INSERT INTO bills
(patient_id, treatment_id, total_amount, bill_date, bill_status)
VALUES
(1, 1, 5000.00, '2026-08-10', 'Paid'),
(2, 2, 3500.00, '2026-08-11', 'Partially Paid'),
(3, 3, 15000.00, '2026-08-12', 'Paid'),
(4, 4, 2500.00, '2026-08-13', 'Unpaid'),
(5, 5, 7000.00, '2026-08-14', 'Paid'),
(6, 6, 4500.00, '2026-08-15', 'Partially Paid'),
(7, 7, 25000.00, '2026-08-16', 'Unpaid'),
(8, 8, 6000.00, '2026-08-17', 'Cancelled'),
(9, 9, 8000.00, '2026-08-18', 'Paid'),
(10, 10, 3000.00, '2026-08-19', 'Unpaid');
select*from bills;

create table payments(
payment_id int primary key auto_increment,
bill_id int not null,
payment_amount decimal(10,2) not null,
payment_date date,
payment_method varchar(30),
foreign key (bill_id)
references bills(bill_id)
);

insert into payments(bill_id,payment_amount,payment_date,payment_method) values

(1, 5000.00, '2026-08-10', 'Cash'),
(2, 2000.00, '2026-08-11', 'UPI'),
(3, 15000.00, '2026-08-12', 'Credit Card'),
(4, 1000.00, '2026-08-13', 'Debit Card'),
(5, 7000.00, '2026-08-14', 'Net Banking'),
(6, 2500.00, '2026-08-15', 'UPI'),
(7, 5000.00, '2026-08-16', 'Cash'),
(8, 6000.00, '2026-08-17', 'Credit Card'),
(9, 8000.00, '2026-08-18', 'Debit Card'),
(10, 3000.00, '2026-08-19', 'Net Banking');
select*from  payments;

show tables;
desc patients;
desc departments;
desc doctors;
desc appointment;
desc treatments;
desc bills;
desc payments;

select*from patients;

select patient_name from patients;
select patient_name,phone from patients;

select*from doctors;
select doctor_name,specialization,phone from doctors;


    
    
    SELECT
    a.appointment_id,
    p.patient_name,
    d.doctor_name,
    dep.department_name,
    a.appointment_date,
    a.appointment_time,
    a.appointment_status
From appointment a
JOIN patients p
    ON a.patient_id = p.patient_id
JOIN doctors d
    ON a.doctor_id = d.doctor_id
JOIN departments dep
    ON d.department_id = dep.department_id;
    
-------- aggreate functions -----------
     
SELECT COUNT(*) FROM patients;   

SELECT SUM(total_amount) FROM bills;

SELECT AVG(total_amount) FROM bills;

SELECT MAX(total_amount) FROM bills;

SELECT MIN(total_amount) FROM bills;
   
   
----- joins ------
SELECT                   
    p.patient_name,
    d.doctor_name,
    a.appointment_date
From appointment a
JOIN patients p
ON a.patient_id = p.patient_id
JOIN doctors d
ON a.doctor_id = d.doctor_id;

 ----------- Group by Queries
Select      
doctor_id,
COUNT(*) AS total_appointments
FROM appointment
GROUP BY doctor_id;

------- Views Queries---------
CREATE VIEW patient_appointments AS
SELECT
p.patient_name,
d.doctor_name,
a.appointment_date
FROM appointment a
JOIN patients p
ON a.patient_id=p.patient_id
JOIN doctors d
ON a.doctor_id=d.doctor_id;

SELECT * FROM patient_appointments;

-------- Store procedures ---------
DELIMITER $$
CREATE PROCEDURE GetPatientDetails()
BEGIN
    SELECT * FROM patients;
END $$
DELIMITER ;
CALL GetPatientDetails();
DELIMITER $$

CREATE TRIGGER check_payment
BEFORE INSERT ON payments
FOR EACH ROW
BEGIN
    IF NEW.payment_amount < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Payment amount cannot be negative';
    END IF;
END $$
DELIMITER ;

----- Appointment list---
SELECT
    a.appointment_id,
    p.patient_name,
    a.appointment_date,
    a.appointment_time,
    a.appointment_status
FROM appointment a
JOIN patients p
ON a.patient_id = p.patient_id;

--------  appointment status
SELECT
    a.appointment_id,
    p.patient_name,
    a.appointment_date,
    a.appointment_time,
    a.appointment_status
FROM appointment a
JOIN patients p
ON a.patient_id = p.patient_id;

----- Check appointment with doctor name
SELECT
    a.appointment_id,
    p.patient_name,
    d.doctor_name,
    a.appointment_date,
    a.appointment_time,
    a.appointment_status
FROM appointment a
JOIN patients p
    ON a.patient_id = p.patient_id
JOIN doctors d
    ON a.doctor_id = d.doctor_id;
 
 
 
 ----- Complete appointment list
 SELECT
    a.appointment_id AS 'Appointment ID',
    p.patient_name AS 'Patient Name',
    d.doctor_name AS 'Doctor Name',
    dep.department_name AS 'Department',
    a.appointment_date AS 'Appointment Date',
    a.appointment_time AS 'Appointment Time',
    a.appointment_status AS 'Status'
FROM appointment a
JOIN patients p
    ON a.patient_id = p.patient_id
JOIN doctors d
    ON a.doctor_id = d.doctor_id
JOIN departments dep
    ON d.department_id = dep.department_id
ORDER BY a.appointment_date, a.appointment_time;

----- check only scheduled appointments
SELECT
    a.appointment_id,
    p.patient_name,
    d.doctor_name,
    a.appointment_date,
    a.appointment_time
FROM appointment a
JOIN patients p
    ON a.patient_id = p.patient_id
JOIN doctors d
    ON a.doctor_id = d.doctor_id
WHERE a.appointment_status = 'Scheduled';


----- Check confirmed appointments

SELECT
    a.appointment_id,
    p.patient_name,
    d.doctor_name,
    a.appointment_date,
    a.appointment_time
FROM appointment a
JOIN patients p
    ON a.patient_id = p.patient_id
JOIN doctors d
    ON a.doctor_id = d.doctor_id
WHERE a.appointment_status = 'Confirmed';

----- check completed appointments
SELECT
    a.appointment_id,
    p.patient_name,
    d.doctor_name,
    a.appointment_date,
    a.appointment_time
FROM appointment a
JOIN patients p
    ON a.patient_id = p.patient_id
JOIN doctors d
    ON a.doctor_id = d.doctor_id
WHERE a.appointment_status = 'Completed';

---- Check cancelled appointments
SELECT
    a.appointment_id,
    p.patient_name,
    d.doctor_name,
    a.appointment_date,
    a.appointment_time
FROM appointment a
JOIN patients p
    ON a.patient_id = p.patient_id
JOIN doctors d
    ON a.doctor_id = d.doctor_id
WHERE a.appointment_status = 'Cancelled';

----- count appointments by status ----
SELECT
    appointment_status,
    COUNT(*) AS total_appointments
FROM appointment
GROUP BY appointment_status;

----- check Today's appointments

SELECT
    a.appointment_id,
    p.patient_name,
    d.doctor_name,
    a.appointment_date,
    a.appointment_time,
    a.appointment_status
FROM appointment a
JOIN patients p
    ON a.patient_id = p.patient_id
JOIN doctors d
    ON a.doctor_id = d.doctor_id
WHERE a.appointment_date = '2026-08-10';

----- appointment details all ----
SELECT
    a.appointment_id AS 'Appointment ID',
    p.patient_name AS 'Patient Name',
    d.doctor_name AS 'Doctor Name',
    dep.department_name AS 'Department',
    a.appointment_date AS 'Appointment Date',
    a.appointment_time AS 'Appointment Time',
    a.appointment_status AS 'Status'
FROM appointment a
JOIN patients p
    ON a.patient_id = p.patient_id
JOIN doctors d
    ON a.doctor_id = d.doctor_id
JOIN departments dep
    ON d.department_id = dep.department_id
ORDER BY a.appointment_date, a.appointment_time;

----- Patient list
select*from patients;

----- complete patient list
SELECT
    patient_id AS 'Patient ID',
    patient_name AS 'Patient Name',
    date_of_birth AS 'Date of Birth',
    gender AS 'Gender',
    phone AS 'Phone',
    address AS 'Address'
FROM patients
ORDER BY patient_name;

----- Female patients
SELECT *
FROM patients
WHERE gender = 'Female';


----- Department Report
Select*from departments;

SELECT
    department_id AS 'Department ID',
    department_name AS 'Department Name',
    location AS 'Location'
FROM departments
ORDER BY department_name;

----- count doctors in each department
SELECT
    dep.department_name,
    COUNT(d.doctor_id) AS total_doctors
FROM departments dep
LEFT JOIN doctors d
ON dep.department_id = d.department_id
GROUP BY dep.department_id, dep.department_name;


----- Doctors  and departments
Select*from doctors;
 
 SELECT
    d.doctor_id AS 'Doctor ID',
    d.doctor_name AS 'Doctor Name',
    dep.department_name AS 'Department',
    d.specialization AS 'Specialization',
    d.phone AS 'Phone'
FROM doctors d
JOIN departments dep
ON d.department_id = dep.department_id
ORDER BY d.doctor_name;

----- Find cardiologists doctor
SELECT *
FROM doctors
WHERE specialization = 'Cardiologist';

----- Treatment Report details
Select*from treatments;

SELECT
    t.treatment_id AS 'Treatment ID',
    p.patient_name AS 'Patient Name',
    d.doctor_name AS 'Doctor Name',
    a.appointment_date AS 'Appointment Date',
    t.diagnosis AS 'Diagnosis',
    t.treatment_details AS 'Treatment Details',
    t.treatment_date AS 'Treatment Date'
FROM treatments t
JOIN appointment a
ON t.appointment_id = a.appointment_id
JOIN patients p
ON a.patient_id = p.patient_id
JOIN doctors d
ON a.doctor_id = d.doctor_id
ORDER BY t.treatment_date;


----- Find a particular diagnosis
Select*from treatments where diagnosis = 'Skin Allergy';


----- Bills list
select*from bills;

----- complete billing report
SELECT
    b.bill_id AS 'Bill ID',
    p.patient_name AS 'Patient Name',
    t.diagnosis AS 'Diagnosis',
    b.total_amount AS 'Total Amount',
    b.bill_date AS 'Bill Date',
    b.bill_status AS 'Bill Status'
FROM bills b
JOIN patients p
ON b.patient_id = p.patient_id
JOIN treatments t
ON b.treatment_id = t.treatment_id
ORDER BY b.bill_date;

----- paid and unpaid bills
Select*from bills where bill_status = 'Paid';
Select*from bills where bill_stauts = 'unpaid';

----- Highest bills
SELECT *
FROM bills
ORDER BY total_amount DESC;



----- Payment list
Select*from payments;

SELECT
    pay.payment_id AS 'Payment ID',
    p.patient_name AS 'Patient Name',
    pay.bill_id AS 'Bill ID',
    pay.payment_amount AS 'Payment Amount',
    pay.payment_date AS 'Payment Date',
    pay.payment_method AS 'Payment Method'
FROM payments pay
JOIN bills b
ON pay.bill_id = b.bill_id
JOIN patients p
ON b.patient_id = p.patient_id
ORDER BY pay.payment_date;

----- UPI Payments
SELECT *
FROM payments
WHERE payment_method = 'UPI';

----- Cash payments
SELECT *
FROM payments
WHERE payment_method = 'CASH';



SELECT
    b.bill_id AS 'Bill ID',
    p.patient_name AS 'Patient Name',
    b.total_amount AS 'Bill Amount',
    COALESCE(SUM(pay.payment_amount), 0) AS 'Paid Amount',
    b.total_amount -
    COALESCE(SUM(pay.payment_amount), 0) AS 'Balance',
    b.bill_status AS 'Status'
FROM bills b
JOIN patients p
ON b.patient_id = p.patient_id
LEFT JOIN payments pay
ON b.bill_id = pay.bill_id
GROUP BY
    b.bill_id,
    p.patient_name,
    b.total_amount,
    b.bill_status;






