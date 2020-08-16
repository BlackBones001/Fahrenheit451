import random
import colorama


lista = [
"a","b","c","d","e","f",
"g","h","i","j","k","l",
"m","n","o","p","q","r",
"s","t","u","v","w","x",
"y","z","1","2","3","4",
"5","6","7","8","9","0",
"!","@","#","$","%","^",
"&","*","(",")","_","-",
"=","+","[","]","{","}",
":",";","<",">",",",".",
"~","|","?","/","A","B",
"C","D","E","F","G","H",
"I","J","K","L","M","N",
"O","P","Q","R","S","T",
"U","V","W","X","Y","Z"
]


num=input("\033[31m"+"Number of Characters: "+"\033[39m")
num=int(num)
passwd = ""
while num!=0:
    x=random.choice(lista)
    x=str(x)
    passwd=x+passwd
    num=num-1

print("\033[31m"+"The password is: "+"\033[39m", passwd)

