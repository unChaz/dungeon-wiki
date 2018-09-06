(() => {
  'use strict';

  class CampaignSelectorCtrl {
    constructor(API, $timeout, $mdDialog, $mdToast) {
      this.API = API;
      this.$timeout = $timeout;
      this.$mdDialog = $mdDialog;
      this.$mdToast = $mdToast;
    }

    $onInit() {
      this.last = {
          bottom: false,
          top: true,
          left: false,
          right: true
      };
      this.toastPosition = angular.extend({}, this.last);
      this.getCampaigns();
    }

    openCampaign(campaign) {
      console.log(campaign);
    }

    getCampaigns() {
      this.API.index('campaigns', {}, (resp) => {
        this.campaigns = resp['data'];
      }, (err) => {
        this.campaigns = [];
        this.error = 'An unexpected error occured.';
        console.log(err);
        this.$timeout(() => {
          this.error = null;
        }, 5000);
      });
    }

    saveCampaign(campaign) {
      this.API.update('campaigns', campaign.id, campaign, (resp) => {
        campaign = resp['data'];
      }, (err) => {
        this.campaigns = [];
        this.error = 'An unexpected error occured.';
        console.log(err);
        this.getCampaigns();
        this.$timeout(() => {
          this.error = null;
        }, 5000);
      });
    }

    showEdit(ev, campaign) {
      // Appending dialog to document.body to cover sidenav in docs app
      let confirm = this.$mdDialog.prompt()
        .title('Edit Campaign')
        .placeholder('campaign name')
        .ariaLabel('Campaign name')
        .initialValue(campaign.name)
        .targetEvent(ev)
        .required(true)
        .ok('Save')
        .cancel('Cancel');

      this.$mdDialog.show(confirm).then((result) => {
        if (result.length > 0) {
          campaign.name = result;
          this.saveCampaign(campaign);
        } else {
          this.error = 'Name cannot be blank.';
          this.$timeout(() => {
            this.error = null;
          }, 5000);
        }
      }, () => {

      });
    }

    showCreateCampaign(ev) {
      // Appending dialog to document.body to cover sidenav in docs app
      let confirm = this.$mdDialog.prompt()
        .title('Create Campaign')
        .placeholder('campaign name')
        .ariaLabel('Campaign name')
        .initialValue('')
        .targetEvent(ev)
        .required(true)
        .ok('Save')
        .cancel('Cancel');

      this.$mdDialog.show(confirm).then((result) => {
        if (result.length > 0) {
          let campaign = { name: result };
          this.createCampaign(campaign);
        } else {
          this.error = 'Name cannot be blank.';
          this.$timeout(() => {
            this.error = null;
          }, 5000);
        }
      }, () => {

      });
    }

    createCampaign(campaign) {
      if (!campaign || !campaign.name) {
        return this.error = 'Name cannot be blank';
      }
      this.API.create('campaigns', campaign, () => {
        this.getCampaigns();
      }, (err) => {
        this.campaigns = [];
        this.error = 'An unexpected error occured.';
        console.log(err);
        this.getCampaigns();
        this.$timeout(() => {
          this.error = null;
        }, 5000);
      });
    }

    showDelete(ev, campaign) {
      // Appending dialog to document.body to cover sidenav in docs app
      let confirm = this.$mdDialog.confirm()
            .title('Delete Campaign')
            .textContent(`Are you sure you want to delete ${campaign.name || 'unnamed campaign'}`)
            .ariaLabel('Delete Campaign')
            .targetEvent(ev)
            .ok('Delete')
            .cancel('Cancel');

      this.$mdDialog.show(confirm).then(() => {
        this.deleteCampaign(campaign);
      }, () => {

      });
    }

    deleteCampaign(campaign) {
      this.API.destroy('campaigns', campaign.id, () => {
        this.toastMessage('Campaign Deleted');
        this.getCampaigns();
      }, (err) => {
        this.campaigns = [];
        this.error = 'An unexpected error occured.';
        console.log(err);
        this.getCampaigns();
        this.$timeout(() => {
          this.error = null;
        }, 5000);
      });
    }

    toastMessage(message) {
      let pinTo = this.getToastPosition();

      this.$mdToast.show(
        this.$mdToast.simple()
          .textContent(message)
          .position(pinTo)
          .hideDelay(3000)
      );
    }

    sanitizePosition() {
      var current = this.toastPosition;

      if (current.bottom && this.last.top) { current.top = false; }
      if (current.top && this.last.bottom) { current.bottom = false; }
      if (current.right && this.last.left) { current.left = false; }
      if (current.left && this.last.right) { current.right = false; }

      this.last = angular.extend({},current);
    }

    getToastPosition() {
      this.sanitizePosition();

      return Object.keys(this.toastPosition)
        .filter((pos) => { return this.toastPosition[pos]; })
        .join(' ');
    }
  }

  CampaignSelectorCtrl.$inject = ['API', '$timeout', '$mdDialog', '$mdToast'];

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
