# Physics-Informed Neural Network (PINN) for Inverse Mass-Spring-Damper Parameter Estimation

## Overview

This project demonstrates the application of a Physics-Informed Neural Network (PINN) for solving the inverse problem of a forced mass-spring-damper system using MATLAB.

The objective is to estimate the unknown physical parameters:

- Mass (m)
- Damping coefficient (c)
- Spring stiffness (k)

from displacement measurements while enforcing the governing differential equation during training.

---

## Governing Equation

\[
m\ddot{x}+c\dot{x}+kx=F(t)
\]

where

\[
F(t)=10\sin(2t)
\]

---

## Features

- MATLAB Deep Learning Toolbox implementation
- Physics-informed loss function
- Automatic differentiation
- Simultaneous estimation of m, c and k
- Training loss visualization
- Parameter convergence plots

---

## Project Files

| File | Description |
|------|-------------|
| buildPINN.m | Main training script |
| generateData.m | Synthetic data generation |
| massSpringDamperData.mat | Training dataset |
| figures/ | Output plots |

---

## Neural Network

- Fully Connected Neural Network
- Hidden Layers: 4
- Neurons per Layer: 128
- Activation: tanh

---

## Training Parameters

| Parameter | Value |
|-----------|------:|
| Optimizer | Adam |
| Learning Rate | 0.001 |
| Iterations | 3000 |
| Collocation Points | 1000 |

---

## Estimated Parameters

The PINN learns

- Mass (m)
- Damping coefficient (c)
- Spring stiffness (k)

using both measurement data and the governing physics.

---

## Results

The repository includes

- Training loss history
- Physics loss
- Data loss
- Parameter convergence
- Estimated physical parameters

---

## Requirements

- MATLAB R2026a
- Deep Learning Toolbox

---

## Author

**Alok Gupta**

Department of Mechanical Engineering

Motilal Nehru National Institute of Technology Allahabad

Summer Research Internship – Physics-Informed Neural Networks (PINNs)
