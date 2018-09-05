(() => {
  'use strict';

  class CampaignManagerCtrl {
    constructor(CampaignApi) {
      this.CampaignApi = CampaignApi;
    }

    $onInit() {
      console.log(this.campaign);
    }

    exit() {
      this.chooseCampaign();
    }
  }

  CampaignManagerCtrl.$inject = ['CampaignApi'];

  angular
    .module('DungeonWiki')
    .component('campaignManager', {
      templateUrl: '<%= asset_path "components/campaign_manager/campaign_manager.html" %>',
      controller: CampaignManagerCtrl,
      bindings: {
        campaign: '<',
        chooseCampaign: '&'
      }
    });
})();
