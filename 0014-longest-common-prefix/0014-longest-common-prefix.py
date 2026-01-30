class Solution(object):
    def longestCommonPrefix(self, strs):
        if not strs:
            return ""
        
        # Take the first word as reference
        prefix = strs[0]
        
        for word in strs[1:]:
            # Shorten prefix until it matches the start of word
            while word[:len(prefix)] != prefix:
                prefix = prefix[:-1]  # remove last character
                if prefix == "":
                    return ""
        
        return prefix
