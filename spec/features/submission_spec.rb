require "rails_helper"

RSpec.feature "submissions", type: :feature do

  describe "competitor submissions" do
    scenario "a competitor can make a submission" do
      skip("spec to be coded")
    end

    scenario "a competitor can attach files to a submission" do
      skip("spec to be coded")
    end

    scenario "an incomplete submission can be saved as draft" do
      skip("spec to be coded")
    end

    scenario "an submission can be saved as submit when complete" do
      skip("spec to be coded")
    end

    scenario "a competitor may not make more then 5 submissions in a day" do
      skip("spec to be coded")
    end

    scenario "a competitor must provide a submission message" do
      skip("spec to be coded")
    end

    scenario "exactly two files must be uploaded" do
      skip("spec to be coded")
    end

    scenario "the first file must be a .csv file" do
      skip("spec to be coded")
    end

    scenario "the second file must be an archive" do
      skip("spec to be coded")
    end

    scenario "a participant cannot access another participants entry" do
      skip("spec to be coded")
    end
  end

  describe "submission evaluations" do
    scenario "a submission is created by a participant and is in ungraded status" do
      skip("spec to be coded")
    end

    scenario "when a submission is graded by an admin the leaderboard is updated" do
      skip("spec to be coded")
    end
  end

end
