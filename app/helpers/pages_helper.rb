module PagesHelper
  def get_informative_time(datetime)
    if datetime >= Time.current - 2.day
      "#{time_ago_in_words(datetime)} ago"
    else
      "at #{datetime.strftime("%Y/%m/%d")}"
    end
  end
end
