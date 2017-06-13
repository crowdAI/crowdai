class SearchChallengeListItem extends React.Component {
  render() {
    return (
      <li>
        <img src={this.props.challenge.image_thumb_url} />
        <a href={`/challenges/${this.props.challenge.id}`}>{this.props.challenge.challenge}</a>
      </li>
    )
  }
}
