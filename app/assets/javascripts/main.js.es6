(() => {
  'use strict';

  angular
    .module('DungeonWiki', [])
    .controller('ApplicationCtrl', ApplicationCtrl);

  ApplicationCtrl.$inject = ['$scope', '$rootScope', '$location'];
  function ApplicationCtrl($scope, $rootScope, $location) {
    $scope._ = _;
  }
})();
