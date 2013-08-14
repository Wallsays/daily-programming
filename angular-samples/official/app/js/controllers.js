'use strict';

/* Controllers */
function PhoneListCtrl($scope, $http) {
  $http.get('phones/phones.json').success(function(data) {
    $scope.phones = data;
    // $scope.phones = data.splice(0, 5); 
  }); 
 
  $scope.orderProp = 'age';
}
 
// for minifications issues
PhoneListCtrl.$inject = ['$scope', '$http']; 
// or 
// var PhoneListCtrl = ['$scope', '$http', function($scope, $http) { /* constructor body */ }];

function PhoneDetailCtrl($scope, $routeParams) {
  $scope.phoneId = $routeParams.phoneId;
}