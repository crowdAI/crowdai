import React from 'react'
import NotificationItem from './NotificationItem'

class NotificationsContainer extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      newNotificationCount: 0,
      notifications: [],
      nextPage: null,
      currentUserID: this.props.currentUserID
    };
  }

  componentWillMount() {
    this.fetchNotifications();
    //this.setActionCableSubscription();
    console.log('go');
    console.log(this.state.currentUserID);
  }

  render () {
    return (
        <div className="notifications">
          <a id="toggle-notifications" href="#">{ this.renderNotificationIcon() }</a>
          { this.renderNotificationItems() }
        </div>
      );
    }
      /*
      <div className="notification-container">
        <a className={`dropdown-toggle ${this.state.newNotificationCount > 0 ? 'active' : ''}`}
          onClick={() => this.handleMarkAsTouched()}
          data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
          {this.renderNotificationIcon()}
        </a>
        <div
          className="dropdown-menu"
          ref={(ref) => {this.dropdownRef = ref}}
        >
          <span className="dropdown-arrow-top"></span>
          <span className="dropdown-arrow-bottom"></span>
          <div className="notification-header">
            <span>Notifications</span>
            <a className="pull-right mark-all-as-read"
              onClick={(e) => this.handleMarkAllAsRead(e)}>
              Mark All as Read
            </a>
          </div>
          <ul
            onScroll={() => this.handleScroll()}
            ref={(ref) => {this.notificationsListRef = ref}}
            className="notifications-list">
            {this.renderNotificationItems()}
            {this.loadMoreButton()}
          </ul>
        </div>
      </div>
    );
  }  */

  fetchNotifications() {
    $.ajax({
      url: "/components/notifications.json",
      dataType: "JSON",
      method: "GET",
      success: (data) => {
        this.setState({
          newNotificationCount: data.new_notification_count,
          nextPage: data.next_page,
          notifications: data.notifications
        });
        console.log('data');
        console.log(data);
      }
    });
  }


  setActionCableSubscription() {
    App.cable.subscriptions.create("NotificationsChannel", {
      connected() {},
      disconnected() {},
      received(data) {
        console.log("new message");
        console.log(data);
        //this.appendNewMessage(data);
      }//,
      //appendNewMessage: this.appendNewMessage
    });
  }

  renderNotificationIcon() {
    if (this.state.newNotificationCount > 0) {
      return (
        <i className="fa fa-bell fa-lg active"></i>
      );
    } else {
      return (
        <i className="fa fa-bell fa-lg"></i>
      );
    }
  }


  renderNotificationItems() {
  if (!this.state.notifications.length) {
      return (
        <div id="notification-container">
          <ul>
            <li>
              <a href="#">
                <img src="" alt="" />
                <span><h5>No notifications yet</h5></span>
              </a>
            </li>
          </ul>
        </div>
      )
    }

    return (
    <div id="notification-container">
      <ul>
        <li>
          <a href="#">
            <img src="" alt="" />
            <span>David Hendry mentioned you in a post</span>
          </a>
        </li>
        <li>
          <a href="#">
            <img src="" alt="" />
            <span>Your Learning how to walk submission has been graded with a score of 34.22</span>
          </a>
        </li>
        <li>
          <a href="#">
            <img src="" alt="" />
            <span>Your OpenFood Ingredients List Challenge submission has failed grading</span>
          </a>
        </li>
        <li>
          <a href="#">
            <img src="" alt="" />
            <span>You have moved from 3rd place to 5th place on the Learning to walk</span>
          </a>
        </li>
      </ul>
    </div>
    )

    //return this.state.notifications.map(notification => {
    //  return (<NotificationItem key={notification.id} {...notification} />);
    //});
  }

  // Keep this as a fallack fro handleScroll
  loadMoreButton() {
    if (this.state.nextPage === null) {
      return;
    }
    return (
      <li className="load-more">
        <a onMouseOver={() => this.handleLoadMore()}>
          <i className="fa fa-spinner fa-pulse"></i>
        </a>
      </li>
    );
  }

  handleMarkAsTouched() { return; }


  handleScroll() {
    let scrollHeight = $(this.notificationsListRef)[0].scrollHeight;
    const OFFSET = 50;
    let scrollTop = $(this.notificationsListRef).scrollTop();
    if (scrollHeight - (scrollTop + OFFSET) < $(this.notificationsListRef).innerHeight()) {
      this.handleLoadMore();
    }
  }

  handleMarkAllAsRead() { }
  /*
    $(this.dropdownRef).parent().addClass('open'); // workaround jquery dropdown
    $.ajax({
      url: '/components/notifications/mark_all_as_read',
      method: 'POST',
      dataType: 'json',
      success: function() {
        this.setState({
          //notifications: this.state.notifications.map(notification => {
          //  return { ...notification, unread: false };
        });
      }
    });
  }
*/
  handleLoadMore() {
    if (this.fetching || !this.state.nextPage) { return; }
    this.fetching = true;
    $.ajax({
      url: `/components/notifications.json/?page=${this.state.nextPage}`,
      method: 'GET',
      dataType: 'json',
      success: (data) => {
        //this.fetching = false;
        //this.setState({
        //  newNotificationCount: data.new_notification_count,
        //  nextPage: nil,
        //  notifications: []
        //});
      }
    });
  }

}

export default NotificationsContainer
