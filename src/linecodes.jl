module LineCodes

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Array of strings with names of all devices"""
function AllNames()::Vector{String}
    return get_string_array(Lib.LineCodes_Get_AllNames)
end

"""Zero-sequence capacitance, nF per unit length (Getter)"""
function C0()::Float64
    return @checked Lib.LineCodes_Get_C0()
end

"""Zero-sequence capacitance, nF per unit length (Setter)"""
function C0(Value::Float64)
    @checked Lib.LineCodes_Set_C0(Value)
end

"""Positive-sequence capacitance, nF per unit length (Getter)"""
function C1()::Float64
    return @checked Lib.LineCodes_Get_C1()
end

"""Positive-sequence capacitance, nF per unit length (Setter)"""
function C1(Value::Float64)
    @checked Lib.LineCodes_Set_C1(Value)
end

"""Capacitance matrix, nF per unit length (Getter)"""
function Cmatrix()::Matrix{Float64}
    n = Phases()
    if n == 0
        cmatrix = reshape(Float64[], (0, 0))
    else
        cmatrix = reshape(get_float64_array(Lib.LineCodes_Get_Cmatrix), (n, n))
    end
    return cmatrix
end

"""Capacitance matrix, nF per unit length (Setter)"""
function Cmatrix(Value::Matrix{Float64})
    n = Phases()
    Cmatrix(Value[:])
end

"""Capacitance matrix, nF per unit length (Setter)"""
function Cmatrix(Value::Vector{Float64})
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked Lib.LineCodes_Set_Cmatrix(ValuePtr, ValueCount)
end

"""Number of LineCodes"""
function Count()::Int
    return @checked Lib.LineCodes_Get_Count()
end

"""Emergency ampere rating (Getter)"""
function EmergAmps()::Float64
    return @checked Lib.LineCodes_Get_EmergAmps()
end

"""Emergency ampere rating (Setter)"""
function EmergAmps(Value::Float64)
    @checked Lib.LineCodes_Set_EmergAmps(Value)
end

function First()::Int
    return @checked Lib.LineCodes_Get_First()
end

"""Flag denoting whether impedance data were entered in symmetrical components"""
function IsZ1Z0()::Bool
    return @checked(Lib.LineCodes_Get_IsZ1Z0()) != 0
end

"""Name of active LineCode (Getter)"""
function Name()::String
    return get_string(Lib.LineCodes_Get_Name())
end

"""Name of active LineCode (Setter)"""
function Name(Value::String)
    @checked Lib.LineCodes_Set_Name(Cstring(pointer(Value)))
end

function Next()::Int
    return @checked Lib.LineCodes_Get_Next()
end

"""Normal Ampere rating (Getter)"""
function NormAmps()::Float64
    return @checked Lib.LineCodes_Get_NormAmps()
end

"""Normal Ampere rating (Setter)"""
function NormAmps(Value::Float64)
    @checked Lib.LineCodes_Set_NormAmps(Value)
end

"""Number of Phases (Getter)"""
function Phases()::Int
    return @checked Lib.LineCodes_Get_Phases()
end

"""Number of Phases (Setter)"""
function Phases(Value::Int)
    @checked Lib.LineCodes_Set_Phases(Value)
end

"""Zero-Sequence Resistance, ohms per unit length (Getter)"""
function R0()::Float64
    return @checked Lib.LineCodes_Get_R0()
end

"""Zero-Sequence Resistance, ohms per unit length (Setter)"""
function R0(Value::Float64)
    @checked Lib.LineCodes_Set_R0(Value)
end

"""Positive-sequence resistance ohms per unit length (Getter)"""
function R1()::Float64
    return @checked Lib.LineCodes_Get_R1()
end

"""Positive-sequence resistance ohms per unit length (Setter)"""
function R1(Value::Float64)
    @checked Lib.LineCodes_Set_R1(Value)
end

"""Resistance matrix, ohms per unit length (Getter)"""
function Rmatrix()::Matrix{Float64}
    n = Phases()
    if n == 0
        rmatrix = reshape(Float64[], (0, 0))
    else
        rmatrix = reshape(get_float64_array(Lib.LineCodes_Get_Rmatrix), (n, n))
    end
    return rmatrix
end

"""Resistance matrix, ohms per unit length (Setter)"""
function Rmatrix(Value::Matrix{Float64})
    n = Phases()
    Rmatrix(Value[:])
end

"""Resistance matrix, ohms per unit length (Setter)"""
function Rmatrix(Value::Vector{Float64})
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked Lib.LineCodes_Set_Rmatrix(ValuePtr, ValueCount)
end

"""Units of Line Code (Getter)"""
function Units()::Lib.LineUnits
    return @checked Lib.LineCodes_Get_Units()
end

"""Units of Line Code (Setter)"""
function Units(Value::Union{Int,Lib.LineUnits})
    Value = convert(Lib.LineUnits, Value)
    @checked Lib.LineCodes_Set_Units(Value)
end

"""Zero Sequence Reactance, ohms per unit length (Getter)"""
function X0()::Float64
    return @checked Lib.LineCodes_Get_X0()
end

"""Zero Sequence Reactance, ohms per unit length (Setter)"""
function X0(Value::Float64)
    @checked Lib.LineCodes_Set_X0(Value)
end

"""Positive-sequence reactance, ohms per unit length (Getter)"""
function X1()::Float64
    return @checked Lib.LineCodes_Get_X1()
end

"""Positive-sequence reactance, ohms per unit length (Setter)"""
function X1(Value::Float64)
    @checked Lib.LineCodes_Set_X1(Value)
end

"""Reactance matrix, ohms per unit length (Getter)"""
function Xmatrix()::Matrix{Float64}
    n = Phases()
    if n == 0
        xmatrix = reshape(Float64[], (0, 0))
    else
        xmatrix = reshape(get_float64_array(Lib.LineCodes_Get_Xmatrix), (n, n))
    end
    return xmatrix
end

"""Reactance matrix, ohms per unit length (Setter)"""
function Xmatrix(Value::Matrix{Float64})
    n = Phases()
    Xmatrix(Value[:])
end

"""Reactance matrix, ohms per unit length (Setter)"""
function Xmatrix(Value::Vector{Float64})
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked Lib.LineCodes_Set_Xmatrix(ValuePtr, ValueCount)
end

"""Reactance matrix, ohms per unit length (Getter)"""
function Zmatrix()::Matrix{ComplexF64}
    zmatrix = Rmatrix() + im * Xmatrix()
    return zmatrix
end

"""Reactance matrix, ohms per unit length (Setter)"""
function Zmatrix(Value::Matrix{ComplexF64})
    r = real(Value)
    i = imag(Value)
    Rmatrix(r)
    Xmatrix(i)
end

end
