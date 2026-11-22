/* detail.sql   DETAIL PAGE: one item, everything about it      (Part 4, Step 7 of the guide)
   Returns ONE row (or none, if the id does not exist). The first column
   after id becomes the page heading; every other column is listed below
   it with its alias as the label.
   Placeholders:  :id   the id of the row that was clicked

   The library version: projects/library_example/queries/detail.sql
   Write your SQL below this comment. */
-- One trip's details, its guide's info, and how many members signed up.

SELECT t.trip_id           AS id,
       t.location          AS "Location",
       t.trip_date         AS "Trip Date",
       t.trip_fee          AS "Trip Fee",
       g.guide_name        AS "Guide",
       g.guide_phone       AS "Guide Phone",
       g.guide_years_exp   AS "Guide Years of Experience",
       (SELECT COUNT(*) FROM signup s WHERE s.trip_id = t.trip_id) AS "Members Signed Up"
FROM offroad_trip t
JOIN trail_guide g ON g.guide_id = t.guide_id
WHERE t.trip_id = :id;
