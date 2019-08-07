data {
  int y; // Number of heads
  int n; // Number of trials
}
parameters {
  real<lower=0, upper=1> theta;
}
model {
  // Prior:
  theta ~ beta(1, 1);
  
  // Likelihood
  y ~ binomial(n, theta);
}