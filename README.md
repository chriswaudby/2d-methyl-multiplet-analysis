# 2D Methyl Multiplet Analysis

Julia scripts for determination of methyl S2tc from lineshape fitting of 1H-coupled HSQC multiplets.

## Data required

* HMQC peak list `peak.list` with format:
```
I1CD1     10.460      1.002 
L1CD1     20.853      0.076 
V1CG1     14.779      0.769 
```

This can easily be generated from a Sparky peak list.

* Experiment directory containing processed nmrPipe format data. See included `nmrproc.com` for an example processing script.

## Usage

1. First time, set up required packages in Julia console (include `]` to enter package management mode):
```julia
] instantiate
```

2. Enter paths to the peak list and experiment files in `go-S2tc.jl` script. Note that the processed ft2 file must be enclosed within the bruker experiment directory to correctly identify associated metadata.

3. Adjust the size of the ROIs used for fitting - this will be field dependent, and should be as narrow as possible to contain the full multiplet.

4. Run the script.
