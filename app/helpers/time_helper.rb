module TimeHelper
  def format(time)
    time.strftime("%A, %d %b %Y %l:%M %p")
  end
end