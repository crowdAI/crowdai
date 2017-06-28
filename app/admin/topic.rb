ActiveAdmin.register Topic do
  belongs_to :challenge
  navigation_menu :challenge
end
