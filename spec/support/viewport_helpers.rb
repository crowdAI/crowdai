module ViewportHelpers

  def resize_viewport(viewport)
    case viewport
    when 'iphone5'
      resize_window(320,568)
    when 'iphone6'
      resize_window(375,667)
    when 'iphone6plus'
      resize_window(414,736)
    end
  end


  private
  def resize_window(width, height)
    case Capybara.current_driver
    when :selenium
      Capybara.current_session.driver.browser.manage.window.resize_to(width, height)
    #when :webkit
    when :chrome
      handle = Capybara.current_session.driver.current_window_handle
      Capybara.current_session.driver.resize_window_to(handle, width, height)
    else
      raise NotImplementedError, "resize_window is not supported for #{Capybara.current_driver} driver"
    end
  end

end
