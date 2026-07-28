import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean

structure DecisionProblemPackage where
  actionSpace : Type u
  parameterSpace : Type v
  lossFunction : actionSpace → parameterSpace → ℝ
  sampleSpace : Type w
  distributionFamily : parameterSpace → sampleSpace → ℝ
  decisionFunction : sampleSpace → actionSpace
  riskFunction : actionSpace → ℝ

structure DecisionProblemEvidence (D : DecisionProblemPackage) where
  lossFunctionProper : D.lossFunction ≠ λ _ _ => 0
  distributionFamilyProper : D.distributionFamily ≠ λ _ _ => 0
  decisionFunctionDefined : D.decisionFunction ≠ λ _ => arbitrary

def DecisionProblemClosed (D : DecisionProblemPackage) : Prop :=
  D.lossFunction ≠ λ _ _ => 0 ∧ D.distributionFamily ≠ λ _ _ => 0 ∧ D.decisionFunction ≠ λ _ => arbitrary

theorem decision_problem_closed_from_evidence (D : DecisionProblemPackage) (E : DecisionProblemEvidence D) :
    DecisionProblemClosed D := by
  exact And.intro E.lossFunctionProper (And.intro E.distributionFamilyProper E.decisionFunctionDefined)

end BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean
end HautevilleHouse
