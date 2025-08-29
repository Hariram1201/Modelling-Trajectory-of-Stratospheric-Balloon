#Modelling Trajectory of a Stratospheric Balloon

This project simulates 2D and 3D trajectories of high-altitude stratospheric balloons using MATLAB. The model incorporates environmental data and dynamic balloon behaviour to predict ascent, float, and descent phases accurately.
##Features
- **Trajectory Simulation:** 2D and 3D modelling using coupled ODEs.
- **Numerical Methods:** Runge-Kutta 4 for vertical position calculation; Secant method iteratively determines optimal helium venting or sand release to reach target altitude within 0.5 m tolerance.
- **Environmental Data:** Integration of wind forecast datasets for realistic trajectory predictions.
- **Optimisation:** Minimizes resource usage while ensuring target altitude is reached.
- **Visualisation:** Interactive plots showing balloon path, altitude, and flight parameters.
##Usage
Run the main.m script to launch the simulation GUI. Set initial conditions such as launch altitude and target altitude. The GUI allows interactive 2D/3D visualisation of balloon trajectories, while the Secant method optimizes helium venting and ballast release for target accuracy.
##Dependencies
- MATLAB (R2023a or later recommended)
- No additional toolboxes required
