# Analysis of Monthly Temperature and US Fatal Auto Crashes (2008)

This report evaluates the statistical relationship between average monthly temperature ($\text{Avg.Temp}$) and total fatal automobile crashes ($\text{TotalFatalCrashes}$) in the United States using 2008 data from the U.S. Department of Transportation. The analysis includes hypothesis testing, correlation assessment, linear regression modeling, predictive estimation, and practical evaluation for decision-makers.

---

## 1. Null and Alternative Hypotheses

To formally test whether temperature influences fatal auto crashes, we establish opposing statistical hypotheses regarding the population correlation parameter ($\rho$):

* **Null Hypothesis ($H_0$)**: There is no linear relationship between average monthly temperature and total fatal crashes ($\rho = 0$).
* **Alternative Hypothesis ($H_1$)**: There is a statistically significant linear relationship between average monthly temperature and total fatal crashes ($\rho \neq 0$).

---

## 2. Correlation Coefficient and Statistical Significance

Statistical evaluation of the 12 monthly data pairs yields the following correlation and significance metrics:

* **Pearson Correlation Coefficient ($r$)**: $0.8699$ (or $r \approx 0.87$). This indicates a strong positive linear relationship between monthly average temperature and fatal crash counts.
* **Calculated $p$-value**: $0.000235$ ($2.35 \times 10^{-4}$).

### Evaluation at Selected Confidence Levels

To determine statistical significance, we compare the calculated $p$-value against standard significance thresholds ($\alpha$):

1. **95% Confidence Level ($\alpha = 0.05$)**: Because $p = 0.000235 < 0.05$, the correlation is statistically significant at the 95% confidence level.
2. **99% Confidence Level ($\alpha = 0.01$)**: Because $p = 0.000235 < 0.01$, the correlation remains statistically significant at the 99% confidence level.

---

## 3. Hypothesis Test Conclusion

Based on the empirical evidence, we **reject the Null Hypothesis ($H_0$)** at both the 95% ($\alpha = 0.05$) and 99% ($\alpha = 0.01$) confidence levels. 

The extremely low $p$-value ($0.000235$) indicates that there is less than a 0.024% probability of observing a correlation as strong as $0.8699$ by pure chance. We conclude that monthly average temperature and total fatal crashes share a statistically significant linear association.

---

## 4. Linear Regression Model Parameters

An ordinary least squares (OLS) simple linear regression model was fitted to the monthly data to describe the predictive relationship:

$$\text{TotalFatalCrashes} = 2.1440 \times \text{Avg.Temp} + 243.5465$$

The estimated model parameters are summarized as follows:

* **Slope ($\beta_1$)**: $2.1440$ fatal crashes per $1^\circ\text{F}$ increase in average monthly temperature ($SE = 0.3844, p = 0.000235$).
* **$Y$-Intercept ($\beta_0$)**: $243.5465$ baseline fatal crashes estimated at $0^\circ\text{F}$ ($SE = 18.4742$).
* **Coefficient of Determination ($R^2$)**: $0.7567$ (or $75.67\%$). 

The $R^2$ value demonstrates that $75.67\%$ of the total monthly variation in fatal crashes across 2008 is explained by average monthly temperature alone.

---

## 5. Model Prediction for 20°F

Applying the fitted linear regression equation to an average temperature of $20^\circ\text{F}$ yields the following prediction:

$$\hat{Y} = 2.1440(20) + 243.5465 = 42.8800 + 243.5465 = 286.4265$$

* **Point Prediction**: **$286.43$ fatal crashes** (or **286 crashes** when rounded to the nearest integer).

---

## 6. Decision-Maker Analysis and Recommendations

As a transportation safety decision-maker, the data supports the conclusion that **average monthly temperature and total fatal auto crashes are strongly related**. However, statistical correlation must be contextualized with operational drivers:

### Operational Drivers Behind the Correlation

1. **Increased Driving Exposure (Vehicle Miles Traveled)**: Higher temperatures correspond to spring and summer months (peak in July at $70^\circ\text{F}$ with 419 crashes), when overall driving volume surges due to vacation travel, road trips, and outdoor recreational trips.
2. **Behavioral Risk Profiles**: Warmer weather increases nighttime travel, teenage driving activity while school is out, and recreational outings involving alcohol or higher driving speeds.
3. **Winter Exposure Reduction**: Cold winter months (such as February at $18^\circ\text{F}$ with 280 crashes) naturally experience reduced long-distance travel and lower total road mileage.

### Policy Implications

Transportation agencies should allocate law enforcement patrols, highway safety monitoring, and targeted safety campaigns heavily during peak summer months rather than distributing resources uniformly throughout the year.
