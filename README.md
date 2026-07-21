# Physics-Informed Neural Networks (PINNs) in MATLAB

This repository contains MATLAB implementations of **Physics-Informed Neural Networks (PINNs)** developed using the **Deep Learning Toolbox**. The projects demonstrate how neural networks can be trained by combining governing physical laws with observational data to solve both **forward** and **inverse** problems.

---

## Repository Structure

```
PINNs/
│
├── Mass_Spring_Damper_Forward/
│   ├── MATLAB source files
│   ├── README.md
│   └── Result figures
│
├── Mass_Spring_Damper_Inverse/
│   ├── MATLAB source files
│   ├── README.md
│   └── Result figures
│
├── LICENSE
└── README.md
```

---

## Projects

### Mass-Spring-Damper Forward Problem

A Physics-Informed Neural Network is used to predict the displacement response of a mass-spring-damper system while satisfying the governing differential equation.

**Key Features**
- Forward solution of a second-order ordinary differential equation
- Fully connected neural network implemented in MATLAB
- Automatic differentiation using the Deep Learning Toolbox
- Physics-informed loss formulation
- Comparison with the analytical solution

---

### Mass-Spring-Damper Inverse Problem

A PINN is trained to estimate the unknown physical parameters (**mass**, **damping coefficient**, and **spring stiffness**) from displacement measurements while enforcing the governing equation.

**Key Features**
- Inverse parameter estimation
- Combined physics and data loss
- Automatic differentiation
- Adam optimizer
- Training loss visualization
- Parameter convergence analysis

---

## Features

- MATLAB implementation
- Deep Learning Toolbox
- Physics-Informed Neural Networks (PINNs)
- Forward and inverse modeling
- Automatic differentiation
- Scientific Machine Learning (SciML)
- Parameter estimation
- Reproducible examples

---

## Software Requirements

- MATLAB R2024a or later
- Deep Learning Toolbox

---

## Future Work

This repository will be expanded with additional PINN applications, including:

- Heat Equation (Forward Problem)
- Inverse Heat Conduction


---

## Author

**Alok Gupta**

B.Tech, Mechanical Engineering  
Motilal Nehru National Institute of Technology (MNNIT) Allahabad

Summer Research Intern under **Dr. J. C. Atwal**

---

## License

This project is licensed under the **MIT License**.
