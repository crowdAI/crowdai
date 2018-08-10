ActiveAdmin.register SubmissionGrade do
  belongs_to :submission
  actions :all, except: :new
end
