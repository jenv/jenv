# Master your Java Environnement with jenv

jenv is for Java, 

## How It Works


## Command Reference

Like `git`, the `jenv` command delegates to subcommands based on its
first argument. The most common subcommands are:

### jenv local

Sets a local application-specific Java version by writing the version
name to a `.java-version` file in the current directory. This version
overrides the global version, and can be overridden itself by setting
the `JENV_VERSION` environment variable or with the `jenv shell`
command.

    $ jenv local 1.9.3-p327

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

## Development

The jenv source code is [hosted on
GitHub](https://github.com/hikage/jenv). It's clean, modular,
and easy to understand, even if you're not a shell hacker. 

It is based on [rbenv](https://github.com/hikage/jenv).

Please feel free to submit pull requests and file bugs on the [issue
tracker](https://github.com/hikage/jenv/issues).

### Version History

