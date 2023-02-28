-- https://leetcode.com/problems/rank-scores/

select score ,Dense_Rank() over (order by score Desc) as rank from Scores