module GlyphiconHelper

  def glyphicon_link(glyphicon_name = nil, link_name = nil, url_options = nil, html_options = {}, &block)
    if html_options['id'].nil? && !link_name.nil?
      html_options['id'] = "glyphicon-link-#{link_name.downcase}"
    end
    link_to("#{ glyphicon_icon_tag(glyphicon_name) } #{link_name}".html_safe, url_options, html_options, &block)
  end

  def glyphicon_icon_tag(glyphicon_name)
    "<i class='glyphicon glyphicon-#{ glyphicon_name }'></i>"
  end



# usage:
# <%= glyphicon_link 'equalizer', 'Resources', challenge_path(@challenge, anchor: 'resources') %>
# <%= glyphicon_link 'user', 'Profile', participant_path(current_participant) %>


end
