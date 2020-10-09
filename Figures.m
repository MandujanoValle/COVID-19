%-------                     Print Values                    ----------%
function Figures(time_data,N,time,Nk,t_i_p,time_f_data...
,data_tip,K,country,abbreviation,cases_deaths)
figure
set(gcf,'position',[0 0 600 400]); 
set(gca,'fontsize',20)
plot(time_data,N,'.b',time,Nk,'.r',data_tip,Nk(t_i_p),'*g'...
,'LineWidth', 1.2, 'MarkerSize', 10);
xline(time_f_data,'LineWidth', 1);
xlim([min(time) max(time)]);
grid on;
legend ({ 'Real','Prediction','Infletion point'},...
 'location','northwest','FontSize',12);
if(cases_deaths==1)
Title = ['(A) Cumulative infected in ',num2str(country)];
end

if(cases_deaths==2)
Title = ['(B) Cumulative deaths in ',num2str(country)];
end

title(Title,'fontsize',12);

Cases_Deaths = ['Cumulative number of ',num2str(cases_deaths)];
ylabel(Cases_Deaths,'fontsize',12);

if(cases_deaths==1)
ylabel('Cumulative number of cases infected','fontsize',12);
saveas(gcf,sprintf('/home/jemy/Dropbox/Paper4/Text/Figures/%s-Cases.png',abbreviation));
end


if(cases_deaths==2)
ylabel('Cumulative number of deaths','fontsize',12);
saveas(gcf,sprintf('/home/jemy/Dropbox/Paper4/Text/Figures/%s-Deaths.png',abbreviation));
end
