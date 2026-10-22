# Hotel Database System

A MySQL database project for managing a hotel's core operations, including guests, rooms, reservations, payments, services, employees, and feedback.

## Project Overview

This project models a hotel management system using a relational database schema. It includes:

- Guest registration and personal information
- Room types and room inventory
- Reservation tracking
- Payment records and billing logic
- Services and service usage records
- Employee and department management
- Customer feedback and reporting views

## Database Structure

The project contains the following main tables:

- `guest`
- `room_type`
- `room`
- `reservation`
- `payment`
- `service`
- `service_usage`
- `department`
- `employees`
- `feedback`

It also contains views such as:

- `v_guest_info`
- `v_room_details`
- `v_reservation_details`
- `v_payment_details`
- `v_service_usage`
- `v_employee_department`
- `v_guest_feedback`

## Files in This Project

- `HMS.sql` — main schema and table definitions
- `hotel1  values.sql` — sample data inserts and trigger logic
- `views (HMS).sql` — database views used for reporting
- `Queries  (HMS).sql` — example queries to inspect the database
- `schema Hotal Diagram.png` — schema diagram
- `Hotel Management System Database.pptx` — presentation or project documentation

## Setup Instructions

1. Open MySQL Workbench or your preferred MySQL client.
2. Create a new database or schema named `hotel1`.
3. Run the SQL scripts in this order:
   - `HMS.sql`
   - `hotel1  values.sql`
   - `views (HMS).sql`
   - `Queries  (HMS).sql`
4. Verify the tables and views were created successfully.

## Example Usage

The project supports tasks such as:

- viewing active reservations
- checking room availability by floor and type
- calculating customer payments by nights stayed
- tracking hotel services used by guests
- reviewing employee departments and salaries
- summarizing guest feedback

## GitHub Push

To upload this project to GitHub:

```bash
git init
git branch -M main
git add .
git commit -m "Initial commit"
```

Then create a repository on GitHub and connect it:

```bash
git remote add origin https://github.com/abdallah-mohamed7/<repository-name>.git
git push -u origin main
```

> Note: the profile URL you shared is a GitHub profile, not a repository. Create a repository first, then push the project to that repository.

## License

This project is intended for educational and academic use.
