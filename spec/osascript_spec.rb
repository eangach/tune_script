require_relative 'spec_helper'

module TuneScript
  describe TuneScript do
    describe 'osascript' do
      it 'raises an error for bad scripts' do
        exception = -> { TuneScript.osascript '.' }.must_raise RuntimeError
        exception.message.must_equal 'ERROR: osascript return code 1'
      end

      it 'returns the script result' do
        script = %(set x to "some data"\nget x)
        output = TuneScript.osascript script

        output.must_equal 'some data'
      end
    end
  end
end
