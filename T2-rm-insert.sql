/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T2-rm-insert.sql

--Student ID: 33589739
--Student Name: Hew Jia Jing

/* Comments for your marker:




*/

-- Task 2 Load the COMPETITOR, ENTRY and TEAM tables with your own
-- test data following the data requirements expressed in the brief

-- =======================================
-- COMPETITOR
-- =======================================


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
    1,
    'Jia Jing',
    'Hew',
    'F',
    TO_DATE('12/JUN/2004','DD/MON/YYYY'),
    'jiajing@gmail.com',
    'Y',
    '1234567890'
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
    2,
    'Yue Hua',
    'Chow',
    'F',
    TO_DATE('10/OCT/2004','DD/MON/YYYY'),
    'yuehua@gmail.com',
    'Y',
    '2234567890'
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
    3,
    'Ming Er',
    'Chok',
    'F',
    TO_DATE('01/JUL/2004','DD/MON/YYYY'),
    'minger@gmail.com',
    'Y',
    '3234567890'
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
    4,
    'Xiao Qian',
    'Boon',
    'F',
    TO_DATE('19/FEB/2004','DD/MON/YYYY'),
    'xiaoqian@gmail.com',
    'Y',
    '4234567890'
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
    5,
    'Jia Ming',
    'Wah',
    'M',
    TO_DATE('27/OCT/2004','DD/MON/YYYY'),
    'jiaming@gmail.com',
    'Y',
    '5234567890'
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
    6,
    'Celine',
    'Kang',
    'F',
    TO_DATE('13/JAN/2004','DD/MON/YYYY'),
    'celine@gmail.com',
    'N',
    '6234567891'
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
    7,
    'Jolin',
    'Cai',
    'F',
    TO_DATE('29/JUN/2004','DD/MON/YYYY'),
    'jolin@gmail.com',
    'N',
    '6234567892'
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
    8,
    'Queenie',
    'Teh',
    'F',
    TO_DATE('25/DEC/1990','DD/MON/YYYY'),
    'queenie@gmail.com',
    'N',
    '6234567893'
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
    9,
    'Max',
    'Chong',
    'M',
    TO_DATE('29/APR/1978','DD/MON/YYYY'),
    'max@gmail.com',
    'N',
    '6234567894'
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
    10,
    'Brandon',
    'Lee',
    'M',
    TO_DATE('03/APR/1990','DD/MON/YYYY'),
    'brandon@gmail.com',
    'N',
    '6234567895'
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
    11,
    'Sophia',
    'Ng',
    'F',
    TO_DATE('01/MAY/1998','DD/MON/YYYY'),
    'sophia@gmail.com',
    'Y',
    '9234567891'
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
    12,
    'Marcus',
    'Chan',
    'M',
    TO_DATE('02/MAY/1995','DD/MON/YYYY'),
    'marcuschan@gmail.com',
    'N',
    '9234567892'
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
    13,
    'Emily',
    'Tan',
    'F',
    TO_DATE('10/JUL/2001','DD/MON/YYYY'),
    'emilytan@gmail.com',
    'Y',
    '9234567893'
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
    14,
    'Daniel',
    'Lim',
    'M',
    TO_DATE('30/AUG/1993','DD/MON/YYYY'),
    'daniellim@gmail.com',
    'N',
    '9234567894'
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
    15,
    'Jasmine',
    'Yap',
    'F',
    TO_DATE('08/SEP/1999','DD/MON/YYYY'),
    'jasmineyap@gmail.com',
    'Y',
    '9234567895'
);



-- =======================================
-- ENTRY
-- =======================================

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
    1,
    1,
    TO_DATE('09:30:08', 'HH24:MI:SS'),
    TO_DATE('10:45:12', 'HH24:MI:SS'),
    TO_DATE('01:15:04', 'HH24:MI:SS'),
    1,
    NULL,
    1
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
    1,
    2,
    TO_DATE('09:30:05', 'HH24:MI:SS'),
    TO_DATE('10:49:15', 'HH24:MI:SS'),
    TO_DATE('01:19:10', 'HH24:MI:SS'),
    2,
    NULL,
    1
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
    1,
    3,
    TO_DATE('09:30:11', 'HH24:MI:SS'),
    TO_DATE('10:49:11', 'HH24:MI:SS'),
    TO_DATE('01:19:00', 'HH24:MI:SS'),
    3,
    NULL,
    1
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
    1,
    4,
    TO_DATE('09:30:01', 'HH24:MI:SS'),
    TO_DATE('10:49:03', 'HH24:MI:SS'),
    TO_DATE('01:19:02', 'HH24:MI:SS'),
    4,
    NULL,
    1
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
    1,
    5,
    TO_DATE('09:30:02', 'HH24:MI:SS'),
    TO_DATE('10:49:02', 'HH24:MI:SS'),
    TO_DATE('01:19:00', 'HH24:MI:SS'),
    5,
    NULL,
    1
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
    1,
    6,
    NULL,
    NULL,
    NULL,
    6,
    NULL,
    1
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
    1,
    7,
    NULL,
    NULL,
    NULL,
    7,
    NULL,
    1
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
    2,
    1,
    TO_DATE('08:30:03', 'HH24:MI:SS'),
    TO_DATE('09:49:04', 'HH24:MI:SS'),
    TO_DATE('01:19:01', 'HH24:MI:SS'),
    8,
    NULL,
    1
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
    2,
    2,
    NULL,
    NULL,
    NULL,
    9,
    NULL,
    1
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
    2,
    3,
    TO_DATE('08:30:34', 'HH24:MI:SS'),
    TO_DATE('09:44:45', 'HH24:MI:SS'),
    TO_DATE('01:14:11', 'HH24:MI:SS'),
    10,
    NULL,
    1
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
    3,
    1,
    TO_DATE('09:00:05', 'HH24:MI:SS'),
    TO_DATE('10:19:06', 'HH24:MI:SS'),
    TO_DATE('01:19:01', 'HH24:MI:SS'),
    1,
    NULL,
    1
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
    3,
    2,
    TO_DATE('09:00:07', 'HH24:MI:SS'),
    TO_DATE('10:11:17', 'HH24:MI:SS'),
    TO_DATE('01:11:10', 'HH24:MI:SS'),
    2,
    NULL,
    1
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
    3,
    3,
    TO_DATE('09:00:08', 'HH24:MI:SS'),
    TO_DATE('10:13:39', 'HH24:MI:SS'),
    TO_DATE('01:13:31', 'HH24:MI:SS'),
    3,
    NULL,
    1
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
    3,
    4,
    TO_DATE('09:00:23', 'HH24:MI:SS'),
    TO_DATE('10:11:34', 'HH24:MI:SS'),
    TO_DATE('01:11:11', 'HH24:MI:SS'),
    4,
    NULL,
    1
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
    3,
    5,
    TO_DATE('09:00:12', 'HH24:MI:SS'),
    TO_DATE('10:19:13', 'HH24:MI:SS'),
    TO_DATE('01:19:01', 'HH24:MI:SS'),
    5,
    NULL,
    1
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
    4,
    1,
    TO_DATE('08:30:14', 'HH24:MI:SS'),
    TO_DATE('09:42:18', 'HH24:MI:SS'),
    TO_DATE('01:12:04', 'HH24:MI:SS'),
    8,
    NULL,
    1
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
    4,
    2,
    TO_DATE('08:30:34', 'HH24:MI:SS'),
    TO_DATE('09:42:45', 'HH24:MI:SS'),
    TO_DATE('01:12:11', 'HH24:MI:SS'),
    9,
    NULL,
    1
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
    4,
    3,
    NULL,
    NULL,
    NULL,
    10,
    NULL,
    1
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
    5,
    1,
    TO_DATE('08:00:23', 'HH24:MI:SS'),
    TO_DATE('09:22:34', 'HH24:MI:SS'),
    TO_DATE('01:22:11', 'HH24:MI:SS'),
    12,
    NULL,
    1
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
    5,
    2,
    TO_DATE('08:00:11', 'HH24:MI:SS'),
    TO_DATE('09:32:13', 'HH24:MI:SS'),
    TO_DATE('01:32:02', 'HH24:MI:SS'),
    13,
    NULL,
    1
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
    6,
    1,
    TO_DATE('08:30:10', 'HH24:MI:SS'),
    TO_DATE('09:41:19', 'HH24:MI:SS'),
    TO_DATE('01:41:09', 'HH24:MI:SS'),
    1,
    NULL,
    1
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
    6,
    2,
    TO_DATE('08:30:23', 'HH24:MI:SS'),
    TO_DATE('09:44:45', 'HH24:MI:SS'),
    TO_DATE('01:44:22', 'HH24:MI:SS'),
    2,
    NULL,
    1
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
    6,
    3,
    TO_DATE('08:30:22', 'HH24:MI:SS'),
    TO_DATE('09:34:44', 'HH24:MI:SS'),
    TO_DATE('01:04:22', 'HH24:MI:SS'),
    3,
    NULL,
    1
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
    6,
    4,
    TO_DATE('08:30:12', 'HH24:MI:SS'),
    TO_DATE('09:54:23', 'HH24:MI:SS'),
    TO_DATE('01:24:11', 'HH24:MI:SS'),
    4,
    NULL,
    1
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
    6,
    5,
    TO_DATE('08:30:45', 'HH24:MI:SS'),
    TO_DATE('09:41:55', 'HH24:MI:SS'),
    TO_DATE('01:11:10', 'HH24:MI:SS'),
    5,
    NULL,
    1
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
    7,
    1,
    TO_DATE('08:30:34', 'HH24:MI:SS'),
    TO_DATE('09:40:45', 'HH24:MI:SS'),
    TO_DATE('01:10:11', 'HH24:MI:SS'),
    10,
    NULL,
    1
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
    7,
    2,
    TO_DATE('08:30:37', 'HH24:MI:SS'),
    TO_DATE('09:34:38', 'HH24:MI:SS'),
    TO_DATE('01:14:01', 'HH24:MI:SS'),
    11,
    NULL,
    1
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
    10,
    1,
    TO_DATE('08:00:25', 'HH24:MI:SS'),
    TO_DATE('09:19:50', 'HH24:MI:SS'),
    TO_DATE('01:19:25', 'HH24:MI:SS'),
    6,
    NULL,
    1
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
    10,
    2,
    TO_DATE('08:00:10', 'HH24:MI:SS'),
    TO_DATE('09:19:42', 'HH24:MI:SS'),
    TO_DATE('01:19:32', 'HH24:MI:SS'),
    7,
    NULL,
    1
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
    10,
    3,
    TO_DATE('08:00:20', 'HH24:MI:SS'),
    TO_DATE('09:13:22', 'HH24:MI:SS'),
    TO_DATE('01:13:02', 'HH24:MI:SS'),
    8,
    NULL,
    1
);


-- =======================================
-- TEAM
-- =======================================


INSERT INTO team (
    team_id,
    team_name,
    carn_date,
    event_id,
    entry_no
) VALUES ( 
    1,
    'TEAM A',
    TO_DATE('22/SEP/2024','DD/MON/YYYY'),
    1,
    1
);

INSERT INTO team (
    team_id,
    team_name,
    carn_date,
    event_id,
    entry_no
) VALUES ( 
    2,
    'TEAM B',
    TO_DATE('22/SEP/2024','DD/MON/YYYY'),
    1,
    2
);

INSERT INTO team (
    team_id,
    team_name,
    carn_date,
    event_id,
    entry_no
) VALUES ( 
    3,
    'Hello',
    TO_DATE('15/MAR/2025','DD/MON/YYYY'),
    10,
    3
);

INSERT INTO team (
    team_id,
    team_name,
    carn_date,
    event_id,
    entry_no
) VALUES ( 
    4,
    'TEAM D',
    TO_DATE('05/OCT/2024','DD/MON/YYYY'),
    3,
    2
);

INSERT INTO team (
    team_id,
    team_name,
    carn_date,
    event_id,
    entry_no
) VALUES ( 
    5,
    'Team A',
    TO_DATE('05/OCT/2024','DD/MON/YYYY'),
    3,
    1
);

INSERT INTO team (
    team_id,
    team_name,
    carn_date,
    event_id,
    entry_no
) VALUES ( 
    6,
    'We Can',
    TO_DATE('02/FEB/2025','DD/MON/YYYY'),
    6,
    1
);

INSERT INTO team (
    team_id,
    team_name,
    carn_date,
    event_id,
    entry_no
) VALUES ( 
    7,
    'We Believe',
    TO_DATE('02/FEB/2025','DD/MON/YYYY'),
    6,
    2
);


UPDATE entry
SET
    team_id = 1
WHERE 
    event_id = 1 AND entry_no = 1;

UPDATE entry
SET
    team_id = 2
WHERE 
    event_id = 1 AND entry_no = 2;

UPDATE entry
SET
    team_id = 1
WHERE 
    event_id = 1 AND entry_no = 3;

UPDATE entry
SET
    team_id = 1
WHERE 
    event_id = 1 AND entry_no = 4;

UPDATE entry
SET
    team_id = 2
WHERE 
    event_id = 1 AND entry_no = 5;

UPDATE entry
SET
    team_id = 2
WHERE 
    event_id = 1 AND entry_no = 6;

UPDATE entry
SET
    team_id = 2
WHERE 
    event_id = 1 AND entry_no = 7;

UPDATE entry
SET
    team_id = 1
WHERE 
    event_id = 2 AND entry_no = 1;

UPDATE entry
SET
    team_id = 1
WHERE 
    event_id = 2 AND entry_no = 2;

UPDATE entry
SET
    team_id = 2
WHERE 
    event_id = 2 AND entry_no = 3;

UPDATE entry
SET
    team_id = 5
WHERE 
    event_id = 3 AND entry_no = 1;

UPDATE entry
SET
    team_id = 4
WHERE 
    event_id = 3 AND entry_no = 2;

UPDATE entry
SET
    team_id = 5
WHERE 
    event_id = 3 AND entry_no = 3;

UPDATE entry
SET
    team_id = 5
WHERE 
    event_id = 3 AND entry_no = 4;

UPDATE entry
SET
    team_id = 4
WHERE 
    event_id = 3 AND entry_no = 5;

UPDATE entry
SET
    team_id = 4
WHERE 
    event_id = 4 AND entry_no = 1;

UPDATE entry
SET
    team_id = 5
WHERE 
    event_id = 4 AND entry_no = 2;

UPDATE entry
SET
    team_id = 5
WHERE 
    event_id = 4 AND entry_no = 3;

UPDATE entry
SET
    team_id = 5
WHERE 
    event_id = 5 AND entry_no = 1;

UPDATE entry
SET
    team_id = 5
WHERE 
    event_id = 5 AND entry_no = 2;

UPDATE entry
SET
    team_id = 6
WHERE 
    event_id = 6 AND entry_no = 1;

UPDATE entry
SET
    team_id = 7
WHERE 
    event_id = 6 AND entry_no = 2;

UPDATE entry
SET
    team_id = 6
WHERE 
    event_id = 6 AND entry_no = 3;

UPDATE entry
SET
    team_id = 6
WHERE 
    event_id = 6 AND entry_no = 4;

UPDATE entry
SET
    team_id = 7
WHERE 
    event_id = 6 AND entry_no = 5;

UPDATE entry
SET
    team_id = 7
WHERE 
    event_id = 7 AND entry_no = 1;

UPDATE entry
SET
    team_id = 7
WHERE 
    event_id = 7 AND entry_no = 2;

UPDATE entry
SET
    team_id = 3
WHERE 
    event_id = 10 AND entry_no = 1;

UPDATE entry
SET
    team_id = 3
WHERE 
    event_id = 10 AND entry_no = 2;

UPDATE entry
SET
    team_id = 3
WHERE 
    event_id = 10 AND entry_no = 3;


COMMIT;
