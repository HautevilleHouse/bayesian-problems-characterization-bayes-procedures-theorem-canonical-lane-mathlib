import HautevilleHouse.BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean.BayesRiskPackage

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean

structure AdmissibilityPackage (D : BayesianDecisionProblem) (P : PriorLikelihoodPackage D) (Q : PosteriorPackage D P) (R : BayesRiskPackage D P Q) where
  admissible : Prop
  bayesProcedure : Prop
  minimax : Prop
  admissibleCondition : admissible ↔ ∀ (d' : D.parameterSpace → D.actionSpace), (∀ θ, R.riskFunction θ ≤ (∫ a, D.lossFunction θ (d' θ) * Q.posteriorDensity a θ)) → R.riskFunction = (λ θ => ∫ a, D.lossFunction θ (d' θ) * Q.posteriorDensity a θ)
  bayesProcedureCondition : bayesProcedure ↔ R.bayesRisk = min (λ (d : D.parameterSpace → D.actionSpace) => ∫ θ, (∫ a, D.lossFunction θ (d θ) * Q.posteriorDensity a θ) * P.priorDensity θ)

structure AdmissibilityEvidence (D : BayesianDecisionProblem) (P : PriorLikelihoodPackage D) (Q : PosteriorPackage D P) (R : BayesRiskPackage D P Q) (S : AdmissibilityPackage D P Q R) where
  admissibleConditionClosed : S.admissibleCondition
  bayesProcedureConditionClosed : S.bayesProcedureCondition

def AdmissibilityClosed (D : BayesianDecisionProblem) (P : PriorLikelihoodPackage D) (Q : PosteriorPackage D P) (R : BayesRiskPackage D P Q) (S : AdmissibilityPackage D P Q R) : Prop :=
  S.admissibleCondition ∧ S.bayesProcedureCondition

theorem admissibility_closed_from_evidence (D : BayesianDecisionProblem) (P : PriorLikelihoodPackage D) (Q : PosteriorPackage D P) (R : BayesRiskPackage D P Q) (S : AdmissibilityPackage D P Q R) (E : AdmissibilityEvidence D P Q R S) : AdmissibilityClosed D P Q R S := by
  exact And.intro E.admissibleConditionClosed E.bayesProcedureConditionClosed

end BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean
end HautevilleHouse
