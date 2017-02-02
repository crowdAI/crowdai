ActiveAdmin.register Post do

  belongs_to :topic
  navigation_menu :topic
end
