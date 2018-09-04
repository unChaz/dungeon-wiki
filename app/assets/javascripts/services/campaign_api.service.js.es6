(() => {
  'use strict';

  class CampaignApi {
    constructor($q, $http) {
      this.headers = {
        'Accept': 'application/json'
      };
      this.$q = $q;
      this.$http = $http;
    }

    index(params, successCallback, errorCallback) {
      const deferred = this.$q.defer();
      this.$http.get('/campaigns', { headers: this.headers, params })
                .success(_handleResponse)
                .error(_handleError);
      return deferred.promise;

      function _handleResponse(resp) {
        if (!!successCallback) {
          successCallback(resp);
        }
        deferred.resolve(resp);
      }

      function _handleError(resp) {
        if (!!errorCallback) {
          errorCallback(resp);
        }
        deferred.reject(resp);
      }
    }

    create(params, successCallback, errorCallback) {
      const deferred = this.$q.defer();
      this.$http.post('/campaigns', params, { headers: this.headers })
                .success(_handleResponse)
                .error(_handleError);
      return deferred.promise;

      function _handleResponse(resp) {
        if (!!successCallback) {
          successCallback(resp);
        }
        deferred.resolve(resp);
      }

      function _handleError(resp) {
        if (!!errorCallback) {
          errorCallback(resp);
        }
        deferred.reject(resp);
      }
    }

    show(id, successCallback, errorCallback) {
      const deferred = this.$q.defer();
      this.$http.get(`/campaigns/${id}`, { headers: this.headers })
                .success(_handleResponse)
                .error(_handleError);
      return deferred.promise;

      function _handleResponse(resp) {
        if (!!successCallback) {
          successCallback(resp);
        }
        deferred.resolve(resp);
      }

      function _handleError(resp) {
        if (!!errorCallback) {
          errorCallback(resp);
        }
        deferred.reject(resp);
      }
    }

    update(id, params, successCallback, errorCallback) {
      const deferred = this.$q.defer();
      this.$http.patch(`/campaigns/${id}`, params, { headers: this.headers })
                .success(_handleResponse)
                .error(_handleError);
      return deferred.promise;

      function _handleResponse(resp) {
        if (!!successCallback) {
          successCallback(resp);
        }
        deferred.resolve(resp);
      }

      function _handleError(resp) {
        if (!!errorCallback) {
          errorCallback(resp);
        }
        deferred.reject(resp);
      }
    }

    destroy(id, successCallback, errorCallback) {
      const deferred = this.$q.defer();
      this.$http.delete(`/campaigns/${id}`, { headers: this.headers })
                .success(_handleResponse)
                .error(_handleError);
      return deferred.promise;

      function _handleResponse(resp) {
        if (!!successCallback) {
          successCallback(resp);
        }
        deferred.resolve(resp);
      }

      function _handleError(resp) {
        if (!!errorCallback) {
          errorCallback(resp);
          deferred.reject(resp);
        }
      }
    }
  }
  CampaignApi.$inject = ['$q', '$http'];

  angular
    .module('DungeonWiki')
    .service('CampaignApi', CampaignApi);
})();
