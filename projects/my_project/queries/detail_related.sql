/* detail_related.sql   DETAIL PAGE: the table under the item      (Part 4, Step 8 of the guide)
   Returns many rows that belong to the item on the detail page, shown as
   a table. Its heading is DETAIL_RELATED_TITLE in settings.py.
   Placeholders:  :id   the same id as detail.sql

   The library version: projects/library_example/queries/detail_related.sql
   Write your SQL below this comment. */

   SELECT m.member_name AS "Member",
          s.signup_date AS "Signup Date",
          CASE WHEN s.paid = 1 THEN 'Paid' ELSE 'Not Paid' END AS "Paid"
   FROM signup s
   JOIN member m ON m.member_id = s.member_id
   WHERE s.trip_id = :id  
   ORDER BY s.signup_date DESC;


