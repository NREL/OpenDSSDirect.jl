
init8500()

OpenDSSDirect.Text.Command("""
    redirect $(dirname(pathof(OpenDSSDirect)))/../examples/ckt5/Loadshapes_ckt5.dss
    solve
""")

@testset "LoadShape" begin

@test LoadShape.Count() == 4
@test LoadShape.First() == 1
@test LoadShape.Next() == 2
@test LoadShape.Npts() == 8760
@test LoadShape.Npts(LoadShape.Npts()) == nothing
@test LoadShape.Normalize() == nothing
@test LoadShape.UseActual() == 0
@test LoadShape.UseActual(LoadShape.UseActual()) == nothing
@test LoadShape.HrInterval() ≋ 1.0
@test LoadShape.HrInterval(LoadShape.HrInterval()) == nothing
@test LoadShape.MinInterval() ≋ 60.0
@test LoadShape.MinInterval(LoadShape.MinInterval()) == nothing
@test LoadShape.PBase() ≋ 0.0
@test LoadShape.PBase(LoadShape.PBase()) == nothing
@test LoadShape.QBase() ≋ 0.0
@test LoadShape.QBase(LoadShape.QBase()) == nothing
@test LoadShape.SInterval() ≋ 3600.0
@test LoadShape.SInterval(LoadShape.SInterval()) == nothing
@test LoadShape.Name() == "residential"
@test LoadShape.Name(LoadShape.Name()) == nothing
@test LoadShape.AllNames() == ["default","residential","commercial_sm","commercial_md"]
@test LoadShape.PMult()[end] ≋ 0.366545
# @test LoadShape.PMult(LoadShape.PMult())
@test LoadShape.QMult() ≋ [0.0]
# @test LoadShape.QMult(LoadShape.QMult())
@test LoadShape.TimeArray() ≋ [0.0]
# @test LoadShape.TimeArray(LoadShape.TimeArray())

end # testset

