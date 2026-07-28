import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean

structure BayesianState where
  carrier : Type
  sigmaAlgebra : Set (Set carrier)
  probabilityMeasure : (carrier → ℝ) → ℝ

structure BayesianAdmittedObject where
  stateSpace : BayesianState
  actionSpace : Type
  lossFunction : (stateSpace.carrier → actionSpace → ℝ) → ℝ
  prior : (stateSpace.carrier → ℝ) → ℝ
  bayesProcedure : (stateSpace.carrier → actionSpace) → ℝ
  finiteExpectedLoss : Prop
  conclusion : finiteExpectedLoss

structure BayesianEndgameState where
  object : BayesianAdmittedObject

def BayesianWitnessClosed (O : BayesianAdmittedObject) : Prop :=
  O.finiteExpectedLoss

end BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean
end HautevilleHouse