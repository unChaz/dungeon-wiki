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
      this.$http.get('/api/campaigns', { headers: this.headers, params })
          .then(_handleResponse, _handleError);
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
      this.$http.post('/api/campaigns', params, { headers: this.headers })
          .then(_handleResponse, _handleError);
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
      this.$http.get(`/api/campaigns/${id}`, { headers: this.headers })
          .then(_handleResponse, _handleError);
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
      this.$http.patch(`/api/campaigns/${id}`, params, { headers: this.headers })
          .then(_handleResponse, _handleError);
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
      this.$http.delete(`/api/campaigns/${id}`, { headers: this.headers })
          .then(_handleResponse, _handleError);
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
    .module('Dungie')
    .service('CampaignApi', CampaignApi);
})();
