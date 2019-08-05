data {
  int n_obs; // Number of observations
  int y[n_obs]; // Presence / absence at each site
  vector[n_obs] x; // Covariate
}
parameters {
  real theta_1; // Slope
  real theta_2; // Intercept
}
model {
  // Priors
  theta_1 ~ normal(0, 1);
  theta_2 ~ normal(0, 1);
  
  y ~ bernoulli_logit(theta_1 * x + theta_2);
}