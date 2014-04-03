CREATE TABLE events (
  event_id SERIAL PRIMARY KEY,
  title text,
  starts timestamp,
  ends timestamp,
  venue_id integer references venues
);
