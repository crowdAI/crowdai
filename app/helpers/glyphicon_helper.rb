module GlyphiconHelper

  def glyphicon_link(glyphicon_name = nil, link_name = nil, url_options = nil, html_options = nil, &block)
    link_to("#{ icon_tag(glyphicon_name) } #{link_name}".html_safe, url_options, html_options, &block)
  end

  private
  def icon_tag(glyphicon_name)
    "<i class='glyphicon glyphicon-#{ glyphicon_name }'></i>"
  end

# usage:
#  <%= awesome_link 'fa-arrow-circle-o-up', 'wikipedia', 'www.wikipedia.com' %>
#  <%= awesome_link('fa-minus-circle', travel_path(current_island.name, travel) %>
#  <li><%= awesome_link('fa-bookmark',
#                     sentence_unbookmark_path(dialog, current_user.id),
#                     method: :delete, remote: true, title: "Remove bookmark") %></li>

end
