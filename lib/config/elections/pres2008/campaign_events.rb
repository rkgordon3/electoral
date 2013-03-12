

describe event "Caption1" do
   trigger Bush
   date "9/11/2008"
   description "An event"
   Gore outcome +1, [WI, IA, OR]
   Bush outcome -1, [MA, IA, OR]
end

describe event "Caption2" do
  trigger Gore
  date "9/2/2008"
  description "An interest group runs an ad that says Gore takes in millions of dollars from teacher's unions"
  Bush outcome +1, [WI, TN, AR]
end

describe event "Caption3" do
   description "A really, really big event"
   date "9/3/2008"
   Bush outcome  +1, [AK, AL]
   Gore outcome  -1, [AK, AL] 
end 


describe policy "Caption4" do
  date "9/4/2008"
  description "A really, really big event"
  Gore responds yes outcome +1, [MI, MO]
  Gore responds no outcome -1, [MI, MO]
end

describe policy "Caption5" do
  date "9/5/2008"
  description "A caption 5 event"
  Gore responds yes outcome +1, [MI, MO]
  responds no outcome -1, [MI, MO]
end


describe policy "Caption6" do
  date "9/6/2008"
  description "A caption 6 event"
  Gore responds yes outcome +1, [MI, MO]
  responds no outcome -1, [MI, MO]
end

describe policy "Caption7" do
  date "9/7/2008"
  description "A caption 7 event"
  Gore responds yes outcome +1, [MI, MO]
  responds no outcome -1, [MI, MO]
end
