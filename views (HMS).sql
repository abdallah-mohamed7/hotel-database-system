-- views

CREATE VIEW hotel1.v_guest_info AS
SELECT 
    guestID,
    fname,
    lname,
    phone,
    email,
    nationality
FROM hotel1.guest;

CREATE VIEW hotel1.v_room_details AS
SELECT 
    r.roomNO,
    r.floor,
    r.status,
    r.price_per_night,
    rt.type_name,
    rt.max_accupancy
FROM hotel1.room r
JOIN hotel1.room_type rt
ON r.room_type_id = rt.room_type_id;

CREATE VIEW hotel1.v_reservation_details AS
SELECT 
    res.reservationID,
    g.fname,
    g.lname,
    r.roomNO,
    res.check_in_date,
    res.check_out_date,
    res.reservation_status
FROM hotel1.reservation res
JOIN hotel1.guest g
ON res.guestID = g.guestID
JOIN hotel1.room r
ON res.roomNO = r.roomNO;

CREATE VIEW hotel1.v_payment_details AS
SELECT 
    p.paymentID,
    p.amount,
    p.payment_date,
    p.payment_method,
    r.reservationID,
    g.fname,
    g.lname
FROM hotel1.payment p
JOIN hotel1.reservation r
ON p.reservationID = r.reservationID
JOIN hotel1.guest g
ON r.guestID = g.guestID;

CREATE VIEW hotel1.v_service_usage AS
SELECT 
    su.SUID,
    g.fname,
    g.lname,
    s.service_name,
    su.date,
    su.quantity,
    su.total_price
FROM hotel1.service_usage su
JOIN hotel1.guest g
ON su.guestID = g.guestID
JOIN hotel1.service s
ON su.service_ID = s.service_ID;

CREATE VIEW hotel1.v_employee_department AS
SELECT 
    e.employeeID,
    e.fname,
    e.lname,
    e.position,
    e.salary,
    d.department_name
FROM hotel1.employees e
JOIN hotel1.department d
ON e.departmentID = d.departmentID;

CREATE VIEW hotel1.v_guest_feedback AS
SELECT 
    f.feedback_ID,
    g.fname,
    g.lname,
    f.rating,
    f.comments
FROM hotel1.feedback f
JOIN hotel1.guest g
ON f.guestID = g.guestID;

