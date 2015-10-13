require_relative 'spec_helper'

module TuneScript
  describe TuneScript do
    describe 'itunes_script' do
      it 'runs a script with application "iTunes"' do
        script = 'get player state'
        output = TuneScript.itunes_script script

        %w{playing paused stopped}.must_include output
      end
    end
  end
end
