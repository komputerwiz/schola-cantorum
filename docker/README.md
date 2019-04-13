A docker image definition for compiling documents using LuaLaTeX, gregorio,
and LilyPond.

To set up the docker image, run the following:

    docker build -t schola-build

Once built, the image can be used to compile PDFs from source files:

    docker run --rm \
      --volume /path/to/files/:/compile \
      --workdir /compile \
      --user $(uid -u):$(uid -g) \
      schola-build \
      make
