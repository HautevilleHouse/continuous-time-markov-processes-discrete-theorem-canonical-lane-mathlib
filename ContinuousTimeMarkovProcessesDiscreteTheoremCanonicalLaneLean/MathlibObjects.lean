import ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic
import Mathlib.Probability.Process

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure CTMCPStateSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure CTMCPAdmittedObject where
  stateSpace : CTMCPStateSpace
  markovKernel : Type
  generatorMatrix : carrier -> carrier -> ℝ
  embeddedChain : ℕ -> carrier
  jumpTimes : ℕ -> ℝ
  transitionSemiGroup : Type
  discreteFinite : Prop
  strongMarkov : Prop
  conclusion : discreteFinite ∧ strongMarkov

structure CTMCPEndgameState where
  object : CTMCPAdmittedObject

def CTMCPWitnessClosed (O : CTMCPAdmittedObject) : Prop :=
  O.discreteFinite ∧ O.strongMarkov

end ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean
end HautevilleHouse
