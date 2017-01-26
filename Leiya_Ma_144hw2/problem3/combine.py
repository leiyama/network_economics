import Cw_in
import Cw_out

cw_in = Cw_in.edge_in()
cw_out = Cw_out.edge_out()

N = len(cw_in)
cw={}
for i in range(N):
	cw[str(i)]=list(set(cw_in[str(i)])|set(cw_out[str(i)]))

output = open('cw.txt','w')
output.write(str(cw))
output.close() 
print N
