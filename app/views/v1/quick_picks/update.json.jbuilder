json.data do
    json.form do
        json.call(
            @quick_pick,
            :rail_line,
            :station,
            :direction,
            :alias,
            :id,
        )
    end
end
