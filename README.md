# Bash Script to init a new R-project with a clean Skeletton

Productivity tool.
This script is inspired from https://frdvnw.github.io/data-sciences/linux/2018/04/12/my-r-skeletton.html

# Requirements

You must have curl installed

```bash
$ sudo apt-get install curl
```

## How it works ? 

* It pulls the Github R .gitgnore template file and make it your .gitignore file
* It pulls the GNU GPL V3 license from gnu.org and make it your LICENSE file
* it pulls a default init.R script from this repo with knitr commenting + YAML header + TOS footer + my habitual R script initialisation functions (load common libraries, etc...)
* It creates the tree structure
* It intialize a new git repository

## How to use it ? 

### Fork or clone this repository

```bash
git clone
```

#### Make the `make-R-skeletton.sh` executable :

```bash
$ chmod a+x make-R-skeletton.sh
```

#### Set PATH so it includes user's private ./local/bin folder if it exists

```bash
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
```

#### Make a symbolic link to the original bash script that executes the container

* Create a folder `.local/bin` in your home directory if it does not exists

```bash
$ mkdir `~/.local/bin
```

* make the simlink to the `make-R-skeletton.sh` in your `~/.local/bin/` folder that allow to launch it using the simple command `rskel` :

```bash
$ cd ~/.local/bin/
$ sudo ln -sf <ABSOLUTE_PATH_TO>/make-R-skeletton.sh ~/.local/bin/rskel
```

Now, from anywhere, if you type `rskel`, the command will be executed. You can also pass a `<PATH>` argument so that the tree structure will be created in this `<PATH>`

## Coming improvments

Automagically create a .Rproj configuration

## Want to contribute ?

Fork and submit a pull request. 

