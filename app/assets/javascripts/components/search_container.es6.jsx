class SearchContainer extends React.Component {
  constructor(props) {
    super(props)

    this.state = { preventHideDropdown: false, showDropdown: false, term: '', challenges: [], articles: [], posts: [] }
    this.hideDropdown = this.hideDropdown.bind(this);
    this.showDropdown = this.showDropdown.bind(this);
    this.setPreventHideDropdown = this.setPreventHideDropdown.bind(this);
    this.resetPreventHideDropdown = this.resetPreventHideDropdown.bind(this);
  }

  search(term) {
    this.setState({ term });
    $.ajax({
      url: `/components/autocomplete.json?term=${term}`,
      method: 'GET',
      success: (data) => {
        this.setState({
          challenges: data.challenges,
          articles: data.articles,
          posts: data.posts
        });
      }
    });
  }

  setPreventHideDropdown(){
    this.setState({ preventHideDropdown: true });
  }

  resetPreventHideDropdown(){
    this.setState({ preventHideDropdown: false });
  }

  hideDropdown(){
    if (!this.state.preventHideDropdown){
      this.setState({ showDropdown: false });
    }
  }

  showDropdown(){
    this.setState({ showDropdown: true });
  }

  render(){
    return (
      <div>
        <SearchBar
          showDropdown={this.showDropdown}
          hideDropdown={this.hideDropdown}
          term={this.state.term}
          onSearchTermChange={(term) => {this.search(term)}}
        />
      { this.renderSearchResults()}
      </div>
    );
  }

  renderSearchResults(){
    if (!this.state.showDown || (this.state.challenges.length === 0
                               && this.state.articles.length === 0
                               && this.state.comments.length === 0 ))
      { return; }

    return (
      <SearchResultsList
        setPreventHideDropdown={this.preventHideDropdown}
        resetPreventHideDropdown={this.resetPreventHideDropdown}
        term={this.state.term}
        challenges={this.state.challenges}
        articles={this.state.articles}
        comments={this.state.comments}
      />
    );
  }

}
