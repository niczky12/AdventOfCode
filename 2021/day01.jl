### A Pluto.jl notebook ###
# v0.17.3

using Markdown
using InteractiveUtils

# ╔═╡ a9ed5ba5-9f59-4bbf-b35c-4a5a36d0b6e0
using DelimitedFiles

# ╔═╡ 291ffe60-5c63-415a-a5f7-1e40e59e2cf9
# easier way with IterTools
using IterTools

# ╔═╡ 748af037-7d04-4d73-9aaa-575c48fac5f3
depths = readdlm("inputs/day_01.txt")[:, 1]

# ╔═╡ 844a02ca-0744-4523-99a8-37918bff34b3
md"""
# Part 1

To do this, count the number of times a depth measurement increases from the previous measurement. (There is no measurement before the first measurement.) In the example above, the changes are as follows.
"""

# ╔═╡ 6467bbda-bf07-4ee0-81a3-ae4511c6e8eb
# the ugly way
begin
deeper_counts = 0

for (i, depth) in enumerate(depths[1:end-1])
	if depth < depths[i + 1]
		global deeper_counts += 1
	end
end

deeper_counts
end

# ╔═╡ 3407599f-b7f6-4b02-a36b-5792e4111be6
# the neat way with broadcasting
sum((depths[2:end] .- depths[1:end-1]) .> 0)

# ╔═╡ 6da7f6d6-755b-43cf-aac2-b99299222955
md"""Part 2
Considering every single measurement isn't as useful as you expected: there's just too much noise in the data.

Instead, consider sums of a three-measurement sliding window. Again considering the above example:

```
199  A      
200  A B    
208  A B C  
210    B C D
200  E   C D
207  E F   D
240  E F G  
269    F G H
260      G H
263        H
```

Start by comparing the first and second three-measurement windows. The measurements in the first window are marked A (199, 200, 208); their sum is 199 + 200 + 208 = 607. The second window is marked B (200, 208, 210); its sum is 618. The sum of measurements in the second window is larger than the sum of the first, so this first comparison increased.

Your goal now is to count the number of times the sum of measurements in this sliding window increases from the previous sum. So, compare A with B, then compare B with C, then C with D, and so on. Stop when there aren't enough measurements left to create a new three-measurement sum.
"""

# ╔═╡ 62fa6097-336b-4ee3-aa2e-7536ac7e66a8
# the purist way
function rolling_counter(depths)
	rolling_depths = []
	current_depths = []
		
	for depth in depths
		push!(current_depths, depth)

		# in case we still haven't filled our current_depths array
		length(current_depths) < 3 && continue
		push!(rolling_depths, sum(current_depths))
		popfirst!(current_depths)
	end

	sum((rolling_depths[2:end] .- rolling_depths[1:end-1]) .> 0)
end

# ╔═╡ 60bbbc71-0b56-4123-8a28-2fb83368e826
rolling_counter(depths)

# ╔═╡ 82dd70b8-7f72-445f-bd4d-78225ddaa9f9
rolling_depths = sum.(IterTools.partition(depths, 3, 1))

# ╔═╡ 6ca1b841-c5f9-4dc7-8ef5-521cadfdf83b
sum((rolling_depths[2:end] .- rolling_depths[1:end-1]) .> 0)

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
DelimitedFiles = "8bb1440f-4735-579b-a4ab-409b98df4dab"
IterTools = "c8e1da08-722c-5040-9ed9-7db0dc04731e"

[compat]
IterTools = "~1.4.0"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.0"
manifest_format = "2.0"

[[deps.DelimitedFiles]]
deps = ["Mmap"]
uuid = "8bb1440f-4735-579b-a4ab-409b98df4dab"

[[deps.IterTools]]
git-tree-sha1 = "fa6287a4469f5e048d763df38279ee729fbd44e5"
uuid = "c8e1da08-722c-5040-9ed9-7db0dc04731e"
version = "1.4.0"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"
"""

# ╔═╡ Cell order:
# ╠═a9ed5ba5-9f59-4bbf-b35c-4a5a36d0b6e0
# ╠═748af037-7d04-4d73-9aaa-575c48fac5f3
# ╠═844a02ca-0744-4523-99a8-37918bff34b3
# ╠═6467bbda-bf07-4ee0-81a3-ae4511c6e8eb
# ╠═3407599f-b7f6-4b02-a36b-5792e4111be6
# ╠═6da7f6d6-755b-43cf-aac2-b99299222955
# ╠═62fa6097-336b-4ee3-aa2e-7536ac7e66a8
# ╠═60bbbc71-0b56-4123-8a28-2fb83368e826
# ╠═291ffe60-5c63-415a-a5f7-1e40e59e2cf9
# ╠═82dd70b8-7f72-445f-bd4d-78225ddaa9f9
# ╠═6ca1b841-c5f9-4dc7-8ef5-521cadfdf83b
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
