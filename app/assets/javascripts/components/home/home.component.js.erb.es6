(() => {
  'use strict';

  class HomeCtrl {
    constructor($window) {
      this.$window = $window;
    }

    $onInit() {

    }
  }

  HomeCtrl.$inject = ['$window'];

  angular
    .module('DungeonWiki')
    .component('home', {
      templateUrl: '<%= asset_path "components/home/home.html" %>',
      controller: HomeCtrl,
      bindings: {

      }
    });
})();
