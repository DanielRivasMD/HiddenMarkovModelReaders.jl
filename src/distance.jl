################################################################################


"Euclidean distance"
function distance(arr::Array{T, 1}, h::Array{T, 1}) where T <: Number
  return (arr .- h) .^ 2  |> sum  |> sqrt
end

"Bhattacharyya distance"
function bhattDist(arr::Array{T, 1}, h::Array{T, 1}) where T <: Number
  return -log((arr .* h .|> sqrt |> sum) + 1)
end

"Amplitude"
function amplitude(arr::Array{T, 1}) where T <: Number
  return arr .^ 2 |> sum |> sqrt
end

################################################################################
