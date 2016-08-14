module CheckboxHelper

def display_checkbox(boolean,label)
  html = nil
  id = Time.now.to_i
  if boolean
    html = <<-HTML
      <div class="checkbox-inline">
        <input id="#{id}" type="checkbox" disabled="1" checked="1">
          <label for="#{id}">
              #{label}
          </label>
      </div>
    HTML
  else
    html = <<-HTML
      <div class="checkbox-inline">
        <input id="#{id}" type="checkbox" disabled="1">
          <label for="#{id}">
              #{label}
          </label>
      </div>
    HTML

  end
  html.html_safe

end


end
