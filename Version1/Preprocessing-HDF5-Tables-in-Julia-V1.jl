### A Pluto.jl notebook ###
# v0.14.9

using Markdown
using InteractiveUtils

# ╔═╡ 23a2ea15-7f83-4d05-832a-6071d5deb3cb
try  # Trying to import
	using HDF5, H5Zblosc, H5Zbzip2, H5Zlz4, H5Zzstd
	
catch  # Installing.. if there are not added yet
	using Pkg; Pkg.add("HDF5, H5Zblosc, H5Zbzip2, H5Zlz4, H5Zzstd")
	
end

# ╔═╡ 58dc30c2-d498-4110-ad90-f2af6cc0d689
md"Date: 5 Jul, 22"

# ╔═╡ 4dbc0956-91d6-4688-bf7e-10a359a3ab9a
md"First implementation of HDF5 r/w in Julia"

# ╔═╡ d55240e3-fa95-4d77-b2e3-3b079c3b880d
md"# Importing needed libraries"

# ╔═╡ 58a34a79-1197-4f8a-88a1-4b31a0f33971
md"# Working with the .hd5 file"

# ╔═╡ 58c1e3df-91e6-4b8f-8014-2307d844464f
begin
	
	# Specifying the directory
	fileDir = "/home/saleh/jul/t.hd5"
	 
	# Opening the file in a protected-read-only permission
	File = HDF5.h5open(fileDir, "r") 
end

# ╔═╡ d1871d0a-556f-4796-93be-3feb0c2fb776
md"# Preprocessing"

# ╔═╡ 21d67310-b452-45f4-945a-2c2c6f049736
md"In this stage, we store the data into a dictionary. Keys are the names of datasets and values are some arrays of NamedTuples."

# ╔═╡ edd741f9-4da0-4e25-88cd-1c35b78656da
begin
	
	Data = Dict()

	for name in keys(File)
		Data[name] = read(File[name])
	end

end

# ╔═╡ Cell order:
# ╟─58dc30c2-d498-4110-ad90-f2af6cc0d689
# ╟─4dbc0956-91d6-4688-bf7e-10a359a3ab9a
# ╟─d55240e3-fa95-4d77-b2e3-3b079c3b880d
# ╠═23a2ea15-7f83-4d05-832a-6071d5deb3cb
# ╟─58a34a79-1197-4f8a-88a1-4b31a0f33971
# ╠═58c1e3df-91e6-4b8f-8014-2307d844464f
# ╟─d1871d0a-556f-4796-93be-3feb0c2fb776
# ╟─21d67310-b452-45f4-945a-2c2c6f049736
# ╠═edd741f9-4da0-4e25-88cd-1c35b78656da
