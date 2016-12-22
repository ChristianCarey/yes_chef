class BasePresenter
  def initialize(object, template)
    @object   = object
    @template = template
  end

  private
  
  def method_missing(*args, &block)
    @template.send(*args, &block)
  end
end