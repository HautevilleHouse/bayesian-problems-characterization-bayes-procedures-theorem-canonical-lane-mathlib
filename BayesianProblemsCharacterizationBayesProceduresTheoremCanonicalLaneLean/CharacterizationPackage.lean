import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean

structure CharacterizationPackage (D : DecisionProblemPackage) where
  admissibleSet : Set D.actionSpace
  bayesSet : Set D.actionSpace
  characterizationTheorem : admissibleSet = bayesSet

structure CharacterizationEvidence {D : DecisionProblemPackage} (C : CharacterizationPackage D) where
  admissibleSetNonempty : C.admissibleSet.Nonempty
  bayesSetNonempty : C.bayesSet.Nonempty
  characterizationProof : C.characterizationTheorem

def CharacterizationClosed {D : DecisionProblemPackage} (C : CharacterizationPackage D) : Prop :=
  C.admissibleSet.Nonempty ∧ C.bayesSet.Nonempty ∧ C.characterizationTheorem

theorem characterization_closed_from_evidence {D : DecisionProblemPackage} (C : CharacterizationPackage D) (E : CharacterizationEvidence C) :
    CharacterizationClosed C := by
  exact And.intro E.admissibleSetNonempty (And.intro E.bayesSetNonempty E.characterizationProof)

end BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean
end HautevilleHouse
