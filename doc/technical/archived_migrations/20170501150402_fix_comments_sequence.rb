class FixCommentsSequence < ActiveRecord::Migration[5.0]
  def change
    execute "alter sequence posts_id_seq rename to comments_id_seq;"
  end
end
