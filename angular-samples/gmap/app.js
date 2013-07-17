"use strict";

var app = angular.module('app', []);

app.controller('Ctrl', function($scope) {

    $scope.maps = [
        { center: {lat: 43.6, lng: 4}, zoom: 10 },
        { center: {lat: 42, lng: 9}, zoom: 8 }
    ];

});

app.directive('gmaps', function factory($timeout) {
    return {
        restrict: 'EA',
        template: '<div class="gmaps"></div>',
        replace: true,
        scope: {
            center: '=center',
            zoom: '=zoom'
        },
        link: function postLink(scope, iElement, iAttrs) {

            var mapOptions = {
                zoom: scope.zoom,
                center: new google.maps.LatLng(scope.center.lat, scope.center.lng),
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var map = new google.maps.Map(iElement[0], mapOptions);

            scope.$watch('center', function () {
                map.setCenter(new google.maps.LatLng(scope.center.lat, scope.center.lng));
            }, true);

            google.maps.event.addListener(map, 'center_changed', function () {
                $timeout(function () {
                    var center = map.getCenter();
                    scope.center.lat = center.lat();
                    scope.center.lng = center.lng();
                });
            });

            scope.$watch('zoom', function () {
                map.setZoom(scope.zoom);
            });

            google.maps.event.addListener(map, 'zoom_changed', function () {
                $timeout(function () {
                    scope.zoom = map.getZoom();
                });
            });

        }
    };
});


