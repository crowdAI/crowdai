class Toc < ActiveRecord::Migration[5.2]
  def change
	  add_column :challenges, :toc_acceptance_text, :string 
	  add_column :challenges, :toc_acceptance_instructions, :text
  end
end
