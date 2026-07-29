import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean

structure KolmogorovForwardEquation {S : DiscreteStateSpace} (G : GeneratorMatrix S) where
  semigroup : ℝ≥0 → (S.carrier → S.carrier → ℝ)
  semigroupProperty : ∀ t s, semigroup (t + s) = semigroup t ∘ₘ semigroup s
  identityAtZero : ∀ i j, semigroup 0 i j = if i = j then 1 else 0
  forwardEquation : ∀ t i j, ∂/∂t (semigroup t i j) = ∑' k, semigroup t i k * G.Q k j
  semigroupPropertyTerm : semigroupProperty
  identityAtZeroTerm : identityAtZero
  forwardEquationTerm : forwardEquation

structure KolmogorovForwardEvidence {S : DiscreteStateSpace}
    {G : GeneratorMatrix S} (K : KolmogorovForwardEquation G) where
  semigroupPropertyClosed : K.semigroupProperty
  identityAtZeroClosed : K.identityAtZero
  forwardEquationClosed : K.forwardEquation

def KolmogorovForwardClosed {S : DiscreteStateSpace}
    {G : GeneratorMatrix S} (K : KolmogorovForwardEquation G) : Prop :=
  K.semigroupProperty ∧ K.identityAtZero ∧ K.forwardEquation

theorem kolmogorov_forward_closed_from_evidence {S : DiscreteStateSpace}
    {G : GeneratorMatrix S} (K : KolmogorovForwardEquation G)
    (E : KolmogorovForwardEvidence K) : KolmogorovForwardClosed K :=
  And.intro E.semigroupPropertyClosed
    (And.intro E.identityAtZeroClosed E.forwardEquationClosed)

end ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean
end HautevilleHouse
