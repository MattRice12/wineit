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
                  <a className="favorite btn" rel="nofollow" data-method="post" href={"/userwines?" + user_id= [user.id]}>Favorite</a>



<%= link_to "favorite", userwines_path(user_id: wine.id), method: :post%>



                  <small className="edit-delete-block">
                    <a className="waves-effect waves-light edit-btn btn" rel="nofollow" href={"/wines/" + wine.id + "/edit"}>Edit</a>
                    <a className="waves-effect waves-light del-btn btn" rel="nofollow" data-method="delete" href={"/wines/" + wine.id}>Delete</a>
                  </small>
                </div>
              </div>
            );
          })}
        </div>
      </div>
    );
  }
});
