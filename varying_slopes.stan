data {
  int n_obs; // Number of observations
  int n_species; // Number of species
  int y[n_obs, n_species]; // Presence / absence at each site
  vector[n_obs] x; // Covariate
}
parameters {
  real<lower=0> slope_sd;
  real slope_mean;
  vector[n_species] theta_1; // Slopes
  vector[n_species] theta_2; // Intercept
}
model {
  // Priors
  // Note that here we're not doing something we should: an implementation detail 
  // in Stan means there's a better way to do this hierarchical prior, but
  // we'll ignore that for now.
  // If you want to learn what to do, check this out:
  // https://mc-stan.org/docs/2_18/stan-users-guide/reparameterization-section.html
  slope_sd ~ normal(0, 1);
  slope_mean ~ normal(0, 1);

  theta_1 ~ normal(slope_mean, slope_sd);
  theta_2 ~ normal(0, 1);
  
  // Loop over species for likelihood
  for (j in 1:n_species) {
    y[:, j] ~ bernoulli_logit(theta_1[j] * x + theta_2[j]);
  }
  
}
