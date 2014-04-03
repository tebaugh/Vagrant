CREATE OR REPLACE VIEW active_venues AS
  SELECT venue_id AS active_venue_id, name AS venue, street_address AS address, type, postal_code AS zip, country_code 
  FROM VENUES
  where active = true;
