(() => {
  'use strict';

  class CampaignSelectorCtrl {
    constructor() {
    }

    $onInit() {
      console.log(this.campaigns);
    }

    clickCampaign(campaign) {
      this.selectCampaign({campaign: campaign });
    }
  }

  CampaignSelectorCtrl.$inject = [];

  angular
    .module('Dungie')
    .component('campaignSelector', {
      templateUrl: '<%= asset_path "components/campaign_selector/campaign_selector.html" %>',
      controller: CampaignSelectorCtrl,
      bindings: {
        campaigns: '<',
        selectCampaign: '&'
      }
    });
})();
