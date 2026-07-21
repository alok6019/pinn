# Physics-Informed Neural Network (PINN) for Inverse Mass-Spring-Damper System

## Overview

This project implements a **Physics-Informed Neural Network (PINN)** in **MATLAB** to solve the inverse problem of a forced mass-spring-damper system.

The objective is to estimate the unknown physical parameters (**mass, damping coefficient, and spring stiffness**) from displacement measurements while satisfying the governing differential equation.

---

## Governing Equation

\[
m\ddot{x}+c\dot{x}+kx=F(t)
\]

where the external excitation is

\[
F(t)=10\sin(2t)
\]

---

## Objectives

- Estimate unknown parameters:
  - Mass (m)
  - Damping coefficient (c)
  - Spring stiffness (k)
- Incorporate governing physics into the loss function.
- Compare estimated parameters with their true values.
- Visualize training loss and parameter convergence.

---

## Repository Contents

| File | Description |
|------|-------------|
| `inversemain.m` | Main script for training the inverse PINN |
| `data_gen.m` | MATLAB script for generating synthetic training data |
| `Data Gen(for Testing).mlx` | Live Script for data generation and visualization |
| `main.mlx` | MATLAB Live Script demonstrating the complete workflow |
| `README.md` | Project documentation |

---

## Neural Network Architecture

- Input Features: Time and External Force
- Output: Displacement
- Hidden Layers: 4
- Neurons per Layer: 128
- Activation Function: tanh
- Framework: MATLAB Deep Learning Toolbox

---

## Training Details

| Parameter | Value |
|-----------|------:|
| Optimizer | Adam |
| Learning Rate | 0.001 |
| Training Iterations | 3000 |
| Collocation Points | 1000 |

---

## Physics-Informed Loss Function

The total loss consists of:

- **Physics Loss:** Residual of the governing differential equation.
- **Data Loss:** Error between predicted and measured displacement.

The combined loss is

\[
\mathcal{L}=\mathcal{L}_{Physics}+0.05\,\mathcal{L}_{Data}
\]

---

## Results

The implementation provides:

- Estimation of Mass (m)
- Estimation of Damping Coefficient (c)
- Estimation of Spring Stiffness (k)
- Training Loss History
- Parameter Convergence Plots

---

## Requirements

- MATLAB R2024a (or later)
- Deep Learning Toolbox

---

## Applications

- Structural Dynamics
- System Identification
- Parameter Estimation
- Scientific Machine Learning (SciML)
- Physics-Informed Neural Networks (PINNs)

---

## Author

**Alok Gupta**

Department of Mechanical Engineering

Motilal Nehru National Institute of Technology (MNNIT) Allahabad

Summer Research Internship on Physics-Informed Neural Networks (PINNs)

---

## License

This project is released under the MIT License.
