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

Potential energy is energy that an object has because of its position.

For the double pendulum, we are interested in **gravitational potential energy**, which depends on the height of each mass.

The gravitational potential energy of an object is

$$
PE = mgh
$$

where 
- $m$ is the mass of the object
- $g$ is the acceleration due to gravity
- $h$ is the height of the object relative to a chosen reference point

The choice of reference point does not matter. What matters is the difference in height between different positions.

For our double pendulum, let's choose the fixed point as the point where $y=0$. Since the positive $y$ direction has been defined as upwards, the masses will have negative $y$ coordinates when they are below the pivot.

### Potential Energy of the First Mass

From Section 2, the vertical position of the first mass is

$$
y_1 = -L_1\cos(\theta_1)
$$

Since $y_1$ represents the height of the first mass relative to the pivot, we can substitute it into the gravitational potential energy equation:

$$
PE_1 = -m_1gL_1\cos(\theta_1)
$$

### Potential Energy of the Second Mass

The vertical position of the first mass is

$$
y_2 = -L_1\cos(\theta_1)-L_2\cos(\theta_2)
$$

Substituting it into the gravitational potential energy equation gives

$$
PE_2 = m_2gy_2
$$

Therefore, 

$$
PE_2 = 
-m_2g
\left[
L_1\cos(\theta_1)+L_2\cos(\theta_2)
\right]
$$

### Total Potential Energy

The total potential energy of the system is the sum of the potential energy of both masses:

$$
PE = PE_1 + PE_2
$$

Substituting the expressions above gives

$$
PE = 
-m_1gL_1\cos(\theta_1)
+
-m_2g
\left[
L_1\cos(\theta_1)+L_2\cos(\theta_2)
\right]
$$

which can be written as

$$
PE =
-(m_1+m_2)gL_1\cos(\theta_1)
-m_2gL_2\cos(\theta_2)
$$

### Why Does Potential Energy Matter?

We now have expressions for both Kinetic and Potential energy forms in the system. The double pendulum continuously exchanges energy between these two forms.

For example, when a pendulum moves downward, gravitational potential energy decreases while kinetic energy generally increases. When it swings upwards, some of its kinetic energy is converted back into potential energy.

Because we have assumed that there is no friction or air resistance, the **total mechanical energy** of the system remains constant:

$$
ME = KE + PE
$$

This conservation of energy will also provide a useful way of checking whether our numerical simulation is behaving correctly.

In the next section, we will combine the kinetic and potential energies and use it to begin deriving the equations of motion.

## 5. The Lagrangian

The Lagrangian is a quantity used in Lagrangian mechanics to describe the behaviour of a physical system. It is defined as the difference between the kinetic and potential energies:

$$
\mathcal{L} = KE - PE
$$

Unlike energy itself, the Lagrangian is not an energy that the system "has". Instead, it is a mathematical quantity that allows us to derive the equations describing how a system moves.

### Constructing the Lagrangian

Substituting the expressions for KE and PE into the Lagrangian gives

$$
\mathcal{L} =
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
+
(m_1+m_2)gL_1\cos(\theta_1)
+
m_2gL_2\cos(\theta_2)]
$$

### Why Do We Use the Lagrangian?

At this point, we have a mathematical expression that contains everything we need to describe the energy of the double pendulum.

However, the Lagrangian itself does not directly tell us how $\theta_1$ and $\theta_2$ change with time.

To obtain the equations of motion, we use the **Euler-Lagrange** equation.

For a system described by a generalised quantity $q$, the Euler-Lagrange equation is 

$$
\frac{d}{dt}
\left(
\frac{\partial\mathcal{L}}
{\partial\dot{q}}
\right) - 
\frac{\partial\mathcal{L}}{\partial q}
=0
$$

A **generalised coordinate** is simply a variable that describes the configuration of a system. For our double pendulum, the two generalised coordinates are the angles

$$
q_1 = \theta_1
$$

and 

$$
q_2 = \theta_2
$$

We therefore need to apply the Euler-Lagrange equation twice:


$$
\frac{d}{dt}
\left(
\frac{\partial\mathcal{L}}
{\partial\dot{\theta}_1}
\right)- 
\frac{\partial\mathcal{L}}{\partial\theta_1}
=0
$$

and 

$$
\frac{d}{dt}
\left(
\frac{\partial\mathcal{L}}
{\partial\dot{\theta}_2}
\right) - 
\frac{\partial\mathcal{L}}{\partial\theta_2}
=0
$$

These two equations will give us the equations of motion for the double pendulum. 

The next section will work through these derivatives step by step.

## 6. Euler-Lagrange Equations

Before carrying out the calculations, it is useful to understand what the different parts of the equation mean.

The term

$$
\frac{\partial\mathcal{L}}{\partial q}
$$

means that we take the **partial derivative** of the Lagrangian with respect to the coordinate $q$.

A partial derivative is used when a function depends on several variables, but we want to see how it changes with respect to just one of them while treating the others as constant.

Similarly,

$$
\frac{\partial\mathcal{L}}{\partial\dot{q}}
$$

describes how the Lagrangian changes with respect to the **angular velocity** $\dot{q}$.

We then take the time derivative of this quantity:

$$
\frac{d}{dt}
\left(
\frac{\partial\mathcal{L}}{\partial\dot{q}}
\right)
$$

The Euler-Lagrange equation states that the difference between these two terms is zero.

For the double pendulum, this process gives us two coupled equations describing the motion of the two angles.

### Applying the Equation to $\theta_1$

For the first pendulum, we set

$$
q=\theta_1
$$

The Euler–Lagrange equation therefore becomes

$$
\frac{d}{dt}
\left(
\frac{\partial\mathcal{L}}{\partial\dot{\theta}_1}
\right) 
-\frac{\partial\mathcal{L}}{\partial\theta_1}
=0
$$

We first calculate

$$
\frac{\partial\mathcal{L}}{\partial\dot{\theta}_1}
$$

Starting with the Lagrangian from Section 5,

$$
\mathcal{L} =
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
+
(m_1+m_2)gL_1\cos(\theta_1)
+
m_2gL_2\cos(\theta_2)
$$

When differentiating with respect to $\dot{\theta}_1$, we treat everything that does not contain $\dot{\theta}_1$ as constant.

This gives

$$
\frac{\partial\mathcal{L}}{\partial\dot{\theta}_1} =
m_1L_1^2\dot{\theta}_1
+
m_2L_1^2\dot{\theta}_1
+
m_2L_1L_2\dot{\theta}_2
\cos(\theta_1-\theta_2)
$$

which can be written as

$$
\frac{\partial\mathcal{L}}{\partial\dot{\theta}_1} =
(m_1+m_2)L_1^2\dot{\theta}_1
+
m_2L_1L_2\dot{\theta}_2
\cos(\theta_1-\theta_2)
$$

We then take the derivative with respect to time:

$$
\frac{d}{dt}
\left(
\frac{\partial\mathcal{L}}{\partial\dot{\theta}_1}
\right)
$$

This requires the product rule and the chain rule, because both $\dot{\theta}_2$ and $\cos(\theta_1-\theta_2)$ can change with time.

After differentiating,

$$
\frac{d}{dt}
\left(
\frac{\partial\mathcal{L}}{\partial\dot{\theta}_1}
\right) =
(m_1+m_2)L_1^2\ddot{\theta}_1
+
m_2L_1L_2
\left[
\ddot{\theta}_2\cos(\theta_1-\theta_2)
\dot{\theta}_2(\dot{\theta}_1-\dot{\theta}_2)
\sin(\theta_1-\theta_2)
\right]
$$

where $\ddot{\theta}_1$ and $\ddot{\theta}_2$ represent the angular accelerations of the two pendulums.

Next, we calculate

$$
\frac{\partial\mathcal{L}}{\partial\theta_1}
$$

Differentiating the Lagrangian with respect to $\theta_1$ gives

$$
\frac{\partial\mathcal{L}}{\partial\theta_1} = 
-m_2L_1L_2\dot{\theta}_1\dot{\theta}_2
\sin(\theta_1-\theta_2)
(m_1+m_2)gL_1\sin(\theta_1)
$$

Substituting these expressions into the Euler–Lagrange equation gives the first equation of motion:

$$
(m_1+m_2)L_1^2\ddot{\theta}_1
+
m_2L_1L_2\ddot{\theta}_2
\cos(\theta_1-\theta_2)
+
m_2L_1L_2\dot{\theta}_2^2
\sin(\theta_1-\theta_2)
+
(m_1+m_2)gL_1\sin(\theta_1)
=0
$$

### Applying the Equation to $\theta_2$

We now repeat the same process for the second pendulum.

Set

$$
q=\theta_2
$$

giving

$$
\frac{d}{dt}
\left(
\frac{\partial\mathcal{L}}{\partial\dot{\theta}_2}
\right) -
\frac{\partial\mathcal{L}}{\partial\theta_2}
=0
$$

First,

$$
\frac{\partial\mathcal{L}}{\partial\dot{\theta}_2} =
m_2L_2^2\dot{\theta}_2
+
m_2L_1L_2\dot{\theta}_1
\cos(\theta_1-\theta_2)
$$

Taking the derivative with respect to time gives

$$
\frac{d}{dt}
\left(
\frac{\partial\mathcal{L}}{\partial\dot{\theta}_2}
\right) =
m_2L_2^2\ddot{\theta}_2
+
m_2L_1L_2
\left[
\ddot{\theta}_1\cos(\theta_1-\theta_2)
\dot{\theta}_1(\dot{\theta}_1-\dot{\theta}_2)
\sin(\theta_1-\theta_2)
\right]
$$

The partial derivative of the Lagrangian with respect to $\theta_2$ is

$$
\frac{\partial\mathcal{L}}{\partial\theta_2} =
m_2L_1L_2\dot{\theta}_1\dot{\theta}_2
\sin(\theta_1-\theta_2)
m_2gL_2\sin(\theta_2)
$$

Substituting these into the Euler–Lagrange equation and simplifying gives the second equation of motion:

$$
m_2L_2^2\ddot{\theta}_2
+
m_2L_1L_2\ddot{\theta}_1
\cos(\theta_1-\theta_2)
m_2L_1L_2\dot{\theta}_1^2
\sin(\theta_1-\theta_2)
+
m_2gL_2\sin(\theta_2)
=0
$$

### The Coupled Equations

We have now derived two equations describing the motion of the double pendulum.

The important feature is that the equations are coupled.

The first equation contains $\ddot{\theta}_2$, while the second contains $\ddot{\theta}_1$.

This means that the acceleration of one pendulum depends on the motion of the other. The two pendulums cannot therefore be treated as independent systems.

This coupling is central to the behaviour of the double pendulum and ultimately contributes to its chaotic motion.

However, these equations are not yet in a form that is particularly convenient for a computer to solve. The angular accelerations $\ddot{\theta}_1$ and $\ddot{\theta}_2$ appear in both equations.

In the next section, we will rearrange these equations to solve explicitly for the angular accelerations. These are the equations that we will eventually give to the numerical solver in Python.

## 7. Equations of Motion

### Simplifying the Equations

From Section 6, the equations of motion are

$$
(m_1+m_2)L_1\ddot{\theta}_1
+
m_2L_2\ddot{\theta}_2\cos(\theta_1-\theta_2)
+
m_2L_2\dot{\theta}_2^2\sin(\theta_1-\theta_2)
+
(m_1+m_2)g\sin(\theta_1)
=0
$$

and

$$
L_2^2\ddot{\theta}_2
+
L_1L_2\ddot{\theta}_1\cos(\theta_1-\theta_2)
+
L_1L_2\dot{\theta}_1^2\sin(\theta_1-\theta_2)
+
gL_2\sin(\theta_2)
=0.
$$

These equations are coupled because each equation contains both (\ddot{\theta}_1) and (\ddot{\theta}_2).

For convenience, let us define

$$
\Delta=\theta_1-\theta_2.
$$

The equations then become

$$
(m_1+m_2)L_1\ddot{\theta}_1
+
m_2L_2\cos(\Delta)\ddot{\theta}_2
-(m_1+m_2)g\sin(\theta_1)
m_2L_2\dot{\theta}_2^2\sin(\Delta)
$$

and

$$
L_1L_2\cos(\Delta)\ddot{\theta}_1
+
L_2^2\ddot{\theta}_2
+
L_1L_2\dot{\theta}_1^2\sin(\Delta)
+
gL_2\sin(\theta_2).
$$

### Explicit Equations for the Angular Accelerations

Solving these two equations simultaneously gives an expression for the first angular acceleration:

$$
\boxed{
\ddot{\theta}_1 =
\frac{
-m_2L_1\dot{\theta}_1^2\sin(\Delta)\cos(\Delta)
-m_2L_2\dot{\theta}_2^2\sin(\Delta)
-(m_1+m_2)g\sin(\theta_1)
+m_2g\sin(\theta_2)\cos(\Delta)
}{
L_1\left(m_1+m_2-m_2\cos^2(\Delta)\right)
}
}
$$

Similarly, the second angular acceleration is

$$
\boxed{
\ddot{\theta}_2 =
\frac{
(m_1+m_2)L_1\dot{\theta}_1^2\sin(\Delta)
+m_2L_2\dot{\theta}_2^2\sin(\Delta)\cos(\Delta)
+(m_1+m_2)g\sin(\theta_1)\cos(\Delta)
-(m_1+m_2)g\sin(\theta_2)
}{
L_2\left(m_1+m_2-m_2\cos^2(\Delta)\right)
}
}
$$

These two equations are the main equations of motion used by the simulation.

These will tell us how the angular accelerations depend on:

- the masses (m_1) and (m_2)
- the rod lengths (L_1) and (L_2)
- the current angles (\theta_1) and (\theta_2)
- the current angular velocities (\dot{\theta}_1) and (\dot{\theta}_2)
- gravitational acceleration (g)


### What the Equations Tell Us

The equations demonstrate why the double pendulum is more complicated than two independent pendulums.

For example, (\ddot{\theta}_1) depends not only on (\theta_1) and (\dot{\theta}_1), but also on (\theta_2) and (\dot{\theta}_2). The same is true in reverse for (\ddot{\theta}_2).

The terms involving

$$
\sin(\theta_1-\theta_2)
$$

and

$$
\cos(\theta_1-\theta_2)
$$

describe the coupling between the two pendulums.

Because the equations are nonlinear, small changes in the initial conditions can eventually produce very different trajectories. This sensitivity to initial conditions is one of the defining features of chaotic motion.

These equations provide the mathematical model that will be passed to a numerical solver in the next section.

## 8. Numerical Solution

The equations of motion from the previous section give us the angular accelerations of the two pendulums. However, these equations cannot generally be solved analytically for the complete motion of the double pendulum.

Instead, we can use numerical integration to approximate the motion over time.

### Converting the Equations into First-Order Equations

The equations of motion contain second derivatives:

$$
\ddot{\theta}_1
$$

and

$$
\ddot{\theta}_2.
$$

Numerical solvers such as the ones available in SciPy are designed to work with systems of first-order differential equations.

I therefore introduce the angular velocities

$$
\omega_1=\dot{\theta}_1
$$

and

$$
\omega_2=\dot{\theta}_2.
$$

This gives

$$
\dot{\theta}_1=\omega_1
$$

$$
\dot{\theta}_2=\omega_2
$$

and

$$
\dot{\omega}_1=\ddot{\theta}_1
$$

$$
\dot{\omega}_2=\ddot{\theta}_2.
$$

The state of the system can now be represented by four variables:

$$
\mathbf{y}
\begin{bmatrix}
\theta_1\
\theta_2\
\omega_1\
\omega_2
\end{bmatrix}.
$$

The derivative of this state is therefore

$$
\frac{d\mathbf{y}}{dt}
\begin{bmatrix}
\omega_1\
\omega_2\
\ddot{\theta}_1\
\ddot{\theta}_2
\end{bmatrix}.
$$

The expressions for $(\ddot{\theta}_1)$ and $(\ddot{\theta}_2)$ come directly from the equations of motion derived in Section 7.

### Initial Conditions

A differential equation needs an initial state before its evolution can be calculated.

For the double pendulum, this means specifying:

- the initial angle of the first pendulum, $\theta_1(0)$
- the initial angle of the second pendulum, $\theta_2(0)$
- the initial angular velocity of the first pendulum, $\omega_1(0)$
- the initial angular velocity of the second pendulum, $\omega_2(0)$

For example, we could start with

$$
\theta_1(0)=90^\circ
$$

$$
\theta_2(0)=90^\circ
$$

and both pendulums initially stationary:

$$
\omega_1(0)=0
$$

$$
\omega_2(0)=0.
$$

Since Python’s trigonometric functions use radians, the angles must be converted before being used in the simulation:

$$
90^\circ=\frac{\pi}{2}.
$$

Therefore, the initial state used by the program would be

$$
\mathbf{y}(0)
\begin{bmatrix}
\frac{\pi}{2}\
\frac{\pi}{2}\
0\
0
\end{bmatrix}.
$$

### Numerical Integration

Once the equations and initial conditions have been defined, a numerical solver can approximate the state of the system at later times.

Conceptually, the process is:

1. Start with the initial state of the pendulum.
2. Calculate the angular accelerations using the equations of motion.
3. Use these accelerations to determine how the angular velocities change.
4. Use the angular velocities to determine how the angles change.
5. Repeat this process over many small time intervals.
The result is a numerical approximation of

$$
\theta_1(t),\qquad
\theta_2(t),\qquad
\omega_1(t),\qquad
\omega_2(t).
$$

These values allow us to reconstruct the position and motion of both masses throughout the simulation.

### Numerical Accuracy

A numerical solution is an approximation rather than an exact solution. The accuracy depends partly on the numerical integration method and the tolerances used by the solver.

This is particularly important for a chaotic system such as the double pendulum. Small numerical errors can grow over time because the system is sensitive to its initial conditions.

For this reason, the simulation can be checked using conservation of energy.

For the idealised system used in this project, there is no friction or air resistance, so the total mechanical energy should remain approximately constant:

$$
E=KE+PE.
$$

A plot of total energy against time can therefore be used as a diagnostic tool. If the numerical solution is behaving well, the total energy should remain close to its initial value, apart from small numerical errors.

### From Mathematics to Code

At this point, the mathematical model is complete.

We have:

- defined the geometry of the double pendulum
- derived its kinetic energy
- derived its potential energy
- constructed the Lagrangian
- used the Euler–Lagrange equations to derive the equations of motion
- rearranged the equations to calculate the angular accelerations
- converted the system into a form suitable for numerical integration
The next step is to implement this model in Python.

The Python program will define the physical parameters and equations of motion, use a numerical solver to integrate the system, and then analyse and visualise the resulting data.
