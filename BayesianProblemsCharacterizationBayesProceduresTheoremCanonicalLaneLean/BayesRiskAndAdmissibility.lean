import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean.BayesianPriorAndLikelihood
import HautevilleHouse.BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean.BayesPosteriorAndLoss

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean

structure BayesRiskPackage {P : PriorDistributionPackage} {L : LikelihoodFunctionPackage P} {R : LossFunctionPackage} where
  riskFunction : (P.parameterSpace -> ℝ) -> ℝ
  computedViaPosterior : Prop
  finite : Prop

structure BayesRiskEvidence {P : PriorDistributionPackage} {L : LikelihoodFunctionPackage P} {R : LossFunctionPackage} (B : BayesRiskPackage P L R) where
  computedViaPosteriorClosed : B.computedViaPosterior
  finiteClosed : B.finite

def BayesRiskClosed {P : PriorDistributionPackage} {L : LikelihoodFunctionPackage P} {R : LossFunctionPackage} (B : BayesRiskPackage P L R) : Prop :=
  B.computedViaPosterior ∧ B.finite

theorem bayes_risk_closed_from_evidence {P : PriorDistributionPackage} {L : LikelihoodFunctionPackage P} {R : LossFunctionPackage} (B : BayesRiskPackage P L R) (E : BayesRiskEvidence B) :
    BayesRiskClosed B := by
  exact And.intro E.computedViaPosteriorClosed E.finiteClosed

structure AdmissibleDecisionRulePackage {P : PriorDistributionPackage} {L : LikelihoodFunctionPackage P} {R : LossFunctionPackage} (B : BayesRiskPackage P L R) where
  decisionRule : L.observationSpace -> R.actionSpace
  bayesRiskOptimal : Prop
  noOtherRuleDominates : Prop

structure AdmissibleDecisionRuleEvidence {P : PriorDistributionPackage} {L : LikelihoodFunctionPackage P} {R : LossFunctionPackage} {B : BayesRiskPackage P L R} (A : AdmissibleDecisionRulePackage B) where
  bayesRiskOptimalClosed : A.bayesRiskOptimal
  noOtherRuleDominatesClosed : A.noOtherRuleDominates

def AdmissibleDecisionRuleClosed {P : PriorDistributionPackage} {L : LikelihoodFunctionPackage P} {R : LossFunctionPackage} {B : BayesRiskPackage P L R} (A : AdmissibleDecisionRulePackage B) : Prop :=
  A.bayesRiskOptimal ∧ A.noOtherRuleDominates

theorem admissible_decision_rule_closed_from_evidence {P : PriorDistributionPackage} {L : LikelihoodFunctionPackage P} {R : LossFunctionPackage} {B : BayesRiskPackage P L R} (A : AdmissibleDecisionRulePackage B) (E : AdmissibleDecisionRuleEvidence A) :
    AdmissibleDecisionRuleClosed A := by
  exact And.intro E.bayesRiskOptimalClosed E.noOtherRuleDominatesClosed

end BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean
end HautevilleHouse