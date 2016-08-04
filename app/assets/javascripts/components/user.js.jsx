var User = React.createClass({
  render: function() {
    return (
      <div className="row show-row">
        <div className="col s12 block-show">
          <div className="name-block-show">
            <div>
              <h3 className="name-show">{this.props.user.username}</h3>
              <div>
                <ol>
                  Favorite Wines: {this.props.userwines.map(function (userwine) {
                    return (<li key={userwine.id}
                    className="wine-favorite-list">
                    {userwine.wine.name}</li>);
                  })}
                </ol>
              </div>
            </div>
            <small className="edit-delete-block">
              <a className="waves-effect waves-light edit-btn btn" rel="nofollow" href={"/users/" + this.props.user.id + "/edit"}>Edit</a>
              <a className="waves-effect waves-light del-btn btn" rel="nofollow" data-method="delete" href={"/users/" + this.props.user.id}>Delete</a>
            </small>
          </div>
        </div>
        <div>
          <a className="back btn" href={"/users"}>Back</a>
        </div>
      </div>
    );
  }
});
