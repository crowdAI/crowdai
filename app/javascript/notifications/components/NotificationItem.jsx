import React from 'react'

class NotificationItem extends React.Component {
  constructor(props) {
    super(props);

    this.state = { unread: this.props.unread };
  }


  render () {
    return (
      <li>
        <a href="#">
          <img src="" alt="" />
          <span>{ this.props.notification.message }</span>
        </a>
      </li>
    )
  }
}

export default NotificationItem
