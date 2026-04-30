def dropMissingData(students):
    return students.dropna(subset=['name'])