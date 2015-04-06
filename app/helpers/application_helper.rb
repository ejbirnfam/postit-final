module ApplicationHelper

  def fix_url(str)
    str.starts_with?('http://') ? str : "http://#{str}"
  end

  def display_datetime(dt)
    dt.strftime("%m/%d/%Y %l:%M%P %Z") # 03/13/2013 9:09 PM ET
  end

end
