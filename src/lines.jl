module Lines

    using ..lib
    using ..utils

    function New(Name)
        return lib.Lines_New(Cstring(pointer(Name)))
    end

    """(read-only) Names of all Line Objects"""
    function AllNames()
        return get_string_array(lib.Lines_Get_AllNames)
    end

    """Name of bus for terminal 1."""
    function Bus1()
        return get_string(lib.Lines_Get_Bus1())
    end

    """Name of bus for terminal 1."""
    function Bus1(Value)
        lib.Lines_Set_Bus1(Cstring(pointer(Value)))
    end

    """Name of bus for terminal 2."""
    function Bus2()
        return get_string(lib.Lines_Get_Bus2())
    end

    """Name of bus for terminal 2."""
    function Bus2(Value)
        lib.Lines_Set_Bus2(Cstring(pointer(Value)))
    end

    """Zero Sequence capacitance, nanofarads per unit length."""
    function C0()
        return lib.Lines_Get_C0()
    end

    """Zero Sequence capacitance, nanofarads per unit length."""
    function C0(Value)
        lib.Lines_Set_C0(Cstring(pointer(Value)))
    end

    """Positive Sequence capacitance, nanofarads per unit length."""
    function C1()
        return lib.Lines_Get_C1()
    end

    """Positive Sequence capacitance, nanofarads per unit length."""
    function C1(Value)
        lib.Lines_Set_C1(Value)
    end

    function CMatrix()
        return get_float64_array(lib.Lines_Get_Cmatrix)
    end

    function CMatrix(Value)
        Value, ValuePtr, ValueCount = prepare_float64_array(Value)
        lib.Lines_Set_Cmatrix(ValuePtr, ValueCount)
    end

    """(read-only) Number of Line objects in Active Circuit."""
    function Count()
        return lib.Lines_Get_Count()
    end

    """Emergency (maximum) ampere rating of Line."""
    function EmergAmps()
        return lib.Lines_Get_EmergAmps()
    end

    """Emergency (maximum) ampere rating of Line."""
    function EmergAmps(Value)
        lib.Lines_Set_EmergAmps(Value)
    end

    """(read-only) Invoking this property sets the first element active.  Returns 0 if no lines.  Otherwise, index of the line element."""
    function First()
        return lib.Lines_Get_First()
    end

    """Line geometry code"""
    function Geometry()
        return get_string(lib.Lines_Get_Geometry())
    end

    """Line geometry code"""
    function Geometry(Value)
        lib.Lines_Set_Geometry(Cstring(pointer(Value)))
    end

    """Length of line section in units compatible with the LineCode definition."""
    function Length()
        return lib.Lines_Get_Length()
    end

    """Length of line section in units compatible with the LineCode definition."""
    function Length(Value)
        lib.Lines_Set_Length(Value)
    end

    """Name of LineCode object that defines the impedances."""
    function LineCode()
        return get_string(lib.Lines_Get_LineCode())
    end

    """Name of LineCode object that defines the impedances."""
    function LineCode()
        lib.Lines_Set_LineCode(Cstring(pointer(Value)))
    end

    """Specify the name of the Line element to set it active."""
    function Name()
        return get_string(lib.Lines_Get_Name())
    end

    """Specify the name of the Line element to set it active."""
    function Name()
        lib.Lines_Set_Name(Cstring(pointer(Value)))
    end

    """(read-only) Invoking this property advances to the next Line element active.  Returns 0 if no more lines.  Otherwise, index of the line element."""
    function Next()
        return lib.Lines_Get_Next()
    end

    """Normal ampere rating of Line."""
    function NormAmps()
        return lib.Lines_Get_NormAmps()
    end

    """Normal ampere rating of Line."""
    function NormAmps(Value)
        lib.Lines_Set_NormAmps(Value)
    end

    """(read-only) Number of customers on this line section."""
    function NumCust()
        return lib.Lines_Get_NumCust()
    end

    """(read-only) Sets Parent of the active Line to be the active line. Returns 0 if no parent or action fails."""
    function Parent()
        return lib.Lines_Get_Parent()
    end

    """Number of Phases, this Line element."""
    function Phases()
        return lib.Lines_Get_Phases()
    end

    """Number of Phases, this Line element."""
    function Phases(Value)
        lib.Lines_Set_Phases(Value)
    end

    """Zero Sequence resistance, ohms per unit length."""
    function R0()
        return lib.Lines_Get_R0()
    end

    """Zero Sequence resistance, ohms per unit length."""
    function R0(Value)
        lib.Lines_Set_R0(Value)
    end

    """Positive Sequence resistance, ohms per unit length."""
    function R1()
        return lib.Lines_Get_R1()
    end

    """Positive Sequence resistance, ohms per unit length."""
    function R1(Value)
        lib.Lines_Set_R1(Value)
    end

    """Earth return resistance value used to compute line impedances at power frequency"""
    function Rg()
        return lib.Lines_Get_Rg()
    end

    """Earth return resistance value used to compute line impedances at power frequency"""
    function Rg(Value)
        lib.Lines_Set_Rg(Value)
    end

    """Earth Resistivity, m-ohms"""
    function Rho()
        return lib.Lines_Get_Rho()
    end

    """Earth Resistivity, m-ohms"""
    function Rho(Value)
        lib.Lines_Set_Rho(Value)
    end

    """Resistance matrix (full), ohms per unit length. Array of doubles."""
    function RMatrix()
        return get_float64_array(lib.Lines_Get_Rmatrix)

    """Resistance matrix (full), ohms per unit length. Array of doubles."""
    function RMatrix(Value)
        Value, ValuePtr, ValueCount = prepare_float64_array(Value)
        lib.Lines_Set_Rmatrix(ValuePtr, ValueCount)
    end

    """Line spacing code"""
    function Spacing()
        return get_string(lib.Lines_Get_Spacing())
    end

    """Line spacing code"""
    function Spacing()
        lib.Lines_Set_Spacing(Cstring(pointer(Value)))
    end

    """(read-only) Total Number of customers served from this line section."""
    function TotalCust()
        return lib.Lines_Get_TotalCust()
    end

    function Units()
        return lib.Lines_Get_Units()
    end

    function Units(Value)
        lib.Lines_Set_Units(Value)
    end

    """Zero Sequence reactance ohms per unit length."""
    function X0()
        return lib.Lines_Get_X0()
    end

    """Zero Sequence reactance ohms per unit length."""
    function X0(Value)
        lib.Lines_Set_X0(Value)
    end

    """Positive Sequence reactance, ohms per unit length."""
    function X1()
        return lib.Lines_Get_X1()
    end

    """Positive Sequence reactance, ohms per unit length."""
    function X1(Value)
        lib.Lines_Set_X1(Value)
    end

    """Earth return reactance value used to compute line impedances at power frequency"""
    function Xg()
        return lib.Lines_Get_Xg()
    end

    """Earth return reactance value used to compute line impedances at power frequency"""
    function Xg(Value)
        lib.Lines_Set_Xg(Value)
    end

    function XMatrix()
        return get_float64_array(lib.Lines_Get_Xmatrix)
    end

    function XMatrix(Value)
        Value, ValuePtr, ValueCount = prepare_float64_array(Value)
        lib.Lines_Set_Xmatrix(ValuePtr, ValueCount)
    end

    """Yprimitive: Does Nothing at present on Put; Dangerous"""
    function Yprim()
        return get_float64_array(lib.Lines_Get_Yprim)
    end

    """Yprimitive: Does Nothing at present on Put; Dangerous"""
    function Yprim(Value)
        Value, ValuePtr, ValueCount = prepare_float64_array(Value)
        lib.Lines_Set_Yprim(ValuePtr, ValueCount)
    end

end

