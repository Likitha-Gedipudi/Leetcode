def dropDuplicateEmails(customers):
    return customers.drop_duplicates(subset='email', keep='first')