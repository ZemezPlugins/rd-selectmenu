###*
 * RDSelectMenu
 * @license MIT License
###
(($, document, window) ->
  ###*
   * Initial flags
   * @public
  ###
  isMobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)

  ###*
   * Creates a select.
   * @class RDSelectMenu.
   * @public
   * @param {HTMLElement} element - The element to create the select for.
   * @param {Object} [options] - The options
  ###
  class RDSelectMenu
    ###*
     * Default options for select.
     * @public
    ###
    Defaults:
      valueIconClass: 'rd-select-value-icon fa-angle-down'
      callbacks: null


    constructor: (element, options) ->
      @.options = $.extend(true, {}, @.Defaults, options)
      @.$element = $(element)
      @.$wrap = @.$element.wrap('<div class="rd-select"></div>').parent()
      @.$pseudoValue = null
      @.$pseudoOptions = null
      @.$win = $(window)
      @.$doc = $(document)
      @.initialize()

    ###*
     * Initializes the Parallax.
     * @protected
    ###
    initialize: () ->
      ctx = @;

      ctx.hideOriginalDOM()
      ctx.createPseudoDOM()
      ctx.applyHandlers()

      return ctx

    ###*
     * Appends select pseudo DOM
     * @protected
    ###
    createPseudoDOM: () ->
      ctx = @

      ctx.$pseudoValue = $('<div/>', {
        'class': 'rd-select-trigger ' + ctx.$element.get(0).className
      }).append('<span class="rd-select-value">' + ctx.$element.find('option:selected').text() + '</span>')
        .append('<span class="' + ctx.options.valueIconClass + '"></span>')

      ctx.$pseudoOptions = $('<ul/>', {
        'class': 'rd-select-menu'
      })

      ctx.$element.find('option').each(()->
        $option = $(this)
        ctx.$pseudoOptions.append($('<li/>', {
          'class': 'rd-select-option',
          'text': $option.text()
        }).addClass(if $option.is(':selected') then 'selected' else false))
      )

      ctx.$wrap.append(ctx.$pseudoValue).append(ctx.$pseudoOptions);

      return ctx

    ###*
     * Hides original select
     * @protected
    ###
    hideOriginalDOM: () ->
      ctx = @

      ctx.$element.css({
        position: 'absolute'
        margin: 0
        padding: 0
        top: 0
        left: 0
        width: if isMobile then '100%' else 0
        height: if isMobile then '100%' else 0
        border: 'none'
        overflow: 'hidden'
        opacity: 0
        'z-index': if isMobile then 9999999 else -9999999
      })

      return ctx

    ###*
     * Open select menu
     * @protected
    ###
    open: ()->
      ctx = @
      ctx.$wrap.addClass('rd-select-open')
      ctx.$element.focus() if not ctx.$element.is(':focus')
      return ctx

    ###*
     * Close select menu
     * @protected
    ###
    close: ()->
      ctx = @
      ctx.$wrap.removeClass('rd-select-open')
      return ctx

    change: (ctx, e)->
      $this = $(@)
      ctx.$element.val($this.text()).trigger('change').trigger('propertychange').focus()
      $.proxy(ctx.close, ctx)() if e.type is 'click'
      return @

    originalChange: ()->
      @.$pseudoValue.find('.rd-select-value').text(@.$element.val())
      @.$pseudoOptions.find('.rd-select-option')
        .eq(@.$element.find('option:selected').index())
        .addClass('selected').siblings().removeClass('selected')

      return @

    keyDown: (e)->
      switch e.keyCode
        when 32, 37, 39
          e.preventDefault()
        when 38
          e.preventDefault()
          prev = @.$pseudoOptions.find('.rd-select-option.selected').prev()
          $.proxy(@.change, prev[0], @)(e) if prev.length

        when 40
          e.preventDefault()
          next = @.$pseudoOptions.find('.rd-select-option.selected').next()
          $.proxy(@.change, next[0], @)(e) if next.length

        when 13
          e.preventDefault()
          if @.$wrap.hasClass('rd-select-open')
            $.proxy(@.close, @)()
          else
            $.proxy(@.open, @)()

      return

    ###*
     * Apply all select event handlers
     * @protected
    ###
    applyHandlers: ()->
      ctx = @

      if !isMobile
        ctx.$element.on('focus', $.proxy(ctx.open, ctx))
        ctx.$doc.find('*').on('focus', (e)->
          target = e.target
          if target isnt ctx.$element[0] and not $(target).parents('.rd-select-menu').length
            $.proxy(ctx.close, ctx)()
        )
        ctx.$element.on('keydown', $.proxy(ctx.keyDown, ctx))
        ctx.$pseudoValue.on('click', $.proxy(ctx.open, ctx))
        ctx.$pseudoOptions.find('li').each(()->
          $this = $(this);
          $this.on('click', $.proxy(ctx.change, this, ctx))
        )
        ctx.$doc.on('click', (e)->
          target = e.target
          if target isnt ctx.$wrap[0] and not $(target).parents('.rd-select').length
            $.proxy(ctx.close, ctx)()
        )

      ctx.$element.on('change propertychange', $.proxy(ctx.originalChange, ctx))


      return ctx

  ###*
   * The jQuery Plugin for the RD Parallax
   * @public
  ###
  $.fn.extend RDSelectMenu: (options) ->
    @each ->
      $this = $(this)
      if !$this.data('RDSelectMenu')
        $this.data 'RDSelectMenu', new RDSelectMenu(this, options)

  window.RDSelectMenu = RDSelectMenu
) window.jQuery, document, window


###*
 * The Plugin AMD export
 * @public
###
if module?
  module.exports = window.RDSelectMenu
else if typeof define is 'function' && define.amd
  define(["jquery"], () ->
    'use strict'
    return window.RDSelectMenu
  )