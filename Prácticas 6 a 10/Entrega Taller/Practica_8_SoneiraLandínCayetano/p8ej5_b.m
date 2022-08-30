% This script is written and read by pdetool and should NOT be edited.
% There are two recommended alternatives:
% 1) Export the required variables from pdetool and create a MATLAB script
%    to perform operations on these.
% 2) Define the problem completely using a MATLAB script. See
%    https://www.mathworks.com/help/pde/examples.html for examples
%    of this approach.
function pdemodel
[pde_fig,ax]=pdeinit;
pdetool('appl_cb',1);
pdetool('snapon','on');
set(ax,'DataAspectRatio',[1 1.1140404939651491 1]);
set(ax,'PlotBoxAspectRatio',[2.0098135426889105 1 5.1344086021505371]);
set(ax,'XLimMode','auto');
set(ax,'YLim',[-1 1]);
set(ax,'XTick',[ -1.5,...
 -1,...
 -0.5,...
 -0.10000000000000001,...
 -0.050000000000000003,...
 0,...
 0.050000000000000003,...
 0.10000000000000001,...
 0.5,...
 1,...
 1.5,...
]);
set(ax,'YTick',[ -1,...
 -0.80000000000000004,...
 -0.59999999999999998,...
 -0.39999999999999991,...
 -0.19999999999999996,...
 0,...
 0.19999999999999996,...
 0.39999999999999991,...
 0.59999999999999998,...
 0.80000000000000004,...
 1,...
]);
setappdata(ax,'extraspacex','-0.1:0.05:0.1');
pdetool('gridon','on');

% Geometry description:
pderect([-0.5 0.5 -0.79999999999999993 0.79999999999999993],'R1');
pderect([-0.050000000000000003 0.050000000000000003 -0.39999999999999991 0.39999999999999991],'R2');
set(findobj(get(pde_fig,'Children'),'Tag','PDEEval'),'String','R1-R2')

% Boundary conditions:
pdetool('changemode',0)
pdesetbd(8,...
'neu',...
1,...
'-1',...
'0')
pdesetbd(7,...
'neu',...
1,...
'1',...
'0')
pdesetbd(6,...
'dir',...
1,...
'1',...
't*exp(-0.5+y)')
pdesetbd(5,...
'neu',...
1,...
'-1',...
'0')
pdesetbd(4,...
'neu',...
1,...
'1',...
'0')
pdesetbd(3,...
'neu',...
1,...
'1',...
'0')
pdesetbd(2,...
'neu',...
1,...
'-1',...
'0')
pdesetbd(1,...
'neu',...
1,...
'-1',...
'0')

% Mesh generation:
setappdata(pde_fig,'Hgrad',1.3);
setappdata(pde_fig,'refinemethod','regular');
setappdata(pde_fig,'jiggle',char('on','mean',''));
setappdata(pde_fig,'MesherVersion','preR2013a');
pdetool('initmesh')
pdetool('refine')
pdetool('refine')
pdetool('refine')
pdetool('refine')
pdetool('refine')

% PDE coefficients:
pdeseteq(2,...
'1.0',...
'0.0',...
'(1-2*t)*exp(x+y)',...
'1.0',...
'0:0.1:5',...
'0.0',...
'0.0',...
'[0 100]')
setappdata(pde_fig,'currparam',...
['1.0             ';...
'0.0             ';...
'(1-2*t)*exp(x+y)';...
'1.0             '])

% Solve parameters:
setappdata(pde_fig,'solveparam',...
char('0','337920','10','pdeadworst',...
'0.5','longest','0','1E-4','','fixed','Inf'))

% Plotflags and user data strings:
setappdata(pde_fig,'plotflags',[1 1 1 1 3 1 7 1 0 0 0 51 1 0 0 0 0 1]);
setappdata(pde_fig,'colstring','abs(u-t*exp(x+y))');
setappdata(pde_fig,'arrowstring','abs(u-t*exp(x+y))');
setappdata(pde_fig,'deformstring','');
setappdata(pde_fig,'heightstring','');

% Solve PDE:
pdetool('solve')
