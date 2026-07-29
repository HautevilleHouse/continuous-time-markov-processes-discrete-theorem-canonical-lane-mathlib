import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean

structure CTMPSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure CTMPAdmittedObject where
  space : CTMPSpace
  continuousTimeMarkovProcess : Prop
  discreteStateSpace : Prop
  stationaryDistribution : Prop
  convergenceResult : Prop
  conclusion : convergenceResult

def CTMPWitnessClosed (O : CTMPAdmittedObject) : Prop :=
  O.convergenceResult

end ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean
end HautevilleHouse