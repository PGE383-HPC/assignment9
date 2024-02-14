#!/usr/bin/env julia

# Copyright 2022 John T. Foster
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
import assignment9
using Test

@testset "assignment9.jl" begin
    datafile = realpath(dirname(@__FILE__)*"/../data/data.csv")
    strain, stress = assignment9.convert_to_true_stress_and_strain(datafile)
    @test all(strain[100:102] .≈ [0.0005020476229990764, 0.0005009517727055945, 0.0005108676748850077])
    @test all(stress[512:515] .≈ [47382.09298647613, 47360.04462664843, 47414.967086017925, 47423.4567510546])
    @test assignment9.compute_toughness(datafile) ≈ 70836.1434834513
end
