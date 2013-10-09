require 'minitest/spec'
require 'minitest/autorun'
require 'steps/output'

describe Steps::Output do

  after do
    $stdin = STDIN
  end

  it "produces a valid singleton" do
    output = Steps::Output.singleton
    output.must_be_same_as Steps::Output.singleton
    output.wont_be_same_as Steps::Output.new
  end

  it "should stop execution of step if negative response to vital confirm" do
    $stdin = StringIO.new("n\n")
    value = false
    output = Steps::Output.new
    output.step "Non-vital Confirm" do
      output.confirm "This is a regular confirm?"
      value = true
    end
    value.must_equal true
  end

  it "should stop execution of step if negative response to vital confirm" do
    $stdin = StringIO.new("n\n")
    value = false
    output = Steps::Output.new
    output.step "Vital Confirm" do
      output.confirm "This is a vital question?", :vital => true
      value = true
    end
    value.must_equal false
  end

  it "should increase task_depth with every nested step" do
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

  it "should decrease task_depth with every step completion" do
    output = Steps::Output.new
    output.step "Level 1" do
      output.step "Level 2" do
        output.step "Level 3" do
          output.instance_variable_get(:@task_depth).must_equal 3
        end
        output.instance_variable_get(:@task_depth).must_equal 2
      end
      output.instance_variable_get(:@task_depth).must_equal 1
    end
  end
end
