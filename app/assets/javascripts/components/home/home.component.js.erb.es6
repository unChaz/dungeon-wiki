(() => {
  'use strict';

  class HomeCtrl {
    constructor($window, $timeout, $mdSidenav) {
      this.$window = $window;
      this.$timeout = $timeout;
      this.$mdSidenav = $mdSidenav;
    }

    $onInit() {
    }

    toggleMenu() {
      if (this.$mdSidenav('left').isOpen()) {
        this.$mdSidenav('left').close();
      } else {
        this.$mdSidenav('left').open();
      }
    }
  }

  HomeCtrl.$inject = ['$window', '$timeout', '$mdSidenav'];

  angular
    .module('Dungie')
    .component('home', {
      templateUrl: '<%= asset_path "components/home/home.html" %>',
      controller: HomeCtrl,
      bindings: {
        currentUser: '<'
      },
      $routeConfig: [
        { path: '/welcome', component: 'welcome' },
        { path: '/campaigns', component: 'campaignSelector' },
      ]
    });
})();
