# Clifford Crypto

Ruby library for cryptographic tools in Ruby.

## Requirements

This code requires Ruby installed on your system. There are [several options for downloading and installing Ruby](https://www.ruby-lang.org/en/downloads/ "Download Ruby").

This project uses only Ruby standard libraries, so once you have Ruby installed (version 2.6.3 and greater), you have everything required to run the code. We tested our implementation on Mac OSX version 10.13.6 with ruby 2.6.3p62 (2019-04-16 revision 67580) [x86_64-darwin17].

## Usage

### Running tests

Once Ruby is installed on your machine, from the command line and in the root directory of the project, run the tests to check the code with the following command:

`$ rake`

You should get a result similiar to the following:

```console
Run options: --seed 9109

# Running:

...........

Finished in 5.316182s, 2.0692 runs/s, 9.0290 assertions/s.

11 runs, 48 assertions, 0 failures, 0 errors, 0 skips
```

### Ruby Interactive Shell

You can also run code from the Ruby Interactive Shell (IRB). From the project's root directory, execute the following command on the terminal:

`$ irb`

You will see the IRB's prompt. Next, command snippets for specific cases that can be executed on IRB.

#### Working with multivectors

Require the file the will boot the entire project on IRB:

`> require './boot'`

Creating a multivector:

`> m = Clifford::Multivector3D.new [2,3,4,5,6,7,8,9]`

which returns

`=> 2e0 + 3e1 + 4e2 + 5e3 + 6e12 + 7e13 + 8e23 + 9e123`

Clifford conjugation:

`> m.clifford_conjugation` or `> m.cc`

`=> 2e0 + -3e1 + -4e2 + -5e3 + -6e12 + -7e13 + -8e23 + 9e123`

Reverse:

`> m.reverse`

`=> 2e0 + 3e1 + 4e2 + 5e3 + -6e12 + -7e13 + -8e23 + -9e123`

Amplitude squared:

`> m.amplitude_squared`

`=> 22e0 + 0e1 + 0e2 + 0e3 + 0e12 + 0e13 + 0e23 + -16e123`

Rationalize:

`> m.rationalize`

`=> 740e0 + 0e1 + 0e2 + 0e3 + 0e12 + 0e13 + 0e23 + 0e123`

Inverse:

`> m.inverse`

`=> -5/37e0 + 31/370e1 + -10/37e2 + -7/370e3 + -53/185e12 + -9/74e13 + -56/185e23 + 23/74e123`

Geometric product:

`> m.geometric_product(m.inverse)` or `>> m.gp(m.inverse)`

`=> 1e0 + 0e1 + 0e2 + 0e3 + 0e12 + 0e13 + 0e23 + 0e123`

`> m.gp(m)`

`=> -176e0 + -132e1 + 142e2 + -88e3 + 114e12 + -44e13 + 86e23 + 88e123`

Addition:

`> m.plus(m)`

`=> 4e0 + 6e1 + 8e2 + 10e3 + 12e12 + 14e13 + 16e23 + 18e123`

Subtraction:

`> m.minus(m)`

`=> 0e0 + 0e1 + 0e2 + 0e3 + 0e12 + 0e13 + 0e23 + 0e123`

Scalar division:

`> m.scalar_div(2)`

`=> 1e0 + 3/2e1 + 2e2 + 5/2e3 + 3e12 + 7/2e13 + 4e23 + 9/2e123`

Scalar multiplication:

`> m.scalar_mul(2)`

`=> 4e0 + 6e1 + 8e2 + 10e3 + 12e12 + 14e13 + 16e23 + 18e123`

All multivectors M in Cl(3,0) can be decomposed as in M = Z + F. Obtaining Z:

`> m.z`

`=> 2e0 + 0e1 + 0e2 + 0e3 + 0e12 + 0e13 + 0e23 + 9e123`

Obtaining F:

`> m.f`

`=> 0e0 + 3e1 + 4e2 + 5e3 + 6e12 + 7e13 + 8e23 + 0e123`

Obtaining F squared:

`> m.f2`

`=> -99e0 + 0e1 + 0e2 + 0e3 + 0e12 + 0e13 + 0e23 + 52e123`

Obtaining the eigenvalues a multivector:

`> m.eigenvalues`

`=> [(4.5323662175072155+19.26707741568027i), (-0.5323662175072155-1.2670774156802675i)]`
