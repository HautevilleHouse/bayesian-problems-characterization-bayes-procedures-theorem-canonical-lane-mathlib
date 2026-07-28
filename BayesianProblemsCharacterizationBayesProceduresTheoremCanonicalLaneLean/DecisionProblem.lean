import HautevilleHouse.BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean.BayesianObjects

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean

structure DecisionProblem where
  stateSpace : BayesianState
  actionSpace : Type
  lossFunction : (stateSpace.carrier → actionSpace → ℝ) → ℝ
  prior : (stateSpace.carrier → ℝ) → ℝ
  admissibleDecisionFunctions : Set (stateSpace.carrier → actionSpace)
  bayesProcedures : Set (stateSpace.carrier → actionSpace)

structure DecisionProblemEvidence (D : DecisionProblem) where
  admissibleClosed : D.bayesProcedures ⊆ D.admissibleDecisionFunctions
  bayesProceduresNonempty : D.bayesProcedures.Nonempty

def DecisionProblemClosed (D : DecisionProblem) : Prop :=
  D.bayesProcedures ⊆ D.admissibleDecisionFunctions ∧ D.bayesProcedures.Nonempty

theorem decision_problem_closed_from_evidence (D : DecisionProblem) (E : DecisionProblemEvidence D) :
    DecisionProblemClosed D := by
  exact And.intro E.admissibleClosed E.bayesProceduresNonempty

end BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean
end HautevilleHouse