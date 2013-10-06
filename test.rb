$:.push File.expand_path("../lib", __FILE__)
require 'steps'

confirm "This is not a vital question, right?"

step "Update Something" do
  sleep 1
end

confirm "Is this a vital question?", :vital => true

step "Do Something else" do
  confirm "Is this a vital question?", :vital => true
  sleep 1
  step "Nested Something" do
    sleep 1
    step "Double! Again", :debug => true do
      report "Something you probably want to know"
      raise "Problem"
      sleep 1
    end
    step "Double! Again", :debug => true do
      sleep 1
      raise "Problem"
      report "Something you probably want to know"
    end
    step "Double! Nested Something" do
      step "Triple (and vital)! Nested Something", :vital => true do
        answer = retrieve "What is your favorite color?"
        report "this is something important
Another Line
A third line"
        report "Something else important"
        step "Quad! Nested Something" do
          sleep 1
          if confirm "Is this a vital question?", :vital => true
            step "resolution" do
              sleep 1
            end
          end
        end
        sleep 1
        step "favorite color" do
          sleep 1
          answer
        end
      end
      step "Another Triple" do
        sleep 1
      end
      sleep 1
    end
    sleep 1
  end
  sleep 1
  raise
end
