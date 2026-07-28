import HautevilleHouse.BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean.BayesProcedure

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean

structure BayesianCharacterizationPackage (D : DecisionProblem) (P : Prior D) (L : LossFunction D) where
  bayesProceduresCharacterized : Prop
  admissibilityCharacterization : Prop
  completeClassTheorem : Prop

structure BayesianCharacterizationEvidence {D : DecisionProblem} {P : Prior D} {L : LossFunction D}
    (C : BayesianCharacterizationPackage D P L) where
  bayesProceduresCharacterizedClosed : C.bayesProceduresCharacterized
  admissibilityCharacterizationClosed : C.admissibilityCharacterization
  completeClassTheoremClosed : C.completeClassTheorem

def BayesianCharacterizationClosed {D : DecisionProblem} {P : Prior D} {L : LossFunction D}
    (C : BayesianCharacterizationPackage D P L) : Prop :=
  C.bayesProceduresCharacterized ∧ C.admissibilityCharacterization ∧ C.completeClassTheorem

theorem bayesian_characterization_closed_from_evidence {D : DecisionProblem} {P : Prior D} {L : LossFunction D}
    (C : BayesianCharacterizationPackage D P L) (E : BayesianCharacterizationEvidence C) :
    BayesianCharacterizationClosed C := by
  exact And.intro E.bayesProceduresCharacterizedClosed
    (And.intro E.admissibilityCharacterizationClosed E.completeClassTheoremClosed)

end BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean
end HautevilleHouse