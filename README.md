# Assignment9

![Assignment 9](https://github.com/PGE383-HPC/assignment9-solution/actions/workflows/main.yml/badge.svg)

## Problem 1

This repository contains a file [data.csv](data/data.csv) that is actual data from a stress-strain test conducted in a standard test frame (MTS machine).  The columns of data have the following format

|time|Axial Displacement|Axial (engineering) Strain| Axial Force |
|:-:|:-:|:-:|:-:|
| (s) | (in) | (in/in) | (lbf) |

Complete the function definition for the function named `convert_to_true_stress_and_strain(filename::String)`.  This function should take the name of a file (e.g. `"data1.csv"`) as an string argument and return a tuple ($\varepsilon_T$, $\sigma_T$), where $\varepsilon_T$ is the *true* strain and $\sigma_T$ is the *true* stress.

Recall that the definition of engineering stress is

$$
\sigma_E = \frac {P} {A_o}
$$

where $P$ is the axial force and $A_o$ is the original cross-sectional area of the sample.  The cross-sectional area can be computed from the width and thickness that the function `parse_width_and_thickness(filename::String)` returns as a tuple.  There is also a function `read_data_file(filename::String)` that will read the CSV file and return only the raw data as a two-dimensional `Array` of `Float64`s.

The conversion between engineering $\varepsilon_E$ and true strain is

$$
\varepsilon_T = \ln(1+\varepsilon_E).
$$

The conversion between engineering and true stress is

$$
\sigma_T = \sigma_E (1+\varepsilon_E).
$$

Use *broadcasted* operations to make your code compact and efficient. **No `for` loops!**

## Problem 2

Complete the function `compute_toughness(filename::String)` to compute the materials toughness.  Recall that toughness is the area under the stress-strain curve, i.e.

$$
\mbox{Toughness} = \int \sigma  {\rm d}\varepsilon
$$

Use the true stress and strain values computed in Problem 1, then use
a trapezoid rule to do the integration.  Again, you should use *broadcasted* 
operations for the computation.

## Testing

To see if you answers are correct, run the following command at the Terminal
command line from the repository's root directory

```bash
julia --project=. -e "using Pkg; Pkg.test()"
```

the tests will run and report if passing or failing.
