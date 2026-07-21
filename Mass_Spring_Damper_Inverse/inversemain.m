%% Build Neural Network

inputSize = 2;      % [t ; F]
outputSize = 1;     % x(t)
numHiddenUnits = 128;

layers = [
    featureInputLayer(inputSize)

    fullyConnectedLayer(numHiddenUnits)
    tanhLayer()

    fullyConnectedLayer(numHiddenUnits)
    tanhLayer()

    fullyConnectedLayer(numHiddenUnits)
    tanhLayer()

    fullyConnectedLayer(numHiddenUnits)
    tanhLayer()

    fullyConnectedLayer(outputSize)
    ];

net = dlnetwork(layers);

deepNetworkDesigner(net)
%%
%% Training Parameters

numIterations = 3000;
learnRate = 0.001;

mp = [];
vp = [];
%% Prepare Data
tSol  = tSol/max(tSol);
F  = F/max(abs(F));
x  = x/max(abs(x));
inputData = [tSol'; F'];

tdata = dlarray(inputData,'CB'); % input of pinn
xdata = dlarray(x','CB'); % output of pinn
col=1000
tcol=linspace(0,10,col)
Fcol=10*sin(2*tcol)
Col=[tcol;Fcol]
tpinns = dlarray(Col,'CB');

tpinns = dlarray(extractdata(tpinns),'CB');
%%
%% Trainable Physical Parameters

mRaw = dlarray(log(6));
cRaw = dlarray(log(2));
kRaw = dlarray(log(10));

mpM = [];
vpM = [];

mpC = [];
vpC = [];

mpK = [];
vpK = [];
%% Training Monitor

monitor = trainingProgressMonitor( ...
    Metrics=["Loss","LossPINN","LossData"]);

accFcn = dlaccelerate(@modelLoss);
%%
%% Loss History

totalLossHistory   = [];
physicsLossHistory = [];
dataLossHistory    = [];

%% Parameter History

mHistory = [];
cHistory = [];
kHistory = [];
%%
%% Training Loop

for iteration = 1:numIterations

    [loss,gradients,gradM,gradC,gradK,...
        lossPinn,lossData] = ...
        dlfeval(accFcn,net,...
        tdata,xdata,tpinns,...
        mRaw,cRaw,kRaw);

    [net,mp,vp] = adamupdate( ...
        net,gradients,mp,vp,...
        iteration,learnRate);

    [mRaw,mpM,vpM] = adamupdate( ...
        mRaw,gradM,mpM,vpM,...
        iteration,learnRate);

    [cRaw,mpC,vpC] = adamupdate( ...
        cRaw,gradC,mpC,vpC,...
        iteration,learnRate);

    [kRaw,mpK,vpK] = adamupdate( ...
        kRaw,gradK,mpK,vpK,...
        iteration,learnRate);

    recordMetrics(monitor,iteration,...
        Loss=loss,...
        LossPINN=lossPinn,...
        LossData=lossData);
    %% Store losses

totalLossHistory(end+1)   = double(extractdata(loss));
physicsLossHistory(end+1) = double(extractdata(lossPinn));
dataLossHistory(end+1)    = double(extractdata(lossData));

%% Store parameters

mHistory(end+1) = double(extractdata(exp(mRaw)));
cHistory(end+1) = double(extractdata(exp(cRaw)));
kHistory(end+1) = double(extractdata(exp(kRaw)));

    if mod(iteration,100)==0

        m = exp(mRaw);
        c = exp(cRaw);
        k = exp(kRaw);

        fprintf('Iter = %d\n',iteration);
        fprintf('m = %.4f\n',extractdata(m));
        fprintf('c = %.4f\n',extractdata(c));
        fprintf('k = %.4f\n\n',extractdata(k));

    end

end
%%
figure;

semilogy(totalLossHistory,'k','LineWidth',1.5);
hold on;
semilogy(physicsLossHistory,'r--','LineWidth',1.5);
semilogy(dataLossHistory,'b-.','LineWidth',1.5);

grid on;
box on;

xlabel('Iteration','FontSize',14);
ylabel('Loss (Log Scale)','FontSize',14);
title('PINN Training Loss History','FontSize',16);

legend('Total Loss','Physics Loss','Data Loss',...
    'Location','northeast');

set(gca,'FontSize',14,'LineWidth',1.5);

exportgraphics(gcf,'Loss_History.png','Resolution',300);
%%
figure;

plot(mHistory,'LineWidth',2);
hold on;

plot(cHistory,'LineWidth',2);

plot(kHistory,'LineWidth',2);

grid on;
box on;

xlabel('Iteration','FontSize',14);
ylabel('Estimated Value','FontSize',14);
title('Parameter Convergence','FontSize',16);

legend('Mass (m)','Damping (c)','Stiffness (k)',...
    'Location','best');

set(gca,'FontSize',14,'LineWidth',1.5);

exportgraphics(gcf,'Parameter_Convergence.png','Resolution',300);
%%
%% Estimated Parameters

m = exp(mRaw);
c = exp(cRaw);
k = exp(kRaw);

fprintf('\nEstimated Parameters\n');

fprintf('m = %.6f\n',extractdata(m));
fprintf('c = %.6f\n',extractdata(c));
fprintf('k = %.6f\n',extractdata(k));
%%
function [loss,gradients,gradM,gradC,gradK,...
    lossPinn,lossData] = ...
    modelLoss(net,tdata,xdata,tpinns,...
    mRaw,cRaw,kRaw)

m = exp(mRaw);
c = exp(cRaw);
k = exp(kRaw);

lossPinn = pinnsLoss(net,tpinns,m,c,k);
lossData = dataLoss(net,tdata,xdata);

loss = 1*lossPinn + 0.05*lossData;

[gradients,gradM,gradC,gradK] = ...
    dlgradient(loss,...
    net.Learnables,...
    mRaw,cRaw,kRaw);

end
%%
function loss = pinnsLoss(net,input,m,c,k)

t = input(1,:);
F = input(2,:);

x = forward(net,input);

xt = dlgradient( ...
    sum(x,'all'), ...
    t, ...
    'EnableHigherDerivatives',true);

xtt = dlgradient( ...
    sum(xt,'all'), ...
    t);

residual = m.*xtt + c.*xt + k.*x - F;

loss = mean(residual.^2,'all');

end
%%
function loss = dataLoss(net,input,xTarget)

xPred = forward(net,input);

loss = mean((xPred - xTarget).^2,'all');

end