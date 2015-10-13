require_relative 'osascript'

module TuneScript
  def self.itunes_script(script)
    logger.debug('itunes_script') { script }
    osascript %(tell application "iTunes"\n#{script}\nend tell)
  end
end
