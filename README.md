# CowBF

A Brainfuck interpreter in the [Cowgol](http://cowlark.com/cowgol/index.html)
programming language. Three different versions are provided, as a demonstration
of different options for interpreter implementation:

 - `cowbf_case` selects the next Brainfuck operation using
   the `case` statement in a loop.

 - `cowbf_subrcall` selects the next operation using subroutine calls in a
   loop.

 - `cowbf_passto` selects the next operation using the `passto` statement,
   a language extension that adds a form of proper tail calls to Cowgol.
   It is part of
   [my own fork of Cowgol](https://github.com/shadowofneptune/cowgol/tree/passto).
   
This interpreter is a good testbed for dispatch techniques because the
operations are simple. Dispatch takes up a fairly large amount of execution
time as a result.

## Building

Move the Linux 386 binaries from the `bin` folder of the above Cowgol fork
into this folder. Change the RT_LOCATION variable in the makefile to something
like `cowgol_fork/.obj/rt`. Finally, run `make`.

## Usage

	cowbf [program file] [input file]

The program file is the Brainfuck program. Any usage of the `.` instruction
in that program will read from the input file, and any usage of the `,`
instruction will output to the console.

## Benchmarks

These were performed on a Debian 11 system with an Intel Core i3-3220 @ 3.30GHz.
The program file was a
[ROT13 filter](https://en.wikipedia.org/wiki/Brainfuck#ROT13),
and the input file was the text of the book
[*Accelerando*](https://www.antipope.org/charlie/blog-static/fiction/accelerando/accelerando.html).
Recorded times are the average of 100 runs.

|Variant |Binary size|Execution time (s)|
|--------|-----------|------------------|
|subrcall|19.72 kB   |17.00             |
|case    |15.95 kB   |13.73             |
|passto  |19.66 kB   |10.98             |

The raw output of `perf` is included in the repo for further examination.


