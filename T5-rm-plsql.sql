--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T5-rm-plsql.sql

--Student ID: 33589739
--Student Name: Hew Jia Jing

/* Comments for your marker:
assumption: each event must start and finish on the same day

*/


--(a)
-- Write your create function statemet,
-- finish it with a slash(/) followed by a blank line


CREATE OR REPLACE FUNCTION calculate_elapsed_time(
    start_time  IN DATE,
    finish_time IN DATE
) RETURN DATE IS
    elapsed_time DATE;
BEGIN
    elapsed_time := TO_DATE('00:00:00', 'HH24:MI:SS') + (finish_time - start_time);
    DBMS_OUTPUT.PUT_LINE('Elapsed time calculated successfully: ' || TO_CHAR(elapsed_time, 'HH24:MI:SS'));
    RETURN elapsed_time;
END;
/

-- Write Test Harness for (a)

SELECT
    event_id,
    entry_no,
    TO_CHAR(calculate_elapsed_time(entry_starttime, entry_finishtime), 'HH24:MI:SS') as elapsed_time_calculated
FROM entry 
WHERE entry_starttime IS NOT NULL AND entry_finishtime IS NOT NULL 
ORDER BY event_id, entry_no;





--(b)
-- Write your create trigger statement,
-- finish it with a slash(/) followed by a blank line
-- BEFORE INSERT OR UPDATE ON entry


CREATE OR REPLACE TRIGGER trg_entry_elapsed_time
BEFORE UPDATE OF entry_finishtime ON entry
FOR EACH ROW
BEGIN
    IF :NEW.entry_starttime IS NOT NULL AND :NEW.entry_finishtime IS NOT NULL THEN

        IF :NEW.entry_finishtime < :NEW.entry_starttime THEN
            RAISE_APPLICATION_ERROR(-20001, 'Finish time cannot be before the start time.');
        END IF;

        :NEW.entry_elapsedtime := calculate_elapsed_time(:NEW.entry_starttime, :NEW.entry_finishtime);
        DBMS_OUTPUT.PUT_LINE('Elapsed time is calculated successfully');
        
    ELSE
        RAISE_APPLICATION_ERROR(-20001, 'Competitor did not finish the event.');

    END IF;
END;
/

-- Write Test Harness for (b)

DESC ENTRY;

-- test invalid: Finish time cannot be before the start time.
-- before 
SELECT entry_no, event_id, nvl(to_char(entry_starttime, 'HH24:MI:SS'), '-') as start_time, nvl(to_char(entry_finishtime, 'HH24:MI:SS'), '-') as finish_time, nvl(to_char(entry_elapsedtime, 'HH24:MI:SS'), '-') as elapsed_time 
FROM entry;

-- test
BEGIN
    INSERT INTO entry (event_id, entry_no, entry_starttime, entry_finishtime, entry_elapsedtime, comp_no, team_id
    ) VALUES ( 
        11,
        2,
        TO_DATE('11:30:01','HH24:MI:SS'),
        NULL,
        NULL,
        15,
        NULL
    );

    UPDATE entry
    SET entry_finishtime = TO_DATE('10:50:34', 'HH24:MI:SS')
    WHERE entry_no = 2 AND event_id = 11;
END;
/

-- after
SELECT entry_no, event_id, nvl(to_char(entry_starttime, 'HH24:MI:SS'), '-') as start_time, nvl(to_char(entry_finishtime, 'HH24:MI:SS'), '-') as finish_time, nvl(to_char(entry_elapsedtime, 'HH24:MI:SS'), '-') as elapsed_time 
FROM entry;



-- test invalid: Competitor did not compete and finish the event yet.
-- before
SELECT entry_no, event_id, nvl(to_char(entry_starttime, 'HH24:MI:SS'), '-') as start_time, nvl(to_char(entry_finishtime, 'HH24:MI:SS'), '-') as finish_time, nvl(to_char(entry_elapsedtime, 'HH24:MI:SS'), '-') as elapsed_time 
FROM entry;

-- test
BEGIN
    INSERT INTO entry (event_id, entry_no, entry_starttime, entry_finishtime, entry_elapsedtime, comp_no, team_id
    ) VALUES ( 
        11,
        3,
        TO_DATE('11:30:01','HH24:MI:SS'),
        NULL,
        NULL,
        14,
        NULL
    );

    UPDATE entry
    SET entry_finishtime = NULL
    WHERE entry_no = 3 AND event_id = 11;
END;
/

-- after
SELECT entry_no, event_id, nvl(to_char(entry_starttime, 'HH24:MI:SS'), '-') as start_time, nvl(to_char(entry_finishtime, 'HH24:MI:SS'), '-') as finish_time, nvl(to_char(entry_elapsedtime, 'HH24:MI:SS'), '-') as elapsed_time 
FROM entry;



-- test valid
-- before
SELECT entry_no, event_id, nvl(to_char(entry_starttime, 'HH24:MI:SS'), '-') as start_time, nvl(to_char(entry_finishtime, 'HH24:MI:SS'), '-') as finish_time, nvl(to_char(entry_elapsedtime, 'HH24:MI:SS'), '-') as elapsed_time 
FROM entry;

-- test
BEGIN
    INSERT INTO entry (event_id, entry_no, entry_starttime, entry_finishtime, entry_elapsedtime, comp_no, team_id
    ) VALUES ( 
        11,
        4,
        TO_DATE('08:30:01','HH24:MI:SS'),
        NULL,
        NULL,
        13,
        NULL
    );

    UPDATE entry
    SET entry_finishtime = TO_DATE('11:50:34', 'HH24:MI:SS')
    WHERE entry_no = 4 AND event_id = 11;
END;
/

-- after
SELECT entry_no, event_id, nvl(to_char(entry_starttime, 'HH24:MI:SS'), '-') as start_time, nvl(to_char(entry_finishtime, 'HH24:MI:SS'), '-') as finish_time, nvl(to_char(entry_elapsedtime, 'HH24:MI:SS'), '-') as elapsed_time 
FROM entry;



ROLLBACK;





--(c)
-- Write your create procedure statement,
-- finish it with a slash(/) followed by a blank line

CREATE OR REPLACE PROCEDURE prc_entry_registration(
    p_competitor_no   IN NUMBER,
    p_carnival_name   IN VARCHAR2,
    p_event_type_desc IN VARCHAR2,
    p_team_name       IN VARCHAR2,
    p_charity_name    IN VARCHAR2,
    p_output          OUT VARCHAR2
) IS
    var_carnival_date   DATE;
    var_event_id        NUMBER;
    var_team_id         NUMBER;
    var_charity_id      NUMBER;
    var_entry_found     NUMBER;
    var_team_found      NUMBER;
    var_entry_no        NUMBER;
    var_charity_found   NUMBER;
BEGIN
    IF (p_competitor_no IS NULL OR p_carnival_name IS NULL OR p_event_type_desc is NULL) THEN
        p_output := 'Incomplete registration information (competitor number, carnival name, event type), registration process cancelled';
    ELSE
        -- one competitor can only enter one event at a particular carnival
        SELECT COUNT(*) INTO var_entry_found
        FROM entry e JOIN event ev ON e.event_id = ev.event_id JOIN carnival c ON ev.carn_date = c.carn_date
        WHERE e.comp_no = p_competitor_no AND UPPER(c.carn_name) = UPPER(p_carnival_name);

        -- when competitor join 1 event already, it shouldnt join another one
        IF var_entry_found > 0 THEN
            p_output := 'Invalid multiple entry, registration process cancelled';
        ELSE
            -- get the carnival date
            SELECT c.carn_date INTO var_carnival_date
            FROM carnival c
            WHERE UPPER(c.carn_name) = UPPER(p_carnival_name);

            -- get the event id
            SELECT e.event_id INTO var_event_id
            FROM event e JOIN eventtype et ON e.eventtype_code = et.eventtype_code
            WHERE to_char(e.carn_date, 'DD/MON/YYYY') = to_char(var_carnival_date, 'DD/MON/YYYY') AND UPPER(et.eventtype_desc) = UPPER(p_event_type_desc);

            -- get new entry no
            SELECT COUNT(*) + 1 INTO var_entry_no
            FROM entry e
            WHERE e.event_id = var_event_id;
            
            -- check if team exists
            SELECT COUNT(*) INTO var_team_found
            FROM team t JOIN carnival c ON t.carn_date = c.carn_date
            WHERE UPPER(t.team_name) = UPPER(p_team_name) AND to_char(t.carn_date, 'DD/MON/YYYY') = to_char(var_carnival_date, 'DD/MON/YYYY');

            -- check if charity exists
            SELECT COUNT(*) INTO var_charity_found
            FROM charity c
            WHERE UPPER(c.char_name) = UPPER(p_charity_name);

            -- check if charity exists
            IF (var_charity_found > 0 OR p_charity_name is NULL) THEN

                IF p_charity_name is NOT NULL THEN
                    SELECT c.char_id INTO var_charity_id
                    FROM charity c
                    WHERE UPPER(c.char_name) = UPPER(p_charity_name);
                END IF;

                -- insert entry
                INSERT INTO entry (
                    event_id,
                    entry_no,
                    entry_starttime,
                    entry_finishtime,
                    entry_elapsedtime,
                    comp_no,
                    team_id
                ) VALUES ( 
                    var_event_id,
                    var_entry_no,
                    NULL,
                    NULL,
                    NULL,
                    p_competitor_no,
                    NULL
                );

                IF p_charity_name is NOT NULL THEN
                    INSERT INTO entry_charity (
                        event_id, 
                        entry_no, 
                        char_id, 
                        char_percentage
                    ) VALUES ( 
                        var_event_id,
                        var_entry_no,
                        var_charity_id,
                        100
                    );
                END IF;

                IF p_team_name is NOT NULL THEN
                -- if the inputted team name does not exist, a new team will be created, 
                -- and the competitor’s details will be stored as the team leader
                    IF var_team_found = 0 THEN

                        -- insert new team and assign competitor as team leader
                        INSERT INTO team (
                            team_id, 
                            team_name,
                            carn_date,
                            event_id,
                            entry_no
                        )
                        VALUES (
                            team_seq.NEXTVAL, 
                            p_team_name,
                            var_carnival_date,
                            var_event_id,
                            var_entry_no
                        );

                        var_team_id := team_seq.CURRVAL;
                    ELSE
                        -- get existing team ID
                        SELECT t.team_id INTO var_team_id
                        FROM team t
                        WHERE UPPER(t.team_name) = UPPER(p_team_name) AND t.carn_date = var_carnival_date;
                    END IF;

                    UPDATE entry
                    SET
                        team_id = var_team_id
                    WHERE 
                        event_id = var_event_id AND entry_no = var_entry_no;

                END IF;

                IF p_team_name is NULL AND p_charity_name is NULL THEN
                    p_output := 'Registration successful for competitor ' || p_competitor_no || ' in carnival ' || p_carnival_name || ' in event ' || p_event_type_desc || ' individually ' || ' with entry no ' || var_entry_no;
                ELSIF p_team_name is NULL THEN
                    p_output := 'Registration successful for competitor ' || p_competitor_no || ' in carnival ' || p_carnival_name || ' in event ' || p_event_type_desc || ' individually ' || ' supporting ' || p_charity_name || ' with entry no ' || var_entry_no;
                ELSIF p_charity_name is NULL THEN
                    p_output := 'Registration successful for competitor ' || p_competitor_no || ' in carnival ' || p_carnival_name || ' in event ' || p_event_type_desc || ' in team ' || p_team_name || ' with entry no ' || var_entry_no;
                ELSE
                    p_output := 'Registration successful for competitor ' || p_competitor_no || ' in carnival ' || p_carnival_name || ' in event ' || p_event_type_desc || ' in team ' || p_team_name || ' supporting ' || p_charity_name || ' with entry no ' || var_entry_no;
                END IF;

            ELSE
                p_output := 'Invalid charity name, registration process cancelled';
            END IF;

        END IF;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
        p_output := SQLERRM;
END;
/


-- Write Test Harness for (c)

-- test 1:
-- before
SELECT *
FROM entry e JOIN event ev ON e.event_id = ev.event_id JOIN carnival c ON ev.carn_date = c.carn_date
WHERE e.comp_no = 1 AND UPPER(c.carn_name) = UPPER('RM Spring Series Clayton 2024');

-- test invalid multiple entry
DECLARE
    output VARCHAR2(200);
BEGIN
    prc_entry_registration(1, 'RM Spring Series Clayton 2024', '10 Km Run', 'Team B', 'RSPCA', output);
    dbms_output.put_line(output);
END;
/

-- after
SELECT *
FROM entry e JOIN event ev ON e.event_id = ev.event_id JOIN carnival c ON ev.carn_date = c.carn_date
WHERE e.comp_no = 1 AND UPPER(c.carn_name) = UPPER('RM Spring Series Clayton 2024');



-- test 2:
-- before
SELECT e.event_id, e.entry_no, e.team_id, t.team_name
FROM entry e JOIN event ev ON e.event_id = ev.event_id JOIN carnival c ON ev.carn_date = c.carn_date JOIN team t ON e.team_id = t.team_id
WHERE UPPER(c.carn_name) = UPPER('RM Spring Series Clayton 2024');

-- test team name does not exist
DECLARE
    output VARCHAR2(200);
BEGIN
    prc_entry_registration(15, 'RM Spring Series Clayton 2024', '5 Km Run', 'New New New', 'RSPCA', output);
    dbms_output.put_line(output);
END;
/

-- after
SELECT e.event_id, e.entry_no, e.team_id, t.team_name
FROM entry e JOIN event ev ON e.event_id = ev.event_id JOIN carnival c ON ev.carn_date = c.carn_date JOIN team t ON e.team_id = t.team_id
WHERE UPPER(c.carn_name) = UPPER('RM Spring Series Clayton 2024');



-- test 3:
-- before
SELECT char_id, char_name 
FROM charity;

SELECT e.event_id, e.entry_no, e.team_id, t.team_name, ec.char_id, cc.char_name, e.comp_no
FROM entry e JOIN event ev ON e.event_id = ev.event_id JOIN carnival c ON ev.carn_date = c.carn_date JOIN team t ON e.team_id = t.team_id JOIN entry_charity ec ON (ec.event_id = e.event_id AND ec.entry_no = e.entry_no) JOIN charity cc ON ec.char_id = cc.char_id
WHERE UPPER(c.carn_name) = UPPER('RM Spring Series Clayton 2024');

-- test charity does not exist
DECLARE
    output VARCHAR2(200);
BEGIN
    prc_entry_registration(11, 'RM Spring Series Clayton 2024', '5 Km Run', 'Team A', 'Hello Charity', output);
    dbms_output.put_line(output);
END;
/

-- after
SELECT char_id, char_name 
FROM charity;

SELECT e.event_id, e.entry_no, e.team_id, t.team_name, ec.char_id, cc.char_name, e.comp_no
FROM entry e JOIN event ev ON e.event_id = ev.event_id JOIN carnival c ON ev.carn_date = c.carn_date JOIN team t ON e.team_id = t.team_id JOIN entry_charity ec ON (ec.event_id = e.event_id AND ec.entry_no = e.entry_no) JOIN charity cc ON ec.char_id = cc.char_id
WHERE UPPER(c.carn_name) = UPPER('RM Spring Series Clayton 2024');



-- test 4:
-- before
SELECT e.event_id, e.entry_no, e.team_id, t.team_name, ec.char_id, cc.char_name, e.comp_no
FROM entry e JOIN event ev ON e.event_id = ev.event_id JOIN carnival c ON ev.carn_date = c.carn_date JOIN team t ON e.team_id = t.team_id JOIN entry_charity ec ON (ec.event_id = e.event_id AND ec.entry_no = e.entry_no) JOIN charity cc ON ec.char_id = cc.char_id
WHERE UPPER(c.carn_name) = UPPER('RM Spring Series Clayton 2024');

-- test Incomplete registration information on competitor number
DECLARE
    output VARCHAR2(200);
BEGIN
    prc_entry_registration(NULL, 'RM Spring Series Clayton 2024', '5 Km Run', 'Team A', 'Hello Charity', output);
    dbms_output.put_line(output);
END;
/

-- after
SELECT e.event_id, e.entry_no, e.team_id, t.team_name, ec.char_id, cc.char_name, e.comp_no
FROM entry e JOIN event ev ON e.event_id = ev.event_id JOIN carnival c ON ev.carn_date = c.carn_date JOIN team t ON e.team_id = t.team_id JOIN entry_charity ec ON (ec.event_id = e.event_id AND ec.entry_no = e.entry_no) JOIN charity cc ON ec.char_id = cc.char_id
WHERE UPPER(c.carn_name) = UPPER('RM Spring Series Clayton 2024');



-- test 5:
-- before
SELECT e.event_id, e.entry_no, e.team_id, t.team_name, ec.char_id, cc.char_name, e.comp_no
FROM entry e JOIN event ev ON e.event_id = ev.event_id JOIN carnival c ON ev.carn_date = c.carn_date JOIN team t ON e.team_id = t.team_id JOIN entry_charity ec ON (ec.event_id = e.event_id AND ec.entry_no = e.entry_no) JOIN charity cc ON ec.char_id = cc.char_id
WHERE UPPER(c.carn_name) = UPPER('RM Spring Series Clayton 2024');

-- test Incomplete registration information on carnival name
DECLARE
    output VARCHAR2(200);
BEGIN
    prc_entry_registration(11, NULL, '5 Km Run', 'Team A', 'Hello Charity', output);
    dbms_output.put_line(output);
END;
/

-- after
SELECT e.event_id, e.entry_no, e.team_id, t.team_name, ec.char_id, cc.char_name, e.comp_no
FROM entry e JOIN event ev ON e.event_id = ev.event_id JOIN carnival c ON ev.carn_date = c.carn_date JOIN team t ON e.team_id = t.team_id JOIN entry_charity ec ON (ec.event_id = e.event_id AND ec.entry_no = e.entry_no) JOIN charity cc ON ec.char_id = cc.char_id
WHERE UPPER(c.carn_name) = UPPER('RM Spring Series Clayton 2024');



-- test 6:
-- before
SELECT e.event_id, e.entry_no, e.team_id, t.team_name, ec.char_id, cc.char_name, e.comp_no
FROM entry e JOIN event ev ON e.event_id = ev.event_id JOIN carnival c ON ev.carn_date = c.carn_date JOIN team t ON e.team_id = t.team_id JOIN entry_charity ec ON (ec.event_id = e.event_id AND ec.entry_no = e.entry_no) JOIN charity cc ON ec.char_id = cc.char_id
WHERE UPPER(c.carn_name) = UPPER('RM Spring Series Clayton 2024');

-- test Incomplete registration information on event type
DECLARE
    output VARCHAR2(200);
BEGIN
    prc_entry_registration(11, 'RM Spring Series Clayton 2024', NULL, 'Team A', 'Hello Charity', output);
    dbms_output.put_line(output);
END;
/

-- after
SELECT e.event_id, e.entry_no, e.team_id, t.team_name, ec.char_id, cc.char_name, e.comp_no
FROM entry e JOIN event ev ON e.event_id = ev.event_id JOIN carnival c ON ev.carn_date = c.carn_date JOIN team t ON e.team_id = t.team_id JOIN entry_charity ec ON (ec.event_id = e.event_id AND ec.entry_no = e.entry_no) JOIN charity cc ON ec.char_id = cc.char_id
WHERE UPPER(c.carn_name) = UPPER('RM Spring Series Clayton 2024');



-- test 7:
-- before
SELECT e.event_id, e.entry_no, e.comp_no, e.team_id, t.team_name, ec.char_id, cc.char_name
FROM entry e JOIN event ev ON e.event_id = ev.event_id JOIN carnival c ON ev.carn_date = c.carn_date JOIN team t ON e.team_id = t.team_id JOIN entry_charity ec ON (ec.event_id = e.event_id AND ec.entry_no = e.entry_no) JOIN charity cc ON ec.char_id = cc.char_id
WHERE UPPER(c.carn_name) = UPPER('RM Spring Series Clayton 2024');

 -- test valid registration with team and charity
DECLARE
    output VARCHAR2(200);
BEGIN
    prc_entry_registration(11, 'RM Spring Series Clayton 2024', '5 Km Run', 'Team A', 'RSPCA', output);
    dbms_output.put_line(output);
END;
/

-- after
SELECT e.event_id, e.entry_no, e.comp_no, e.team_id, t.team_name, ec.char_id, cc.char_name
FROM entry e JOIN event ev ON e.event_id = ev.event_id JOIN carnival c ON ev.carn_date = c.carn_date JOIN team t ON e.team_id = t.team_id JOIN entry_charity ec ON (ec.event_id = e.event_id AND ec.entry_no = e.entry_no) JOIN charity cc ON ec.char_id = cc.char_id
WHERE UPPER(c.carn_name) = UPPER('RM Spring Series Clayton 2024');



-- test 8:
-- before
SELECT e.event_id, e.entry_no, e.comp_no, ec.char_id, cc.char_name
FROM entry e JOIN event ev ON e.event_id = ev.event_id JOIN carnival c ON ev.carn_date = c.carn_date JOIN entry_charity ec ON (ec.event_id = e.event_id AND ec.entry_no = e.entry_no) JOIN charity cc ON ec.char_id = cc.char_id
WHERE UPPER(c.carn_name) = UPPER('RM Spring Series Clayton 2024');

 -- test valid registration with charity (not member of any team)
DECLARE
    output VARCHAR2(200);
BEGIN
    prc_entry_registration(12, 'RM Spring Series Clayton 2024', '5 Km Run', NULL, 'RSPCA', output);
    dbms_output.put_line(output);
END;
/

-- after
SELECT e.event_id, e.entry_no, e.comp_no, ec.char_id, cc.char_name
FROM entry e JOIN event ev ON e.event_id = ev.event_id JOIN carnival c ON ev.carn_date = c.carn_date JOIN entry_charity ec ON (ec.event_id = e.event_id AND ec.entry_no = e.entry_no) JOIN charity cc ON ec.char_id = cc.char_id
WHERE UPPER(c.carn_name) = UPPER('RM Spring Series Clayton 2024');



-- test 9:
-- before
SELECT e.event_id, e.entry_no, e.comp_no, e.team_id, t.team_name
FROM entry e JOIN event ev ON e.event_id = ev.event_id JOIN carnival c ON ev.carn_date = c.carn_date JOIN team t ON e.team_id = t.team_id
WHERE UPPER(c.carn_name) = UPPER('RM Spring Series Clayton 2024');

 -- test valid registration with team (did not raise fund for any charity)
DECLARE
    output VARCHAR2(200);
BEGIN
    prc_entry_registration(13, 'RM Spring Series Clayton 2024', '5 Km Run', 'Team A', NULL, output);
    dbms_output.put_line(output);
END;
/

-- after
SELECT e.event_id, e.entry_no, e.comp_no, e.team_id, t.team_name
FROM entry e JOIN event ev ON e.event_id = ev.event_id JOIN carnival c ON ev.carn_date = c.carn_date JOIN team t ON e.team_id = t.team_id
WHERE UPPER(c.carn_name) = UPPER('RM Spring Series Clayton 2024');



ROLLBACK;
