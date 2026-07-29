import ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean.AdmissibleClass

/-!
# Embedded Jump Chain Package
-/

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean

structure EmbeddedChainPackage (G : GeneratorKernelPackage) where
  stateSpace : Type u
  transitionMatrix : stateSpace -> stateSpace -> ℝ
  embeddedChain : ℕ -> stateSpace
  jumpHoldingTimes : ℕ -> ℝ
  regular : Prop
  nonexplosive : Prop

def ChainRegular (C : EmbeddedChainPackage G) : Prop :=
  ∀ i : ℕ, C.embeddedChain i = C.embeddedChain (i+1) →
    C.jumpHoldingTimes (i+1) - C.jumpHoldingTimes i = ∞

structure EmbeddedChainEvidence (G : GeneratorKernelPackage)
    (C : EmbeddedChainPackage G) where
  regularClosed : C.regular
  nonexplosiveClosed : C.nonexplosive

def EmbeddedChainClosed (G : GeneratorKernelPackage)
    (C : EmbeddedChainPackage G) : Prop :=
  C.regular ∧ C.nonexplosive

theorem embedded_chain_closed_from_evidence (G : GeneratorKernelPackage)
    (C : EmbeddedChainPackage G) (E : EmbeddedChainEvidence G C) :
    EmbeddedChainClosed G C := by
  exact And.intro E.regularClosed E.nonexplosiveClosed

end ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean
end HautevilleHouse
