class BuildGraph
  def initialize(items)
    @items = items
  end

  def build_graph
    graph = {}
    graph[:category] = category_graph(@items)
    graph[:frequency] = frequency_graph(@items)
    
    graph
  end

  def category_graph(items)
    return if items == []

    graph = {}
    items.each do |item|
      if graph[item.category.name]
        graph[item.category.name] += 1
      else
        graph[item.category.name] = 1
      end
    end
    
    graph
  end

  def frequency_graph(items)
    return if items == []

    graph = {"3週間前" => 0, "2週間前" => 0, "先週" => 0, "今週" => 0}
    today = Date.today
    items.each do |item|
      date = item.created_at.to_datetime
      if today.beginning_of_week <= date
        graph["今週"] += 1
      elsif today.beginning_of_week - 1.weeks <= date
        graph["先週"] += 1
      elsif today.beginning_of_week - 2.weeks <= date
        graph["2週間前"] += 1
      elsif today.beginning_of_week - 3.weeks <= date
        graph["3週間前"] += 1
      else
        next
      end
    end
    
    graph
  end
end