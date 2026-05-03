class Solution(object):
    def isValid(self, s):
        stack = []
        
        mapping = {
            ')': '(',
            ']': '[',
            '}': '{'
        }
        
        for char in s:
            if char in mapping:
                # closing bracket
                if not stack or stack[-1] != mapping[char]:
                    return False
                stack.pop()
            else:
                # opening bracket
                stack.append(char)
        
        return len(stack) == 0