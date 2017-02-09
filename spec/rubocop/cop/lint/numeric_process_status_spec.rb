# frozen_string_literal: true

require 'spec_helper'

describe RuboCop::Cop::Lint::NumericProcessStatus,focus:true do
  let(:config) { RuboCop::Config.new }
  subject(:cop) { described_class.new(config) }

  it 'registers an offense for numeric comparisons' do
    inspect_source(cop, 'raise Failure unless $CHILD_STATUS == 0')
    expect(cop.offenses.size).to eq(1)
    expect(cop.messages)
      .to eq(['Message of NumericProcessStatus'])
  end

  it 'accepts' do
    inspect_source(cop, 'good_method')
    expect(cop.offenses).to be_empty
  end
end
