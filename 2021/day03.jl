### A Pluto.jl notebook ###
# v0.17.3

using Markdown
using InteractiveUtils

# ╔═╡ ea747ce8-5f4f-11ec-3fff-191d0010c672
using DelimitedFiles

# ╔═╡ c2b811e0-ed4f-4b5c-9aad-79b02298fa2c
using Statistics

# ╔═╡ 7ec3a4cd-95d5-42c3-878a-bb29228fae89
d = readdlm("inputs/day_03.txt", Int64)

# ╔═╡ 5047baba-22aa-4fe3-8cec-ab8b1edbfb14


# ╔═╡ 19e8e799-59f0-47e0-8e72-69fa572bd082
# each column is a binary number
raw_numbers = hcat(reverse.(digits.(d, pad=12))...)

# ╔═╡ 30a18fb3-55f7-4404-85a4-d8e866223bd5
most_common(A) = mean(A) > 0.5 ? 1 : 0

# ╔═╡ 9f7c1bf1-2984-4bb5-8c2a-e68a830d0756
least_common(A) = mean(A) > 0.5 ? 0 : 1

# ╔═╡ 0e10b830-d1ed-4fb5-98d8-04f7a0afe1af
γ = parse(Int, string(mapslices(most_common, raw_numbers; dims=2)'...), base=2)

# ╔═╡ e1af0c80-14d7-4b4b-929d-b44b119f3bf9
ϵ = parse(Int, string(mapslices(least_common, raw_numbers; dims=2)'...), base=2)

# ╔═╡ a15c4c54-1aa1-40bf-a4a8-458b5f26bab1
γ * ϵ

# ╔═╡ b2bc6205-66e1-43f6-b642-d0eac97f8d6e
md"""
# Part 2
"""

# ╔═╡ 536c91f5-2962-4d81-afa1-b5dd659c1a7f


# ╔═╡ b3644b64-fa51-4516-a3c6-4b51a26332fd


# ╔═╡ c4bf6648-cc81-4b80-b790-fe6542505151


# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
DelimitedFiles = "8bb1440f-4735-579b-a4ab-409b98df4dab"
Statistics = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.0"
manifest_format = "2.0"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"

[[deps.DelimitedFiles]]
deps = ["Mmap"]
uuid = "8bb1440f-4735-579b-a4ab-409b98df4dab"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
"""

# ╔═╡ Cell order:
# ╠═ea747ce8-5f4f-11ec-3fff-191d0010c672
# ╠═c2b811e0-ed4f-4b5c-9aad-79b02298fa2c
# ╠═7ec3a4cd-95d5-42c3-878a-bb29228fae89
# ╠═5047baba-22aa-4fe3-8cec-ab8b1edbfb14
# ╠═19e8e799-59f0-47e0-8e72-69fa572bd082
# ╠═30a18fb3-55f7-4404-85a4-d8e866223bd5
# ╠═9f7c1bf1-2984-4bb5-8c2a-e68a830d0756
# ╠═0e10b830-d1ed-4fb5-98d8-04f7a0afe1af
# ╠═e1af0c80-14d7-4b4b-929d-b44b119f3bf9
# ╠═a15c4c54-1aa1-40bf-a4a8-458b5f26bab1
# ╠═b2bc6205-66e1-43f6-b642-d0eac97f8d6e
# ╠═536c91f5-2962-4d81-afa1-b5dd659c1a7f
# ╠═b3644b64-fa51-4516-a3c6-4b51a26332fd
# ╠═c4bf6648-cc81-4b80-b790-fe6542505151
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
