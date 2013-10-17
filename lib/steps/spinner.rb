module Steps

  # Simple shell spinner to provide user feedback
  #
  class Spinner

    def initialize
      @running = false
      @chars = ['|', '/', '-', '\\']
    end

    def running?
      @running
    end

    def start
      return if @running

      @running = true
      @spinner_thread = Thread.new do
        while @running do
          print @chars.push(@chars.shift).first
          sleep 0.1
          print "\b \b"
        end
      end
    end

    def stop
      return unless @running

      @running = false
      @spinner_thread.join
    end

  end
end
