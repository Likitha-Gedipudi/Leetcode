class Solution(object):
    def removeElement(self, nums, val):
        i = 0  # position to place next non-val element

        for j in range(len(nums)):
            if nums[j] != val:
                nums[i] = nums[j]
                i += 1

        return i  # number of elements not equal to val
