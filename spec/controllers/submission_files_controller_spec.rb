require 'rails_helper'

RSpec.describe SubmissionFilesController, type: :controller do

  it { should use_before_filter(:authenticate_participant!) }

end
