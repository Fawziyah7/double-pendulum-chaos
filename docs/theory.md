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

We can describe the double pendulum using the following variables:

### Masses

$m_1$ - mass of the first pendulum in kg

$m_2$ - mass of the second pendulum in kg

### Lengths

$L_1$ - length of the first rod

$L_2$ - length of the second rod

### Angles

The angles $\theta_1$ and $\theta_2$ describe the orientation of each rod relative to the downward vertical direction in radians.

The first angle, $\theta_1$, describes the position of the first rod. The second angle, $\theta_2$, describes the position of the second rod.

These angles are measured **independtly from the vertical**, rather than measuring $\theta_2$ relative to the first rod.

### Coordinate system

To calculate the motion of the pendulume, we will describe the positions of the two masses using Cartesian coordinates.

Let's define:
- $x$ as the horizontal direction
- $y$ as the vertical direction
- The fixed pivot as the origin, $(0,0)$
- Positive $x$ as to the right
- Positive $y$ as upward

For the first mass, because it is connected directly to the fixed pivot by the first rod, its position is therefore determined by $L_1$ amd $\theta_1$, so its coordinates are

$$
x_1 = L_1\sin(\theta_1)
$$

$$
y_1 = -L_1\cos(\theta_1)
$$

The second mass is attached to the end of the first rod. Its position depends on **both** pendulum angles. Its coordinates are

$$
x_2 = L_1\sin(\theta_1) + L_2\sin(\theta_2)
$$

$$
y_2 = -L_1\cos(\theta_1) - L_2\sin(\theta_2)
$$

The coordinates will allow us to calculate quanities that we will need later. 

For example, by differentiating the positon with respect to time, we can find the velocity of each mass.

The velocities will allow us to calculate **kinetic energy**, while the vertical positions will allows us to calculate **potential energy**.

These two forms of energy are the key ingredients needed to construct the Langrangian:

$$
\mathcal{L} = T - V
$$

In the next section, we will use these positions to derive the **kinetic energy** of the double pendulum.

### Diagram

![Double pendulum setup](double_pendulum_diagram.png)

*Figure 1: Diagram of the double pendulum system, showing the masses, rod lengths and angles measured from the downward vertical.

## 3. Kinetic Energy

Kinetic energy is the energy an object has because it is moving.

For an object with mass $m$ moving at speed $v$, its kinetic energy is given by

$$
KE = \frac{1}{2}mv^2
$$

In a double pendulum, both masses are moving, so the total kinetic energy is the sum of the kinetic energy of the two masses:

$$
KE = KE_1 * KE_2
$$

where $KE_1$ is the kinetic energy of the first mass and $KE_2$ is the kinetic energy of the second mass.

### Kinetic Energy of the First Mass

The velocity of the mass is how quickly its position changes with time. Therefore, we can find its horizontal and vertical velocty by differentiating its position with respect to time.

For the horizontal direction:

$$
\dot{x}_1 = L_1\cos(\theta_1)\dot{\theta}_1
$$

For the vertical direction:

$$
\dot{y}_1 = L_1\sin(\theta_1)\dot{\theta}_1
$$

Here, $\dot{\theta}_1$ represents the rate at which $\theta_1$ changes with time. In other words, it is the **angular velocity** of the first pendulum.

The speed of the first mass can be found from its horizontal and vertical velocity:

$$
v_1^2 = \dot{x}_1^2 + \dot{y}_1^2
$$

Substituting the expressions above gives

$$
v_1^2 = 
L_1^2\cos^2(\theta_1)\dot{\theta}_1^2 
+
L_1^2\sin^2(\theta_1)\dot{\theta}_1^2
$$

Factoring out the common terms:

$$
v_1^2 = 
L_1^2\dot{\theta}_1^2
\left[
\cos^2(\theta_1)+\sin^2(\theta_1)
\right]
$$

Using the trignometric identity

$$
\sin^2(\theta)+\cos^2(\theta)=1
$$

we obtain

$$
v_1^2 = L_1^2\dot{\theta}_1^2
$$

Therefore, the kinetic energy of the first mass is

$$KE_1 = 
\frac{1}{2}m_1L_1^2\dot{\theta}_1^2
$$

### Kinetic energy of the Second Mass

The second mass is more complicated because its position depends on **both** pendulum angles.

Differentiating with respect to time gives

$$
\dot{x}_2 = 
L_1\cos(\theta_1)\dot{\theta}_1 
+ 
L_2\cos(\theta_2)\dot{\theta}_2
$$

and

$$
\dot{y}_2 = 
L_1\sin(\theta_1)\dot{\theta}_1 
+ 
L_2\sin(\theta_2)\dot{\theta}_2
$$

The squared speed of the second mass is 

$$
v_2^2 = \dot{x}_2^2+\dot{y}_2^2
$$

Substituting and simplifying the expressions gives

$$
v_2^2 =
L_1^2\dot{\theta}_1^2
+
L_2^2\dot{\theta}_2^2
+
2L_1L_2\dot{\theta}_1\dot{\theta}_2\cos(\theta_1-\theta_2)
$$

Therefore, the kinetic energy of the second mass is 

$$
KE_2 = 
\frac{1}{2}m_2
\left[
L_1^2\dot{\theta}_1^2
+
L_2^2\dot{\theta}_2^2
+
2L_1L_2\dot{\theta}_1\dot{\theta}_2
\cos(\theta_1-\theta_2
\right]
$$

### Total Kinetic Energy

The total kinetic energy is the sum of the expressions:

$$
KE = KE_1 + KE_2
$$

Therefore, 

$$ 
KE =
\frac{1}{2}m_1L_1^2\dot{\theta}_1^2
+
\frac{1}{2}m_2
\left[
L_1^2\dot{\theta}_1^2
+
L_2^2\dot{\theta}_2^2
+
2L_1L_2\dot{\theta}_1\dot{\theta}_2
\cos(\theta_1-\theta_2)
\right]
$$

This equation contains an important feature of the double pendulum.

The final term shows that the motion of the two pendulums is **coupled**. The kinetic energy of the second mass depends on both angular velocities, $\dot{\theta}_1$ and $\dot{\theta}_2$.

This coupling is one of the reasons why the double pendulum behaves very differently from two independent pendulums.

In next section, we will calculate the **potential energy** of the system. 

## 4. Potential Energy

## 5. The Lagrangian

## 6. Euler-Lagrange Equations

## 7. Equations of Motion

## 8. Numerical Solution

## 9. From Equations to Python
