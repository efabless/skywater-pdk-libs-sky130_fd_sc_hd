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

specify
( negedge RESET_B => ( Q +: RESET_B ) ) = ( 0:0:0 , 0:0:0 ) ;  // delay is tfall
( D +=> Q ) = ( 0:0:0 , 0:0:0 ) ;  // delays are tris , tfall
( posedge GATE => ( Q : GATE ) ) = ( 0:0:0 , 0:0:0 ) ; // delays are tris , tfall
( negedge RESET_B => ( Q_N -: RESET_B ) ) = ( 0:0:0 , 0:0:0 ) ;  // delay is tfall
( D -=> Q_N ) = ( 0:0:0 , 0:0:0 ) ;  // delays are tris , tfall
( posedge GATE => ( Q_N : GATE ) ) = ( 0:0:0 , 0:0:0 ) ; // delays are tris , tfall
$recrem ( posedge RESET_B , negedge GATE , 0:0:0 , 0:0:0 , notifier , AWAKE , AWAKE , RESETB_delayed , GATE_delayed ) ;
$setuphold ( negedge GATE , posedge D , 0:0:0 , 0:0:0 , notifier , COND0 , COND0 , GATE_delayed , D_delayed ) ;
$setuphold ( negedge GATE , negedge D , 0:0:0 , 0:0:0 , notifier , COND0 , COND0 , GATE_delayed , D_delayed ) ;
$width ( posedge GATE &&& COND1 , 1.0:1.0:1.0 , 0 , notifier ) ;
$width ( negedge RESET_B &&& AWAKE , 1.0:1.0:1.0 , 0 , notifier ) ;
$width ( posedge RESET_B &&& AWAKE , 1.0:1.0:1.0 , 0 , notifier ) ;
endspecify