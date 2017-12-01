module JobsHelper

  def flag(country)
    alpha3 = ISO3166::Country.find_country_by_alpha2(country).alpha3.downcase
    if alpha3.present?
      "<span class='flag flag-#{alpha3}'></span>".html_safe
    end
  end

end
