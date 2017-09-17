class MandrillMessage < ApplicationRecord

  def status
    res[0]["status"]
  end

  def reject_reason
    res[0]["reject_reason"]
  end

  def merge_vars
    message["global_merge_vars"]
  end

  def merge_var(var)
    ret = nil
    merge_vars.each do |pair|
      if pair['name'] == var
        ret = pair['content']
      end
    end
    return ret
  end

  def subject
    message['subject']
  end

  def from_name
    message['from_name']
  end

  def from_email
    message['from_email']
  end

  def email_array
    message['to'].map {|e| e['email'] }
  end

  def unsubscribe_url
    merge_var('UNSUBSCRIBE_URL')
  end

end
