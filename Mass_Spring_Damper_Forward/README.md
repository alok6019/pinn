# Physics-Informed Neural Network (PINN) for Mass-Spring-Damper System

## Overview

This project implements a **Physics-Informed Neural Network (PINN)** in **MATLAB** to solve the forward problem of a mass-spring-damper system.

Unlike conventional neural networks that rely solely on training data, PINNs incorporate the governing differential equation into the loss function, enabling the model to learn the system dynamics while satisfying the underlying physics.

---

## Governing Equation

The mass-spring-damper system is governed by

\[
m\frac{d^2x}{dt^2}+c\frac{dx}{dt}+kx=0
\]

where:

- **m** = Mass
- **c** = Damping coefficient
- **k** = Spring stiffness
- **x(t)** = Displacement

---

## Project Objectives

- Implement a PINN using MATLAB Deep Learning Toolbox.
- Learn the displacement response of the system.
- Enforce the governing ordinary differential equation during training.
- Compare the PINN prediction with the analytical solution.

---

## Files

| File | Description |
|------|-------------|
| `buildPINNs.m` | Main script to build and train the PINN |
| `massSpringDamperData.mat` | Dataset used for training and validation |
| `plotMassSpringDamperData.m` | Visualizes training data and collocation points |
| `plotModelPredictions.m` | Compares analytical and PINN predictions |
| `figures/` | Training results and prediction plots |

---

## Methodology

The PINN is trained by minimizing a combined loss consisting of:

- Physics loss (ODE residual)
- Initial condition loss
- Data loss (measurement points)

Automatic differentiation is used to compute derivatives required for the physics residual.

---

## Results

The trained model accurately predicts the displacement of the mass-spring-damper system while satisfying the governing differential equation.

Example outputs include:

- Exact vs PINN prediction
- Training data visualization
- PINN collocation points
- Training convergence

---

## Requirements

- MATLAB R2024a (or later)
- Deep Learning Toolbox

---

## Applications

- Structural dynamics
- Mechanical vibration analysis
- Physics-informed machine learning
- Scientific computing

---

## Author

**Alok Gupta**

Department of Mechanical Engineering

Motilal Nehru National Institute of Technology (MNNIT) Allahabad

Summer Research Internship on Physics-Informed Neural Networks (PINNs)

---

## License

This project is released under the MIT License.
