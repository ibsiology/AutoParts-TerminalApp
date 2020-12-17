require_relative ("./methods.rb")
require "colorize"
require "colorized_string"
require "tty-prompt"
require "rspec"
$prompt = TTY::Prompt.new

parts = [
    {name: "alternator", quantity: 120},
    {name: "battery", quantity: 90},
    {name: "starter motor", quantity: 130},
    {name: "brakes", quantity: 110},
    {name: "distributor", quantity: 130},
    {name: "spark plug", quantity: 40},
    {name: "shock absorber", quantity: 100},
    {name: "ignition", quantity: 90},
    {name: "radiator", quantity: 150}
]

def menu_selection
    return $prompt.select("Select an option.",
    ["Inventory", "Search for Part", "Add Part", "Receive Stock", "Delete Part", "Exit"])
end

answer = ""
while answer != "Exit"
    answer = menu_selection
    case answer
        when "Inventory"
            answer = inventory(parts)
        when "Search for Part"
            answer = search_part(parts)
        when "Add Part"
            answer = add_part(parts, "")
        when "Receive Stock"
            answer = received_stock(parts)
        when "Delete Part"
            answer = delete_part(parts)
        else
            puts "Exit"
            system "clear"
        end
    end