################################################################################

"""
    euclDist(arr::Array{T, 1}, h::Array{T, 1}) where T <: Number

# Description
Euclidean distance

# Examples
```jldoctest
julia> euclDist(collect(1:10), fill(5, 10))
```

See also: [`bhattDist`](@ref)
"""
function euclDist(arr::Array{T, 1}, h::Array{T, 1}) where T <: Number
  return (arr .- h) .^ 2  |> sum  |> sqrt
end

"""
    bhattDist(arr::Array{T, 1}, h::Array{T, 1}) where T <: Number

# Description
Bhattacharyya distance

# Examples
```jldoctest
julia> bhattDist(collect(1:10), fill(5, 10))
```

See also: [`euclDist`](@ref)
"""
function bhattDist(arr::Array{T, 1}, h::Array{T, 1}) where T <: Number
  return -log((arr .* h .|> sqrt |> sum) + 1)
end

"Amplitude"
function amplitude(arr::Array{T, 1}) where T <: Number
  return arr .^ 2 |> sum |> sqrt
end

################################################################################
