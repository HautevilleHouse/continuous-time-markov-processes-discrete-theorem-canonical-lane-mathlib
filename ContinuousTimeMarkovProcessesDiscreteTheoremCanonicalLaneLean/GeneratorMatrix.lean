import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean

structure GeneratorMatrix (S : DiscreteStateSpace) where
  Q : S.carrier → S.carrier → ℝ
  offDiagonalNonnegative : ∀ i j, i ≠ j → Q i j ≥ 0
  rowSumZero : ∀ i, (∑' j, Q i j) = 0
  stable : ∀ i, -Q i i < ∞
  offDiagonalNonnegativeTerm : offDiagonalNonnegative
  rowSumZeroTerm : rowSumZero
  stableTerm : stable

structure GeneratorMatrixEvidence {S : DiscreteStateSpace} (G : GeneratorMatrix S) where
  offDiagonalNonnegativeClosed : G.offDiagonalNonnegative
  rowSumZeroClosed : G.rowSumZero
  stableClosed : G.stable

def GeneratorMatrixClosed {S : DiscreteStateSpace} (G : GeneratorMatrix S) : Prop :=
  G.offDiagonalNonnegative ∧ G.rowSumZero ∧ G.stable

theorem generator_matrix_closed_from_evidence {S : DiscreteStateSpace}
    (G : GeneratorMatrix S) (E : GeneratorMatrixEvidence G) :
    GeneratorMatrixClosed G :=
  And.intro E.offDiagonalNonnegativeClosed
    (And.intro E.rowSumZeroClosed E.stableClosed)

end ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean
end HautevilleHouse
