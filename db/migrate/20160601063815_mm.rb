class Mm < ActiveRecord::Migration
    def change
  execute "drop rule update_challenge_views on challenge_views;"
  drop_view :challenge_views

  create_view :challenge_views, "
  SELECT
  c.id,
  c.organizer_id,
  c.challenge,
  c.status_cd,
  c.description,
  c.evaluation_markdown,
  c.rules,
  c.prizes,
  c.resources,
  c.created_at,
  c.updated_at,
  c.dataset_description,
  c.submission_instructions,
  c.tagline,
  c.evaluation,
  c.primary_sort_order_cd,
  c.secondary_sort_order_cd,
  c.description_markdown,
  c.rules_markdown,
  c.prizes_markdown,
  c.resources_markdown,
  c.dataset_description_markdown,
  c.submission_instructions_markdown,
  c.perpetual_challenge,
  c.grading_factor,
  c.grader_cd,
  c.answer_file_s3_key,
  c.page_views,
  (COUNT(s.*) / 2)::INT AS submission_count,
  COUNT(cp.*) AS participant_count
  FROM challenges c
  LEFT OUTER JOIN submissions s
  ON s.challenge_id = c.id
  LEFT OUTER JOIN (SELECT c.id,
      c.id AS challenge_id,
      p.id AS participant_id
      FROM challenges c,
      participants p,
      submissions s
    WHERE ((s.challenge_id = c.id) AND (s.participant_id = p.id))
  UNION
   SELECT c.id,
      c.id AS challenge_id,
      p.id AS participant_id
     FROM challenges c,
      participants p,
      topics t
    WHERE ((t.challenge_id = c.id)
             AND ((t.participant_id = p.id) OR (EXISTS
                  ( SELECT 'X'
                    FROM posts ps
                    WHERE ((ps.topic_id = t.id) AND (ps.participant_id = p.id))))))
  ) cp ON cp.id = c.id
  GROUP BY c.id, c.page_views
  "

  execute "
  CREATE rule update_challenge_views AS
  ON UPDATE TO challenge_views
  DO instead (UPDATE challenges
  SET
organizer_id = new.organizer_id,
challenge = new.challenge,
status_cd = new.status_cd,
description = new.description,
evaluation_markdown = new.evaluation_markdown,
rules = new.rules,
prizes = new.prizes,
resources = new.resources,
created_at = new.created_at,
updated_at = new.updated_at,
dataset_description = new.dataset_description,
submission_instructions = new.submission_instructions,
tagline = new.tagline,
evaluation = new.evaluation,
primary_sort_order_cd = new.primary_sort_order_cd,
secondary_sort_order_cd = new.secondary_sort_order_cd,
description_markdown = new.description_markdown,
rules_markdown = new.rules_markdown,
prizes_markdown = new.prizes_markdown,
resources_markdown = new.resources_markdown,
dataset_description_markdown = new.dataset_description_markdown,
submission_instructions_markdown = new.submission_instructions_markdown,
perpetual_challenge = new.perpetual_challenge,
grading_factor = new.grading_factor,
grader_cd = new.grader_cd,
answer_file_s3_key = new.answer_file_s3_key,
page_views = new.page_views
WHERE challenges.id = new.id);
  "
end
end
