%-------                     Print Values                    ----------%
function Print(K,r,R2,data_tip,R0_14,R0_28,...
 Nk,cases_deaths,country)



if (cases_deaths==1)
fprintf('\t\t Cases : %s',country);  fprintf('\n\n');end

if (cases_deaths==2)
fprintf('\t\t Deaths : %s',country); fprintf('\n\n');end

fprintf('Maximum value of model K: %8.0f\t',round(K));               fprintf('\n\n');
fprintf('Growth rate of model r: %2.4f\t',r);                        fprintf('\n\n');
fprintf('Regression coefficient R^2: %2.3f\t',R2);                   fprintf('\n\n');
fprintf('Inflection point t_i_p: %s\t',data_tip);                    fprintf('\n\n');
fprintf('Basic reproduction number R_0 with 14 days: %2.1f\t',R0_14);fprintf('\n\n');

