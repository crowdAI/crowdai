class SearchBar extends React.Component {
  constructor(props) {
    super(props)
  }

  render () {
    return (
      <div className="search">
        <form id="search-box" method="get" action="">
          <label>
            <input
              id="search-bar"
              type="search"
              name="search"
              placeholder="Search crowdAI"
            />
            <span className="fa fa-lg"></span>
          </label>
        </form>
        <a className="search-open fa fa-search fa-lg" href="#"></a>
      </div>
    );
  }
}
