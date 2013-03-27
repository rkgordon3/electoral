describe event "Bush Supports Big Tabacco" do
  trigger Bush
  date "9/5/2008"
  description "A campaign finance reform group known to have given Bush $1M has been exposed as being a front for the tabacco lobby. "
  Gore outcome 1, [WI, IA, OR]
end

describe event "Gore Supports Teachers' Unions" do
  trigger Gore
  date "9/5/2008"
  description "An interest group "
  Bush outcome 1, [WI, AR, TN]
end

describe event "Event triggered by both" do
  date "9/9/2008"
  description "An interest group "
  Bush outcome 1, [WI, AR, TN]
end

describe event "Outcomes applied to both" do
  date "9/10/2008"
  description "An interest group "
  Bush outcome 1, [WI, AR, TN]
  Gore outcome 1, [WI, AR, TN]
end
