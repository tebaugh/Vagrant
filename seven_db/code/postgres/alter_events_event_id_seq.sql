ALTER SEQUENCE events_event_id_seq OWNED BY events.event_id;
SELECT setval('events_event_id_seq', (SELECT max(event_id) FROM events));
