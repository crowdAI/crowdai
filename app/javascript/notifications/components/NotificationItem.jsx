import React from 'react'

class NotificationItem extends React.Component {
  constructor(props) {
    super(props);

    this.state = { unread: this.props.unread };
  }


  render () {
    return (
      <li>
        <a href={this.props.notification.notification_url}>
          <img src={this.props.notification.thumbnail_url} alt="" />
          <span>{ this.props.notification.message }</span>
        </a>
      </li>
    )
  }
}

export default NotificationItem
