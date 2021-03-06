/**
 * Created on: Sep 21, 2018
 * 		Author: Akila, Eranga, Eminda, Ruwan
 **/

#ifndef BSSN_EQ_CUH
#define BSSN_EQ_CUH

#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include <stdio.h>
#include <iostream>

#define CHECK_ERROR( err, msg ) if( err != cudaSuccess ) { std::cerr << "\033[1;31mERROR:" << cudaGetErrorName ( err ) << "  |  " << "ERROR DES: " << cudaGetErrorString( err ) << "  |  " << "User msg: " << msg << "\033[0m" << std::endl; exit( 0 ); }

void calc_bssn_eqns_kernel_wrapper(double * dev_var_in, double * dev_var_out, const unsigned int * sz, const double * pmin, double hz, double hy, double hx, cudaStream_t stream,
#include "para_derivs_offsets.h"
,
#include "para_staged.h"

);

#endif 
