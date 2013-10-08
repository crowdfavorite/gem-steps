require 'minitest/spec'
require 'minitest/autorun'
require 'steps/output'

describe Steps::Output do

  it "produces a valid singleton" do
    output = Steps::Output.singleton
    output.must_be_same_as Steps::Output.singleton
    output.wont_be_same_as Steps::Output.new
  end

  it "increases task_depth with every nested step" do
    output = Steps::Output.new
    output.step "Level 1" do
      output.instance_variable_get(:@task_depth).must_equal 1
      output.step "Level 2" do
        output.instance_variable_get(:@task_depth).must_equal 2
        output.step "Level 3" do
          output.instance_variable_get(:@task_depth).must_equal 3
        end
      end
    end
  end

end
