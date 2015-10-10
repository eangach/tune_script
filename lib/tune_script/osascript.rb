require 'open3'

# Run an AppleScript with osascript
#
# @param script [String] the script to run
# @return [String] the output fom the script
def osascript(script)
  cmd = "osascript -e '#{script}'"

  o, e, s = Open3.capture3 cmd

  unless s.success?
    warn e
    fail 'ERROR: osascript return code ' + s.exitstatus.to_s
  end

  o.chomp
end
