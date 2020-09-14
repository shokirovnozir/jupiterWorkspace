# vertices 
set V := {1 .. 7};
# (undirected) edges
set E := {<1,2>, <1,3>, <1,4>, <2,3>, <2,4>, <3,4>, <3,5>, <4,5>, <3,6>, <5,6>, <5,7>, <6,7>};
# colors (Vizing's theorem: we do not need more colors than largest degree + 1)
set C := {1 .. 6};

# edges incident to i
set delta[<i> in V] := {<i,j> in E with <i,j> in E} union {<j,i> in E with <j,i> in E};

# use color c for edge <i,j> in E?
var x[E*C] binary;
# use color c?
var y[C] binary;


minimize cost: sum<c> in C: y[c];

# every edge must receive exactly one color
subto assign: 
	forall <i,j> in E: sum<c> in C: x[i,j,c] == 1;

# edges incident to a vertex must cannot receive the same color
subto conflict:
	forall <i,c> in V*C: sum<j,k> in delta[i]: x[j,k,c] <= y[c];

