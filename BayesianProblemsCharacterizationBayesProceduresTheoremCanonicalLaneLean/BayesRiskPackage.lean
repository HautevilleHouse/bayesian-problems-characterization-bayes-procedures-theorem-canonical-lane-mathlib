import HautevilleHouse.BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean.PosteriorPackage

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean

structure BayesRiskPackage (D : BayesianDecisionProblem) (P : PriorLikelihoodPackage D) (Q : PosteriorPackage D P) where
  decisionRule : D.parameterSpace → D.actionSpace
  riskFunction : D.parameterSpace → ℝ
  bayesRisk : ℝ
  riskFunctionDefined : ∀ θ, riskFunction θ = ∫ a, D.lossFunction θ a * Q.posteriorDensity a θ
  bayesRiskMinimized : bayesRisk = ∫ θ, riskFunction θ * P.priorDensity θ

structure BayesRiskEvidence (D : BayesianDecisionProblem) (P : PriorLikelihoodPackage D) (Q : PosteriorPackage D P) (R : BayesRiskPackage D P Q) where
  riskFunctionDefinedClosed : R.riskFunctionDefined
  bayesRiskMinimizedClosed : R.bayesRiskMinimized

def BayesRiskClosed (D : BayesianDecisionProblem) (P : PriorLikelihoodPackage D) (Q : PosteriorPackage D P) (R : BayesRiskPackage D P Q) : Prop :=
  R.riskFunctionDefined ∧ R.bayesRiskMinimized

theorem bayes_risk_closed_from_evidence (D : BayesianDecisionProblem) (P : PriorLikelihoodPackage D) (Q : PosteriorPackage D P) (R : BayesRiskPackage D P Q) (E : BayesRiskEvidence D P Q R) : BayesRiskClosed D P Q R := by
  exact And.intro E.riskFunctionDefinedClosed E.bayesRiskMinimizedClosed

end BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean
end HautevilleHouse
