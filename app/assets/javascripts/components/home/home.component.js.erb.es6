(() => {
  'use strict';

  class HomeCtrl {
    constructor($window, $timeout, CampaignApi, $mdSidenav) {
      this.$window = $window;
      this.$timeout = $timeout;
      this.CampaignApi = CampaignApi;
      this.$mdSidenav = $mdSidenav;
    }

    $onInit() {
      this.getCampaigns();
    }

    getCampaigns() {
      this.CampaignApi.index({}, (resp) => {
        this.campaigns = resp;
      }, (err) => {
        this.campaigns = [];
        this.error = err;
        this.$timeout(() => {
          this.error = null;
        }, 5000);
      });
    }

    selectCampaign(campaign) {
      this.selectedCampaign = campaign;
    }

    toggleMenu() {
      if (this.$mdSidenav('left').isOpen()) {
        this.$mdSidenav('left').close();
      } else {
        this.$mdSidenav('left').open();
      }
    }
  }

  HomeCtrl.$inject = ['$window', '$timeout', 'CampaignApi', '$mdSidenav'];

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
