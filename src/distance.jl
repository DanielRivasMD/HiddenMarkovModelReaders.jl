################################################################################

"Euclidean distance"
function distance(self::HMM, j::Int64, h::Array{Float64, 1})
  dis = 0.
  for ix in eachindex(self.dataM[j])
    dis += (self.dataM[j][ix] - h[ix]) ^ 2
  end
  dis = sqrt(dis)
  return dis
end

function distance(arr::Array{T, 1}, h::Array{T, 1}) where T <: Number
  return (arr .- h) .^ 2  |> sum  |> sqrt
end

"Bhattacharyya distance"
function bhattDist(arr::Array{Float64, 1}, h::Array{Float64, 1})
  dis = 0.
  for ix in eachindex(arr)
    product = arr[ix] * h[ix]
    if product >= 0
      dis += sqrt(product)
    else
      @error("Product $product is less than zero")
    end
  end
  dis = -log(dis + 1.)
  return dis
end

"Amplitude"
function amplitude(arr::Array{Float64, 1})
  return arr .^ 2 |> sum |> sqrt
end

################################################################################