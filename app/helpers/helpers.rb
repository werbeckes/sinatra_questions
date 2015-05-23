helpers  do

  def current_user
    User.find_by_id(session[:user_id])
  end

  def format_day(date)
    date.strftime("%a %m/%d/%Y")
  end

  def format_time(date)
    date.strftime("%H:%M")
  end

end
