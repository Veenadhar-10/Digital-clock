# Digital-clock
A hardware design project using system verilog implementing a digital clock with support for 12h/24h format with set time and reset time features, a configurable alarm system, and a stopwatch. The design is modular (separate files for clock, alarm, stopwatch), and includes a testbench (tb.sv) for simulation and verification.


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


## 🔌 Interface Signals
### Top Module Inputs:
- clk: Main clock input
- reset: Global reset (active high pulse)
- set: Time set control (active high pulse)
- mode_12_24: 0 = 12-hour mode, 1 = 24-hour mode
- alarm_enable: Alarm on/off control
- alarm_set: Alarm time setting mode
- a,b,c,d,e,f: Time setting inputs (BCD digits)
### Top Module Outputs:
- h1, h0: Hour digits
- m1, m0: Minute digits
- s1, s0: Second digits
- am_pm: AM/PM indicator (12-hour mode only)
- alarm_trigger: Alarm active signal
- stopwatch_active: Stopwatch running indicator

## ⚙️ Operation Instructions
### Time Setting:
- Apply desired time to input digits [a][b]:[c][d]:[e][f]
- Pulse set signal (0→1→0) to confirm
### Reset Operation:
- Pulse reset signal (0→1→0) to reset time to 00:00:00
### Alarm Setting:
- Enable alarm_set mode
- Input alarm time via digit inputs
- Pulse set to confirm
- Enable alarm with alarm_enable
### Stopwatch Operation:
- Use dedicated controls for start, pause, and reset functions
## 🔄 Simulation
- The testbench (tb.sv) provides comprehensive verification:
- Tests normal clock operation in both 12h and 24h modes
- Verifies set and reset functionality
- Tests alarm triggering at the correct time
- Validates stopwatch operation with various control sequences

## 📝 Notes
- All time values are represented in BCD format
- The design uses positive-edge triggered flip-flops throughout
- Input debouncing should be handled externally if needed
- The #1 delay in testbench represents 1ms simulation time
