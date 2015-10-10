require 'logger'

module TuneScript
  class << self
    # Allow logger to be overridden
    attr_writer :logger

    def logger
      @logger ||= Logger.new($stdout).tap do |log|
        log.progname = name
        log.level = Logger::DEBUG
        log.datetime_format = '%Y-%m-%d %H:%M:%S '
      end
    end
  end
end
