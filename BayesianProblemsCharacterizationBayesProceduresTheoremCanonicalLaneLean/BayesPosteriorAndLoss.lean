import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean.BayesianPriorAndLikelihood

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean

structure BayesPosteriorPackage {P : PriorDistributionPackage} {L : LikelihoodFunctionPackage P} where
  posteriorDensity : P.parameterSpace -> ℝ
  normalized : Prop
  computedViaBayesRule : Prop

structure BayesPosteriorEvidence {P : PriorDistributionPackage} {L : LikelihoodFunctionPackage P} (B : BayesPosteriorPackage P L) where
  normalizedClosed : B.normalized
  computedViaBayesRuleClosed : B.computedViaBayesRule

def BayesPosteriorClosed {P : PriorDistributionPackage} {L : LikelihoodFunctionPackage P} (B : BayesPosteriorPackage P L) : Prop :=
  B.normalized ∧ B.computedViaBayesRule

theorem bayes_posterior_closed_from_evidence {P : PriorDistributionPackage} {L : LikelihoodFunctionPackage P} (B : BayesPosteriorPackage P L) (E : BayesPosteriorEvidence B) :
    BayesPosteriorClosed B := by
  exact And.intro E.normalizedClosed E.computedViaBayesRuleClosed

structure LossFunctionPackage where
  actionSpace : Type u
  parameterSpace : Type v
  loss : parameterSpace -> actionSpace -> ℝ
  nonnegative : Prop
  boundedBelow : Prop

structure LossFunctionEvidence (R : LossFunctionPackage) where
  nonnegativeClosed : R.nonnegative
  boundedBelowClosed : R.boundedBelow

def LossFunctionClosed (R : LossFunctionPackage) : Prop :=
  R.nonnegative ∧ R.boundedBelow

theorem loss_function_closed_from_evidence (R : LossFunctionPackage) (E : LossFunctionEvidence R) :
    LossFunctionClosed R := by
  exact And.intro E.nonnegativeClosed E.boundedBelowClosed

end BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean
end HautevilleHouse