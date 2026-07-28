import HautevilleHouse.BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean.DecisionProblem

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean

structure Prior (D : DecisionProblem) where
  priorFunction : (D.stateSpace.carrier → ℝ) → ℝ
  proper : Prop
  finite : Prop

structure PriorEvidence {D : DecisionProblem} (P : Prior D) where
  properClosed : P.proper
  finiteClosed : P.finite

def PriorClosed {D : DecisionProblem} (P : Prior D) : Prop :=
  P.proper ∧ P.finite

theorem prior_closed_from_evidence {D : DecisionProblem} (P : Prior D) (E : PriorEvidence P) :
    PriorClosed P := by
  exact And.intro E.properClosed E.finiteClosed

structure LossFunction (D : DecisionProblem) where
  lossFunction : D.stateSpace.carrier → D.actionSpace → ℝ
  boundedBelow : Prop
  integrable : Prop

structure LossFunctionEvidence {D : DecisionProblem} (L : LossFunction D) where
  boundedBelowClosed : L.boundedBelow
  integrableClosed : L.integrable

def LossFunctionClosed {D : DecisionProblem} (L : LossFunction D) : Prop :=
  L.boundedBelow ∧ L.integrable

theorem loss_function_closed_from_evidence {D : DecisionProblem} (L : LossFunction D) (E : LossFunctionEvidence L) :
    LossFunctionClosed L := by
  exact And.intro E.boundedBelowClosed E.integrableClosed

end BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean
end HautevilleHouse