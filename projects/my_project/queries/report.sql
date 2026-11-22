/* report.sql   REPORT PAGE: a summary with GROUP BY      (Part 4, Step 10 of the guide)
   Returns one row per group. If the LAST column is a number, the page
   also draws a bar for it, so put the number you want to compare last.
   Placeholders: none.

   The library version: projects/library_example/queries/report.sql
   Write your SQL below this comment. */

--Number of Trips a guided has been assigned to guide.
-- || joins strings together
select guide_name,  t."Average Trip Fee", 
t."Number of Guided Trips" 
from trail_guide g 
JOIN (
select guide_id,
       '$' || round(avg(trip_fee),2) AS "Average Trip Fee",      
       count(*) AS "Number of Guided Trips"
from  offroad_trip
GROUP BY guide_id
) t ON g.guide_id = t.guide_id 
order BY t."Number of Guided Trips" DESC, g.guide_name; 