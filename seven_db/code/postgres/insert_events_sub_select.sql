INSERT INTO events (title, starts, ends, venue_id)
  VALUES ('Moby', '2012-02-06 21:00', '2012-02-06 23:00', (
  SELECT venue_id
  FROM venues
  WHERE name='Crystal Ballroom')
);
