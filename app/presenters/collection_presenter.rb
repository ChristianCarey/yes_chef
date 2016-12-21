class CollectionPresenter < BasePresenter

  def in_rows_of(num_columns, options = {})
    # TODO handle incorrect input
    breakpoint  = options[:breakpoint] || "md"
    partial     = options[:partial]
    column_size = 12 / num_columns
    result = ""
    collection.each_slice(num_columns) do |slice|
      result += "<div class='row'>"
        slice.each do |element|
          result += "<div class='col-#{breakpoint}-#{column_size}'>"          
            result += render partial: partial || element
          result += "</div>"
        end
      result += "</div>"
    end
    result.html_safe
  end

  private

  def collection
    @object
  end
end