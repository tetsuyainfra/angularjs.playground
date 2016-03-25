
require('angular')
require('angular-material')
# style sheets
require('angular-material/angular-material.css')
require('./pc.scss')

#pcstyle = require('./pc.scss')
angular.module('myApp', ['ngMaterial'])

class MainCtrl
  constructor: (@$scope, @$timeout, @$interval) ->
    console.log 'MainCtrl', arguments
    @$scope.childs = []
    for count in [0..100]
      @$scope.childs.push {no: count}
    @count = count
    console.log @count
    # @$timeout(() =>
    #   @addChild()
    # , 5000)
    # @$interval(() =>
    #   @childs.push @count
    #   @count += 1
    # , 1000)

  cout: (_no) ->
    console.log _no

  addChild: (num) ->
    console.log 'addChild'
    for count in [@count..(@count+num)]
      @$scope.childs.push {no: count}
    @count = count

angular.module('myApp')
.controller('MainCtrl', ["$scope","$timeout","$interval", MainCtrl])











imgtest = () ->
  leaf = require('./partials/leaf.jade')
  console.log 'leaf', leaf

  content = document.getElementById("content")
  content.innerHTML = leaf
