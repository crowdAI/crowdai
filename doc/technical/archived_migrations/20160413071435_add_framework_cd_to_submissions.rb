class AddFrameworkCdToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :framework, :string
  end
end
