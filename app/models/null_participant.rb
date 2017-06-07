class NullParticipant

  def method_missing(*args, &block)
    self
  end

  def name
    '<< redacted >>'
  end

  def admin?
    false
  end

  def image_file
    nil
  end

end
