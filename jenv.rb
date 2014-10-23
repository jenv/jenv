require 'formula'

class Jenv < Formula
  homepage 'http://www.jenv.be'
  url 'https://github.com/gcuisinier/jenv/archive/0.4.1.tar.gz'
  sha256 '8560e0176b0561705e0310a40eadb018f01b5fe6eb93c3b63d9137cdffaabc0e'
  head 'https://github.com/gcuisinier/jenv.git', :branch => 'master'

  def install
     libexec.install Dir['*']
     bin.write_exec_script libexec/'bin/jenv'
   end

   def caveats; <<-EOS.undent
     To enable shims and autocompletion add to your profile:
       if which jenv > /dev/null; then eval "$(jenv init -)"; fi

     To use Homebrew's directories rather than ~/.jenv add to your profile:
       export JENV_ROOT=#{opt_prefix}
     EOS
   end
end
