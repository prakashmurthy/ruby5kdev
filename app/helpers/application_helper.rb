module ApplicationHelper
  def humanize(seconds)
    [[60, :seconds], [60, :minutes], [24, :hours], [1000, :days]].map{ |count, name|
      if seconds > 0
        seconds, n = seconds.divmod(count)
        "#{n.to_i} #{ n.to_i > 1 ? name : name.to_s.singularize }"
      end
    }.compact.reverse[0..1].join( ' ' ) + " ago."
  end
end
