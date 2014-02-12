# Tabs looks like a folder
$('.js-tabs').each ->
	_this         = @
	activeClass   = 'is-active'
	$tabsSwitcher = $(@).find('.' + $(_this).data('tabs-switcher'))
	$tabsItem     = $(@).find('.' + $(_this).data('tabs-item'))
	$tabsWrap     = $(@).find('.' + $(_this).data('tabs-wrap'))

#	Tab switching
	$tabsSwitcher.find('a').on 'click', ->
		$tabsSwitcherItem = $(@).parent()
		tabOrder          = $tabsSwitcherItem.index()

		if $tabsSwitcherItem.hasClass(activeClass) then return false
		$tabsSwitcher.find('li').removeClass(activeClass)
		$tabsSwitcherItem.addClass(activeClass)

		$tabsItem.removeClass(activeClass)
		$tabsItem.eq(tabOrder).addClass(activeClass)
		$tabsWrap.data('jsp').scrollTo(0)
		$tabsWrap.data('jsp').reinitialise()
		false

#	Custom scroll init
	$tabsWrap.jScrollPane()
	return

#	Custom select
$('.js-custom-select').each ->
	$(@).customSelect()
	return
