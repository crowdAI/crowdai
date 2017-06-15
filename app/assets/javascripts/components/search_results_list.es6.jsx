class SearchResultsList extends React.Component {

  render() {
    return (
      <ul id="search-dropdown" onMouseEnter={() => {this.props.setPreventHideDropdown()}} onMouseLeave={() => {this.props.resetPreventHideDropdown()}}>
        <li>
          <a href={`/search?q=${this.props.term}`}>
            <i className="fa fa-search"></i> Search for <strong>{this.props.term}</strong>
          </a>
        </li>
        {this.renderChallengeHeading()}
        {this.renderChallenges()}
        {this.renderArticleHeading()}
        {this.renderArticles()}
        //{this.renderCommentHeading()}
        //{this.renderComments()}
      </ul>
    );
  }

  renderChallengeHeading() {
    if (this.props.challenges.length === 0) { return; }
    return <h6>challenges</h6>
  }

  renderChallenges() {
   return this.props.challenges.slice(0, 3).map((challenge) => {
      return <SearchChallengeListItem key={challenge.id} challenge={challenge} />
    });
  }

  renderArticleHeading() {
    if (this.props.challenges.length === 0) { return; }
    return <h6>articles</h6>
  }

  renderArticles() {
   return this.props.articles.slice(0, 3).map((article) => {
      return <SearchArticleListItem key={article.id} article={article} />
    });
  }

  renderCommentHeading() {
    if (this.props.comments.length === 0) { return; }
    return <h6>comments</h6>
  }

  renderComments() {
   return this.props.challenges.slice(0, 3).map((comment) => {
      return <SearchCommentListItem key={comment.id} comment={comment} />
    });
  }

}
