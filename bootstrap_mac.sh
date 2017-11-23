# https://gist.github.com/wmakley/8dfe436dfe345efae3ddf6756f9766b6
brew install gcc
brew install openssl libyaml libffi
brew install rbenv

rbenv install 2.0.0-p648

echo 'eval "$(rbenv init -)"' > ~/.bash_profile
. ~/.bash_profile

# speedup gem installation
echo 'gem: --no-rdoc --no-ri' > ~/.gemrc

gem install bundler

brew install https://raw.githubusercontent.com/Homebrew/homebrew-core/6f014f2b7f1f9e618fd5c0ae9c93befea671f8be/Formula/imagemagick.rb
brew install libmagic
brew install node
brew install mysql

bundle install
