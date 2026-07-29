import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean.TransitionSemigroup

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean

structure GeneratorPackage {T : TransitionSemigroupPackage} where
  generatorMatrix : T.stateSpace → T.stateSpace → ℝ
  rowSumsZero : ∀ i, (∑' j, generatorMatrix i j) = 0
  nonnegativeOffDiagonal : ∀ i j, i ≠ j → generatorMatrix i j ≥ 0
  boundedness : Prop

structure GeneratorEvidence {T : TransitionSemigroupPackage} (G : GeneratorPackage T) where
  rowSumsZeroClosed : ∀ i, (∑' j, G.generatorMatrix i j) = 0
  nonnegativeOffDiagonalClosed : ∀ i j, i ≠ j → G.generatorMatrix i j ≥ 0
  boundednessClosed : G.boundedness

def GeneratorClosed {T : TransitionSemigroupPackage} (G : GeneratorPackage T) : Prop :=
  G.boundedness

theorem generator_closed_from_evidence {T : TransitionSemigroupPackage} (G : GeneratorPackage T)
    (E : GeneratorEvidence G) : GeneratorClosed G := by
  exact E.boundednessClosed

structure KolmogorovEmbeddingPackage {T : TransitionSemigroupPackage} (G : GeneratorPackage T) where
  backwardEquation : Prop
  forwardEquation : Prop
  uniqueness : Prop

structure KolmogorovEmbeddingEvidence {T : TransitionSemigroupPackage} {G : GeneratorPackage T}
    (K : KolmogorovEmbeddingPackage G) where
  backwardEquationClosed : K.backwardEquation
  forwardEquationClosed : K.forwardEquation
  uniquenessClosed : K.uniqueness

def KolmogorovEmbeddingClosed {T : TransitionSemigroupPackage} {G : GeneratorPackage T}
    (K : KolmogorovEmbeddingPackage G) : Prop :=
  K.backwardEquation ∧ K.forwardEquation ∧ K.uniqueness

theorem kolmogorov_embedding_closed_from_evidence {T : TransitionSemigroupPackage}
    {G : GeneratorPackage T} (K : KolmogorovEmbeddingPackage G)
    (E : KolmogorovEmbeddingEvidence K) : KolmogorovEmbeddingClosed K := by
  exact And.intro E.backwardEquationClosed (And.intro E.forwardEquationClosed E.uniquenessClosed)

end ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean
end HautevilleHouse