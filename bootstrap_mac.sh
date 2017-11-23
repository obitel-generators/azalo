# https://gist.github.com/wmakley/8dfe436dfe345efae3ddf6756f9766b6
# Install Ruby 1.8.7
# brew install homebrew/dupes/apple-gcc42
# brew untap homebrew/dupes; brew install homebrew/dupes/apple-gcc42; brew search apple-gcc42
brew install apple-gcc42 openssl libyaml libffi
brew install rbenv

export CC=/usr/local/bin/gcc-4.2
export CFLAGS='-g -O2'
export RUBY_CONFIGURE_OPTS=--with-openssl-dir=`brew --prefix openssl`
export CONFIGURE_OPTS=--with-openssl-dir=`brew --prefix openssl`
rbenv install 1.8.7

# add to ~/.bash_profile
eval "$(rbenv init -)"

echo 'gem: --no-rdoc --no-ri' > ~/.gemrc

# Important gems:
# Rake is not installed by default, but you should start with a very old version before installing 10+:
gem install rake -v 0.7.3 # needed for very old Rails sites and some old gems to install
gem install slimgems # needed for Rails 1 + 2 to install
# if you want the latest rdoc for 1.8:
gem install rdoc -v 3.12.2
gem install rdoc-data -v 3.12
rdoc-data --install
# as of this writing, the latest version of bundler, 1.14.5, was still backwards compatible with Ruby 1.8
gem install bundler

# The following gem versions are known to be the last working 1.8 versions:
# gem 'rack', '~> 1.1.0'
# gem 'pg', '~> 0.17.1'
# gem 'i18n', '0.6.11'
# gem 'money', '4.0.2'
# gem 'nokogiri', '~> 1.5.10'
# gem 'activemerchant', '~> 1.43.2'
# gem 'httpclient', '~> 2.7.0'

brew install https://raw.githubusercontent.com/Homebrew/homebrew-core/6f014f2b7f1f9e618fd5c0ae9c93befea671f8be/Formula/imagemagick.rb
brew install libmagic
brew install node

gem install rails -v 2.3.11
bundle
