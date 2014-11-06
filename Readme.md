Iron Worker Dependency Finder
=========

This project figures out what dependencies your libraries need to run on Iron Worker.

Iron Worker, from [Iron.io](http://http://www.iron.io/), "runs tasks in the background, in parallel, at massive scale."  Your worker may need libraries that are not installed by default in the Iron Worker environment. Unfortunately, you can't use `sudo apt-get` during your worker build process, because your build process won't have access to `sudo`.

Alternately, you can use the `deb` command in your `.worker` file to install dependencies. However, .deb files don't handle dependencies. You're on your own for figuring out which dependencies are needed. And figuring that out can be incredibly painful.

This project makes it simple. It runs a worker on Iron Worker, and spits out a list of dependencies needed.

## Installation