import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean

structure BayesProcedurePackage (D : DecisionProblemPackage) where
  priorDistribution : D.parameterSpace → ℝ
  posteriorRisk : D.parameterSpace → ℝ
  bayesDecisionFunction : D.sampleSpace → D.actionSpace
  bayesRisk : ℝ

structure BayesProcedureEvidence {D : DecisionProblemPackage} (B : BayesProcedurePackage D) where
  priorProper : B.priorDistribution ≠ λ _ => 0
  posteriorRiskDefined : B.posteriorRisk ≠ λ _ => 0
  bayesDecisionDefined : B.bayesDecisionFunction ≠ λ _ => arbitrary
  bayesRiskFinite : B.bayesRisk < ∞

def BayesProcedureClosed {D : DecisionProblemPackage} (B : BayesProcedurePackage D) : Prop :=
  B.priorDistribution ≠ λ _ => 0 ∧ B.posteriorRisk ≠ λ _ => 0 ∧
  B.bayesDecisionFunction ≠ λ _ => arbitrary ∧ B.bayesRisk < ∞

theorem bayes_procedure_closed_from_evidence {D : DecisionProblemPackage} (B : BayesProcedurePackage D) (E : BayesProcedureEvidence B) :
    BayesProcedureClosed B := by
  exact And.intro E.priorProper (And.intro E.posteriorRiskDefined (And.intro E.bayesDecisionDefined E.bayesRiskFinite))

end BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean
end HautevilleHouse
