class Solution:
    def twoSum(self, nums, target):
        index_map = {}
        for i, num in enumerate(nums):
            complement = target - num
            if complement in index_map:
                return [index_map[complement], i]
            index_map[num] = i
