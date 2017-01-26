import data

nd = data.ReadData()

n = len(nd)

def computeDegree(nd):
    n = len(nd)
    degree = list(range(n))
    for a in nd.keys():
	    degree[int(a)]=len(nd[a])

    maxDegree = max(degree)
    histo = list(0 for i in range(maxDegree +1))
    for i in range(n):
	    histo[degree[i]] = histo[degree[i]] + 1
    ccdf = list(0 for i in range(maxDegree +1))
    ccdf[0] = 1
    for i in range(1, maxDegree + 1):
	    ccdf[i] = ccdf[i - 1] - float(histo[i])/n

    output = open('degree.txt','w')
    output.write(str(degree))
    output.write('\n')
    output.write(str(histo))
    output.write('\n')
    output.write(str(ccdf))
    output.close()

    return degree

print "--begin--"
#compute the degree of the graph
computeDegree(nd)

def computeCluster(nd):
    num_tpl = 0
    num_trg = 0
    snum_trg = 0
    sum_clu = 0
    for a in nd.keys():
	   snum_trg = 0
	   num_tpl = num_tpl + float(len(nd[a])*(len(nd[a])-1))/2
	   for i in range(len(nd[a])):
		   for j in range(i + 1, len(nd[a])):
			   if nd[a][j] in nd[nd[a][i]]:
				   num_trg = num_trg + 1
				   snum_trg = snum_trg + 1
	   if len(nd[a]) > 1:
		    sum_clu = sum_clu + float(snum_trg)/(float(len(nd[a]))*(len(nd[a])-1)/2)
    avg_clu = sum_clu/len(nd)
    all_clu = float(num_trg)/num_tpl

    return [avg_clu, all_clu]
#compute the clustering coeffecient of the graph
clu = computeCluster(nd)
print "average clustering coefficient:", clu[0], "\n"
print "overall clustering coefficient:", clu[1], "\n"

def computeDiameter(nd):
    n = len(nd)
    A = list(list(n for i in range(n)) for j in range(n))
    for a in nd.keys():
	    A[int(a)][int(a)] = 0
	    for b in nd[a]:
		    A[int(a)][int(b)] = 1
    
    for k in range(n):
	    for i in range(n):
		    for j in range(n):
			    if A[i][k] + A[k][j] < A[i][j]:
				    A[i][j] = A[i][k] + A[k][j]
				    A[j][i] = A[i][j]

    max_dmt = 0
    sum_dmt = 0
    for i in range(n):
	    for j in range(n):
		    sum_dmt = sum_dmt + A[i][j]
		    if A[i][j] > max_dmt:
			    max_dmt = A[i][j]
    avg_dmt = float(sum_dmt)/(n*(n-1))		
    return [max_dmt, avg_dmt]

#compute the maximal diameter and average diameter of the graph
dia = computeDiameter(nd)
print "maximal diameter:", dia[0], "\n"
print "average diameter:", dia[1], "\n"
print "--end--"    
