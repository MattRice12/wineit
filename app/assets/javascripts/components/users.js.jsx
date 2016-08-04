var Users = React.createClass({
  render: function() {
    return (
      <div className="row index-row">
        <div>
          <a className="back btn" href={"/wines/"}>See Wines</a>
        </div>
        <ol className="col s12 main-block">
          {this.props.users.map(function (user) {
            return (<li key={user.id}
                    className="blocky-block">
            <div className="name-index">
              <a href={"/users/" + user.id}>{user.username}</a>
            </div>
              <small>
                <ol>Favorite Wines: {this.props.userwines.map(function (userwine) {
                  return (<li key={userwine.id}
                          className="wine-favorite-list">{userwine.wine.name}</li>);
                  }.bind(this))}
                </ol>
              </small>
            <small className="edit-delete-block">
              <a className="waves-effect waves-light edit-btn btn" rel="nofollow" data-method="put" href={"/users/" + this.props.user.id + "/edit"}>Edit</a>
              <a className="waves-effect waves-light edit-btn btn" rel="nofollow" data-method="delete" href={"/user/" + this.props.user.id}>Delete</a>
            </small>
          </li>);
        }.bind(this))}
        </ol>
      </div>
    );
  }
});
