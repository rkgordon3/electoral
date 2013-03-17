describe event "Caption1" do
   date "9/1/2008"
   description "An event"
   Gore outcome +20, [AR, AZ, FL]
   Bush outcome -50, [AR, AZ, FL]
end

describe event "Caption2" do
  date "9/2/2008"
  description "An interest group runs an ad that says Gore takes in millions of dollars from teacher's unions"
  Bush outcome +50, [AR, AZ, FL]
end

describe event "Caption3" do
   description "A really, really big event"
   date "9/3/2008"
   Bush outcome  +50, [AR, AZ, FL]
   Gore outcome  -50, [AR, AZ, FL]
end 


describe policy "Caption4" do
  date "9/4/2008"
  description "A really, really big event"
  Gore responds yes outcome +50, [AR, AZ, FL]
  Gore responds no outcome -50, [AR, AZ, FL]
  Bush responds yes outcome +50, [AR, AZ, FL]
  Bush responds no outcome +50, [AR, AZ, FL]
end

describe policy "Caption5" do
  date "9/5/2008"
  description "A caption 5 event"
  Gore responds yes outcome +50, [AR, AZ, FL]
  Bush responds yes outcome +50, [AR, AZ, FL]
  responds no outcome -50, [AR, AZ, FL]
end


describe policy "Caption6" do
  date "9/6/2008"
  description "A caption 6 event"
  Gore responds yes outcome +50, [AR, AZ, FL]
  Bush responds yes outcome +50, [AR, AZ, FL]
  responds no outcome -50, [MI, MO]
end

describe policy "Debate" do
  date "9/7/2008"
  description "A caption 7 event"
  Gore responds yes outcome +50, [AR, AZ, FL]
   Bush responds yes outcome +50, [AR, AZ, FL]
  responds no outcome -50, [AR, AZ, FL]
end
describe policy "Debate_9_8" do
  date "9/8/2008"
  description "A 9-8 debate"
  Gore responds yes outcome +50, [AR, AZ, FL]
   Bush responds yes outcome +50, [AR, AZ, FL]
  responds no outcome -50, [AR, AZ, FL]
end
describe policy "Debate 9 9" do
  date "9/9/2008"
  description "A 9 9 debate"
  Gore responds yes outcome +50, [AR, AZ, FL]
  Bush responds yes outcome +50,[AR, AZ, FL]
  responds no outcome -50, [AR, AZ, FL]
end

describe policy "Debate 9 10" do
  date "9/10/2008"
  description "A 9 10 debate"
  Gore responds yes outcome +50, [AR, AZ, FL]
  Bush responds yes outcome +50, [AR, AZ, FL]
  responds no outcome -50,[AR, AZ, FL]
end
