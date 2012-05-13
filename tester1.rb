#so we've got an algorithm that workds like this
#on the basis of n being odd or even, create sm variable
#
puts "How many queens are there?"
print '> '
n = STDIN.gets.chomp()

n = n.to_i
if n.even?
  sm = (n/2) + 1
else
  sm = (n+1)/2
end
puts sm

lg = n+1
puts lg

#the sequence is:
# move to sm, convert to q, 
# move to lg, convert to q,
# to to lg, conervt to q,
# move to small, convert to q
#
# untill...when?  until the end of the array, I guess.  You'll have to define the array as
# haveing n*n members.
#
#
