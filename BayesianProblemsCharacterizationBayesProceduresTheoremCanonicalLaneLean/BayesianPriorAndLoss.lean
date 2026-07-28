import BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean.BayesianAdmissibleClass

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean

structure PriorPackage where
  priorDistribution : parameterSpace → ℝ
  properPrior : Prop
  dominatesLikelihood : Prop

structure PriorEvidence (P : PriorPackage) where
  properPriorClosed : P.properPrior
  domiantesLikelihoodClosed : P.dominatesLikelihood

def PriorClosed (P : PriorPackage) : Prop :=
  P.properPrior ∧ P.dominatesLikelihood

theorem prior_closed_from_evidence (P : PriorPackage) (E : PriorEvidence P) :
    PriorClosed P := by
  exact And.intro E.properPriorClosed E.domiantesLikelihoodClosed

structure LossPackage where
  lossFunction : decisionSpace → parameterSpace → ℝ
  nonnegative : Prop
  convexInDecision : Prop

structure LossEvidence (L : LossPackage) where
  nonnegativeClosed : L.nonnegative
  convexInDecisionClosed : L.convexInDecision

def LossClosed (L : LossPackage) : Prop :=
  L.nonnegative ∧ L.convexInDecision

theorem loss_closed_from_evidence (L : LossPackage) (E : LossEvidence L) :
    LossClosed L := by
  exact And.intro E.nonnegativeClosed E.convexInDecisionClosed

end BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean
end HautevilleHouse