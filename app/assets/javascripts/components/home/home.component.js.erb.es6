(() => {
  'use strict';

  class HomeCtrl {
    constructor($window, $timeout, CampaignApi) {
      this.$window = $window;
      this.$timeout = $timeout;
      this.CampaignApi = CampaignApi;
    }

    $onInit() {
      this.CampaignApi.index({}, (resp) => {
        this.campaigns = resp;
        console.log(this.campaigns);
      }, (err) => {
        this.campaigns = [];
        this.error = err;
        console.log(err);
        this.$timeout(() => {
          this.error = null;
        }, 5000);
      });
    }

    selectCampaign(campaign) {
      console.log("campaign selected");
      this.selectedCampaign = campaign;
    }
  }

  HomeCtrl.$inject = ['$window', '$timeout', 'CampaignApi'];

  angular
    .module('DungeonWiki')
    .component('home', {
      templateUrl: '<%= asset_path "components/home/home.html" %>',
      controller: HomeCtrl,
      bindings: {

      }
    });
})();
