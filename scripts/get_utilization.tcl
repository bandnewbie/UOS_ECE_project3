set LAB 3   ;# lab number of this week
set ROOT "C:/UOS_ECE_project$LAB"
set PART xc7s75fgga484-1
# {lab folder  design top}
set labs {
  {lab3_19_led_pwm lab3_led_pwm}
  {lab3_20_rgb_pwm lab3_rgb_pwm}
  {lab3_21_piezo lab3_piezo}
  {lab3_22_stepper lab3_stepper}
  {lab3_23_mmss_clock lab3_mmss_clock}
  {lab3_24_character_lcd lab3_character_lcd}
  {lab3_25_uart_echo lab3_uart_echo}
}
set summary {}
foreach l $labs {
  lassign $l dir top
  set base "$ROOT/$dir"
  if {![file exists "$base/src"]} { lappend summary "$dir : folder not found"; continue }
  close_project -quiet
  create_project -in_memory -part $PART
  read_verilog [glob "$base/src/*.v"]
  read_xdc "$base/constraints/$top.xdc"
  synth_design -top $top -part $PART
  opt_design; place_design; phys_opt_design; route_design
  set rpt [report_utilization -return_string]
  report_utilization -file "$base/utilization_impl.txt"
  report_timing_summary -file "$base/timing_summary.txt"
  set luts "?"; set ffs "?"
  regexp {Slice LUTs\*?\s*\|\s*(\d+)} $rpt -> luts
  regexp {Slice Registers\s*\|\s*(\d+)} $rpt -> ffs
  set wns [get_property SLACK [get_timing_paths -max_paths 1 -setup]]
  set whs [get_property SLACK [get_timing_paths -max_paths 1 -hold]]
  lappend summary [format "%-22s Slice LUT = %s, FF = %s, WNS = %s, WHS = %s" $top $luts $ffs $wns $whs]
}
close_project -quiet
foreach s $summary { puts $s }
