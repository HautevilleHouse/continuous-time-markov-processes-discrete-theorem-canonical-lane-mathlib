import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean

structure TransitionKernelPackage where
  stateSpace : Type u
  eventSpace : Type v
  kernelFunction : stateSpace → stateSpace → ℝ
  markovProperty : Prop
  stationaryDistribution : Prop
  ergodicity : Prop

structure TransitionKernelEvidence (K : TransitionKernelPackage) where
  markovPropertyClosed : K.markovProperty
  stationaryDistributionClosed : K.stationaryDistribution
  ergodicityClosed : K.ergodicity

def TransitionKernelClosed (K : TransitionKernelPackage) : Prop :=
  K.markovProperty ∧ K.stationaryDistribution ∧ K.ergodicity

theorem transition_kernel_closed_from_evidence (K : TransitionKernelPackage)
    (E : TransitionKernelEvidence K) : TransitionKernelClosed K := by
  exact And.intro E.markovPropertyClosed
    (And.intro E.stationaryDistributionClosed E.ergodicityClosed)

end ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean
end HautevilleHouse