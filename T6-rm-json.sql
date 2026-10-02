/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T6-rm-json.sql

--Student ID: 33589739
--Student Name: Hew Jia Jing


/* Comments for your marker:

Did not put all inside one array because data size exceeds the maximum bytes available for array.


*/


-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer


SELECT 
    JSON_OBJECT(
        '_id' VALUE t.team_id,
        'carn_name' VALUE c.carn_name,
        'carn_date' VALUE TO_CHAR(t.carn_date, 'DD-Mon-YYYY'),
        'team_name' VALUE t.team_name,
        'team_leader' VALUE JSON_OBJECT(
            'name' VALUE (
                SELECT NVL(TRIM(c2.comp_fname) || ' ' || TRIM(c2.comp_lname), '-')
                FROM entry e2 
                JOIN competitor c2 ON e2.comp_no = c2.comp_no
                WHERE e2.entry_no = t.entry_no AND e2.event_id = t.event_id
            ),
            'phone' VALUE (
                SELECT c2.comp_phone
                FROM entry e2 
                JOIN competitor c2 ON e2.comp_no = c2.comp_no
                WHERE e2.entry_no = t.entry_no AND e2.event_id = t.event_id
            ),
            'email' VALUE (
                SELECT c2.comp_email
                FROM entry e2 
                JOIN competitor c2 ON e2.comp_no = c2.comp_no
                WHERE e2.entry_no = t.entry_no AND e2.event_id = t.event_id
            )
        ),
        'team_no_of_members' VALUE COUNT(DISTINCT comp.comp_no),
        'team_members' VALUE JSON_ARRAYAGG(
            JSON_OBJECT(
                'competitor_name' VALUE NVL(TRIM(comp.comp_fname) || ' ' || TRIM(comp.comp_lname), '-'),
                'competitor_phone' VALUE comp.comp_phone,
                'event_type' VALUE (
                    SELECT et2.eventtype_desc
                    FROM event ev2 
                    JOIN eventtype et2 ON ev2.eventtype_code = et2.eventtype_code
                    WHERE ev2.event_id = e.event_id
                ),
                'entry_no' VALUE e.entry_no,
                'starttime' VALUE NVL(TO_CHAR(e.entry_starttime, 'HH24:MI:SS'), '-'),
                'finishtime' VALUE NVL(TO_CHAR(e.entry_finishtime, 'HH24:MI:SS'), '-'),
                'elapsedtime' VALUE NVL(TO_CHAR(e.entry_elapsedtime, 'HH24:MI:SS'), '-')
            )
        )
    FORMAT JSON
    ) AS team_json
FROM team t
    JOIN entry e ON t.team_id = e.team_id
    JOIN competitor comp ON e.comp_no = comp.comp_no
    JOIN carnival c ON c.carn_date = t.carn_date
GROUP BY
    t.team_id, 
    t.carn_date, 
    c.carn_name, 
    t.team_name, 
    t.entry_no, 
    t.event_id
ORDER BY
    t.team_id;






