class AddTaglineToOrganizers < ActiveRecord::Migration[5.0]
  def change
    add_column :organizers, :tagline, :string
  end
end
