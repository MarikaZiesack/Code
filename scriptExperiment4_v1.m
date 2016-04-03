%scriptExperiment_4_v1

%substract background
background = mean(OD(1,:));
OD_corr = OD-background;

%parse duplicates in two 
Replica_1 = OD_corr(1:2:length(OD_corr),:)
Replica_2 = OD_corr(2:2:length(OD_corr),:)

Samples_true = Samples(1:2:length(Samples))

for i=25:6:48
model_series = [[Replica_1(i:(i+5),1)],...
    [Replica_1(i:i+5,2)],...
    Replica_1(i:i+5,3)];


figure;
h = bar(model_series);
set(h,'BarWidth',1);    % The bars will now touch each other
set(gca,'YGrid','on')
set(gca,'GridLineStyle','-')
set(gca,'XTicklabel',Samples_true(i:(i+5)))
set(get(gca,'YLabel'),'String','OD_6_0_0')
lh = legend('0 h','7 h','21 h');
set(lh,'Location','BestOutside','Orientation','horizontal')


end

    