import BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean.BayesianPriorAndLoss

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean

structure RiskPackage {P : PriorPackage} {L : LossPackage} where
  bayesRisk : decisionSpace → ℝ
  riskMinimizer : decisionSpace
  riskFinite : Prop

structure RiskEvidence {P : PriorPackage} {L : LossPackage} (R : RiskPackage P L) where
  riskFiniteClosed : R.riskFinite

def RiskClosed {P : PriorPackage} {L : LossPackage} (R : RiskPackage P L) : Prop :=
  R.riskFinite

theorem risk_closed_from_evidence {P : PriorPackage} {L : LossPackage}
    (R : RiskPackage P L) (E : RiskEvidence R) : RiskClosed R := by
  exact E.riskFiniteClosed

structure BayesProcedurePackage {P : PriorPackage} {L : LossPackage}
    {R : RiskPackage P L} where
  bayesDecisionRule : decisionSpace
  minimizesPosteriorRisk : Prop
  admissible : Prop

structure BayesProcedureEvidence {P : PriorPackage} {L : LossPackage}
    {R : RiskPackage P L} (B : BayesProcedurePackage P L R) where
  minimizesPosteriorRiskClosed : B.minimizesPosteriorRisk
  admissibleClosed : B.admissible

def BayesProcedureClosed {P : PriorPackage} {L : LossPackage}
    {R : RiskPackage P L} (B : BayesProcedurePackage P L R) : Prop :=
  B.minimizesPosteriorRisk ∧ B.admissible

theorem bayes_procedure_closed_from_evidence {P : PriorPackage} {L : LossPackage}
    {R : RiskPackage P L} (B : BayesProcedurePackage P L R)
    (E : BayesProcedureEvidence B) : BayesProcedureClosed B := by
  exact And.intro E.minimizesPosteriorRiskClosed E.admissibleClosed

end BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean
end HautevilleHouse