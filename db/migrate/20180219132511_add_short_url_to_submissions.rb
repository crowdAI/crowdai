class AddShortUrlToSubmissions < ActiveRecord::Migration[5.1]
  def change
    add_column :submissions, :short_url, :string
  end

end
