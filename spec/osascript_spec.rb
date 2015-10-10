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

      it 'logs stdout to stdout' do
        out, err = capture_subprocess_io do
          script = %(set x to "some data"\nget x)
          TuneScript.osascript script
        end
        out.must_match(/DEBUG -- osascript: some data\n$/)
        err.must_equal ''
      end

      it 'logs stderr to stdout' do
        out, err = capture_subprocess_io do
          -> { TuneScript.osascript '.' }.must_raise RuntimeError
        end
        out.must_match(/ERROR -- osascript: 0:1: syntax error: A unknown token can’t go here\. \(-2740\)\n$/)
        err.must_equal ''
      end
    end
  end
end
