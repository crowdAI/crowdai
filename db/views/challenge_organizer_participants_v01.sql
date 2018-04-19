SELECT DISTINCT cop.id,
  cop.participant_id,
  cop.clef_task_id,
  cop.organizer_id,
  cop.name,
  cop.challenge
FROM (
  SELECT c.id,
    p.id AS "participant_id",
    c.clef_task_id,
    c.organizer_id,
    p.name,
    c.challenge
  FROM participants p,
       challenges c,
       organizers o
  WHERE p.organizer_id = o.id
  AND c.organizer_id = o.id
  UNION
  SELECT c.id,
    p.id AS "participant_id",
    c.clef_task_id,
    c.organizer_id,
    p.name,
    c.challenge
  FROM participants p,
       challenges c
  WHERE c.clef_challenge IS TRUE
  AND c.clef_task_id IN (SELECT c1.clef_task_id
                         FROM challenges c1,
                              organizers o1,
                              participants p1
                         WHERE c1.clef_challenge IS TRUE
                         AND o1.id = c1.organizer_id
                         AND o1.id = p1.organizer_id
                         AND p1.id = p.id)
) cop
