class Renamemailer < ActiveRecord::Migration[5.1]
  def change
    rename_table :mailers, :crowdai_mailers
  end
end
