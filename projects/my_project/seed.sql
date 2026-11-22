/* ==========================================================================
   seed.sql   YOUR SAMPLE ROWS                     (Part 4, Step 4 of the guide)
   The app runs this right after schema.sql, every time it starts. This is
   the data your site shows, so make it realistic.

   Requirements
     * At least 10 rows in every table.
     * Parent rows first: a row must exist before a foreign key points at it.
     * Text and dates go in single quotes: 'Ana Lopez', '2026-03-15'.
       Numbers and NULL do not.
     * A name with an apostrophe doubles it: 'O''Brien'.

   One INSERT can add many rows, separated by commas:
       INSERT INTO authors (author_id, name) VALUES
           (1, 'Jane Austen'),
           (2, 'Mary Shelley');

   Look at projects/library_example/seed.sql for a finished example.
   Write your INSERT statements below this line.
   ========================================================================== */

-- Offroad Trips sample data (SQLite)
-- All names are made up. Emails use the reserved @example.com domain.

-- turn on foreign key checks for this connection
PRAGMA foreign_keys = ON;
-- Offroad Trips sample data (SQLite)

-- 10 trail guides; guides 7 through 10 lead no trips yet
INSERT INTO trail_guide (guide_name, guide_phone, guide_years_exp) VALUES
    ('Rosa Delgado', '209-555-0101', 12),
    ('Hank Whitfield', '209-555-0102', 8),
    ('Priya Sandhu', '209-555-0103', 5),
    ('Marcus Tran', '209-555-0104', 15),
    ('Lena Okafor', '209-555-0105', 3),
    ('Dusty McAllister', '209-555-0106', 20),
    ('Sofia Ramirez', '209-555-0107', 7),
    ('Ben Kowalczyk', '209-555-0108', 1),
    ('Tasha Redcloud', '209-555-0109', 10),
    ('Owen Prescott', '209-555-0110', 4);

-- 12 trips in 2026; trips 11 and 12 are still upcoming, trip 12 has no sign-ups yet
INSERT INTO offroad_trip (location, trip_date, trip_fee, guide_id) VALUES
    ('Johnson Valley OHV, CA', '2026-02-21', 109.00, 3),
    ('Death Valley Titus Canyon, CA', '2026-03-07', 159.00, 6),
    ('Hollister Hills SVRA, CA', '2026-04-18', 89.00, 1),
    ('Oceano Dunes, CA', '2026-05-09', 129.00, 2),
    ('Rubicon Trail, CA', '2026-06-13', 249.00, 4),
    ('Sierra Trail, CA', '2026-07-11', 179.00, 1),
    ('Fordyce Creek Trail, CA', '2026-08-15', 229.00, 6),
    ('Moab Hell''s Revenge, UT', '2026-09-19', 299.00, 4),
    ('Carnegie SVRA, CA', '2026-10-03', 79.00, 1),
    ('Anza-Borrego Desert, CA', '2026-11-14', 139.00, 5),
    ('Mojave Road, CA', '2026-12-05', 199.00, 2),
    ('Big Bear Gold Mountain, CA', '2026-12-19', 149.00, 4);

-- 30 members; the last two have never signed up for a trip
INSERT INTO member (member_name, date_joined, member_email) VALUES
    ('Jake Morales', '2024-01-11', 'jake.morales@example.com'),
    ('Emily Chen', '2024-02-13', 'emily.chen@example.com'),
    ('Raj Patel', '2024-03-19', 'raj.patel@example.com'),
    ('Kayla Brooks', '2024-04-23', 'kayla.brooks@example.com'),
    ('Luis Herrera', '2024-06-07', 'luis.herrera@example.com'),
    ('Nina Kowalski', '2024-07-12', 'nina.kowalski@example.com'),
    ('Omar Haddad', '2024-08-05', 'omar.haddad@example.com'),
    ('Grace Nguyen', '2024-09-04', 'grace.nguyen@example.com'),
    ('Tyler Benson', '2024-10-11', 'tyler.benson@example.com'),
    ('Ava Singh', '2024-11-15', 'ava.singh@example.com'),
    ('Carlos Mendoza', '2024-12-15', 'carlos.mendoza@example.com'),
    ('Hannah Fischer', '2025-01-18', 'hannah.fischer@example.com'),
    ('Derek Owens', '2025-03-01', 'derek.owens@example.com'),
    ('Maya Johnson', '2025-04-03', 'maya.johnson@example.com'),
    ('Kenji Watanabe', '2025-05-05', 'kenji.watanabe@example.com'),
    ('Isabel Torres', '2025-06-14', 'isabel.torres@example.com'),
    ('Wyatt Coleman', '2025-07-14', 'wyatt.coleman@example.com'),
    ('Fatima Rahman', '2025-08-21', 'fatima.rahman@example.com'),
    ('Logan Pierce', '2025-09-16', 'logan.pierce@example.com'),
    ('Chloe Martin', '2025-10-25', 'chloe.martin@example.com'),
    ('Diego Alvarez', '2025-11-26', 'diego.alvarez@example.com'),
    ('Sarah Kim', '2026-01-02', 'sarah.kim@example.com'),
    ('Ethan Brooks', '2026-02-06', 'ethan.brooks@example.com'),
    ('Zoe Anderson', '2026-03-09', 'zoe.anderson@example.com'),
    ('Victor Nunez', '2026-04-18', 'victor.nunez@example.com'),
    ('Olivia Grant', '2026-05-18', 'olivia.grant@example.com'),
    ('Sam Rivera', '2026-06-25', 'sam.rivera@example.com'),
    ('Leah Goldberg', '2026-07-20', 'leah.goldberg@example.com'),
    ('Andre Washington', '2026-08-25', 'andre.washington@example.com'),
    ('Mia Castillo', '2026-09-21', 'mia.castillo@example.com');

-- 55 sign-ups in date order; paid is 1 for yes, 0 for no
-- every signup_date is after the member joined and before the trip date
INSERT INTO signup (trip_id, member_id, paid, signup_date) VALUES
    (2, 3, 1, '2025-12-26'),
    (2, 11, 1, '2025-12-26'),
    (1, 10, 1, '2025-12-28'),
    (2, 1, 1, '2026-01-15'),
    (1, 16, 1, '2026-01-20'),
    (1, 14, 1, '2026-01-24'),
    (1, 9, 1, '2026-01-27'),
    (2, 18, 1, '2026-01-29'),
    (2, 13, 1, '2026-02-01'),
    (3, 4, 0, '2026-02-03'),
    (3, 6, 1, '2026-02-04'),
    (3, 19, 1, '2026-02-11'),
    (3, 17, 1, '2026-02-13'),
    (4, 10, 1, '2026-03-02'),
    (4, 17, 1, '2026-03-08'),
    (3, 3, 1, '2026-04-05'),
    (5, 7, 1, '2026-04-10'),
    (3, 16, 1, '2026-04-11'),
    (5, 16, 1, '2026-04-15'),
    (4, 22, 1, '2026-04-19'),
    (5, 19, 1, '2026-04-25'),
    (6, 3, 1, '2026-04-27'),
    (4, 12, 1, '2026-05-01'),
    (4, 7, 1, '2026-05-03'),
    (5, 3, 1, '2026-05-03'),
    (5, 4, 1, '2026-05-05'),
    (5, 13, 1, '2026-05-07'),
    (6, 25, 1, '2026-05-07'),
    (5, 11, 1, '2026-05-13'),
    (6, 8, 1, '2026-05-22'),
    (7, 22, 1, '2026-06-05'),
    (7, 11, 1, '2026-06-08'),
    (6, 10, 1, '2026-06-09'),
    (6, 24, 1, '2026-06-12'),
    (7, 19, 1, '2026-06-25'),
    (6, 27, 1, '2026-06-27'),
    (8, 26, 1, '2026-07-17'),
    (9, 10, 1, '2026-07-20'),
    (8, 2, 1, '2026-07-28'),
    (7, 2, 1, '2026-08-04'),
    (8, 18, 1, '2026-08-17'),
    (8, 4, 1, '2026-08-18'),
    (8, 20, 1, '2026-08-21'),
    (8, 9, 1, '2026-08-29'),
    (10, 26, 1, '2026-09-07'),
    (9, 1, 1, '2026-09-08'),
    (9, 28, 1, '2026-09-09'),
    (9, 5, 1, '2026-09-16'),
    (10, 6, 1, '2026-09-19'),
    (9, 25, 1, '2026-09-28'),
    (11, 25, 0, '2026-10-11'),
    (10, 20, 1, '2026-10-16'),
    (10, 22, 1, '2026-10-27'),
    (11, 9, 1, '2026-10-29'),
    (11, 14, 0, '2026-11-18');
