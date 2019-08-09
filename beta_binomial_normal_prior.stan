data {
  int y; // Number of heads
  int n; // Number of trials
}
parameters {
  real<lower=0, upper=1> theta;
}
model {
  // Prior:
  theta ~ normal(0, 1);
  
  // Likelihood
  y ~ binomial(n, theta);
}