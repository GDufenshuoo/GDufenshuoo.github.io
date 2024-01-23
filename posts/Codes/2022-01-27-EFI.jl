# using Combinatorics

# begin
#     const c = 1
#     const ħ = 1
#     const e = 1
#     const mₑ = 1
#     const a_0 = 1
#     const s = 1
#     const E_unit = 1

#     const k_b = 3.1668105084779793e-6
# end
# T = 1e-3
# Beads = 64
# const β⁻¹ = k_b*T
# const β = 1/β⁻¹ 
# const k = 0.5*mₑ*Beads/(β*ħ)^2    # 0.5mω² 

# function EFI(P,lo)
#     dim,a,N = size(P)
#     expro = 12
#     pl = permutations(collect(1:N))
#     ans = zeros(BigFloat,expro)
#     temp = BigFloat(0.0)
#     s = 0.0
#     for l in pl
#         s =levicivita(l)
#         for i in 1:N
#             for d in 1:dim
#                 temp += -(P[d,2,i]-P[d,1,l[i]])^2*β*k
#             end
#         end
#         temp += -lo*β*k
#         for i in 1:expro
#             ans[i] += s*temp^(i)/factorial(i)
#         end
#         temp *= 0
#     end
#     return ans./(factorial(N))
# end

# function Trangle(N,i,j)
#     if i>j
#         return div((i-2)*(i-1),2) + j
#     else
#         return div((N-i)*(N-i-1),2) + N-j+1
#     end
# end

# function EFI(P,lo)
#     dim,a,N = size(P)
#     expro = 12
#     xd = zeros((N*(N-1))>>1)
#     od = zeros(N)
#     pl = permutations(collect(1:N))
#     ans = zeros(BigFloat,expro)
#     temp = BigFloat(0.0)
#     s = 0.0
#     for i in 1:N
#         for j in 1:N
#             if i == j
#                 od[i] += d2(P[:,B,i],P[:,1,i])*k
#             else
#                 xd[Trangle(N,i,j)] += d2(P[:,B,i],P[:,1,i])*k/2
#     end end end
#     for l in pl
#         s =levicivita(l)
#         for i in 1:N
#             for d in 1:dim
#                 j = l[i]
#                 if i != j
#                     temp += -1*xd[i,j]*β*k
#                 else
#                     temp += -1*od[i,i]*β*k
#                 end
#             end
#         end
#         temp += -lo*β*k
#         for i in 1:expro
#             ans[i] += s*temp^(i)/factorial(i)
#         end
#         temp *= 0
#     end
#     return ans./(factorial(N))
# end

# function EFI_Ex(P,lo)
#     dim,a,N = size(P)
#     pl = permutations(collect(1:N))
#     E = big(0.0)
#     temp = E
#     s = 0.0
#     for l in pl
#         s =levicivita(l)
#         for i in 1:N
#             for d in 1:dim
#                 temp += (P[d,2,i]-P[d,1,l[i]])^2
#             end
#         end
#         temp += lo
#         E += s*exp(-β*k*temp)
#         temp *= 0
#     end
#     return E
# end
