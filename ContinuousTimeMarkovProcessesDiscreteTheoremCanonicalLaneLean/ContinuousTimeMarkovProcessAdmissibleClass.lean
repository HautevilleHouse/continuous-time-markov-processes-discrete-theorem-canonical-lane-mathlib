import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean

structure MarkovAdmittedObject where
  stateSpace : Type u
  discreteSet : Type v
  transitionRates : discreteSet → discreteSet → ℝ
  stationaryDist : discreteSet → ℝ
  initialDistribution : discreteSet → ℝ
  atMostCountable : Set discreteSet → Prop
  irreducible : Prop
  positiveRecurrent : Prop
  conclusion : stationaryDistPositive

structure MarkovAdmissibleClass where
  object : MarkovAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : MarkovAdmissibleClass) : Prop :=
  MarkovWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean
end HautevilleHouse
