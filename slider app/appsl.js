/*! angularjs-slider - v0.1.2 - (c) Rafal Zajac <rzajac@gmail.com>, https://github.com/rzajac/angularjs-slider.git - 2013-12-16 */

var app = angular.module('plunker', ['rzModule']);

app.controller('MainCtrl', function($scope) {
  $scope.priceSlider2 = 5;

  $scope.slider = {
    minValue: 10,
    maxValue: 90,
    options: {
        floor: 0,
        ceil: 100,
        step: 1
    }
};


});
