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
              <small className="edit-delete-block">
              <a className="waves-effect waves-light edit-btn btn" rel="nofollow" href={"/users/" + user.id + "/edit"}>Edit</a>
              <a className="waves-effect waves-light edit-btn btn" rel="nofollow" data-method="delete" href={"/user/" + user.id}>Delete</a>
            </small>
          </li>);
        })}
        </ol>
      </div>
    );
  }
});
