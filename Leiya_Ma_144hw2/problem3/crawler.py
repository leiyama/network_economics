import fetcher

cw_list = ['https://www.caltech.edu/']
cw_in = {'0':[]}
cw_out = {'0':[]}

N = 2200
m = 0
for i in range(N):
	url = cw_list[i]
	print url
	try:
	    new_links = fetcher.fetch_links(url)
	    for new_url in new_links:
		    if new_url == url:
			    continue
	            if new_url in cw_list:
			    k = cw_list.index(new_url)
			    cw_in[str(k)].append(str(i))
			    cw_out[str(i)].append(str(k))
			    continue
		    if m > 2199:
			    continue
		    m = m + 1
		    cw_list.append(new_url)
		    cw_in[str(m)] = [str(i)]
		    cw_out[str(m)] = []
		    cw_out[str(i)].append(str(m))
        except:
	     continue

#cnw_list ={}
#for i in range(N):
#	cnw_list = list(set(cw_in[str(i)])|set(cw_out[str(i)]))

output = open('cw_in.txt','w')
output.write(str(cw_in))
output.close()
output = open('cw_out.txt','w')
output.write(str(cw_out))
output.close()
#output = open('cnw_list.txt','w')
#output.write(str(cnw_list))
#output.close()
