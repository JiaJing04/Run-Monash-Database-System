--****PLEASE ENTER YOUR DETAILS BELOW****
--T4-rm-mods.sql

--Student ID: 33589739
--Student Name: Hew Jia Jing

/* Comments for your marker:

assumming individual competitors in a carnival is entrants (based on the scenario in assignment brief)


*/

--(a)

DESC competitor;

ALTER TABLE competitor ADD (
    comp_events_completed NUMBER(3) DEFAULT 0 NOT NULL
);

COMMENT ON COLUMN competitor.comp_events_completed IS
    'Number of events completed by the competitor';

DESC competitor;

SELECT *
FROM competitor;

UPDATE competitor c1
SET comp_events_completed = 
(
    SELECT COUNT(*)
    FROM entry e JOIN competitor c2 ON e.comp_no = c2.comp_no
    WHERE c2.comp_no = c1.comp_no and e.entry_finishtime IS NOT NULL
);

SELECT *
FROM competitor;

COMMIT;

DESC competitor;

SELECT *
FROM competitor;


--(b)

DESC entry;

SELECT *
FROM entry;

DROP TABLE entry_charity CASCADE CONSTRAINTS PURGE;

CREATE TABLE entry_charity (
    event_id   NUMBER(6) NOT NULL,
    entry_no   NUMBER(5) NOT NULL,
    char_id    NUMBER(3) NOT NULL,
    char_percentage NUMBER(3) DEFAULT 0 NOT NULL
);

COMMENT ON COLUMN entry_charity.event_id IS
    'Event id (event id of competitor participated)';

COMMENT ON COLUMN entry_charity.entry_no IS
    'Entry number (entry number of competitor participated)';

COMMENT ON COLUMN entry_charity.char_id IS
    'Charity unique identifier (charity of competitor supported)';

COMMENT ON COLUMN entry_charity.char_percentage IS
    'Charity fund percentage (0 to 100) from the total funds raised';

ALTER TABLE entry_charity ADD CONSTRAINT entry_charity_pk PRIMARY KEY (event_id, entry_no, char_id);

ALTER TABLE entry_charity ADD CONSTRAINT chk_percentage_valid CHECK (char_percentage BETWEEN 0 AND 100);

ALTER TABLE entry_charity ADD CONSTRAINT entrycharity_entry_fk FOREIGN KEY (event_id, entry_no)
    REFERENCES entry (event_id, entry_no);

ALTER TABLE entry_charity ADD CONSTRAINT entrycharity_charity_fk FOREIGN KEY (char_id)
    REFERENCES charity (char_id);

INSERT INTO entry_charity (
    event_id, 
    entry_no, 
    char_id, 
    char_percentage)
SELECT event_id, entry_no, char_id, 100
FROM entry
WHERE char_id IS NOT NULL;

ALTER TABLE entry DROP CONSTRAINT charity_entry_fk;

ALTER TABLE entry DROP COLUMN char_id;

COMMIT;

DESC entry_charity;

SELECT *
FROM entry_charity;

DESC entry;

SELECT *
FROM entry;
