# -*- coding: utf-8 -*-
"""
Created on Tue Jun 14 14:44:41 2022

@author: jgrel
"""
# C:/Users/jgrel/OneDrive/Desktop/Tese_Final/Matlab/Exponencial/serie.dat

# file_signal = open('C:/Users/guuto/Desktop/Z001.txt', 'r')

file_signal = open('C:/Users/jgrel/OneDrive/Desktop/Tese_Final/Matlab/Exponencial/serie.dat', 'r')
signal_original = []
for i in file_signal.readlines():
    line = i.strip('\n').split()
    signal_original.append(float(line[0]))
file_signal.close()

signal_sort = signal_original[:]    

signal_sort.sort() #ordenando sinal
Q = 30 #determinando numero de quantis
   ##print("Numero de quantis : ", Q)
t = [ 0 for i in range(len(signal_sort))]
for i in range(len(signal_sort)):
    for j in range(len(signal_sort)):
        if(signal_original[j]== signal_sort[i]):
            t[i] = j
            signal_original[j]= pow(10,12)
            break     
#         print("Vetor Posicao", t)   
q = [0 for i in range(Q-1)]
for i in range((int(Q)-1)) : #atribuindo os valores dos quantis em um vetor
    q[i] = int((len(signal_sort)*(1+i))/int(Q))
    quantcomp = [ 0 for i in range(int(Q)+1)]
for i in range(1, int(Q)):
    quantcomp[0] =  0
    quantcomp[i]= q[i-1]
    quantcomp[Q]= int(len(signal_sort))
#         print("Vetor quantil", quantcomp)
localiza = [ 0 for i in range(len(signal_sort))]
for i in range(len(signal_sort)): #adicionando cada elemento no seu quantil e atribuindo as posicoes dos quantis de cada elemento
    for j in range(int(Q)):
        if (i >= quantcomp[j] and i < quantcomp[j+1]):
            localiza[t[i]] = j
#         print(localiza)
matrizadj = [] 
matrizadj = [Q*[0] for i in range(int(Q))] 
for i in range(len(signal_sort)-1): # ligando os quantis(nos)
    matrizadj[localiza[i]][localiza[i+1]] = matrizadj[localiza[i]][localiza[i+1]] + 1
#         print("Matriz de adjacencia : ", matrizadj)
matriz_file = open('C:/Users/guuto/Desktop/matriz_adj.txt', 'w') #salvando arquivo txt

for i in range(len(matrizadj)):
    for j in range(len(matrizadj)):
        matriz_file.write('%d ' %matrizadj[i][j])
    matriz_file.write('\n')
matriz_file.close()