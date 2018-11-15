class AddTocAccordionToChallenges < ActiveRecord::Migration[5.2]
  def change
    add_column :challenges, :toc_accordion, :boolean, default: false
    execute "update challenges set toc_accordion = false;"
  end
end
