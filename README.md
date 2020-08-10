# C++ Starter Project

This project template, is, nothing but just a **template** and must used wisely.
By no means you must stick to the project structure, you are **FREE** to do
design how the project should be structured.

## How to start?

Just fork this repository. I reccomend then spend a few minutes inspecting all
the files to see what's in there, and then remove all the C++
modules/examples/tests and start from scratch.

You should always remove this `README.md` and start working on your own.

## Project Structure

```sh
.
├── cmake         # Build configurations, like clang-tidy, clang-format, etc.
├── docker        # A handy docker container has been already generated.
├── include       # The final project include directory, to be exported.
├── scripts       # Some script used by the CI/CD, you should check them.
├── src           # Source directory.
│   ├── apps      # Here you could place your application(stuff with main() ).
│   └── lib       # Here you can put the library sources.
└── tests         # Here you MUST implement tests to test your code.

```

## Utilities

The build system provides 3 handy targets to help you develop your final project

- `make clang-format` will check the style of your code. **NOTE:** You can
  adapt the [.clang-format](./.clang-format) file to fit your needs.
- `make clang-tidy` will run `clang-tidy` on your project. **NOTE:** You can
  adapt the [.clang-tidy](./.clang-tidy) file to fit your needs.
- `make test-coverage` will report how much do you cover from your project in
  the tests. This will generate an `HTML` report you could open on any modern
  browser and see what are you missing to cover: `xdg-open build/coverage/index.html`

## CI/CD (based on Gitlab CI/CD)

The CI/CD is your friend, you get to change/add/disable any functionality, you
are FREE to design your final project. I just place in this template what would
be the bare-minimum to start working with. Make sure you allow some time to
play around in the `pipelines` tab and inspect each `stage` of the pipeline.

Changes to the CI/CD are done through the [.gitlab-ci.yml](./..gitlab-ci.yml)
configuration file.

## Docker

There is docker image provided by this template, you are also free to change
it/adapt it to your needs. All the information about this docker image is in the
[Dockerfile](docker/Dockerfile) script. In your repository in the `packages` tab
there are instructions on how to build/deploy new versions of the image. **Make
sure** you update the [.gitlab-ci.yml](./..gitlab-ci.yml) with the new docker
image if you plan to change it.

## Advice

Go wild! This is **YOUR** project, you can do whatever pleases you :) Spend as
much time as you like on each module, improve others, change the CI/CD,
disable/enable functionality, use the `Wiki`, do everything, go wild!!!

Good luck!
