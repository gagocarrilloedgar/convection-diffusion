
% Mesh
D = [10 20 50 100 200];
N = 100;        % Number of mesh divisions in the x direction
M = 100;        % Number of mesh divisions in the y direction


x = N+2;       % Mesh nodes in the x direction + boundaries
y = M+2;       % Mesh nodes in the y direction + boundaries
nodes = struct('x', x, 'y', y);

% Scheme definition: 'UDS', 'EDS'
scheme = 'UDS';

% Define Peclet numbers to analyze
Peclet = [10 1000 10^6];

p = numel(Peclet); % number os Peclet case studies

%% Case Study Selection
options = [1 2 3]; % 1 --> 1 Direction flow
% 2 --> Diagonal flow
% 3 --> Smith-Hutton

z = numel(options); % number os case studies

%% Process params
delta = 1e-6; %Minimum acceptable error

