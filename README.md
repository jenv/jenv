# Master your Java Environnement with jenv
Website : http://www.jenv.be

[![Flattr this git repo](http://api.flattr.com/button/flattr-badge-large.png)](https://flattr.com/submit/auto?user_id=gcuisinier&url=https://github.com/gcuisinier/jenv&title=jEnv&language=&tags=github&category=software)

jenv is for a equivalent of rbenv, but for Java environment.
It allow to easily switch between several JDKs installations (already presents), and configure which one to use per project.

jEnv may work on bash-ready OS.

Verified on :

* Mac OS X
* Debian

## Gettings started



1. Check out jenv into `~/.jenv`.

    ~~~ sh
    	$ git clone https://github.com/gcuisinier/jenv.git ~/.jenv
    ~~~

2. Add `~/.jenv/bin` to your `$PATH` for access to the `jenv` command-line utility.

	~~~ sh
		$ echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> ~/.bash_profile
	~~~

	**Ubuntu note**: Modify your `~/.profile` instead of `~/.bash_profile`.

	**Zsh note**: Modify your `~/.zshrc` file instead of `~/.bash_profile`.

    **Fish note**: Modify your `~/.conf/fish/config.sh' to append
    ~~~
        set PATH $HOME/.jenv/bin $PATH
    ~~~

3. Add `jenv init` to your shell to enable shims and autocompletion.

	~~~ sh
	    $ echo 'eval "$(jenv init -)"' >> ~/.bash_profile
	~~~

	_Same as in previous step, use `~/.profile` on Ubuntu, `~/.zshrc` for Zsh._

    **Fish note**: Instead, copy `~/.jenv/fish/jenv.fish` to `~/.conf/fish/function/jenv.fish`. If you don't have the `export` function, also copy `export.fish`
    ~~~ sh
        cp ~/.jenv/fish/jenv.fish ~/.conf/fish/function/jenv.fish
        cp ~/.jenv/fish/export.fish ~/.conf/fish/function/export.fish
    ~~~

4. Restart your shell as a login shell so the path changes take effect. You can now begin using jenv.

	~~~ sh
		$ exec $SHELL -l
	~~~

5. Configure JVM in jenv

	~~~  sh
	    $ jenv add /path/to/java/home
	~~~

6. Configure which JVM to use (globally, by directory or for the current shell instance)

	~~~  sh
	    $ jenv global oracle-1.7.0
	~~~

	or

	~~~ sh
		 $ jenv local oracle-1.7.0
	~~~

	or

	~~~ sh
		 $ jenv shell oracle-1.7.0
	~~~

7. Check that works

	~~~  sh
		 $ java -version
	~~~
8. Add JVM Options (globally, by directory or for the current shell instance)
	~~~  sh
	    $ jenv global-options "-Xmx512m"
	~~~

	or

	~~~ sh
		 $ jenv local-options "-Xmx512m"
	~~~
	or

	~~~ sh
		 $ jenv shell-options "-Xmx512m"
	~~~

9. Check that works

	~~~ sh
		 $ jenv info java
	~~~

10. jenv also provides wrappers for several build tools (Ant, Gradle, Maven, SBT) that will use
the configured JVM Options (globally, by directory or for the current shell instance), unless the
tool's environment variable is already set (e.g. `ANT_OPTS` for Ant).





## Command Reference

Like `git`, the `jenv` command delegates to subcommands based on its
first argument. The most common subcommands are:

### jenv local

Sets a local application-specific Java version by writing the version
name to a `.java-version` file in the current directory. This version
overrides the global version, and can be overridden itself by setting
the `JENV_VERSION` environment variable or with the `jenv shell`
command.

    $ jenv local oracle-1.7

When run without a version number, `jenv local` reports the currently
configured local version. You can also unset the local version:

    $ jenv local --unset

Previous versions of jenv stored local version specifications in a
file named `.jenv-version`. For backwards compatibility, jenv will
read a local version specified in an `.jenv-version` file, but a
`.java-version` file in the same directory will take precedence.

### jenv global

Sets the global version of Java to be used in all shells by writing
the version name to the `~/.jenv/version` file. This version can be
overridden by an application-specific `.java-version` file, or by
setting the `JENV_VERSION` environment variable.

    $ jenv global oracle-1.6

The special version name `system` tells jenv to use the system Java
(detected by searching your `$PATH`).

When run without a version number, `jenv global` reports the
currently configured global version.

### jenv shell

Sets a shell-specific Java version by setting the `JENV_VERSION`
environment variable in your shell. This version overrides
application-specific versions and the global version.

    $ jenv shell jJava-1.7.1

When run without a version number, `jenv shell` reports the current
value of `JENV_VERSION`. You can also unset the shell version:

    $ jenv shell --unset

Note that you'll need jenv's shell integration enabled (step 3 of
the installation instructions) in order to use this command. If you
prefer not to use shell integration, you may simply set the
`JENV_VERSION` variable yourself:

    $ export JENV_VERSION=oracle-1.6

### jenv versions

Lists all Java versions known to jenv, and shows an asterisk next to
the currently active version.

    $ jenv versions
      oracle-1.6
    *  oracle-1.7 (set by /Users/hikage/.jenv/version)

### jenv version

Displays the currently active Java version, along with information on
how it was set.

    $ jenv version
    oracle-1.6 (set by /tmp/test/.java-version)

### jenv rehash

Installs shims for all Java executables known to jenv (i.e.,
`~/.jenv/versions/*/bin/*`). Run this command after you install a new
version of Java.

    $ jenv rehash

### jenv which

Displays the full path to the executable that jenv will invoke when
you run the given command.

    $ jenv which java
    /Users/sam/.jenv/versions/oracle-1.6/bin/java

### jenv whence

Lists all Java versions with the given command installed.

    $ jenv whence java
    oracle-1.6
    oracle-1.7

## Plugins

Jenv provides plugins to make command-line tools aware of which JDK is activated.

    $ jenv plugins
    ant
    golo
    gradle
    grails
    groovy
    lein
    maven
    sbt
    scala
    vlt

Let's say you want Maven to use the JDK activated with Jenv, not the default `JAVA_HOME` configuration. You need to activate Jenv's maven plugin.

    $ jenv enable-plugin maven
    maven plugin activated

    $ jenv disable-plugin maven
    maven disabled

Note: The enable-plugin functionality is system wide not local to the shell, or temporary - you only need to do each one once.

### Export plugin
Another one usefull plugin is the "export", that expose JAVA_HOME automatically :

  $ jenv enable-plugin export
    You may restart your session to activate jenv export plugin echo export plugin activated



## Development

The jenv source code is [hosted on
GitHub](https://github.com/gcuisinier/jenv). It's clean, modular,
and easy to understand, even if you're not a shell hacker.

It is based on [rbenv](https://github.com/sstephenson/rbenv).

Please feel free to submit pull requests and file bugs on the [issue
tracker](https://github.com/gcuisinier/jenv/issues).

### Version History
