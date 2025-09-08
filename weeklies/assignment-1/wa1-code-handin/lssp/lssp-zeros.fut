-- Parallel Longest Satisfying Segment
--
-- ==
-- compiled input {
--    [1i32, -2, -2, 0, 0, 0, 0, 0, 3, 4, -6, 1]
-- }
-- output {
--    5
-- }
--
-- Test to check for continuous zeroes
-- compiled input {
--  [0, 0, 0]  
--}
-- output {
--  3
--}
-- Test to check for short run of zeroes
-- compiled input {
--  [1, 2, 3, 0, 0, 8, 3, 0]  
--}
-- output {
--  2
--}

import "lssp-seq"
import "lssp"

type int = i32

let main (xs: []int) : int =
  let pred1 x   = (x == 0)
  let pred2 x y = (x == 0) && (y == 0)
--  in  lssp_seq pred1 pred2 xs
  in  lssp pred1 pred2 xs
