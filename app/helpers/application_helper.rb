module ApplicationHelper
  def format_datetime(date)
    date.strftime("%Y年%m月%d日")
  end
end