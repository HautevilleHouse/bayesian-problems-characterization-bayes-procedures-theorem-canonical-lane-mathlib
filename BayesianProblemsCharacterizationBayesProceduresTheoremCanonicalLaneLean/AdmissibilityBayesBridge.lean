import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean

structure AdmissibilityBayesBridge (D : DecisionProblemPackage) (C : CharacterizationPackage D) where
  admissibleImpliesBayes : ∀ d ∈ C.admissibleSet, d ∈ C.bayesSet
  bayesImpliesAdmissible : ∀ d ∈ C.bayesSet, d ∈ C.admissibleSet
  bridgeTheorem : C.characterizationTheorem

structure AdmissibilityBayesBridgeEvidence {D : DecisionProblemPackage} {C : CharacterizationPackage D} (B : AdmissibilityBayesBridge D C) where
  admissibleImpliesBayesProof : B.admissibleImpliesBayes
  bayesImpliesAdmissibleProof : B.bayesImpliesAdmissible
  bridgeTheoremProof : B.bridgeTheorem

def AdmissibilityBayesBridgeClosed {D : DecisionProblemPackage} {C : CharacterizationPackage D} (B : AdmissibilityBayesBridge D C) : Prop :=
  B.admissibleImpliesBayes ∧ B.bayesImpliesAdmissible ∧ B.bridgeTheorem

theorem admissibility_bayes_bridge_closed_from_evidence {D : DecisionProblemPackage} {C : CharacterizationPackage D} (B : AdmissibilityBayesBridge D C) (E : AdmissibilityBayesBridgeEvidence B) :
    AdmissibilityBayesBridgeClosed B := by
  exact And.intro E.admissibleImpliesBayesProof (And.intro E.bayesImpliesAdmissibleProof E.bridgeTheoremProof)

end BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean
end HautevilleHouse
