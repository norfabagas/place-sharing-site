import Map from 'ol/Map.js';
import View from 'ol/View.js';
import TileLayer from 'ol/layer/Tile.js';
import VectorLayer from 'ol/layer/Vector.js';
import OSMSource from 'ol/source/OSM.js';
import VectorSource from 'ol/source/Vector.js';
import Feature from 'ol/Feature.js';
import Point from 'ol/geom/Point.js';
import Style from 'ol/style/Style.js';
import Icon from 'ol/style/Icon.js';
import OLGoogleMaps from 'olgm/OLGoogleMaps.js';
import GoogleLayer from 'olgm/layer/Google.js';
import { defaults as defaultInteractions } from 'olgm/interaction.js';
import { transform } from 'ol/proj.js';

if ($('#map').length > 0) {

  var lat = parseFloat($('#lat').text())
  var long = parseFloat($('#long').text())
  
  const center = transform([long, lat], 'EPSG:4326', 'EPSG:3857')
  
  const googleLayer = new GoogleLayer();
  
  const osmLayer = new TileLayer({
    source: new OSMSource(),
    visible: false
  });
  
  const source = new VectorSource();
  const feature = new Feature(new Point(center));
  feature.setStyle(new Style({
    image: new Icon(({
      anchor: [0.5, 46],
      anchorXUnits: 'fraction',
      anchorYUnits: 'pixels',
      size: [32, 48],
      scale: 0.75,
      src: 'https://openlayers.org/en/latest/examples/data/icon.png',
      rotation: 0.25 * Math.PI,
      opacity: 0.9
    }))
  }));
  source.addFeature(feature);
  
  const vector = new VectorLayer({
    source: source
  });
  
  const map = new Map({
    // use OL3-Google-Maps recommended default interactions
    interactions: defaultInteractions(),
    layers: [
      googleLayer,
      osmLayer,
      vector
    ],
    target: 'map',
    view: new View({
      center: center,
      zoom: 4
    })
  });
  
  const olGM = new OLGoogleMaps({
    map: map,
    mapIconOptions: {
      useCanvas: true
    }
  }); // map is the ol.Map instance
  olGM.activate();
}