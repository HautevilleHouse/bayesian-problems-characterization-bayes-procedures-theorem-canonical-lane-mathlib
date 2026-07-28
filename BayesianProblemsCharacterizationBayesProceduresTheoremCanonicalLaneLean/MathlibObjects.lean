import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure BayesianDecisionSpace where
  actions : Type
  parameters : Type

default BayesianDecisionSpace

structure BayesianLossFunction (D : BayesianDecisionSpace) where
  loss : D.actions → D.parameters → ℝ

default BayesianLossFunction

structure BayesianPriorDistribution (D : BayesianDecisionSpace) where
  prior : D.parameters → ℝ
  isProbability : ∀ p, prior p ≥ 0 ∧ (∑' p, prior p) = 1

default BayesianPriorDistribution

structure BayesianPosteriorDistribution (D : BayesianDecisionSpace) (prior : BayesianPriorDistribution D) (likelihood : D.parameters → D.actions → ℝ) (data : D.actions) where
  posterior : D.parameters → ℝ
  bayesRule : D.actions → ℝ
  isPosterior : ∀ p, posterior p = likelihood p data * prior.prior p / (∑' q, likelihood q data * prior.prior q)

default BayesianPosteriorDistribution

structure BayesianAdmittedObject (D : BayesianDecisionSpace) where
  loss : BayesianLossFunction D
  prior : BayesianPriorDistribution D
  posterior : BayesianPosteriorDistribution D prior (fun p a => loss.loss a p) (default : D.actions)
  isBayesRule : Prop
  conclusion : isBayesRule

default BayesianAdmittedObject

structure BayesianEndgameState where
  object : BayesianAdmittedObject (default : BayesianDecisionSpace)

default BayesianEndgameState

def BayesianWitnessClosed (O : BayesianAdmittedObject (default : BayesianDecisionSpace)) : Prop :=
  O.isBayesRule

end BayesianProblemsCharacterizationBayesProceduresTheoremCanonicalLaneLean
end HautevilleHouse
