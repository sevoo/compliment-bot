class DummyClient
  def create_status(msg)
    puts(Time.now.ctime + " " + msg) 
  end
end
