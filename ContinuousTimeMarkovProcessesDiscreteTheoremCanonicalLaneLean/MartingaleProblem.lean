import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean.GeneratorOperator

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean

structure MartingaleProblemPackage {P : TransitionSemigroupPackage}
    {G : GeneratorOperatorPackage P} where
  lawProcess : Type u
  martingaleCondition : Prop
  uniquenessOfSolutions : Prop
  wellposedness : Prop

structure MartingaleProblemEvidence {P : TransitionSemigroupPackage}
    {G : GeneratorOperatorPackage P} (M : MartingaleProblemPackage P G) where
  martingaleConditionClosed : M.martingaleCondition
  uniquenessOfSolutionsClosed : M.uniquenessOfSolutions
  wellposednessClosed : M.wellposedness

def MartingaleProblemClosed {P : TransitionSemigroupPackage}
    {G : GeneratorOperatorPackage P} (M : MartingaleProblemPackage P G) : Prop :=
  M.martingaleCondition ∧ M.uniquenessOfSolutions ∧ M.wellposedness

theorem martingale_problem_closed_from_evidence {P : TransitionSemigroupPackage}
    {G : GeneratorOperatorPackage P} (M : MartingaleProblemPackage P G)
    (E : MartingaleProblemEvidence M) : MartingaleProblemClosed M := by
  exact And.intro E.martingaleConditionClosed
    (And.intro E.uniquenessOfSolutionsClosed E.wellposednessClosed)

end ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean
end HautevilleHouse