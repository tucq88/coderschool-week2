module ApplicationHelper

  def bootstrap_class_for flash_type
    { success: 'alert-success', error: 'alert-danger', notice: 'alert-warning'}[flash_type.to_sym]
  end

  def flash_messages(opts = {})
    flash.map do |msg_type, message|
      content_tag(:div, message, class: "alert alert-dismissible #{bootstrap_class_for(msg_type)} fade in") do
        content_tag(:button, 'x'.html_safe, class: 'close', data: {dismiss: 'alert'}) + message
      end
    end.join.html_safe
  end

  def current_user
    return @current_user if @current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

end
