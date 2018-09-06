(() => {
  'use strict';

  angular
    .module('Dungie', ['ngMaterial', 'ngMessages', 'ngComponentRouter'])
    .config([
      '$httpProvider', ($httpProvider) => {
        $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
      }
    ])
    .controller('ApplicationCtrl', ApplicationCtrl)
    .config(($mdThemingProvider) => {
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
