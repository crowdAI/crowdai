/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

import React from 'react';
import { render } from 'react-dom';
import {CrowdAIMusicEvaluationInterface} from 'crowdai-music-evaluation-interface';

/*
document.addEventListener('DOMContentLoaded', () => {
  render(
    <CrowdAIMusicEvaluationInterface name="React" />
    )
  }
)
*/

document.addEventListener('turbolinks:load', () => {
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
