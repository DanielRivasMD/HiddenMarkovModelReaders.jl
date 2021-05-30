################################################################################

""
function backTrace!(self::HMM)
  state = 0
  min = self.tbM[1][end]

  for ix in eachindex(self.tbM)
    if self.tbM[ix][end] <= min
      state = ix
      min = self.tbM[ix][end]
    end

    tb = fill(-1, size(self.tbM[1], 1))

    for ix in reverse(eachindex(self.tbM[1]))
      vlocal = min
      global sig = -1

      for jx in eachindex(self.tbM)
        dob = self.tbM[jx][ix]
        if dob <= vlocal
          vlocal = dob
          sig = jx
        end
      end

      tb[ix] = state
      state = sig

    end

    tb = tb[1:end - 1]

    return tb
  end
end

################################################################################
