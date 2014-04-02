CREATE TABLE events (
  event_id SERIAL PRIMARY KEY,
  title varchar(255),
  starts timestamp,
  ends timestamp,
  venue_id int,
  FOREIGN KEY(venue_id) REFERENCES venues(venue_id)
);
