# ant-netbeans

This is a project to make netbeans ant config usable from command line

## Background

netbeans ant config is based on a series of import in basic build.xml file:

    <import file="nbproject/build-impl.xml"/>
    <import file="nbproject/profiler-build-impl.xml"/>

So first enhancement this project provides consist on parse them to locate existing targets, by modifying ant autocompletion.

This project provides such autocompletion on `completion/ant` file. Source it to replace default ant completion with a netbeans-aware config.

> Hint: Here is how I maintain such bash features
> https://github.com/albfan/dotfiles/blob/master/run_scripts 
> https://github.com/albfan/dotfiles/blob/master/bashrc#L101

Next feature is to provide junit dependency to complete netbeans lifecycle. `ant.sh` downloads it when neccesary.

About jdk, netbeans ant is based on environment variables. You need to setup `JAVA_HOME` or `JDK_HOME` to be recognized by ant netbeans config.

##Install

Download and symlink to your path

```bash
$ git clone git@github.com:albfan/ant-netbeans.git
$ cd ant-netbeans
$ ln -s $PWD/ant.sh ~/bin/
$ ln -s $PWD/completion/ant ~/.bashrc.d/
```

## Usage

To compile:

    $ ant.sh compile

To run:

    $ ant.sh run

Use autocompletion to see all the targets provided.

## Alternatives

It's supposed to be another approach

https://platform.netbeans.org/tutorials/nbm-ant.html

but I couldn't make it work.
