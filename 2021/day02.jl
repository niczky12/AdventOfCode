### A Pluto.jl notebook ###
# v0.17.3

using Markdown
using InteractiveUtils

# ╔═╡ 8d375e12-5f3c-11ec-0551-0d5da3263f13
using DelimitedFiles

# ╔═╡ da0f707b-5c2a-4ab5-89c2-c48c04ef9404
d = readdlm("inputs/day_02.txt")

# ╔═╡ da7e5513-c0be-4bc6-9126-80ecfefd73db
directions = Dict(
	"forward" => [1, 0],
	"down" => [0, 1],
	"up" => [0, -1]
)

# ╔═╡ 127bd9b0-6b9b-4203-a325-3ddfae44dec2
instructions = map(command -> directions[command], d[:, 1])

# ╔═╡ 55369b8a-fd99-462f-a05a-6775a11652c3
steps = d[:, 2]

# ╔═╡ 4d5841f6-4f6f-44c3-af4a-084ce4e59864
*(sum(instructions .* steps)...)

# ╔═╡ 265dca33-2dd8-4adc-8612-4e905036ef5f
md"""
# Part II

In addition to horizontal position and depth, you'll also need to track a third value, aim, which also starts at 0. The commands also mean something entirely different than you first thought:

- down X increases your aim by X units.
- up X decreases your aim by X units.
- forward X does two things: It increases your horizontal position by X units. It increases your depth by your aim multiplied by X.

Again note that since you're on a submarine, down and up do the opposite of what you might expect: "down" means aiming in the positive direction.

"""

# ╔═╡ 8dca4413-94d8-4778-bda7-2143da76160b
function move_submarine(instructions, steps)
	aim = 0
	location = [0, 0]
	
	for (inst, step) in zip(instructions, steps)
		if inst == "up"
			aim -= step
		elseif inst == "down"
			aim += step
		else
			move = [step, step * aim]
			location += move
		end
	end
	return location
end	

# ╔═╡ b9c2d28c-dc6c-49f9-9a6e-7ef2ba2dfec9
*(move_submarine(d[:, 1], steps)...)

# ╔═╡ 1b2e827f-31fc-4ba7-9d64-86ec46ce4ee8


# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
DelimitedFiles = "8bb1440f-4735-579b-a4ab-409b98df4dab"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.0"
manifest_format = "2.0"

[[deps.DelimitedFiles]]
deps = ["Mmap"]
uuid = "8bb1440f-4735-579b-a4ab-409b98df4dab"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"
"""

# ╔═╡ Cell order:
# ╠═8d375e12-5f3c-11ec-0551-0d5da3263f13
# ╠═da0f707b-5c2a-4ab5-89c2-c48c04ef9404
# ╠═da7e5513-c0be-4bc6-9126-80ecfefd73db
# ╠═127bd9b0-6b9b-4203-a325-3ddfae44dec2
# ╠═55369b8a-fd99-462f-a05a-6775a11652c3
# ╠═4d5841f6-4f6f-44c3-af4a-084ce4e59864
# ╠═265dca33-2dd8-4adc-8612-4e905036ef5f
# ╠═8dca4413-94d8-4778-bda7-2143da76160b
# ╠═b9c2d28c-dc6c-49f9-9a6e-7ef2ba2dfec9
# ╠═1b2e827f-31fc-4ba7-9d64-86ec46ce4ee8
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
