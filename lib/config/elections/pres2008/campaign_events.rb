describe event "Campaign Finance Attack Ad" do
   candidate Bush
   date "10/11/2008"
   description "A campaign finance reform intereste group runs an ad that says Bush takes in millions of dollars from tobacco companies"
   Gore outcome +1, [WI, IA, OR]
   Bush outcome -1, [MA, IA, OR]
end



describe event "Teacher Union Attack Ad" do
  candidate Gore
  date "10/12/2008"
  description "An interest group runs an ad that says Gore takes in millions of dollars from teacher's unions"
  Bush outcome +1, [WI, TN, AR]
end

describe event "The Big Event" do
   description "A really, really big event"
   date "12/31/2013"
   Bush outcome  +1, [AK, AL]
   Gore outcome  -1, [AK, AL] 
end 


describe policy "Should we expand our oil drilling, including coastal waters and in National Wildlife Refuge in Alaska?" do
   date "11/12/20"
   Gore responds yes outcome +1, [MI, MO]
  # Gore responds no  outcome -1, [MI, MO] 
   #responds yes  outcome +1, [MN, IL] 
end
