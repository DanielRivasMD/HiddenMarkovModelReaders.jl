####################################################################################################

"""
    euclDist(arr::Array{T, 1}, h::Array{T, 1}) where {T <: Number}

# Description
Euclidean distance.

# Examples
```
julia> euclDist(collect(1:10), fill(5, 10))
9.219544457292887
```

See also: [`bhattDist`](@ref), [`amplitude`](@ref)
"""
function euclDist(arr::Array{T,1}, h::Array{T,1}) where {T <: Number}
  return (arr .- h) .^ 2 |> sum |> sqrt
end

####################################################################################################

"""
    bhattDist(arr::Array{T, 1}, h::Array{T, 1}) where {T <: Number}

# Description
Bhattacharyya distance.

# Examples
```
julia> bhattDist(collect(1:10), fill(5, 10))
-3.936532135073928
```

See also: [`euclDist`](@ref), [`amplitude`](@ref)
"""
function bhattDist(arr::Array{T,1}, h::Array{T,1}) where {T <: Number}
  return -log((arr .* h .|> sqrt |> sum) + 1)
end

####################################################################################################

"""
    amplitude(arr::Array{T, 1}) where {T <: Number}

# Description
Amplitude.

# Examples
```
julia> amplitude(collect(1:10))
19.621416870348583
```

See also: [`euclDist`](@ref), [`bhattDist`](@ref)
"""
function amplitude(arr::Array{T,1}) where {T <: Number}
  return arr .^ 2 |> sum |> sqrt
end

####################################################################################################
