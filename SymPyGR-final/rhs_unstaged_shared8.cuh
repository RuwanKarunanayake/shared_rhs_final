// generated by Dendro-GR SymPyGR code gernation framework
//date: 2018-11-12 12:17:27


namespace cuda { 




/** computes rhs a_rhs*/

_device__ void a_rhs(int pp, double eta, double *dev_var_in,
	double * dev_var_out,){
	#include "para_derivs_offsets.h"
,
	#include "para_staged.h"
){
	//allocate memory for shared deriv variables. 


	 //input vars  shared alloc begin
	__shared__ double beta2_shared[512];
	__shared__ double K_shared[512];
	__shared__ double beta1_shared[512];
	__shared__ double alpha_shared[512];
	__shared__ double beta0_shared[512];
	 //input vars shared alloc end
	 // staged vars shared alloc begin
	 // staged vars shared alloc end
	 // deriv vars shared alloc begin
	__shared__ double agrad_1_alpha_shared[512];
	__shared__ double agrad_2_alpha_shared[512];
	__shared__ double agrad_0_alpha_shared[512];
	 // deriv vars shared alloc end
	int t=threadIdx.x;
	 //input vars begin
	 beta2_shared[t] = dev_var_in[beta2Int+pp];
	 K_shared[t] = dev_var_in[KInt+pp];
	 beta1_shared[t] = dev_var_in[beta1Int+pp];
	 alpha_shared[t] = dev_var_in[alphaInt+pp];
	 beta0_shared[t] = dev_var_in[beta0Int+pp];
	 //input vars end
	 // staged vars begin
	 // staged vars end
	 // deriv vars begin
	 agrad_1_alpha_shared[t] = agrad_1_alpha[pp];
	 agrad_2_alpha_shared[t] = agrad_2_alpha[pp];
	 agrad_0_alpha_shared[t] = agrad_0_alpha[pp];
	 // deriv vars end
	__syncthreads();
		//load data from global to shared memory ends
		      // Dendro: {{{ 
		      // Dendro: original ops: 12
		      // Dendro: printing temp variables
		      // Dendro: printing variables

		      dev_var_out[alphaInt[pp]] = -2*K_shared[t]*alpha_shared[t] + lambda[0]*(beta0_shared[t]*agrad_0_alpha_shared[t] + beta1_shared[t]*agrad_1_alpha_shared[t] + beta2_shared[t]*agrad_2_alpha_shared[t]);
		      // Dendro: reduced ops: 12
		      // Dendro: }}} 
	// store computed variables

} /** computes rhs b_rhs*/

_device__ void b_rhs(int pp, double eta, double *dev_var_in,
	double * dev_var_out,){
	#include "para_derivs_offsets.h"
,
	#include "para_staged.h"
){
	//allocate memory for shared deriv variables. 


	 //input vars  shared alloc begin
	__shared__ double beta2_shared[256];
	__shared__ double B0_shared[256];
	__shared__ double B2_shared[256];
	__shared__ double beta1_shared[256];
	__shared__ double alpha_shared[256];
	__shared__ double beta0_shared[256];
	__shared__ double B1_shared[256];
	 //input vars shared alloc end
	 // staged vars shared alloc begin
	 // staged vars shared alloc end
	 // deriv vars shared alloc begin
	__shared__ double agrad_1_beta2_shared[256];
	__shared__ double agrad_0_beta2_shared[256];
	__shared__ double agrad_1_beta0_shared[256];
	__shared__ double agrad_2_beta0_shared[256];
	__shared__ double agrad_0_beta0_shared[256];
	__shared__ double agrad_2_beta2_shared[256];
	__shared__ double agrad_0_beta1_shared[256];
	__shared__ double agrad_1_beta1_shared[256];
	__shared__ double agrad_2_beta1_shared[256];
	 // deriv vars shared alloc end
	int t=threadIdx.x;
	 //input vars begin
	 beta2_shared[t] = dev_var_in[beta2Int+pp];
	 B0_shared[t] = dev_var_in[B0Int+pp];
	 B2_shared[t] = dev_var_in[B2Int+pp];
	 beta1_shared[t] = dev_var_in[beta1Int+pp];
	 alpha_shared[t] = dev_var_in[alphaInt+pp];
	 beta0_shared[t] = dev_var_in[beta0Int+pp];
	 B1_shared[t] = dev_var_in[B1Int+pp];
	 //input vars end
	 // staged vars begin
	 // staged vars end
	 // deriv vars begin
	 agrad_1_beta2_shared[t] = agrad_1_beta2[pp];
	 agrad_0_beta2_shared[t] = agrad_0_beta2[pp];
	 agrad_1_beta0_shared[t] = agrad_1_beta0[pp];
	 agrad_2_beta0_shared[t] = agrad_2_beta0[pp];
	 agrad_0_beta0_shared[t] = agrad_0_beta0[pp];
	 agrad_2_beta2_shared[t] = agrad_2_beta2[pp];
	 agrad_0_beta1_shared[t] = agrad_0_beta1[pp];
	 agrad_1_beta1_shared[t] = agrad_1_beta1[pp];
	 agrad_2_beta1_shared[t] = agrad_2_beta1[pp];
	 // deriv vars end
	__syncthreads();
		//load data from global to shared memory ends
		      // Dendro: {{{ 
		      // Dendro: original ops: 51
		      // Dendro: printing temp variables
		   double 		DENDRO_0 = (3.0L/4.0L)*alpha_shared[t]*lambda_f[1] + (3.0L/4.0L)*lambda_f[0];
		      // Dendro: printing variables

		      dev_var_out[beta0Int[pp]] = B0_shared[t]*DENDRO_0 + lambda[1]*(beta0_shared[t]*agrad_0_beta0_shared[t] + beta1_shared[t]*agrad_1_beta0_shared[t] + beta2_shared[t]*agrad_2_beta0_shared[t]);
		      dev_var_out[beta1Int[pp]] = B1_shared[t]*DENDRO_0 + lambda[1]*(beta0_shared[t]*agrad_0_beta1_shared[t] + beta1_shared[t]*agrad_1_beta1_shared[t] + beta2_shared[t]*agrad_2_beta1_shared[t]);
		      dev_var_out[beta2Int[pp]] = B2_shared[t]*DENDRO_0 + lambda[1]*(beta0_shared[t]*agrad_0_beta2_shared[t] + beta1_shared[t]*agrad_1_beta2_shared[t] + beta2_shared[t]*agrad_2_beta2_shared[t]);
		      // Dendro: reduced ops: 39
		      // Dendro: }}} 
	// store computed variables

} /** computes rhs gt_rhs*/

_device__ void gt_rhs(int pp, double eta, double *dev_var_in,
	double * dev_var_out,){
	#include "para_derivs_offsets.h"
,
	#include "para_staged.h"
){
	//allocate memory for shared deriv variables. 


	 //input vars  shared alloc begin
	__shared__ double gt3_shared[128];
	__shared__ double gt5_shared[128];
	__shared__ double beta2_shared[128];
	__shared__ double At1_shared[128];
	__shared__ double beta1_shared[128];
	__shared__ double At2_shared[128];
	__shared__ double At4_shared[128];
	__shared__ double alpha_shared[128];
	__shared__ double gt1_shared[128];
	__shared__ double gt0_shared[128];
	__shared__ double gt4_shared[128];
	__shared__ double At0_shared[128];
	__shared__ double beta0_shared[128];
	__shared__ double At3_shared[128];
	__shared__ double At5_shared[128];
	__shared__ double gt2_shared[128];
	 //input vars shared alloc end
	 // staged vars shared alloc begin
	 // staged vars shared alloc end
	 // deriv vars shared alloc begin
	__shared__ double grad_0_beta0_shared[128];
	__shared__ double agrad_1_gt2_shared[128];
	__shared__ double agrad_2_gt0_shared[128];
	__shared__ double agrad_0_gt0_shared[128];
	__shared__ double agrad_2_gt5_shared[128];
	__shared__ double grad_1_beta1_shared[128];
	__shared__ double grad_2_beta0_shared[128];
	__shared__ double agrad_1_gt0_shared[128];
	__shared__ double agrad_0_gt2_shared[128];
	__shared__ double agrad_2_gt2_shared[128];
	__shared__ double agrad_0_gt1_shared[128];
	__shared__ double agrad_2_gt4_shared[128];
	__shared__ double agrad_1_gt3_shared[128];
	__shared__ double agrad_1_gt5_shared[128];
	__shared__ double grad_2_beta2_shared[128];
	__shared__ double grad_2_beta1_shared[128];
	__shared__ double agrad_1_gt4_shared[128];
	__shared__ double grad_0_beta1_shared[128];
	__shared__ double agrad_1_gt1_shared[128];
	__shared__ double agrad_0_gt3_shared[128];
	__shared__ double grad_0_beta2_shared[128];
	__shared__ double agrad_2_gt3_shared[128];
	__shared__ double agrad_0_gt5_shared[128];
	__shared__ double agrad_0_gt4_shared[128];
	__shared__ double agrad_2_gt1_shared[128];
	__shared__ double grad_1_beta0_shared[128];
	__shared__ double grad_1_beta2_shared[128];
	 // deriv vars shared alloc end
	int t=threadIdx.x;
	 //input vars begin
	 gt3_shared[t] = dev_var_in[gt3Int+pp];
	 gt5_shared[t] = dev_var_in[gt5Int+pp];
	 beta2_shared[t] = dev_var_in[beta2Int+pp];
	 At1_shared[t] = dev_var_in[At1Int+pp];
	 beta1_shared[t] = dev_var_in[beta1Int+pp];
	 At2_shared[t] = dev_var_in[At2Int+pp];
	 At4_shared[t] = dev_var_in[At4Int+pp];
	 alpha_shared[t] = dev_var_in[alphaInt+pp];
	 gt1_shared[t] = dev_var_in[gt1Int+pp];
	 gt0_shared[t] = dev_var_in[gt0Int+pp];
	 gt4_shared[t] = dev_var_in[gt4Int+pp];
	 At0_shared[t] = dev_var_in[At0Int+pp];
	 beta0_shared[t] = dev_var_in[beta0Int+pp];
	 At3_shared[t] = dev_var_in[At3Int+pp];
	 At5_shared[t] = dev_var_in[At5Int+pp];
	 gt2_shared[t] = dev_var_in[gt2Int+pp];
	 //input vars end
	 // staged vars begin
	 // staged vars end
	 // deriv vars begin
	 grad_0_beta0_shared[t] = grad_0_beta0[pp];
	 agrad_1_gt2_shared[t] = agrad_1_gt2[pp];
	 agrad_2_gt0_shared[t] = agrad_2_gt0[pp];
	 agrad_0_gt0_shared[t] = agrad_0_gt0[pp];
	 agrad_2_gt5_shared[t] = agrad_2_gt5[pp];
	 grad_1_beta1_shared[t] = grad_1_beta1[pp];
	 grad_2_beta0_shared[t] = grad_2_beta0[pp];
	 agrad_1_gt0_shared[t] = agrad_1_gt0[pp];
	 agrad_0_gt2_shared[t] = agrad_0_gt2[pp];