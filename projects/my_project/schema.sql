/* ==========================================================================
   schema.sql   YOUR TABLES                        (Part 4, Step 3 of the guide)
   The app runs this file first, every time it starts.

   Requirements
     * At least 3 tables, in third normal form.
     * Every table has a primary key:      some_id INTEGER PRIMARY KEY
     * At least 2 foreign keys linking the tables:
           FOREIGN KEY (author_id) REFERENCES authors(author_id)
     * Parent tables first. A table can only point at a table created
       above it.
     * CIS 4720 also: at least one CREATE VIEW and one CREATE TRIGGER,
       added at the bottom of this file in Part 4, Step 12.

   SQLite notes, if you are used to MySQL
     * INTEGER PRIMARY KEY numbers the rows for you. No AUTO_INCREMENT.
     * Use TEXT for words and dates (dates as 'YYYY-MM-DD'), INTEGER for
       whole numbers, REAL for decimals.
     * End every statement with a semicolon.

   Look at projects/library_example/schema.sql for a finished example.
   Write your CREATE TABLE statements below this line.
   ========================================================================== */
PRAGMA foreign_keys = ON;
--Foreign keys are off by default in SQLite.  SQLite won’t stop you from 
--inserting a foreign key that doesn’t exist unless you turn enforcement on for each connection

CREATE table trail_guide (
  guide_id INTEGER primary key,
  guide_name TEXT not null,
  guide_phone TEXT not null,
  guide_years_exp INTEGER not null);

CREATE TABLE offroad_trip(
  trip_id INTEGER primary key,
  location TEXT not null,
  trip_date TEXT not null,
  trip_fee float not null,
  guide_id INTEGER not null,
  foreign key (guide_id) REFERENCES trail_guide(guide_id)
);

CREATE TABLE member (
  member_id INTEGER primary key,
  member_name TEXT not null,
  date_joined TEXT DEFAULT CURRENT_DATE,
  member_email TEXT NOT NULL UNIQUE CHECK(
    member_email LIKE '%_@__%.__%' and
    member_email NOT LIKE '% %' and
    LENGTH(member_email) - LENGTH(REPLACE(member_email,'@', '')) = 1
  )
);

CREATE TABLE signup(
  signup_id INTEGER primary key,
  trip_id INTEGER not null REFERENCES offroad_trip(trip_id),
  member_id INTEGER not null REFERENCES member(member_id),
  paid NUMERIC DEFAULT 0,
  signup_date TEXT not null,
  UNIQUE (trip_id,member_id)
);

--Create a view of the list of trips that includes the guide for each trip.
CREATE VIEW trip_list AS
SELECT t.trip_id, t.location, g.guide_name, t.trip_date, t.trip_fee
FROM offroad_trip t 
JOIN trail_guide g ON g.guide_id = t.guide_id
ORDER BY t.trip_date DESC;

-- Create a trigger that checks if a trip date is greate than 2 years out.
CREATE TRIGGER check_trip_date
BEFORE INSERT ON offroad_trip
WHEN CAST(strftime('%Y', NEW.trip_date) AS INTEGER)
  > CAST(strftime('%Y', 'now') AS INTEGER) + 2
BEGIN
  SELECT RAISE(ABORT, 'Trip date cannot be more than 2 years past the current year');
END;

-- try insert
-- "Black Bear Pass, CO", "Hank Witfield", "June 8, 2027", 298.00
-- "Trans-America Trail (TAT)", "Rosa Delgado", "July 5, 2028", 445.00
-- To trigger an error enter May 4, 2030