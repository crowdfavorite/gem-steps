$:.push File.expand_path("../lib", __FILE__)
require 'steps'

  step "Update Something" do
    system "sleep 3"
  end

  step "Do Something else" do
    system "sleep 3"
    step "Nested SOmething" do
      system "sleep 2"
      step "Double! Again" do
        sleep 1
      end
      step "Double! Again" do
        sleep 1
      end
      step "Double! Nested SOmething" do
        step "Triple! Nested SOmething" do
          step "Quad! Nested SOmething" do
            system "sleep 1"
          end
          system "sleep 1"
        end
        step "Another Triple" do
          sleep 3
        end
        system "sleep 1"
      end
      system "sleep 2"
    end

    system "sleep 2"
    raise
  end
