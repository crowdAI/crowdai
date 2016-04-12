class SubmissionFilesController < ApplicationController
  before_filter :authenticate_participant!
end
