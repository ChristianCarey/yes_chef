module ApplicationHelper
  def present(object, klass = nil)
    klass ||= "#{object.class}Presenter".constantize
    presenter = klass.new(object, self)
    yield presenter if block_given?
    presenter
  end

  def present_collection(collection, klass = nil)
    collection_name = collection.class.to_s.split('::')[0].pluralize
    klass ||= "#{collection_name}Presenter".constantize
    presenter = klass.new(collection, self)
    yield presenter if block_given?
    presenter
  end

  def format_currency(cents)
    number_to_currency(cents.to_f / 100)
  end
end
