require "aspell-heroku/version"

module Aspell
  module Heroku
    # Your code goes here...
    #

    ENV['PATH'] = File.expand_path('../aspell-heroku/binaries/bin', __FILE__) + ":#{ENV['PAATH']}"
    ENV['LD_LIBRARY_PATH'] = File.expand_path('../aspell-heroku/binaries/lib', __FILE__) + ":#{ENV['LD_LIBRARY_PATH']}"

    def self.lib_path
      File.expand_path('../aspell-heroku/binaries/lib/aspell-0.60', __FILE__)
    end
  end

end

module FFI
  module Aspell
    ffi_lib ['aspell', File.expand_path('../aspell-heroku/binaries/lib', __FILE__) + '/libaspell.so']
  end
end

