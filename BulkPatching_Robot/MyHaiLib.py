def getIndexList(ls, text):
    for i in range(len(ls)):
        if ls[i] == text:
            return i
        
#ham tao list language/text
def createList(path,row):
    import xlrd
    file=(path)
    wb = xlrd.open_workbook(file)
    sheet = wb.sheet_by_index(0)
    col=int(sheet.ncols)
    return col
    
    
def getEquipmentText(path,language):
    lang=createList(path,0)
    textList=createList(path,1)
    index=getIndexList(lang,language)
    text=textList[index]
    return text
