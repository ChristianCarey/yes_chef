class MenusPresenter < CollectionPresenter

  def past_menus
    render menus.where('end_date < ?', Date.today) 
  end

  def current_menus
    render menus.where('end_date >= ?', Date.today).merge(menus.where("start_date <= ?", Date.today)) 
  end

  def future_menus
    render menus.where("start_date > ?", Date.today)
  end

  private

  def menus
    @object
  end
end