var Wines = React.createClass({
  render: function() {
    return (
      <div className="row index-row">
        <div>
          <a className="back btn" href={"/users"}>See Users</a>
        </div>
        <div className="col s12 main-block">
          {this.props.wines.map(function (wine) {
            return (
              <div key={wine.id} className="name-index">
                <div className="blocky-block">
                  <a className="name-index" href={"/wines/" + wine.id}>{wine.name}</a>
                  <a className="favorite btn" rel="nofollow" href={"/userwines/new"}>Favorite</a>
                </div>
              </div>
            );
          })}
          <small className="edit-delete-block">
            <a className="waves-effect waves-light edit-btn btn" rel="nofollow" href={"/wines/" + this.props.wine.id + "/edit"}>Edit</a>
            <a className="waves-effect waves-light del-btn btn" rel="nofollow" data-method="delete" href={"/wines/" + this.props.wine.id}>Delete</a>
          </small>
        </div>
      </div>
    );
  }
});
