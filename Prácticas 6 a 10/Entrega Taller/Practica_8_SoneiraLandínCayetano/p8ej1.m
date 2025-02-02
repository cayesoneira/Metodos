% This script is written and read by pdetool and should NOT be edited.
% There are two recommended alternatives:
% 1) Export the required variables from pdetool and create a MATLAB script
%    to perform operations on these.
% 2) Define the problem completely using a MATLAB script. See
%    https://www.mathworks.com/help/pde/examples.html for examples
%    of this approach.
function pdemodel
[pde_fig,ax]=pdeinit;
pdetool('appl_cb',9);
pdetool('snapon','on');
set(ax,'DataAspectRatio',[1 1 1]);
set(ax,'PlotBoxAspectRatio',[1.5 1 1]);
set(ax,'XLim',[-1.5 1.5]);
set(ax,'YLim',[-1 1]);
set(ax,'XTick',[ -1.5,...
 -1.3999999999999999,...
 -1.3,...
 -1.2,...
 -1.1000000000000001,...
 -1,...
 -0.89999999999999991,...
 -0.79999999999999993,...
 -0.69999999999999996,...
 -0.59999999999999998,...
 -0.5,...
 -0.39999999999999991,...
 -0.29999999999999982,...
 -0.19999999999999996,...
 -0.099999999999999867,...
 0,...
 0.099999999999999867,...
 0.19999999999999996,...
 0.29999999999999982,...
 0.39999999999999991,...
 0.5,...
 0.59999999999999998,...
 0.69999999999999996,...
 0.79999999999999993,...
 0.89999999999999991,...
 1,...
 1.1000000000000001,...
 1.2,...
 1.3,...
 1.3999999999999999,...
 1.5,...
]);
set(ax,'YTick',[ -1,...
 -0.90000000000000002,...
 -0.80000000000000004,...
 -0.69999999999999996,...
 -0.59999999999999998,...
 -0.5,...
 -0.39999999999999991,...
 -0.29999999999999993,...
 -0.19999999999999996,...
 -0.099999999999999978,...
 0,...
 0.099999999999999978,...
 0.19999999999999996,...
 0.29999999999999993,...
 0.39999999999999991,...
 0.5,...
 0.59999999999999998,...
 0.69999999999999996,...
 0.80000000000000004,...
 0.90000000000000002,...
 1,...
]);
pdetool('gridon','on');

% Geometry description:
pderect([-1 1 -0.5 0.5],'R1');
pdecirc(-0.79999999999999993,0.29999999999999993,0.20000000000000007,'C1');
pdecirc(-0.79999999999999993,-0.29999999999999993,0.20000000000000007,'C2');
pdecirc(0.79999999999999993,0.29999999999999993,0.20000000000000007,'C3');
pdecirc(0.79999999999999993,-0.29999999999999993,0.20000000000000007,'C4');
pderect([-0.79999999999999993 -1 -0.29999999999999993 -0.5],'SQ1');
pderect([-0.79999999999999993 -1 0.29999999999999993 0.5],'SQ2');
pderect([0.79999999999999993 1 0.29999999999999993 0.5],'SQ3');
pderect([0.79999999999999993 1 -0.29999999999999993 -0.5],'SQ4');
set(findobj(get(pde_fig,'Children'),'Tag','PDEEval'),'String','(R1-SQ1-SQ2-SQ3-SQ4)+C1+C2+C3+C4')

% Boundary conditions:
pdetool('changemode',0)
pdesetbd(26,...
'dir',...
1,...
'1',...
'0')
pdesetbd(23,...
'dir',...
1,...
'1',...
'0')
pdesetbd(17,...
'dir',...
1,...
'1',...
'0')
pdesetbd(16,...
'dir',...
1,...
'1',...
'0')
pdesetbd(10,...
'dir',...
1,...
'1',...
'0')
pdesetbd(9,...
'dir',...
1,...
'1',...
'0')
pdesetbd(6,...
'dir',...
1,...
'1',...
'0')
pdesetbd(1,...
'dir',...
1,...
'1',...
'0')

% Mesh generation:
setappdata(pde_fig,'Hgrad',1.3);
setappdata(pde_fig,'refinemethod','regular');
setappdata(pde_fig,'jiggle',char('on','mean',''));
setappdata(pde_fig,'MesherVersion','preR2013a');
pdetool('initmesh')
pdetool('refine')
pdetool('refine')

% PDE coefficients:
pdeseteq(1,...
'1.0',...
'1.0',...
'(1.0)+(1.0).*(0.0)',...
'(1.0).*(1.0)',...
'0:10',...
'0.0',...
'0.0',...
'[0 100]')
setappdata(pde_fig,'currparam',...
['1.0';...
'1.0';...
'1.0';...
'1.0';...
'1.0';...
'0.0'])

% Solve parameters:
setappdata(pde_fig,'solveparam',...
char('0','5184','10','pdeadworst',...
'0.5','longest','0','1E-4','','fixed','Inf'))

% Plotflags and user data strings:
setappdata(pde_fig,'plotflags',[1 1 1 1 1 1 7 1 0 0 0 1 1 0 0 0 0 1]);
setappdata(pde_fig,'colstring','');
setappdata(pde_fig,'arrowstring','');
setappdata(pde_fig,'deformstring','');
setappdata(pde_fig,'heightstring','');

% Solve PDE:
pdetool('solve')
