class MenusPresenter < CollectionPresenter

  def past_menus
    render menus.where('completion_date < ?', Date.today) 
  end

  def current_menus
    render menus.where('completion_date >= ?', Date.today).merge(menus.where("order_deadline <= ?", Date.today)) 
  end

  def future_menus
    render menus.where("order_deadline > ?", Date.today)
  end

  private

  def menus
    @object
  end
end