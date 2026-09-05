# The Physics Behind a Double Pendulum

Before building the simulation, it is useful to understand the physics that describes how a double pendulum moves. This sections starts from the basic ideas and gradually builds towards the equations used in the simulation.

## 1. Introduction

### What is a pendulum?

A pendulum is a mass suspended from a fixed point by a rod or string. When the mass is moved away from its resting position and released, gravity causes it to swing back and forth.

A simple pendulum can be described using a few quantites:
- **Mass ($m$)** - how much the pendulum bob weighs
- **Length ($L$)** - the distance from the point of suspension
- **Angle ($\theta$)** - how far the pendulum has rotated from its resting position
- **Gravity ($g$)** - the acceleration caused by Earth's gravitational field, approximately $9.81 (m/s^2)$

For a simple pendulum. the motion is relatively predictable. If we know its starting position and velocity, we can use the laws of physics to determine how it will move over time.

### What makes a double pendulum different?

A **double pendulum** consists of two pendulums connected together. The first pendulum is attached to a fixed point, while the second pendulum is attached to the end of the first.

This creates a system where the two pendulums interact with each other.

The movement of the first pendulum affects the second pendulum, while the movement of the second pendulum also affects the first. This coupling makes the mathematics considerably more complicated than for a single pendulum. 

More importantly, the double pendulum can exhibit **chaotic behaviour**. 

This does not mean that its motion is completely random. The system still follows deterministic physical laws. Instead, it means that very small differences in the starting conditions can eventually produce very different motions.

For example, two double pendulums could start almost identically, with one having an initial angle of $90^\circ$ and the other $90.01^\circ$. Initally their movements would be almost indistinguishable, but over time their trajectories can diverge significantly.

This sensitivity to initial conditions is one of the main features that I will investigate in this project.

### How can we describe its motion?

To simulate the double pendulum, we need a mathematical description of how its position and velocity change over time.

We can describe the system using two angles:
- $\theta_1$ - the angle of the first pendulum
- $\theta_2$ - the angle of the second pendulum

As these angles change, the positions of both masses change as well.

The aim is therefore to find the equations that tell how $\theta_1$ and $\theta_2$ change with time.

To do this, we can use a formulation of classical mechanics called Lagrangian mechanics.

Rather than calculating every force acting on each mass directly, Lagrangian mechanics allows us to describe the system using its kinetic and potential energy.

We first define the Lagrangian as

$$
\mathcal{L} = T -V
$$

where: 
- $T$ is the total **kinetic energy** of the system - the energy associated with its motion
- $V$ is the total **potential energy** of the system - the energy associated with its position
- $\mathcal{L}$ is the Lagrangian

From the Lagrangian, we can derive the equations of motion for the double pendulum. 

The following sections works through this derivation step by step.

## 2. Setting up the system

For this model, we will make a few simplifying assumptions:
- The rods have no mass
- The two masses are treated as point masses
- There is no air resistance or friction
- The rods remain rigid and do not bend
- Gravity is constant, with $g = 9.81 (m/s^2)$
- The motion is restricted to two dimensions

These assumptions allow us to focus on the underlying physics of the system without introducing additinal complications.

### Masses
### Lengths
### Angles
### Coordinate system
### Diagram

## 3. Kinetic Energy

## 4. Potential Energy

## 5. The Lagrangian

## 6. Euler-Lagrange Equations

## 7. Equations of Motion

## 8. Numerical Solution

## 9. From Equations to Python
