import React from 'react'
import ReactDOM from 'react-dom'
import NotificationsContainer from './components/NotificationsContainer'

const notificationAnchor = document.querySelector('#notification-anchor');
ReactDOM.render(<NotificationsContainer />, notificationAnchor);
