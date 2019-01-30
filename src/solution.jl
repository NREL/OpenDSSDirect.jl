module Solution

    using ..lib
    using ..utils

    function BuildYMatrix(BuildOption::Int, AllocateVI::Int)
        lib.Solution_BuildYMatrix(BuildOption, AllocateVI)
    end

    function CheckControls()
        lib.Solution_CheckControls()
    end

    function CheckFaultStatus()
        lib.Solution_CheckFaultStatus()
    end

    function Cleanup()
        lib.Solution_Cleanup()
    end

    function DoControlActions()
        lib.Solution_DoControlActions()
    end

    function FinishTimeStep()
        lib.Solution_FinishTimeStep()
    end

    function InitSnap()
        lib.Solution_InitSnap()
    end

    function SampleControlDevices()
        lib.Solution_SampleControlDevices()
    end

    function SampleDoControlActions()
        lib.Solution_Sample_DoControlActions()
    end

    function Solve()
        lib.Solution_Solve()
    end

    function SolveDirect()
        lib.Solution_SolveDirect()
    end

    function SolveNoControl()
        lib.Solution_SolveNoControl()
    end

    function SolvePFlow()
        lib.Solution_SolvePflow()
    end

    function SolvePlusControl()
        lib.Solution_SolvePlusControl()
    end

    function SolveSnap()
        lib.Solution_SolveSnap()
    end

    """Type of device to add in AutoAdd Mode: {dssGen (Default) | dssCap}"""
    function AddType()::Int
        return lib.Solution_Get_AddType()
    end

    """Type of device to add in AutoAdd Mode: {dssGen (Default) | dssCap}"""
    function AddType(Value::Int)
        lib.Solution_Set_AddType(Value)
    end

    """Base Solution algorithm: {dssNormalSolve | dssNewtonSolve}"""
    function Algorithm()::Int
        return lib.Solution_Get_Algorithm()
    end

    """Base Solution algorithm: {dssNormalSolve | dssNewtonSolve}"""
    function Algorithm(Value::Int)
        lib.Solution_Set_Algorithm(Value)
    end

    """Capacitor kvar for adding capacitors in AutoAdd mode"""
    function Capkvar()::Float64
        return lib.Solution_Get_Capkvar()
    end

    """Capacitor kvar for adding capacitors in AutoAdd mode"""
    function Capkvar(Value::Float64)
        lib.Solution_Set_Capkvar(Value)
    end

    """Flag indicating the control actions are done."""
    function ControlActionsDone()::Bool
        return lib.Solution_Get_ControlActionsDone() != 0
    end

    """Flag indicating the control actions are done."""
    function ControlActionsDone(Value::Bool)
        lib.Solution_Set_ControlActionsDone(Value ? 1 : 0)
    end

    """Value of the control iteration counter"""
    function ControlIterations()::Int
        return lib.Solution_Get_ControlIterations()
    end

    """Value of the control iteration counter"""
    function ControlIterations(Value::Int)
        lib.Solution_Set_ControlIterations(Value)
    end

    """{dssStatic* | dssEvent | dssTime}  Modes for control devices"""
    function ControlMode()::Int
        return lib.Solution_Get_ControlMode()
    end

    """{dssStatic* | dssEvent | dssTime}  Modes for control devices"""
    function ControlMode(Value::Int)
        lib.Solution_Set_ControlMode(Value)
    end

    """Flag to indicate whether the circuit solution converged"""
    function Converged()::Bool
        return lib.Solution_Get_Converged() != 0
    end

    """Flag to indicate whether the circuit solution converged"""
    function Converged(Value::Bool)
        lib.Solution_Set_Converged(Value ? 1 : 0)
    end

    """Default daily load shape (defaults to "Default")"""
    function DefaultDaily()::String
        return get_string(lib.Solution_Get_DefaultDaily())
    end

    """Default daily load shape (defaults to "Default")"""
    function DefaultDaily(Value::String)
        lib.Solution_Set_DefaultDaily(Value)
    end

    """Default Yearly load shape (defaults to "Default")"""
    function DefaultYearly()::String
        return get_string(lib.Solution_Get_DefaultYearly())
    end

    """Default Yearly load shape (defaults to "Default")"""
    function DefaultYearly(Value::String)
        lib.Solution_Set_DefaultYearly(Value)
    end

    """(read-only) Array of strings containing the Event Log"""
    function EventLog()::Vector{String}
        return get_string_array(lib.Solution_Get_EventLog)
    end

    """Set the Frequency for next solution"""
    function Frequency()::Float64
        return lib.Solution_Get_Frequency()
    end

    """Set the Frequency for next solution"""
    function Frequency(Value::Float64)
        lib.Solution_Set_Frequency(Value)
    end

    """Default Multiplier applied to generators (like LoadMult)"""
    function GenMult()::Float64
        return lib.Solution_Get_GenMult()
    end

    """Default Multiplier applied to generators (like LoadMult)"""
    function GenMult(Value::Float64)
        lib.Solution_Set_GenMult(Value)
    end

    """PF for generators in AutoAdd mode"""
    function GenPF()::Float64
        return lib.Solution_Get_GenPF()
    end

    """PF for generators in AutoAdd mode"""
    function GenPF(Value::Float64)
        lib.Solution_Set_GenPF(Value)
    end

    """Generator kW for AutoAdd mode"""
    function GenkW()::Float64
        return lib.Solution_Get_GenkW()
    end

    """Generator kW for AutoAdd mode"""
    function GenkW(Value::Float64)
        lib.Solution_Set_GenkW(Value)
    end

    """Set Hour for time series solutions."""
    function Hour()::Float64
        return lib.Solution_Get_Hour()
    end

    """Set Hour for time series solutions."""
    function Hour(Value::Float64)
        lib.Solution_Set_Hour(Value)
    end

    """
    (read) Get/Set the Solution.IntervalHrs variable used for devices that integrate
    (write) Get/Set the Solution.IntervalHrs variable for custom solution algorithms
    """
    function IntervalHrs()::Float64
        return lib.Solution_Get_IntervalHrs()
    end

    """
    (read) Get/Set the Solution.IntervalHrs variable used for devices that integrate
    (write) Get/Set the Solution.IntervalHrs variable for custom solution algorithms
    """
    function IntervalHrs(Value::Float64)
        lib.Solution_Set_IntervalHrs(Value)
    end

    """(read-only) Number of iterations taken for last solution. (Same as TotalIterations)"""
    function Iterations()::Int
        return lib.Solution_Get_Iterations()
    end

    """Load-Duration Curve name for LD modes"""
    function LDCurve()::String
        return get_string(lib.Solution_Get_LDCurve())
    end

    """Load-Duration Curve name for LD modes"""
    function LDCurve(Value::String)
        lib.Solution_Set_LDCurve(Value)
    end

    """Load Model: {dssPowerFlow (default) | dssAdmittance}"""
    function LoadModel()::Int
        return lib.Solution_Get_LoadModel()
    end

    """Load Model: {dssPowerFlow (default) | dssAdmittance}"""
    function LoadModel(Value::Int)
        lib.Solution_Set_LoadModel(Value)
    end

    """Default load multiplier applied to all non-fixed loads"""
    function LoadMult()::Float64
        return lib.Solution_Get_LoadMult()
    end

    """Default load multiplier applied to all non-fixed loads"""
    function LoadMult(Value::Float64)
        lib.Solution_Set_LoadMult(Value)
    end

    """Maximum allowable control iterations"""
    function MaxControlIterations()::Int
        return lib.Solution_Get_MaxControlIterations()
    end

    """Maximum allowable control iterations"""
    function MaxControlIterations(Value::Int)
        lib.Solution_Set_MaxControlIterations(Value)
    end

    """Max allowable iterations."""
    function MaxIterations()::Int
        return lib.Solution_Get_MaxIterations()
    end

    """Max allowable iterations."""
    function MaxIterations(Value::Int)
        lib.Solution_Set_MaxIterations(Value)
    end

    """
    (read) Minimum number of iterations required for a power flow solution.
    (write) Mininum number of iterations required for a power flow solution.
    """
    function MinIterations()::Int
        return lib.Solution_Get_MinIterations()
    end

    """
    (read) Minimum number of iterations required for a power flow solution.
    (write) Mininum number of iterations required for a power flow solution.
    """
    function MinIterations(Value::Int)
        lib.Solution_Set_MinIterations(Value)
    end

    """Set present solution mode (by a text code - see DSS Help)"""
    function Mode()::Int
        return lib.Solution_Get_Mode()
    end

    """Set present solution mode (by a text code - see DSS Help)"""
    function Mode(Value::Int)
        lib.Solution_Set_Mode(Value)
    end

    """(read-only) ID (text) of the present solution mode"""
    function ModeID()::String
        return get_string(lib.Solution_Get_ModeID())
    end

    """(read-only) Max number of iterations required to converge at any control iteration of the most recent solution."""
    function MostIterationsDone()::Int
        return lib.Solution_Get_MostIterationsDone()
    end

    """Number of solutions to perform for Monte Carlo and time series simulations"""
    function Number()::Int
        return lib.Solution_Get_Number()
    end

    """Number of solutions to perform for Monte Carlo and time series simulations"""
    function Number(Value::Int)
        lib.Solution_Set_Number(Value)
    end

    """(read-only) Gets the time required to perform the latest solution (Read only)"""
    function ProcessTime()::Float64
        return lib.Solution_Get_Process_Time()
    end

    """Randomization mode for random variables "Gaussian" or "Uniform" """
    function Random()::Int
        return lib.Solution_Get_Random()
    end

    """(read-only) Gets the time required to perform the latest solution (Read only)"""
    function ProcessTime(Value::Int)
        lib.Solution_Set_Random(Value)
    end

    """Seconds from top of the hour."""
    function Seconds()::Float64
        return lib.Solution_Get_Seconds()
    end

    """Seconds from top of the hour."""
    function Seconds(Value::Float64)
        lib.Solution_Set_Seconds(Value)
    end

    """Time step size in sec"""
    function StepSize()::Float64
        return lib.Solution_Get_StepSize()
    end

    """Time step size in sec"""
    function StepSize(Value::Float64)
        lib.Solution_Set_StepSize(Value)
    end

    """(read-only) Flag that indicates if elements of the System Y have been changed by recent activity."""
    function SystemYChanged()::Bool
        return lib.Solution_Get_SystemYChanged() != 0
    end

    """(read-only) Get the solution process time + sample time for time step"""
    function TimeTimeStep()::Float64
        return lib.Solution_Get_Time_of_Step()
    end

    """Solution convergence tolerance."""
    function Convergence()::Float64
        return lib.Solution_Get_Tolerance()
    end

    """Solution convergence tolerance."""
    function Convergence(Value::Float64)
        lib.Solution_Set_Tolerance(Value)
    end

    """
    (read) Gets the accumulated time of the simulation
    (write) Sets the Accumulated time of the simulation
    """
    function TotalTime()::Float64
        return lib.Solution_Get_Total_Time()
    end

    """
    (read) Gets the accumulated time of the simulation
    (write) Sets the Accumulated time of the simulation
    """
    function TotalTime(Value::Float64)
        lib.Solution_Set_Total_Time(Value)
    end

    """(read-only) Total iterations including control iterations for most recent solution."""
    function TotalIterations()::Int
        return lib.Solution_Get_Totaliterations()
    end

    """Set year for planning studies"""
    function Year()::Int
        return lib.Solution_Get_Year()
    end

    """Set year for planning studies"""
    function Year(Value::Int)
        lib.Solution_Set_Year(Value)
    end

    """Hour as a double, including fractional part"""
    function DblHour()::Float64
        return lib.Solution_Get_dblHour()
    end

    """Hour as a double, including fractional part"""
    function DblHour(Value::Float64)
        lib.Solution_Set_dblHour(Value)
    end

    """Percent default  annual load growth rate"""
    function PctGrowth()
        return lib.Solution_Get_pctGrowth()
    end

    """Percent default  annual load growth rate"""
    function PctGrowth(Value::Float64)
        lib.Solution_Set_pctGrowth(Value)
    end

    """(write-only) Set Stepsize in Hr"""
    function StepSizeHr(Value::Float64)
        lib.Solution_Set_StepsizeHr(Value)
    end

    """(write-only) Set Stepsize in minutes"""
    function StepSizeMin(Value::Float64)
        lib.Solution_Set_StepsizeMin(Value)
    end

end
