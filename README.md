# A Transient Current-Based Double Transmission Line Protection Using Wavelet–ML Approach 

## Overview
This MATLAB project proposes a fast and reliable protection scheme for
double transmission lines using transient current signals. Discrete
Wavelet Transform (DWT) is employed to extract high-frequency features,
and machile Learning approach is used for intelligent fault detection,
classification, and location.

## Key Contributions
- Double transmission line protection
- Transient current-based fault analysis
- Wavelet feature extraction using DWT
- Machine Learning based decision making
- Fault detection within less than half cycle
- Fault Impact Analysis
- Fault Location

## System Description
- Double-circuit transmission line modeled in MATLAB/Simulink
- Fault scenarios: LG, LL, LLG, LLL, high-resistance faults

## Methodology
1.Simulink model developped
2. Current signal acquisition
3. Wavelet decomposition (Bior wavelet)
4. Feature extraction (energy coefficients)
5. Fault location estimation

## How to Run
1. Open MATLAB (R2018a or later)
2. Select MATLAB/simulink .mdl file 
3. Run `main_simulation.m`
4. Select fault parameters
5. View results in `/results`

## Results
- Accurate fault discrimination 
- Immunity to power flow and renewable disturbances
- High-speed protection performance
- Fault impact Analysis

## Applications
- Transmission line protection
- Smart grid protection schemes

## Author
Dr. Ravi Kumar Goli  
PhD – Electrical Power Systems

## License
MIT License

## Note on Reproducibility
Due to the size of Simulink models and proprietary system parameters,
this repository provides algorithm-level MATLAB scripts and a simulation
template. The complete runnable setup can be shared upon request for
academic or collaborative purposes.

## Note
The full simulation model is demonstrated via video due to the size and
proprietary nature of Simulink files. Algorithm-level MATLAB scripts are
provided for reference and reproducibility.



