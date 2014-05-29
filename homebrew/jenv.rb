require 'formula'

class Jenv < Formula
  homepage 'https://github.com/gcuisinier/jenv.git'
  url 'https://github.com/gcuisinier/jenv.git', :tag => '0.2.0-201404260'
  version '0.2.0-201404260'

  def install
    libexec.install Dir["libexec/*"]
    bin.install_symlink libexec/"jenv"
    prefix.install Dir['fish']
    prefix.install Dir['available-plugins']
    prefix.install Dir['LICENSE']
    prefix.install Dir['README.md']
    bash_completion.install "completions/jenv.bash" => 'jenv-completion.bash'
    zsh_completion.install "completions/jenv.zsh" => 'jenv-completion.bash'
  end

  def caveats; <<-EOS.undent
    Add 'jenv init' to your shell to enable shims and autocompletion.

    $ echo 'eval "$(jenv init -)"' >> ~/.bash_profile

    Fish shell export functions are available at #{prefix}/fish
    EOS
  end
end
