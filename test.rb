# def A3(m, r, c, n)
#   i = 0
#   while i < r * c * n
#     puts("#{i} -> #{m[((i / c).to_i % r)][i % c]}")
#     i += 1
#   end
# end
#
# m = Array[[9, 8, 7],
#           [6, 5, 4],
#           [3, 2, 1],
#           [0, -1, -2]]
# A3(m, 4, 3, 4)

# def counting -sort(A, k, k1
#   )
#   # C=new array(k-k1+1) of zeros
#   #    R=new array(length(A)) of zeros
#   pos = 0
#   for 0
#     ≤ j < length(A) do
#     C[A[i] - k1] = C[A[i] - k1] + 1
#   end
#   for 0 < i < (k - k1 + 1) do
#     for pos ≤ r < pos + C[i] do
#       R[r] = i + k1
#     end
#     pos = r
#   end
#   return R
# end
# end

require_relative 'lib/http'
require_relative 'lib/uri'

Http::new::get(URI::new("/"))