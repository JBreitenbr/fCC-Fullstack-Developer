def move_disk(a,b,s):
    if not s[b] or (s[a] and s[a][-1]<s[b][-1]):
        s[b].append(s[a].pop())
    else:
        s[a].append(s[b].pop())   
    return s
    
def hanoi_solver(n):
    d={}
    s=[[],[],[]]
    src, aux, dest = 0, 1, 2
    s[src] = list(range(n, 0, -1))
    s[aux]=[]
    s[dest]=[]
    d[0]=str(s[0])+" "+str(s[1])+" "+str(s[2])
    tM = (1 << n) - 1
    d[tM]=str(s[2])+" "+str(s[1])+" "+str(s[0])
    if n % 2 == 0:
        aux, dest = dest, aux
    for i in range(1,tM):
        if i%3==0:
            move_disk(aux,dest,s)
        elif i%3==1:
            move_disk(src,dest,s)   
        else:
            move_disk(src,aux,s)
        d[i]=str(s[0])+" "+str(s[1])+" "+str(s[2])
    stri=""
    for i in range(tM):
        stri+=str(d[i])+"\n"
    stri+=str(d[tM])
    return stri
