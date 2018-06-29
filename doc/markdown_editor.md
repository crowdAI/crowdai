## Markdown Editor

The crowdAI Markdown editor includes the following features:

- Kramdown-based Markdown
- Code syntax highlighting
- MathJax integration
- At mentions: @mentions
- Caching of rendered markdown
- GitHub-style markdown editor with a toolbar and live preview.
- Uploading of Image assets

### Markdownable Area

crowdAI supports two views of the markdown editor: with or without toolbar. Aside from image uploading, all features are available in either view.

#### Editor with toolbar

```erb
<%= markdown_editor do |m| %>
  <%= f.text_area :evaluation_markdown, class: "txt-med" %>
<% end %>
```

The **erb** code interacts with [jQuery code](https://github.com/crowdAI/crowdai/blob/master/app/assets/javascripts/modules/markdown_editor.js) to provide the editing environment.

#### Markdownable text area

```erb
<%= f.text_area :comment_markdown, placeholder: "Add a comment...", data: { behavior: "mentions" } %>
<%= f.hidden_field :mentions_cache %>
```

### Markdown Concern

Markdownable fields are pairs, the editable field must end with ```_markdown``` and the ```Markdownable``` Concern added to the model. For example, for comments, the fields are:

- comment
- comment_markdown

When the field ending in ```_markdown``` is saved, a callback on the model (via the ```Markdownable``` Concern) fires and the markdown text is rendered as HTML, then saved in the 'bare' field, which is then used in for display.

### At Mentions

The At Mentions functionality is activated by adding  ```data-behaviour='mentions'``` to the markdown field. This activates the [javascript](https://github.com/crowdAI/crowdai/blob/master/app/assets/javascripts/modules/mentions.js)

### Image Uploads

TODO
