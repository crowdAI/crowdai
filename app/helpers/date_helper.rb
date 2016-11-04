module DateHelper
  def display_date(date)
    date.strftime("%-d %B '%y")
  end

  def display_dttm(date)
    date.strftime("%a, %e %b %Y %R")
  end
end
