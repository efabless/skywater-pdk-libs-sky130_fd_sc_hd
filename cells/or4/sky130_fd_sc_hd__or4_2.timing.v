/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_HD__OR4_2_TIMING_V
`define SKY130_FD_SC_HD__OR4_2_TIMING_V

/**
 * or4: 4-input OR.
 *
 * Verilog simulation timing model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hd__or4_2 (
    X,
    A,
    B,
    C,
    D
);

    // Module ports
    output X;
    input  A;
    input  B;
    input  C;
    input  D;

    // Module supplies
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    // Local signals
    wire or0_out_X;

    //  Name  Output     Other arguments
    or  or0  (or0_out_X, D, C, B, A     );
    buf buf0 (X        , or0_out_X      );

specify
(A +=> X) = (0:0:0,0:0:0);
(B +=> X) = (0:0:0,0:0:0);
(C +=> X) = (0:0:0,0:0:0);
(D +=> X) = (0:0:0,0:0:0);
endspecify
endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HD__OR4_2_TIMING_V
