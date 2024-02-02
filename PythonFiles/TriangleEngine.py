def resultOutput(kylki1, kylki2, kylki3):
    if (kylki1 == kylki2 and kylki2 == kylki3):
        return "Tasasivuinen kolmio"
    elif (kylki1 == kylki2 or kylki2 == kylki3 or kylki3 == kylki1):
        return "Tasakylkinen kolmio"
    else:
        return "Epäsäännöllinen kolmio"
    
    
    # RONY MÖLKÄNEN 
