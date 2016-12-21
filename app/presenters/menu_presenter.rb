class MenuPresenter < BasePresenter

  def start_date
    menu.start_date.strftime("%A, %b %e")
  end

  def end_date
    menu.end_date.strftime("%A, %b %e")
  end

  def date_range
    "#{start_date} to #{end_date}"
  end

  private 

  def menu
    @object
  end
end