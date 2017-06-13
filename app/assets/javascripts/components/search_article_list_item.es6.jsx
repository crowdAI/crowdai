class SearchArticleListItem extends React.Component {
  render() {
    return (
      <li>
        <img src={this.props.article.image_thumb_url} />
        <a href={`/articles/${this.props.article.id}`}>{this.props.article.article}</a>
      </li>
    )
  }
}
