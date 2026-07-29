import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean.KolgomorovBackwardForward

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean

structure JumpProcessDiscretizationPackage {K : TransitionKernelPackage}
    {Eq : KolgomorovEquationsPackage K} where
  embeddingConstruction : EmbeddedMarkovChainPackage K
  uniformization : Prop
  skeletonProcess : Prop
  weakConvergence : Prop
  discreteApproximationRefinement : Prop
  errorBound : ℝ
  errorBoundPositive : errorBound > 0

structure JumpProcessDiscretizationEvidence {K : TransitionKernelPackage}
    {Eq : KolgomorovEquationsPackage K}
    (J : JumpProcessDiscretizationPackage K Eq) where
  uniformizationClosed : J.uniformization
  skeletonProcessClosed : J.skeletonProcess
  weakConvergenceClosed : J.weakConvergence
  discreteApproximationRefinementClosed : J.discreteApproximationRefinement

def JumpProcessDiscretizationClosed {K : TransitionKernelPackage}
    {Eq : KolgomorovEquationsPackage K}
    (J : JumpProcessDiscretizationPackage K Eq) : Prop :=
  J.uniformization ∧ J.skeletonProcess ∧ J.weakConvergence ∧
  J.discreteApproximationRefinement

theorem jump_process_discretization_closed_from_evidence
    {K : TransitionKernelPackage} {Eq : KolgomorovEquationsPackage K}
    (J : JumpProcessDiscretizationPackage K Eq)
    (Ev : JumpProcessDiscretizationEvidence J) : JumpProcessDiscretizationClosed J := by
  exact And.intro Ev.uniformizationClosed
    (And.intro Ev.skeletonProcessClosed
      (And.intro Ev.weakConvergenceClosed Ev.discreteApproximationRefinementClosed))

end ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean
end HautevilleHouse