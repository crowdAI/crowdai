import React from 'react'
import NotificationItem from './NotificationItem'

class NotificationsContainer extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      dropdownOpened: false,
      newNotificationCount: 0,
      notifications: [],
      nextPage: null,
      currentParticipantID: null
    };
    this.handleDropdownClick = this.handleDropdownClick.bind(this);
  }

  componentWillMount() {
    this.fetchNotifications();
  }

  render () {
    return (
      <div className="notifications">
        <a id="toggle-notifications" href="#" onClick={this.handleDropdownClick}>
          { this.renderNotificationIcon() }
        </a>
        { this.renderDropdown() }
      </div>
    );
  }

  fetchNotifications() {
    $.ajax({
      url: "/components/notifications.json",
      dataType: "JSON",
      method: "GET",
      success: (data) => {
        this.setState({
          newNotificationCount: data.new_notification_count,
          nextPage: data.next_page,
          notifications: data.notifications,
          currentParticipantID: data.current_participant_id
        });
      }
    });
  }

  handleDropdownClick(e) {
    e.preventDefault();
    if(this.state.notifications.length > 0){
      if(this.state.dropdownOpened){
        this.setState({dropdownOpened: false});
      } else {
        this.setState({dropdownOpened: true});
      }
    }
  }

  renderDropdown(){
    if (this.state.dropdownOpened){
      return(
        <div id="notification-container" className='open'>
          <ul>
            { this.renderNotificationList() }
          </ul>
        </div>
      );
    }
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


  renderPoolItems() {
    return this.state.poolItems.map((poolItem) => {
      return <PoolItem
                key={poolItem.index}
                poolItem={poolItem}
                poolItemHandler={this.pushItem} />
    });
  }



  renderNotificationList() {
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
    return this.renderNotificationItems();
  }

  renderNotificationItems(){
    return this.state.notifications.map((notification) => {
      return <NotificationItem key={notification.id} notification={notification} />
    });
  }

}

export default NotificationsContainer


/* TBD
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
*/
