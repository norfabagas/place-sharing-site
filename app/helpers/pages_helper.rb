module PagesHelper
  def get_informative_time(datetime)
    if datetime >= Time.current - 2.day
      "#{time_ago_in_words(datetime)} ago"
    else
      "at #{datetime.strftime("%Y/%m/%d")}"
    end
  end

  def get_profile(username)
    if username == current_user.username
      "you"
    else
      link_to "#{username}", profile_page_path(username: username)
    end
  end
end
