# Master your Java Environment with jenv

Website : http://www.jenv.be

Maintainers : 
- [Gildas Cuisinier](https://github.com/gcuisinier/)

Future maintainer in discussion:
- [Benjamin Berman](https://github.com/doctorpangloss) 

As he makes an incredible work by taking time to merge the Pull Request on his fork, I (@gcuisinier) am in discussion with him to take part of jEnv directly if he wants.
Whatever his decision, I thank him for his work, and to have convincing me to think about the future of jEnv and accepting a new maintainer for the good of the project.

## What's jEnv ?

This is an updated fork of `jenv`, a beloved Java environment manager adapted from `rbenv`.

`jenv` gives you a few critical affordances for using `java` on development machines:

 - It lets you switch between `java` versions. This is useful when developing Android applications, which generally require Java 8 for its tools, versus server applications, which use later versions like Java 11.
 - It sets `JAVA_HOME` inside your shell, in a way that can be set globally, local to the current working directory or per shell.

However, this project does **not**:

 - Install `java` for you. Use your platform appropriate package manager to install `java`. On macOS, `brew` is recommended.

This document will show you how to install `jenv`, review its most common commands, show example workflows and identify known issues.

### Contents

 1. [Getting Started](#1-getting-started)
 2. [Example Workflows](#2-common-workflows)
 3. [Known Issues](#3-known-issues)

### 1. Getting Started

Follow the steps below to get a working `jenv` installation with knowledge of your `java` environment. Read all the code you execute carefully: a `$` symbol at the beginning of a line should be omitted, since it's meant to show you entering a command into your terminal and observing the response after the command.

#### 1.1 Installing `jenv`

On macOS, you can install jEnv using [Homebrew](https://brew.sh):

```bash
brew install jenv
```

Or if you use [MacPorts](https://www.macports.org) on macOS:

```bash
sudo port install jenv
```

Alternatively, and on Linux, you can install it from source:

```bash
git clone https://github.com/jenv/jenv.git ~/.jenv
```

####  1.2 Configuring your shell

jEnv needs to be intialised in your shell by evalling the output of `jenv init -`. e.g.

```bash
# Shell: bash
echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(jenv init -)"' >> ~/.bash_profile
# Shell: zsh
echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(jenv init -)"' >> ~/.zshrc
```

To have `JAVA_HOME` get set by jEnv, enable the `export` plugin. This needs to be done in an initialised shell:

```bash
eval "$(jenv init -)"
jenv enable-plugin export
```

Restart your shell by closing and reopening your terminal window or running `exec $SHELL -l` in the current session for the changes to take effect.

```bash
exec $SHELL -l
```

To verify `jenv` was installed and initialised, run `jenv doctor`. On a macOS machine, you'll observe the following output:

```bash
$ jenv doctor
[OK]	No JAVA_HOME set
[ERROR]	Java binary in path is not in the jenv shims.
[ERROR]	Please check your path, or try using `jenv add /path/to/java/home`
	PATH : /Users/user/.jenv/libexec:/Users/user/.jenv/shims:/Users/user/.jenv/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
[OK]	Jenv is correctly loaded
```

Observe that `jenv` is correctly loaded but Java is not yet installed. To rememedy this, see "[Adding Your Java Environment](#13-adding-your-java-environment)" below.

Problem? Please visit the [Trouble Shooting](https://github.com/jenv/jenv/wiki/Trouble-Shooting) Wiki page.

##### Support for fish

**Untested**: While this fork has improved `fish` shell support, it has not been tested by this maintainer. To install `jenv` for Fish according to the contributor's instructions:

```sh
echo 'set PATH $HOME/.jenv/bin $PATH' >> ~/.config/fish/config.fish
echo 'status --is-interactive; and jenv init - | source' >> ~/.config/fish/config.fish
cp ~/.jenv/fish/jenv.fish ~/.config/fish/functions/jenv.fish
```

#### 1.3 Adding Your Java Environment

Use `jenv add` to inform `jenv` where your Java environment is located. `jenv` does not, by itself, install Java.

For example, on macOS, use `brew` to install the latest Java (OpenJDK 21, also follow the caveat steps to symlink into the system virtual machines) followed by the appropriate `jenv add PATH_TO_JVM_HOME` command to recognize it.

```bash
brew install java
sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
jenv add "$(/usr/libexec/java_home)" # this will always default to the latest version in /Library/Java/JavaVirtualMachines
# or
# jenv add /Library/Java/JavaVirtualMachines/openjdk.jdk
```

With macOS OpenJDK 21.0.2 installed, for example, either of these commands will add `/Library/Java/JavaVirtualMachines/openjdk.jdk/Contents/Home` as a valid JVM. Your JVM directory may vary!

Observe now that this version of Java is added to your `jenv versions` command:

```bash
$ jenv versions
* system (set by /Users/user/.jenv/version)
  21.0
  21.0.2
  openjdk64-21.0.2
```

By default, the latest version of Java is your `system` Java on macOS.

We'll now set a `jenv local VERSION` local Java version for the current working directory. This will create a `.java-version` file we can check into Git for our projects, and `jenv` will load it correctly **when a shell is started from this directory**.

```bash
$ jenv local 21.0.2
$ cat .java-version
21.0.2
```

Is `JAVA_HOME` set?

```bash
$ echo ${JAVA_HOME}
/Users/bberman/.jenv/versions/21.0.2
```

Yes! Observe that `JAVA_HOME` is set to a valid shim directory - this is a result of enabling the `export` plugin.

If you executed this commands inside your `$HOME` directory, you can now delete `.java-version`:

```bash
jenv local --unset
# or
rm .java-version
```

#### 1.4 Setting Java versions

`jenv` can set Java versions at 3 levels:
- global (lowest priority)
- local
- shell (highest priority)

Where multiple versions are set, the highest priority setting as above takes effect.

For example if the global version was 17 and the shell version was 11, 11 would be used.

##### 1.4.1 Setting a Global Java Version

Use `jenv global VERSION` to set a global, default Java version:

```bash
jenv global 21.0.2
```

When you next open a shell or terminal window, this version of Java will be the default.

On macOS, this sets `JAVA_HOME` for GUI applications on macOS using `jenv macos-javahome`. Integrates [this tutorial](https://www.ibm.com/support/knowledgecenter/en/SSPJLC_7.6.2/com.ibm.si.mpl.doc/tshoot/ts_java_home.html) to create a file that does **not update dynamically** depending on what local or shell version of Java is set, only global.

It can be unset with
```bash
jenv global --unset
```

##### 1.4.2 Setting a local Java Version

Use `jenv local VERSION` to set the Java used in this folder.

This version will activate whenever you `cd` into the follder. This is useful in the root of projects, for example where you would typically run a
`./gradlew build` or `./mvnw package` command from.

```bash
jenv local 21.0.2
```

This can be unset with
```bash
jenv local --unset
# or
unset .java-version
```

##### 1.4.3 Setting a Shell Java Version

Use `jenv shell VERSION` to set the Java used in this particular shell session:

```bash
jenv shell 21.0.2
```

This can be unset with
```bash
jenv shell --unset
# or
unset JENV_VERSION
```

### 2 Common Workflows

These common workflows demonstrate how to use `jenv` to solve common problems.

#### 2.1 Using Two JVMs on macOS

Our goal is to have both the latest version of Java and JDK 8 installed at the same time. This is helpful for developing Android applications, whose build tools are sensitive to using an exact Java version.

We'll resume where we left off with Java 21.0.2 installed. Let's install Java 8 from brew and symlink it into the Library folder per the caveats.

```bash
brew install openjdk@8
sudo ln -sfn /usr/local/opt/openjdk@8/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-8.jdk
```

This will install the latest version of Java 8 to a special directory in macOS. Let's see which directory that is:

```bash
$ ls -1 /Library/Java/JavaVirtualMachines 
openjdk-8.jdk
openjdk.jdk
```

Observe the `openjdk-8.jdk` directory. **Your exact version may vary**. We cannot retrieve this using `/usr/libexec/java_home`, unfortunately. We'll add the Java home directory using `jenv` so that it shows up in our `jenv versions` command:

```bash
$ jenv add /Library/Java/JavaVirtualMachines/openjdk-8.jdk/Contents/Home/
openjdk64-1.8.0.222 added
1.8.0.222 added
1.8 added
$ jenv versions
* system
  1.8
  1.8.0.222
  openjdk64-1.8.0.222
  21
  21.0
  21.0.2
  openjdk64-21.0.2
```

#### 2.2 Other Workflows

Please contribute your own using a pull request!

### 3 Known Issues

Users seem to have issues using `jenv` with Fish. Please report any here.




