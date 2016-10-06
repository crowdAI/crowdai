class AddPostChallengeToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :post_challenge, :boolean, default: false
  end
end
