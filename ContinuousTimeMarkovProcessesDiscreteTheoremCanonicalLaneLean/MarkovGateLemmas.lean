import ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean.MarkovBridgeLemmas

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean

def gateClosed (A : MarkovAdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : MarkovAdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean
end HautevilleHouse
