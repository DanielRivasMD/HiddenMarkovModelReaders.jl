####################################################################################################

"""
    euclideanDistance(ɒ::Vx, ʌ::Vy)
      where Vx <: Vector{Nx}
      where Vy <: Vector{Ny}
      where Nx <: Number
      where Ny <: Number

# Description
Euclidean distance.

# Examples
```
julia> euclideanDistance(collect(1:10), fill(5, 10))
9.219544457292887
```

See also: [`bhattacharyyaDistance`](@ref), [`amplitude`](@ref)
"""
function euclideanDistance(ɒ::Vx, ʌ::Vy) where Vx <: Vector{Nx} where Vy <: Vector{Ny} where Nx <: Number where Ny <: Number
  return (ɒ .- ʌ) .^ 2 |> sum |> sqrt
end

####################################################################################################

"""

    bhattacharyyaDistance(ɒ::Vx, ʌ::Vy)
      where Vx <: Vector{Nx}
      where Vy <: Vector{Ny}
      where Nx <: Number
      where Ny <: Number

# Description
Bhattacharyya distance.

# Examples
```
julia> bhattacharyyaDistance(collect(1:10), fill(5, 10))
-3.936532135073928
```

See also: [`euclideanDistance`](@ref), [`amplitude`](@ref)
"""
function bhattacharyyaDistance(ɒ::Vx, ʌ::Vy) where Vx <: Vector{Nx} where Vy <: Vector{Ny} where Nx <: Number where Ny <: Number
  return -log((ɒ .* ʌ .|> sqrt |> sum) + 1)
end

####################################################################################################

"""

    amplitude(ɒ::V)
      where V <: Vector{N}
      where N <: Number

# Description
Amplitude.

# Examples
```
julia> amplitude(collect(1:10))
19.621416870348583
```


See also: [`euclideanDistance`](@ref), [`bhattacharyyaDistance`](@ref)
"""
function amplitude(ɒ::V) where V <: Vector{N} where N <: Number
  return ɒ .^ 2 |> sum |> sqrt
end

####################################################################################################
