% ===================================================
% ASSIGNMENT: MONTHLY TEMP VS FATAL CRASHES (2008)
% ===================================================

% ---------------------------------------------------
% Data Setup
% ---------------------------------------------------
temp = [17; 18; 29; 43; 55; 65; 70; 68; 59; 48; 37; 22];
crashes = [297; 280; 267; 350; 328; 386; 419; 410; 331; 356; 326; 311];

% ---------------------------------------------------
% STEP 1: Null Hypothesis (H0) & Alternative (H1)
% ---------------------------------------------------
fprintf('=== STEP 1: HYPOTHESIS STATEMENTS ===\n');
fprintf('H0 (Null Hypothesis): Temperature and fatal crashes are UNRELATED (r = 0).\n');
fprintf('H1 (Alternative): Temperature and fatal crashes ARE RELATED (r != 0).\n\n');

% ---------------------------------------------------
% STEP 2: Correlation Coefficient (r) & p-value
% ---------------------------------------------------
[R, P] = corrcoef(temp, crashes);
r_value = R(1,2);
p_value = P(1,2);

fprintf('=== STEP 2: CORRELATION & P-VALUE ===\n');
fprintf('Correlation coefficient (r): %.4f\n', r_value);
fprintf('p-value: %.6f (%.4f%%)\n\n', p_value, p_value*100);

% ---------------------------------------------------
% STEP 3: Conclusion regarding H0 at 95% & 99% Confidence
% ---------------------------------------------------
fprintf('=== STEP 3: CONCLUSION REGARDING H0 ===\n');
alpha_95 = 0.05;
alpha_99 = 0.01;

if p_value < alpha_95
    fprintf('At 95%% Confidence (alpha=0.05): REJECT H0 (p = %.6f < 0.05)\n', p_value);
end
if p_value < alpha_99
    fprintf('At 99%% Confidence (alpha=0.01): REJECT H0 (p = %.6f < 0.01)\n', p_value);
end
fprintf('Conclusion: The correlation is statistically significant at both levels.\n\n');

% ---------------------------------------------------
% STEP 4: Regression Model Parameters & R-squared
% ---------------------------------------------------
params = polyfit(temp, crashes, 1);
slope = params(1);
intercept = params(2);

% Manual R-squared calculation (no toolbox required)
crashes_fit = polyval(params, temp);
SS_tot = sum((crashes - mean(crashes)).^2);
SS_res = sum((crashes - crashes_fit).^2);
R2 = 1 - (SS_res / SS_tot);

fprintf('=== STEP 4: REGRESSION MODEL PARAMETERS ===\n');
fprintf('Regression Model: TotalFatalCrashes = %.4f * AvgTemp + %.4f\n', slope, intercept);
fprintf('  - Slope (m): %.4f crashes per 1 degree F rise\n', slope);
fprintf('  - Y-Intercept (b): %.4f crashes baseline at 0 degrees F\n', intercept);
fprintf('  - R-squared (R^2): %.4f (%.2f%% variance explained)\n\n', R2, R2*100);

% ---------------------------------------------------
% STEP 5: Predict Crashes at 20 Degrees
% ---------------------------------------------------
pred_20 = polyval(params, 20);
fprintf('=== STEP 5: PREDICTION AT 20 DEGREES ===\n');
fprintf('Predicted crashes at 20 deg F: %.2f (approx %d crashes)\n\n', pred_20, round(pred_20));

% ---------------------------------------------------
% STEP 6: Decision-Maker Conclusion & Reasons
% ---------------------------------------------------
fprintf('=== STEP 6: DECISION-MAKER CONCLUSION ===\n');
fprintf('Decision: CONCLUDE THAT TEMPERATURE AND FATAL CRASHES ARE RELATED.\n');
fprintf('Reasons:\n');
fprintf(' 1. Statistical Proof: Strong correlation (r=%.4f) with p < 0.001.\n', r_value);
fprintf(' 2. High Explanatory Power: Temp accounts for %.1f%% of crash variance.\n', R2*100);
fprintf(' 3. Operational Driver: Warmer weather drives higher driving volume (VMT),\n');
fprintf('    more summer trips, and increased nighttime driving.\n');

% ---------------------------------------------------
% Plotting the Regression Model
% ---------------------------------------------------
figure;
scatter(temp, crashes, 60, 'b', 'filled');
hold on;
plot(temp, crashes_fit, 'r-', 'LineWidth', 2);
plot(20, pred_20, 'go', 'MarkerSize', 10, 'LineWidth', 2);
title('2008 Monthly Avg Temp vs Total Fatal Auto Crashes');
xlabel('Average Temperature (°F)');
ylabel('Total Fatal Crashes');
legend('Monthly Data', 'Linear Fit Line', '20°F Prediction', 'Location', 'northwest');
grid on;