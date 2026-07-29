import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean.TransitionKernel

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean

structure EmbeddedMarkovChainPackage {K : TransitionKernelPackage} where
  jumpTimes : List ℝ
  chainStates : List K.stateSpace
  holdingTimes : List ℝ
  discreteTransitionMatrix : K.stateSpace → K.stateSpace → ℝ
  jumpTimesCountable : Prop
  holdingTimesExponential : Prop
  transitionMatrixStochastic : Prop

structure EmbeddedMarkovChainEvidence {K : TransitionKernelPackage}
    (E : EmbeddedMarkovChainPackage K) where
  jumpTimesCountableClosed : E.jumpTimesCountable
  holdingTimesExponentialClosed : E.holdingTimesExponential
  transitionMatrixStochasticClosed : E.transitionMatrixStochastic

def EmbeddedMarkovChainClosed {K : TransitionKernelPackage}
    (E : EmbeddedMarkovChainPackage K) : Prop :=
  E.jumpTimesCountable ∧ E.holdingTimesExponential ∧ E.transitionMatrixStochastic

theorem embedded_markov_chain_closed_from_evidence
    {K : TransitionKernelPackage} (E : EmbeddedMarkovChainPackage K)
    (Ev : EmbeddedMarkovChainEvidence E) : EmbeddedMarkovChainClosed E := by
  exact And.intro Ev.jumpTimesCountableClosed
    (And.intro Ev.holdingTimesExponentialClosed Ev.transitionMatrixStochasticClosed)

end ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean
end HautevilleHouse