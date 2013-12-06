module ApplicationHelper
  def title(title)
    content_for(:title, title)
  end

  def description(description)
    content_for(:description, description)
  end

  def stylesheet(*args)
    content_for(:head) { stylesheet_link_tag(*args) }
  end

  def javascript(*args)
    content_for(:head) { javascript_include_tag(*args) }
  end

  def meta(options = {})
    content_for(:meta, tag(:meta, options))
  end

  # For generating time tags calculated using jquery.timeago
  def timeago(time, options = {})
    options[:class] ||= "timeago"
    content_tag(:abbr, time.to_s, options.merge(title: time.getutc.iso8601)) if time
  end

  # Check if object still exists in the database and display a link to it,
  # otherwise display a proper message about it.
  # This is used in activities that can refer to
  # objects which no longer exist, like removed posts.
  def link_to_trackable(object, object_type)
    if object
      link_to object_type.downcase, object
    else
      "#{object_type.downcase}"
    end
  end

  def bootstrap_flash_message
    flash_messages = []
    flash.each do |type, message|
     next unless [:notice, :alert].include?(type)
     type = :success if type == :notice
     type = :error   if type == :alert
     text = content_tag(:div, link_to("&times;".html_safe, "#", class: "close", "data-dismiss" => "alert") + message, class: "alert fade in alert-#{type}")
     flash_messages << text if message
    end

    unless flash_messages.empty?
      content_tag(:div, flash_messages.join("\n").html_safe, class: 'flash_message')
    end
  end

  def mobile?
    @browser_type == 'mobile'
  end
end
