class SearchCommentListItem extends React.Component {
  render() {
    return (
      <li>
        <img src={this.props.comment.image_thumb_url} />
        <a href={`/challenges/${this.props.comment.id}`}>{this.props.comment.comment}</a>
      </li>
    )
  }
}
