import React from 'react';
import React3 from 'react-three-renderer';
import * as THREE from 'three';
import ReactDOM from 'react-dom';

class Lights extends React.Component {
  constructor(props, context){
    super(props, context);
  }
  render() {
    return (
      <React3.DirectionalLight
        position={new THREE.Vector3(1,1,1)}
      >
        {this.props.children}
      </React3.DirectionalLight>
    );
  }
}

export default Lights;
