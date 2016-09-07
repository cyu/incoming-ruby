require 'spec_helper'
require 'incoming/instruction_set_converter'

describe Incoming::InstructionSetConverter do

  subject { described_class }

  def ins_file(name)
    File.join(File.dirname(__FILE__), 'fixtures', 'files', 'instruction_set', "#{name}.ins")
  end

  def ins_to_arr(name)
    subject.to_arr(ins_file(name))
  end

  it "should convert a simple instruction" do
    ins = ins_to_arr :simple
    expect(ins.first[:name]).to eq :set

    options = ins.first[:options]
    expect(options).to_not be_nil
    expect(options[:key]).to eq "foo"
    expect(options[:value]).to eq "bar"
  end

  it "should convert to json" do
    json = subject.to_json(ins_file(:simple))
    expect(json).to eq <<JSON.chomp
[
  {
    "name": "set",
    "options": {
      "key": "foo",
      "value": "bar"
    }
  }
]
JSON
  end

end

