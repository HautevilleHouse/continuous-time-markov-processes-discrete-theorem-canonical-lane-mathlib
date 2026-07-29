import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean

structure JumpProcess (S : DiscreteStateSpace) (G : GeneratorMatrix S) where
  samplePath : ℝ≥0 → S.carrier
  cadlag : Prop
  jumpTimes : Set ℝ≥0
  holdingTimes : ℝ≥0 → ℝ≥0
  embeddedChain : ℕ → S.carrier
  holdingTimeDistribution : ∀ i, holdingTimes i ~ Exponential (-G.Q i i)
  jumpProbabilities : ∀ i j, i ≠ j → ℙ(embeddedChain (n+1) = j | embeddedChain n = i) = -G.Q i j / G.Q i i
  cadlagTerm : cadlag
  holdingTimeDistributionTerm : holdingTimeDistribution
  jumpProbabilitiesTerm : jumpProbabilities

structure JumpProcessEvidence {S : DiscreteStateSpace} {G : GeneratorMatrix S}
    (J : JumpProcess S G) where
  cadlagClosed : J.cadlag
  holdingTimeDistributionClosed : J.holdingTimeDistribution
  jumpProbabilitiesClosed : J.jumpProbabilities

def JumpProcessClosed {S : DiscreteStateSpace} {G : GeneratorMatrix S}
    (J : JumpProcess S G) : Prop :=
  J.cadlag ∧ J.holdingTimeDistribution ∧ J.jumpProbabilities

theorem jump_process_closed_from_evidence {S : DiscreteStateSpace}
    {G : GeneratorMatrix S} (J : JumpProcess S G)
    (E : JumpProcessEvidence J) : JumpProcessClosed J :=
  And.intro E.cadlagClosed
    (And.intro E.holdingTimeDistributionClosed E.jumpProbabilitiesClosed)

end ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean
end HautevilleHouse
