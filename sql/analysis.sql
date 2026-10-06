-- Double Pendulum Simulation
-- SQL Analysis


-- ============================================================
-- 1. DATASET OVERVIEW
-- ============================================================

-- Number of observations

SELECT
    COUNT(*) AS number_of_observations
FROM simulation;


-- Simulation start and end time

SELECT
    MIN(time) AS start_time,
    MAX(time) AS end_time
FROM simulation;


-- ============================================================
-- 2. MAXIMUM ANGULAR VELOCITY
-- ============================================================

-- Maximum angular velocity of each pendulum

SELECT
    MAX(ABS(omega1)) AS max_angular_velocity_1,
    MAX(ABS(omega2)) AS max_angular_velocity_2
FROM simulation;


-- Time and angle when Pendulum 1 reached
-- its maximum angular velocity

SELECT
    time,
    theta1,
    omega1
FROM simulation
ORDER BY ABS(omega1) DESC
LIMIT 1;


-- Time and angle when Pendulum 2 reached
-- its maximum angular velocity

SELECT
    time,
    theta2,
    omega2
FROM simulation
ORDER BY ABS(omega2) DESC
LIMIT 1;


-- ============================================================
-- 3. MAXIMUM ANGULAR DISPLACEMENT
-- ============================================================

SELECT
    MAX(ABS(theta1)) AS max_angle_1,
    MAX(ABS(theta2)) AS max_angle_2
FROM simulation;


-- ============================================================
-- 4. AVERAGE ANGULAR VELOCITY
-- ============================================================

SELECT
    AVG(ABS(omega1)) AS average_angular_velocity_1,
    AVG(ABS(omega2)) AS average_angular_velocity_2
FROM simulation;


-- ============================================================
-- 5. FIRST HALF VS SECOND HALF
-- ============================================================

SELECT
    CASE
        WHEN time < 10 THEN 'First half'
        ELSE 'Second half'
    END AS time_period,

    AVG(ABS(omega1)) AS avg_angular_velocity_1,
    AVG(ABS(omega2)) AS avg_angular_velocity_2,

    MAX(ABS(omega1)) AS max_angular_velocity_1,
    MAX(ABS(omega2)) AS max_angular_velocity_2

FROM simulation

GROUP BY time_period

ORDER BY time_period DESC;


-- ============================================================
-- 6. ENERGY CONSERVATION
-- ============================================================

SELECT
    MIN(total_energy) AS minimum_energy,
    MAX(total_energy) AS maximum_energy,
    AVG(total_energy) AS average_energy,
    MAX(total_energy) - MIN(total_energy) AS energy_range
FROM simulation;
