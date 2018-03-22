# This code has been written "notebook style"
# with no mind for optimization at this point
#############################################
# PPMCC for samples is calculated as such:
# https://en.wikipedia.org/wiki/Pearson_correlation_coefficient#For_a_sample
#
#
#
#############################################
# Begin code
#############################################

# Read in data for X and convert to numeric
x = Array.new
IO.foreach("data1") {|datum| x.push(datum.to_f)}
# Read in data for Y and convert to numeric
y = Array.new
IO.foreach("data2") {|datum| y.push(datum.to_f)}

# Calculate means of samples
def mean(sample)
	sum = 0
	for n in sample
		sum += n
	end
	sum / sample.size
end

xbar = mean(x)
ybar = mean(y)

# Calculate the PPMCC
n = x.size # nSamples
numerator = 0
ldenom = 0
rdenom = 0
x.zip(y) {
	|xi, yi| 
	xdiff = xi - xbar
	ydiff = yi - ybar

	numerator += (xi - xbar) * (yi-ybar)
	ldenom += xdiff ** 2
	rdenom += ydiff ** 2
}

ldenom **= 0.5
rdenom **= 0.5

ppmcc = numerator / (ldenom * rdenom)

p ppmcc