import React from 'react'
import ReactDOM from 'react-dom'
import NotificationsContainer from './components/NotificationsContainer'

const notifications = document.querySelector('#notification-container');
ReactDOM.render(<NotificationsContainer />, notifications);
