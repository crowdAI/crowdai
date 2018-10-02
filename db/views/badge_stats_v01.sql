SELECT
    bc.badge_id,
    bc.badge_count,
    pc.participant_count,
    100 - trunc(((pc.participant_count - bc.badge_count)::FLOAT / pc.participant_count) * 100) AS "percentile"
FROM
(SELECT badge_id, count(*) AS badge_count
FROM badges_sashes b,
participants p
WHERE p.sash_id = b.sash_id
GROUP BY badge_id) bc,
(SELECT count(*) AS participant_count FROM participants) pc
