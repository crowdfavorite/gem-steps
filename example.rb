$:.push File.expand_path("../lib", __FILE__)
require 'steps'

report "This is an example of 'steps' output"

step "Single Level Task" do
  sleep 1
end

step "Custom Success Message" do
  sleep 1
  "Yay!"
end

step "Task with an error" do
  sleep 1
  raise
end

step "Custom Error Message" do
  sleep 1
  raise "There was a problem"
end

step "Debug Mode", :debug => true do
  sleep 1
  raise "There was a problem"
end

step "Progress Messages" do
  sleep 0.5
  report "Progress 1"
  sleep 0.5
  report "Progress 2"
  true
end

step "User Input" do
  sleep 0.5
  color = retrieve "What is your favorite color?"
  sleep 0.5
  if confirm "Are you sure?"
    report "Favorite color is #{color}"
  else
    report "Favorite color is not #{color}"
  end
  sleep 0.5
end

step "Vital Questions" do
  sleep 0.5
  confirm "This question is vital?", :vital => true
  report "You answered yes."
  sleep 0.5
end

step "Nested Steps" do
  sleep 0.5
  step "Nested Step Level 1" do
    sleep 0.5
    step "Nested Step Level 2" do
      sleep 0.5
    end
  end
end
