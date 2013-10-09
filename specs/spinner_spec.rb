require 'minitest/spec'
require 'minitest/autorun'
require 'steps/spinner'

describe Steps::Spinner do

  before do
    @spinner = Steps::Spinner.new
  end

  after do
    @spinner = nil
  end

  it "reports running? status correctly" do
    @spinner.start
    @spinner.running?.must_equal true
    @spinner.stop
    @spinner.running?.must_equal false
  end

end
