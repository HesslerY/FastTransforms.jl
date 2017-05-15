__precompile__()
module FastTransforms

using Base, ToeplitzMatrices, HierarchicalMatrices, LowRankApprox, ProgressMeter, Compat

import Base: *, \, size, view, A_mul_B!, At_mul_B!, Ac_mul_B!
import Base: getindex, setindex!, Factorization, length
import Base.LinAlg: BlasFloat, BlasInt
import HierarchicalMatrices: HierarchicalMatrix, unsafe_broadcasttimes!
import LowRankApprox: ColPerm

export cjt, icjt, jjt, plan_cjt, plan_icjt
export leg2cheb, cheb2leg, leg2chebu, ultra2ultra, jac2jac
export normleg2cheb, cheb2normleg, normleg12cheb2, cheb22normleg1
export plan_leg2cheb, plan_cheb2leg
export plan_normleg2cheb, plan_cheb2normleg
export plan_normleg12cheb2, plan_cheb22normleg1
export gaunt
export paduatransform, ipaduatransform, paduatransform!, ipaduatransform!, paduapoints
export plan_paduatransform!, plan_ipaduatransform!

export SlowSphericalHarmonicPlan, FastSphericalHarmonicPlan, ThinSphericalHarmonicPlan
export sph2fourier, fourier2sph, plan_sph2fourier

# Other module methods and constants:
#export ChebyshevJacobiPlan, jac2cheb, cheb2jac
#export sqrtpi, pochhammer, stirlingseries, stirlingremainder, Aratio, Cratio, Anαβ
#export Cnmαβ, Cnαβ, Cnmλ, Cnλ, Λ, absf, findmindices!
#export clenshawcurtis, clenshawcurtis_plan, clenshawcurtisweights
#export fejer1, fejer_plan1, fejerweights1
#export fejer2, fejer_plan2, fejerweights2
#export RecurrencePlan, forward_recurrence!, backward_recurrence

include("fftBigFloat.jl")
include("specialfunctions.jl")
include("clenshawcurtis.jl")
include("fejer.jl")
include("recurrence.jl")
include("PaduaTransform.jl")

@compat abstract type FastTransformPlan{D,T} end

include("ChebyshevJacobiPlan.jl")
include("jac2cheb.jl")
include("cheb2jac.jl")

include("ChebyshevUltrasphericalPlan.jl")
include("ultra2cheb.jl")
include("cheb2ultra.jl")

include("cjt.jl")

include("toeplitzhankel.jl")

#leg2cheb(x...)=th_leg2cheb(x...)
#cheb2leg(x...)=th_cheb2leg(x...)
leg2chebu(x...)=th_leg2chebu(x...)
ultra2ultra(x...)=th_ultra2ultra(x...)
jac2jac(x...)=th_jac2jac(x...)

include("hierarchical.jl")
include("SphericalHarmonics/SphericalHarmonics.jl")

include("gaunt.jl")


include("precompile.jl")
_precompile_()

end # module
