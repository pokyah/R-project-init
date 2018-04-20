# Bash Script to init a new R-project with a clean Skeletton

Productivity tool.
This script is inspired from https://frdvnw.github.io/data-sciences/linux/2018/04/12/my-r-skeletton.html

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
$ sudo ln -sf absolute/path/of/make-R-skeletton.sh ~/.local/bin/rskel
```

Now, from anywhere, if you type `rskel`, the container will be executed

## Want to contribute ?

Fork and submit a pull request. 

