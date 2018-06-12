import React from 'react'
import { render } from 'react-dom'
import NotificationsContainer from './notifications/NotificationsContainer'
import {CrowdAIMusicEvaluationInterface} from 'crowdai-music-evaluation-interface';


document.addEventListener('turbolinks:load', () => {
  
  const notificationAnchor = document.getElementById('notification-anchor');
  if (notificationAnchor) {
    render(<NotificationsContainer />, notificationAnchor);
  }
  
  const musicRoot = document.getElementById('music-root2');
  if (musicRoot) {
    const participantId = musicRoot.dataset.participantId;
    render(
      <CrowdAIMusicEvaluationInterface
      name="React" participantId={participantId}
      />,
    musicRoot
    )
  }
})
