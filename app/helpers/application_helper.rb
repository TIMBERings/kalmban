module ApplicationHelper


  def error_messages_for(object) 
    render(:partial => 'application/error_messages', :locals => {:object => object})
  end

  def friendly_date(date)
    date.strftime('%b %-d, %Y') if date
  end
  
end
