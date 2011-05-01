require 'spec_helper'

describe Putf::CLI do
  it "should print help by default" do
    $stdout.should_receive(:puts).with(/Print this help message/)
    Putf::CLI.new([])
  end

  pending "should print file name when passed a file name" do
    file = "foo.bar"
    $stdout.should_receive(:puts).with(/foo\.bar/)
    Putf::CLI.new([file])
  end
end
