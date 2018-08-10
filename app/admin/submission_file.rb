ActiveAdmin.register SubmissionFile do
  belongs_to :submission
  actions :all, except: :new
end
