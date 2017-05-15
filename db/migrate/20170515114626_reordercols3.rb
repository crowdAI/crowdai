class Reordercols3 < ActiveRecord::Migration[5.0]
  def change
    execute "drop view participant_challenges;"
    add_column :challenges, :description_markdownx, :text, after: :end_time
    add_column :challenges, :descriptionx, :text, after: :description_markdownx
    add_column :challenges, :evaluation_markdownx, :text, after: :descriptionx
    add_column :challenges, :evaluationx, :text, after: :evaluation_markdownx
    add_column :challenges, :rules_markdownx, :text, after: :evaluationx
    add_column :challenges, :rulesx, :text, after: :rules_markdownx
    add_column :challenges, :prizes_markdownx, :text, after: :rulesx
    add_column :challenges, :prizesx, :text, after: :prizes_markdownx
    add_column :challenges, :resources_markdownx, :text, after: :prizesx
    add_column :challenges, :resourcesx, :text, after: :resources_markdownx
    add_column :challenges, :submission_instructions_markdownx, :text, after: :resourcesx
    add_column :challenges, :submission_instructionsx, :text, after: :submission_instructions_markdownx
    add_column :challenges, :license_markdownx, :text, after: :submission_instructionsx
    add_column :challenges, :licensex, :text, after: :license_markdownx
    add_column :challenges, :dataset_description_markdownx, :text, after: :license_markdownx
    add_column :challenges, :dataset_descriptionx, :text, after: :dataset_description_markdownx

    execute "update challenges
            set description_markdownx = description_markdown,
            descriptionx = description,
            evaluation_markdownx = evaluation_markdown,
            evaluationx = evaluation,
            rules_markdownx = rules_markdown,
            rulesx = rules,
            prizes_markdownx = prizes_markdown,
            prizesx = prizes,
            resources_markdownx = resources_markdown,
            resourcesx = resources_markdown,
            submission_instructions_markdownx = submission_instructions_markdown,
            submission_instructionsx = submission_instructions,
            license_markdownx = license_markdown,
            licensex = license,
            dataset_description_markdownx = dataset_description_markdown,
            dataset_descriptionx = dataset_description;
            "
    remove_column :challenges, :description_markdown
    remove_column :challenges, :description
    remove_column :challenges, :evaluation_markdown
    remove_column :challenges, :evaluation
    remove_column :challenges, :rules_markdown
    remove_column :challenges, :rules
    remove_column :challenges, :prizes_markdown
    remove_column :challenges, :prizes
    remove_column :challenges, :resources_markdown
    remove_column :challenges, :resources
    remove_column :challenges, :submission_instructions_markdown
    remove_column :challenges, :submission_instructions
    remove_column :challenges, :license_markdown
    remove_column :challenges, :license
    remove_column :challenges, :dataset_description_markdown
    remove_column :challenges, :dataset_description

    rename_column :challenges, :description_markdownx, :description_markdown
    rename_column :challenges, :descriptionx, :description
    rename_column :challenges, :evaluation_markdownx, :evaluation_markdown
    rename_column :challenges, :evaluationx, :evaluation
    rename_column :challenges, :rules_markdownx, :rules_markdown
    rename_column :challenges, :rulesx, :rules
    rename_column :challenges, :prizes_markdownx, :prizes_markdown
    rename_column :challenges, :prizesx, :prizes
    rename_column :challenges, :resources_markdownx, :resources_markdown
    rename_column :challenges, :resourcesx, :resources
    rename_column :challenges, :submission_instructions_markdownx, :submission_instructions_markdown
    rename_column :challenges, :submission_instructionsx, :submission_instructions
    rename_column :challenges, :license_markdownx, :license_markdown
    rename_column :challenges, :licensex, :license
    rename_column :challenges, :dataset_description_markdownx, :dataset_description_markdown
    rename_column :challenges, :dataset_descriptionx, :dataset_description

    execute "create view participant_challenges as SELECT p.id,
       pc.challenge_id,
       pc.participant_id,
       c.organizer_id,
       c.challenge,
       c.description,
       c.rules,
       c.prizes,
       c.resources,
       c.tagline,
       p.name,
       p.email,
       p.last_sign_in_at,
       p.bio,
       p.github,
       p.linkedin,
       p.twitter
      FROM participants p,
       challenges c,
       ( SELECT c_1.id,
               c_1.id AS challenge_id,
               p_1.id AS participant_id
              FROM challenges c_1,
               participants p_1,
               submissions s_1
             WHERE s_1.challenge_id = c_1.id AND s_1.participant_id = p_1.id
           UNION
            SELECT c_1.id,
               c_1.id AS challenge_id,
               p_1.id AS participant_id
              FROM challenges c_1,
               participants p_1,
               topics t
             WHERE t.challenge_id = c_1.id AND t.participant_id = p_1.id
           UNION
            SELECT t.challenge_id AS id,
               t.challenge_id,
               ps.id AS participant_id
              FROM comments ps,
               topics t
             WHERE t.id = ps.topic_id
           UNION
            SELECT df.challenge_id AS id,
               df.challenge_id,
               dfd.participant_id
              FROM dataset_file_downloads dfd,
               dataset_files df
             WHERE dfd.dataset_file_id = df.id) pc
     WHERE pc.participant_id = p.id AND pc.challenge_id = c.id;
;"

  end
end
