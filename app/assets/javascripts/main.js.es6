(() => {
  'use strict';

  angular
    .module('Dungie', ['ngMaterial', 'ngMessages', 'ngComponentRouter'])
    .controller('ApplicationCtrl', ApplicationCtrl)
    .config(function($mdThemingProvider) {
      $mdThemingProvider.theme('default')
        .primaryPalette('teal')
        .accentPalette('indigo');
      })
    .value('$routerRootComponent', 'home')
    .config(($locationProvider) => {
      $locationProvider.html5Mode({
        enabled: true,
        requireBase: false
      });
    });

  ApplicationCtrl.$inject = ['$scope'];
  function ApplicationCtrl() {

  }
})();
