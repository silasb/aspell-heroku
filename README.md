# Aspell::Heroku

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'aspell-heroku'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install aspell-heroku

Setup the `LD_LIBRARY_PATH` as a `heroku` config

    $ heroku config:set LD_LIBRARY_PATH=/app/vendor/bundle/ruby/2.1.0/bundler/gems/aspell-heroku-d2454dbfcadb/lib/aspell-heroku/binaries/lib/

## Building aspell

I used docker to help me build this locally.

	curl -O ftp://ftp.gnu.org/gnu/aspell/aspell-0.60.6.1.tar.gz
	tar xvzf aspell-0.60.6.1.tar.gz
	cd aspell-0.60.6.1
	./configure --prefix=/app/lib/aspell && make install
	export PATH=$PATH:/app/lib/aspell/bin
	cd ../
	curl -O ftp://ftp.gnu.org/gnu/aspell/dict/en/aspell6-en-7.1-0.tar.bz2
	tar xjvf aspell6-en-7.1-0.tar.bz2
	cd aspell6-en-7.1-0
	./configure && make install
	cd /
	tar -czvf aspell-0.60.6.tgz /app/lib/aspell

## Usage

You'll probably want to use [ffi/aspell](https://github.com/YorickPeterse/ffi-aspell) to handle interacting with Aspell library.

	speller = FFI::Aspell::Speller.new('en_us', 'dict-dir' => Aspell::Heroku.lib_path)
	speller.correct?('monkey')
	=> true

## Contributing

1. Fork it ( http://github.com/<my-github-username>/aspell-heroku/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
