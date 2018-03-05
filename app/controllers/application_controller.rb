
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :check_time

  def check_time(day, time, event)
    # If the date is not in the range return false
    if event.start_time.strftime("%Y-%m-%d") > day.to_s or event.end_time.strftime("%Y-%m-%d") < day.to_s
      return false
    end

    start_time = event.start_time.hour
    end_time = event.end_time.hour

    # Following if statements are to change time value for AM and PM
    if event.start_meridian == "PM" and event.start_time != 12
      start_time = event.start_time.hour + 12
    end
    if event.end_meridian == "PM" and event.end_time != 12
      end_time = event.end_time.hour + 12
    end
    if event.start_meridian == "AM" and event.start_time == 12
      start_time = event.start_time.hour - 12
    end
    if event.end_meridian == "AM" and event.end_time == 12
      end_time = event.end_time.hour - 12
    end

    # if one-day event
    if event.start_time.strftime("%Y-%m-%d") == event.end_time.strftime("%Y-%m-%d")
      # Check if time is in the range
      if start_time <= time and time < end_time
        return true
      else
        return false
      end
    # if multi-day event
    else
      if start_time > time and event.start_time.strftime("%Y-%m-%d") == day.to_s
        return false
      end
      if end_time <= time and event.end_time.strftime("%Y-%m-%d") == day.to_s
        return false
      end
      return true
    end

  end
end