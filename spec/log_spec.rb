require_relative 'spec_helper'

module TuneScript
  describe TuneScript do
    describe 'logger' do
      after do
        TuneScript.logger = nil
      end

      it 'logs to stdout' do
        out, err = capture_subprocess_io do
          TuneScript.logger.debug 'log message'
        end
        out.must_match(/log message$/)
        err.must_equal ''
      end

      it 'logs errors to stdout' do
        out, err = capture_subprocess_io do
          TuneScript.logger.error 'log error message'
        end
        out.must_match(/log error message$/)
        err.must_equal ''
      end

      it 'allows override of logger method' do
        log_file = StringIO.new
        TuneScript.logger = Logger.new log_file
        TuneScript.logger.debug 'a message'
        log_file.string.must_match(/DEBUG -- : a message\n$/)
      end

      it 'allows override of log level' do
        log_file = StringIO.new
        TuneScript.logger = Logger.new log_file
        TuneScript.logger.level = Logger::INFO
        TuneScript.logger.debug 'a debug message'
        TuneScript.logger.info 'an info message'
        log_file.string.must_match(/INFO -- : an info message\n$/)
      end
    end
  end
end
