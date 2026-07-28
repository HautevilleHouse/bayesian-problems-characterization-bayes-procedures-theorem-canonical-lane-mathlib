import HautevilleHouse.BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean.PriorLikelihoodPackage

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean

structure PosteriorPackage (D : BayesianDecisionProblem) (P : PriorLikelihoodPackage D) where
  posteriorDensity : D.actionSpace → D.parameterSpace → ℝ
  bayesRuleApplied : Prop
  posteriorNormalized : ∀ a, ∫ θ, posteriorDensity a θ = 1

structure PosteriorEvidence (D : BayesianDecisionProblem) (P : PriorLikelihoodPackage D) (Q : PosteriorPackage D P) where
  bayesRuleAppliedClosed : Q.bayesRuleApplied
  posteriorNormalizedClosed : Q.posteriorNormalized

def PosteriorClosed (D : BayesianDecisionProblem) (P : PriorLikelihoodPackage D) (Q : PosteriorPackage D P) : Prop :=
  Q.bayesRuleApplied ∧ Q.posteriorNormalized

theorem posterior_closed_from_evidence (D : BayesianDecisionProblem) (P : PriorLikelihoodPackage D) (Q : PosteriorPackage D P) (E : PosteriorEvidence D P Q) : PosteriorClosed D P Q := by
  exact And.intro E.bayesRuleAppliedClosed E.posteriorNormalizedClosed

end BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean
end HautevilleHouse
