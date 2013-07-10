$:.push File.expand_path("../lib", __FILE__)
require 'steps'

step "Update Something" do
  system "sleep 3"
end

step "Do Something else" do
  sleep 3
  step "Nested Something" do
    sleep 2
    step "Double! Again" do
      report "Something you probably want to know"
      sleep 1
    end
    step "Double! Again" do
      sleep 1
      report "Something you probably want to know"
    end
    step "Double! Nested Something" do
      step "Triple (and vital)! Nested Something", :vital => true do
        report "this is something important"
        report "Something else important"
        step "Quad! Nested Something" do
          sleep 1
        end
        sleep 1
        if confirm "Is this a vital question?", :vital => true
          step "resolution" do
            sleep 3
          end
        end
        answer = retrieve "What is your favorite color?"
        step "favorite color" do
          sleep 2
          answer
        end
      end
      step "Another Triple" do
        sleep 3
      end
      sleep 2
    end
    sleep 2
  end

  sleep 2
  raise
end
