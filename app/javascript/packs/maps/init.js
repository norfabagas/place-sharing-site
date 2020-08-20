import Map from 'ol/Map.js';
import GoogleLayer from 'olgm/layer/Google.js';
import { defaults } from 'olgm/interaction.js';
import OLGoogleMaps from 'olgm/OLGoogleMaps.js';
import View from 'ol/View';
import { transform } from 'ol/proj.js';

if ($('#map').length > 0) {
  // var lat = Math.floor(parseFloat($('#lat').text()) * 100000)
  // var long = Math.floor(parseFloat($('#long').text()) * 100000)
  var lat = $('#lat').text()
  var long = $('#long').text()

  console.log(lat, long)
  var center = [long, lat];

  const googleLayer = new GoogleLayer();

  var map = new Map({
    // use OL3-Google-Maps recommended default interactions
    interactions: defaults(),
    layers: [
      googleLayer
    ],
    target: 'map',
    view: new View({
      center: transform([long, lat], 'EPSG:4326', 'EPSG:3857'),
      zoom: 4
    })
  });

  var olGM = new OLGoogleMaps({ map: map }); // map is the ol.Map instance
  olGM.activate();
}
