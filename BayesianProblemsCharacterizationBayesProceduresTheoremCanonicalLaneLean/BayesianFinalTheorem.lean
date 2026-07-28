import BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean.BayesianGateLemmas

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean

def ConstrainedBayesianClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_bayesian_endgame (A : AdmissibleClass) :
    ConstrainedBayesianClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean
end HautevilleHouse