import ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean.KolmogorovForwardEquation

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean

structure StationaryDistributionPackage {A : MarkovAdmittedObject}
    (K : KolmogorovForwardEquationPackage A) where
  balancingEquations : Prop
  existenceAndUniqueness : Prop
  explicitFormula : discreteSet → ℝ
  convergenceRate : Prop

structure StationaryDistributionEvidence {A : MarkovAdmittedObject}
    {K : KolmogorovForwardEquationPackage A} (S : StationaryDistributionPackage K) where
  balancingEquationsClosed : S.balancingEquations
  existenceAndUniquenessClosed : S.existenceAndUniqueness
  convergenceRateClosed : S.convergenceRate

def StationaryDistributionClosed {A : MarkovAdmittedObject}
    {K : KolmogorovForwardEquationPackage A} (S : StationaryDistributionPackage K) : Prop :=
  S.balancingEquations ∧ S.existenceAndUniqueness ∧ S.convergenceRate

theorem stationary_distribution_closed_from_evidence
    {A : MarkovAdmittedObject} {K : KolmogorovForwardEquationPackage A}
    (S : StationaryDistributionPackage K) (E : StationaryDistributionEvidence S) :
    StationaryDistributionClosed S := by
  exact And.intro E.balancingEquationsClosed (And.intro E.existenceAndUniquenessClosed E.convergenceRateClosed)

end ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean
end HautevilleHouse
