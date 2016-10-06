class AddFriendlyIds < ActiveRecord::Migration
  def change
    add_column :article_sections, :slug, :string
    add_index :article_sections, :slug, unique: true

    add_column :articles, :slug, :string
    add_index :articles, :slug, unique: true

    add_column :challenges, :slug, :string
    add_index :challenges, :slug, unique: true

    add_column :comments, :slug, :string
    add_index :comments, :slug, unique: true

    add_column :container_instances, :slug, :string
    add_index :container_instances, :slug, unique: true

    add_column :container_logs, :slug, :string
    add_index :container_logs, :slug, unique: true

    add_column :dataset_file_downloads, :slug, :string
    add_index :dataset_file_downloads, :slug, unique: true

    add_column :dataset_files, :slug, :string
    add_index :dataset_files, :slug, unique: true

    add_column :docker_configurations, :slug, :string
    add_index :docker_configurations, :slug, unique: true

    add_column :docker_files, :slug, :string
    add_index :docker_files, :slug, unique: true

    add_column :events, :slug, :string
    add_index :events, :slug, unique: true

    add_column :images, :slug, :string
    add_index :images, :slug, unique: true

    add_column :organizers, :slug, :string
    add_index :organizers, :slug, unique: true

    add_column :participants, :slug, :string
    add_index :participants, :slug, unique: true

    add_column :posts, :slug, :string
    add_index :posts, :slug, unique: true

    add_column :submission_files, :slug, :string
    add_index :submission_files, :slug, unique: true

    add_column :submission_grades, :slug, :string
    add_index :submission_grades, :slug, unique: true

    add_column :submissions, :slug, :string
    add_index :submissions, :slug, unique: true

    add_column :topics, :slug, :string
    add_index :topics, :slug, unique: true

    add_column :votes, :slug, :string
    add_index :votes, :slug, unique: true

  end
end
