def createBonusColumn(employees):
    employees['bonus'] = employees['salary'] * 2
    return employees