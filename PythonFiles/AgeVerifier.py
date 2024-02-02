         
def verifyAge (age):
    if age < 0:
      return "Virhe! Ikä ei voi olla negatiivinen."
    elif age < 18:
      return "Olet lapsi."
    elif age >= 18 and age <=70:
       return "Olet aikuinen."
    else: 
       return "Olet eläkeläinen."
    
   
 
                     
