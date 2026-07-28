import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean

structure PriorDistributionPackage where
  distribution : Type u
  parameterSpace : Type v
  density : (parameterSpace -> ℝ) -> Prop
  proper : Prop
  knownForm : Prop

structure PriorDistributionEvidence (P : PriorDistributionPackage) where
  properClosed : P.proper
  knownFormClosed : P.knownForm

def PriorDistributionClosed (P : PriorDistributionPackage) : Prop :=
  P.proper ∧ P.knownForm

theorem prior_distribution_closed_from_evidence (P : PriorDistributionPackage) (E : PriorDistributionEvidence P) :
    PriorDistributionClosed P := by
  exact And.intro E.properClosed E.knownFormClosed

structure LikelihoodFunctionPackage {P : PriorDistributionPackage} where
  observationSpace : Type w
  likelihood : P.parameterSpace -> observationSpace -> ℝ
  measurable : Prop
  integrable : Prop

structure LikelihoodFunctionEvidence {P : PriorDistributionPackage} (L : LikelihoodFunctionPackage P) where
  measurableClosed : L.measurable
  integrableClosed : L.integrable

def LikelihoodFunctionClosed {P : PriorDistributionPackage} (L : LikelihoodFunctionPackage P) : Prop :=
  L.measurable ∧ L.integrable

theorem likelihood_function_closed_from_evidence {P : PriorDistributionPackage} (L : LikelihoodFunctionPackage P) (E : LikelihoodFunctionEvidence L) :
    LikelihoodFunctionClosed L := by
  exact And.intro E.measurableClosed E.integrableClosed

end BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean
end HautevilleHouse