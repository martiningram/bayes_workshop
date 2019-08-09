data {
  int n_obs; // Number of observations
  int y[n_obs]; // Presence / absence at each site
  vector[n_obs] x1; // Covariate 1
  vector[n_obs] x2; // Covariate 2
}
parameters {
  real theta_1; // Slope for x1
  real theta_2; // Slope for x2
  real theta_3; // Intercept
}
model {
  // Priors
  theta_1 ~ normal(0, 1);
  theta_2 ~ normal(0, 1);
  theta_3 ~ normal(0, 1);
  
  y ~ bernoulli_logit(theta_1 * x1 + theta_2 * x2 + theta_3);
}