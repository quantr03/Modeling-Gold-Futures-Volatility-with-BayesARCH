# Bayesian Workflow

## Project Overview

**Title:** Bayesian Workflow  
**Author:** Quan Tran  
**Date:** 2024-06-02

This repository documents the Bayesian workflow for analyzing the volatility of gold prices. It includes the steps taken each week, from exploratory data analysis to model selection and evaluation.

## Table of Contents

- [Introduction](#introduction)
  - [Volatility Explained](#volatility-explained)
  - [Types of Volatility](#types-of-volatility)
  - [Research Question](#research-question)
  - [ARCH Model](#arch-model)
- [Week 1: Exploratory Data Analysis and Choosing a Research Question](#week-1-exploratory-data-analysis-and-choosing-a-research-question)
  - [Goal](#goal)
  - [Exploratory Data Analysis](#exploratory-data-analysis)
- [Week 2: Prior Choice](#week-2-prior-choice)
  - [Goal](#goal-1)
  - [Prior Choices and Justification](#prior-choices-and-justification)
- [Week 3: Model Fitting and Checking](#week-3-model-fitting-and-checking)
  - [Goal](#goal-2)
  - [ARCH Model Fitting and Checking](#arch-model-fitting-and-checking)
  - [Likelihood Sensitivity Analysis](#likelihood-sensitivity-analysis)
  - [Posterior Predictive Checks](#posterior-predictive-checks)
  - [Predictive Performance Visual Assessment](#predictive-performance-visual-assessment)
  - [Convergence Diagnostics](#convergence-diagnostics)
- [Week 4: Extending Models and Model Selection](#week-4-extending-models-and-model-selection)
  - [Goal](#goal-3)
  - [GARCH Model](#garch-model)
  - [Prior Choices and Justification](#prior-choices-and-justification-1)
  - [Likelihood Sensitivity Analysis](#likelihood-sensitivity-analysis-1)
  - [Posterior Predictive Checks](#posterior-predictive-checks-1)
  - [Predictive Performance Visual Assessments](#predictive-performance-visual-assessments)
  - [Convergence Diagnostics](#convergence-diagnostics-1)
- [Week 5: Interpreting and Presenting Model Results](#week-5-interpreting-and-presenting-model-results)
  - [Goal](#goal-4)
  - [Model Selection](#model-selection)
  - [Forecast Evaluation](#forecast-evaluation)
  - [Metrics Result](#metrics-result)
  - [Conclusion](#conclusion)

## Introduction

### Volatility Explained

Volatility is a statistical measure used to evaluate the dispersion of returns for a given security or market index. Higher volatility indicates a higher level of risk and uncertainty in the size of changes in a security’s value.

### Types of Volatility

- **Implied Volatility (IV):** Projected volatility, important for options traders.
- **Realized Volatility:** Measures past market performance.

### Research Question

Can we model the volatility of gold prices using daily returns? We will utilize ARCH models, commonly used for financial time series with time-varying volatility and volatility clustering.

### ARCH Model

The ARCH (Autoregressive Conditional Heteroskedasticity) model describes the variance of the current error term as a function of the actual sizes of previous periods' error terms.

\[
r_t = \mu + \epsilon_t
\]

\[
\epsilon_t = \sigma_t \eta_t
\]

\[
\sigma_t^2 = \alpha_0 + \sum_{i=1}^q \alpha_i \epsilon_{t-i}^2
\]

where \(\eta(t) \sim \mathcal{N}(0,1)\).

## Week 1: Exploratory Data Analysis and Choosing a Research Question

### Goal

- Set up the project
- Formulate a research question & find a dataset
- Visualize and understand the data characteristics
- Pick an initial model & document reasoning and strategies
- Obtain posterior samples using the initial model with default priors
- Document observations and issues in the workflow diary

### Exploratory Data Analysis

Fetched data from Yahoo Finance, calculated squared returns, and daily realized volatility. Split the data into training (304 rows) and testing (76 rows) sets. Created visualizations to understand gold price behavior.

## Week 2: Prior Choice

### Goal

- Propose priors for each model parameter with justification
- Perform a prior predictive check to ensure priors are reasonable

### Prior Choices and Justification

- **Parameters \(\alpha\):** Beta distributions with \(\alpha = 2\) and \(\beta = 3\)
- **Average Return \(\mu\):** Normal prior \(\mathcal{N}(0, 10)\)

Performed prior predictive checks to ensure priors covered feasible values.

## Week 3: Model Fitting and Checking

### Goal

- Fit the model with chosen priors
- Perform diagnostic checks for quality/stability
- Perform prior sensitivity assessment
- Perform predictive performance assessment

### ARCH Model Fitting and Checking

### Likelihood Sensitivity Analysis

Performed likelihood power-scaling analysis. The posterior distribution of \(\alpha_1\) showed sensitivity to the scaling factor.

### Posterior Predictive Checks

Evaluated model fit by plotting predicted volatility over return variability.

### Predictive Performance Visual Assessment

Evaluated model predictive performance on unseen testing data.

### Convergence Diagnostics

Convergence diagnostics (\(\hat{R}\), ESS, divergence) were satisfactory.

## Week 4: Extending Models and Model Selection

### Goal

- Decide on model expansion or selection approach
- Propose a second model or an expansion

### GARCH Model

The GARCH (Generalized Autoregressive Conditional Heteroskedasticity) model extends the ARCH model by incorporating previous volatility values.

\[
\sigma_t^2 = \alpha_0 + \sum_{i=1}^q \alpha_i \epsilon_{t-i}^2 + \sum_{i=1}^p \beta_i \sigma_{t-i}^2
\]

### Prior Choices and Justification

Similar to the ARCH model priors.

### Likelihood Sensitivity Analysis

### Posterior Predictive Checks

### Predictive Performance Visual Assessments

### Convergence Diagnostics

## Week 5: Interpreting and Presenting Model Results

### Goal

- Prepare a concise summary of results
- Prepare visualization for presentation to a non-technical audience

### Model Selection

Based on predictive performances.

### Forecast Evaluation

Using average forecast loss with QL Loss and MSE metrics.

### Metrics Result

- **ARCH QL Loss:** 1.287
- **ARCH MSE:** 0.619
- **GARCH QL Loss:** 1.086
- **GARCH MSE:** 0.386

### Conclusion

The GARCH model performs better than the ARCH model based on QL Loss and MSE metrics. Future work includes incorporating more lag terms and introducing a hierarchical structure for different periods.

---

## How to Use This Repository

1. **Clone the Repository:**
   ```sh
   git clone https://github.com/quan22022003/Modeling-Gold-Futures-Volatility-with-BayesARCH
   ```

2. **Set Up Your Environment:**
   Install the necessary R packages as listed in the project file.

3. **Run the Workflow:**
   Follow the documentation to run the analysis and reproduce the results.

4. **Documentation:**
   The detailed analysis and results are documented in the `FinalWorkflow.pdf` file included in the repository.
