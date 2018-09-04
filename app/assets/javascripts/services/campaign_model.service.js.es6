(() => {
  'use strict';

  class Campaign {
    constructor(
      campaign,
      CampaignApi,
      $q
    ) {
      this.API = CampaignApi;
      this.$q = $q;
      this.id = campaign.id;
      this.attributes = campaign.attributes || {};
      this.errors = [];
    }

    /**
    * Set a mutatable attribute.
    **/
    set(key, value) {
      this.attributes[key] = value;
    }

    /**
    * Get an attribute.
    **/
    get(key) {
      return this.attributes[key];
    }

    /**
    * Saves the Campaign via API.
    * @return {Promise}
    */
    save() {
      let self = this;
      let deferred = this.$q.defer();

      if (self.id) {
        self.API.update(
          self.id,
          { data: self.attributes },
          _success,
           _error
        );
      } else {
        self.API.create(
          { data: self.attributes },
          _success,
           _error
        );
      }

      function _success(resp) {
        if (resp) {
          self.id = resp['data'].id;
          self.attributes = resp['data'].attributes;
        }
        self.errors = [];
        deferred.resolve();
      }

      function _error(resp) {
        self.errors = resp['errors'];
        deferred.reject(resp['errors']);
      }

      return deferred.promise;
    }
  }

  angular
    .module('DungeonWiki')
    .service('CampaignModel',
    class CampaignModel {
      model() {
        return Campaign;
      }
    });
})();
