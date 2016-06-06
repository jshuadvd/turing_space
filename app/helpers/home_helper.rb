module HomeHelper
  def date_format(date)
    DateTime.parse(date).strftime("%B %d, %Y")
  end
end
