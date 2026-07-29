import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean.JumpProcessDiscretization

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean

structure SkorokhodTopologyPackage {K : TransitionKernelPackage}
    {Eq : KolgomorovEquationsPackage K}
    {J : JumpProcessDiscretizationPackage K Eq} where
  skorokhodSpace : Type u
  skorokhodMetric : skorokhodSpace → skorokhodSpace → ℝ
  cadlagPathEmbedding : Prop
  tightnessCondition : Prop
  convergenceImpliesWeakConvergence : Prop
  spaceComplete : Prop
  spaceSeparable : Prop
  embeddingContinuous : Prop

structure SkorokhodTopologyEvidence {K : TransitionKernelPackage}
    {Eq : KolgomorovEquationsPackage K}
    {J : JumpProcessDiscretizationPackage K Eq}
    (S : SkorokhodTopologyPackage K Eq J) where
  cadlagPathEmbeddingClosed : S.cadlagPathEmbedding
  tightnessConditionClosed : S.tightnessCondition
  convergenceImpliesWeakConvergenceClosed : S.convergenceImpliesWeakConvergence
  spaceCompleteClosed : S.spaceComplete
  spaceSeparableClosed : S.spaceSeparable

def SkorokhodTopologyClosed {K : TransitionKernelPackage}
    {Eq : KolgomorovEquationsPackage K}
    {J : JumpProcessDiscretizationPackage K Eq}
    (S : SkorokhodTopologyPackage K Eq J) : Prop :=
  S.cadlagPathEmbedding ∧ S.tightnessCondition ∧
  S.convergenceImpliesWeakConvergence ∧ S.spaceComplete ∧ S.spaceSeparable

theorem skorokhod_topology_closed_from_evidence
    {K : TransitionKernelPackage} {Eq : KolgomorovEquationsPackage K}
    {J : JumpProcessDiscretizationPackage K Eq}
    (S : SkorokhodTopologyPackage K Eq J)
    (Ev : SkorokhodTopologyEvidence S) : SkorokhodTopologyClosed S := by
  exact And.intro Ev.cadlagPathEmbeddingClosed
    (And.intro Ev.tightnessConditionClosed
      (And.intro Ev.convergenceImpliesWeakConvergenceClosed
        (And.intro Ev.spaceCompleteClosed Ev.spaceSeparableClosed)))

end ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean
end HautevilleHouse