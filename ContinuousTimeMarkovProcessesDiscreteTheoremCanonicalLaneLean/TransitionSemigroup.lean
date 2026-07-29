import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean

structure TransitionSemigroupPackage where
  stateSpace : Type u
  stateTopology : TopologicalSpace stateSpace
  countableState : Prop
  semigroupFamily : ℕ → (stateSpace → stateSpace → ℝ)
  chapmanKolmogorov : Prop
  measurability : Prop

structure TransitionSemigroupEvidence (T : TransitionSemigroupPackage) where
  chapmanKolmogorovClosed : T.chapmanKolmogorov
  measurabilityClosed : T.measurability

def TransitionSemigroupClosed (T : TransitionSemigroupPackage) : Prop :=
  T.chapmanKolmogorov ∧ T.measurability

theorem transition_semigroup_closed_from_evidence (T : TransitionSemigroupPackage)
    (E : TransitionSemigroupEvidence T) : TransitionSemigroupClosed T := by
  exact And.intro E.chapmanKolmogorovClosed E.measurabilityClosed

end ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean
end HautevilleHouse