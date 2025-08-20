# Digital-clock
A hardware design project implementing a digital clock with support for 12h/24h format with set time and reset time features, a configurable alarm system, and a stopwatch. The design is modular (separate files for clock, alarm, stopwatch), and includes a testbench (tb.sv) for simulation and verification.


## 🛠 Features
### 1. Clock Core (`clock.sv`)
- Supports **12-hour and 24-hour modes**  
- Correct rollover of seconds, minutes, and hours
- [h1][h0]:[m1][m0]:[s1][s0]  represents HH:MM:SS format.
### 2. Set and Reset 
-  Use have access to set,reset inputs along with a,b,c,d,e,f inputs.
-  User can reset the time to 00:00:00 by giving reset input to 1.It stays to 00:00:00 untill the user on's and off's reset (0->1->0).
-  User can set the time by giving input to [a][b]:[c][d]:[e][f] (HH:MM:SS format) to adjust the time.It stays to the set time untill the user on's and off's set (0->1->0) .
### 2. Alarm (`alarm.sv`)
- User-configurable alarm time [ain1][ain2]:[ain3][ain4] in HH:MM format.
- **Enable** and **reset** controls  
- Alarm signal output when time matches along with user defined alarm timer .  

### 3. Stopwatch (`stopwatch.sv`)
- **Start, pause, restart** functionality  
- 32-bit counter for elapsed time tracking   

### 4. Top Module (`de.sv`)
- Integrates **clock** and **alarm**  
- Provides consolidated inputs/outputs  

### 5. Testbench (`tb.sv`)
- Drives clock, alarm, and stopwatch for verification  
- Simulates in both **12-hour and 24-hour** formats  
- Tests alarm trigger and reset  
- Tests stopwatch start, pause, and restart
- #1 represent 1ms delay. 

