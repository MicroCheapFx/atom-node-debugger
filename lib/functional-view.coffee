{View, $} = require 'atom'
LogView = require './log-view'

module.exports =
class FunctionalView extends View
  @content: ->
    @div class: "functional-view console", =>
      @div class: 'block', =>
        @div class: 'btn-group functional-controls', =>
          @button class: 'btn selected', 'data-functional': 'console', 'Console'
          @button class: 'btn', 'data-functional': 'debug','Debug'
          @button class: 'btn', 'data-functional': 'frames','Frame'

        @div class: 'btn-group pull-right', =>
          @button class: 'btn btn-error', 'x'

      @div class: 'functional console inset-panel', =>
        @subview 'logView', new LogView

  initialize: ->
    self = this
    @on 'click', '[data-functional]', (e) => @toggleFunctional(e)

  toggleFunctional: (e) ->
    $prevSelected = @find('.functional-controls .selected')
    @removeClass($prevSelected.data('functional'))
    $prevSelected.removeClass('selected')

    $selected = $(e.target)
    @addClass($selected.data('functional'))
    $selected.addClass('selected')
