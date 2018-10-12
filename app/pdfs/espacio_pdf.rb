class ExportPdf
  # "include" instead of subclassing Prawn::Document
  # as advised by the official manual
  include Prawn::View

  def initialize
    content
  end

  def content
    text "Hello World!"
  end
end