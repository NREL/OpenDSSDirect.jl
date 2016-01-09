# OpenDSSDirect

[OpenDSS](http://smartgrid.epri.com/SimulationTool.aspx) is an open-source
distribution system simulation. This Julia package implements a "direct" library
interface to OpenDSS. See [this
documentation](http://svn.code.sf.net/p/electricdss/code/trunk/Distrib/Doc/OpenDSS_Direct_DLL.pdf)
for detailed information on the direct library interface to OpenDSS. The direct
library interface can be faster than the more traditional COM interface.

**This package is only available for Windows.** OpenDSS is only available for
Windows.

**This package is still in development.**

# Installation

For now, this package is not registered. To install, use the following from
within Julia:

```julia 
Pkg.clone("https://github.com/tshort/OpenDSSDirect.jl.git")
```

This package includes OpenDSS as a library. You do not have to install OpenDSS
separately. In particular, it includes the OpenDSSDEngine.DLL that implements
the direct-access API.

# Features

[Julia](http://julialang.org/) is a fast, flexible numerical language with
Matlab-like syntax. Like Python or Matlab, scripting OpenDSS can be used for 
Monte-Carlo batch runs, parameter sweeps, post processing and plotting of 
results, and more. 

Julia has several key features for advanced operations with OpenDSS:

* **Parallel operations** -- Julia supports several ways to process data in 
  parallel. This includes parallel operations on multiple CPU cores and 
  parallel operations on processes in a cluster. See 
  [examples/8760_parallel.jl](https://github.com/tshort/OpenDSSDirect.jl/blob/master/examples/8760_parallel.jl) 
  for an example of an annual simulation split among local CPU cores.

* **Optimization** -- Julia has strong support for optimization.

* **Custom solutions and custom models** -- Because Julia compiles to codes 
  that run as quickly as C programs, it is possible to implement custom
  solutions, and these custom solutions can contain custom models implemented
  in Julia. The basic idea is to run a custom solution as described in 
  [OpenDSS Solution Interface.pdf](http://svn.code.sf.net/p/electricdss/code/trunk/Distrib/Doc/OpenDSS%20Solution%20Interface.pdf).
  Custom control or power control elements can be implemented between each
  model iteration.

# Main API

The `dss` function is the main function for passing commands to OpenDSS. You can
pass multi-line commands with `dss`, but continuation lines are not allowed. 
You can also splice in Julia values with string interpolation. Here is an 
example of using `dss`:

```julia
using OpenDSSDirect
filename = "C:/OpenDSS/electricdss/IEEETestCases/8500-Node/Master.dss"
dss("""
    clear
    compile $filename
""")
```

Several functions are available for setting OpenDSS variables, getting values,
and initiating commands. The first argument is a symbol followed by zero or more
arguments. Here is an example to set the `kW` of the active load element:

```julia 
loads(:kW_set,50.)
``` 

Here is an example setting some loads:

```julia
filename = "C:/OpenDSS/electricdss/IEEETestCases/8500-Node/Master.dss"
dss("""
    clear
    compile $filename
""")
loadnumber = DSS.loads(:First)
while loadnumber > 0
    DSS.loads(:kW_set,50.)
    DSS.loads(:kvar_set,20.)
    loadnumber = DSS.loads(:Next)
end
println(DSS.loads(:Count)) 
```
 
For tight loops, the methods can be called with the symbol wrapped in `Val{}`.
The previous example is:

```julia 
DSS.loads(Val{:kW_set},50.)
``` 

This makes the Julia code faster by making types stable.
 
To use this API, you can either use `import OpenDSSDirect` and prepend all of the functions with `DSS.`, or you can `import OpenDSSDirect` and use the functions directly. The following two are equivalent:

```julia 
using OpenDSSDirect
DSS.circuit(:TotalPower)
``` 
Importing the DSS module:
```julia 
using OpenDSSDirect.DSS
circuit(:TotalPower)
``` 

Many of the functions that return arrays convert to complex numbers where appropriate. Here is an example session:

```julia
julia> using OpenDSSDirect.DSS

julia> filename = joinpath(Pkg.dir(), "OpenDSSDirect", "examples", "8500-Node", "Master.dss");

julia> dss("""
           clear
           compile $filename
       """)

julia> solution(:Solve);

julia> circuit(:Losses)
1.218242333223247e6 + 2.798391857088721e6im

julia> circuit(:TotalPower)
-12004.740450109337 - 1471.1749507157301im

julia> circuit(:SetActiveElement, "Capacitor.CAPBank3")
"6075"

julia> cktelement(:Voltages)
6-element Array{Complex{Float64},1}:
  5390.82-4652.32im
 -6856.89-2274.93im
  1284.62+7285.18im
      0.0+0.0im
      0.0+0.0im
      0.0+0.0im
```

Here is a list of functions supported by this API:

* activeclass 
* bus 
* capacitors 
* capcontrols 
* circuit 
* cktelement 
* ctrlqueue 
* dss 
* element 
* executive 
* fuses 
* generators 
* isource 
* lines 
* loads 
* loadshape 
* meters 
* monitors 
* parser 
* pdelements 
* progress 
* pvsystems 
* reclosers 
* regcontrols 
* relays 
* sensors 
* settings 
* solution 
* swtcontrols
* topology
* transformers
* vsources
* xycurves

To find the parameters and directives for each function, use `methods(fun)`.

# Low-level API

The main API is built on the low-level API documented 
[here](http://svn.code.sf.net/p/electricdss/code/trunk/Distrib/Doc/OpenDSS_Direct_DLL.pdf).
The low-level API is implemented in the `DSSCore` module.
Here is an example using the low-level API:

```julia
DSSCore.DSSPut_Command("clear")
DSSCore.DSSPut_Command("compile (C:/OpenDSS/electricdss/IEEETestCases/8500-Node/Master.dss)")
loadnumber = DSSCore.DSSLoads(0,0)
while loadnumber > 0
    DSSCore.DSSLoadsF(1,50.)
    DSSCore.DSSLoadsF(5,20.)
    loadnumber = DSSCore.DSSLoads(1,0)
end
println(DSSCore.DSSLoads(4,0)) 
```

Integer (I), floating-point (F), string (S), and variant (V) functions are
supported. The low-level API functions are not exported. 

# Limitations

The functions with "_set" parameters that use Variants are not implemented. An example is `SettingsV(5, arg)` where `arg` is an Array. Variants are normally array inputs. There are not many of these in the direct API, and most can be handled with the text interface or other functions. Functions with "_get" parameters that retrieve Variants are supported. 

