module ApplicationHelper
  def compact_date date
    date&.to_formatted_s :default
  end

  def datetime_to_compact_date datetime
    datetime&.strftime '%m/%d/%Y'
  end

  def verbose_date date
    date&.to_formatted_s :verbose
  end

  def verbose_datetime datetime
    datetime&.strftime '%B %-d, %Y %-l:%M %p'
  end

  def datetime_to_verbose_date datetime
    datetime&.strftime '%B %-d, %Y'
  end
end
