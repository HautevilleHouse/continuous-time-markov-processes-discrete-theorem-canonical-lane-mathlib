import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean.TransitionSemigroup
import HautevilleHouse.ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean.GeneratorAndEmbedding

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean

structure JumpProcessPackage {T : TransitionSemigroupPackage} {G : GeneratorPackage T}
    (K : KolmogorovEmbeddingPackage G) where
  samplePath : Type u
  cadlagProperty : Prop
  markovProperty : Prop
  strongMarkovProperty : Prop

structure JumpProcessEvidence {T : TransitionSemigroupPackage} {G : GeneratorPackage T}
    {K : KolmogorovEmbeddingPackage G} (J : JumpProcessPackage K) where
  cadlagPropertyClosed : J.cadlagProperty
  markovPropertyClosed : J.markovProperty
  strongMarkovPropertyClosed : J.strongMarkovProperty

def JumpProcessClosed {T : TransitionSemigroupPackage} {G : GeneratorPackage T}
    {K : KolmogorovEmbeddingPackage G} (J : JumpProcessPackage K) : Prop :=
  J.cadlagProperty ∧ J.markovProperty ∧ J.strongMarkovProperty

theorem jump_process_closed_from_evidence {T : TransitionSemigroupPackage}
    {G : GeneratorPackage T} {K : KolmogorovEmbeddingPackage G}
    (J : JumpProcessPackage K) (E : JumpProcessEvidence J) : JumpProcessClosed J := by
  exact And.intro E.cadlagPropertyClosed (And.intro E.markovPropertyClosed E.strongMarkovPropertyClosed)

structure ConvergencePackage {T : TransitionSemigroupPackage} {G : GeneratorPackage T}
    {K : KolmogorovEmbeddingPackage G} {J : JumpProcessPackage K} where
  ergodicTheorem : Prop
  stationaryDistribution : Prop
  rateOfConvergence : Prop

structure ConvergenceEvidence {T : TransitionSemigroupPackage} {G : GeneratorPackage T}
    {K : KolmogorovEmbeddingPackage G} {J : JumpProcessPackage K}
    (C : ConvergencePackage J) where
  ergodicTheoremClosed : C.ergodicTheorem
  stationaryDistributionClosed : C.stationaryDistribution
  rateOfConvergenceClosed : C.rateOfConvergence

def ConvergenceClosed {T : TransitionSemigroupPackage} {G : GeneratorPackage T}
    {K : KolmogorovEmbeddingPackage G} {J : JumpProcessPackage K}
    (C : ConvergencePackage J) : Prop :=
  C.ergodicTheorem ∧ C.stationaryDistribution ∧ C.rateOfConvergence

theorem convergence_closed_from_evidence {T : TransitionSemigroupPackage}
    {G : GeneratorPackage T} {K : KolmogorovEmbeddingPackage G}
    {J : JumpProcessPackage K} (C : ConvergencePackage J)
    (E : ConvergenceEvidence C) : ConvergenceClosed C := by
  exact And.intro E.ergodicTheoremClosed (And.intro E.stationaryDistributionClosed E.rateOfConvergenceClosed)

end ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean
end HautevilleHouse