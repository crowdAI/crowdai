class InvitationImporter
  include ActiveModel::Model
  attr_accessor :file

  def initialize(file:,challenge_id:)
    @file = file
    @challenge_id = challenge_id
    @warnings = []
  end

  def persisted?
    false
  end

  def call
    invitees = load_imported_invitees
    if invitees.map(&:valid?).all?
      invitees.each(&:save!)
      true
    else
      invitees.each_with_index do |invitee, index|
        invitee.errors.full_messages.each do |message|
          errors.add :base, "Row #{index+2}: #{message}"
        end
      end
      false
    end
    return [@warnings,nil]
  end

  def load_imported_invitees
    spreadsheet = Roo::Spreadsheet.open(file.path)
    header = spreadsheet.row(1)
    invitees = []
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      invitee = Invitation.find_by(challenge_id: @challenge_id, email: row["email"])
      if invitee.present?
        @warnings << { row: i, message: "#{row["email"]}" }
      else
        invitee = Invitation.new(
          challenge_id: @challenge_id,
          invitee_name: row["name"],
          email: row["email"])
      end
      invitees << invitee
    end
    return invitees
  end
end
