require File.expand_path('../spec_helper', File.dirname(__FILE__))
require 'wukong'

describe 'wukong', :helpers => true do

  # describe Wukong::Stringifier do
  #   it 'is not registered as anything' do
  #     Wukong.should_not be_streamer_exists( Wukong::Stringifier)
  #     Wukong.should_not be_formatter_exists(Wukong::Stringifier)
  #   end
  # end

  describe 'json' do
    let(:json_data  ){ {'abc' => 'def'} }
    let(:json_string){ '{"abc":"def"}'  }

    describe Wukong::Stringifier::FromJson do
      it 'encodes' do
        subject.should_receive(:emit).with(json_data)
        subject.call(json_string)
      end
    end

    describe Wukong::Stringifier::ToJson do
      it 'encodes' do
        subject.should_receive(:emit).with(json_string)
        subject.call(json_data)
      end
    end
  end

  describe 'tsv' do
    let(:tsv_data  ){ ['abc', 'def'] }
    let(:tsv_string){ "abc\tdef"     }

    describe Wukong::Stringifier::FromTsv do
      it 'encodes' do
        subject.should_receive(:emit).with(tsv_data)
        subject.call(tsv_string)
      end
    end

    describe Wukong::Stringifier::ToTsv do
      it 'encodes' do
        subject.should_receive(:emit).with(tsv_string)
        subject.call(tsv_data)
      end
    end
  end

end