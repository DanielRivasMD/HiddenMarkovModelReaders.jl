####################################################################################################

"""

    euclDist(ɒ::Vector{X}, ʌ::Vector{Y})
    where X <: Number
    where Y <: Number

# Description
Euclidean distance.

# Examples
```
julia> euclDist(collect(1:10), fill(5, 10))
9.219544457292887
```

See also: [`bhattDist`](@ref), [`amplitude`](@ref)
"""
function euclDist(ɒ::Vector{X}, ʌ::Vector{Y}) where X <: Number where Y <: Number
  return (ɒ .- ʌ) .^ 2 |> sum |> sqrt
end

####################################################################################################

"""

    bhattDist(ɒ::Vector{X}, ʌ::Vector{Y})
    where X <: Number
    where Y <: Number

# Description
Bhattacharyya distance.

# Examples
```
julia> bhattDist(collect(1:10), fill(5, 10))
-3.936532135073928
```

See also: [`euclDist`](@ref), [`amplitude`](@ref)
"""
function bhattDist(ɒ::Vector{X}, ʌ::Vector{Y}) where X <: Number where Y <: Number
  return -log((ɒ .* ʌ .|> sqrt |> sum) + 1)
end

####################################################################################################

"""

    amplitude(ɒ::Vector{X})
    where X <: Number

# Description
Amplitude.

# Examples
```
julia> amplitude(collect(1:10))
19.621416870348583
```


See also: [`euclDist`](@ref), [`bhattDist`](@ref)
"""
function amplitude(ɒ::Vector{X}) where X <: Number
  return ɒ .^ 2 |> sum |> sqrt
end

####################################################################################################
