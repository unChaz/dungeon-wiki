(() => {
  'use strict';

  class WelcomeCtrl {
    constructor($window) {
      this.$window = $window;
    }

    $onInit() {

    }

    goToCampaigns() {
      this.$router.navigate(['campaigns']);
    }
  }

  WelcomeCtrl.$inject = ['$window'];

  angular
    .module('Dungie')
    .component('welcome', {
      templateUrl: '<%= asset_path "components/welcome/welcome.html" %>',
      controller: WelcomeCtrl,
      bindings: {
        $router: '<'
      }
    });
})();
