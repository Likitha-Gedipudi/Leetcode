class Solution(object):
    def plusOne(self, digits):
        n = len(digits)

        # Start from the last digit
        for i in range(n - 1, -1, -1):
            # If digit is less than 9, just add 1 and return
            if digits[i] < 9:
                digits[i] += 1
                return digits
            # If digit is 9, it becomes 0 (carry)
            digits[i] = 0

        # If we exited the loop, all digits were 9
        return [1] + digits
