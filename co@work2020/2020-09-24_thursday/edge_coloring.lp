\ This file was automatically generated by Zimpl
\ set V := {1 .. 7};
\ set E := {<1,2>, <1,3>, <1,4>, <2,3>, <2,4>, <3,4>, <3,5>, <4,5>, <3,6>, <5,6>, <5,7>, <6,7>};
\ set C := {1 .. 6};
\ set delta[<i> in V] := {<i,j> in E with <i,j> in E} union {<j,i> in E with <j,i> in E};
\ var x[E*C] binary;
\ var y[C] binary;
\ minimize cost: sum<c> in C: y[c];
\ subto assign:   forall <i,j> in E: sum<c> in C: x[i,j,c] == 1;
\ subto conflict:  forall <i,c> in V*C: sum<j,k> in delta[i]: x[j,k,c] <= y[c];
\Problem name: edge_coloring.zpl
Minimize
 cost:  + y#1 + y#2 + y#3 + y#4 + y#5 + y#6
 
Subject to
 assign_1:
  + x#1#2#6 + x#1#2#5 + x#1#2#4 + x#1#2#3 + x#1#2#2 + x#1#2#1
  = 1
 assign_2:
  + x#1#3#6 + x#1#3#5 + x#1#3#4 + x#1#3#3 + x#1#3#2 + x#1#3#1
  = 1
 assign_3:
  + x#1#4#6 + x#1#4#5 + x#1#4#4 + x#1#4#3 + x#1#4#2 + x#1#4#1
  = 1
 assign_4:
  + x#2#3#6 + x#2#3#5 + x#2#3#4 + x#2#3#3 + x#2#3#2 + x#2#3#1
  = 1
 assign_5:
  + x#2#4#6 + x#2#4#5 + x#2#4#4 + x#2#4#3 + x#2#4#2 + x#2#4#1
  = 1
 assign_6:
  + x#3#4#6 + x#3#4#5 + x#3#4#4 + x#3#4#3 + x#3#4#2 + x#3#4#1
  = 1
 assign_7:
  + x#3#5#6 + x#3#5#5 + x#3#5#4 + x#3#5#3 + x#3#5#2 + x#3#5#1
  = 1
 assign_8:
  + x#3#6#6 + x#3#6#5 + x#3#6#4 + x#3#6#3 + x#3#6#2 + x#3#6#1
  = 1
 assign_9:
  + x#4#5#6 + x#4#5#5 + x#4#5#4 + x#4#5#3 + x#4#5#2 + x#4#5#1
  = 1
 assign_10:
  + x#5#6#6 + x#5#6#5 + x#5#6#4 + x#5#6#3 + x#5#6#2 + x#5#6#1
  = 1
 assign_11:
  + x#5#7#6 + x#5#7#5 + x#5#7#4 + x#5#7#3 + x#5#7#2 + x#5#7#1
  = 1
 assign_12:
  + x#6#7#6 + x#6#7#5 + x#6#7#4 + x#6#7#3 + x#6#7#2 + x#6#7#1
  = 1
 conflict_1:
  - y#1 + x#1#4#1 + x#1#3#1 + x#1#2#1 <= 0
 conflict_2:
  - y#2 + x#1#4#2 + x#1#3#2 + x#1#2#2 <= 0
 conflict_3:
  - y#3 + x#1#4#3 + x#1#3#3 + x#1#2#3 <= 0
 conflict_4:
  - y#4 + x#1#4#4 + x#1#3#4 + x#1#2#4 <= 0
 conflict_5:
  - y#5 + x#1#4#5 + x#1#3#5 + x#1#2#5 <= 0
 conflict_6:
  - y#6 + x#1#4#6 + x#1#3#6 + x#1#2#6 <= 0
 conflict_7:
  - y#1 + x#1#2#1 + x#2#4#1 + x#2#3#1 <= 0
 conflict_8:
  - y#2 + x#1#2#2 + x#2#4#2 + x#2#3#2 <= 0
 conflict_9:
  - y#3 + x#1#2#3 + x#2#4#3 + x#2#3#3 <= 0
 conflict_10:
  - y#4 + x#1#2#4 + x#2#4#4 + x#2#3#4 <= 0
 conflict_11:
  - y#5 + x#1#2#5 + x#2#4#5 + x#2#3#5 <= 0
 conflict_12:
  - y#6 + x#1#2#6 + x#2#4#6 + x#2#3#6 <= 0
 conflict_13:
  - y#1 + x#2#3#1 + x#1#3#1 + x#3#6#1 + x#3#5#1 + x#3#4#1
  <= 0
 conflict_14:
  - y#2 + x#2#3#2 + x#1#3#2 + x#3#6#2 + x#3#5#2 + x#3#4#2
  <= 0
 conflict_15:
  - y#3 + x#2#3#3 + x#1#3#3 + x#3#6#3 + x#3#5#3 + x#3#4#3
  <= 0
 conflict_16:
  - y#4 + x#2#3#4 + x#1#3#4 + x#3#6#4 + x#3#5#4 + x#3#4#4
  <= 0
 conflict_17:
  - y#5 + x#2#3#5 + x#1#3#5 + x#3#6#5 + x#3#5#5 + x#3#4#5
  <= 0
 conflict_18:
  - y#6 + x#2#3#6 + x#1#3#6 + x#3#6#6 + x#3#5#6 + x#3#4#6
  <= 0
 conflict_19:
  - y#1 + x#3#4#1 + x#2#4#1 + x#1#4#1 + x#4#5#1 <= 0
 conflict_20:
  - y#2 + x#3#4#2 + x#2#4#2 + x#1#4#2 + x#4#5#2 <= 0
 conflict_21:
  - y#3 + x#3#4#3 + x#2#4#3 + x#1#4#3 + x#4#5#3 <= 0
 conflict_22:
  - y#4 + x#3#4#4 + x#2#4#4 + x#1#4#4 + x#4#5#4 <= 0
 conflict_23:
  - y#5 + x#3#4#5 + x#2#4#5 + x#1#4#5 + x#4#5#5 <= 0
 conflict_24:
  - y#6 + x#3#4#6 + x#2#4#6 + x#1#4#6 + x#4#5#6 <= 0
 conflict_25:
  - y#1 + x#4#5#1 + x#3#5#1 + x#5#7#1 + x#5#6#1 <= 0
 conflict_26:
  - y#2 + x#4#5#2 + x#3#5#2 + x#5#7#2 + x#5#6#2 <= 0
 conflict_27:
  - y#3 + x#4#5#3 + x#3#5#3 + x#5#7#3 + x#5#6#3 <= 0
 conflict_28:
  - y#4 + x#4#5#4 + x#3#5#4 + x#5#7#4 + x#5#6#4 <= 0
 conflict_29:
  - y#5 + x#4#5#5 + x#3#5#5 + x#5#7#5 + x#5#6#5 <= 0
 conflict_30:
  - y#6 + x#4#5#6 + x#3#5#6 + x#5#7#6 + x#5#6#6 <= 0
 conflict_31:
  - y#1 + x#5#6#1 + x#3#6#1 + x#6#7#1 <= 0
 conflict_32:
  - y#2 + x#5#6#2 + x#3#6#2 + x#6#7#2 <= 0
 conflict_33:
  - y#3 + x#5#6#3 + x#3#6#3 + x#6#7#3 <= 0
 conflict_34:
  - y#4 + x#5#6#4 + x#3#6#4 + x#6#7#4 <= 0
 conflict_35:
  - y#5 + x#5#6#5 + x#3#6#5 + x#6#7#5 <= 0
 conflict_36:
  - y#6 + x#5#6#6 + x#3#6#6 + x#6#7#6 <= 0
 conflict_37:
  - y#1 + x#6#7#1 + x#5#7#1 <= 0
 conflict_38:
  - y#2 + x#6#7#2 + x#5#7#2 <= 0
 conflict_39:
  - y#3 + x#6#7#3 + x#5#7#3 <= 0
 conflict_40:
  - y#4 + x#6#7#4 + x#5#7#4 <= 0
 conflict_41:
  - y#5 + x#6#7#5 + x#5#7#5 <= 0
 conflict_42:
  - y#6 + x#6#7#6 + x#5#7#6 <= 0
Bounds
 0 <= x#1#2#1 <= 1
 0 <= x#1#2#2 <= 1
 0 <= x#1#2#3 <= 1
 0 <= x#1#2#4 <= 1
 0 <= x#1#2#5 <= 1
 0 <= x#1#2#6 <= 1
 0 <= x#1#3#1 <= 1
 0 <= x#1#3#2 <= 1
 0 <= x#1#3#3 <= 1
 0 <= x#1#3#4 <= 1
 0 <= x#1#3#5 <= 1
 0 <= x#1#3#6 <= 1
 0 <= x#1#4#1 <= 1
 0 <= x#1#4#2 <= 1
 0 <= x#1#4#3 <= 1
 0 <= x#1#4#4 <= 1
 0 <= x#1#4#5 <= 1
 0 <= x#1#4#6 <= 1
 0 <= x#2#3#1 <= 1
 0 <= x#2#3#2 <= 1
 0 <= x#2#3#3 <= 1
 0 <= x#2#3#4 <= 1
 0 <= x#2#3#5 <= 1
 0 <= x#2#3#6 <= 1
 0 <= x#2#4#1 <= 1
 0 <= x#2#4#2 <= 1
 0 <= x#2#4#3 <= 1
 0 <= x#2#4#4 <= 1
 0 <= x#2#4#5 <= 1
 0 <= x#2#4#6 <= 1
 0 <= x#3#4#1 <= 1
 0 <= x#3#4#2 <= 1
 0 <= x#3#4#3 <= 1
 0 <= x#3#4#4 <= 1
 0 <= x#3#4#5 <= 1
 0 <= x#3#4#6 <= 1
 0 <= x#3#5#1 <= 1
 0 <= x#3#5#2 <= 1
 0 <= x#3#5#3 <= 1
 0 <= x#3#5#4 <= 1
 0 <= x#3#5#5 <= 1
 0 <= x#3#5#6 <= 1
 0 <= x#3#6#1 <= 1
 0 <= x#3#6#2 <= 1
 0 <= x#3#6#3 <= 1
 0 <= x#3#6#4 <= 1
 0 <= x#3#6#5 <= 1
 0 <= x#3#6#6 <= 1
 0 <= x#4#5#1 <= 1
 0 <= x#4#5#2 <= 1
 0 <= x#4#5#3 <= 1
 0 <= x#4#5#4 <= 1
 0 <= x#4#5#5 <= 1
 0 <= x#4#5#6 <= 1
 0 <= x#5#6#1 <= 1
 0 <= x#5#6#2 <= 1
 0 <= x#5#6#3 <= 1
 0 <= x#5#6#4 <= 1
 0 <= x#5#6#5 <= 1
 0 <= x#5#6#6 <= 1
 0 <= x#5#7#1 <= 1
 0 <= x#5#7#2 <= 1
 0 <= x#5#7#3 <= 1
 0 <= x#5#7#4 <= 1
 0 <= x#5#7#5 <= 1
 0 <= x#5#7#6 <= 1
 0 <= x#6#7#1 <= 1
 0 <= x#6#7#2 <= 1
 0 <= x#6#7#3 <= 1
 0 <= x#6#7#4 <= 1
 0 <= x#6#7#5 <= 1
 0 <= x#6#7#6 <= 1
 0 <= y#1 <= 1
 0 <= y#2 <= 1
 0 <= y#3 <= 1
 0 <= y#4 <= 1
 0 <= y#5 <= 1
 0 <= y#6 <= 1
General
 x#1#2#1
 x#1#2#2
 x#1#2#3
 x#1#2#4
 x#1#2#5
 x#1#2#6
 x#1#3#1
 x#1#3#2
 x#1#3#3
 x#1#3#4
 x#1#3#5
 x#1#3#6
 x#1#4#1
 x#1#4#2
 x#1#4#3
 x#1#4#4
 x#1#4#5
 x#1#4#6
 x#2#3#1
 x#2#3#2
 x#2#3#3
 x#2#3#4
 x#2#3#5
 x#2#3#6
 x#2#4#1
 x#2#4#2
 x#2#4#3
 x#2#4#4
 x#2#4#5
 x#2#4#6
 x#3#4#1
 x#3#4#2
 x#3#4#3
 x#3#4#4
 x#3#4#5
 x#3#4#6
 x#3#5#1
 x#3#5#2
 x#3#5#3
 x#3#5#4
 x#3#5#5
 x#3#5#6
 x#3#6#1
 x#3#6#2
 x#3#6#3
 x#3#6#4
 x#3#6#5
 x#3#6#6
 x#4#5#1
 x#4#5#2
 x#4#5#3
 x#4#5#4
 x#4#5#5
 x#4#5#6
 x#5#6#1
 x#5#6#2
 x#5#6#3
 x#5#6#4
 x#5#6#5
 x#5#6#6
 x#5#7#1
 x#5#7#2
 x#5#7#3
 x#5#7#4
 x#5#7#5
 x#5#7#6
 x#6#7#1
 x#6#7#2
 x#6#7#3
 x#6#7#4
 x#6#7#5
 x#6#7#6
 y#1
 y#2
 y#3
 y#4
 y#5
 y#6
End
