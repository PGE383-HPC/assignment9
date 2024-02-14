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
module assignment9

using CSV
using Tables

function read_data_file(filename::String)
    CSV.File(filename; header=false, skipto=6) |> Tables.matrix
end

function parse_width_and_thickness(filename::String)
    l::String = ""
    for (i, line) in enumerate(eachline(filename))
        l = line
        if i == 3
          break
        end
   end
   first_split_string = split(l, ",")
   width = parse(Float64, strip(split(first_split_string[3], "=")[2], '"'))
   thickness = parse(Float64, split(split(first_split_string[4], "=")[2], '"')[1])
   (width, thickness)
end

function convert_to_true_stress_and_strain(filename::String)
end

function compute_toughness(filename::String)
end

export convert_to_true_stress_and_strain, compute_toughness

end
