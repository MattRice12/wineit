var Wine = React.createClass({
  render: function() {
    return (
      <div className="row show-row">
        <div className="col s12 block-show">
          <div className="name-block-show">
            <h3 className="name-show">{this.props.wine.name}</h3>
            <small className="edit-delete-block">
              <a className="waves-effect waves-light btn edit-btn" rel="nofollow" href={"/wines/" + this.props.wine.id + "/edit"}>Edit</a>
              <a className="waves-effect waves-light del-btn btn" rel="nofollow" data-method="delete" href={"/wines/" + this.props.wine.id}>Delete</a>
            </small>
          </div>
        </div>
        <div>
          <a className="back btn" href={"/wines"}>Back</a>
        </div>
      </div>
    );
  }
});
