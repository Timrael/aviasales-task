(function() {
  $('.js-tabs').each(function() {
    var $tabsItem, $tabsSwitcher, $tabsWrap, activeClass, _this;
    _this = this;
    activeClass = 'is-active';
    $tabsSwitcher = $(this).find('.' + $(_this).data('tabs-switcher'));
    $tabsItem = $(this).find('.' + $(_this).data('tabs-item'));
    $tabsWrap = $(this).find('.' + $(_this).data('tabs-wrap'));
    $tabsSwitcher.find('a').on('click', function() {
      var $tabsSwitcherItem, tabOrder;
      $tabsSwitcherItem = $(this).parent();
      tabOrder = $tabsSwitcherItem.index();
      if ($tabsSwitcherItem.hasClass(activeClass)) {
        return false;
      }
      $tabsSwitcher.find('li').removeClass(activeClass);
      $tabsSwitcherItem.addClass(activeClass);
      $tabsItem.removeClass(activeClass);
      $tabsItem.eq(tabOrder).addClass(activeClass);
      $tabsWrap.data('jsp').scrollTo(0);
      $tabsWrap.data('jsp').reinitialise();
      return false;
    });
    $tabsWrap.jScrollPane();
  });

  $('.js-custom-select').each(function() {
    $(this).customSelect();
  });

}).call(this);
