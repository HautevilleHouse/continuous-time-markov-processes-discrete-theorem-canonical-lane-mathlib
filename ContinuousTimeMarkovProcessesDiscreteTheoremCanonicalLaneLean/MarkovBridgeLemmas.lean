import ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean.MarkovProjection

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean

def bridgeClosed (A : MarkovAdmissibleClass) : Prop :=
  MarkovWitnessClosed A.object

theorem bridge_from_admissible_class (A : MarkovAdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean
end HautevilleHouse
