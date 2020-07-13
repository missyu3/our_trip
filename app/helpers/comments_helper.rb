module CommentsHelper
  def format_comment_time(comment_created_at)
    now = Time.zone.now 
    if now.to_date == comment_created_at.to_date
      I18n.l(comment_created_at.to_time, format: :time)
    else
      I18n.l(comment_created_at.to_time, format: :date)
    end
  end
end
