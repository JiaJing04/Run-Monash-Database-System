--****PLEASE ENTER YOUR DETAILS BELOW****
--T3-rm-dm.sql

--Student ID: 33589739
--Student Name: Hew Jia Jing

/* Comments for your marker:




*/

--(a)

DROP SEQUENCE competitor_seq;

DROP SEQUENCE team_seq;

CREATE SEQUENCE competitor_seq START WITH 100 INCREMENT BY 5;

CREATE SEQUENCE team_seq START WITH 100 INCREMENT BY 5;

--(b)


INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone
) VALUES ( 
    competitor_seq.NEXTVAL,
    'Keith',
    'Rose',
    'M',
    TO_DATE('23/SEP/2004','DD/MON/YYYY'),
    'keithrose@gmail.com',
    'Y',
    '0422141112'
);

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES ( 
    (
        SELECT e.event_id
        FROM event e JOIN carnival c ON e.carn_date = c.carn_date JOIN eventtype et ON e.eventtype_code = et.eventtype_code
        WHERE upper(c.carn_name) = upper('RM WINTER SERIES CAULFIELD 2025') AND upper(et.eventtype_desc) = upper('10 km run')
    ),
    (
        SELECT nvl(max(e.entry_no), 0) + 1
        FROM entry e
        WHERE e.event_id = 
        (
            SELECT ev.event_id
            FROM event ev JOIN carnival c ON ev.carn_date = c.carn_date JOIN eventtype et ON ev.eventtype_code = et.eventtype_code
            WHERE upper(c.carn_name) = upper('RM WINTER SERIES CAULFIELD 2025') AND upper(et.eventtype_desc) = upper('10 km run')
        )
    ), 
    NULL,
    NULL,
    NULL,
    competitor_seq.CURRVAL,
    NULL,
    (
        SELECT c.char_id
        FROM charity c
        WHERE upper(c.char_name) = upper('Salvation Army')
    )
);


INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone
) VALUES ( 
    competitor_seq.NEXTVAL,
    'Jackson',
    'Bull',
    'M',
    TO_DATE('21/SEP/2004','DD/MON/YYYY'),
    'jacksonbull@gmail.com',
    'Y',
    '0422412524'
);

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES ( 
    (
        SELECT e.event_id
        FROM event e JOIN carnival c ON e.carn_date = c.carn_date JOIN eventtype et ON e.eventtype_code = et.eventtype_code
        WHERE upper(c.carn_name) = upper('RM WINTER SERIES CAULFIELD 2025') AND upper(et.eventtype_desc) = upper('10 km run')
    ),
    (
        SELECT nvl(max(e.entry_no), 0) + 1
        FROM entry e
        WHERE e.event_id = 
        (
            SELECT ev.event_id
            FROM event ev JOIN carnival c ON ev.carn_date = c.carn_date JOIN eventtype et ON ev.eventtype_code = et.eventtype_code
            WHERE upper(c.carn_name) = upper('RM WINTER SERIES CAULFIELD 2025') AND upper(et.eventtype_desc) = upper('10 km run')
        )
    ), 
    NULL,
    NULL,
    NULL,
    competitor_seq.CURRVAL,
    NULL,
    (
        SELECT c.char_id
        FROM charity c
        WHERE upper(c.char_name) = upper('RSPCA')
    )
);


INSERT INTO team (
    team_id,
    team_name,
    carn_date,
    event_id,
    entry_no
) VALUES ( 
    team_seq.NEXTVAL,
    'Super Runners',
    (
        SELECT c.carn_date
        FROM carnival c
        WHERE upper(c.carn_name) = upper('RM WINTER SERIES CAULFIELD 2025')
    ),
    (
        SELECT e.event_id
        FROM event e JOIN carnival c ON e.carn_date = c.carn_date JOIN eventtype et ON e.eventtype_code = et.eventtype_code
        WHERE upper(c.carn_name) = upper('RM WINTER SERIES CAULFIELD 2025') AND upper(et.eventtype_desc) = upper('10 km run')
    ),
    (
        SELECT e.entry_no 
        FROM entry e JOIN competitor c ON e.comp_no = c.comp_no JOIN event ev ON e.event_id = ev.event_id JOIN carnival ca ON ev.carn_date = ca.carn_date JOIN eventtype et ON ev.eventtype_code = et.eventtype_code
        WHERE upper(c.comp_fname) = upper('Keith') AND upper(c.comp_lname) = upper('Rose') AND c.comp_phone = '0422141112' AND upper(ca.carn_name) = upper('RM WINTER SERIES CAULFIELD 2025') AND upper(et.eventtype_desc) = upper('10 km run')
    )
);


UPDATE entry
SET team_id = team_seq.CURRVAL 
WHERE 
    event_id = 
    (
        SELECT e.event_id
        FROM event e JOIN carnival c ON e.carn_date = c.carn_date JOIN eventtype et ON e.eventtype_code = et.eventtype_code
        WHERE upper(c.carn_name) = upper('RM WINTER SERIES CAULFIELD 2025') AND upper(et.eventtype_desc) = upper('10 km run')
    )
    AND 
    entry_no = 
    (
        SELECT e.entry_no 
        FROM entry e JOIN competitor c ON e.comp_no = c.comp_no JOIN event ev ON e.event_id = ev.event_id JOIN carnival ca ON ev.carn_date = ca.carn_date JOIN eventtype et ON ev.eventtype_code = et.eventtype_code
        WHERE upper(c.comp_fname) = upper('Keith') AND upper(c.comp_lname) = upper('Rose') AND c.comp_phone = '0422141112' AND upper(ca.carn_name) = upper('RM WINTER SERIES CAULFIELD 2025') AND upper(et.eventtype_desc) = upper('10 km run')
    );

UPDATE entry
SET team_id = team_seq.CURRVAL 
WHERE 
    event_id = 
    (
        SELECT e.event_id
        FROM event e JOIN carnival c ON e.carn_date = c.carn_date JOIN eventtype et ON e.eventtype_code = et.eventtype_code
        WHERE upper(c.carn_name) = upper('RM WINTER SERIES CAULFIELD 2025') AND upper(et.eventtype_desc) = upper('10 km run')
    )
    AND 
    entry_no = 
    (
        SELECT e.entry_no 
        FROM entry e JOIN competitor c ON e.comp_no = c.comp_no JOIN event ev ON e.event_id = ev.event_id JOIN carnival ca ON ev.carn_date = ca.carn_date JOIN eventtype et ON ev.eventtype_code = et.eventtype_code
        WHERE upper(c.comp_fname) = upper('Jackson') AND upper(c.comp_lname) = upper('Bull') AND c.comp_phone = '0422412524' AND upper(ca.carn_name) = upper('RM WINTER SERIES CAULFIELD 2025') AND upper(et.eventtype_desc) = upper('10 km run')
    );

COMMIT;

--(c)

UPDATE entry
SET
    char_id = 
    (
        SELECT c.char_id
        FROM charity c
        WHERE upper(c.char_name) = upper('Beyond Blue')
    ),
    event_id = 
    (
        SELECT e.event_id
        FROM event e JOIN carnival c ON e.carn_date = c.carn_date JOIN eventtype et ON e.eventtype_code = et.eventtype_code
        WHERE upper(c.carn_name) = upper('RM WINTER SERIES CAULFIELD 2025') AND upper(et.eventtype_desc) = upper('5 km run')
    ),
    entry_no = 
    (
        SELECT nvl(max(e.entry_no), 0) + 1
        FROM entry e
        WHERE event_id = 
        (
            SELECT e1.event_id
            FROM event e1 JOIN carnival c ON e1.carn_date = c.carn_date JOIN eventtype et ON e1.eventtype_code = et.eventtype_code
            WHERE upper(c.carn_name) = upper('RM WINTER SERIES CAULFIELD 2025') AND upper(et.eventtype_desc) = upper('5 km run')
        )
    )
WHERE 
    event_id = 
    (
        SELECT e.event_id
        FROM event e JOIN carnival c ON e.carn_date = c.carn_date JOIN eventtype et ON e.eventtype_code = et.eventtype_code
        WHERE upper(c.carn_name) = upper('RM WINTER SERIES CAULFIELD 2025') AND upper(et.eventtype_desc) = upper('10 km run')
    )
    AND 
    entry_no = 
    (
        SELECT e.entry_no 
        FROM entry e JOIN competitor c ON e.comp_no = c.comp_no JOIN event ev ON e.event_id = ev.event_id JOIN carnival ca ON ev.carn_date = ca.carn_date JOIN eventtype et ON ev.eventtype_code = et.eventtype_code
        WHERE upper(c.comp_fname) = upper('Jackson') AND upper(c.comp_lname) = upper('Bull') AND c.comp_phone = '0422412524' AND upper(ca.carn_name) = upper('RM WINTER SERIES CAULFIELD 2025') AND upper(et.eventtype_desc) = upper('10 km run')
    );

COMMIT;

--(d)


UPDATE entry 
set team_id = NULL 
WHERE team_id in 
(
    SELECT t.team_id 
    FROM team t
    WHERE upper(t.team_name) = upper('Super Runners') AND to_char(t.carn_date, 'DD/MON/YYYY') = 
        (
            SELECT to_char(c.carn_date, 'DD/MON/YYYY')
            FROM carnival c
            WHERE upper(c.carn_name) = upper('RM WINTER SERIES CAULFIELD 2025')
        )
);


DELETE FROM team
WHERE upper(team_name) = upper('Super Runners') AND to_char(carn_date, 'DD/MON/YYYY') = 
    (            
        SELECT to_char(c.carn_date, 'DD/MON/YYYY')
        FROM carnival c
        WHERE upper(c.carn_name) = upper('RM WINTER SERIES CAULFIELD 2025')
    );


DELETE FROM entry
WHERE 
    comp_no = (
        SELECT c.comp_no
        FROM competitor c
        WHERE upper(c.comp_fname) = upper('Keith') AND upper(c.comp_lname) = upper('Rose') AND c.comp_phone = '0422141112'
    )
    AND event_id IN (
        SELECT e.event_id
        FROM event e JOIN carnival c ON e.carn_date = c.carn_date
        WHERE upper(c.carn_name) = upper('RM WINTER SERIES CAULFIELD 2025')
  );

COMMIT;
