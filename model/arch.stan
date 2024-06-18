data {
  int<lower=0> T; // number of days
  array[T] real r; // returns
}

parameters {
  real mu; // average return
  real<lower = 0> alpha0; // noise intercept
  real<lower = 0, upper=1> alpha1; // noise slope
}

model {
  // Priors
  mu ~ normal(0, 10);
  alpha0 ~ beta(1, 1);
  alpha1 ~ beta(1, 1);

  // Likelihood
  for (t in 2:T) {
    r[t] ~ normal(mu, sqrt(alpha0 + alpha1 * square(r[t-1] - mu)));
  }
}
