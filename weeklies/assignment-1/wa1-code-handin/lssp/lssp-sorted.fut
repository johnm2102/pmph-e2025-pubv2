-- Parallel Longest Satisfying Segment
--
-- ==
-- compiled input {
--    [1, -2, -2, 0, 0, 0, 0, 0, 3, 4, -6, 1]
-- }  
-- output { 
--    9
-- }
-- Test to check with long sorted list
-- compiled input {
--    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- }  
-- output { 
--    10
-- }
-- Test to check with mixed unsorted list
-- compiled input {
--    [1, 2, 3, -4, 9, 4, -2, -3, -4, -5]
-- }  
-- output { 
--    3
-- }

import "lssp"
import "lssp-seq"

type int = i32

let main (xs: []int) : int =
  let pred1 _   = true
  let pred2 x y = (x <= y)
--  in  lssp_seq pred1 pred2 xs
  in  lssp pred1 pred2 xs
