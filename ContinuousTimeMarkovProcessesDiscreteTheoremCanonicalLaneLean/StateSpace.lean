import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean

structure DiscreteStateSpace where
  carrier : Type u
  countable : Prop
  sigmaAlgebra : Set (Set carrier)
  sigmaAlgebraCountablyGenerated : Prop
  countableTerm : countable
  sigmaAlgebraTerm : sigmaAlgebraCountablyGenerated

structure StateSpaceEvidence (S : DiscreteStateSpace) where
  countableClosed : S.countable
  sigmaAlgebraClosed : S.sigmaAlgebraCountablyGenerated

def StateSpaceClosed (S : DiscreteStateSpace) : Prop :=
  S.countable ∧ S.sigmaAlgebraCountablyGenerated

theorem state_space_closed_from_evidence (S : DiscreteStateSpace)
    (E : StateSpaceEvidence S) : StateSpaceClosed S :=
  And.intro E.countableClosed E.sigmaAlgebraClosed

end ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean
end HautevilleHouse
