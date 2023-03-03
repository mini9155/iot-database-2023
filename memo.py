def solution(number1, denom1,number2, denom2):

    for b in range(min(number1,denom1),0,-1):
        if number1 % b ==0 and denom1 % b ==0:
            number1 = number1 // b
            denom1 = denom1 // b
            
    for c in range(min(number2,denom2),0,-1):
        if number2 % c == 0 and denom2 % c == 0:
            number2 = number2 // c
            denom2 = denom2 // c
            
    for i in range(min(denom1,denom2),0,-1):
        if denom1 % i == 0 and denom2 % i == 0:
            a = (denom1*denom2)// i
            return [(number1 * (a // denom1)) + (number2 * (a // denom2)), a]