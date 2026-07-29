import ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean.AdmissibleClass

/-!
# Generator and Kernel Package
-/

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean

structure GeneratorKernelPackage where
  stateSpace : Type u
  generator : stateSpace -> stateSpace -> ℝ
  kernel : stateSpace -> Set stateSpace -> ℝ
  conservative : Prop
  nonnegativeOffDiagonal : Prop
  zeroDiagonal : Prop

def StabilizationCondition (G : GeneratorKernelPackage) : Prop :=
  ∀ x : G.stateSpace, ∑' y : G.stateSpace, G.generator x y = 0

structure GeneratorKernelEvidence (G : GeneratorKernelPackage) where
  conservativeClosed : G.conservative
  nonnegativeOffDiagonalClosed : G.nonnegativeOffDiagonal
  zeroDiagonalClosed : G.zeroDiagonal
  stabilizationClosed : StabilizationCondition G

def GeneratorKernelClosed (G : GeneratorKernelPackage) : Prop :=
  G.conservative ∧ G.nonnegativeOffDiagonal ∧ G.zeroDiagonal ∧ StabilizationCondition G

theorem generator_kernel_closed_from_evidence (G : GeneratorKernelPackage)
    (E : GeneratorKernelEvidence G) : GeneratorKernelClosed G := by
  exact And.intro E.conservativeClosed (And.intro E.nonnegativeOffDiagonalClosed
    (And.intro E.zeroDiagonalClosed E.stabilizationClosed))

end ContinuousTimeMarkovProcessesDiscreteTheoremCanonicalLaneLean
end HautevilleHouse
