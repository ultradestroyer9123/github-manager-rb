module GithubReposHelper
    def language_color(lang)
    list = {
        ruby: "#701516",
        javascript: "#f1e05a",
        python: "#3572A5",
        java: "#b07219",
        php: "#4F5D95",
        c: "#555555",
        cpp: "#f34b7d",
        css: "#563d7c",
        html: "#e34c26",
        go: "#00ADD8",
        swift: "#ffac45",
        typescript: "#2b7489",
        shell: "#89e051",
        kotlin: "#A97BFF",
        rust: "#dea584",
        scala: "#c22d40",
        perl: "#0298c3",
        r: "#198ce7",
        dart: "#00B4AB",
        elixir: "#6e4a7e",
        erlang: "#B83998",
        haskell: "#5e5086",
        lua: "#000080",
        matlab: "#e16737",
        objective_c: "#438eff",
        pascal: "#E3F171",
        sql: "#e38c00",
        vb: "#945db7",
        vhdl: "#adb2cb",
        xml: "#0060ac",
        yaml: "#cb171e"
    }
        list[lang.to_s.downcase.to_sym] || "#666666"
    end
end
