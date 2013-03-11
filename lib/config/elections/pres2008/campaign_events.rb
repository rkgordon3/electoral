describe event "Caption1" do
   trigger Bush
   date "10/11/2008"
   description "An event"
   Gore outcome +1, [WI, IA, OR]
   Bush outcome -1, [MA, IA, OR]
end

describe event "Caption2" do
  trigger Gore
  date "10/12/2008"
  description "An interest group runs an ad that says Gore takes in millions of dollars from teacher's unions"
  Bush outcome +1, [WI, TN, AR]
end

describe event "Caption3" do
   description "A really, really big event"
   date "12/31/2013"
   Bush outcome  +1, [AK, AL]
   Gore outcome  -1, [AK, AL] 
end 


describe policy "Caption4" do
  date "11/12/20"
  Gore responds yes outcome +1, [MI, MO]
  Gore responds no outcome -1, [MI, MO]
end

describe policy "Caption5" do
  date "11/12/20"
  Gore responds yes outcome +1, [MI, MO]
  responds no outcome -1, [MI, MO]
end
