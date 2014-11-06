Iron Worker Dependency Finder
=========

This project figures out what dependencies your libraries need to run on Iron Worker.

Iron Worker, from [Iron.io](http://http://www.iron.io/), "runs tasks in the background, in parallel, at massive scale."  Your worker may need libraries that are not installed by default in the Iron Worker environment. Unfortunately, you can't use `sudo apt-get` during your worker build process, because your build process won't have access to `sudo`.

Alternately, you can use the `deb` command in your `.worker` file to install dependencies. However, .deb files don't handle dependencies. You're on your own for figuring out which dependencies are needed. And figuring that out can be incredibly painful.

This project makes it simple. It runs a worker on Iron Worker, and spits out a list of dependencies needed.

## Usage
1) Clone this repo.

```bash
git clone https://github.com/johntitus/IronWorkerDebFinder.git
```

2) Modify the `iron.json` file to have your `token` and `project_id`.

3) Upload the worker to Iron Worker.

```bash
iron_worker upload depfinder
```

4) Queue a task for the worker in the Iron Worker GUI.

Log into Iron.io and select your Project workers.

Click on the `depfinder` worker.

Click the `Queue a Task` button.

In the `Payload` area, put in the name of the libraries you need to use. For example, `libphash0-dev cimg-dev`.

Click `Queue Task`

5) Read the Task Log to get a list of the dependencies needed.

The worker outputs the list of dependencies to stdout, which you can read in the Task Log.  It should look something like this:

```bash
Dependencies for libphash0-dev cimg-dev
http://archive.ubuntu.com/ubuntu/pool/universe/libp/libphash/libphash0_0.9.4-1.2_amd64.deb
http://archive.ubuntu.com/ubuntu/pool/universe/libp/libphash/libphash0-dev_0.9.4-1.2_amd64.deb
http://us.archive.ubuntu.com/ubuntu/pool/universe/m/mpg123/libmpg123-0_1.15.3-1ubuntu1_amd64.deb
http://us.archive.ubuntu.com/ubuntu/pool/universe/c/cimg/cimg-dev_1.4.9-2build2_all.deb
```

Turn each of those dependencies into a `deb` line in your real worker's `.worker` file, and you should be good to go~