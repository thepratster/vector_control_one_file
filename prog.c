#include <stdint.h>
#include <Pipes.h>

//go lower 500 rpm

#define _BITCAST_(Type,val) *((Type*)&val)

uint64_t getSlice64(uint64_t reg, uint8_t h, uint8_t l)
{
	reg = reg << (63 - h);
	reg = reg >> (63 - h + l);
	return reg;
}

uint8_t getBit64(uint64_t reg, uint8_t pos)
{
	return getSlice64(reg, pos, pos);
}

uint64_t setSlice64(uint64_t reg, uint8_t h, uint8_t l, uint64_t value)
{
	uint64_t mask = -1;
	mask = mask >> (63 - h + l);
	value = value & mask;
	value = value << l;

	mask = mask << l;
	reg = reg & ~mask;
	reg = reg | value;
	return reg;
}

uint64_t setBit64(uint64_t reg, uint8_t pos, uint8_t value)
{
	return setSlice64(reg, pos, pos, value);
}

double fdiv32(double a, double b)
{
	uint64_t n = _BITCAST_(uint64_t,a);
	uint64_t d = _BITCAST_(uint64_t,b);

	uint64_t n_val = getSlice64(n, 62, 0);
	uint64_t d_val = getSlice64(d, 62, 0);

	uint8_t s_n = getBit64(n, 63);
	uint8_t s_d = getBit64(d, 63);

	uint16_t e1 = getSlice64(n, 62, 52);
	uint16_t e2 = getSlice64(d, 62, 52);

	uint16_t e1_new = (n_val == 0) ? 0 : (e1 - e2 + 1022);
	uint16_t e2_new = 1022;

	uint64_t n1 = setSlice64(n, 62, 52, e1_new);
	uint64_t d1 = setSlice64(d, 62, 52, e2_new);

	uint64_t n_new = setBit64(n1, 63, 0);
	uint64_t d_new = setBit64(d1, 63, 0);

	double a_new = _BITCAST_(double,n_new);
	double b_new = _BITCAST_(double,d_new);

	//double x = fpsub64(2.8235294818878173828125 , fpmul64(1.88235294818878173828125 , b_new));
	//Make initial guess as (48/17 - (32/17)*divisor) for fast convergence
	double x = 2.8235294818878173828125 - (1.88235294818878173828125 * b_new);// (48/17 - (32/17) * b_new)

	int i = 0;

	for(; i < 4; i++)
	{
		//x = fpmul64(x , fpsub64(2 , fpmul64(b_new , x)));
		x = x * (2 - (b_new * x));
	}
		
	// AHIR does not return nan and inf. Hence commented out. Will work in s/w.
	
	//uint64_t tmp = 0x7ff0000000000000;
	//uint64_t tmp1 = 0x7fffffffffffffff;

	//double inf = _BITCAST_(double,tmp);
	//double nan = _BITCAST_(double,tmp1);

	double res = 0;


	//res = ((n_val == 0) && (d_val == 0)) ? nan : res;
	//res = ((n_val != 0) && (d_val == 0)) ? inf : res;

	//res = ((n_val != 0) && (d_val != 0)) ? fpmul64(a_new , x) : res;
	res = ((n_val != 0) && (d_val != 0)) ? (a_new * x) : res;

	//res = (s_n ^ s_d) ? -res : res; Working in s/w. Simulation very slow in AHIR. Provided work around as below.

	uint64_t res_uint = _BITCAST_(uint64_t,res);
	res_uint = setBit64(res_uint, 63, s_n ^ s_d);

	res = _BITCAST_(double,res_uint);

	return res;
}

float fpmul32f(float x, float y)
{
	return(x*y);//Optmize by using shift and add...
}

float fpadd32f(float x, float y)
{
	return(x+y);
}

float fpsub32f(float x, float y)
{
	return(x-y);
}


uint32_t fpadd32fi(uint32_t x, uint32_t y)
{
	return(x+y);
}

uint32_t fpsub32fi(uint32_t x, uint32_t y)
{
	return(x-y);
}

/*
uint32_t udiv32(uint32_t dividend, uint32_t divisor) 
{
   uint32_t remainder = 0;
   uint32_t quotient = 0xffffffff;
   remainder = 0;
   if(divisor == 0)
   {
	return(0xffffffff);
   }
   else if(divisor == 1)
   {
	return(dividend);
   }
   else if(divisor > dividend)
   {
	quotient = 0;
	remainder = dividend;
	return(quotient);
   }
   else
   {
	quotient = 0;
	while(dividend >= divisor)
	{
		uint32_t curr_quotient = 1;
       		uint32_t dividend_by_2 = (dividend >> 1);
		uint32_t shifted_divisor = divisor;

		while(1)
		{
			if(shifted_divisor < dividend_by_2)
			{
				shifted_divisor = (shifted_divisor << 1);
				curr_quotient = (curr_quotient << 1);
			}
			else	
		  		break;
		}

			quotient = fpadd32fi(quotient,curr_quotient);
			dividend = fpsub32fi(dividend,shifted_divisor);
	}

	remainder = dividend;
   }
   return(quotient);
}


float fdiv32(float a, float b)
{
	uint32_t mantissa_a = 0, mantissa_b = 0;
	uint32_t exponent_a = 0, exponent_b = 0;
	uint32_t sign_a = 0, sign_b = 0;
	uint32_t sign = 0;
	uint32_t exp = 0;
	uint32_t man = 0;
	uint32_t ival_a = 0, ival_b = 0;
	uint32_t temp = 0;
	float out_div = 0;

	if (a==0)
		return(0);
	else{
		ival_a = *((uint32_t *)&a);
		ival_b = *((uint32_t *)&b);


		exponent_a = ((ival_a & (0x7F800000))>>23);
		exponent_b = ((ival_b & (0x7F800000))>>23);

		mantissa_a = ((ival_a & (0x007FFFFF)) | (0x00800000))<<7;
		mantissa_b = ((ival_b & (0x007FFFFF)) | (0x00800000))>>7;

		sign_a = (ival_a & (0x80000000))>>31;
		sign_b = (ival_b & (0x80000000))>>31;

		sign = (sign_a ^ sign_b)<<31;
		exp = fpsub32fi(exponent_a, exponent_b);
		man = (udiv32(mantissa_a,mantissa_b));

		temp = man;
		while( ( (temp & (0x00800000)) != 0x00800000) && (temp !=0) )
		{
		man = (man << 1);
		exp = fpsub32fi(exp, 1);
		temp = man;
		}

		man = ((man)& (0x007FFFFF));
		exp = fpadd32fi(exp,136) <<23; // 128 + 7 + 8 -3

		temp = (sign | exp | man);

		out_div = *((float *)&temp); 
	}
	return(out_div);
}
*/
float rotor_flux_calc(float del_t, float Lm, float id, float flux_rotor_prev, float tau_new, float tau_r){

	float temp_a = 0, temp_b = 0, temp_c = 0;
	float temp_flux_n = 0,temp_flux_d = 0;
	float flux_rotor = 0;
/*
	temp_a = fpmul32f(id,Lm);
	temp_a = temp_a + 0.0311759;
	temp_b = fpmul32f(50e-6,temp_a); 
	temp_c = fpmul32f(0.103919753,flux_rotor_prev);

	temp_flux_n = fpadd32f(temp_c,temp_b);

	flux_rotor = fdiv32(temp_flux_n,0.103969753);
	*/
	
	temp_a = fpmul32f(flux_rotor_prev,0.9995);
	temp_b = fpmul32f(0.8096,id);
	temp_c = fpmul32f(0.0005,temp_b);	
	flux_rotor = fpadd32f(temp_c,temp_a);
	return(flux_rotor);
}
float omega_calc(float Lm, float iq, float tau_r, float flux_rotor){
	float temp_omega_n = 0,temp_omega_d = 0;
	float omega_r = 0;
	temp_omega_n = fpmul32f(0.8096,iq);
	temp_omega_d = fpmul32f(tau_r,flux_rotor);
	omega_r = fdiv32(temp_omega_n,temp_omega_d);
	return(omega_r);
}

float theta_calc(float omega_r, float omega_m, float del_t, float theta_prev){
	float temp_a = 0, temp_b = 0;
	float theta = 0;
	//temp_a = fpadd32f(omega_r,omega_m);
	//temp_b = fpmul32f(temp_a,del_t);
	temp_b = fpmul32f(omega_m,del_t);
	theta = fpadd32f(theta_prev,temp_b);
	return(theta);
}

float iq_err_calc(float Lr, float torque_ref, float constant_1, float flux_rotor){

	float temp_d = 0;
	float temp_iq_n = 0,temp_iq_d = 0;
	float iq_err = 0;
/*
	if (flux_rotor<1)
		flux_rotor = 1;
	else flux_rotor = flux_rotor;*/
	
	temp_d = fpmul32f(4.0,Lr);
	temp_iq_n = fpmul32f(temp_d,torque_ref);
	temp_iq_d = fpmul32f(constant_1,flux_rotor);

	iq_err = fdiv32(temp_iq_n,temp_iq_d);
	return(iq_err);
}

void vector_control_daemon(){

	float id = 0; float iq = 0; float torque_ref = 0; float flux_ref = 0; float speed = 0; 
	float speed_ref = 1400, speed_ref_temp = 0;
	float torque_sat_high = 40, torque_sat_low = -40;
	float speed_err = 0, int_speed_err = 0, prop_speed_err = 0;
	float flux_err = 0, int_flux_err = 0, prop_flux_err = 0, flux_add = 0;
	float Kp = 10, Ki = 5;
	float Kp_n = 65, Ki_n = 25;
	float Lm = 0.8096;
	float Lm_n = 80.9600;
	float Lr = 0.84175;
	float tau_r = 0.103919753;
	float flux_rotor = 0;
	float flux_rotor_prev = 0;
	float del_t = 50e-6;
	float del_t_new = 50e-9;
	float flux_ref_prev = 0;
	float tau_new = 0;
	float theta = 0;
	float theta_prev = 0;
	float omega_r = 0;
	float omega_m = 314.1592654;
	float id_err = 0;
	float iq_err = 0;
	float poles = 4;
	float nf = 0.300;
//	float constant_temp = fpmul32f(3000,poles);
//	float constant_1 = fpmul32f(constant_temp,Lm);
	float constant_1 = 9.7152;
	float int_speed_err_temp_1 = 0;
	float int_speed_err_temp_2 = 0;
	float int_flux_err_temp_1 = 0;
	float int_flux_err_temp_2 = 0;
	float flux_ref_calc_temp_1 = 0;
	float flux_ref_calc_temp_2 = 0;
	float id_prev = 0;

	
	while(1){
	
		//Read Data from motor
		id  = read_float32("in_data1");
		iq  = read_float32("in_data2");
		speed  = read_float32("in_data3");
		speed_ref_temp  = read_float32("in_data4");	
		omega_m  = read_float32("in_data5");
				
		if(speed_ref < speed_ref_temp)
			speed_ref = speed_ref + 5;
		else if(speed_ref > speed_ref_temp)
			speed_ref = speed_ref - 5;
		else speed_ref = speed_ref;
		
		
		//Generation of Reference Values
		speed_err = fpsub32f(speed_ref,speed);
		//Torque Reference Value Calculations
		int_speed_err_temp_1 = fpmul32f(del_t,speed_err);
		int_speed_err_temp_2 = fpadd32f(int_speed_err_temp_1,int_speed_err_temp_2);
		int_speed_err = fpmul32f(10,int_speed_err_temp_2); 
		if (int_speed_err < -20.0)
			int_speed_err = -20.0;
		else if (int_speed_err > 20.0)
			int_speed_err = 20.0;
		else
			int_speed_err = int_speed_err;
	
		prop_speed_err = fpmul32f(speed_err,5);
	
		torque_ref = fpadd32f(int_speed_err,prop_speed_err);
		
		
		if (torque_ref < torque_sat_low)
			torque_ref = torque_sat_low;
		else if (torque_ref > torque_sat_high)
			torque_ref = torque_sat_high;
		else
			torque_ref = torque_ref;
		
		//Flux Reference Value Calculations
		if (speed_ref <=2000.0)
			flux_ref = nf;
		else if (speed_ref <=2500.0){
			flux_ref_calc_temp_1 = fpmul32f(-0.0002,speed_ref);
			flux_ref_calc_temp_2 = fpadd32f( flux_ref_calc_temp_1, 1.4); 
			flux_ref = fpmul32f(flux_ref_calc_temp_2 ,nf);
		}
		else if (speed_ref <=3000.0){
			flux_ref_calc_temp_1 = fpmul32f(-0.00036,speed_ref);
			flux_ref_calc_temp_2 = fpadd32f( flux_ref_calc_temp_1, 1.8); 
			flux_ref = fpmul32f(flux_ref_calc_temp_2 ,nf);
		}
		else{ 
			flux_ref_calc_temp_1 = fpmul32f(-0.00042,speed_ref);
			flux_ref_calc_temp_2 = fpadd32f( flux_ref_calc_temp_1, 1.98); 
			flux_ref = fpmul32f(flux_ref_calc_temp_2 ,nf);
		}
		
		//Vector Control Begins Here
		tau_new= fpadd32f(del_t,tau_r);
		
		flux_rotor =  rotor_flux_calc( del_t,  Lm,  id_prev,  flux_rotor_prev,  tau_new, tau_r);
		
		omega_r =  omega_calc( Lm,  iq,  tau_r,  flux_rotor);
		theta =  theta_calc( omega_r,  omega_m,  del_t,  theta_prev);

		iq_err = iq_err_calc( Lr,  torque_ref,  constant_1,  flux_rotor);
		
		//iD Calculations
		flux_err = fpsub32f(flux_ref,flux_rotor);
		int_flux_err_temp_1 = fpmul32f(del_t,flux_err);
		int_flux_err_temp_2 = fpadd32f(int_flux_err_temp_1,int_flux_err_temp_2);
		
		int_flux_err = fpmul32f(Ki_n,int_flux_err_temp_2); 		
		if (int_flux_err < -1)
			int_flux_err = -1;
		else if (int_flux_err > 1)
			int_flux_err = 1;
		else
			int_flux_err = int_flux_err;
		
		prop_flux_err = fpmul32f(flux_err,Kp_n);
		
		flux_add = fpadd32f(int_flux_err,prop_flux_err);
		
		if (flux_add < -2)
			flux_add = -2;
		else if (flux_add > 2)
			flux_add = 2 ;
		else
			flux_add = flux_add;
		
		id_err = fdiv32(flux_add,Lm);

		
		flux_ref_prev = flux_ref;
		id_prev = id;

		flux_rotor_prev = flux_rotor;
		theta_prev = theta;
		
		//Write Back Generated Data
		write_float32("out_data1",id_err);
		write_float32("out_data2",iq_err);
		write_float32("out_data3",theta);
		write_float32("out_data4",flux_rotor);
	}
}
/*
#include <stdint.h>
#include <Pipes.h>

inline uint64_t udiv32(uint64_t dividend, uint64_t divisor) 
{
	uint64_t remainder = 0;
	uint64_t quotient = 0xffffffffffffffff;
	uint64_t curr_quotient = 1;
	uint64_t dividend_by_2 = 0;
	uint64_t shifted_divisor = 0;
	uint64_t count_temp = 0;
	remainder = 0;

	if(divisor == 0)
	{
		return(0xffffffffffffffff);
	}
	else if(divisor == 1)
	{
		return(dividend);
	}
	else if(divisor > dividend)
	{
		quotient = 0;
		remainder = dividend;
		return(quotient);
	}
	else
	{
		quotient = 0;

		while(dividend >= divisor)
		{
			curr_quotient = 1;
			dividend_by_2 = (dividend >> 1);
			shifted_divisor = divisor;
			count_temp = 0;
			while(1)
			{
				if(shifted_divisor < dividend_by_2)
				{
					shifted_divisor = (shifted_divisor << 1);
					curr_quotient = (curr_quotient << 1);
				}
				else	
			  		break;
			}
	
			quotient += curr_quotient;
			dividend -= shifted_divisor;
		}
		remainder = dividend;
	}
	return(quotient);
}


inline double fdiv(double a, double b)
{
	uint64_t mantissa_a = 0, mantissa_b = 0;
	uint64_t exponent_a = 0, exponent_b = 0;
	uint64_t sign_a = 0, sign_b = 0;
	uint64_t sign = 0;
	uint64_t exp = 0;
	uint64_t man = 0;
	uint64_t ival_a = 0, ival_b = 0;
	uint64_t temp = 0;
	double out_div = 0;

	if (a==0)
		return(0);
	else{
		
		ival_a = *((uint64_t *)&a);
		ival_b = *((uint64_t *)&b);


		exponent_a = ((ival_a & (0x7FF0000000000000))>>52);
		exponent_b = ((ival_b & (0x7FF0000000000000))>>52);

		mantissa_a = ((ival_a & (0x000FFFFFFFFFFFFF)) | (0x0010000000000000))<<10;
		mantissa_b = ((ival_b & (0x000FFFFFFFFFFFFF)) | (0x0010000000000000))>>6;
	
		sign_a = (ival_a & (0x8000000000000000))>>63;
		sign_b = (ival_b & (0x8000000000000000))>>63;

		sign = (sign_a ^ sign_b)<<63;
		exp = exponent_a - exponent_b;

		if (mantissa_b == 1)
			man = mantissa_a;
		else
		man = (udiv32(mantissa_a,mantissa_b));

		temp = man;

		while( ( (temp & (0x0010000000000000)) != 0x0010000000000000) && (temp !=0) )
		{
		man = (man << 1);
		exp = exp - 1;
		temp = man;
		}

		man = ((man)& (0x000FFFFFFFFFFFFF));
		exp = (exp + 1036 + 29 -6 ) <<52; // 128 + 7 + 8 -3

		temp = (sign | exp | man);

		out_div = *((double *)&temp); 
	}
	return(out_div);
}

inline double rotor_flux_calc(double del_t, double Lm, double id, double flux_rotor_prev, double tau_new, double tau_r){

	double temp_a = 0, temp_b = 0, temp_c = 0;
	double temp_flux_n = 0,temp_flux_d = 0;
	double flux_rotor = 0;
	temp_a = del_t * Lm;
	temp_b = id * temp_a; 
	temp_c = tau_r * flux_rotor_prev;

	temp_flux_n = temp_c + temp_b;
	//temp_flux_d = (tau_new);

	flux_rotor = fdiv(temp_flux_n,tau_new);
	
	return(flux_rotor);
}

inline double omega_calc(double Lm, double iq, double tau_r, double flux_rotor){
	double temp_omega_n = 0,temp_omega_d = 0;
	double omega_r = 0;
	temp_omega_n = (Lm * iq);
	temp_omega_d = (tau_r * flux_rotor);
	omega_r = fdiv(temp_omega_n,temp_omega_d);
	return(omega_r);
}

double theta_calc(double omega_r, double omega_m, double del_t, double theta_prev){
	double temp_a = 0, temp_b = 0;
	double theta = 0;
	temp_a = (omega_r + omega_m);
	temp_b = temp_a * del_t;
	theta = theta_prev + temp_a;
	return(theta);
}

inline double iq_err_calc(double Lr, double torque_ref, double constant_1, double flux_rotor){

	double temp_d = 0;
	double temp_iq_n = 0,temp_iq_d = 0;
	double iq_err = 0;
	double flux_rotor_temp = 0;
	
	if (flux_rotor<0)
		return(5000);
	else if (flux_rotor<0.001)
		flux_rotor_temp = 0.001;
	else flux_rotor_temp = flux_rotor;
	
	temp_d = (2 * Lr);
	temp_iq_n = temp_d * torque_ref;
	temp_iq_d = (constant_1 * flux_rotor);

	iq_err = fdiv((double)temp_iq_n,(double)temp_iq_d);
	return(iq_err);
}

void vector_control_daemon(){

	double id = 0; double iq = 0; double torque_ref = 0; double flux_ref = 0; double speed = 0; double speed_ref = 0;double speed_ref_temp = 0;
	double torque_sat_high = 20, torque_sat_low = -20;
	double speed_err = 0, int_speed_err = 0, prop_speed_err = 0;
	double flux_err = 0, int_flux_err = 0, prop_flux_err = 0, flux_add = 0;
	double Kp = 40, Ki = 50;
	double Lm = 0.8096;
	double Lr = 0.84175;
	double tau_r = 0.103919753;
	double flux_rotor = 0;
	double flux_rotor_prev = 0;
	double del_t = 50e-6;
	double flux_ref_prev = 0;
	double tau_new = 0;
	double theta = 0;
	double theta_prev = 0;
	double omega_r = 0;
	double omega_m = 314.1592654;
	double id_err = 0;
	double iq_err = 0;
	double poles = 2;
	double nf = 0.3;
	double constant_1 = 3 *poles * Lm;

	
	while(1){
	
		//Read Data from motor
		id  = read_float64("in_data1");
		iq  = read_float64("in_data2");
		speed  = read_float64("in_data3");
		speed_ref  = read_float64("in_data4");	
		
		if(speed_ref < speed_ref_temp)
			speed_ref = speed_ref + 4;
		else if(speed_ref > speed_ref_temp)
			speed_ref = speed_ref - 4;
		else speed_ref = speed_ref;
		
		//Generation of Reference Values
		speed_err = speed_ref - speed;
		//Torque Reference Value Calculations
		int_speed_err = (int_speed_err + del_t*speed_err) * Ki;
		if (int_speed_err < -10)
			int_speed_err = -10;
		else if (int_speed_err > 10)
			int_speed_err = 10;
		else
			int_speed_err = int_speed_err;
	
		prop_speed_err = speed_err * Kp;
	
		torque_ref = int_speed_err + prop_speed_err;
		
		
		if (torque_ref < torque_sat_low)
			torque_ref = torque_sat_low;
		else if (torque_ref > torque_sat_high)
			torque_ref = torque_sat_high;
		else
			torque_ref = torque_ref;
		
		//Flux Reference Value Calculations
		if (speed_ref <=2000)
			flux_ref = nf;
		else if (speed_ref <=2500)
			flux_ref = (-0.0002*speed_ref + 1.4)*nf;
		else if (speed_ref <=3000)
			flux_ref = (-0.00036*speed_ref + 1.8)*nf;
		else 
			flux_ref = (-0.00042*speed_ref + 1.98)*nf;
	
		//Vector Control Begins Here
		tau_new= (del_t + tau_r);
		
		flux_rotor =  rotor_flux_calc( del_t,  Lm,  id,  flux_rotor_prev,  tau_new, tau_r);
		
		omega_r =  omega_calc( Lm,  iq,  tau_r,  flux_rotor);
		theta =  theta_calc( omega_r,  omega_m,  del_t,  theta_prev);

		iq_err = iq_err_calc( Lr,  torque_ref,  constant_1,  flux_rotor);
		
		//iD Calculations
		flux_err = flux_ref - flux_rotor;
		int_flux_err = (int_flux_err + del_t*flux_err) * Ki;
		
		if (int_flux_err < -1)
			int_flux_err = -1;
		else if (int_flux_err > 1)
			int_flux_err = 1;
		else
			int_flux_err = int_flux_err;
		
		prop_flux_err = flux_err * Kp;
		
		flux_add = int_flux_err + prop_flux_err;
		
		if (flux_add < -2)
			flux_add = -2;
		else if (flux_add > 2)
			flux_add = 2;
		else
			flux_add = flux_add;
		
		id_err = fdiv(flux_add,Lm);

		
		flux_ref_prev = flux_ref;

		flux_rotor_prev = flux_rotor;
		theta_prev = theta;
		
		//Write Back Generated Data
		write_float64("out_data1",id_err);
		write_float64("out_data2",iq_err);
		write_float64("out_data3",torque_ref);
		write_float64("out_data4",flux_rotor);
	}
}*/
