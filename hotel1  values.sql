-- guest

INSERT INTO hotel1.guest(guestID, fname, lname, phone, email, nationality, gender, date_birth, id_passport)
VALUES('gst01', 'Youssef', 'Mohammed', '12345678', 'youssefmohammed@gmail.com', 'egyptian', 'male', '2004-10-23', '30410230123456'),
('gst02', 'Mohammed', 'Mahran', '12345679', 'mohammedmahran@gmail.com', 'egyptian', 'male', '1995-07-25', '29507250123457'),
('gst03', 'Manar', 'Omran', '12345670', 'manar123@gmail.com', 'Saudi', 'female', '1995-05-20', 'S12345678'),
('gst04', 'Jean', 'Moreau', '12345671', 'jeanmoreau@gmail.com', 'French', 'male', '2000-01-10', 'F98765432'),
('gst05', 'Abdullah', 'Morad', '12345672', 'abdullah852@gmail.com', 'egyptian', 'male', '1985-02-28', '28502280123458'),
('gst06', 'Farida', 'Mansour', '12345673', 'farida789@gmail.com', 'egyptian', 'female', '1973-10-06', '27310060123459'),
('gst07', 'Hussien', 'Abdulghafar', '12345674', 'hussien@gmail.com', 'egyptian', 'male', '1967-07-07', '26707070123460'),
('gst08', 'Mohammed', 'Abbas', '12345675', 'mohammedabbas@gmail.com', 'egyptian', 'male', '1991-08-25', '29108250123461'),
('gst09', 'Abdulrahman', 'Mohammed', '12345676', NULL, 'egyptian', 'male', '2004-07-07', '30407070123462'),
('gst10', 'John', 'Jourdan', '12345685', 'jourdan@gmail.com', 'American', 'male', '1990-12-01', 'US45879632'),
('gst11', 'Michel', 'Girard', '12345677', 'michel753', 'American', 'male', '2001-09-28', 'US98732145');

--------------------------------------------------------------------------------------------------------------------------------------------------
-- room_type
-- single  150 , double 250  , suite 1000 , triple 300       10 single   4 double , 4 triple , 2 suite   -    4 in f floor   4 in sec , 2 triple 1 single  in third , 3 double in 4th  , 2 triple 1 double 1 single 5th  , 2suite 6th
insert into hotel1.room_type(room_type_id , type_name , Max_accupancy , description)
values ('RT01' , 'Single room' , 1 , 'A room with one single bed and Closet'), 
('RT02' , 'Double room' , 2 , 'A room with a large bed , largeCloset and large bathroom'),
 ('RT03' , 'Teiple room' , 3 , 'A room with three single beds and three individual Closets'),
 ('RT04' , 'suite' , 2 , 'Suite with big bed , dress room , large bathroom and a balcony');
 
 select * from hotel1.room_type;
------------------------------------------------------------------------------------------------------------------------------------------------------
 insert into hotel1.room(roomNO , room_type_id , floor , status , price_per_night)
 values ('RM19' , 'RT04' , 6 , 'accupied' , '1000') , ('RM20' , 'RT04' , 6 , 'available' , '1000');

-------------
insert into hotel1.room(roomNO , room_type_id , floor , status , price_per_night)
values ('RM15' , 'RT02' , 4 , 'available' , '250') , ('RM16' , 'RT02' , 4 , 'available' , '250') , ('RM17' , 'RT02' , 4 , 'available' , '250') , ('RM18' , 'RT02' , 5 , 'accupied' , '250');
------------
insert into hotel1.room(roomNO , room_type_id , floor , status , price_per_night)
values ('RM11' , 'RT03' , 3 , 'available' , '300') , ('RM12' , 'RT03' , 3 , 'accupied' , '300') , ('RM13' , 'RT03' , 5 , 'available' , '300') , ('RM14' , 'RT03' , 5 , 'available' , '300');
--------------
INSERT INTO hotel1.room
(roomNO, room_type_id, floor, status, price_per_night)
VALUES
('RM1',  'RT01', 1, 'Occupied', 150),
('RM2',  'RT01', 1, 'Available', 150),
('RM3',  'RT01', 1, 'Occupied', 150),
('RM4',  'RT01', 1, 'Available', 150),
('RM5',  'RT01', 2, 'Occupied', 150),
('RM6',  'RT01', 2, 'Occupied', 150),
('RM7',  'RT01', 2, 'Occupied', 150),
('RM8',  'RT01', 2, 'Occupied', 150),
('RM9',  'RT01', 3, 'Available', 150),
('RM10', 'RT01', 5, 'Available', 150);

select * from hotel1.room order by roomNO; 
 ----------------------------------------------------------------------------------------------
 
 INSERT INTO hotel1.reservation (reservationID, guestID, roomNO, check_in_date, check_out_date, reservation_status)
VALUES ('RS01', 'gst01', 'RM20', '2025-12-02', '2025-12-10', 'Confirmed'),
('RS02', 'gst02', 'RM1', '2025-12-12', '2025-12-15', 'Confirmed'),
('RS03', 'gst03', 'RM3', '2025-12-01', '2025-12-06', 'Pending'),
('RS04', 'gst04', 'RM5', '2025-11-25', '2025-11-29', 'Confirmed'),
('RS05', 'gst05', 'RM6', '2025-12-14', '2025-12-26', 'Confirmed'),
('RS06', 'gst06', 'RM18', '2025-11-20', '2025-11-30', 'Confirmed'),
('RS07', 'gst07', 'RM18', '2025-11-20', '2025-11-30', 'Confirmed'),
('RS08', 'gst08', 'RM12', '2025-12-10', '2025-12-21', 'Confirmed'),
('RS09', 'gst09', 'RM12', '2025-12-10', '2025-12-21', 'Confirmed'),
('RS10', 'gst10', 'RM10', '2025-11-25', '2025-12-01', 'Cancelled'),
('RS11', 'gst11', 'RM8', '2025-12-28', '2026-01-05', 'Confirmed');

 --------------------------------------------------------------------------------------------------------
USE hotel1;
DELIMITER $$

CREATE TRIGGER calc_amount_before_insert
BEFORE INSERT ON hotel1.payment
FOR EACH ROW
BEGIN
    DECLARE nights INT;
    DECLARE price DECIMAL(10,2);

    -- حساب عدد الليالي
    SELECT DATEDIFF(r.check_out_date, r.check_in_date)
    INTO nights
    FROM hotel1.reservation r
    WHERE r.reservationID = NEW.reservationID;

    -- جلب سعر الليلة
    SELECT rm.price_per_night
    INTO price
    FROM hotel1.room rm
    JOIN hotel1.reservation r 
        ON rm.roomNO = r.roomNO
    WHERE r.reservationID = NEW.reservationID;

    -- حساب المبلغ النهائي
    SET NEW.amount = nights * price;
END$$

DELIMITER ;

-- ----------------------------------------------------------------------------------------------

select* from hotel1.payment; 
INSERT INTO hotel1.payment (paymentID, reservationID, payment_date, payment_method)
VALUES 
('p01', 'RS01', '2025-12-10', 'Card'),
('p02', 'RS02', '2025-12-15', 'Cash'),
('p03', 'RS03', '2025-12-06', 'Card'),
('p04', 'RS04', '2025-11-29', 'Cash'),
('p05', 'RS05', '2025-12-26', 'Card'),
('p06', 'RS06', '2025-11-30', 'Card'),
('p07', 'RS07', '2025-11-30', 'Card'),
('p08', 'RS08', '2025-12-21', 'Cash'),
('p09', 'RS09', '2025-12-21', 'Cash'),
('p10', 'RS10', '2025-12-01', 'Cash');

SELECT* FROM hotel.payment;
---------------------------------------------------------------------------------
INSERT INTO hotel1.employees (employeeID, fname, lname, position, salary, phone, email , departmentID) VALUES
('em01', 'Ahmed', 'Hassan', 'Manager', 8000, '12398765', 'ahmed.hassan@hotel.com' , 'DP01'),

-- Reception (6)
('em02', 'Youssef', 'Mahmoud', 'Reception', 5000, '12345871', 'youssef.mahmoud@hotel.com' ,'DP02'),
('em03', 'Karim', 'Fahmy', 'Reception', 5000, '12398432', 'karim.fahmy@hotel.com' , 'DP02'),
('em04', 'Omar', 'Adel', 'Reception', 5000, '12367452', 'omar.adel@hotel.com' , 'DP02'),
('em05', 'Mostafa', 'Tarek', 'Reception', 5000, '12355981', 'mostafauu@gmail.com' , 'DP02'),
('em06', 'Ali', 'Samir', 'Reception', 5000, '12366741', 'ali.samir@hotel.com' , 'DP02'),
('em07', 'Hassan', 'Ibrahim', 'Reception', 5000, '12390124', NULL , 'DP02'),

-- Security (6)
('em08', 'Mahmoud', 'Reda', 'Security', 4000, '12377531', 'mohammed7854@gmail.com' , 'DP03'),
('em09', 'Tamer', 'Hussein', 'Security', 4000, '12366421', 'tamer.hussein@hotel.com' , 'DP03'),
('em10', 'Fady', 'Magdy', 'Security', 4000, '12388931', NULL , 'DP03'),
('em11', 'Nabil', 'Khaled', 'Security', 4000, '12344219', NULL, 'DP03'),
('em12', 'Sherif', 'Sobhy', 'Security', 4000, '12390562', 'sherif.sobhy@hotel.com', 'DP03'),
('em13', 'Wael', 'Amin', 'Security', 4000, '12378315', NULL, 'DP03'),

-- Room Service (6)
('em14', 'Islam', 'Saad', 'Room Service', 4000, '12351234', 'islam.saad@hotel.com' , 'DP04'),
('em15', 'Hany', 'Lotfy', 'Room Service', 4000, '12384751', 'hany@gmai;.com' , 'DP04'),
('em16', 'Alaa', 'Metwally', 'Room Service', 4000, '12366752', 'alaa52975@gmail.com' , 'DP04'),
('em17', 'Mina', 'Shaker', 'Room Service', 4000, '12391562', 'mina.shaker@hotel.com' , 'DP04'),
('em18', 'Yasser', 'Fouad', 'Room Service', 4000, '12322481', 'yasser789@gmail.com' , 'DP04'),
('em19', 'Amr', 'Ezzat', 'Room Service', 4000, '12366259', 'amr123@gmail.com' , 'DP04'),

-- Cleaning Staff (6)
('em20', 'Sabry', 'Mostafa', 'Cleaning', 3500, '12319542', 'sabrymostafa@gmail.com' , 'DP05'),
('em21', 'Gamal', 'Farag', 'Cleaning', 3500, '12388831', 'gamalfarag@gmail.com' , 'DP05'),
('em22', 'Sayed', 'Abbas', 'Cleaning', 3500, '12371643', NULL , 'DP05'),
('em23', 'Eid', 'Saleh', 'Cleaning', 3500, '12390511', NULL , 'DP05'),
('em24', 'Hamada', 'Zaki', 'Cleaning', 3500, '12312845', 'hamadazaki@gmail.com' , 'DP05'),
('em25', 'Magdy', 'Shehata', 'Cleaning', 3500, '12347326', NULL , 'DP05');

select * from hotel1.employees;
------------------------------------------------------------------------------------------------

INSERT INTO hotel1.department (departmentID, department_name)
VALUES ('DP01', 'Manager'),
('DP02', 'Reception'),
('DP03', 'Security'),
('DP04', 'Room Service'),
('DP05', 'Cleaning');
select * from hotel1.department;
----------------------------------------------------------------------
INSERT INTO hotel1.service (service_ID, service_name, service_price, description)
VALUES
('SR01', 'Laundry', 50, 'Clothes washing service'),
('SR02', 'Breakfast', 100, 'Daily breakfast buffet'),
('SR03', 'Gym Access', 150, 'Daily gym pass');

---------------------------------------------------------------------------------
INSERT INTO hotel1.feedback (feedback_ID, guestID, rating, comments)
VALUES('FB02', 'gst02', 4, 'good'),
('FB03', 'gst03', 5, 'good'),
('FB04', 'gst04', 3, 'good'),
('FB05', 'gst05', 4, 'good'),
('FB07', 'gst07', 2, 'good'),
('FB08', 'gst08', 4, 'good'),
('FB09', 'gst09', 3, 'good'),
('FB10', 'gst10', 5, null);
-------------------------------------------------------------------------
INSERT INTO hotel1.service_usage (SUID, guestID, service_ID, date, quantity, total_price)
VALUES('SU01', 'gst01', 'SR01', '2025-12-05', 2, 100),
('SU02', 'gst01', 'SR02', '2025-12-06', 1, 100),
('SU04', 'gst03', 'SR03', '2025-12-02', 3, 450),
('SU07', 'gst06', 'SR02', '2025-11-25', 1, 100),
('SU08', 'gst07', 'SR01', '2025-11-21', 3, 150),
('SU10', 'gst09', 'SR03', '2025-12-12', 1, 150);
-- -------------------------------------------------------------------------

