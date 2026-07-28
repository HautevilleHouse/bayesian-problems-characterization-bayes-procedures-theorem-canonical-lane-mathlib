import HautevilleHouse.BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean.PriorLoss

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean

structure BayesProcedure (D : DecisionProblem) (P : Prior D) (L : LossFunction D) where
  decisionFunction : D.stateSpace.carrier → D.actionSpace
  expectedLoss : ℝ
  minimizesPosteriorRisk : Prop
  admissible : Prop

structure BayesProcedureEvidence {D : DecisionProblem} {P : Prior D} {L : LossFunction D} (B : BayesProcedure D P L) where
  minimizesPosteriorRiskClosed : B.minimizesPosteriorRisk
  admissibleClosed : B.admissible

def BayesProcedureClosed {D : DecisionProblem} {P : Prior D} {L : LossFunction D} (B : BayesProcedure D P L) : Prop :=
  B.minimizesPosteriorRisk ∧ B.admissible

theorem bayes_procedure_closed_from_evidence {D : DecisionProblem} {P : Prior D} {L : LossFunction D}
    (B : BayesProcedure D P L) (E : BayesProcedureEvidence B) : BayesProcedureClosed B := by
  exact And.intro E.minimizesPosteriorRiskClosed E.admissibleClosed

end BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean
end HautevilleHouse