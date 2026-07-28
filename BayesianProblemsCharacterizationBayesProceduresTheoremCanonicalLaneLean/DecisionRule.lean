import HautevilleHouse.BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean.FinalTheorem

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean

structure DecisionRulePackage where
  decisionRule : BayesianDecisionSpace.actions → BayesianDecisionSpace.actions
  bayesRisk : ℝ
  isBayes : Prop
  finiteBayesRisk : bayesRisk < ∞

default DecisionRulePackage

structure DecisionRuleEvidence (P : DecisionRulePackage) where
  isBayesClosed : P.isBayes
  finiteBayesRiskClosed : P.finiteBayesRisk

default DecisionRuleEvidence

def DecisionRuleClosed (P : DecisionRulePackage) : Prop :=
  P.isBayes ∧ P.finiteBayesRisk

theorem decision_rule_closed_from_evidence (P : DecisionRulePackage) (E : DecisionRuleEvidence P) : DecisionRuleClosed P :=
  And.intro E.isBayesClosed E.finiteBayesRiskClosed

end BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean
end HautevilleHouse
