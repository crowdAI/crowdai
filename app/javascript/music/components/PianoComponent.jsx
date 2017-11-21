import React from 'react';
import * as THREE from 'three';
import ReactDOM from 'react-dom';
import OrbitAndPanControls from './OrbitAndPanControls.js';

var ColladaLoader = require('three-collada-loader');
const getCompoundBoundingBox = function(object3D) {
    var box = null;
    object3D.traverse(function (obj3D) {
        var geometry = obj3D.geometry;
        if (geometry === undefined) return;
        geometry.computeBoundingBox();
        if (box === null) {
            box = geometry.boundingBox;
        } else {
            box.union(geometry.boundingBox);
        }
    });
    return box;
}

class PianoComponent extends React.Component {
  constructor(props){
    super(props);
    this.props = props;
    this.state = {
      key_states: this.props.key_states,
      key_attack_time: this.props.key_attack_time,
      key_max_rotation: this.props.key_max_rotation,
      octave: this.props.octave,
      canvas_id: "canvas_"+parseInt(Math.random()*10000000)
    };

    console.log(this.state);

    this.init_lights = this.init_lights.bind(this);
    this.prepare_scene = this.prepare_scene.bind(this);
    this.initialize_keys = this.initialize_keys.bind(this);
    this.frame = this.frame.bind(this);
    this.update = this.update.bind(this);
    this.render = this.render.bind(this);
    this.update_key = this.update_key.bind(this);
    this.on_window_resize = this.on_window_resize.bind(this);
    this.smoothstep = this.smoothstep.bind(this);
    this.mix = this.mix.bind(this);
    this.key_status = this.key_status.bind(this);

    // this.song = "game_of_thrones.mid";
    this._noteOnColor = [ 255, 0, 0, 1.0 ];
    this.noteOnColor  = new THREE.Color().setRGB(this._noteOnColor[0]/256.0, this._noteOnColor[1]/256.0, this._noteOnColor[2]/256.0);
    this.keyState = Object.freeze ({unpressed: {}, note_on: {}, pressed:{}, note_off:{} });
  }
  frame(delta){
    var delta = this.clock.getDelta();
    this.update(delta);
    this.renderer.render(this.scene, this.camera);
    requestAnimationFrame(this.frame);
    // console.log(this.camera);
  }

  componentDidMount(){
    this.scene = new THREE.Scene();
    this.camera = new THREE.PerspectiveCamera( 30, window.innerWidth/window.innerHeight, 2.0, 5000 );
    window.camera = this.camera;
    this.keys_down = [];
    this.keys_obj = [];
    window.keys_obj = this.keys_obj;

    // window.keyState = this.keyState;
    var canvas = document.getElementById(this.state.canvas_id);
    this.renderer = new THREE.WebGLRenderer(
      {
        antialias:true,
        canvas: canvas
      });
    // this.renderer.setSize( window.innerWidth, window.innerHeight );
    this.renderer.setSize( document.getElementsByClassName("piano_renderer")[0].clientWidth, document.getElementsByClassName("piano_renderer")[0].clientHeight );
    this.renderer.shadowMapEnabled = true;
    this.renderer.shadowMapSoft = true;
    this.renderer.shadowMapType = THREE.PCFSoftShadowMap;
    this.renderer.gammaInput = true;
    this.renderer.gammaOutput = true;
    this.renderer.physicallyBasedShading = true;
    this.renderer.setClearColor (this.props.backgroundColor, 1);

    // window.THREE = THREE;
    // var axisHelper = new THREE.AxisHelper( 100 );
    // this.scene.add( axisHelper );

    //document.body.appendChild( this.renderer.domElement );
    document.getElementsByClassName("piano_renderer")[0].appendChild(this.renderer.domElement);

    this.material = new THREE.MeshLambertMaterial( { color: 0x606060} )

    if(!this.props.noFloor){
      this.floor = new THREE.Mesh( new THREE.PlaneBufferGeometry( 8000, 8000 ), new THREE.MeshStandardMaterial( { color: 0xf0f0f0 } ) );
      // this.floor = new THREE.Mesh( new THREE.PlaneGeometry( 8000, 8000 ), new THREE.MeshBasicMaterial( { color: 0xff00 } ) );
      // this.floor.rotation.x = -90 * ( Math.PI /  180 );
      this.floor.rotation.x = -1 * ( Math.PI /  4  ) - Math.PI/2;
      this.floor.rotation.y = 0;
      this.floor.rotation.z = 0;
      this.floor.position.y = -0.25;
      this.floor.receiveShadow = true;
      this.floor.castShadow = true;
      this.scene.add(this.floor);
    }
    // this.scene.fog = new THREE.Fog( 0xffffff, 40, 50 );


    var loader = new ColladaLoader();
    loader.load( 'https://raw.githubusercontent.com/spMohanty/3d-piano-player/master/obj/piano.dae', this.prepare_scene );

    this.camera.position.x = 5.545733663570945;
    this.camera.position.y = 17.43496880968363;
    this.camera.position.z = 3.947804382819341;
    this.camera.rotation._x = -1.5247920075821781;
    this.camera.rotation._y = -0.0005485303441902907;
    this.camera.rotation._z = -0.011914475959049894;
    this.camera.quaternion._x = -0.6906427130333965;
    this.camera.quaternion._y = -0.0043127191736616706;
    this.camera.quaternion._z = -0.004118729646872374;
    this.camera.quaternion._w = 0.7231715422037117;
    this.camera.updateProjectionMatrix();

    // this.cameraControls = new OrbitAndPanControls(this.camera, this.renderer.domElement);
    // this.camera.zoom = 1.6;
    this.camera.updateProjectionMatrix();

    this.clock = new THREE.Clock();

    this.init_lights();

    this.frame();
    window.addEventListener( 'resize', this.on_window_resize, false );
    this.on_window_resize();
  }
  on_window_resize(){
      this.camera.aspect = document.getElementsByClassName("piano_renderer")[0].clientWidth / document.getElementsByClassName("piano_renderer")[0].clientHeight;
      this.renderer.setSize( document.getElementsByClassName("piano_renderer")[0].clientWidth, document.getElementsByClassName("piano_renderer")[0].clientHeight );
      this.camera.updateProjectionMatrix();
  }
  // frame(){
  //     requestAnimationFrame(this.frame);
  //     var delta = this.clock.getDelta();
  //     this.update(delta);
  //     this.render(delta);
  // }

  update(delta){
      // this.cameraControls.update(delta);
      window.camera = this.camera;
      for(var i in this.keys_obj)
      {
          this.update_key(this.keys_obj[i], delta);
      }
  }
  smoothstep(a,b,x){
      if( x<a ) return 0.0;
      if( x>b ) return 1.0;
      var y = (x-a)/(b-a);
      return y*y*(3.0-2.0*y);
  }
  mix(a,b,x)
  {
      return a + (b - a)*Math.min(Math.max(x,0.0),1.0);
  }

  update_key( obj, delta ){
    if (obj.keyState == this.keyState.note_on)
    {

        obj.rotation.x = this.mix(-Math.PI/4.0, -this.state.key_max_rotation, this.smoothstep(0.0, 1.0, this.state.key_attack_time*obj.clock.getElapsedTime()));
        if (obj.rotation.x >= -this.state.key_max_rotation)
        {
            obj.keyState = this.keyState.pressed;
            obj.clock.elapsedTime = 0;
        }

        if(obj.children.length > 0){
            obj.children[0].material.color = this.noteOnColor;
        }
    }
    else if (obj.keyState == this.keyState.note_off)
    {
        obj.rotation.x = this.mix(-this.state.key_max_rotation, -Math.PI/4.0, this.smoothstep(0.0, 1.0, this.state.key_attack_time*obj.clock.getElapsedTime()));
        if (obj.rotation.x <= -Math.PI/4.0)
        {
            obj.keyState = this.keyState.unpressed;
            obj.clock.elapsedTime = 0;
        }

        if(obj.children.length > 0){
            obj.children[0].material.color = obj.children[0].material.note_off;
        }
    }

  }
  key_status (keyName, status){
    if(this.scene){
      var obj = this.scene.getObjectByName(keyName, true);
      if (obj != undefined)
      {
          obj.clock.start();
          obj.clock.elapsedTime = 0;
          obj.keyState = status;
      }
    }
  }


  initialize_keys(obj){
    this.keys_obj.push(obj);
    obj.castShadow = true;
    obj.receiveShadow = true;
    obj.rotation.x = -Math.PI/4.0;
    // obj.rotation.x = 0;
    obj.rotation.y = 0;
    obj.rotation.z = 0;
    obj.keyState = this.keyState.unpressed;
    obj.clock = new THREE.Clock(false);
    obj.castShadow = true;
    obj.receiveShadow = true;
    // only add meshes in the material redefinition (to make keys change their color when pressed)
    if (obj instanceof THREE.Mesh)
    {
        var old_material = obj.material;
        obj.material = new THREE.MeshPhongMaterial( { color:old_material.color} );
        obj.material.shininess = 100.0;
        obj.material.specular = new THREE.Color().setRGB(0.25, 0.25, 0.25);;

        obj.material.note_off = obj.material.color.clone();
    }

  }

  fix_zoom(){
    var boundingBox = getCompoundBoundingBox(this.collada_scene);
    this.camera.zoom = 10;
    this.camera.updateMatrix();
    for(var i=0; i<1000; i+=1){
      if(this.camera.zoom <= 0.5){
        break
      }
      this.camera.zoom -= 0.1;
      this.camera.updateProjectionMatrix();
      console.log("Zoom : ", this.camera.zoom);
      var frustum = new THREE.Frustum();
      frustum.setFromMatrix(new THREE.Matrix4().multiplyMatrices(this.camera.projectionMatrix, this.camera.matrixWorldInverse));

      var pos_min = new THREE.Vector3(boundingBox.min.x, boundingBox.min.y, boundingBox.min.z);
      var pos_max = new THREE.Vector3(boundingBox.min.x, boundingBox.min.y, boundingBox.min.z);

      if (frustum.containsPoint(pos_min) && frustum.containsPoint(pos_max)){
        break;
      }
    }
  }
  prepare_scene(collada){
    collada.scene.traverse(this.initialize_keys);
    this.collada_scene = collada.scene;
    this.scene.add(collada.scene);
    // this.fix_zoom();
  }
  init_lights(){
    //var spotlight = new THREE.SpotLight(0xffffff);
    var spotlight = new THREE.DirectionalLight(0xffffff);

    // spotlight.position.set(-10,10,-20);
    spotlight.position.set(-1, 1, -2);

    var targetObject = new THREE.Object3D();
    targetObject.position.x = 10;
    targetObject.position.y = 0;
    targetObject.position.z = 4;
    spotlight.target = targetObject;
    this.scene.add(targetObject);
    // window.keys_obj = this.keys_obj
    // spotlight.target.position.set(10, 10, -10);
    spotlight.shadowCameraVisible = true;
    spotlight.shadowDarkness = 0.75;
    spotlight.intensity = 1;
    spotlight.castShadow = true;
    spotlight.shadowMapWidth = 2048;
    spotlight.shadowMapHeight = 2048;

    // spotlight.shadowCameraNear = 5.0;
    // spotlight.shadowCameraFar = 20.0;
    spotlight.shadowBias = 0.0025;
    window.scene = this.scene;

    // spotlight.shadowCameraLeft = -8.85;
    // spotlight.shadowCameraRight = 5.5;
    // spotlight.shadowCameraTop = 4;
    // spotlight.shadowCameraBottom = 0;
    this.scene.add(spotlight);

    // var helper = new THREE.CameraHelper( spotlight.shadow.camera );
    // this.scene.add( helper );

    var light1 = new THREE.DirectionalLight( 0xddffff, 1 );
    light1.position.set( 1, 1, -1 ).normalize();
    this.scene.add( light1 );

    var light3 = new THREE.AmbientLight( 0xffffff, 0.1 );
    light3.position.set( 0, 0, 10 ).normalize();
    this.scene.add( light3 );

  }

  render() {

    var _temp = {}
    Object.keys(this.props.key_states).map(i => {
      if(i.startsWith("key_")){
        if(this.last_state){
          if(this.last_state[i] == 0 && this.props.key_states[i] == 1){
            this.key_status("_"+i.replace("key_", ""), this.keyState.note_on);
          }else if(this.last_state[i] == 1 && this.props.key_states[i] == 0){
            this.key_status("_"+i.replace("key_", ""), this.keyState.note_off);
          }
        }
        _temp[i] = this.props.key_states[i];
      }
    });
    this.last_state = _temp;
    return (
      <div className="piano_renderer">
        <canvas id={this.state.canvas_id} style={{width:"100%", height:"100%"}}/>
      </div>
    );
  }
}
PianoComponent.defaultProps = {
  key_states: {},
  key_attack_time: 9.0,
  key_max_rotation: 0.72,
  octave: 2,
  noFloor: false,
  backgroundColor: 0xffffff
}
export default PianoComponent;
