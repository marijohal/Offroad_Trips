# YOUR project's names and labels. Fill these in during Part 4, Step 2 of
# the guide (docs/04-write-your-sql.md). Change only the text inside the
# quotes. projects/library_example/settings.py shows every one filled in.

SITE_NAME = "Offroad Trips"            # the name at the top of every page
TAGLINE = "This site track Offroad Trips located across the USA."
ICON = "truck-flatbed"                            # any icon name from icons.getbootstrap.com

YOUR_NAME = "Maricruz Johal"
COURSE = "CIS 4720"                          # or CIS 2020
GITHUB_URL = "https://github.com/marijohal/Offroad_Trips.git"                              # your repository address, once you have one

# What one row on the Browse page is called, for example "recipe" and "recipes"
ITEM = "trip"
ITEMS = "trips"

BROWSE_TITLE = "All Trips"
BROWSE_INTRO = "Every trip in descending date order. Click one to see its details."

DETAIL_RELATED_TITLE = "Signed-up Members"
DETAIL_RELATED_EMPTY = "Nothing related to this one yet."

SEARCH_HINT = "Search by Trip Location / Guide Name"

REPORT_TITLE = "Guide"
REPORT_INTRO = "The number of trips each guide has been assigned."

ADD_TITLE = "Add an Offroad Trip"

# One entry for each box on the Add page, in the order they should appear.
# The name must match a placeholder in queries/add.sql (name "title" fills
# :title). Leave this list empty until you reach Step 11 of Part 4.
#
#   type "text"    a text box
#   type "number"  a number box
#   type "date"    a date picker, saved as YYYY-MM-DD
#   type "select"  a dropdown, filled by the query file named in "options"
#
# Example, from the library:
#   ADD_FORM = [
#       {"name": "title", "label": "Title", "type": "text", "required": True},
#       {"name": "author_id", "label": "Author", "type": "select",
#        "options": "queries/add_options.sql", "required": True},
#       {"name": "pages", "label": "Pages", "type": "number"},
#   ]
ADD_FORM = [
     {"name": "location", "label": "Location", "type": "text", "required": True},
     {"name": "guide_id", "label": "Guide", "type": "select", "options": "queries/add_guide_options.sql",
         "required": True},
     {"name": "trip_date", "label": "Trip Date", "type": "date", "required":True},
     {"name": "trip_fee",  "label": "Trip Fee",  "type": "number","required": True},
]