create schema hotel1;

create table hotel1.guest(
guestID      varchar(6) primary key     not null,
fname        varchar(15)                not null,
lname        varchar(15),
phone        char(8)                     unique,
email        varchar(50)                 null,
nationality  varchar(20),
gender       varchar(8),
date_birth   date,
id_passport VARCHAR(14)               not null
);


create table hotel1.room_type(
room_type_id    varchar (6)   primary key,
type_name       varchar (20)  not null,
max_accupancy   integer       not null,
description     varchar(100)
);

create table hotel1.room(
roomNO       varchar(6)      primary key,
room_type_id  varchar(6)     not null,
floor         integer        not null,
status        varchar(20)    not null,
price_per_night    integer   not null,
foreign key (room_type_id) references hotel1.room_type(room_type_id)
);

select * from hotel1.reservation;
create table hotel1.reservation(
reservationID      varchar(6)  primary key    not null,
guestID            varchar(6)                 not null  ,
roomNO             varchar(6)                 not null,
check_in_date      date                       not null,
check_out_date     date                       not null,
reservation_status   varchar(20)              not null,
foreign key(guestID ) references hotel1.guest(guestID),
foreign key(roomNO) references hotel1.room(roomNO)
);

create table hotel1.payment(
paymentID    varchar(6)  primary key         not null,
reservationID   varchar(6)                   not null,
amount           integer                     not null,
payment_date       date                      not null,
payment_method    varchar(8)                 not null,
foreign key(reservationID) references hotel1.reservation(reservationID)
);


create table hotel1.service(
service_ID  varchar(6)     primary key            not null,
service_name     varchar(15)                      not null,
service_price     integer                         not null,
description       varchar(50)
);

create table hotel1.service_usage(
SUID            varchar(6)  primary key     not null,
guestID	        varchar(6)                  not null,
service_ID      varchar(6)                  not null,
date            date                        not null,
quantity        integer                     not null,
total_price     integer                     not null,
foreign key (guestID) references hotel1.guest(guestID),
foreign key (service_ID) references hotel1.service(service_ID)
);

create table hotel1.department(
departmentID        varchar(6)    primary key       not null,
department_name     varchar(20)                not null
);

create table hotel1.employees(
employeeID    varchar(6)    primary key          not null,
fname         varchar(15)                        not null,
lname         varchar(15),
position      varchar(20)                        not null,
salary        integer                            not null,
phone         char(8)  unique,
email         varchar(35),
departmentID  varchar(6)                             not null,
foreign key (departmentID)  references hotel1.department (departmentID)
);

create table hotel1.feedback(
feedback_ID     varchar(6)   primary key        not null,
guestID         varchar(6)                        not null,
rating          tinyint,
comments        varchar(50) ,
foreign key  (guestID)  references hotel1.guest(guestID),
CONSTRAINT chk_rating CHECK (rating BETWEEN 1 AND 5)
);





