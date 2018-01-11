class AddUsernameToParticipants < ActiveRecord::Migration[5.1]
  def change
    Participant.all.each do |p|
      p.update(name: p.name.gsub(/\s+/,'_'))
    end
  end
end


=begin

    Participant.all.each do |p|
      username = nil
      pass = 0
      begin
        pass += 1
        username = p.name.gsub(/\s+/,'_')
        if pass > 1
          username = username + pass.to_s
        end
      end while Participant.exists?(name: username)
      p.update(name: username)
    end
=end
