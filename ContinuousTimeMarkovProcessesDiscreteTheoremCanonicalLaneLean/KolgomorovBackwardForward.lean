import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean.TransitionKernel

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean

structure KolgomorovEquationsPackage {K : TransitionKernelPackage} where
  backwardEquation : Prop
  forwardEquation : Prop
  generatorMatrix : K.stateSpace → K.stateSpace → ℝ
  generatorConsistency : Prop
  jumpRates : K.stateSpace → ℝ
  backwardEquationSolutions : Prop
  forwardEquationSolutions : Prop

structure KolgomorovEquationsEvidence {K : TransitionKernelPackage}
    (Eq : KolgomorovEquationsPackage K) where
  backwardEquationClosed : Eq.backwardEquation
  forwardEquationClosed : Eq.forwardEquation
  generatorConsistencyClosed : Eq.generatorConsistency
  backwardEquationSolutionsClosed : Eq.backwardEquationSolutions
  forwardEquationSolutionsClosed : Eq.forwardEquationSolutions

def KolgomorovEquationsClosed {K : TransitionKernelPackage}
    (Eq : KolgomorovEquationsPackage K) : Prop :=
  Eq.backwardEquation ∧ Eq.forwardEquation ∧ Eq.generatorConsistency ∧
  Eq.backwardEquationSolutions ∧ Eq.forwardEquationSolutions

theorem kolgomorov_equations_closed_from_evidence
    {K : TransitionKernelPackage} (Eq : KolgomorovEquationsPackage K)
    (Ev : KolgomorovEquationsEvidence Eq) : KolgomorovEquationsClosed Eq := by
  exact And.intro Ev.backwardEquationClosed
    (And.intro Ev.forwardEquationClosed
      (And.intro Ev.generatorConsistencyClosed
        (And.intro Ev.backwardEquationSolutionsClosed
          Ev.forwardEquationSolutionsClosed)))

end ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean
end HautevilleHouse