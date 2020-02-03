import  os
import xlrd
def getIndexList(ls, text):
    for i in range(len(ls)):
        if ls[i] == text:
            index=i 
    return index
        
#ham tao list language/text
def createList(path,row):
    import xlrd
    file=(path)
    wb = xlrd.open_workbook(file)
    sheet = wb.sheet_by_index(int(0))
    col=int(sheet.ncols)
    language=[]
    for i in range(col):
         language.append(sheet.cell_value(int(row),i))
    return language

def getEquipmentText(textList,index):
    return textList[index]
    
