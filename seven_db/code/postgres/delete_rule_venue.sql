CREATE OR REPLACE RULE delete_venues as ON DELETE to venues DO INSTEAD
  update venues
    set active = FALSE
  WHERE name = OLD.name;
 
