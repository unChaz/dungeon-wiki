(() => {
  'use strict';

  class Api {
    constructor($q, $http) {
      this.headers = {
        'Accept': 'application/json'
      };
      this.$q = $q;
      this.$http = $http;
    }

    index(resource, params, successCallback, errorCallback) {
      const deferred = this.$q.defer();
      this.$http.get(`/api/${resource}`, { headers: this.headers, params })
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

    create(resource, params, successCallback, errorCallback) {
      const deferred = this.$q.defer();
      this.$http.post(`/api/${resource}`, params, { headers: this.headers })
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

    show(resource, id, successCallback, errorCallback) {
      const deferred = this.$q.defer();
      this.$http.get(`/api/${resource}/${id}`, { headers: this.headers })
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

    update(resource, id, params, successCallback, errorCallback) {
      const deferred = this.$q.defer();
      this.$http.patch(`/api/${resource}/${id}`, params, { headers: this.headers })
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

    destroy(resource, id, successCallback, errorCallback) {
      const deferred = this.$q.defer();
      this.$http.delete(`/api/${resource}/${id}`, { headers: this.headers })
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
  Api.$inject = ['$q', '$http'];

  angular
    .module('Dungie')
    .service('API', Api);
})();
