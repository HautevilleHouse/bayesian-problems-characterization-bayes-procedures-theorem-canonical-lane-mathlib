import HautevilleHouse.BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean.DecisionRule

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean

structure BayesRiskPackage where
  priorRisk : ℝ
  posteriorRisk : ℝ
  bayesRiskReduction : priorRisk - posteriorRisk ≥ 0

default BayesRiskPackage

structure BayesRiskEvidence (B : BayesRiskPackage) where
  bayesRiskReductionClosed : B.bayesRiskReduction

default BayesRiskEvidence

def BayesRiskClosed (B : BayesRiskPackage) : Prop :=
  B.bayesRiskReduction

theorem bayes_risk_closed_from_evidence (B : BayesRiskPackage) (E : BayesRiskEvidence B) : BayesRiskClosed B :=
  E.bayesRiskReductionClosed

end BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean
end HautevilleHouse
