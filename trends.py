import numpy as np

# connecting to google
from pytrends.request import TrendReq
pytrends = TrendReq(hl='en-US', tz=360)

kw_list = ["bitcoin"]

#kwlist = dictionary of search terms
#timeframe has specific parameters and should be looked up on the documentation
pytrends.build_payload(kw_list, cat=0, timeframe='now 7-d', geo='', gprop='')
interest = pytrends.interest_over_time()

print(interest.shape[0])

for i in range(0, interest.shape[0] - 1):
	string = str(interest.index.values[i])[:10]
	string += '\t'
	string += str(interest.values[i][0])
	print(string)

#np.savetxt('trendData.txt', interest.values, fmt='%s', delimiter="\t", newline="\n", header="1\t2\t3")

#print("Data printed to file.")