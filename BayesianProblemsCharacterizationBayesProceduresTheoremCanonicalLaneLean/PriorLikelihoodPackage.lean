import HautevilleHouse.BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean

structure PriorLikelihoodPackage (D : BayesianDecisionProblem) where
  priorDensity : D.parameterSpace → ℝ
  likelihoodFunction : D.parameterSpace → D.actionSpace → ℝ
  priorNormalized : ∫ θ, priorDensity θ = 1
  likelihoodPositive : ∀ θ a, likelihoodFunction θ a > 0

structure PriorLikelihoodEvidence (D : BayesianDecisionProblem) (P : PriorLikelihoodPackage D) where
  priorNormalizedClosed : P.priorNormalized
  likelihoodPositiveClosed : P.likelihoodPositive

def PriorLikelihoodClosed (D : BayesianDecisionProblem) (P : PriorLikelihoodPackage D) : Prop :=
  P.priorNormalized ∧ P.likelihoodPositive

theorem prior_likelihood_closed_from_evidence (D : BayesianDecisionProblem) (P : PriorLikelihoodPackage D) (E : PriorLikelihoodEvidence D P) : PriorLikelihoodClosed D P := by
  exact And.intro E.priorNormalizedClosed E.likelihoodPositiveClosed

end BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean
end HautevilleHouse
