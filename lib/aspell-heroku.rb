require "aspell-heroku/version"

module Aspell
  module Heroku

    ENV['PATH'] = File.expand_path('../aspell-heroku/binaries/bin', __FILE__) + ":#{ENV['PAATH']}"
    # This doesn't seem to let ffi/aspell know the correct path.  Maybe chaning the gem order would work
    ENV['LD_LIBRARY_PATH'] = File.expand_path('../aspell-heroku/binaries/lib', __FILE__) + ":#{ENV['LD_LIBRARY_PATH']}"

    def self.lib_path
      File.expand_path('../aspell-heroku/binaries/lib/aspell-0.60', __FILE__)
    end
  end

end
