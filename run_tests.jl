include("rich_method.jl")
f = open("emr_vars.txt")
Ws = Array{Any, 1}()
for line in readlines(f)
	W = map(x -> Array(x), rich_method(eval(parse(line))))
	push!(Ws, W)
end

f = open("test/emr.txt")
preWs = Array{Any, 1}()
for line in readlines(f)
	push!(preWs, eval(parse(line)))
end

pyWs = Array{Array{Array{Int64, 2}, 1}, 1}()
for preW in preWs
	W = map(x -> hcat(x...), preW)
	push!(pyWs, W)
end

if length(Ws) != length(pyWs)
	error("length(Ws) != length(pyWs)")
end

cond = [true]
for (W, pyW) in zip(Ws, pyWs)
	if length(W) != length(pyW)
		print(W)
		print("\n\n")
		error("length(W) != length(pyW)")
	end
	for (w, pyw) in zip(W, pyW)
		if w != pyw
			println(w - pyw)
			println("\n\n")
			cond[1] = false
		end
	end
end

println(cond)

if false

include("k_rich_method.jl")
f = open("emr_vars.txt")
Ws = Array{Any, 1}()
for line in readlines(f)
	toople = eval(parse(line))
	W = map(x -> Array(x), k_rich_method(toople[1], toople[2]))
	push!(Ws, W)
end

f = open("test/kemr.txt")
preWs = Array{Any, 1}()
for line in readlines(f)
	push!(preWs, eval(parse(line)))
end

pyWs = Array{Array{Array{Int64, 2}, 1}, 1}()
for preW in preWs
	W = map(x -> hcat(x...), preW)
	push!(pyWs, W)
end

if length(Ws) != length(pyWs)
	error("length(Ws) != length(pyWs)")
end

cond = [true]
for (W, pyW) in zip(Ws, pyWs)
	if length(W) != length(pyW)
		print(W)
		print("\n\n")
		error("length(W) != length(pyW)")
	end
	for (w, pyw) in zip(W, pyW)
		if w != pyw
			println(w - pyw)
			println("\n\n")
			cond[1] = false
		end
	end
end

println(cond)


end
