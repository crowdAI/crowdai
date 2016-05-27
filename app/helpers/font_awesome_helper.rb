module FontAwesomeHelper

  def awesome_link(icon_class = nil, link_name = nil, url_options = nil, html_options = nil, &block)
    link_to("#{ awesome_icon_tag(icon_class) } #{link_name}".html_safe, url_options, html_options, &block)
  end

  def awesome_icon_tag(icon_class)
    "<i class='fa fa-#{ icon_class }'></i>"
  end

# usage:
#  <%= awesome_link 'fa-arrow-circle-o-up', 'wikipedia', 'www.wikipedia.com' %>
#  <%= awesome_link('fa-minus-circle', travel_path(current_island.name, travel) %>
#  <li><%= awesome_link('fa-bookmark',
#                     sentence_unbookmark_path(dialog, current_participant.id),
#                     method: :delete, remote: true, title: "Remove bookmark") %></li>

end
