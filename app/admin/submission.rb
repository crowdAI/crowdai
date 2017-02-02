ActiveAdmin.register Submission do

  belongs_to :challenge
  navigation_menu :challenge
end
