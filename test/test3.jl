using Test

@testset "Exercise 3" begin

# Test for section on RV model
@testset "rv_model_const" begin
   @test isdefined(Main, :rv_model_const)
   @test rv_model_const(42)(1.0) ≈ 42.0
   @test rv_model_const(pi)(17.0) ≈ 3.14159  atol=1e-5
end; # rv_model_const

@testset "rv_model_circ" begin
   @test isdefined(Main, :rv_model_circ)
   # INSERT YOUR TESTS HERE
end; # rv_model_cric



# Test for section on probability
@testset "gauss_std_normal" begin
   @test isdefined(Main, :gauss_std_normal)
   @test gauss_std_normal(0) ≈ 1/sqrt(2pi)
   @test gauss_std_normal(3) ≈ exp(-4.5)/sqrt(2pi)
end; # gauss_std_normal

@testset "likelihood" begin
   @test isdefined(Main, :likelihood)
   @test likelihood(rv_model_const(-1.0),ones(10),ones(10),ones(10)) ≈ exp(-10*4/2)*(2pi)^(-5)
end; # likelihood

@testset "simulate_rvs_and_calc_likelihood" begin
   @test isdefined(Main, :simulate_rvs_and_calc_likelihood)
   @test exp(-120/2)*(2pi)^(-50) < simulate_rvs_and_calc_likelihood(100) < exp(-80/2)*(2pi)^(-50)
   @test simulate_rvs_and_calc_likelihood(600) == 0.0
end; # simulate_rvs_and_calc_likelihoodlikelihood

@testset "log_likelihood" begin
   @test isdefined(Main, :log_likelihood)
   @test log_likelihood(rv_model_const(-1.0),ones(10),ones(10),ones(10)) ≈ -10*4/2-10/2*log(2pi)
end; # log_likelihood

@testset "simulate_rvs_and_calc_log_likelihood" begin
   @test isdefined(Main, :simulate_rvs_and_calc_log_likelihood)
   @test -120/2-50*log(2pi) < simulate_rvs_and_calc_log_likelihood(100) < -80/2-50*log(2pi)
   @test -650/2-300*log(2pi) < simulate_rvs_and_calc_log_likelihood(600) < -550/2-300*log(2pi)
end; # simulate_rvs_and_calc_log_likelihood

end; # Exercise 3

