(() => {
  'use strict';

  class MapCtrl {
    constructor($window) {
      this.$window = $window;
    }

    $onInit() {
      this.L = L;
      this.initMap();
      this.addCoordinateListener();
      this.initMarkers();
      this.placeMarkers();
    }

    initMap() {
      this.map = this.L.map('faerunMap', {
          maxZoom: 24,
          minZoom: 1,
          crs: this.L.CRS.Simple
      }).setView([90, 120], 3);

      this.map.setMaxBounds(new this.L.LatLngBounds([0,250], [200,0]));

      var imageUrl = 'https://i.imgur.com/LzhfB3X.png';
      var imageBounds = [[200,0], [0,250]];

      this.L.imageOverlay(imageUrl, imageBounds).addTo(this.map);

    }

    addCoordinateListener() {
      this.map.addEventListener('mousemove', (ev) => {
         this.lat = ev.latlng.lat;
         this.lng = ev.latlng.lng;
      });
    }

    placeMarkers() {
      _.each(this.markers, (m) => {
        let marker = this.L.marker([m.x, m.y]).addTo(this.map);
        marker.bindTooltip(m.label);
      });
    }

    initMarkers() {
      this.markers = [
        // Y left to right
        // X bottom to top
        { label: `Arbington Atoll`, x: 83, y: 128 },
        { label: `Talking Island`, x: 85, y: 135 },
        { label: `Smuggler's Cove`, x: 90, y: 128 },
        { label: `The Grey Isle`, x: 95, y: 129 },
        { label: `New Phandalin`, x: 73, y: 123 },
      ];
    }

  }

  MapCtrl.$inject = ['$window'];

  angular
    .module('DungeonWiki')
    .component('map', {
      templateUrl: '<%= asset_path "components/map/map.html" %>',
      controller: MapCtrl,
      bindings: {

      }
    });
})();
