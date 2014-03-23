# encoding: utf-8
STDOUT.sync
require 'colored'
require 'highline'
require 'steps/spinner'

module Steps
  class Output

    @@singleton = nil
    def self.singleton
      @@singleton ||= Output.new
    end

    def initialize
      @spinner = Steps::Spinner.new
      @task_depth = 0
      @stacked_result = false
      @highline = HighLine.new
      @debug_depth = nil
    end

    def step(desc, options={}, &block)
      self.start_to desc

      # Set debug depth if specified
      if options[:debug] and @debug_depth.nil?
        @debug_depth = @task_depth
      end

      begin
        smessage = block.call()
        smessage = "✔" unless smessage.is_a? String
        self.success smessage
      rescue Exception => e
          message = e.message.empty? ? "X" : e.message

          unless e.is_a?(SystemExit) or @debug_depth.nil?
            if @task_depth >= @debug_depth
              self.report message, "red", false
              e.backtrace.each { |c| self.report("(debug) #{c}", "red") }
              message = "X"
            end
          end

          self.error(message)

          if options[:vital]
            if @task_depth > 1
              raise StandardError.new("X"), e
            else
              raise SystemExit.new, e
            end
          end
      end
    end

    def start_to message
      lead_str = ""
      if @spinner.running?
        @spinner.stop
        if @stacked_result
          lead_str = "\r#{`tput el`}"
        else
          lead_str = "\n"
        end
      end

      if @task_depth > 0
        message = lead_str + ("|   " * (@task_depth - 1)) + "├── " + message
      end

      print "#{message}".yellow + "   "
      @spinner.start
      @task_depth += 1
      @stacked_result = false
    end

    def result message
      @spinner.stop

      puts message

      if @task_depth > 0
        @task_depth -= 1
        @debug_depth = nil if @debug_depth and @debug_depth == @task_depth
        if @task_depth > 0
          print "|   ".yellow * (@task_depth - 1)
          @spinner.start
        end
      end
      @stacked_result = true
    end

    def error message
      if @spinner.running?
        @spinner.stop
      end
      self.result message.red
    end

    def error_and_exit message
      self.error message
      exit
    end

    def success message
      self.result message.green
    end

    def info message
      self.result message.blue
    end

    def report message, color, bold = true
      message = message.to_s # try and make sure we're dealing with a string
      message.each_line do |line|
        unless line.empty?
          line.strip!
          line = line.send("bold") if bold
          line = line.send(color) if ['red', 'blue', 'yellow', 'green'].include? color
          self.step line do " " end
        end
      end
    end

    def confirm(message, options={})
      message = message + " (y|n) > "
      message = (options[:vital] ? message.red : message.blue) + " "
      message = "├── ".yellow + message if @task_depth > 0
      @spinner.stop
      if @task_depth > 0 and not @stacked_result
        print "\n" + ("|   ".yellow * (@task_depth - 1))
      end
      result = @highline.agree(message)
      if @task_depth > 0
        print "|   ".yellow * (@task_depth - 1)
        @spinner.start
      end

      if options[:vital] and not result
        if @task_depth > 0
          raise "Aborting"
        else
          self.error_and_exit "Aborting"
        end
      end

      @stacked_result = true
      return result
    end

    def retrieve(message, answer_type, &block)
      message = message + " > "
      message = message.blue + " "
      message = "├── ".yellow + message if @task_depth > 0
      @spinner.stop
      if @task_depth > 0 and not @stacked_result
        print "\n" + ("|   ".yellow * (@task_depth - 1))
      end
      result = @highline.ask(message, answer_type, &block)
      if @task_depth > 0
        print "|   ".yellow * (@task_depth - 1)
        @spinner.start
      end

      @stacked_result = true
      return result
    end
  end
end
