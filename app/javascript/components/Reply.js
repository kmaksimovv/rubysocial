import React from "react"
import PropTypes from "prop-types"
class Reply extends React.Component {
  render () {
    return (
      <div class="container px-4">
        <div class="row gx-5">
          <div class="col">
            <div className="media mt-4 p-3 border bg-light">
              <img className="d-flex mr-3 rounded-circle" src="http://placehold.co/50x50" alt="" />
              <div className="media-body">
                 {this.props.reply.body}
          </div>
        </div>
       </div>
    </div>
  </div>
    );
  }
}

export default Reply
