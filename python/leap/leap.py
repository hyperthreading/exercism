def divisible_by(num, divend):
    return not (num % divend)

def is_leap_year(year):
    # Case
    # Divisible by 4
    #   Not divisible by 100
    #   Divisible by 100
    #      Not divisible by 400 << This is the case we should exclude
    #      Divisible by 400
    return divisible_by(year, 4) and \
        not (not divisible_by(year, 400) and divisible_by(year, 100))
