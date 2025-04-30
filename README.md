# gridfinity_extended_openscad_cli

The purpose of this repository is to:

1. Help others use the [gridfinity extended openscad](https://github.com/ostat/gridfinity_extended_openscad) via the CLI.
   1. I didn't see any documentation on how to use the CLI, so I figured I could share it
   2. Faster to generate the stls (cli vs gui)
2. store my own gridfinity bin configurations
3. easy way to repeat building the same type of bin

Dependencies / Assumptions:

1. You are running `macOS`. Required for the `say` command.
2. `just` installed
3. `openscad` [Development Snapshot](https://openscad.org/downloads.html#snapshots) installed
   1. Install path should be in `/Applications`
4. `git` installed
   1. To download the `gridfinity_extended_openscad`

## Install

Install `gridfinity_extended_openscad`. This will just clone the repository to the existing directory.

```sh
just install
```

## Usage

Default dimensions:
1. width=3
1. depth=3
1. height=5

For the examples, we will use the command `example`.

```sh
just example
```

This will generate an stl file in the `examples` directory. Do check if it doesn't exist already.

To configure your own dimensions:

```sh
just width=3 depth=5 height=17 example
```

Now create your own `just` commands! I have a `tall` command you can also see as an example.

You can also change the format

```sh
just format=3mf example
```

### anylid

`anylid` is  from [rngcntr on Maker World](https://makerworld.com/en/models/1059434-anylid-click-lock-stackable-lid-for-gridfinity#profileId-1047493)

```sh
just width=3 depth=3 anylid
```