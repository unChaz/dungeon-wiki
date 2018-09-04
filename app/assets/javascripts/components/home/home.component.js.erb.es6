(() => {
  'use strict';

  class HomeCtrl {
    constructor($window, CampaignApi) {
      this.$window = $window;
      this.CampaignApi = CampaignApi;
    }

    $onInit() {
      this.CampaignApi.index({}, (resp) => {
        console.log(resp);
      }, (err) => {
        console.log(err);
      });
    }
  }

  HomeCtrl.$inject = ['$window', 'CampaignApi'];

  angular
    .module('DungeonWiki')
    .component('home', {
      templateUrl: '<%= asset_path "components/home/home.html" %>',
      controller: HomeCtrl,
      bindings: {

      }
    });
})();
