function MainController($scope, photoSearchService) {

  'use strict';
  
  $scope.photos = [];

  $scope.thumbSize = 'small';
  
  $scope.setThumbSize = function(size) {
    $scope.thumbSize = size;
  };
  
  $scope.submitSearch = function() {

		$scope.photos = null;

		var keyword = $scope.searchKeyword;
		photoSearchService.findPhotos(keyword, function(photos) {
			$scope.photos = photos;
		});
	};
}