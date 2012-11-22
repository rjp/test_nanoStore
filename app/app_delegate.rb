class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    puts "#{App.name} (#{App.documents_path})"

    NanoStore.shared_store = NanoStore.store(:file, App.documents_path + "/nano.db")

    y = Message.count
    puts "There are #{y} messages"

    # create random new messages every time we run
    r = 100 + rand(500).to_i
    puts Time.now.to_f
    puts "Creating #{r} messages: " + Time.now.to_f.to_s
    100.upto(r) do
        i = rand(65535).to_i
        u = (rand(50) > 25)
        m = Message.new(:id => i, :from => 'test', :to => 'test', :subject => "Test #{i}", :unread => u)
        m.save
    end

    puts "Counting messages 25 times: " + Time.now.to_f.to_s
    1.upto(25) do
        x = Message.find(:unread => 0).count
    end
    puts "Finished: " + Time.now.to_f.to_s
  end
end
