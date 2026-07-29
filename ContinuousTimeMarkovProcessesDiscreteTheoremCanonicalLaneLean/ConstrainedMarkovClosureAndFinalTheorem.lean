import ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean.MarkovGateLemmas

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean

def ConstrainedMarkovClosure (A : MarkovAdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_markov_endgame (A : MarkovAdmissibleClass) :
    ConstrainedMarkovClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean
end HautevilleHouse
