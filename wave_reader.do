onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group spiker /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_spiker_adapter/clk_i
add wave -noupdate -expand -group spiker /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_spiker_adapter/rst_ni
add wave -noupdate -expand -group spiker /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_spiker_adapter/test_mode_i
add wave -noupdate -expand -group spiker /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_spiker_adapter/reg_file_to_ip
add wave -noupdate -expand -group spiker /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_spiker_adapter/ip_to_reg_file
add wave -noupdate -expand -group spiker /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_spiker_adapter/to_reg_file_req
add wave -noupdate -expand -group spiker /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_spiker_adapter/from_reg_file_rsp
add wave -noupdate -expand -group spiker /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_spiker_adapter/op_a_signal
add wave -noupdate -expand -group spiker /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_spiker_adapter/op_b_signal
add wave -noupdate -expand -group spiker /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_spiker_adapter/spiker_data_out1
add wave -noupdate -expand -group spiker /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_spiker_adapter/spiker_data_out2
add wave -noupdate -expand -group slave /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_soc_interconnect_wrap/spiker_adapter_slave/aw_id
add wave -noupdate -expand -group slave /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_soc_interconnect_wrap/spiker_adapter_slave/aw_addr
add wave -noupdate -expand -group slave /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_soc_interconnect_wrap/spiker_adapter_slave/aw_len
add wave -noupdate -expand -group slave /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_soc_interconnect_wrap/spiker_adapter_slave/aw_size
add wave -noupdate -expand -group slave /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_soc_interconnect_wrap/spiker_adapter_slave/aw_burst
add wave -noupdate -expand -group slave /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_soc_interconnect_wrap/spiker_adapter_slave/aw_lock
add wave -noupdate -expand -group slave /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_soc_interconnect_wrap/spiker_adapter_slave/aw_cache
add wave -noupdate -expand -group slave /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_soc_interconnect_wrap/spiker_adapter_slave/aw_prot
add wave -noupdate -expand -group slave /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_soc_interconnect_wrap/spiker_adapter_slave/aw_qos
add wave -noupdate -expand -group slave /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_soc_interconnect_wrap/spiker_adapter_slave/aw_region
add wave -noupdate -expand -group slave /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_soc_interconnect_wrap/spiker_adapter_slave/aw_atop
add wave -noupdate -expand -group slave /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_soc_interconnect_wrap/spiker_adapter_slave/aw_user
add wave -noupdate -expand -group slave /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_soc_interconnect_wrap/spiker_adapter_slave/aw_valid
add wave -noupdate -expand -group slave /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_soc_interconnect_wrap/spiker_adapter_slave/aw_ready
add wave -noupdate -expand -group slave /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_soc_interconnect_wrap/spiker_adapter_slave/w_data
add wave -noupdate -expand -group slave /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_soc_interconnect_wrap/spiker_adapter_slave/w_strb
add wave -noupdate -expand -group slave /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_soc_interconnect_wrap/spiker_adapter_slave/w_last
add wave -noupdate -expand -group slave /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_soc_interconnect_wrap/spiker_adapter_slave/w_user
add wave -noupdate -expand -group slave /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_soc_interconnect_wrap/spiker_adapter_slave/w_valid
add wave -noupdate -expand -group slave /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_soc_interconnect_wrap/spiker_adapter_slave/w_ready
add wave -noupdate -expand -group slave /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_soc_interconnect_wrap/spiker_adapter_slave/b_id
add wave -noupdate -expand -group slave /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_soc_interconnect_wrap/spiker_adapter_slave/b_resp
add wave -noupdate -expand -group slave /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_soc_interconnect_wrap/spiker_adapter_slave/b_user
add wave -noupdate -expand -group slave /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_soc_interconnect_wrap/spiker_adapter_slave/b_valid
add wave -noupdate -expand -group slave /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_soc_interconnect_wrap/spiker_adapter_slave/b_ready
add wave -noupdate -expand -group slave /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_soc_interconnect_wrap/spiker_adapter_slave/ar_id
add wave -noupdate -expand -group slave /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_soc_interconnect_wrap/spiker_adapter_slave/ar_addr
add wave -noupdate -expand -group slave /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_soc_interconnect_wrap/spiker_adapter_slave/ar_len
add wave -noupdate -expand -group slave /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_soc_interconnect_wrap/spiker_adapter_slave/ar_size
add wave -noupdate -expand -group slave /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_soc_interconnect_wrap/spiker_adapter_slave/ar_burst
add wave -noupdate -expand -group slave /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_soc_interconnect_wrap/spiker_adapter_slave/ar_lock
add wave -noupdate -expand -group slave /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_soc_interconnect_wrap/spiker_adapter_slave/ar_cache
add wave -noupdate -expand -group slave /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_soc_interconnect_wrap/spiker_adapter_slave/ar_prot
add wave -noupdate -expand -group slave /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_soc_interconnect_wrap/spiker_adapter_slave/ar_qos
add wave -noupdate -expand -group slave /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_soc_interconnect_wrap/spiker_adapter_slave/ar_region
add wave -noupdate -expand -group slave /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_soc_interconnect_wrap/spiker_adapter_slave/ar_user
add wave -noupdate -expand -group slave /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_soc_interconnect_wrap/spiker_adapter_slave/ar_valid
add wave -noupdate -expand -group slave /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_soc_interconnect_wrap/spiker_adapter_slave/ar_ready
add wave -noupdate -expand -group slave /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_soc_interconnect_wrap/spiker_adapter_slave/r_id
add wave -noupdate -expand -group slave /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_soc_interconnect_wrap/spiker_adapter_slave/r_data
add wave -noupdate -expand -group slave /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_soc_interconnect_wrap/spiker_adapter_slave/r_resp
add wave -noupdate -expand -group slave /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_soc_interconnect_wrap/spiker_adapter_slave/r_last
add wave -noupdate -expand -group slave /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_soc_interconnect_wrap/spiker_adapter_slave/r_user
add wave -noupdate -expand -group slave /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_soc_interconnect_wrap/spiker_adapter_slave/r_valid
add wave -noupdate -expand -group slave /tb_pulp/i_dut/i_soc_domain/i_pulp_soc/i_soc_interconnect_wrap/spiker_adapter_slave/r_ready
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3612790568 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 370
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {3712121124 ps} {3712752019 ps}
