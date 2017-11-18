module ApplicationHelper
  def flash_class(level)
    case level.to_sym
    when :notice  then "green"
    when :alert   then "red"
    end
  end

  def get_status(bool)
    (bool) ? 'Active' : 'Disabled'
  end

  def get_role(int)
    case int
      when 0  then "Blocked"
      when 1  then "Administrator"
      when 2  then "Editor"
      when 3  then "User"
    end
  end

  def get_date(utc)
    unless utc.nil?
      utc.strftime("%m/%d/%Y")
    end
  end

  def get_datetime(utc)
    unless utc.nil?
      utc.strftime("%l:%M%P - %m/%d/%Y")
    end
  end
end
