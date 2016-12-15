class MandrillSpecHelper

  def initialize(result)
    @res = result[0][0]
    @msg = result[1]
  end

  def merge_vars
    @msg[:global_merge_vars]
  end

  def merge_var(var)
    ret = nil
    merge_vars.each do |pair|
      if pair[:name] == var
        ret = pair[:content]
      end
    end
    return ret
  end

  def subject
    @msg[:subject]
  end

  def from_name
    @msg[:from_name]
  end

  def from_email
    @msg[:from_email]
  end

  def email_array
    @msg[:to].map {|e| e[:email] }
  end

end
