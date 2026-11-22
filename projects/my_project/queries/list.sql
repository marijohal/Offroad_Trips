/* list.sql   BROWSE PAGE: every item in a table      (Part 4, Step 6 of the guide)
   Returns many rows. Must include a column named id: the page hides it
   and uses it to link each row to its detail page. Every other column
   is shown, with its alias as the column heading.
   Placeholders: none.

   The library version: projects/library_example/queries/list.sql
   Write your SQL below this comment. */

SELECT t.trip_id AS id,
       t.location AS "Location",
       g.guide_name AS "Guide",
       t.trip_date AS "Trip Date"
FROM offroad_trip t
JOIN trail_guide g ON t.guide_id = g.guide_id
ORDER BY trip_date DESC;
