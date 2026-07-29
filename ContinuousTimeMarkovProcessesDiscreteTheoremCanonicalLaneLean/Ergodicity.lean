import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean

structure Ergodicity {S : DiscreteStateSpace} {G : GeneratorMatrix S}
    (K : KolmogorovForwardEquation G) where
  stationaryDistribution : S.carrier → ℝ
  stationaryDistributionNonnegative : ∀ i, stationaryDistribution i ≥ 0
  sumToOne : ∑' i, stationaryDistribution i = 1
  stationarity : ∀ t i, ∑' j, stationaryDistribution j * K.semigroup t j i = stationaryDistribution i
  uniqueness : Prop
  convergenceToStationary : ∀ i j, lim_{t→∞} K.semigroup t i j = stationaryDistribution j
  stationaryDistributionNonnegativeTerm : stationaryDistributionNonnegative
  sumToOneTerm : sumToOne
  stationarityTerm : stationarity
  uniquenessTerm : uniqueness
  convergenceTerm : convergenceToStationary

structure ErgodicityEvidence {S : DiscreteStateSpace} {G : GeneratorMatrix S}
    {K : KolmogorovForwardEquation G} (E : Ergodicity K) where
  stationaryDistributionNonnegativeClosed : E.stationaryDistributionNonnegative
  sumToOneClosed : E.sumToOne
  stationarityClosed : E.stationarity
  uniquenessClosed : E.uniqueness
  convergenceClosed : E.convergenceToStationary

def ErgodicityClosed {S : DiscreteStateSpace} {G : GeneratorMatrix S}
    {K : KolmogorovForwardEquation G} (E : Ergodicity K) : Prop :=
  E.stationaryDistributionNonnegative ∧ E.sumToOne ∧
  E.stationarity ∧ E.uniqueness ∧ E.convergenceToStationary

theorem ergodicity_closed_from_evidence {S : DiscreteStateSpace}
    {G : GeneratorMatrix S} {K : KolmogorovForwardEquation G}
    (E : Ergodicity K) (Ev : ErgodicityEvidence E) : ErgodicityClosed E :=
  And.intro Ev.stationaryDistributionNonnegativeClosed
    (And.intro Ev.sumToOneClosed
      (And.intro Ev.stationarityClosed
        (And.intro Ev.uniquenessClosed Ev.convergenceClosed)))

end ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean
end HautevilleHouse
