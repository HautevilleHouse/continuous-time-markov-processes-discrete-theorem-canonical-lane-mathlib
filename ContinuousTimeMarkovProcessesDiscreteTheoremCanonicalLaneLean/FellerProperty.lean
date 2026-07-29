import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean.TransitionSemigroup

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean

structure FellerPropertyPackage {P : TransitionSemigroupPackage} where
  mapsContinuousFunctionsToContinuous : Prop
  stronglyContinuousSemigroup : Prop
  conservativeProperty : Prop

structure FellerPropertyEvidence {P : TransitionSemigroupPackage}
    (F : FellerPropertyPackage P) where
  mapsContinuousFunctionsToContinuousClosed : F.mapsContinuousFunctionsToContinuous
  stronglyContinuousSemigroupClosed : F.stronglyContinuousSemigroup
  conservativePropertyClosed : F.conservativeProperty

def FellerPropertyClosed {P : TransitionSemigroupPackage}
    (F : FellerPropertyPackage P) : Prop :=
  F.mapsContinuousFunctionsToContinuous ∧ F.stronglyContinuousSemigroup ∧ F.conservativeProperty

theorem feller_property_closed_from_evidence {P : TransitionSemigroupPackage}
    (F : FellerPropertyPackage P) (E : FellerPropertyEvidence F) :
    FellerPropertyClosed F := by
  exact And.intro E.mapsContinuousFunctionsToContinuousClosed
    (And.intro E.stronglyContinuousSemigroupClosed E.conservativePropertyClosed)

end ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean
end HautevilleHouse