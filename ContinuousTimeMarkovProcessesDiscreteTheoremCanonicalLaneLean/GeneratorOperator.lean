import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean.TransitionSemigroup

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean

structure GeneratorOperatorPackage {P : TransitionSemigroupPackage} where
  generatorDomain : Set (P.stateSpace → ℝ)
  generatorAction : (P.stateSpace → ℝ) → (P.stateSpace → ℝ)
  hilleYosidaConditions : Prop
  stronglyContinuous : Prop
  resolventFamily : Prop

structure GeneratorOperatorEvidence {P : TransitionSemigroupPackage}
    (G : GeneratorOperatorPackage P) where
  hilleYosidaConditionsClosed : G.hilleYosidaConditions
  stronglyContinuousClosed : G.stronglyContinuous

def GeneratorOperatorClosed {P : TransitionSemigroupPackage}
    (G : GeneratorOperatorPackage P) : Prop :=
  G.hilleYosidaConditions ∧ G.stronglyContinuous

theorem generator_operator_closed_from_evidence {P : TransitionSemigroupPackage}
    (G : GeneratorOperatorPackage P) (E : GeneratorOperatorEvidence G) :
    GeneratorOperatorClosed G := by
  exact And.intro E.hilleYosidaConditionsClosed E.stronglyContinuousClosed

end ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean
end HautevilleHouse