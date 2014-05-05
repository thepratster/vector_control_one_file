-- VHDL produced by vc2vhdl from virtual circuit (vc) description 
library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.memory_subsystem_package.all;
use ahir.types.all;
use ahir.subprograms.all;
use ahir.components.all;
use ahir.basecomponents.all;
use ahir.operatorpackage.all;
use ahir.utilities.all;
use ahir.functionLibraryComponents.all;
library work;
use work.ahir_system_global_package.all;
entity vector_control_daemon is -- 
  generic (tag_length : integer); 
  port ( -- 
    clk : in std_logic;
    reset : in std_logic;
    start_req : in std_logic;
    start_ack : out std_logic;
    fin_req : in std_logic;
    fin_ack   : out std_logic;
    in_data1_pipe_read_req : out  std_logic_vector(0 downto 0);
    in_data1_pipe_read_ack : in   std_logic_vector(0 downto 0);
    in_data1_pipe_read_data : in   std_logic_vector(31 downto 0);
    in_data4_pipe_read_req : out  std_logic_vector(0 downto 0);
    in_data4_pipe_read_ack : in   std_logic_vector(0 downto 0);
    in_data4_pipe_read_data : in   std_logic_vector(31 downto 0);
    in_data2_pipe_read_req : out  std_logic_vector(0 downto 0);
    in_data2_pipe_read_ack : in   std_logic_vector(0 downto 0);
    in_data2_pipe_read_data : in   std_logic_vector(31 downto 0);
    in_data3_pipe_read_req : out  std_logic_vector(0 downto 0);
    in_data3_pipe_read_ack : in   std_logic_vector(0 downto 0);
    in_data3_pipe_read_data : in   std_logic_vector(31 downto 0);
    in_data5_pipe_read_req : out  std_logic_vector(0 downto 0);
    in_data5_pipe_read_ack : in   std_logic_vector(0 downto 0);
    in_data5_pipe_read_data : in   std_logic_vector(31 downto 0);
    out_data3_pipe_write_req : out  std_logic_vector(0 downto 0);
    out_data3_pipe_write_ack : in   std_logic_vector(0 downto 0);
    out_data3_pipe_write_data : out  std_logic_vector(31 downto 0);
    out_data4_pipe_write_req : out  std_logic_vector(0 downto 0);
    out_data4_pipe_write_ack : in   std_logic_vector(0 downto 0);
    out_data4_pipe_write_data : out  std_logic_vector(31 downto 0);
    out_data1_pipe_write_req : out  std_logic_vector(0 downto 0);
    out_data1_pipe_write_ack : in   std_logic_vector(0 downto 0);
    out_data1_pipe_write_data : out  std_logic_vector(31 downto 0);
    out_data2_pipe_write_req : out  std_logic_vector(0 downto 0);
    out_data2_pipe_write_ack : in   std_logic_vector(0 downto 0);
    out_data2_pipe_write_data : out  std_logic_vector(31 downto 0);
    tag_in: in std_logic_vector(tag_length-1 downto 0);
    tag_out: out std_logic_vector(tag_length-1 downto 0) -- 
  );
  -- 
end entity vector_control_daemon;
architecture Default of vector_control_daemon is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  signal in_buffer_data_in, in_buffer_data_out: std_logic_vector((tag_length + 0)-1 downto 0);
  signal in_buffer_write_req: std_logic;
  signal in_buffer_write_ack: std_logic;
  signal in_buffer_unload_req_symbol: Boolean;
  signal in_buffer_unload_ack_symbol: Boolean;
  signal out_buffer_data_in, out_buffer_data_out: std_logic_vector((tag_length + 0)-1 downto 0);
  signal out_buffer_read_req: std_logic;
  signal out_buffer_read_ack: std_logic;
  signal out_buffer_write_req_symbol: Boolean;
  signal out_buffer_write_ack_symbol: Boolean;
  signal default_zero_sig: std_logic;
  signal tag_ub_out, tag_ilock_out: std_logic_vector(tag_length-1 downto 0);
  signal tag_push_req, tag_push_ack, tag_pop_req, tag_pop_ack: std_logic;
  signal tag_unload_req_symbol, tag_unload_ack_symbol, tag_write_req_symbol, tag_write_ack_symbol: Boolean;
  signal tag_ilock_write_req_symbol, tag_ilock_write_ack_symbol, tag_ilock_read_req_symbol, tag_ilock_read_ack_symbol: Boolean;
  signal start_req_sig, fin_req_sig, start_ack_sig, fin_ack_sig: std_logic; 
  signal input_sample_reenable_symbol: Boolean;
  -- input port buffer signals
  -- output port buffer signals
  signal vector_control_daemon_CP_4324_start: Boolean;
  signal vector_control_daemon_CP_4324_symbol: Boolean;
  -- links between control-path and data-path
  signal SGT_f32_u1_1369_inst_req_0 : boolean;
  signal SLT_f64_u1_1306_inst_ack_0 : boolean;
  signal SGT_f32_u1_1369_inst_ack_0 : boolean;
  signal SGT_f32_u1_1369_inst_req_1 : boolean;
  signal SGT_f32_u1_1369_inst_ack_1 : boolean;
  signal if_stmt_1371_branch_req_0 : boolean;
  signal SLT_f64_u1_1306_inst_req_0 : boolean;
  signal if_stmt_1358_branch_ack_0 : boolean;
  signal if_stmt_1358_branch_ack_1 : boolean;
  signal if_stmt_1358_branch_req_0 : boolean;
  signal SLT_f32_u1_1356_inst_ack_1 : boolean;
  signal SLT_f32_u1_1356_inst_req_1 : boolean;
  signal SLT_f32_u1_1356_inst_ack_0 : boolean;
  signal SLT_f32_u1_1356_inst_req_0 : boolean;
  signal ADD_f32_f32_1350_inst_ack_1 : boolean;
  signal ADD_f32_f32_1350_inst_req_1 : boolean;
  signal ADD_f32_f32_1350_inst_ack_0 : boolean;
  signal ADD_f32_f32_1350_inst_req_0 : boolean;
  signal MUL_f32_f32_1345_inst_ack_1 : boolean;
  signal MUL_f32_f32_1345_inst_req_1 : boolean;
  signal MUL_f32_f32_1345_inst_ack_0 : boolean;
  signal MUL_f32_f32_1345_inst_req_0 : boolean;
  signal if_stmt_1321_branch_ack_0 : boolean;
  signal if_stmt_1321_branch_ack_1 : boolean;
  signal if_stmt_1321_branch_req_0 : boolean;
  signal SGT_f64_u1_1319_inst_ack_1 : boolean;
  signal SGT_f64_u1_1319_inst_req_1 : boolean;
  signal SGT_f64_u1_1319_inst_ack_0 : boolean;
  signal SGT_f64_u1_1319_inst_req_0 : boolean;
  signal if_stmt_1308_branch_ack_0 : boolean;
  signal if_stmt_1308_branch_ack_1 : boolean;
  signal if_stmt_1308_branch_req_0 : boolean;
  signal RPIPE_in_data1_1213_inst_req_0 : boolean;
  signal RPIPE_in_data1_1213_inst_ack_0 : boolean;
  signal RPIPE_in_data1_1213_inst_req_1 : boolean;
  signal RPIPE_in_data1_1213_inst_ack_1 : boolean;
  signal SLT_f64_u1_1306_inst_ack_1 : boolean;
  signal SLT_f64_u1_1306_inst_req_1 : boolean;
  signal RPIPE_in_data2_1216_inst_req_0 : boolean;
  signal RPIPE_in_data2_1216_inst_ack_0 : boolean;
  signal RPIPE_in_data2_1216_inst_req_1 : boolean;
  signal RPIPE_in_data2_1216_inst_ack_1 : boolean;
  signal type_cast_1628_inst_ack_1 : boolean;
  signal RPIPE_in_data3_1219_inst_req_0 : boolean;
  signal RPIPE_in_data3_1219_inst_ack_0 : boolean;
  signal RPIPE_in_data3_1219_inst_req_1 : boolean;
  signal RPIPE_in_data3_1219_inst_ack_1 : boolean;
  signal type_cast_1628_inst_ack_0 : boolean;
  signal AND_u64_u64_1624_inst_req_0 : boolean;
  signal RPIPE_in_data4_1222_inst_req_0 : boolean;
  signal RPIPE_in_data4_1222_inst_ack_0 : boolean;
  signal RPIPE_in_data4_1222_inst_req_1 : boolean;
  signal RPIPE_in_data4_1222_inst_ack_1 : boolean;
  signal AND_u64_u64_1624_inst_ack_0 : boolean;
  signal RPIPE_in_data5_1225_inst_req_0 : boolean;
  signal RPIPE_in_data5_1225_inst_ack_0 : boolean;
  signal RPIPE_in_data5_1225_inst_req_1 : boolean;
  signal RPIPE_in_data5_1225_inst_ack_1 : boolean;
  signal MUL_f64_f64_1645_inst_req_1 : boolean;
  signal MUL_f64_f64_1645_inst_ack_1 : boolean;
  signal SLT_f32_u1_1230_inst_req_0 : boolean;
  signal SLT_f32_u1_1230_inst_ack_0 : boolean;
  signal SLT_f32_u1_1230_inst_req_1 : boolean;
  signal SLT_f32_u1_1230_inst_ack_1 : boolean;
  signal MUL_f64_f64_1645_inst_req_0 : boolean;
  signal if_stmt_1232_branch_req_0 : boolean;
  signal AND_u64_u64_1624_inst_req_1 : boolean;
  signal if_stmt_1232_branch_ack_1 : boolean;
  signal if_stmt_1232_branch_ack_0 : boolean;
  signal SUB_f64_f64_1640_inst_req_0 : boolean;
  signal ADD_f32_f32_1243_inst_req_0 : boolean;
  signal ADD_f32_f32_1243_inst_ack_0 : boolean;
  signal SUB_f64_f64_1640_inst_ack_0 : boolean;
  signal ADD_f32_f32_1243_inst_req_1 : boolean;
  signal ADD_f32_f32_1243_inst_ack_1 : boolean;
  signal type_cast_1628_inst_req_0 : boolean;
  signal type_cast_1628_inst_req_1 : boolean;
  signal SUB_f64_f64_1640_inst_req_1 : boolean;
  signal SGT_f32_u1_1250_inst_req_0 : boolean;
  signal SGT_f32_u1_1250_inst_ack_0 : boolean;
  signal SUB_f64_f64_1640_inst_ack_1 : boolean;
  signal SGT_f32_u1_1250_inst_req_1 : boolean;
  signal SGT_f32_u1_1250_inst_ack_1 : boolean;
  signal AND_u64_u64_1624_inst_ack_1 : boolean;
  signal if_stmt_1252_branch_req_0 : boolean;
  signal if_stmt_1252_branch_ack_1 : boolean;
  signal if_stmt_1252_branch_ack_0 : boolean;
  signal ADD_f32_f32_1263_inst_req_0 : boolean;
  signal ADD_f32_f32_1263_inst_ack_0 : boolean;
  signal ADD_f32_f32_1263_inst_req_1 : boolean;
  signal ADD_f32_f32_1263_inst_ack_1 : boolean;
  signal SUB_f32_f32_1279_inst_req_0 : boolean;
  signal SUB_f32_f32_1279_inst_ack_0 : boolean;
  signal SUB_f32_f32_1279_inst_req_1 : boolean;
  signal SUB_f32_f32_1279_inst_ack_1 : boolean;
  signal MUL_f32_f32_1285_inst_req_0 : boolean;
  signal MUL_f32_f32_1285_inst_ack_0 : boolean;
  signal MUL_f32_f32_1285_inst_req_1 : boolean;
  signal MUL_f32_f32_1285_inst_ack_1 : boolean;
  signal ADD_f32_f32_1290_inst_req_0 : boolean;
  signal ADD_f32_f32_1290_inst_ack_0 : boolean;
  signal ADD_f32_f32_1290_inst_req_1 : boolean;
  signal ADD_f32_f32_1290_inst_ack_1 : boolean;
  signal MUL_f32_f32_1296_inst_req_0 : boolean;
  signal MUL_f32_f32_1296_inst_ack_0 : boolean;
  signal MUL_f32_f32_1296_inst_req_1 : boolean;
  signal MUL_f32_f32_1296_inst_ack_1 : boolean;
  signal type_cast_1300_inst_req_0 : boolean;
  signal type_cast_1300_inst_ack_0 : boolean;
  signal type_cast_1300_inst_req_1 : boolean;
  signal type_cast_1300_inst_ack_1 : boolean;
  signal if_stmt_1371_branch_ack_1 : boolean;
  signal if_stmt_1371_branch_ack_0 : boolean;
  signal MUL_f32_f32_1382_inst_req_0 : boolean;
  signal MUL_f32_f32_1382_inst_ack_0 : boolean;
  signal MUL_f32_f32_1382_inst_req_1 : boolean;
  signal MUL_f32_f32_1382_inst_ack_1 : boolean;
  signal type_cast_1386_inst_req_0 : boolean;
  signal type_cast_1386_inst_ack_0 : boolean;
  signal type_cast_1386_inst_req_1 : boolean;
  signal type_cast_1386_inst_ack_1 : boolean;
  signal type_cast_1390_inst_req_0 : boolean;
  signal type_cast_1390_inst_ack_0 : boolean;
  signal type_cast_1390_inst_req_1 : boolean;
  signal type_cast_1390_inst_ack_1 : boolean;
  signal type_cast_1407_inst_req_0 : boolean;
  signal type_cast_1407_inst_ack_0 : boolean;
  signal type_cast_1407_inst_req_1 : boolean;
  signal type_cast_1407_inst_ack_1 : boolean;
  signal SGT_f64_u1_1413_inst_req_0 : boolean;
  signal SGT_f64_u1_1413_inst_ack_0 : boolean;
  signal SGT_f64_u1_1413_inst_req_1 : boolean;
  signal SGT_f64_u1_1413_inst_ack_1 : boolean;
  signal if_stmt_1415_branch_req_0 : boolean;
  signal if_stmt_1415_branch_ack_1 : boolean;
  signal if_stmt_1415_branch_ack_0 : boolean;
  signal SGT_f64_u1_1426_inst_req_0 : boolean;
  signal SGT_f64_u1_1426_inst_ack_0 : boolean;
  signal SGT_f64_u1_1426_inst_req_1 : boolean;
  signal SGT_f64_u1_1426_inst_ack_1 : boolean;
  signal if_stmt_1428_branch_req_0 : boolean;
  signal if_stmt_1428_branch_ack_1 : boolean;
  signal if_stmt_1428_branch_ack_0 : boolean;
  signal MUL_f32_f32_1439_inst_req_0 : boolean;
  signal MUL_f32_f32_1439_inst_ack_0 : boolean;
  signal MUL_f32_f32_1439_inst_req_1 : boolean;
  signal MUL_f32_f32_1439_inst_ack_1 : boolean;
  signal ADD_f32_f32_1445_inst_req_0 : boolean;
  signal ADD_f32_f32_1445_inst_ack_0 : boolean;
  signal ADD_f32_f32_1445_inst_req_1 : boolean;
  signal ADD_f32_f32_1445_inst_ack_1 : boolean;
  signal MUL_f32_f32_1451_inst_req_0 : boolean;
  signal MUL_f32_f32_1451_inst_ack_0 : boolean;
  signal MUL_f32_f32_1451_inst_req_1 : boolean;
  signal MUL_f32_f32_1451_inst_ack_1 : boolean;
  signal SGT_f64_u1_1459_inst_req_0 : boolean;
  signal SGT_f64_u1_1459_inst_ack_0 : boolean;
  signal SGT_f64_u1_1459_inst_req_1 : boolean;
  signal SGT_f64_u1_1459_inst_ack_1 : boolean;
  signal if_stmt_1461_branch_req_0 : boolean;
  signal if_stmt_1461_branch_ack_1 : boolean;
  signal if_stmt_1461_branch_ack_0 : boolean;
  signal MUL_f32_f32_1472_inst_req_0 : boolean;
  signal MUL_f32_f32_1472_inst_ack_0 : boolean;
  signal MUL_f32_f32_1472_inst_req_1 : boolean;
  signal MUL_f32_f32_1472_inst_ack_1 : boolean;
  signal ADD_f32_f32_1858_inst_ack_0 : boolean;
  signal MUL_f64_f64_1634_inst_ack_1 : boolean;
  signal MUL_f64_f64_1634_inst_req_1 : boolean;
  signal type_cast_1888_inst_ack_1 : boolean;
  signal ADD_f32_f32_1478_inst_req_0 : boolean;
  signal ADD_f32_f32_1478_inst_ack_0 : boolean;
  signal ADD_f32_f32_1478_inst_req_1 : boolean;
  signal ADD_f32_f32_1478_inst_ack_1 : boolean;
  signal MUL_f64_f64_1634_inst_ack_0 : boolean;
  signal MUL_f64_f64_1634_inst_req_0 : boolean;
  signal MUL_f32_f32_1484_inst_req_0 : boolean;
  signal MUL_f32_f32_1484_inst_ack_0 : boolean;
  signal MUL_f32_f32_1484_inst_req_1 : boolean;
  signal MUL_f32_f32_1484_inst_ack_1 : boolean;
  signal MUL_f64_f64_1645_inst_ack_0 : boolean;
  signal MUL_f32_f32_1492_inst_req_0 : boolean;
  signal MUL_f32_f32_1492_inst_ack_0 : boolean;
  signal MUL_f32_f32_1492_inst_req_1 : boolean;
  signal MUL_f32_f32_1492_inst_ack_1 : boolean;
  signal ADD_f32_f32_1498_inst_req_0 : boolean;
  signal ADD_f32_f32_1498_inst_ack_0 : boolean;
  signal ADD_f32_f32_1498_inst_req_1 : boolean;
  signal ADD_f32_f32_1498_inst_ack_1 : boolean;
  signal if_stmt_1866_branch_req_0 : boolean;
  signal MUL_f32_f32_1504_inst_req_0 : boolean;
  signal MUL_f32_f32_1504_inst_ack_0 : boolean;
  signal MUL_f32_f32_1504_inst_req_1 : boolean;
  signal MUL_f32_f32_1504_inst_ack_1 : boolean;
  signal if_stmt_1866_branch_ack_1 : boolean;
  signal SGT_f32_u1_1877_inst_req_0 : boolean;
  signal ADD_f32_f32_1523_inst_req_0 : boolean;
  signal ADD_f32_f32_1523_inst_ack_0 : boolean;
  signal ADD_f32_f32_1523_inst_req_1 : boolean;
  signal ADD_f32_f32_1523_inst_ack_1 : boolean;
  signal MUL_f32_f32_1529_inst_req_0 : boolean;
  signal MUL_f32_f32_1529_inst_ack_0 : boolean;
  signal MUL_f32_f32_1529_inst_req_1 : boolean;
  signal MUL_f32_f32_1529_inst_ack_1 : boolean;
  signal if_stmt_1866_branch_ack_0 : boolean;
  signal ADD_f32_f32_1534_inst_req_0 : boolean;
  signal ADD_f32_f32_1534_inst_ack_0 : boolean;
  signal ADD_f32_f32_1534_inst_req_1 : boolean;
  signal ADD_f32_f32_1534_inst_ack_1 : boolean;
  signal ADD_f32_f32_1858_inst_req_1 : boolean;
  signal SGT_f32_u1_1877_inst_ack_0 : boolean;
  signal MUL_f32_f32_1540_inst_req_0 : boolean;
  signal MUL_f32_f32_1540_inst_ack_0 : boolean;
  signal MUL_f32_f32_1540_inst_req_1 : boolean;
  signal MUL_f32_f32_1540_inst_ack_1 : boolean;
  signal type_cast_1544_inst_req_0 : boolean;
  signal type_cast_1544_inst_ack_0 : boolean;
  signal type_cast_1544_inst_req_1 : boolean;
  signal type_cast_1544_inst_ack_1 : boolean;
  signal ADD_f32_f32_1858_inst_ack_1 : boolean;
  signal SGT_f32_u1_1877_inst_req_1 : boolean;
  signal type_cast_1548_inst_req_0 : boolean;
  signal type_cast_1548_inst_ack_0 : boolean;
  signal type_cast_1548_inst_req_1 : boolean;
  signal type_cast_1548_inst_ack_1 : boolean;
  signal AND_u64_u64_1554_inst_req_0 : boolean;
  signal AND_u64_u64_1554_inst_ack_0 : boolean;
  signal AND_u64_u64_1554_inst_req_1 : boolean;
  signal AND_u64_u64_1554_inst_ack_1 : boolean;
  signal type_cast_1892_inst_ack_0 : boolean;
  signal ADD_f32_f32_1858_inst_req_0 : boolean;
  signal AND_u64_u64_1560_inst_req_0 : boolean;
  signal AND_u64_u64_1560_inst_ack_0 : boolean;
  signal AND_u64_u64_1560_inst_req_1 : boolean;
  signal AND_u64_u64_1560_inst_ack_1 : boolean;
  signal type_cast_1892_inst_req_0 : boolean;
  signal EQ_u64_u1_1566_inst_req_0 : boolean;
  signal EQ_u64_u1_1566_inst_ack_0 : boolean;
  signal EQ_u64_u1_1566_inst_req_1 : boolean;
  signal EQ_u64_u1_1566_inst_ack_1 : boolean;
  signal if_stmt_1568_branch_req_0 : boolean;
  signal if_stmt_1568_branch_ack_1 : boolean;
  signal if_stmt_1568_branch_ack_0 : boolean;
  signal AND_u64_u64_1579_inst_req_0 : boolean;
  signal AND_u64_u64_1579_inst_ack_0 : boolean;
  signal AND_u64_u64_1579_inst_req_1 : boolean;
  signal AND_u64_u64_1579_inst_ack_1 : boolean;
  signal AND_u64_u64_1585_inst_req_0 : boolean;
  signal AND_u64_u64_1585_inst_ack_0 : boolean;
  signal AND_u64_u64_1585_inst_req_1 : boolean;
  signal AND_u64_u64_1585_inst_ack_1 : boolean;
  signal SUB_u64_u64_1591_inst_req_0 : boolean;
  signal SUB_u64_u64_1591_inst_ack_0 : boolean;
  signal SUB_u64_u64_1591_inst_req_1 : boolean;
  signal SUB_u64_u64_1591_inst_ack_1 : boolean;
  signal ADD_u64_u64_1596_inst_req_0 : boolean;
  signal ADD_u64_u64_1596_inst_ack_0 : boolean;
  signal ADD_u64_u64_1596_inst_req_1 : boolean;
  signal ADD_u64_u64_1596_inst_ack_1 : boolean;
  signal AND_u64_u64_1602_inst_req_0 : boolean;
  signal AND_u64_u64_1602_inst_ack_0 : boolean;
  signal AND_u64_u64_1602_inst_req_1 : boolean;
  signal AND_u64_u64_1602_inst_ack_1 : boolean;
  signal OR_u64_u64_1618_inst_req_0 : boolean;
  signal OR_u64_u64_1618_inst_ack_0 : boolean;
  signal OR_u64_u64_1618_inst_req_1 : boolean;
  signal OR_u64_u64_1618_inst_ack_1 : boolean;
  signal SUB_f64_f64_1651_inst_req_0 : boolean;
  signal SUB_f64_f64_1651_inst_ack_0 : boolean;
  signal SUB_f64_f64_1651_inst_req_1 : boolean;
  signal SUB_f64_f64_1651_inst_ack_1 : boolean;
  signal MUL_f64_f64_1656_inst_req_0 : boolean;
  signal MUL_f64_f64_1656_inst_ack_0 : boolean;
  signal MUL_f64_f64_1656_inst_req_1 : boolean;
  signal MUL_f64_f64_1656_inst_ack_1 : boolean;
  signal MUL_f64_f64_1661_inst_req_0 : boolean;
  signal MUL_f64_f64_1661_inst_ack_0 : boolean;
  signal MUL_f64_f64_1661_inst_req_1 : boolean;
  signal MUL_f64_f64_1661_inst_ack_1 : boolean;
  signal SUB_f64_f64_1667_inst_req_0 : boolean;
  signal SUB_f64_f64_1667_inst_ack_0 : boolean;
  signal SUB_f64_f64_1667_inst_req_1 : boolean;
  signal SUB_f64_f64_1667_inst_ack_1 : boolean;
  signal MUL_f64_f64_1672_inst_req_0 : boolean;
  signal MUL_f64_f64_1672_inst_ack_0 : boolean;
  signal MUL_f64_f64_1672_inst_req_1 : boolean;
  signal MUL_f64_f64_1672_inst_ack_1 : boolean;
  signal MUL_f64_f64_1677_inst_req_0 : boolean;
  signal MUL_f64_f64_1677_inst_ack_0 : boolean;
  signal MUL_f64_f64_1677_inst_req_1 : boolean;
  signal MUL_f64_f64_1677_inst_ack_1 : boolean;
  signal SUB_f64_f64_1683_inst_req_0 : boolean;
  signal SUB_f64_f64_1683_inst_ack_0 : boolean;
  signal SUB_f64_f64_1683_inst_req_1 : boolean;
  signal SUB_f64_f64_1683_inst_ack_1 : boolean;
  signal MUL_f64_f64_1688_inst_req_0 : boolean;
  signal MUL_f64_f64_1688_inst_ack_0 : boolean;
  signal MUL_f64_f64_1688_inst_req_1 : boolean;
  signal MUL_f64_f64_1688_inst_ack_1 : boolean;
  signal EQ_u64_u1_1694_inst_req_0 : boolean;
  signal EQ_u64_u1_1694_inst_ack_0 : boolean;
  signal EQ_u64_u1_1694_inst_req_1 : boolean;
  signal EQ_u64_u1_1694_inst_ack_1 : boolean;
  signal OR_u1_u1_1699_inst_req_0 : boolean;
  signal OR_u1_u1_1699_inst_ack_0 : boolean;
  signal OR_u1_u1_1699_inst_req_1 : boolean;
  signal OR_u1_u1_1699_inst_ack_1 : boolean;
  signal if_stmt_1701_branch_req_0 : boolean;
  signal if_stmt_1701_branch_ack_1 : boolean;
  signal if_stmt_1701_branch_ack_0 : boolean;
  signal MUL_f64_f64_1711_inst_req_0 : boolean;
  signal MUL_f64_f64_1711_inst_ack_0 : boolean;
  signal MUL_f64_f64_1711_inst_req_1 : boolean;
  signal MUL_f64_f64_1711_inst_ack_1 : boolean;
  signal AND_u64_u64_1717_inst_req_0 : boolean;
  signal AND_u64_u64_1717_inst_ack_0 : boolean;
  signal AND_u64_u64_1717_inst_req_1 : boolean;
  signal AND_u64_u64_1717_inst_ack_1 : boolean;
  signal SUB_f64_f64_1723_inst_req_0 : boolean;
  signal SUB_f64_f64_1723_inst_ack_0 : boolean;
  signal SUB_f64_f64_1723_inst_req_1 : boolean;
  signal SUB_f64_f64_1723_inst_ack_1 : boolean;
  signal OR_u64_u64_1728_inst_req_0 : boolean;
  signal OR_u64_u64_1728_inst_ack_0 : boolean;
  signal OR_u64_u64_1728_inst_req_1 : boolean;
  signal OR_u64_u64_1728_inst_ack_1 : boolean;
  signal type_cast_1888_inst_req_1 : boolean;
  signal SLT_f32_u1_1864_inst_ack_1 : boolean;
  signal if_stmt_1879_branch_ack_0 : boolean;
  signal type_cast_1888_inst_ack_0 : boolean;
  signal SLT_f32_u1_1864_inst_req_1 : boolean;
  signal MUL_f64_f64_1733_inst_req_0 : boolean;
  signal MUL_f64_f64_1733_inst_ack_0 : boolean;
  signal MUL_f64_f64_1733_inst_req_1 : boolean;
  signal MUL_f64_f64_1733_inst_ack_1 : boolean;
  signal if_stmt_1879_branch_ack_1 : boolean;
  signal SLT_f32_u1_1864_inst_ack_0 : boolean;
  signal type_cast_1888_inst_req_0 : boolean;
  signal SLT_f32_u1_1864_inst_req_0 : boolean;
  signal type_cast_1737_inst_req_0 : boolean;
  signal type_cast_1737_inst_ack_0 : boolean;
  signal type_cast_1737_inst_req_1 : boolean;
  signal type_cast_1737_inst_ack_1 : boolean;
  signal if_stmt_1879_branch_req_0 : boolean;
  signal type_cast_1892_inst_ack_1 : boolean;
  signal type_cast_1892_inst_req_1 : boolean;
  signal MUL_f64_f64_1742_inst_req_0 : boolean;
  signal MUL_f64_f64_1742_inst_ack_0 : boolean;
  signal MUL_f64_f64_1742_inst_req_1 : boolean;
  signal MUL_f64_f64_1742_inst_ack_1 : boolean;
  signal type_cast_1746_inst_req_0 : boolean;
  signal type_cast_1746_inst_ack_0 : boolean;
  signal type_cast_1746_inst_req_1 : boolean;
  signal type_cast_1746_inst_ack_1 : boolean;
  signal SGT_f32_u1_1877_inst_ack_1 : boolean;
  signal phi_stmt_1394_req_1 : boolean;
  signal AND_u64_u64_1752_inst_req_0 : boolean;
  signal AND_u64_u64_1752_inst_ack_0 : boolean;
  signal AND_u64_u64_1752_inst_req_1 : boolean;
  signal AND_u64_u64_1752_inst_ack_1 : boolean;
  signal XOR_u64_u64_1767_inst_req_0 : boolean;
  signal XOR_u64_u64_1767_inst_ack_0 : boolean;
  signal XOR_u64_u64_1767_inst_req_1 : boolean;
  signal XOR_u64_u64_1767_inst_ack_1 : boolean;
  signal AND_u64_u64_1773_inst_req_0 : boolean;
  signal AND_u64_u64_1773_inst_ack_0 : boolean;
  signal AND_u64_u64_1773_inst_req_1 : boolean;
  signal AND_u64_u64_1773_inst_ack_1 : boolean;
  signal phi_stmt_1394_req_2 : boolean;
  signal OR_u64_u64_1778_inst_req_0 : boolean;
  signal OR_u64_u64_1778_inst_ack_0 : boolean;
  signal OR_u64_u64_1778_inst_req_1 : boolean;
  signal OR_u64_u64_1778_inst_ack_1 : boolean;
  signal type_cast_1782_inst_req_0 : boolean;
  signal type_cast_1782_inst_ack_0 : boolean;
  signal type_cast_1782_inst_req_1 : boolean;
  signal type_cast_1782_inst_ack_1 : boolean;
  signal type_cast_1786_inst_req_0 : boolean;
  signal type_cast_1786_inst_ack_0 : boolean;
  signal type_cast_1786_inst_req_1 : boolean;
  signal type_cast_1786_inst_ack_1 : boolean;
  signal phi_stmt_1394_ack_0 : boolean;
  signal SUB_f32_f32_1791_inst_req_0 : boolean;
  signal SUB_f32_f32_1791_inst_ack_0 : boolean;
  signal SUB_f32_f32_1791_inst_req_1 : boolean;
  signal SUB_f32_f32_1791_inst_ack_1 : boolean;
  signal MUL_f32_f32_1797_inst_req_0 : boolean;
  signal MUL_f32_f32_1797_inst_ack_0 : boolean;
  signal MUL_f32_f32_1797_inst_req_1 : boolean;
  signal MUL_f32_f32_1797_inst_ack_1 : boolean;
  signal ADD_f32_f32_1802_inst_req_0 : boolean;
  signal ADD_f32_f32_1802_inst_ack_0 : boolean;
  signal ADD_f32_f32_1802_inst_req_1 : boolean;
  signal ADD_f32_f32_1802_inst_ack_1 : boolean;
  signal MUL_f32_f32_1808_inst_req_0 : boolean;
  signal MUL_f32_f32_1808_inst_ack_0 : boolean;
  signal MUL_f32_f32_1808_inst_req_1 : boolean;
  signal MUL_f32_f32_1808_inst_ack_1 : boolean;
  signal SLT_f32_u1_1814_inst_req_0 : boolean;
  signal SLT_f32_u1_1814_inst_ack_0 : boolean;
  signal SLT_f32_u1_1814_inst_req_1 : boolean;
  signal SLT_f32_u1_1814_inst_ack_1 : boolean;
  signal if_stmt_1816_branch_req_0 : boolean;
  signal if_stmt_1816_branch_ack_1 : boolean;
  signal if_stmt_1816_branch_ack_0 : boolean;
  signal SGT_f32_u1_1827_inst_req_0 : boolean;
  signal SGT_f32_u1_1827_inst_ack_0 : boolean;
  signal SGT_f32_u1_1827_inst_req_1 : boolean;
  signal SGT_f32_u1_1827_inst_ack_1 : boolean;
  signal if_stmt_1829_branch_req_0 : boolean;
  signal if_stmt_1829_branch_ack_1 : boolean;
  signal if_stmt_1829_branch_ack_0 : boolean;
  signal MUL_f32_f32_1853_inst_req_0 : boolean;
  signal MUL_f32_f32_1853_inst_ack_0 : boolean;
  signal MUL_f32_f32_1853_inst_req_1 : boolean;
  signal MUL_f32_f32_1853_inst_ack_1 : boolean;
  signal AND_u64_u64_1898_inst_req_0 : boolean;
  signal AND_u64_u64_1898_inst_ack_0 : boolean;
  signal AND_u64_u64_1898_inst_req_1 : boolean;
  signal AND_u64_u64_1898_inst_ack_1 : boolean;
  signal EQ_u64_u1_1904_inst_req_0 : boolean;
  signal EQ_u64_u1_1904_inst_ack_0 : boolean;
  signal EQ_u64_u1_1904_inst_req_1 : boolean;
  signal EQ_u64_u1_1904_inst_ack_1 : boolean;
  signal if_stmt_1906_branch_req_0 : boolean;
  signal if_stmt_1906_branch_ack_1 : boolean;
  signal if_stmt_1906_branch_ack_0 : boolean;
  signal AND_u64_u64_1928_inst_req_0 : boolean;
  signal AND_u64_u64_1928_inst_ack_0 : boolean;
  signal AND_u64_u64_1928_inst_req_1 : boolean;
  signal AND_u64_u64_1928_inst_ack_1 : boolean;
  signal type_cast_1932_inst_req_0 : boolean;
  signal type_cast_1932_inst_ack_0 : boolean;
  signal type_cast_1932_inst_req_1 : boolean;
  signal type_cast_1932_inst_ack_1 : boolean;
  signal MUL_f64_f64_1938_inst_req_0 : boolean;
  signal MUL_f64_f64_1938_inst_ack_0 : boolean;
  signal MUL_f64_f64_1938_inst_req_1 : boolean;
  signal MUL_f64_f64_1938_inst_ack_1 : boolean;
  signal type_cast_1942_inst_req_0 : boolean;
  signal type_cast_1942_inst_ack_0 : boolean;
  signal type_cast_1942_inst_req_1 : boolean;
  signal type_cast_1942_inst_ack_1 : boolean;
  signal AND_u64_u64_1948_inst_req_0 : boolean;
  signal AND_u64_u64_1948_inst_ack_0 : boolean;
  signal AND_u64_u64_1948_inst_req_1 : boolean;
  signal AND_u64_u64_1948_inst_ack_1 : boolean;
  signal AND_u64_u64_1970_inst_req_0 : boolean;
  signal AND_u64_u64_1970_inst_ack_0 : boolean;
  signal AND_u64_u64_1970_inst_req_1 : boolean;
  signal AND_u64_u64_1970_inst_ack_1 : boolean;
  signal OR_u64_u64_1975_inst_req_0 : boolean;
  signal OR_u64_u64_1975_inst_ack_0 : boolean;
  signal OR_u64_u64_1975_inst_req_1 : boolean;
  signal OR_u64_u64_1975_inst_ack_1 : boolean;
  signal type_cast_1979_inst_req_0 : boolean;
  signal type_cast_1979_inst_ack_0 : boolean;
  signal type_cast_1979_inst_req_1 : boolean;
  signal type_cast_1979_inst_ack_1 : boolean;
  signal type_cast_1983_inst_req_0 : boolean;
  signal type_cast_1983_inst_ack_0 : boolean;
  signal type_cast_1983_inst_req_1 : boolean;
  signal type_cast_1983_inst_ack_1 : boolean;
  signal WPIPE_out_data1_1985_inst_req_0 : boolean;
  signal WPIPE_out_data1_1985_inst_ack_0 : boolean;
  signal WPIPE_out_data1_1985_inst_req_1 : boolean;
  signal WPIPE_out_data1_1985_inst_ack_1 : boolean;
  signal WPIPE_out_data2_1988_inst_req_0 : boolean;
  signal WPIPE_out_data2_1988_inst_ack_0 : boolean;
  signal WPIPE_out_data2_1988_inst_req_1 : boolean;
  signal WPIPE_out_data2_1988_inst_ack_1 : boolean;
  signal WPIPE_out_data3_1991_inst_req_0 : boolean;
  signal WPIPE_out_data3_1991_inst_ack_0 : boolean;
  signal WPIPE_out_data3_1991_inst_req_1 : boolean;
  signal WPIPE_out_data3_1991_inst_ack_1 : boolean;
  signal WPIPE_out_data4_1994_inst_req_0 : boolean;
  signal WPIPE_out_data4_1994_inst_ack_0 : boolean;
  signal WPIPE_out_data4_1994_inst_req_1 : boolean;
  signal WPIPE_out_data4_1994_inst_ack_1 : boolean;
  signal MUL_f32_f32_2001_inst_req_0 : boolean;
  signal MUL_f32_f32_2001_inst_ack_0 : boolean;
  signal MUL_f32_f32_2001_inst_req_1 : boolean;
  signal MUL_f32_f32_2001_inst_ack_1 : boolean;
  signal MUL_f32_f32_2007_inst_req_0 : boolean;
  signal MUL_f32_f32_2007_inst_ack_0 : boolean;
  signal MUL_f32_f32_2007_inst_req_1 : boolean;
  signal MUL_f32_f32_2007_inst_ack_1 : boolean;
  signal MUL_f32_f32_2013_inst_req_0 : boolean;
  signal MUL_f32_f32_2013_inst_ack_0 : boolean;
  signal MUL_f32_f32_2013_inst_req_1 : boolean;
  signal MUL_f32_f32_2013_inst_ack_1 : boolean;
  signal phi_stmt_1394_req_0 : boolean;
  signal type_cast_1397_inst_ack_1 : boolean;
  signal type_cast_1397_inst_req_1 : boolean;
  signal phi_stmt_1330_req_1 : boolean;
  signal phi_stmt_1169_req_0 : boolean;
  signal type_cast_1397_inst_ack_0 : boolean;
  signal type_cast_1397_inst_req_0 : boolean;
  signal phi_stmt_1176_req_0 : boolean;
  signal phi_stmt_1183_req_0 : boolean;
  signal phi_stmt_1190_req_0 : boolean;
  signal phi_stmt_1197_req_0 : boolean;
  signal phi_stmt_1204_req_0 : boolean;
  signal type_cast_1175_inst_req_0 : boolean;
  signal type_cast_1175_inst_ack_0 : boolean;
  signal phi_stmt_1330_ack_0 : boolean;
  signal type_cast_1175_inst_req_1 : boolean;
  signal type_cast_1175_inst_ack_1 : boolean;
  signal phi_stmt_1169_req_1 : boolean;
  signal phi_stmt_1330_req_0 : boolean;
  signal type_cast_1333_inst_ack_1 : boolean;
  signal type_cast_1182_inst_req_0 : boolean;
  signal type_cast_1182_inst_ack_0 : boolean;
  signal type_cast_1333_inst_req_1 : boolean;
  signal type_cast_1182_inst_req_1 : boolean;
  signal type_cast_1182_inst_ack_1 : boolean;
  signal phi_stmt_1176_req_1 : boolean;
  signal type_cast_1333_inst_ack_0 : boolean;
  signal type_cast_1333_inst_req_0 : boolean;
  signal type_cast_1189_inst_req_0 : boolean;
  signal type_cast_1189_inst_ack_0 : boolean;
  signal type_cast_1189_inst_req_1 : boolean;
  signal type_cast_1189_inst_ack_1 : boolean;
  signal phi_stmt_1183_req_1 : boolean;
  signal type_cast_1196_inst_req_0 : boolean;
  signal type_cast_1196_inst_ack_0 : boolean;
  signal type_cast_1196_inst_req_1 : boolean;
  signal type_cast_1196_inst_ack_1 : boolean;
  signal phi_stmt_1190_req_1 : boolean;
  signal type_cast_1203_inst_req_0 : boolean;
  signal type_cast_1203_inst_ack_0 : boolean;
  signal type_cast_1203_inst_req_1 : boolean;
  signal type_cast_1203_inst_ack_1 : boolean;
  signal phi_stmt_1197_req_1 : boolean;
  signal phi_stmt_1330_req_2 : boolean;
  signal type_cast_1210_inst_req_0 : boolean;
  signal type_cast_1210_inst_ack_0 : boolean;
  signal type_cast_1210_inst_req_1 : boolean;
  signal type_cast_1210_inst_ack_1 : boolean;
  signal phi_stmt_1204_req_1 : boolean;
  signal phi_stmt_1169_ack_0 : boolean;
  signal phi_stmt_1176_ack_0 : boolean;
  signal phi_stmt_1183_ack_0 : boolean;
  signal phi_stmt_1190_ack_0 : boolean;
  signal phi_stmt_1197_ack_0 : boolean;
  signal phi_stmt_1204_ack_0 : boolean;
  signal type_cast_1270_inst_req_0 : boolean;
  signal type_cast_1270_inst_ack_0 : boolean;
  signal type_cast_1270_inst_req_1 : boolean;
  signal type_cast_1270_inst_ack_1 : boolean;
  signal phi_stmt_1267_req_0 : boolean;
  signal type_cast_1274_inst_req_0 : boolean;
  signal type_cast_1274_inst_ack_0 : boolean;
  signal type_cast_1274_inst_req_1 : boolean;
  signal type_cast_1274_inst_ack_1 : boolean;
  signal phi_stmt_1267_req_2 : boolean;
  signal type_cast_1272_inst_req_0 : boolean;
  signal type_cast_1272_inst_ack_0 : boolean;
  signal type_cast_1272_inst_req_1 : boolean;
  signal type_cast_1272_inst_ack_1 : boolean;
  signal phi_stmt_1267_req_1 : boolean;
  signal phi_stmt_1267_ack_0 : boolean;
  signal phi_stmt_1508_req_3 : boolean;
  signal type_cast_1511_inst_req_0 : boolean;
  signal type_cast_1511_inst_ack_0 : boolean;
  signal type_cast_1511_inst_req_1 : boolean;
  signal type_cast_1511_inst_ack_1 : boolean;
  signal phi_stmt_1508_req_0 : boolean;
  signal type_cast_1513_inst_req_0 : boolean;
  signal type_cast_1513_inst_ack_0 : boolean;
  signal type_cast_1513_inst_req_1 : boolean;
  signal type_cast_1513_inst_ack_1 : boolean;
  signal phi_stmt_1508_req_1 : boolean;
  signal type_cast_1515_inst_req_0 : boolean;
  signal type_cast_1515_inst_ack_0 : boolean;
  signal type_cast_1515_inst_req_1 : boolean;
  signal type_cast_1515_inst_ack_1 : boolean;
  signal phi_stmt_1508_req_2 : boolean;
  signal phi_stmt_1508_ack_0 : boolean;
  signal phi_stmt_1606_req_1 : boolean;
  signal type_cast_1609_inst_req_0 : boolean;
  signal type_cast_1609_inst_ack_0 : boolean;
  signal type_cast_1609_inst_req_1 : boolean;
  signal type_cast_1609_inst_ack_1 : boolean;
  signal phi_stmt_1606_req_0 : boolean;
  signal phi_stmt_1606_ack_0 : boolean;
  signal phi_stmt_1756_req_1 : boolean;
  signal type_cast_1759_inst_req_0 : boolean;
  signal type_cast_1759_inst_ack_0 : boolean;
  signal type_cast_1759_inst_req_1 : boolean;
  signal type_cast_1759_inst_ack_1 : boolean;
  signal phi_stmt_1756_req_0 : boolean;
  signal phi_stmt_1756_ack_0 : boolean;
  signal phi_stmt_1838_req_2 : boolean;
  signal type_cast_1841_inst_req_0 : boolean;
  signal type_cast_1841_inst_ack_0 : boolean;
  signal type_cast_1841_inst_req_1 : boolean;
  signal type_cast_1841_inst_ack_1 : boolean;
  signal phi_stmt_1838_req_0 : boolean;
  signal phi_stmt_1838_req_1 : boolean;
  signal phi_stmt_1838_ack_0 : boolean;
  signal phi_stmt_1913_req_1 : boolean;
  signal phi_stmt_1913_req_2 : boolean;
  signal type_cast_1916_inst_req_0 : boolean;
  signal type_cast_1916_inst_ack_0 : boolean;
  signal type_cast_1916_inst_req_1 : boolean;
  signal type_cast_1916_inst_ack_1 : boolean;
  signal phi_stmt_1913_req_0 : boolean;
  signal phi_stmt_1913_ack_0 : boolean;
  signal type_cast_1957_inst_req_0 : boolean;
  signal type_cast_1957_inst_ack_0 : boolean;
  signal type_cast_1957_inst_req_1 : boolean;
  signal type_cast_1957_inst_ack_1 : boolean;
  signal phi_stmt_1952_req_1 : boolean;
  signal phi_stmt_1958_req_1 : boolean;
  signal type_cast_1955_inst_req_0 : boolean;
  signal type_cast_1955_inst_ack_0 : boolean;
  signal type_cast_1955_inst_req_1 : boolean;
  signal type_cast_1955_inst_ack_1 : boolean;
  signal phi_stmt_1952_req_0 : boolean;
  signal type_cast_1961_inst_req_0 : boolean;
  signal type_cast_1961_inst_ack_0 : boolean;
  signal type_cast_1961_inst_req_1 : boolean;
  signal type_cast_1961_inst_ack_1 : boolean;
  signal phi_stmt_1958_req_0 : boolean;
  signal phi_stmt_1952_ack_0 : boolean;
  signal phi_stmt_1958_ack_0 : boolean;
  -- 
begin --  
  -- input handling ------------------------------------------------
  in_buffer: UnloadBuffer -- 
    generic map(name => "vector_control_daemon_input_buffer", -- 
      buffer_size => 1,
      data_width => tag_length + 0) -- 
    port map(write_req => in_buffer_write_req, -- 
      write_ack => in_buffer_write_ack, 
      write_data => in_buffer_data_in,
      unload_req => in_buffer_unload_req_symbol, 
      unload_ack => in_buffer_unload_ack_symbol, 
      read_data => in_buffer_data_out,
      clk => clk, reset => reset); -- 
  in_buffer_data_in(tag_length-1 downto 0) <= tag_in;
  tag_ub_out <= in_buffer_data_out(tag_length-1 downto 0);
  in_buffer_write_req <= start_req;
  start_ack <= in_buffer_write_ack;
  in_buffer_unload_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 32) := "in_buffer_unload_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= in_buffer_unload_ack_symbol & input_sample_reenable_symbol;
    gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => in_buffer_unload_req_symbol, clk => clk, reset => reset); --
  end block;
  -- join of all unload_ack_symbols.. used to trigger CP.
  vector_control_daemon_CP_4324_start <= in_buffer_unload_ack_symbol;
  -- output handling  -------------------------------------------------------
  out_buffer: ReceiveBuffer -- 
    generic map(name => "vector_control_daemon_out_buffer", -- 
      buffer_size => 1,
      data_width => tag_length + 0, 
      kill_counter_range => 1) -- 
    port map(write_req => out_buffer_write_req_symbol, -- 
      write_ack => out_buffer_write_ack_symbol, 
      write_data => out_buffer_data_in,
      read_req => out_buffer_read_req, 
      read_ack => out_buffer_read_ack, 
      read_data => out_buffer_data_out,
      kill => default_zero_sig,
      clk => clk, reset => reset); -- 
  out_buffer_data_in(tag_length-1 downto 0) <= tag_ilock_out;
  tag_out <= out_buffer_data_out(tag_length-1 downto 0);
  out_buffer_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 0);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 1,2 => 0);
    constant joinName: string(1 to 32) := "out_buffer_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= vector_control_daemon_CP_4324_symbol & out_buffer_write_ack_symbol & tag_ilock_read_ack_symbol;
    gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => out_buffer_write_req_symbol, clk => clk, reset => reset); --
  end block;
  -- write-to output-buffer produces  reenable input sampling
  input_sample_reenable_symbol <= out_buffer_write_ack_symbol;
  -- fin-req/ack level protocol..
  out_buffer_read_req <= fin_req;
  fin_ack <= out_buffer_read_ack;
  ----- tag-queue --------------------------------------------------
  -- interlock buffer for TAG.. to provide required buffering.
  tagIlock: InterlockBuffer -- 
    generic map(name => "tag-interlock-buffer", -- 
      buffer_size => 1,
      in_data_width => tag_length,
      out_data_width => tag_length) -- 
    port map(write_req => tag_ilock_write_req_symbol, -- 
      write_ack => tag_ilock_write_ack_symbol, 
      write_data => tag_ub_out,
      read_req => tag_ilock_read_req_symbol, 
      read_ack => tag_ilock_read_ack_symbol, 
      read_data => tag_ilock_out, 
      clk => clk, reset => reset); -- 
  -- tag ilock-buffer control logic. 
  tag_ilock_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 31) := "tag_ilock_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= vector_control_daemon_CP_4324_start & tag_ilock_write_ack_symbol;
    gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_write_req_symbol, clk => clk, reset => reset); --
  end block;
  tag_ilock_read_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 1);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
    constant joinName: string(1 to 30) := "tag_ilock_read_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= vector_control_daemon_CP_4324_start & tag_ilock_read_ack_symbol & out_buffer_write_ack_symbol;
    gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_read_req_symbol, clk => clk, reset => reset); --
  end block;
  -- the control path --------------------------------------------------
  always_true_symbol <= true; 
  default_zero_sig <= '0';
  vector_control_daemon_CP_4324: Block -- control-path 
    signal cp_elements: BooleanArray(903 downto 0);
    -- 
  begin -- 
    cp_elements(0) <= vector_control_daemon_CP_4324_start;
    vector_control_daemon_CP_4324_symbol <= cp_elements(1);
    -- CP-element group 0 transition  place  bypass 
    -- predecessors 
    -- successors 601 
    -- members (4) 
      -- 	$entry
      -- 	branch_block_stmt_1166/$entry
      -- 	branch_block_stmt_1166/branch_block_stmt_1166__entry__
      -- 	branch_block_stmt_1166/bb_0_bb_1
      -- 
    -- CP-element group 1 transition  place  bypass 
    -- predecessors 
    -- successors 
    -- members (3) 
      -- 	$exit
      -- 	branch_block_stmt_1166/$exit
      -- 	branch_block_stmt_1166/branch_block_stmt_1166__exit__
      -- 
    cp_elements(1) <= false; 
    -- CP-element group 2 place  bypass 
    -- predecessors 673 
    -- successors 24 
    -- members (2) 
      -- 	branch_block_stmt_1166/merge_stmt_1168__exit__
      -- 	branch_block_stmt_1166/assign_stmt_1214__entry__
      -- 
    cp_elements(2) <= cp_elements(673);
    -- CP-element group 3 merge  place  bypass 
    -- predecessors 56 60 
    -- successors 63 
    -- members (2) 
      -- 	branch_block_stmt_1166/merge_stmt_1238__exit__
      -- 	branch_block_stmt_1166/assign_stmt_1244__entry__
      -- 
    cp_elements(3) <= OrReduce(cp_elements(56) & cp_elements(60));
    -- CP-element group 4 merge  place  bypass 
    -- predecessors 75 79 
    -- successors 82 
    -- members (2) 
      -- 	branch_block_stmt_1166/merge_stmt_1258__exit__
      -- 	branch_block_stmt_1166/assign_stmt_1264__entry__
      -- 
    cp_elements(4) <= OrReduce(cp_elements(75) & cp_elements(79));
    -- CP-element group 5 merge  place  bypass 
    -- predecessors 111 117 
    -- successors 118 
    -- members (2) 
      -- 	branch_block_stmt_1166/merge_stmt_1314__exit__
      -- 	branch_block_stmt_1166/assign_stmt_1320__entry__
      -- 
    cp_elements(5) <= OrReduce(cp_elements(111) & cp_elements(117));
    -- CP-element group 6 merge  fork  transition  place  bypass 
    -- predecessors 123 129 
    -- successors 728 730 
    -- members (7) 
      -- 	branch_block_stmt_1166/merge_stmt_1327__exit__
      -- 	branch_block_stmt_1166/bb_7_bb_8
      -- 	branch_block_stmt_1166/bb_7_bb_8_PhiReq/phi_stmt_1330/phi_stmt_1330_sources/type_cast_1333/SplitProtocol/$entry
      -- 	branch_block_stmt_1166/bb_7_bb_8_PhiReq/phi_stmt_1330/phi_stmt_1330_sources/type_cast_1333/$entry
      -- 	branch_block_stmt_1166/bb_7_bb_8_PhiReq/phi_stmt_1330/phi_stmt_1330_sources/$entry
      -- 	branch_block_stmt_1166/bb_7_bb_8_PhiReq/phi_stmt_1330/$entry
      -- 	branch_block_stmt_1166/bb_7_bb_8_PhiReq/$entry
      -- 
    cp_elements(6) <= OrReduce(cp_elements(123) & cp_elements(129));
    -- CP-element group 7 merge  place  bypass 
    -- predecessors 143 149 
    -- successors 150 
    -- members (2) 
      -- 	branch_block_stmt_1166/merge_stmt_1364__exit__
      -- 	branch_block_stmt_1166/assign_stmt_1370__entry__
      -- 
    cp_elements(7) <= OrReduce(cp_elements(143) & cp_elements(149));
    -- CP-element group 8 merge  place  bypass 
    -- predecessors 155 161 
    -- successors 162 
    -- members (2) 
      -- 	branch_block_stmt_1166/merge_stmt_1377__exit__
      -- 	branch_block_stmt_1166/assign_stmt_1383_to_assign_stmt_1391__entry__
      -- 
    cp_elements(8) <= OrReduce(cp_elements(155) & cp_elements(161));
    -- CP-element group 9 merge  place  bypass 
    -- predecessors 181 185 
    -- successors 188 
    -- members (2) 
      -- 	branch_block_stmt_1166/merge_stmt_1421__exit__
      -- 	branch_block_stmt_1166/assign_stmt_1427__entry__
      -- 
    cp_elements(9) <= OrReduce(cp_elements(181) & cp_elements(185));
    -- CP-element group 10 merge  place  bypass 
    -- predecessors 193 199 
    -- successors 200 
    -- members (2) 
      -- 	branch_block_stmt_1166/merge_stmt_1434__exit__
      -- 	branch_block_stmt_1166/assign_stmt_1440_to_assign_stmt_1452__entry__
      -- 
    cp_elements(10) <= OrReduce(cp_elements(193) & cp_elements(199));
    -- CP-element group 11 merge  place  bypass 
    -- predecessors 216 222 
    -- successors 223 
    -- members (2) 
      -- 	branch_block_stmt_1166/merge_stmt_1467__exit__
      -- 	branch_block_stmt_1166/assign_stmt_1473_to_assign_stmt_1485__entry__
      -- 
    cp_elements(11) <= OrReduce(cp_elements(216) & cp_elements(222));
    -- CP-element group 12 branch  place  bypass 
    -- predecessors 280 
    -- successors 281 282 
    -- members (2) 
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567__exit__
      -- 	branch_block_stmt_1166/if_stmt_1568__entry__
      -- 
    cp_elements(12) <= cp_elements(280);
    -- CP-element group 13 merge  place  bypass 
    -- predecessors 281 287 
    -- successors 288 
    -- members (2) 
      -- 	branch_block_stmt_1166/merge_stmt_1574__exit__
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603__entry__
      -- 
    cp_elements(13) <= OrReduce(cp_elements(281) & cp_elements(287));
    -- CP-element group 14 branch  place  bypass 
    -- predecessors 376 
    -- successors 377 378 
    -- members (2) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700__exit__
      -- 	branch_block_stmt_1166/if_stmt_1701__entry__
      -- 
    cp_elements(14) <= cp_elements(376);
    -- CP-element group 15 merge  place  bypass 
    -- predecessors 377 383 
    -- successors 384 
    -- members (2) 
      -- 	branch_block_stmt_1166/merge_stmt_1707__exit__
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753__entry__
      -- 
    cp_elements(15) <= OrReduce(cp_elements(377) & cp_elements(383));
    -- CP-element group 16 branch  place  bypass 
    -- predecessors 462 
    -- successors 463 464 
    -- members (2) 
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815__exit__
      -- 	branch_block_stmt_1166/if_stmt_1816__entry__
      -- 
    cp_elements(16) <= cp_elements(462);
    -- CP-element group 17 merge  place  bypass 
    -- predecessors 463 469 
    -- successors 470 
    -- members (2) 
      -- 	branch_block_stmt_1166/merge_stmt_1822__exit__
      -- 	branch_block_stmt_1166/assign_stmt_1828__entry__
      -- 
    cp_elements(17) <= OrReduce(cp_elements(463) & cp_elements(469));
    -- CP-element group 18 merge  fork  transition  place  bypass 
    -- predecessors 475 481 
    -- successors 836 838 
    -- members (7) 
      -- 	branch_block_stmt_1166/merge_stmt_1835__exit__
      -- 	branch_block_stmt_1166/bb_23_bb_24
      -- 	branch_block_stmt_1166/bb_23_bb_24_PhiReq/$entry
      -- 	branch_block_stmt_1166/bb_23_bb_24_PhiReq/phi_stmt_1838/$entry
      -- 	branch_block_stmt_1166/bb_23_bb_24_PhiReq/phi_stmt_1838/phi_stmt_1838_sources/$entry
      -- 	branch_block_stmt_1166/bb_23_bb_24_PhiReq/phi_stmt_1838/phi_stmt_1838_sources/type_cast_1841/$entry
      -- 	branch_block_stmt_1166/bb_23_bb_24_PhiReq/phi_stmt_1838/phi_stmt_1838_sources/type_cast_1841/SplitProtocol/$entry
      -- 
    cp_elements(18) <= OrReduce(cp_elements(475) & cp_elements(481));
    -- CP-element group 19 merge  place  bypass 
    -- predecessors 495 501 
    -- successors 502 
    -- members (2) 
      -- 	branch_block_stmt_1166/merge_stmt_1872__exit__
      -- 	branch_block_stmt_1166/assign_stmt_1878__entry__
      -- 
    cp_elements(19) <= OrReduce(cp_elements(495) & cp_elements(501));
    -- CP-element group 20 merge  place  bypass 
    -- predecessors 507 513 
    -- successors 514 
    -- members (2) 
      -- 	branch_block_stmt_1166/merge_stmt_1885__exit__
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905__entry__
      -- 
    cp_elements(20) <= OrReduce(cp_elements(507) & cp_elements(513));
    -- CP-element group 21 merge  place  bypass 
    -- predecessors 528 860 
    -- successors 535 
    -- members (2) 
      -- 	branch_block_stmt_1166/merge_stmt_1912__exit__
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949__entry__
      -- 
    cp_elements(21) <= OrReduce(cp_elements(528) & cp_elements(860));
    -- CP-element group 22 place  bypass 
    -- predecessors 903 
    -- successors 552 
    -- members (2) 
      -- 	branch_block_stmt_1166/merge_stmt_1951__exit__
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984__entry__
      -- 
    cp_elements(22) <= cp_elements(903);
    -- CP-element group 23 place  bypass 
    -- predecessors 600 
    -- successors 627 
    -- members (2) 
      -- 	branch_block_stmt_1166/assign_stmt_2002_to_assign_stmt_2014__exit__
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1
      -- 
    cp_elements(23) <= cp_elements(600);
    -- CP-element group 24 fork  transition  bypass 
    -- predecessors 2 
    -- successors 25 26 
    -- members (1) 
      -- 	branch_block_stmt_1166/assign_stmt_1214/$entry
      -- 
    cp_elements(24) <= cp_elements(2);
    -- CP-element group 25 transition  output  bypass 
    -- predecessors 24 
    -- successors 27 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1214/RPIPE_in_data1_1213_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1214/RPIPE_in_data1_1213_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1214/RPIPE_in_data1_1213_Sample/rr
      -- 
    cp_elements(25) <= cp_elements(24);
    rr_4503_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(25), ack => RPIPE_in_data1_1213_inst_req_0); -- 
    -- CP-element group 26 transition  output  bypass 
    -- predecessors 24 
    -- successors 28 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1214/RPIPE_in_data1_1213_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1214/RPIPE_in_data1_1213_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1214/RPIPE_in_data1_1213_Update/cr
      -- 
    cp_elements(26) <= cp_elements(24);
    cr_4508_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(26), ack => RPIPE_in_data1_1213_inst_req_1); -- 
    -- CP-element group 27 transition  input  bypass 
    -- predecessors 25 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1214/RPIPE_in_data1_1213_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1214/RPIPE_in_data1_1213_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1214/RPIPE_in_data1_1213_Sample/ra
      -- 
    ra_4504_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_in_data1_1213_inst_ack_0, ack => cp_elements(27)); -- 
    -- CP-element group 28 transition  place  input  bypass 
    -- predecessors 26 
    -- successors 29 
    -- members (6) 
      -- 	branch_block_stmt_1166/assign_stmt_1214__exit__
      -- 	branch_block_stmt_1166/assign_stmt_1217__entry__
      -- 	branch_block_stmt_1166/assign_stmt_1214/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1214/RPIPE_in_data1_1213_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1214/RPIPE_in_data1_1213_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1214/RPIPE_in_data1_1213_Update/ca
      -- 
    ca_4509_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_in_data1_1213_inst_ack_1, ack => cp_elements(28)); -- 
    -- CP-element group 29 fork  transition  bypass 
    -- predecessors 28 
    -- successors 30 31 
    -- members (1) 
      -- 	branch_block_stmt_1166/assign_stmt_1217/$entry
      -- 
    cp_elements(29) <= cp_elements(28);
    -- CP-element group 30 transition  output  bypass 
    -- predecessors 29 
    -- successors 32 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1217/RPIPE_in_data2_1216_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1217/RPIPE_in_data2_1216_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1217/RPIPE_in_data2_1216_Sample/rr
      -- 
    cp_elements(30) <= cp_elements(29);
    rr_4520_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(30), ack => RPIPE_in_data2_1216_inst_req_0); -- 
    -- CP-element group 31 transition  output  bypass 
    -- predecessors 29 
    -- successors 33 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1217/RPIPE_in_data2_1216_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1217/RPIPE_in_data2_1216_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1217/RPIPE_in_data2_1216_Update/cr
      -- 
    cp_elements(31) <= cp_elements(29);
    cr_4525_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(31), ack => RPIPE_in_data2_1216_inst_req_1); -- 
    -- CP-element group 32 transition  input  bypass 
    -- predecessors 30 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1217/RPIPE_in_data2_1216_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1217/RPIPE_in_data2_1216_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1217/RPIPE_in_data2_1216_Sample/ra
      -- 
    ra_4521_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_in_data2_1216_inst_ack_0, ack => cp_elements(32)); -- 
    -- CP-element group 33 transition  place  input  bypass 
    -- predecessors 31 
    -- successors 34 
    -- members (6) 
      -- 	branch_block_stmt_1166/assign_stmt_1217__exit__
      -- 	branch_block_stmt_1166/assign_stmt_1220__entry__
      -- 	branch_block_stmt_1166/assign_stmt_1217/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1217/RPIPE_in_data2_1216_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1217/RPIPE_in_data2_1216_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1217/RPIPE_in_data2_1216_Update/ca
      -- 
    ca_4526_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_in_data2_1216_inst_ack_1, ack => cp_elements(33)); -- 
    -- CP-element group 34 fork  transition  bypass 
    -- predecessors 33 
    -- successors 35 36 
    -- members (1) 
      -- 	branch_block_stmt_1166/assign_stmt_1220/$entry
      -- 
    cp_elements(34) <= cp_elements(33);
    -- CP-element group 35 transition  output  bypass 
    -- predecessors 34 
    -- successors 37 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1220/RPIPE_in_data3_1219_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1220/RPIPE_in_data3_1219_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1220/RPIPE_in_data3_1219_Sample/rr
      -- 
    cp_elements(35) <= cp_elements(34);
    rr_4537_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(35), ack => RPIPE_in_data3_1219_inst_req_0); -- 
    -- CP-element group 36 transition  output  bypass 
    -- predecessors 34 
    -- successors 38 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1220/RPIPE_in_data3_1219_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1220/RPIPE_in_data3_1219_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1220/RPIPE_in_data3_1219_Update/cr
      -- 
    cp_elements(36) <= cp_elements(34);
    cr_4542_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(36), ack => RPIPE_in_data3_1219_inst_req_1); -- 
    -- CP-element group 37 transition  input  bypass 
    -- predecessors 35 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1220/RPIPE_in_data3_1219_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1220/RPIPE_in_data3_1219_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1220/RPIPE_in_data3_1219_Sample/ra
      -- 
    ra_4538_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_in_data3_1219_inst_ack_0, ack => cp_elements(37)); -- 
    -- CP-element group 38 transition  place  input  bypass 
    -- predecessors 36 
    -- successors 39 
    -- members (6) 
      -- 	branch_block_stmt_1166/assign_stmt_1220__exit__
      -- 	branch_block_stmt_1166/assign_stmt_1223__entry__
      -- 	branch_block_stmt_1166/assign_stmt_1220/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1220/RPIPE_in_data3_1219_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1220/RPIPE_in_data3_1219_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1220/RPIPE_in_data3_1219_Update/ca
      -- 
    ca_4543_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_in_data3_1219_inst_ack_1, ack => cp_elements(38)); -- 
    -- CP-element group 39 fork  transition  bypass 
    -- predecessors 38 
    -- successors 41 40 
    -- members (1) 
      -- 	branch_block_stmt_1166/assign_stmt_1223/$entry
      -- 
    cp_elements(39) <= cp_elements(38);
    -- CP-element group 40 transition  output  bypass 
    -- predecessors 39 
    -- successors 42 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1223/RPIPE_in_data4_1222_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1223/RPIPE_in_data4_1222_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1223/RPIPE_in_data4_1222_Sample/rr
      -- 
    cp_elements(40) <= cp_elements(39);
    rr_4554_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(40), ack => RPIPE_in_data4_1222_inst_req_0); -- 
    -- CP-element group 41 transition  output  bypass 
    -- predecessors 39 
    -- successors 43 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1223/RPIPE_in_data4_1222_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1223/RPIPE_in_data4_1222_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1223/RPIPE_in_data4_1222_Update/cr
      -- 
    cp_elements(41) <= cp_elements(39);
    cr_4559_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(41), ack => RPIPE_in_data4_1222_inst_req_1); -- 
    -- CP-element group 42 transition  input  bypass 
    -- predecessors 40 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1223/RPIPE_in_data4_1222_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1223/RPIPE_in_data4_1222_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1223/RPIPE_in_data4_1222_Sample/ra
      -- 
    ra_4555_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_in_data4_1222_inst_ack_0, ack => cp_elements(42)); -- 
    -- CP-element group 43 transition  place  input  bypass 
    -- predecessors 41 
    -- successors 44 
    -- members (6) 
      -- 	branch_block_stmt_1166/assign_stmt_1223__exit__
      -- 	branch_block_stmt_1166/assign_stmt_1226__entry__
      -- 	branch_block_stmt_1166/assign_stmt_1223/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1223/RPIPE_in_data4_1222_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1223/RPIPE_in_data4_1222_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1223/RPIPE_in_data4_1222_Update/ca
      -- 
    ca_4560_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_in_data4_1222_inst_ack_1, ack => cp_elements(43)); -- 
    -- CP-element group 44 fork  transition  bypass 
    -- predecessors 43 
    -- successors 45 46 
    -- members (1) 
      -- 	branch_block_stmt_1166/assign_stmt_1226/$entry
      -- 
    cp_elements(44) <= cp_elements(43);
    -- CP-element group 45 transition  output  bypass 
    -- predecessors 44 
    -- successors 47 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1226/RPIPE_in_data5_1225_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1226/RPIPE_in_data5_1225_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1226/RPIPE_in_data5_1225_Sample/rr
      -- 
    cp_elements(45) <= cp_elements(44);
    rr_4571_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(45), ack => RPIPE_in_data5_1225_inst_req_0); -- 
    -- CP-element group 46 transition  output  bypass 
    -- predecessors 44 
    -- successors 48 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1226/RPIPE_in_data5_1225_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1226/RPIPE_in_data5_1225_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1226/RPIPE_in_data5_1225_Update/cr
      -- 
    cp_elements(46) <= cp_elements(44);
    cr_4576_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(46), ack => RPIPE_in_data5_1225_inst_req_1); -- 
    -- CP-element group 47 transition  input  bypass 
    -- predecessors 45 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1226/RPIPE_in_data5_1225_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1226/RPIPE_in_data5_1225_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1226/RPIPE_in_data5_1225_Sample/ra
      -- 
    ra_4572_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_in_data5_1225_inst_ack_0, ack => cp_elements(47)); -- 
    -- CP-element group 48 transition  place  input  bypass 
    -- predecessors 46 
    -- successors 49 
    -- members (6) 
      -- 	branch_block_stmt_1166/assign_stmt_1226__exit__
      -- 	branch_block_stmt_1166/assign_stmt_1231__entry__
      -- 	branch_block_stmt_1166/assign_stmt_1226/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1226/RPIPE_in_data5_1225_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1226/RPIPE_in_data5_1225_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1226/RPIPE_in_data5_1225_Update/ca
      -- 
    ca_4577_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_in_data5_1225_inst_ack_1, ack => cp_elements(48)); -- 
    -- CP-element group 49 fork  transition  bypass 
    -- predecessors 48 
    -- successors 53 52 51 
    -- members (1) 
      -- 	branch_block_stmt_1166/assign_stmt_1231/$entry
      -- 
    cp_elements(49) <= cp_elements(48);
    -- CP-element group 50 join  transition  output  bypass 
    -- predecessors 53 52 
    -- successors 54 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1231/SLT_f32_u1_1230_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1231/SLT_f32_u1_1230_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1231/SLT_f32_u1_1230_Sample/rr
      -- 
    cp_element_group_50: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 19) := "cp_element_group_50"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(53) & cp_elements(52);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(50), clk => clk, reset => reset); --
    end block;
    rr_4596_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(50), ack => SLT_f32_u1_1230_inst_req_0); -- 
    -- CP-element group 51 transition  output  bypass 
    -- predecessors 49 
    -- successors 55 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1231/SLT_f32_u1_1230_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1231/SLT_f32_u1_1230_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1231/SLT_f32_u1_1230_Update/cr
      -- 
    cp_elements(51) <= cp_elements(49);
    cr_4601_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(51), ack => SLT_f32_u1_1230_inst_req_1); -- 
    -- CP-element group 52 transition  bypass 
    -- predecessors 49 
    -- successors 50 
    -- members (4) 
      -- 	branch_block_stmt_1166/assign_stmt_1231/R_speed_refx_x1_1228_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1231/R_speed_refx_x1_1228_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1231/R_speed_refx_x1_1228_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1231/R_speed_refx_x1_1228_update_completed_
      -- 
    cp_elements(52) <= cp_elements(49);
    -- CP-element group 53 transition  bypass 
    -- predecessors 49 
    -- successors 50 
    -- members (4) 
      -- 	branch_block_stmt_1166/assign_stmt_1231/R_iNsTr_8_1229_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1231/R_iNsTr_8_1229_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1231/R_iNsTr_8_1229_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1231/R_iNsTr_8_1229_update_completed_
      -- 
    cp_elements(53) <= cp_elements(49);
    -- CP-element group 54 transition  input  bypass 
    -- predecessors 50 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1231/SLT_f32_u1_1230_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1231/SLT_f32_u1_1230_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1231/SLT_f32_u1_1230_Sample/ra
      -- 
    ra_4597_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => SLT_f32_u1_1230_inst_ack_0, ack => cp_elements(54)); -- 
    -- CP-element group 55 branch  transition  place  input  bypass 
    -- predecessors 51 
    -- successors 56 57 
    -- members (6) 
      -- 	branch_block_stmt_1166/assign_stmt_1231__exit__
      -- 	branch_block_stmt_1166/if_stmt_1232__entry__
      -- 	branch_block_stmt_1166/assign_stmt_1231/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1231/SLT_f32_u1_1230_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1231/SLT_f32_u1_1230_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1231/SLT_f32_u1_1230_Update/ca
      -- 
    ca_4602_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => SLT_f32_u1_1230_inst_ack_1, ack => cp_elements(55)); -- 
    -- CP-element group 56 transition  place  dead  bypass 
    -- predecessors 55 
    -- successors 3 
    -- members (8) 
      -- 	branch_block_stmt_1166/if_stmt_1232__exit__
      -- 	branch_block_stmt_1166/merge_stmt_1238__entry__
      -- 	branch_block_stmt_1166/if_stmt_1232_dead_link/$entry
      -- 	branch_block_stmt_1166/if_stmt_1232_dead_link/$exit
      -- 	branch_block_stmt_1166/if_stmt_1232_dead_link/dead_transition
      -- 	branch_block_stmt_1166/merge_stmt_1238_dead_link/$entry
      -- 	branch_block_stmt_1166/merge_stmt_1238_dead_link/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1238_dead_link/dead_transition
      -- 
    cp_elements(56) <= false;
    -- CP-element group 57 transition  output  bypass 
    -- predecessors 55 
    -- successors 58 
    -- members (3) 
      -- 	branch_block_stmt_1166/if_stmt_1232_eval_test/$entry
      -- 	branch_block_stmt_1166/if_stmt_1232_eval_test/$exit
      -- 	branch_block_stmt_1166/if_stmt_1232_eval_test/branch_req
      -- 
    cp_elements(57) <= cp_elements(55);
    branch_req_4610_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(57), ack => if_stmt_1232_branch_req_0); -- 
    -- CP-element group 58 branch  place  bypass 
    -- predecessors 57 
    -- successors 59 61 
    -- members (1) 
      -- 	branch_block_stmt_1166/R_iNsTr_11_1233_place
      -- 
    cp_elements(58) <= cp_elements(57);
    -- CP-element group 59 transition  bypass 
    -- predecessors 58 
    -- successors 60 
    -- members (1) 
      -- 	branch_block_stmt_1166/if_stmt_1232_if_link/$entry
      -- 
    cp_elements(59) <= cp_elements(58);
    -- CP-element group 60 transition  place  input  bypass 
    -- predecessors 59 
    -- successors 3 
    -- members (9) 
      -- 	branch_block_stmt_1166/if_stmt_1232_if_link/$exit
      -- 	branch_block_stmt_1166/if_stmt_1232_if_link/if_choice_transition
      -- 	branch_block_stmt_1166/bb_1_bb_2
      -- 	branch_block_stmt_1166/bb_1_bb_2_PhiReq/$entry
      -- 	branch_block_stmt_1166/bb_1_bb_2_PhiReq/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1238_PhiReqMerge
      -- 	branch_block_stmt_1166/merge_stmt_1238_PhiAck/$entry
      -- 	branch_block_stmt_1166/merge_stmt_1238_PhiAck/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1238_PhiAck/dummy
      -- 
    if_choice_transition_4615_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_1232_branch_ack_1, ack => cp_elements(60)); -- 
    -- CP-element group 61 transition  bypass 
    -- predecessors 58 
    -- successors 62 
    -- members (1) 
      -- 	branch_block_stmt_1166/if_stmt_1232_else_link/$entry
      -- 
    cp_elements(61) <= cp_elements(58);
    -- CP-element group 62 transition  place  input  bypass 
    -- predecessors 61 
    -- successors 68 
    -- members (11) 
      -- 	branch_block_stmt_1166/merge_stmt_1246__exit__
      -- 	branch_block_stmt_1166/assign_stmt_1251__entry__
      -- 	branch_block_stmt_1166/if_stmt_1232_else_link/$exit
      -- 	branch_block_stmt_1166/if_stmt_1232_else_link/else_choice_transition
      -- 	branch_block_stmt_1166/bb_1_bb_3
      -- 	branch_block_stmt_1166/bb_1_bb_3_PhiReq/$entry
      -- 	branch_block_stmt_1166/bb_1_bb_3_PhiReq/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1246_PhiReqMerge
      -- 	branch_block_stmt_1166/merge_stmt_1246_PhiAck/$entry
      -- 	branch_block_stmt_1166/merge_stmt_1246_PhiAck/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1246_PhiAck/dummy
      -- 
    else_choice_transition_4619_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_1232_branch_ack_0, ack => cp_elements(62)); -- 
    -- CP-element group 63 fork  transition  bypass 
    -- predecessors 3 
    -- successors 64 65 
    -- members (1) 
      -- 	branch_block_stmt_1166/assign_stmt_1244/$entry
      -- 
    cp_elements(63) <= cp_elements(3);
    -- CP-element group 64 transition  output  bypass 
    -- predecessors 63 
    -- successors 67 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1244/ADD_f32_f32_1243_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1244/ADD_f32_f32_1243_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1244/ADD_f32_f32_1243_Update/cr
      -- 
    cp_elements(64) <= cp_elements(63);
    cr_4641_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(64), ack => ADD_f32_f32_1243_inst_req_1); -- 
    -- CP-element group 65 transition  output  bypass 
    -- predecessors 63 
    -- successors 66 
    -- members (7) 
      -- 	branch_block_stmt_1166/assign_stmt_1244/ADD_f32_f32_1243_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1244/R_speed_refx_x1_1240_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1244/R_speed_refx_x1_1240_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1244/R_speed_refx_x1_1240_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1244/R_speed_refx_x1_1240_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1244/ADD_f32_f32_1243_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1244/ADD_f32_f32_1243_Sample/rr
      -- 
    cp_elements(65) <= cp_elements(63);
    rr_4636_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(65), ack => ADD_f32_f32_1243_inst_req_0); -- 
    -- CP-element group 66 transition  input  bypass 
    -- predecessors 65 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1244/ADD_f32_f32_1243_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1244/ADD_f32_f32_1243_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1244/ADD_f32_f32_1243_Sample/ra
      -- 
    ra_4637_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ADD_f32_f32_1243_inst_ack_0, ack => cp_elements(66)); -- 
    -- CP-element group 67 fork  transition  place  input  bypass 
    -- predecessors 64 
    -- successors 674 680 684 
    -- members (9) 
      -- 	branch_block_stmt_1166/assign_stmt_1244__exit__
      -- 	branch_block_stmt_1166/bb_2_bb_5
      -- 	branch_block_stmt_1166/assign_stmt_1244/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1244/ADD_f32_f32_1243_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1244/ADD_f32_f32_1243_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1244/ADD_f32_f32_1243_Update/ca
      -- 	branch_block_stmt_1166/bb_2_bb_5_PhiReq/$entry
      -- 	branch_block_stmt_1166/bb_2_bb_5_PhiReq/phi_stmt_1267/$entry
      -- 	branch_block_stmt_1166/bb_2_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/$entry
      -- 
    ca_4642_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ADD_f32_f32_1243_inst_ack_1, ack => cp_elements(67)); -- 
    -- CP-element group 68 fork  transition  bypass 
    -- predecessors 62 
    -- successors 70 71 72 
    -- members (1) 
      -- 	branch_block_stmt_1166/assign_stmt_1251/$entry
      -- 
    cp_elements(68) <= cp_elements(62);
    -- CP-element group 69 join  transition  output  bypass 
    -- predecessors 71 72 
    -- successors 73 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1251/SGT_f32_u1_1250_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1251/SGT_f32_u1_1250_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1251/SGT_f32_u1_1250_Sample/rr
      -- 
    cp_element_group_69: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 19) := "cp_element_group_69"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(71) & cp_elements(72);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(69), clk => clk, reset => reset); --
    end block;
    rr_4661_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(69), ack => SGT_f32_u1_1250_inst_req_0); -- 
    -- CP-element group 70 transition  output  bypass 
    -- predecessors 68 
    -- successors 74 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1251/SGT_f32_u1_1250_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1251/SGT_f32_u1_1250_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1251/SGT_f32_u1_1250_Update/cr
      -- 
    cp_elements(70) <= cp_elements(68);
    cr_4666_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(70), ack => SGT_f32_u1_1250_inst_req_1); -- 
    -- CP-element group 71 transition  bypass 
    -- predecessors 68 
    -- successors 69 
    -- members (4) 
      -- 	branch_block_stmt_1166/assign_stmt_1251/R_speed_refx_x1_1248_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1251/R_speed_refx_x1_1248_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1251/R_speed_refx_x1_1248_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1251/R_speed_refx_x1_1248_update_completed_
      -- 
    cp_elements(71) <= cp_elements(68);
    -- CP-element group 72 transition  bypass 
    -- predecessors 68 
    -- successors 69 
    -- members (4) 
      -- 	branch_block_stmt_1166/assign_stmt_1251/R_iNsTr_8_1249_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1251/R_iNsTr_8_1249_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1251/R_iNsTr_8_1249_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1251/R_iNsTr_8_1249_update_completed_
      -- 
    cp_elements(72) <= cp_elements(68);
    -- CP-element group 73 transition  input  bypass 
    -- predecessors 69 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1251/SGT_f32_u1_1250_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1251/SGT_f32_u1_1250_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1251/SGT_f32_u1_1250_Sample/ra
      -- 
    ra_4662_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => SGT_f32_u1_1250_inst_ack_0, ack => cp_elements(73)); -- 
    -- CP-element group 74 branch  transition  place  input  bypass 
    -- predecessors 70 
    -- successors 75 76 
    -- members (6) 
      -- 	branch_block_stmt_1166/assign_stmt_1251__exit__
      -- 	branch_block_stmt_1166/if_stmt_1252__entry__
      -- 	branch_block_stmt_1166/assign_stmt_1251/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1251/SGT_f32_u1_1250_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1251/SGT_f32_u1_1250_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1251/SGT_f32_u1_1250_Update/ca
      -- 
    ca_4667_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => SGT_f32_u1_1250_inst_ack_1, ack => cp_elements(74)); -- 
    -- CP-element group 75 transition  place  dead  bypass 
    -- predecessors 74 
    -- successors 4 
    -- members (8) 
      -- 	branch_block_stmt_1166/if_stmt_1252__exit__
      -- 	branch_block_stmt_1166/merge_stmt_1258__entry__
      -- 	branch_block_stmt_1166/if_stmt_1252_dead_link/$entry
      -- 	branch_block_stmt_1166/if_stmt_1252_dead_link/$exit
      -- 	branch_block_stmt_1166/if_stmt_1252_dead_link/dead_transition
      -- 	branch_block_stmt_1166/merge_stmt_1258_dead_link/$entry
      -- 	branch_block_stmt_1166/merge_stmt_1258_dead_link/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1258_dead_link/dead_transition
      -- 
    cp_elements(75) <= false;
    -- CP-element group 76 transition  output  bypass 
    -- predecessors 74 
    -- successors 77 
    -- members (3) 
      -- 	branch_block_stmt_1166/if_stmt_1252_eval_test/$entry
      -- 	branch_block_stmt_1166/if_stmt_1252_eval_test/$exit
      -- 	branch_block_stmt_1166/if_stmt_1252_eval_test/branch_req
      -- 
    cp_elements(76) <= cp_elements(74);
    branch_req_4675_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(76), ack => if_stmt_1252_branch_req_0); -- 
    -- CP-element group 77 branch  place  bypass 
    -- predecessors 76 
    -- successors 78 80 
    -- members (1) 
      -- 	branch_block_stmt_1166/R_iNsTr_15_1253_place
      -- 
    cp_elements(77) <= cp_elements(76);
    -- CP-element group 78 transition  bypass 
    -- predecessors 77 
    -- successors 79 
    -- members (1) 
      -- 	branch_block_stmt_1166/if_stmt_1252_if_link/$entry
      -- 
    cp_elements(78) <= cp_elements(77);
    -- CP-element group 79 transition  place  input  bypass 
    -- predecessors 78 
    -- successors 4 
    -- members (9) 
      -- 	branch_block_stmt_1166/if_stmt_1252_if_link/$exit
      -- 	branch_block_stmt_1166/if_stmt_1252_if_link/if_choice_transition
      -- 	branch_block_stmt_1166/bb_3_bb_4
      -- 	branch_block_stmt_1166/bb_3_bb_4_PhiReq/$entry
      -- 	branch_block_stmt_1166/bb_3_bb_4_PhiReq/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1258_PhiReqMerge
      -- 	branch_block_stmt_1166/merge_stmt_1258_PhiAck/$entry
      -- 	branch_block_stmt_1166/merge_stmt_1258_PhiAck/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1258_PhiAck/dummy
      -- 
    if_choice_transition_4680_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_1252_branch_ack_1, ack => cp_elements(79)); -- 
    -- CP-element group 80 transition  bypass 
    -- predecessors 77 
    -- successors 81 
    -- members (1) 
      -- 	branch_block_stmt_1166/if_stmt_1252_else_link/$entry
      -- 
    cp_elements(80) <= cp_elements(77);
    -- CP-element group 81 fork  transition  place  input  bypass 
    -- predecessors 80 
    -- successors 689 693 697 
    -- members (6) 
      -- 	branch_block_stmt_1166/if_stmt_1252_else_link/$exit
      -- 	branch_block_stmt_1166/if_stmt_1252_else_link/else_choice_transition
      -- 	branch_block_stmt_1166/bb_3_bb_5
      -- 	branch_block_stmt_1166/bb_3_bb_5_PhiReq/$entry
      -- 	branch_block_stmt_1166/bb_3_bb_5_PhiReq/phi_stmt_1267/$entry
      -- 	branch_block_stmt_1166/bb_3_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/$entry
      -- 
    else_choice_transition_4684_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_1252_branch_ack_0, ack => cp_elements(81)); -- 
    -- CP-element group 82 fork  transition  bypass 
    -- predecessors 4 
    -- successors 83 84 
    -- members (1) 
      -- 	branch_block_stmt_1166/assign_stmt_1264/$entry
      -- 
    cp_elements(82) <= cp_elements(4);
    -- CP-element group 83 transition  output  bypass 
    -- predecessors 82 
    -- successors 86 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1264/ADD_f32_f32_1263_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1264/ADD_f32_f32_1263_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1264/ADD_f32_f32_1263_Update/cr
      -- 
    cp_elements(83) <= cp_elements(82);
    cr_4706_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(83), ack => ADD_f32_f32_1263_inst_req_1); -- 
    -- CP-element group 84 transition  output  bypass 
    -- predecessors 82 
    -- successors 85 
    -- members (7) 
      -- 	branch_block_stmt_1166/assign_stmt_1264/ADD_f32_f32_1263_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1264/R_speed_refx_x1_1260_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1264/R_speed_refx_x1_1260_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1264/R_speed_refx_x1_1260_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1264/R_speed_refx_x1_1260_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1264/ADD_f32_f32_1263_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1264/ADD_f32_f32_1263_Sample/rr
      -- 
    cp_elements(84) <= cp_elements(82);
    rr_4701_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(84), ack => ADD_f32_f32_1263_inst_req_0); -- 
    -- CP-element group 85 transition  input  bypass 
    -- predecessors 84 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1264/ADD_f32_f32_1263_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1264/ADD_f32_f32_1263_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1264/ADD_f32_f32_1263_Sample/ra
      -- 
    ra_4702_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ADD_f32_f32_1263_inst_ack_0, ack => cp_elements(85)); -- 
    -- CP-element group 86 fork  transition  place  input  bypass 
    -- predecessors 83 
    -- successors 704 708 714 
    -- members (9) 
      -- 	branch_block_stmt_1166/assign_stmt_1264__exit__
      -- 	branch_block_stmt_1166/bb_4_bb_5
      -- 	branch_block_stmt_1166/assign_stmt_1264/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1264/ADD_f32_f32_1263_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1264/ADD_f32_f32_1263_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1264/ADD_f32_f32_1263_Update/ca
      -- 	branch_block_stmt_1166/bb_4_bb_5_PhiReq/$entry
      -- 	branch_block_stmt_1166/bb_4_bb_5_PhiReq/phi_stmt_1267/$entry
      -- 	branch_block_stmt_1166/bb_4_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/$entry
      -- 
    ca_4707_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ADD_f32_f32_1263_inst_ack_1, ack => cp_elements(86)); -- 
    -- CP-element group 87 fork  transition  bypass 
    -- predecessors 721 
    -- successors 89 90 91 94 98 99 102 105 108 
    -- members (1) 
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/$entry
      -- 
    cp_elements(87) <= cp_elements(721);
    -- CP-element group 88 join  transition  output  bypass 
    -- predecessors 90 91 
    -- successors 92 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/SUB_f32_f32_1279_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/SUB_f32_f32_1279_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/SUB_f32_f32_1279_Sample/rr
      -- 
    cp_element_group_88: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 19) := "cp_element_group_88"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(90) & cp_elements(91);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(88), clk => clk, reset => reset); --
    end block;
    rr_4726_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(88), ack => SUB_f32_f32_1279_inst_req_0); -- 
    -- CP-element group 89 transition  output  bypass 
    -- predecessors 87 
    -- successors 93 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/SUB_f32_f32_1279_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/SUB_f32_f32_1279_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/SUB_f32_f32_1279_Update/cr
      -- 
    cp_elements(89) <= cp_elements(87);
    cr_4731_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(89), ack => SUB_f32_f32_1279_inst_req_1); -- 
    -- CP-element group 90 transition  bypass 
    -- predecessors 87 
    -- successors 88 
    -- members (4) 
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/R_speed_refx_x0_1277_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/R_speed_refx_x0_1277_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/R_speed_refx_x0_1277_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/R_speed_refx_x0_1277_update_completed_
      -- 
    cp_elements(90) <= cp_elements(87);
    -- CP-element group 91 transition  bypass 
    -- predecessors 87 
    -- successors 88 
    -- members (4) 
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/R_iNsTr_6_1278_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/R_iNsTr_6_1278_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/R_iNsTr_6_1278_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/R_iNsTr_6_1278_update_completed_
      -- 
    cp_elements(91) <= cp_elements(87);
    -- CP-element group 92 transition  input  bypass 
    -- predecessors 88 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/SUB_f32_f32_1279_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/SUB_f32_f32_1279_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/SUB_f32_f32_1279_Sample/ra
      -- 
    ra_4727_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => SUB_f32_f32_1279_inst_ack_0, ack => cp_elements(92)); -- 
    -- CP-element group 93 transition  input  output  bypass 
    -- predecessors 89 
    -- successors 95 
    -- members (10) 
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/SUB_f32_f32_1279_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/SUB_f32_f32_1279_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/SUB_f32_f32_1279_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/MUL_f32_f32_1285_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/R_iNsTr_17_1282_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/R_iNsTr_17_1282_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/R_iNsTr_17_1282_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/R_iNsTr_17_1282_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/MUL_f32_f32_1285_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/MUL_f32_f32_1285_Sample/rr
      -- 
    ca_4732_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => SUB_f32_f32_1279_inst_ack_1, ack => cp_elements(93)); -- 
    rr_4744_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(93), ack => MUL_f32_f32_1285_inst_req_0); -- 
    -- CP-element group 94 transition  output  bypass 
    -- predecessors 87 
    -- successors 96 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/MUL_f32_f32_1285_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/MUL_f32_f32_1285_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/MUL_f32_f32_1285_Update/cr
      -- 
    cp_elements(94) <= cp_elements(87);
    cr_4749_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(94), ack => MUL_f32_f32_1285_inst_req_1); -- 
    -- CP-element group 95 transition  input  bypass 
    -- predecessors 93 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/MUL_f32_f32_1285_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/MUL_f32_f32_1285_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/MUL_f32_f32_1285_Sample/ra
      -- 
    ra_4745_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f32_f32_1285_inst_ack_0, ack => cp_elements(95)); -- 
    -- CP-element group 96 transition  input  bypass 
    -- predecessors 94 
    -- successors 97 
    -- members (7) 
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/MUL_f32_f32_1285_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/MUL_f32_f32_1285_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/MUL_f32_f32_1285_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/R_iNsTr_18_1288_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/R_iNsTr_18_1288_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/R_iNsTr_18_1288_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/R_iNsTr_18_1288_update_completed_
      -- 
    ca_4750_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f32_f32_1285_inst_ack_1, ack => cp_elements(96)); -- 
    -- CP-element group 97 join  transition  output  bypass 
    -- predecessors 96 99 
    -- successors 100 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/ADD_f32_f32_1290_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/ADD_f32_f32_1290_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/ADD_f32_f32_1290_Sample/rr
      -- 
    cp_element_group_97: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 19) := "cp_element_group_97"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(96) & cp_elements(99);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(97), clk => clk, reset => reset); --
    end block;
    rr_4766_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(97), ack => ADD_f32_f32_1290_inst_req_0); -- 
    -- CP-element group 98 transition  output  bypass 
    -- predecessors 87 
    -- successors 101 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/ADD_f32_f32_1290_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/ADD_f32_f32_1290_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/ADD_f32_f32_1290_Update/cr
      -- 
    cp_elements(98) <= cp_elements(87);
    cr_4771_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(98), ack => ADD_f32_f32_1290_inst_req_1); -- 
    -- CP-element group 99 transition  bypass 
    -- predecessors 87 
    -- successors 97 
    -- members (4) 
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/R_int_speed_err_temp_2x_x0_1289_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/R_int_speed_err_temp_2x_x0_1289_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/R_int_speed_err_temp_2x_x0_1289_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/R_int_speed_err_temp_2x_x0_1289_update_completed_
      -- 
    cp_elements(99) <= cp_elements(87);
    -- CP-element group 100 transition  input  bypass 
    -- predecessors 97 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/ADD_f32_f32_1290_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/ADD_f32_f32_1290_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/ADD_f32_f32_1290_Sample/ra
      -- 
    ra_4767_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ADD_f32_f32_1290_inst_ack_0, ack => cp_elements(100)); -- 
    -- CP-element group 101 transition  input  output  bypass 
    -- predecessors 98 
    -- successors 103 
    -- members (10) 
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/ADD_f32_f32_1290_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/ADD_f32_f32_1290_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/ADD_f32_f32_1290_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/MUL_f32_f32_1296_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/R_iNsTr_19_1293_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/R_iNsTr_19_1293_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/R_iNsTr_19_1293_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/R_iNsTr_19_1293_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/MUL_f32_f32_1296_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/MUL_f32_f32_1296_Sample/rr
      -- 
    ca_4772_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ADD_f32_f32_1290_inst_ack_1, ack => cp_elements(101)); -- 
    rr_4784_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(101), ack => MUL_f32_f32_1296_inst_req_0); -- 
    -- CP-element group 102 transition  output  bypass 
    -- predecessors 87 
    -- successors 104 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/MUL_f32_f32_1296_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/MUL_f32_f32_1296_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/MUL_f32_f32_1296_Update/cr
      -- 
    cp_elements(102) <= cp_elements(87);
    cr_4789_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(102), ack => MUL_f32_f32_1296_inst_req_1); -- 
    -- CP-element group 103 transition  input  bypass 
    -- predecessors 101 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/MUL_f32_f32_1296_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/MUL_f32_f32_1296_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/MUL_f32_f32_1296_Sample/ra
      -- 
    ra_4785_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f32_f32_1296_inst_ack_0, ack => cp_elements(103)); -- 
    -- CP-element group 104 transition  input  output  bypass 
    -- predecessors 102 
    -- successors 106 
    -- members (10) 
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/MUL_f32_f32_1296_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/MUL_f32_f32_1296_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/MUL_f32_f32_1296_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/type_cast_1300_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/R_iNsTr_20_1299_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/R_iNsTr_20_1299_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/R_iNsTr_20_1299_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/R_iNsTr_20_1299_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/type_cast_1300_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/type_cast_1300_Sample/rr
      -- 
    ca_4790_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f32_f32_1296_inst_ack_1, ack => cp_elements(104)); -- 
    rr_4802_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(104), ack => type_cast_1300_inst_req_0); -- 
    -- CP-element group 105 transition  output  bypass 
    -- predecessors 87 
    -- successors 107 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/type_cast_1300_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/type_cast_1300_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/type_cast_1300_Update/cr
      -- 
    cp_elements(105) <= cp_elements(87);
    cr_4807_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(105), ack => type_cast_1300_inst_req_1); -- 
    -- CP-element group 106 transition  input  bypass 
    -- predecessors 104 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/type_cast_1300_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/type_cast_1300_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/type_cast_1300_Sample/ra
      -- 
    ra_4803_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1300_inst_ack_0, ack => cp_elements(106)); -- 
    -- CP-element group 107 transition  input  output  bypass 
    -- predecessors 105 
    -- successors 109 
    -- members (10) 
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/SLT_f64_u1_1306_Sample/rr
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/SLT_f64_u1_1306_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/R_iNsTr_21_1303_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/type_cast_1300_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/type_cast_1300_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/type_cast_1300_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/SLT_f64_u1_1306_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/R_iNsTr_21_1303_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/R_iNsTr_21_1303_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/R_iNsTr_21_1303_update_start_
      -- 
    ca_4808_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1300_inst_ack_1, ack => cp_elements(107)); -- 
    rr_4820_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(107), ack => SLT_f64_u1_1306_inst_req_0); -- 
    -- CP-element group 108 transition  output  bypass 
    -- predecessors 87 
    -- successors 110 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/SLT_f64_u1_1306_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/SLT_f64_u1_1306_Update/cr
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/SLT_f64_u1_1306_update_start_
      -- 
    cp_elements(108) <= cp_elements(87);
    cr_4825_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(108), ack => SLT_f64_u1_1306_inst_req_1); -- 
    -- CP-element group 109 transition  input  bypass 
    -- predecessors 107 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/SLT_f64_u1_1306_Sample/ra
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/SLT_f64_u1_1306_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/SLT_f64_u1_1306_sample_completed_
      -- 
    ra_4821_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => SLT_f64_u1_1306_inst_ack_0, ack => cp_elements(109)); -- 
    -- CP-element group 110 branch  transition  place  input  bypass 
    -- predecessors 108 
    -- successors 111 112 
    -- members (6) 
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/SLT_f64_u1_1306_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307__exit__
      -- 	branch_block_stmt_1166/if_stmt_1308__entry__
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/SLT_f64_u1_1306_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307/SLT_f64_u1_1306_update_completed_
      -- 
    ca_4826_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => SLT_f64_u1_1306_inst_ack_1, ack => cp_elements(110)); -- 
    -- CP-element group 111 transition  place  dead  bypass 
    -- predecessors 110 
    -- successors 5 
    -- members (8) 
      -- 	branch_block_stmt_1166/if_stmt_1308__exit__
      -- 	branch_block_stmt_1166/merge_stmt_1314__entry__
      -- 	branch_block_stmt_1166/if_stmt_1308_dead_link/dead_transition
      -- 	branch_block_stmt_1166/if_stmt_1308_dead_link/$exit
      -- 	branch_block_stmt_1166/if_stmt_1308_dead_link/$entry
      -- 	branch_block_stmt_1166/merge_stmt_1314_dead_link/$entry
      -- 	branch_block_stmt_1166/merge_stmt_1314_dead_link/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1314_dead_link/dead_transition
      -- 
    cp_elements(111) <= false;
    -- CP-element group 112 transition  output  bypass 
    -- predecessors 110 
    -- successors 113 
    -- members (3) 
      -- 	branch_block_stmt_1166/if_stmt_1308_eval_test/branch_req
      -- 	branch_block_stmt_1166/if_stmt_1308_eval_test/$exit
      -- 	branch_block_stmt_1166/if_stmt_1308_eval_test/$entry
      -- 
    cp_elements(112) <= cp_elements(110);
    branch_req_4834_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(112), ack => if_stmt_1308_branch_req_0); -- 
    -- CP-element group 113 branch  place  bypass 
    -- predecessors 112 
    -- successors 114 116 
    -- members (1) 
      -- 	branch_block_stmt_1166/R_iNsTr_22_1309_place
      -- 
    cp_elements(113) <= cp_elements(112);
    -- CP-element group 114 transition  bypass 
    -- predecessors 113 
    -- successors 115 
    -- members (1) 
      -- 	branch_block_stmt_1166/if_stmt_1308_if_link/$entry
      -- 
    cp_elements(114) <= cp_elements(113);
    -- CP-element group 115 fork  transition  place  input  bypass 
    -- predecessors 114 
    -- successors 722 723 
    -- members (8) 
      -- 	branch_block_stmt_1166/if_stmt_1308_if_link/if_choice_transition
      -- 	branch_block_stmt_1166/if_stmt_1308_if_link/$exit
      -- 	branch_block_stmt_1166/bb_5_bb_8
      -- 	branch_block_stmt_1166/bb_5_bb_8_PhiReq/phi_stmt_1330/phi_stmt_1330_sources/type_cast_1333/SplitProtocol/$entry
      -- 	branch_block_stmt_1166/bb_5_bb_8_PhiReq/phi_stmt_1330/phi_stmt_1330_sources/type_cast_1333/$entry
      -- 	branch_block_stmt_1166/bb_5_bb_8_PhiReq/$entry
      -- 	branch_block_stmt_1166/bb_5_bb_8_PhiReq/phi_stmt_1330/$entry
      -- 	branch_block_stmt_1166/bb_5_bb_8_PhiReq/phi_stmt_1330/phi_stmt_1330_sources/$entry
      -- 
    if_choice_transition_4839_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_1308_branch_ack_1, ack => cp_elements(115)); -- 
    -- CP-element group 116 transition  bypass 
    -- predecessors 113 
    -- successors 117 
    -- members (1) 
      -- 	branch_block_stmt_1166/if_stmt_1308_else_link/$entry
      -- 
    cp_elements(116) <= cp_elements(113);
    -- CP-element group 117 transition  place  input  bypass 
    -- predecessors 116 
    -- successors 5 
    -- members (9) 
      -- 	branch_block_stmt_1166/if_stmt_1308_else_link/else_choice_transition
      -- 	branch_block_stmt_1166/if_stmt_1308_else_link/$exit
      -- 	branch_block_stmt_1166/bb_5_bb_6
      -- 	branch_block_stmt_1166/bb_5_bb_6_PhiReq/$entry
      -- 	branch_block_stmt_1166/bb_5_bb_6_PhiReq/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1314_PhiReqMerge
      -- 	branch_block_stmt_1166/merge_stmt_1314_PhiAck/$entry
      -- 	branch_block_stmt_1166/merge_stmt_1314_PhiAck/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1314_PhiAck/dummy
      -- 
    else_choice_transition_4843_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_1308_branch_ack_0, ack => cp_elements(117)); -- 
    -- CP-element group 118 fork  transition  bypass 
    -- predecessors 5 
    -- successors 119 120 
    -- members (1) 
      -- 	branch_block_stmt_1166/assign_stmt_1320/$entry
      -- 
    cp_elements(118) <= cp_elements(5);
    -- CP-element group 119 transition  output  bypass 
    -- predecessors 118 
    -- successors 122 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1320/SGT_f64_u1_1319_Update/cr
      -- 	branch_block_stmt_1166/assign_stmt_1320/SGT_f64_u1_1319_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1320/SGT_f64_u1_1319_update_start_
      -- 
    cp_elements(119) <= cp_elements(118);
    cr_4865_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(119), ack => SGT_f64_u1_1319_inst_req_1); -- 
    -- CP-element group 120 transition  output  bypass 
    -- predecessors 118 
    -- successors 121 
    -- members (7) 
      -- 	branch_block_stmt_1166/assign_stmt_1320/SGT_f64_u1_1319_Sample/rr
      -- 	branch_block_stmt_1166/assign_stmt_1320/SGT_f64_u1_1319_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1320/R_iNsTr_21_1316_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1320/R_iNsTr_21_1316_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1320/R_iNsTr_21_1316_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1320/R_iNsTr_21_1316_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1320/SGT_f64_u1_1319_sample_start_
      -- 
    cp_elements(120) <= cp_elements(118);
    rr_4860_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(120), ack => SGT_f64_u1_1319_inst_req_0); -- 
    -- CP-element group 121 transition  input  bypass 
    -- predecessors 120 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1320/SGT_f64_u1_1319_Sample/ra
      -- 	branch_block_stmt_1166/assign_stmt_1320/SGT_f64_u1_1319_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1320/SGT_f64_u1_1319_sample_completed_
      -- 
    ra_4861_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => SGT_f64_u1_1319_inst_ack_0, ack => cp_elements(121)); -- 
    -- CP-element group 122 branch  transition  place  input  bypass 
    -- predecessors 119 
    -- successors 123 124 
    -- members (6) 
      -- 	branch_block_stmt_1166/assign_stmt_1320__exit__
      -- 	branch_block_stmt_1166/if_stmt_1321__entry__
      -- 	branch_block_stmt_1166/assign_stmt_1320/SGT_f64_u1_1319_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1320/SGT_f64_u1_1319_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1320/SGT_f64_u1_1319_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1320/$exit
      -- 
    ca_4866_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => SGT_f64_u1_1319_inst_ack_1, ack => cp_elements(122)); -- 
    -- CP-element group 123 transition  place  dead  bypass 
    -- predecessors 122 
    -- successors 6 
    -- members (8) 
      -- 	branch_block_stmt_1166/if_stmt_1321__exit__
      -- 	branch_block_stmt_1166/merge_stmt_1327__entry__
      -- 	branch_block_stmt_1166/if_stmt_1321_dead_link/dead_transition
      -- 	branch_block_stmt_1166/if_stmt_1321_dead_link/$exit
      -- 	branch_block_stmt_1166/if_stmt_1321_dead_link/$entry
      -- 	branch_block_stmt_1166/merge_stmt_1327_dead_link/$entry
      -- 	branch_block_stmt_1166/merge_stmt_1327_dead_link/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1327_dead_link/dead_transition
      -- 
    cp_elements(123) <= false;
    -- CP-element group 124 transition  output  bypass 
    -- predecessors 122 
    -- successors 125 
    -- members (3) 
      -- 	branch_block_stmt_1166/if_stmt_1321_eval_test/branch_req
      -- 	branch_block_stmt_1166/if_stmt_1321_eval_test/$exit
      -- 	branch_block_stmt_1166/if_stmt_1321_eval_test/$entry
      -- 
    cp_elements(124) <= cp_elements(122);
    branch_req_4874_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(124), ack => if_stmt_1321_branch_req_0); -- 
    -- CP-element group 125 branch  place  bypass 
    -- predecessors 124 
    -- successors 126 128 
    -- members (1) 
      -- 	branch_block_stmt_1166/R_iNsTr_30_1322_place
      -- 
    cp_elements(125) <= cp_elements(124);
    -- CP-element group 126 transition  bypass 
    -- predecessors 125 
    -- successors 127 
    -- members (1) 
      -- 	branch_block_stmt_1166/if_stmt_1321_if_link/$entry
      -- 
    cp_elements(126) <= cp_elements(125);
    -- CP-element group 127 fork  transition  place  input  bypass 
    -- predecessors 126 
    -- successors 725 726 
    -- members (8) 
      -- 	branch_block_stmt_1166/bb_6_bb_8
      -- 	branch_block_stmt_1166/if_stmt_1321_if_link/if_choice_transition
      -- 	branch_block_stmt_1166/if_stmt_1321_if_link/$exit
      -- 	branch_block_stmt_1166/bb_6_bb_8_PhiReq/phi_stmt_1330/$entry
      -- 	branch_block_stmt_1166/bb_6_bb_8_PhiReq/phi_stmt_1330/phi_stmt_1330_sources/type_cast_1333/SplitProtocol/$entry
      -- 	branch_block_stmt_1166/bb_6_bb_8_PhiReq/phi_stmt_1330/phi_stmt_1330_sources/$entry
      -- 	branch_block_stmt_1166/bb_6_bb_8_PhiReq/phi_stmt_1330/phi_stmt_1330_sources/type_cast_1333/$entry
      -- 	branch_block_stmt_1166/bb_6_bb_8_PhiReq/$entry
      -- 
    if_choice_transition_4879_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_1321_branch_ack_1, ack => cp_elements(127)); -- 
    -- CP-element group 128 transition  bypass 
    -- predecessors 125 
    -- successors 129 
    -- members (1) 
      -- 	branch_block_stmt_1166/if_stmt_1321_else_link/$entry
      -- 
    cp_elements(128) <= cp_elements(125);
    -- CP-element group 129 transition  place  input  bypass 
    -- predecessors 128 
    -- successors 6 
    -- members (9) 
      -- 	branch_block_stmt_1166/bb_6_bb_7
      -- 	branch_block_stmt_1166/if_stmt_1321_else_link/else_choice_transition
      -- 	branch_block_stmt_1166/if_stmt_1321_else_link/$exit
      -- 	branch_block_stmt_1166/bb_6_bb_7_PhiReq/$entry
      -- 	branch_block_stmt_1166/bb_6_bb_7_PhiReq/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1327_PhiReqMerge
      -- 	branch_block_stmt_1166/merge_stmt_1327_PhiAck/$entry
      -- 	branch_block_stmt_1166/merge_stmt_1327_PhiAck/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1327_PhiAck/dummy
      -- 
    else_choice_transition_4883_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_1321_branch_ack_0, ack => cp_elements(129)); -- 
    -- CP-element group 130 fork  transition  bypass 
    -- predecessors 735 
    -- successors 131 132 136 137 140 
    -- members (1) 
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/$entry
      -- 
    cp_elements(130) <= cp_elements(735);
    -- CP-element group 131 transition  output  bypass 
    -- predecessors 130 
    -- successors 134 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/MUL_f32_f32_1345_Update/cr
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/MUL_f32_f32_1345_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/MUL_f32_f32_1345_update_start_
      -- 
    cp_elements(131) <= cp_elements(130);
    cr_4905_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(131), ack => MUL_f32_f32_1345_inst_req_1); -- 
    -- CP-element group 132 transition  output  bypass 
    -- predecessors 130 
    -- successors 133 
    -- members (7) 
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/MUL_f32_f32_1345_Sample/rr
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/MUL_f32_f32_1345_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/R_iNsTr_17_1342_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/R_iNsTr_17_1342_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/R_iNsTr_17_1342_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/R_iNsTr_17_1342_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/MUL_f32_f32_1345_sample_start_
      -- 
    cp_elements(132) <= cp_elements(130);
    rr_4900_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(132), ack => MUL_f32_f32_1345_inst_req_0); -- 
    -- CP-element group 133 transition  input  bypass 
    -- predecessors 132 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/MUL_f32_f32_1345_Sample/ra
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/MUL_f32_f32_1345_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/MUL_f32_f32_1345_sample_completed_
      -- 
    ra_4901_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f32_f32_1345_inst_ack_0, ack => cp_elements(133)); -- 
    -- CP-element group 134 transition  input  bypass 
    -- predecessors 131 
    -- successors 135 
    -- members (7) 
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/R_iNsTr_26_1349_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/R_iNsTr_26_1349_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/R_iNsTr_26_1349_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/R_iNsTr_26_1349_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/MUL_f32_f32_1345_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/MUL_f32_f32_1345_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/MUL_f32_f32_1345_update_completed_
      -- 
    ca_4906_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f32_f32_1345_inst_ack_1, ack => cp_elements(134)); -- 
    -- CP-element group 135 join  transition  output  bypass 
    -- predecessors 134 137 
    -- successors 138 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/ADD_f32_f32_1350_Sample/rr
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/ADD_f32_f32_1350_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/ADD_f32_f32_1350_sample_start_
      -- 
    cp_element_group_135: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_135"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(134) & cp_elements(137);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(135), clk => clk, reset => reset); --
    end block;
    rr_4922_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(135), ack => ADD_f32_f32_1350_inst_req_0); -- 
    -- CP-element group 136 transition  output  bypass 
    -- predecessors 130 
    -- successors 139 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/ADD_f32_f32_1350_Update/cr
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/ADD_f32_f32_1350_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/ADD_f32_f32_1350_update_start_
      -- 
    cp_elements(136) <= cp_elements(130);
    cr_4927_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(136), ack => ADD_f32_f32_1350_inst_req_1); -- 
    -- CP-element group 137 transition  bypass 
    -- predecessors 130 
    -- successors 135 
    -- members (4) 
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/R_int_speed_errx_x0_1348_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/R_int_speed_errx_x0_1348_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/R_int_speed_errx_x0_1348_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/R_int_speed_errx_x0_1348_sample_start_
      -- 
    cp_elements(137) <= cp_elements(130);
    -- CP-element group 138 transition  input  bypass 
    -- predecessors 135 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/ADD_f32_f32_1350_Sample/ra
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/ADD_f32_f32_1350_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/ADD_f32_f32_1350_sample_completed_
      -- 
    ra_4923_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ADD_f32_f32_1350_inst_ack_0, ack => cp_elements(138)); -- 
    -- CP-element group 139 transition  input  output  bypass 
    -- predecessors 136 
    -- successors 141 
    -- members (10) 
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/SLT_f32_u1_1356_Sample/rr
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/SLT_f32_u1_1356_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/R_iNsTr_27_1353_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/R_iNsTr_27_1353_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/R_iNsTr_27_1353_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/R_iNsTr_27_1353_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/SLT_f32_u1_1356_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/ADD_f32_f32_1350_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/ADD_f32_f32_1350_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/ADD_f32_f32_1350_update_completed_
      -- 
    ca_4928_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ADD_f32_f32_1350_inst_ack_1, ack => cp_elements(139)); -- 
    rr_4940_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(139), ack => SLT_f32_u1_1356_inst_req_0); -- 
    -- CP-element group 140 transition  output  bypass 
    -- predecessors 130 
    -- successors 142 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/SLT_f32_u1_1356_Update/cr
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/SLT_f32_u1_1356_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/SLT_f32_u1_1356_update_start_
      -- 
    cp_elements(140) <= cp_elements(130);
    cr_4945_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(140), ack => SLT_f32_u1_1356_inst_req_1); -- 
    -- CP-element group 141 transition  input  bypass 
    -- predecessors 139 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/SLT_f32_u1_1356_Sample/ra
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/SLT_f32_u1_1356_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/SLT_f32_u1_1356_sample_completed_
      -- 
    ra_4941_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => SLT_f32_u1_1356_inst_ack_0, ack => cp_elements(141)); -- 
    -- CP-element group 142 branch  transition  place  input  bypass 
    -- predecessors 140 
    -- successors 143 144 
    -- members (6) 
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/SLT_f32_u1_1356_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/SLT_f32_u1_1356_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/SLT_f32_u1_1356_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357__exit__
      -- 	branch_block_stmt_1166/if_stmt_1358__entry__
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357/$exit
      -- 
    ca_4946_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => SLT_f32_u1_1356_inst_ack_1, ack => cp_elements(142)); -- 
    -- CP-element group 143 transition  place  dead  bypass 
    -- predecessors 142 
    -- successors 7 
    -- members (8) 
      -- 	branch_block_stmt_1166/if_stmt_1358_dead_link/dead_transition
      -- 	branch_block_stmt_1166/if_stmt_1358_dead_link/$exit
      -- 	branch_block_stmt_1166/if_stmt_1358_dead_link/$entry
      -- 	branch_block_stmt_1166/if_stmt_1358__exit__
      -- 	branch_block_stmt_1166/merge_stmt_1364__entry__
      -- 	branch_block_stmt_1166/merge_stmt_1364_dead_link/dead_transition
      -- 	branch_block_stmt_1166/merge_stmt_1364_dead_link/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1364_dead_link/$entry
      -- 
    cp_elements(143) <= false;
    -- CP-element group 144 transition  output  bypass 
    -- predecessors 142 
    -- successors 145 
    -- members (3) 
      -- 	branch_block_stmt_1166/if_stmt_1358_eval_test/branch_req
      -- 	branch_block_stmt_1166/if_stmt_1358_eval_test/$exit
      -- 	branch_block_stmt_1166/if_stmt_1358_eval_test/$entry
      -- 
    cp_elements(144) <= cp_elements(142);
    branch_req_4954_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(144), ack => if_stmt_1358_branch_req_0); -- 
    -- CP-element group 145 branch  place  bypass 
    -- predecessors 144 
    -- successors 146 148 
    -- members (1) 
      -- 	branch_block_stmt_1166/R_iNsTr_28_1359_place
      -- 
    cp_elements(145) <= cp_elements(144);
    -- CP-element group 146 transition  bypass 
    -- predecessors 145 
    -- successors 147 
    -- members (1) 
      -- 	branch_block_stmt_1166/if_stmt_1358_if_link/$entry
      -- 
    cp_elements(146) <= cp_elements(145);
    -- CP-element group 147 fork  transition  place  input  bypass 
    -- predecessors 146 
    -- successors 741 742 
    -- members (8) 
      -- 	branch_block_stmt_1166/bb_8_bb_11
      -- 	branch_block_stmt_1166/if_stmt_1358_if_link/if_choice_transition
      -- 	branch_block_stmt_1166/if_stmt_1358_if_link/$exit
      -- 	branch_block_stmt_1166/bb_8_bb_11_PhiReq/phi_stmt_1394/phi_stmt_1394_sources/type_cast_1397/SplitProtocol/$entry
      -- 	branch_block_stmt_1166/bb_8_bb_11_PhiReq/phi_stmt_1394/phi_stmt_1394_sources/type_cast_1397/$entry
      -- 	branch_block_stmt_1166/bb_8_bb_11_PhiReq/phi_stmt_1394/phi_stmt_1394_sources/$entry
      -- 	branch_block_stmt_1166/bb_8_bb_11_PhiReq/phi_stmt_1394/$entry
      -- 	branch_block_stmt_1166/bb_8_bb_11_PhiReq/$entry
      -- 
    if_choice_transition_4959_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_1358_branch_ack_1, ack => cp_elements(147)); -- 
    -- CP-element group 148 transition  bypass 
    -- predecessors 145 
    -- successors 149 
    -- members (1) 
      -- 	branch_block_stmt_1166/if_stmt_1358_else_link/$entry
      -- 
    cp_elements(148) <= cp_elements(145);
    -- CP-element group 149 transition  place  input  bypass 
    -- predecessors 148 
    -- successors 7 
    -- members (9) 
      -- 	branch_block_stmt_1166/bb_8_bb_9
      -- 	branch_block_stmt_1166/if_stmt_1358_else_link/else_choice_transition
      -- 	branch_block_stmt_1166/if_stmt_1358_else_link/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1364_PhiAck/dummy
      -- 	branch_block_stmt_1166/merge_stmt_1364_PhiAck/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1364_PhiAck/$entry
      -- 	branch_block_stmt_1166/bb_8_bb_9_PhiReq/$exit
      -- 	branch_block_stmt_1166/bb_8_bb_9_PhiReq/$entry
      -- 	branch_block_stmt_1166/merge_stmt_1364_PhiReqMerge
      -- 
    else_choice_transition_4963_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_1358_branch_ack_0, ack => cp_elements(149)); -- 
    -- CP-element group 150 fork  transition  bypass 
    -- predecessors 7 
    -- successors 151 152 
    -- members (1) 
      -- 	branch_block_stmt_1166/assign_stmt_1370/$entry
      -- 
    cp_elements(150) <= cp_elements(7);
    -- CP-element group 151 transition  output  bypass 
    -- predecessors 150 
    -- successors 154 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1370/SGT_f32_u1_1369_Update/cr
      -- 	branch_block_stmt_1166/assign_stmt_1370/SGT_f32_u1_1369_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1370/SGT_f32_u1_1369_update_start_
      -- 
    cp_elements(151) <= cp_elements(150);
    cr_4985_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(151), ack => SGT_f32_u1_1369_inst_req_1); -- 
    -- CP-element group 152 transition  output  bypass 
    -- predecessors 150 
    -- successors 153 
    -- members (7) 
      -- 	branch_block_stmt_1166/assign_stmt_1370/SGT_f32_u1_1369_Sample/rr
      -- 	branch_block_stmt_1166/assign_stmt_1370/SGT_f32_u1_1369_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1370/R_iNsTr_27_1366_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1370/R_iNsTr_27_1366_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1370/R_iNsTr_27_1366_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1370/R_iNsTr_27_1366_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1370/SGT_f32_u1_1369_sample_start_
      -- 
    cp_elements(152) <= cp_elements(150);
    rr_4980_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(152), ack => SGT_f32_u1_1369_inst_req_0); -- 
    -- CP-element group 153 transition  input  bypass 
    -- predecessors 152 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1370/SGT_f32_u1_1369_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1370/SGT_f32_u1_1369_Sample/ra
      -- 	branch_block_stmt_1166/assign_stmt_1370/SGT_f32_u1_1369_sample_completed_
      -- 
    ra_4981_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => SGT_f32_u1_1369_inst_ack_0, ack => cp_elements(153)); -- 
    -- CP-element group 154 branch  transition  place  input  bypass 
    -- predecessors 151 
    -- successors 155 156 
    -- members (6) 
      -- 	branch_block_stmt_1166/assign_stmt_1370/SGT_f32_u1_1369_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1370/SGT_f32_u1_1369_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1370/SGT_f32_u1_1369_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1370/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1370__exit__
      -- 	branch_block_stmt_1166/if_stmt_1371__entry__
      -- 
    ca_4986_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => SGT_f32_u1_1369_inst_ack_1, ack => cp_elements(154)); -- 
    -- CP-element group 155 transition  place  dead  bypass 
    -- predecessors 154 
    -- successors 8 
    -- members (8) 
      -- 	branch_block_stmt_1166/if_stmt_1371_dead_link/$entry
      -- 	branch_block_stmt_1166/if_stmt_1371_dead_link/$exit
      -- 	branch_block_stmt_1166/if_stmt_1371_dead_link/dead_transition
      -- 	branch_block_stmt_1166/if_stmt_1371__exit__
      -- 	branch_block_stmt_1166/merge_stmt_1377__entry__
      -- 	branch_block_stmt_1166/merge_stmt_1377_dead_link/dead_transition
      -- 	branch_block_stmt_1166/merge_stmt_1377_dead_link/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1377_dead_link/$entry
      -- 
    cp_elements(155) <= false;
    -- CP-element group 156 transition  output  bypass 
    -- predecessors 154 
    -- successors 157 
    -- members (3) 
      -- 	branch_block_stmt_1166/if_stmt_1371_eval_test/$entry
      -- 	branch_block_stmt_1166/if_stmt_1371_eval_test/$exit
      -- 	branch_block_stmt_1166/if_stmt_1371_eval_test/branch_req
      -- 
    cp_elements(156) <= cp_elements(154);
    branch_req_4994_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(156), ack => if_stmt_1371_branch_req_0); -- 
    -- CP-element group 157 branch  place  bypass 
    -- predecessors 156 
    -- successors 158 160 
    -- members (1) 
      -- 	branch_block_stmt_1166/R_iNsTr_35_1372_place
      -- 
    cp_elements(157) <= cp_elements(156);
    -- CP-element group 158 transition  bypass 
    -- predecessors 157 
    -- successors 159 
    -- members (1) 
      -- 	branch_block_stmt_1166/if_stmt_1371_if_link/$entry
      -- 
    cp_elements(158) <= cp_elements(157);
    -- CP-element group 159 fork  transition  place  input  bypass 
    -- predecessors 158 
    -- successors 744 745 
    -- members (8) 
      -- 	branch_block_stmt_1166/bb_9_bb_11
      -- 	branch_block_stmt_1166/if_stmt_1371_if_link/$exit
      -- 	branch_block_stmt_1166/if_stmt_1371_if_link/if_choice_transition
      -- 	branch_block_stmt_1166/bb_9_bb_11_PhiReq/$entry
      -- 	branch_block_stmt_1166/bb_9_bb_11_PhiReq/phi_stmt_1394/$entry
      -- 	branch_block_stmt_1166/bb_9_bb_11_PhiReq/phi_stmt_1394/phi_stmt_1394_sources/$entry
      -- 	branch_block_stmt_1166/bb_9_bb_11_PhiReq/phi_stmt_1394/phi_stmt_1394_sources/type_cast_1397/$entry
      -- 	branch_block_stmt_1166/bb_9_bb_11_PhiReq/phi_stmt_1394/phi_stmt_1394_sources/type_cast_1397/SplitProtocol/$entry
      -- 
    if_choice_transition_4999_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_1371_branch_ack_1, ack => cp_elements(159)); -- 
    -- CP-element group 160 transition  bypass 
    -- predecessors 157 
    -- successors 161 
    -- members (1) 
      -- 	branch_block_stmt_1166/if_stmt_1371_else_link/$entry
      -- 
    cp_elements(160) <= cp_elements(157);
    -- CP-element group 161 transition  place  input  bypass 
    -- predecessors 160 
    -- successors 8 
    -- members (9) 
      -- 	branch_block_stmt_1166/bb_9_bb_10
      -- 	branch_block_stmt_1166/if_stmt_1371_else_link/$exit
      -- 	branch_block_stmt_1166/if_stmt_1371_else_link/else_choice_transition
      -- 	branch_block_stmt_1166/merge_stmt_1377_PhiReqMerge
      -- 	branch_block_stmt_1166/merge_stmt_1377_PhiAck/dummy
      -- 	branch_block_stmt_1166/merge_stmt_1377_PhiAck/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1377_PhiAck/$entry
      -- 	branch_block_stmt_1166/bb_9_bb_10_PhiReq/$exit
      -- 	branch_block_stmt_1166/bb_9_bb_10_PhiReq/$entry
      -- 
    else_choice_transition_5003_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_1371_branch_ack_0, ack => cp_elements(161)); -- 
    -- CP-element group 162 fork  transition  bypass 
    -- predecessors 8 
    -- successors 163 164 167 170 
    -- members (1) 
      -- 	branch_block_stmt_1166/assign_stmt_1383_to_assign_stmt_1391/$entry
      -- 
    cp_elements(162) <= cp_elements(8);
    -- CP-element group 163 transition  output  bypass 
    -- predecessors 162 
    -- successors 166 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1383_to_assign_stmt_1391/MUL_f32_f32_1382_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1383_to_assign_stmt_1391/MUL_f32_f32_1382_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1383_to_assign_stmt_1391/MUL_f32_f32_1382_Update/cr
      -- 
    cp_elements(163) <= cp_elements(162);
    cr_5025_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(163), ack => MUL_f32_f32_1382_inst_req_1); -- 
    -- CP-element group 164 transition  output  bypass 
    -- predecessors 162 
    -- successors 165 
    -- members (7) 
      -- 	branch_block_stmt_1166/assign_stmt_1383_to_assign_stmt_1391/MUL_f32_f32_1382_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1383_to_assign_stmt_1391/R_iNsTr_27_1379_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1383_to_assign_stmt_1391/R_iNsTr_27_1379_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1383_to_assign_stmt_1391/R_iNsTr_27_1379_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1383_to_assign_stmt_1391/R_iNsTr_27_1379_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1383_to_assign_stmt_1391/MUL_f32_f32_1382_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1383_to_assign_stmt_1391/MUL_f32_f32_1382_Sample/rr
      -- 
    cp_elements(164) <= cp_elements(162);
    rr_5020_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(164), ack => MUL_f32_f32_1382_inst_req_0); -- 
    -- CP-element group 165 transition  input  bypass 
    -- predecessors 164 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1383_to_assign_stmt_1391/MUL_f32_f32_1382_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1383_to_assign_stmt_1391/MUL_f32_f32_1382_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1383_to_assign_stmt_1391/MUL_f32_f32_1382_Sample/ra
      -- 
    ra_5021_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f32_f32_1382_inst_ack_0, ack => cp_elements(165)); -- 
    -- CP-element group 166 transition  input  output  bypass 
    -- predecessors 163 
    -- successors 168 
    -- members (10) 
      -- 	branch_block_stmt_1166/assign_stmt_1383_to_assign_stmt_1391/MUL_f32_f32_1382_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1383_to_assign_stmt_1391/MUL_f32_f32_1382_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1383_to_assign_stmt_1391/MUL_f32_f32_1382_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1383_to_assign_stmt_1391/type_cast_1386_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1383_to_assign_stmt_1391/R_phitmp4_1385_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1383_to_assign_stmt_1391/R_phitmp4_1385_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1383_to_assign_stmt_1391/R_phitmp4_1385_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1383_to_assign_stmt_1391/R_phitmp4_1385_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1383_to_assign_stmt_1391/type_cast_1386_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1383_to_assign_stmt_1391/type_cast_1386_Sample/rr
      -- 
    ca_5026_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f32_f32_1382_inst_ack_1, ack => cp_elements(166)); -- 
    rr_5038_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(166), ack => type_cast_1386_inst_req_0); -- 
    -- CP-element group 167 transition  output  bypass 
    -- predecessors 162 
    -- successors 169 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1383_to_assign_stmt_1391/type_cast_1386_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1383_to_assign_stmt_1391/type_cast_1386_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1383_to_assign_stmt_1391/type_cast_1386_Update/cr
      -- 
    cp_elements(167) <= cp_elements(162);
    cr_5043_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(167), ack => type_cast_1386_inst_req_1); -- 
    -- CP-element group 168 transition  input  bypass 
    -- predecessors 166 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1383_to_assign_stmt_1391/type_cast_1386_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1383_to_assign_stmt_1391/type_cast_1386_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1383_to_assign_stmt_1391/type_cast_1386_Sample/ra
      -- 
    ra_5039_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1386_inst_ack_0, ack => cp_elements(168)); -- 
    -- CP-element group 169 transition  input  output  bypass 
    -- predecessors 167 
    -- successors 171 
    -- members (10) 
      -- 	branch_block_stmt_1166/assign_stmt_1383_to_assign_stmt_1391/type_cast_1386_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1383_to_assign_stmt_1391/type_cast_1386_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1383_to_assign_stmt_1391/type_cast_1386_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1383_to_assign_stmt_1391/type_cast_1390_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1383_to_assign_stmt_1391/R_phitmp5_1389_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1383_to_assign_stmt_1391/R_phitmp5_1389_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1383_to_assign_stmt_1391/R_phitmp5_1389_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1383_to_assign_stmt_1391/R_phitmp5_1389_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1383_to_assign_stmt_1391/type_cast_1390_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1383_to_assign_stmt_1391/type_cast_1390_Sample/rr
      -- 
    ca_5044_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1386_inst_ack_1, ack => cp_elements(169)); -- 
    rr_5056_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(169), ack => type_cast_1390_inst_req_0); -- 
    -- CP-element group 170 transition  output  bypass 
    -- predecessors 162 
    -- successors 172 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1383_to_assign_stmt_1391/type_cast_1390_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1383_to_assign_stmt_1391/type_cast_1390_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1383_to_assign_stmt_1391/type_cast_1390_Update/cr
      -- 
    cp_elements(170) <= cp_elements(162);
    cr_5061_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(170), ack => type_cast_1390_inst_req_1); -- 
    -- CP-element group 171 transition  input  bypass 
    -- predecessors 169 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1383_to_assign_stmt_1391/type_cast_1390_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1383_to_assign_stmt_1391/type_cast_1390_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1383_to_assign_stmt_1391/type_cast_1390_Sample/ra
      -- 
    ra_5057_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1390_inst_ack_0, ack => cp_elements(171)); -- 
    -- CP-element group 172 fork  transition  place  input  bypass 
    -- predecessors 170 
    -- successors 736 738 
    -- members (11) 
      -- 	branch_block_stmt_1166/assign_stmt_1383_to_assign_stmt_1391__exit__
      -- 	branch_block_stmt_1166/bb_10_bb_11
      -- 	branch_block_stmt_1166/assign_stmt_1383_to_assign_stmt_1391/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1383_to_assign_stmt_1391/type_cast_1390_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1383_to_assign_stmt_1391/type_cast_1390_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1383_to_assign_stmt_1391/type_cast_1390_Update/ca
      -- 	branch_block_stmt_1166/bb_10_bb_11_PhiReq/phi_stmt_1394/phi_stmt_1394_sources/type_cast_1397/SplitProtocol/$entry
      -- 	branch_block_stmt_1166/bb_10_bb_11_PhiReq/phi_stmt_1394/phi_stmt_1394_sources/type_cast_1397/$entry
      -- 	branch_block_stmt_1166/bb_10_bb_11_PhiReq/phi_stmt_1394/phi_stmt_1394_sources/$entry
      -- 	branch_block_stmt_1166/bb_10_bb_11_PhiReq/phi_stmt_1394/$entry
      -- 	branch_block_stmt_1166/bb_10_bb_11_PhiReq/$entry
      -- 
    ca_5062_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1390_inst_ack_1, ack => cp_elements(172)); -- 
    -- CP-element group 173 fork  transition  bypass 
    -- predecessors 749 
    -- successors 174 175 178 
    -- members (1) 
      -- 	branch_block_stmt_1166/assign_stmt_1408_to_assign_stmt_1414/$entry
      -- 
    cp_elements(173) <= cp_elements(749);
    -- CP-element group 174 transition  output  bypass 
    -- predecessors 173 
    -- successors 177 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1408_to_assign_stmt_1414/type_cast_1407_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1408_to_assign_stmt_1414/type_cast_1407_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1408_to_assign_stmt_1414/type_cast_1407_Update/cr
      -- 
    cp_elements(174) <= cp_elements(173);
    cr_5082_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(174), ack => type_cast_1407_inst_req_1); -- 
    -- CP-element group 175 transition  output  bypass 
    -- predecessors 173 
    -- successors 176 
    -- members (7) 
      -- 	branch_block_stmt_1166/assign_stmt_1408_to_assign_stmt_1414/type_cast_1407_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1408_to_assign_stmt_1414/R_speed_refx_x0_1406_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1408_to_assign_stmt_1414/R_speed_refx_x0_1406_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1408_to_assign_stmt_1414/R_speed_refx_x0_1406_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1408_to_assign_stmt_1414/R_speed_refx_x0_1406_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1408_to_assign_stmt_1414/type_cast_1407_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1408_to_assign_stmt_1414/type_cast_1407_Sample/rr
      -- 
    cp_elements(175) <= cp_elements(173);
    rr_5077_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(175), ack => type_cast_1407_inst_req_0); -- 
    -- CP-element group 176 transition  input  bypass 
    -- predecessors 175 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1408_to_assign_stmt_1414/type_cast_1407_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1408_to_assign_stmt_1414/type_cast_1407_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1408_to_assign_stmt_1414/type_cast_1407_Sample/ra
      -- 
    ra_5078_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1407_inst_ack_0, ack => cp_elements(176)); -- 
    -- CP-element group 177 transition  input  output  bypass 
    -- predecessors 174 
    -- successors 179 
    -- members (10) 
      -- 	branch_block_stmt_1166/assign_stmt_1408_to_assign_stmt_1414/type_cast_1407_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1408_to_assign_stmt_1414/type_cast_1407_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1408_to_assign_stmt_1414/type_cast_1407_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1408_to_assign_stmt_1414/SGT_f64_u1_1413_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1408_to_assign_stmt_1414/R_iNsTr_32_1410_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1408_to_assign_stmt_1414/R_iNsTr_32_1410_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1408_to_assign_stmt_1414/R_iNsTr_32_1410_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1408_to_assign_stmt_1414/R_iNsTr_32_1410_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1408_to_assign_stmt_1414/SGT_f64_u1_1413_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1408_to_assign_stmt_1414/SGT_f64_u1_1413_Sample/rr
      -- 
    ca_5083_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1407_inst_ack_1, ack => cp_elements(177)); -- 
    rr_5095_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(177), ack => SGT_f64_u1_1413_inst_req_0); -- 
    -- CP-element group 178 transition  output  bypass 
    -- predecessors 173 
    -- successors 180 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1408_to_assign_stmt_1414/SGT_f64_u1_1413_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1408_to_assign_stmt_1414/SGT_f64_u1_1413_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1408_to_assign_stmt_1414/SGT_f64_u1_1413_Update/cr
      -- 
    cp_elements(178) <= cp_elements(173);
    cr_5100_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(178), ack => SGT_f64_u1_1413_inst_req_1); -- 
    -- CP-element group 179 transition  input  bypass 
    -- predecessors 177 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1408_to_assign_stmt_1414/SGT_f64_u1_1413_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1408_to_assign_stmt_1414/SGT_f64_u1_1413_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1408_to_assign_stmt_1414/SGT_f64_u1_1413_Sample/ra
      -- 
    ra_5096_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => SGT_f64_u1_1413_inst_ack_0, ack => cp_elements(179)); -- 
    -- CP-element group 180 branch  transition  place  input  bypass 
    -- predecessors 178 
    -- successors 181 182 
    -- members (6) 
      -- 	branch_block_stmt_1166/assign_stmt_1408_to_assign_stmt_1414__exit__
      -- 	branch_block_stmt_1166/if_stmt_1415__entry__
      -- 	branch_block_stmt_1166/assign_stmt_1408_to_assign_stmt_1414/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1408_to_assign_stmt_1414/SGT_f64_u1_1413_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1408_to_assign_stmt_1414/SGT_f64_u1_1413_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1408_to_assign_stmt_1414/SGT_f64_u1_1413_Update/ca
      -- 
    ca_5101_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => SGT_f64_u1_1413_inst_ack_1, ack => cp_elements(180)); -- 
    -- CP-element group 181 transition  place  dead  bypass 
    -- predecessors 180 
    -- successors 9 
    -- members (8) 
      -- 	branch_block_stmt_1166/if_stmt_1415__exit__
      -- 	branch_block_stmt_1166/merge_stmt_1421__entry__
      -- 	branch_block_stmt_1166/if_stmt_1415_dead_link/$entry
      -- 	branch_block_stmt_1166/if_stmt_1415_dead_link/$exit
      -- 	branch_block_stmt_1166/if_stmt_1415_dead_link/dead_transition
      -- 	branch_block_stmt_1166/merge_stmt_1421_dead_link/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1421_dead_link/dead_transition
      -- 	branch_block_stmt_1166/merge_stmt_1421_dead_link/$entry
      -- 
    cp_elements(181) <= false;
    -- CP-element group 182 transition  output  bypass 
    -- predecessors 180 
    -- successors 183 
    -- members (3) 
      -- 	branch_block_stmt_1166/if_stmt_1415_eval_test/$entry
      -- 	branch_block_stmt_1166/if_stmt_1415_eval_test/$exit
      -- 	branch_block_stmt_1166/if_stmt_1415_eval_test/branch_req
      -- 
    cp_elements(182) <= cp_elements(180);
    branch_req_5109_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(182), ack => if_stmt_1415_branch_req_0); -- 
    -- CP-element group 183 branch  place  bypass 
    -- predecessors 182 
    -- successors 184 186 
    -- members (1) 
      -- 	branch_block_stmt_1166/R_iNsTr_33_1416_place
      -- 
    cp_elements(183) <= cp_elements(182);
    -- CP-element group 184 transition  bypass 
    -- predecessors 183 
    -- successors 185 
    -- members (1) 
      -- 	branch_block_stmt_1166/if_stmt_1415_if_link/$entry
      -- 
    cp_elements(184) <= cp_elements(183);
    -- CP-element group 185 transition  place  input  bypass 
    -- predecessors 184 
    -- successors 9 
    -- members (9) 
      -- 	branch_block_stmt_1166/bb_11_bb_12
      -- 	branch_block_stmt_1166/if_stmt_1415_if_link/$exit
      -- 	branch_block_stmt_1166/if_stmt_1415_if_link/if_choice_transition
      -- 	branch_block_stmt_1166/merge_stmt_1421_PhiAck/$entry
      -- 	branch_block_stmt_1166/bb_11_bb_12_PhiReq/$entry
      -- 	branch_block_stmt_1166/merge_stmt_1421_PhiAck/dummy
      -- 	branch_block_stmt_1166/merge_stmt_1421_PhiAck/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1421_PhiReqMerge
      -- 	branch_block_stmt_1166/bb_11_bb_12_PhiReq/$exit
      -- 
    if_choice_transition_5114_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_1415_branch_ack_1, ack => cp_elements(185)); -- 
    -- CP-element group 186 transition  bypass 
    -- predecessors 183 
    -- successors 187 
    -- members (1) 
      -- 	branch_block_stmt_1166/if_stmt_1415_else_link/$entry
      -- 
    cp_elements(186) <= cp_elements(183);
    -- CP-element group 187 fork  transition  place  input  bypass 
    -- predecessors 186 
    -- successors 750 754 758 
    -- members (6) 
      -- 	branch_block_stmt_1166/bb_11_bb_17
      -- 	branch_block_stmt_1166/if_stmt_1415_else_link/$exit
      -- 	branch_block_stmt_1166/if_stmt_1415_else_link/else_choice_transition
      -- 	branch_block_stmt_1166/bb_11_bb_17_PhiReq/$entry
      -- 	branch_block_stmt_1166/bb_11_bb_17_PhiReq/phi_stmt_1508/$entry
      -- 	branch_block_stmt_1166/bb_11_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/$entry
      -- 
    else_choice_transition_5118_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_1415_branch_ack_0, ack => cp_elements(187)); -- 
    -- CP-element group 188 fork  transition  bypass 
    -- predecessors 9 
    -- successors 189 190 
    -- members (1) 
      -- 	branch_block_stmt_1166/assign_stmt_1427/$entry
      -- 
    cp_elements(188) <= cp_elements(9);
    -- CP-element group 189 transition  output  bypass 
    -- predecessors 188 
    -- successors 192 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1427/SGT_f64_u1_1426_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1427/SGT_f64_u1_1426_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1427/SGT_f64_u1_1426_Update/cr
      -- 
    cp_elements(189) <= cp_elements(188);
    cr_5140_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(189), ack => SGT_f64_u1_1426_inst_req_1); -- 
    -- CP-element group 190 transition  output  bypass 
    -- predecessors 188 
    -- successors 191 
    -- members (7) 
      -- 	branch_block_stmt_1166/assign_stmt_1427/SGT_f64_u1_1426_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1427/R_iNsTr_32_1423_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1427/R_iNsTr_32_1423_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1427/R_iNsTr_32_1423_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1427/R_iNsTr_32_1423_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1427/SGT_f64_u1_1426_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1427/SGT_f64_u1_1426_Sample/rr
      -- 
    cp_elements(190) <= cp_elements(188);
    rr_5135_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(190), ack => SGT_f64_u1_1426_inst_req_0); -- 
    -- CP-element group 191 transition  input  bypass 
    -- predecessors 190 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1427/SGT_f64_u1_1426_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1427/SGT_f64_u1_1426_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1427/SGT_f64_u1_1426_Sample/ra
      -- 
    ra_5136_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => SGT_f64_u1_1426_inst_ack_0, ack => cp_elements(191)); -- 
    -- CP-element group 192 branch  transition  place  input  bypass 
    -- predecessors 189 
    -- successors 193 194 
    -- members (6) 
      -- 	branch_block_stmt_1166/assign_stmt_1427__exit__
      -- 	branch_block_stmt_1166/if_stmt_1428__entry__
      -- 	branch_block_stmt_1166/assign_stmt_1427/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1427/SGT_f64_u1_1426_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1427/SGT_f64_u1_1426_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1427/SGT_f64_u1_1426_Update/ca
      -- 
    ca_5141_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => SGT_f64_u1_1426_inst_ack_1, ack => cp_elements(192)); -- 
    -- CP-element group 193 transition  place  dead  bypass 
    -- predecessors 192 
    -- successors 10 
    -- members (8) 
      -- 	branch_block_stmt_1166/if_stmt_1428__exit__
      -- 	branch_block_stmt_1166/merge_stmt_1434__entry__
      -- 	branch_block_stmt_1166/if_stmt_1428_dead_link/$entry
      -- 	branch_block_stmt_1166/if_stmt_1428_dead_link/$exit
      -- 	branch_block_stmt_1166/if_stmt_1428_dead_link/dead_transition
      -- 	branch_block_stmt_1166/merge_stmt_1434_dead_link/dead_transition
      -- 	branch_block_stmt_1166/merge_stmt_1434_dead_link/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1434_dead_link/$entry
      -- 
    cp_elements(193) <= false;
    -- CP-element group 194 transition  output  bypass 
    -- predecessors 192 
    -- successors 195 
    -- members (3) 
      -- 	branch_block_stmt_1166/if_stmt_1428_eval_test/$entry
      -- 	branch_block_stmt_1166/if_stmt_1428_eval_test/$exit
      -- 	branch_block_stmt_1166/if_stmt_1428_eval_test/branch_req
      -- 
    cp_elements(194) <= cp_elements(192);
    branch_req_5149_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(194), ack => if_stmt_1428_branch_req_0); -- 
    -- CP-element group 195 branch  place  bypass 
    -- predecessors 194 
    -- successors 196 198 
    -- members (1) 
      -- 	branch_block_stmt_1166/R_iNsTr_38_1429_place
      -- 
    cp_elements(195) <= cp_elements(194);
    -- CP-element group 196 transition  bypass 
    -- predecessors 195 
    -- successors 197 
    -- members (1) 
      -- 	branch_block_stmt_1166/if_stmt_1428_if_link/$entry
      -- 
    cp_elements(196) <= cp_elements(195);
    -- CP-element group 197 transition  place  input  bypass 
    -- predecessors 196 
    -- successors 211 
    -- members (11) 
      -- 	branch_block_stmt_1166/merge_stmt_1454__exit__
      -- 	branch_block_stmt_1166/assign_stmt_1460__entry__
      -- 	branch_block_stmt_1166/if_stmt_1428_if_link/$exit
      -- 	branch_block_stmt_1166/if_stmt_1428_if_link/if_choice_transition
      -- 	branch_block_stmt_1166/bb_12_bb_14
      -- 	branch_block_stmt_1166/merge_stmt_1454_PhiAck/$entry
      -- 	branch_block_stmt_1166/bb_12_bb_14_PhiReq/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1454_PhiAck/dummy
      -- 	branch_block_stmt_1166/merge_stmt_1454_PhiReqMerge
      -- 	branch_block_stmt_1166/merge_stmt_1454_PhiAck/$exit
      -- 	branch_block_stmt_1166/bb_12_bb_14_PhiReq/$entry
      -- 
    if_choice_transition_5154_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_1428_branch_ack_1, ack => cp_elements(197)); -- 
    -- CP-element group 198 transition  bypass 
    -- predecessors 195 
    -- successors 199 
    -- members (1) 
      -- 	branch_block_stmt_1166/if_stmt_1428_else_link/$entry
      -- 
    cp_elements(198) <= cp_elements(195);
    -- CP-element group 199 transition  place  input  bypass 
    -- predecessors 198 
    -- successors 10 
    -- members (9) 
      -- 	branch_block_stmt_1166/if_stmt_1428_else_link/$exit
      -- 	branch_block_stmt_1166/if_stmt_1428_else_link/else_choice_transition
      -- 	branch_block_stmt_1166/bb_12_bb_13
      -- 	branch_block_stmt_1166/bb_12_bb_13_PhiReq/$entry
      -- 	branch_block_stmt_1166/bb_12_bb_13_PhiReq/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1434_PhiAck/$entry
      -- 	branch_block_stmt_1166/merge_stmt_1434_PhiAck/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1434_PhiAck/dummy
      -- 	branch_block_stmt_1166/merge_stmt_1434_PhiReqMerge
      -- 
    else_choice_transition_5158_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_1428_branch_ack_0, ack => cp_elements(199)); -- 
    -- CP-element group 200 fork  transition  bypass 
    -- predecessors 10 
    -- successors 201 202 205 208 
    -- members (1) 
      -- 	branch_block_stmt_1166/assign_stmt_1440_to_assign_stmt_1452/$entry
      -- 
    cp_elements(200) <= cp_elements(10);
    -- CP-element group 201 transition  output  bypass 
    -- predecessors 200 
    -- successors 204 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1440_to_assign_stmt_1452/MUL_f32_f32_1439_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1440_to_assign_stmt_1452/MUL_f32_f32_1439_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1440_to_assign_stmt_1452/MUL_f32_f32_1439_Update/cr
      -- 
    cp_elements(201) <= cp_elements(200);
    cr_5180_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(201), ack => MUL_f32_f32_1439_inst_req_1); -- 
    -- CP-element group 202 transition  output  bypass 
    -- predecessors 200 
    -- successors 203 
    -- members (7) 
      -- 	branch_block_stmt_1166/assign_stmt_1440_to_assign_stmt_1452/MUL_f32_f32_1439_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1440_to_assign_stmt_1452/R_speed_refx_x0_1436_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1440_to_assign_stmt_1452/R_speed_refx_x0_1436_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1440_to_assign_stmt_1452/R_speed_refx_x0_1436_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1440_to_assign_stmt_1452/R_speed_refx_x0_1436_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1440_to_assign_stmt_1452/MUL_f32_f32_1439_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1440_to_assign_stmt_1452/MUL_f32_f32_1439_Sample/rr
      -- 
    cp_elements(202) <= cp_elements(200);
    rr_5175_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(202), ack => MUL_f32_f32_1439_inst_req_0); -- 
    -- CP-element group 203 transition  input  bypass 
    -- predecessors 202 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1440_to_assign_stmt_1452/MUL_f32_f32_1439_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1440_to_assign_stmt_1452/MUL_f32_f32_1439_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1440_to_assign_stmt_1452/MUL_f32_f32_1439_Sample/ra
      -- 
    ra_5176_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f32_f32_1439_inst_ack_0, ack => cp_elements(203)); -- 
    -- CP-element group 204 transition  input  output  bypass 
    -- predecessors 201 
    -- successors 206 
    -- members (10) 
      -- 	branch_block_stmt_1166/assign_stmt_1440_to_assign_stmt_1452/MUL_f32_f32_1439_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1440_to_assign_stmt_1452/MUL_f32_f32_1439_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1440_to_assign_stmt_1452/MUL_f32_f32_1439_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1440_to_assign_stmt_1452/ADD_f32_f32_1445_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1440_to_assign_stmt_1452/R_iNsTr_52_1442_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1440_to_assign_stmt_1452/R_iNsTr_52_1442_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1440_to_assign_stmt_1452/R_iNsTr_52_1442_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1440_to_assign_stmt_1452/R_iNsTr_52_1442_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1440_to_assign_stmt_1452/ADD_f32_f32_1445_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1440_to_assign_stmt_1452/ADD_f32_f32_1445_Sample/rr
      -- 
    ca_5181_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f32_f32_1439_inst_ack_1, ack => cp_elements(204)); -- 
    rr_5193_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(204), ack => ADD_f32_f32_1445_inst_req_0); -- 
    -- CP-element group 205 transition  output  bypass 
    -- predecessors 200 
    -- successors 207 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1440_to_assign_stmt_1452/ADD_f32_f32_1445_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1440_to_assign_stmt_1452/ADD_f32_f32_1445_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1440_to_assign_stmt_1452/ADD_f32_f32_1445_Update/cr
      -- 
    cp_elements(205) <= cp_elements(200);
    cr_5198_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(205), ack => ADD_f32_f32_1445_inst_req_1); -- 
    -- CP-element group 206 transition  input  bypass 
    -- predecessors 204 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1440_to_assign_stmt_1452/ADD_f32_f32_1445_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1440_to_assign_stmt_1452/ADD_f32_f32_1445_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1440_to_assign_stmt_1452/ADD_f32_f32_1445_Sample/ra
      -- 
    ra_5194_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ADD_f32_f32_1445_inst_ack_0, ack => cp_elements(206)); -- 
    -- CP-element group 207 transition  input  output  bypass 
    -- predecessors 205 
    -- successors 209 
    -- members (10) 
      -- 	branch_block_stmt_1166/assign_stmt_1440_to_assign_stmt_1452/ADD_f32_f32_1445_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1440_to_assign_stmt_1452/ADD_f32_f32_1445_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1440_to_assign_stmt_1452/ADD_f32_f32_1445_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1440_to_assign_stmt_1452/MUL_f32_f32_1451_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1440_to_assign_stmt_1452/R_iNsTr_53_1448_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1440_to_assign_stmt_1452/R_iNsTr_53_1448_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1440_to_assign_stmt_1452/R_iNsTr_53_1448_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1440_to_assign_stmt_1452/R_iNsTr_53_1448_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1440_to_assign_stmt_1452/MUL_f32_f32_1451_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1440_to_assign_stmt_1452/MUL_f32_f32_1451_Sample/rr
      -- 
    ca_5199_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ADD_f32_f32_1445_inst_ack_1, ack => cp_elements(207)); -- 
    rr_5211_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(207), ack => MUL_f32_f32_1451_inst_req_0); -- 
    -- CP-element group 208 transition  output  bypass 
    -- predecessors 200 
    -- successors 210 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1440_to_assign_stmt_1452/MUL_f32_f32_1451_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1440_to_assign_stmt_1452/MUL_f32_f32_1451_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1440_to_assign_stmt_1452/MUL_f32_f32_1451_Update/cr
      -- 
    cp_elements(208) <= cp_elements(200);
    cr_5216_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(208), ack => MUL_f32_f32_1451_inst_req_1); -- 
    -- CP-element group 209 transition  input  bypass 
    -- predecessors 207 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1440_to_assign_stmt_1452/MUL_f32_f32_1451_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1440_to_assign_stmt_1452/MUL_f32_f32_1451_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1440_to_assign_stmt_1452/MUL_f32_f32_1451_Sample/ra
      -- 
    ra_5212_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f32_f32_1451_inst_ack_0, ack => cp_elements(209)); -- 
    -- CP-element group 210 fork  transition  place  input  bypass 
    -- predecessors 208 
    -- successors 763 769 773 
    -- members (9) 
      -- 	branch_block_stmt_1166/assign_stmt_1440_to_assign_stmt_1452__exit__
      -- 	branch_block_stmt_1166/bb_13_bb_17
      -- 	branch_block_stmt_1166/assign_stmt_1440_to_assign_stmt_1452/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1440_to_assign_stmt_1452/MUL_f32_f32_1451_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1440_to_assign_stmt_1452/MUL_f32_f32_1451_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1440_to_assign_stmt_1452/MUL_f32_f32_1451_Update/ca
      -- 	branch_block_stmt_1166/bb_13_bb_17_PhiReq/$entry
      -- 	branch_block_stmt_1166/bb_13_bb_17_PhiReq/phi_stmt_1508/$entry
      -- 	branch_block_stmt_1166/bb_13_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/$entry
      -- 
    ca_5217_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f32_f32_1451_inst_ack_1, ack => cp_elements(210)); -- 
    -- CP-element group 211 fork  transition  bypass 
    -- predecessors 197 
    -- successors 212 213 
    -- members (1) 
      -- 	branch_block_stmt_1166/assign_stmt_1460/$entry
      -- 
    cp_elements(211) <= cp_elements(197);
    -- CP-element group 212 transition  output  bypass 
    -- predecessors 211 
    -- successors 215 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1460/SGT_f64_u1_1459_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1460/SGT_f64_u1_1459_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1460/SGT_f64_u1_1459_Update/cr
      -- 
    cp_elements(212) <= cp_elements(211);
    cr_5237_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(212), ack => SGT_f64_u1_1459_inst_req_1); -- 
    -- CP-element group 213 transition  output  bypass 
    -- predecessors 211 
    -- successors 214 
    -- members (7) 
      -- 	branch_block_stmt_1166/assign_stmt_1460/SGT_f64_u1_1459_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1460/R_iNsTr_32_1456_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1460/R_iNsTr_32_1456_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1460/R_iNsTr_32_1456_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1460/R_iNsTr_32_1456_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1460/SGT_f64_u1_1459_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1460/SGT_f64_u1_1459_Sample/rr
      -- 
    cp_elements(213) <= cp_elements(211);
    rr_5232_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(213), ack => SGT_f64_u1_1459_inst_req_0); -- 
    -- CP-element group 214 transition  input  bypass 
    -- predecessors 213 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1460/SGT_f64_u1_1459_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1460/SGT_f64_u1_1459_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1460/SGT_f64_u1_1459_Sample/ra
      -- 
    ra_5233_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => SGT_f64_u1_1459_inst_ack_0, ack => cp_elements(214)); -- 
    -- CP-element group 215 branch  transition  place  input  bypass 
    -- predecessors 212 
    -- successors 216 217 
    -- members (6) 
      -- 	branch_block_stmt_1166/assign_stmt_1460__exit__
      -- 	branch_block_stmt_1166/if_stmt_1461__entry__
      -- 	branch_block_stmt_1166/assign_stmt_1460/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1460/SGT_f64_u1_1459_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1460/SGT_f64_u1_1459_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1460/SGT_f64_u1_1459_Update/ca
      -- 
    ca_5238_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => SGT_f64_u1_1459_inst_ack_1, ack => cp_elements(215)); -- 
    -- CP-element group 216 transition  place  dead  bypass 
    -- predecessors 215 
    -- successors 11 
    -- members (8) 
      -- 	branch_block_stmt_1166/if_stmt_1461__exit__
      -- 	branch_block_stmt_1166/merge_stmt_1467__entry__
      -- 	branch_block_stmt_1166/if_stmt_1461_dead_link/$entry
      -- 	branch_block_stmt_1166/if_stmt_1461_dead_link/$exit
      -- 	branch_block_stmt_1166/if_stmt_1461_dead_link/dead_transition
      -- 	branch_block_stmt_1166/merge_stmt_1467_dead_link/dead_transition
      -- 	branch_block_stmt_1166/merge_stmt_1467_dead_link/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1467_dead_link/$entry
      -- 
    cp_elements(216) <= false;
    -- CP-element group 217 transition  output  bypass 
    -- predecessors 215 
    -- successors 218 
    -- members (3) 
      -- 	branch_block_stmt_1166/if_stmt_1461_eval_test/$entry
      -- 	branch_block_stmt_1166/if_stmt_1461_eval_test/$exit
      -- 	branch_block_stmt_1166/if_stmt_1461_eval_test/branch_req
      -- 
    cp_elements(217) <= cp_elements(215);
    branch_req_5246_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(217), ack => if_stmt_1461_branch_req_0); -- 
    -- CP-element group 218 branch  place  bypass 
    -- predecessors 217 
    -- successors 219 221 
    -- members (1) 
      -- 	branch_block_stmt_1166/R_iNsTr_50_1462_place
      -- 
    cp_elements(218) <= cp_elements(217);
    -- CP-element group 219 transition  bypass 
    -- predecessors 218 
    -- successors 220 
    -- members (1) 
      -- 	branch_block_stmt_1166/if_stmt_1461_if_link/$entry
      -- 
    cp_elements(219) <= cp_elements(218);
    -- CP-element group 220 transition  place  input  bypass 
    -- predecessors 219 
    -- successors 234 
    -- members (11) 
      -- 	branch_block_stmt_1166/merge_stmt_1487__exit__
      -- 	branch_block_stmt_1166/assign_stmt_1493_to_assign_stmt_1505__entry__
      -- 	branch_block_stmt_1166/if_stmt_1461_if_link/$exit
      -- 	branch_block_stmt_1166/if_stmt_1461_if_link/if_choice_transition
      -- 	branch_block_stmt_1166/bb_14_bb_16
      -- 	branch_block_stmt_1166/merge_stmt_1487_PhiReqMerge
      -- 	branch_block_stmt_1166/bb_14_bb_16_PhiReq/$entry
      -- 	branch_block_stmt_1166/bb_14_bb_16_PhiReq/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1487_PhiAck/$entry
      -- 	branch_block_stmt_1166/merge_stmt_1487_PhiAck/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1487_PhiAck/dummy
      -- 
    if_choice_transition_5251_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_1461_branch_ack_1, ack => cp_elements(220)); -- 
    -- CP-element group 221 transition  bypass 
    -- predecessors 218 
    -- successors 222 
    -- members (1) 
      -- 	branch_block_stmt_1166/if_stmt_1461_else_link/$entry
      -- 
    cp_elements(221) <= cp_elements(218);
    -- CP-element group 222 transition  place  input  bypass 
    -- predecessors 221 
    -- successors 11 
    -- members (9) 
      -- 	branch_block_stmt_1166/if_stmt_1461_else_link/$exit
      -- 	branch_block_stmt_1166/if_stmt_1461_else_link/else_choice_transition
      -- 	branch_block_stmt_1166/bb_14_bb_15
      -- 	branch_block_stmt_1166/merge_stmt_1467_PhiAck/$entry
      -- 	branch_block_stmt_1166/bb_14_bb_15_PhiReq/$entry
      -- 	branch_block_stmt_1166/bb_14_bb_15_PhiReq/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1467_PhiReqMerge
      -- 	branch_block_stmt_1166/merge_stmt_1467_PhiAck/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1467_PhiAck/dummy
      -- 
    else_choice_transition_5255_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_1461_branch_ack_0, ack => cp_elements(222)); -- 
    -- CP-element group 223 fork  transition  bypass 
    -- predecessors 11 
    -- successors 224 225 228 231 
    -- members (1) 
      -- 	branch_block_stmt_1166/assign_stmt_1473_to_assign_stmt_1485/$entry
      -- 
    cp_elements(223) <= cp_elements(11);
    -- CP-element group 224 transition  output  bypass 
    -- predecessors 223 
    -- successors 227 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1473_to_assign_stmt_1485/MUL_f32_f32_1472_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1473_to_assign_stmt_1485/MUL_f32_f32_1472_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1473_to_assign_stmt_1485/MUL_f32_f32_1472_Update/cr
      -- 
    cp_elements(224) <= cp_elements(223);
    cr_5277_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(224), ack => MUL_f32_f32_1472_inst_req_1); -- 
    -- CP-element group 225 transition  output  bypass 
    -- predecessors 223 
    -- successors 226 
    -- members (7) 
      -- 	branch_block_stmt_1166/assign_stmt_1473_to_assign_stmt_1485/MUL_f32_f32_1472_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1473_to_assign_stmt_1485/R_speed_refx_x0_1469_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1473_to_assign_stmt_1485/R_speed_refx_x0_1469_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1473_to_assign_stmt_1485/R_speed_refx_x0_1469_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1473_to_assign_stmt_1485/R_speed_refx_x0_1469_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1473_to_assign_stmt_1485/MUL_f32_f32_1472_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1473_to_assign_stmt_1485/MUL_f32_f32_1472_Sample/rr
      -- 
    cp_elements(225) <= cp_elements(223);
    rr_5272_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(225), ack => MUL_f32_f32_1472_inst_req_0); -- 
    -- CP-element group 226 transition  input  bypass 
    -- predecessors 225 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1473_to_assign_stmt_1485/MUL_f32_f32_1472_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1473_to_assign_stmt_1485/MUL_f32_f32_1472_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1473_to_assign_stmt_1485/MUL_f32_f32_1472_Sample/ra
      -- 
    ra_5273_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f32_f32_1472_inst_ack_0, ack => cp_elements(226)); -- 
    -- CP-element group 227 transition  input  output  bypass 
    -- predecessors 224 
    -- successors 229 
    -- members (10) 
      -- 	branch_block_stmt_1166/assign_stmt_1473_to_assign_stmt_1485/MUL_f32_f32_1472_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1473_to_assign_stmt_1485/MUL_f32_f32_1472_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1473_to_assign_stmt_1485/MUL_f32_f32_1472_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1473_to_assign_stmt_1485/ADD_f32_f32_1478_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1473_to_assign_stmt_1485/R_iNsTr_79_1475_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1473_to_assign_stmt_1485/R_iNsTr_79_1475_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1473_to_assign_stmt_1485/R_iNsTr_79_1475_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1473_to_assign_stmt_1485/R_iNsTr_79_1475_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1473_to_assign_stmt_1485/ADD_f32_f32_1478_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1473_to_assign_stmt_1485/ADD_f32_f32_1478_Sample/rr
      -- 
    ca_5278_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f32_f32_1472_inst_ack_1, ack => cp_elements(227)); -- 
    rr_5290_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(227), ack => ADD_f32_f32_1478_inst_req_0); -- 
    -- CP-element group 228 transition  output  bypass 
    -- predecessors 223 
    -- successors 230 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1473_to_assign_stmt_1485/ADD_f32_f32_1478_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1473_to_assign_stmt_1485/ADD_f32_f32_1478_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1473_to_assign_stmt_1485/ADD_f32_f32_1478_Update/cr
      -- 
    cp_elements(228) <= cp_elements(223);
    cr_5295_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(228), ack => ADD_f32_f32_1478_inst_req_1); -- 
    -- CP-element group 229 transition  input  bypass 
    -- predecessors 227 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1473_to_assign_stmt_1485/ADD_f32_f32_1478_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1473_to_assign_stmt_1485/ADD_f32_f32_1478_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1473_to_assign_stmt_1485/ADD_f32_f32_1478_Sample/ra
      -- 
    ra_5291_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ADD_f32_f32_1478_inst_ack_0, ack => cp_elements(229)); -- 
    -- CP-element group 230 transition  input  output  bypass 
    -- predecessors 228 
    -- successors 232 
    -- members (10) 
      -- 	branch_block_stmt_1166/assign_stmt_1473_to_assign_stmt_1485/ADD_f32_f32_1478_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1473_to_assign_stmt_1485/ADD_f32_f32_1478_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1473_to_assign_stmt_1485/ADD_f32_f32_1478_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1473_to_assign_stmt_1485/MUL_f32_f32_1484_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1473_to_assign_stmt_1485/R_iNsTr_80_1481_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1473_to_assign_stmt_1485/R_iNsTr_80_1481_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1473_to_assign_stmt_1485/R_iNsTr_80_1481_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1473_to_assign_stmt_1485/R_iNsTr_80_1481_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1473_to_assign_stmt_1485/MUL_f32_f32_1484_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1473_to_assign_stmt_1485/MUL_f32_f32_1484_Sample/rr
      -- 
    ca_5296_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ADD_f32_f32_1478_inst_ack_1, ack => cp_elements(230)); -- 
    rr_5308_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(230), ack => MUL_f32_f32_1484_inst_req_0); -- 
    -- CP-element group 231 transition  output  bypass 
    -- predecessors 223 
    -- successors 233 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1473_to_assign_stmt_1485/MUL_f32_f32_1484_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1473_to_assign_stmt_1485/MUL_f32_f32_1484_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1473_to_assign_stmt_1485/MUL_f32_f32_1484_Update/cr
      -- 
    cp_elements(231) <= cp_elements(223);
    cr_5313_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(231), ack => MUL_f32_f32_1484_inst_req_1); -- 
    -- CP-element group 232 transition  input  bypass 
    -- predecessors 230 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1473_to_assign_stmt_1485/MUL_f32_f32_1484_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1473_to_assign_stmt_1485/MUL_f32_f32_1484_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1473_to_assign_stmt_1485/MUL_f32_f32_1484_Sample/ra
      -- 
    ra_5309_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f32_f32_1484_inst_ack_0, ack => cp_elements(232)); -- 
    -- CP-element group 233 fork  transition  place  input  bypass 
    -- predecessors 231 
    -- successors 778 782 788 
    -- members (9) 
      -- 	branch_block_stmt_1166/assign_stmt_1473_to_assign_stmt_1485__exit__
      -- 	branch_block_stmt_1166/bb_15_bb_17
      -- 	branch_block_stmt_1166/assign_stmt_1473_to_assign_stmt_1485/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1473_to_assign_stmt_1485/MUL_f32_f32_1484_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1473_to_assign_stmt_1485/MUL_f32_f32_1484_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1473_to_assign_stmt_1485/MUL_f32_f32_1484_Update/ca
      -- 	branch_block_stmt_1166/bb_15_bb_17_PhiReq/$entry
      -- 	branch_block_stmt_1166/bb_15_bb_17_PhiReq/phi_stmt_1508/$entry
      -- 	branch_block_stmt_1166/bb_15_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/$entry
      -- 
    ca_5314_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f32_f32_1484_inst_ack_1, ack => cp_elements(233)); -- 
    -- CP-element group 234 fork  transition  bypass 
    -- predecessors 220 
    -- successors 235 236 239 242 
    -- members (1) 
      -- 	branch_block_stmt_1166/assign_stmt_1493_to_assign_stmt_1505/$entry
      -- 
    cp_elements(234) <= cp_elements(220);
    -- CP-element group 235 transition  output  bypass 
    -- predecessors 234 
    -- successors 238 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1493_to_assign_stmt_1505/MUL_f32_f32_1492_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1493_to_assign_stmt_1505/MUL_f32_f32_1492_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1493_to_assign_stmt_1505/MUL_f32_f32_1492_Update/cr
      -- 
    cp_elements(235) <= cp_elements(234);
    cr_5334_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(235), ack => MUL_f32_f32_1492_inst_req_1); -- 
    -- CP-element group 236 transition  output  bypass 
    -- predecessors 234 
    -- successors 237 
    -- members (7) 
      -- 	branch_block_stmt_1166/assign_stmt_1493_to_assign_stmt_1505/MUL_f32_f32_1492_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1493_to_assign_stmt_1505/R_speed_refx_x0_1489_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1493_to_assign_stmt_1505/R_speed_refx_x0_1489_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1493_to_assign_stmt_1505/R_speed_refx_x0_1489_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1493_to_assign_stmt_1505/R_speed_refx_x0_1489_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1493_to_assign_stmt_1505/MUL_f32_f32_1492_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1493_to_assign_stmt_1505/MUL_f32_f32_1492_Sample/rr
      -- 
    cp_elements(236) <= cp_elements(234);
    rr_5329_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(236), ack => MUL_f32_f32_1492_inst_req_0); -- 
    -- CP-element group 237 transition  input  bypass 
    -- predecessors 236 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1493_to_assign_stmt_1505/MUL_f32_f32_1492_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1493_to_assign_stmt_1505/MUL_f32_f32_1492_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1493_to_assign_stmt_1505/MUL_f32_f32_1492_Sample/ra
      -- 
    ra_5330_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f32_f32_1492_inst_ack_0, ack => cp_elements(237)); -- 
    -- CP-element group 238 transition  input  output  bypass 
    -- predecessors 235 
    -- successors 240 
    -- members (10) 
      -- 	branch_block_stmt_1166/assign_stmt_1493_to_assign_stmt_1505/MUL_f32_f32_1492_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1493_to_assign_stmt_1505/MUL_f32_f32_1492_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1493_to_assign_stmt_1505/MUL_f32_f32_1492_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1493_to_assign_stmt_1505/ADD_f32_f32_1498_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1493_to_assign_stmt_1505/R_iNsTr_75_1495_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1493_to_assign_stmt_1505/R_iNsTr_75_1495_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1493_to_assign_stmt_1505/R_iNsTr_75_1495_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1493_to_assign_stmt_1505/R_iNsTr_75_1495_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1493_to_assign_stmt_1505/ADD_f32_f32_1498_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1493_to_assign_stmt_1505/ADD_f32_f32_1498_Sample/rr
      -- 
    ca_5335_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f32_f32_1492_inst_ack_1, ack => cp_elements(238)); -- 
    rr_5347_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(238), ack => ADD_f32_f32_1498_inst_req_0); -- 
    -- CP-element group 239 transition  output  bypass 
    -- predecessors 234 
    -- successors 241 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1493_to_assign_stmt_1505/ADD_f32_f32_1498_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1493_to_assign_stmt_1505/ADD_f32_f32_1498_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1493_to_assign_stmt_1505/ADD_f32_f32_1498_Update/cr
      -- 
    cp_elements(239) <= cp_elements(234);
    cr_5352_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(239), ack => ADD_f32_f32_1498_inst_req_1); -- 
    -- CP-element group 240 transition  input  bypass 
    -- predecessors 238 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1493_to_assign_stmt_1505/ADD_f32_f32_1498_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1493_to_assign_stmt_1505/ADD_f32_f32_1498_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1493_to_assign_stmt_1505/ADD_f32_f32_1498_Sample/ra
      -- 
    ra_5348_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ADD_f32_f32_1498_inst_ack_0, ack => cp_elements(240)); -- 
    -- CP-element group 241 transition  input  output  bypass 
    -- predecessors 239 
    -- successors 243 
    -- members (10) 
      -- 	branch_block_stmt_1166/assign_stmt_1493_to_assign_stmt_1505/ADD_f32_f32_1498_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1493_to_assign_stmt_1505/ADD_f32_f32_1498_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1493_to_assign_stmt_1505/ADD_f32_f32_1498_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1493_to_assign_stmt_1505/MUL_f32_f32_1504_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1493_to_assign_stmt_1505/R_iNsTr_76_1501_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1493_to_assign_stmt_1505/R_iNsTr_76_1501_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1493_to_assign_stmt_1505/R_iNsTr_76_1501_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1493_to_assign_stmt_1505/R_iNsTr_76_1501_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1493_to_assign_stmt_1505/MUL_f32_f32_1504_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1493_to_assign_stmt_1505/MUL_f32_f32_1504_Sample/rr
      -- 
    ca_5353_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ADD_f32_f32_1498_inst_ack_1, ack => cp_elements(241)); -- 
    rr_5365_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(241), ack => MUL_f32_f32_1504_inst_req_0); -- 
    -- CP-element group 242 transition  output  bypass 
    -- predecessors 234 
    -- successors 244 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1493_to_assign_stmt_1505/MUL_f32_f32_1504_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1493_to_assign_stmt_1505/MUL_f32_f32_1504_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1493_to_assign_stmt_1505/MUL_f32_f32_1504_Update/cr
      -- 
    cp_elements(242) <= cp_elements(234);
    cr_5370_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(242), ack => MUL_f32_f32_1504_inst_req_1); -- 
    -- CP-element group 243 transition  input  bypass 
    -- predecessors 241 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1493_to_assign_stmt_1505/MUL_f32_f32_1504_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1493_to_assign_stmt_1505/MUL_f32_f32_1504_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1493_to_assign_stmt_1505/MUL_f32_f32_1504_Sample/ra
      -- 
    ra_5366_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f32_f32_1504_inst_ack_0, ack => cp_elements(243)); -- 
    -- CP-element group 244 fork  transition  place  input  bypass 
    -- predecessors 242 
    -- successors 793 797 801 
    -- members (9) 
      -- 	branch_block_stmt_1166/assign_stmt_1493_to_assign_stmt_1505__exit__
      -- 	branch_block_stmt_1166/bb_16_bb_17
      -- 	branch_block_stmt_1166/assign_stmt_1493_to_assign_stmt_1505/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1493_to_assign_stmt_1505/MUL_f32_f32_1504_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1493_to_assign_stmt_1505/MUL_f32_f32_1504_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1493_to_assign_stmt_1505/MUL_f32_f32_1504_Update/ca
      -- 	branch_block_stmt_1166/bb_16_bb_17_PhiReq/$entry
      -- 	branch_block_stmt_1166/bb_16_bb_17_PhiReq/phi_stmt_1508/$entry
      -- 	branch_block_stmt_1166/bb_16_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/$entry
      -- 
    ca_5371_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f32_f32_1504_inst_ack_1, ack => cp_elements(244)); -- 
    -- CP-element group 245 fork  transition  bypass 
    -- predecessors 810 
    -- successors 247 248 249 252 253 257 258 261 264 267 270 271 274 277 
    -- members (1) 
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/$entry
      -- 
    cp_elements(245) <= cp_elements(810);
    -- CP-element group 246 join  transition  output  bypass 
    -- predecessors 248 249 
    -- successors 250 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/ADD_f32_f32_1523_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/ADD_f32_f32_1523_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/ADD_f32_f32_1523_Sample/rr
      -- 
    cp_element_group_246: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_246"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(248) & cp_elements(249);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(246), clk => clk, reset => reset); --
    end block;
    rr_5390_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(246), ack => ADD_f32_f32_1523_inst_req_0); -- 
    -- CP-element group 247 transition  output  bypass 
    -- predecessors 245 
    -- successors 251 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/ADD_f32_f32_1523_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/ADD_f32_f32_1523_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/ADD_f32_f32_1523_Update/cr
      -- 
    cp_elements(247) <= cp_elements(245);
    cr_5395_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(247), ack => ADD_f32_f32_1523_inst_req_1); -- 
    -- CP-element group 248 transition  bypass 
    -- predecessors 245 
    -- successors 246 
    -- members (4) 
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/R_id_prevx_x0_1521_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/R_id_prevx_x0_1521_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/R_id_prevx_x0_1521_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/R_id_prevx_x0_1521_update_completed_
      -- 
    cp_elements(248) <= cp_elements(245);
    -- CP-element group 249 transition  bypass 
    -- predecessors 245 
    -- successors 246 
    -- members (4) 
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/R_flux_rotor_prevx_x0_1522_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/R_flux_rotor_prevx_x0_1522_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/R_flux_rotor_prevx_x0_1522_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/R_flux_rotor_prevx_x0_1522_update_completed_
      -- 
    cp_elements(249) <= cp_elements(245);
    -- CP-element group 250 transition  input  bypass 
    -- predecessors 246 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/ADD_f32_f32_1523_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/ADD_f32_f32_1523_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/ADD_f32_f32_1523_Sample/ra
      -- 
    ra_5391_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ADD_f32_f32_1523_inst_ack_0, ack => cp_elements(250)); -- 
    -- CP-element group 251 transition  input  output  bypass 
    -- predecessors 247 
    -- successors 262 
    -- members (10) 
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/ADD_f32_f32_1523_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/ADD_f32_f32_1523_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/ADD_f32_f32_1523_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/MUL_f32_f32_1540_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/R_iNsTr_40_1537_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/R_iNsTr_40_1537_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/R_iNsTr_40_1537_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/R_iNsTr_40_1537_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/MUL_f32_f32_1540_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/MUL_f32_f32_1540_Sample/rr
      -- 
    ca_5396_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ADD_f32_f32_1523_inst_ack_1, ack => cp_elements(251)); -- 
    rr_5448_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(251), ack => MUL_f32_f32_1540_inst_req_0); -- 
    -- CP-element group 252 transition  output  bypass 
    -- predecessors 245 
    -- successors 255 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/MUL_f32_f32_1529_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/MUL_f32_f32_1529_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/MUL_f32_f32_1529_Update/cr
      -- 
    cp_elements(252) <= cp_elements(245);
    cr_5413_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(252), ack => MUL_f32_f32_1529_inst_req_1); -- 
    -- CP-element group 253 transition  output  bypass 
    -- predecessors 245 
    -- successors 254 
    -- members (7) 
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/MUL_f32_f32_1529_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/R_iNsTr_10_1526_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/R_iNsTr_10_1526_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/R_iNsTr_10_1526_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/R_iNsTr_10_1526_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/MUL_f32_f32_1529_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/MUL_f32_f32_1529_Sample/rr
      -- 
    cp_elements(253) <= cp_elements(245);
    rr_5408_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(253), ack => MUL_f32_f32_1529_inst_req_0); -- 
    -- CP-element group 254 transition  input  bypass 
    -- predecessors 253 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/MUL_f32_f32_1529_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/MUL_f32_f32_1529_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/MUL_f32_f32_1529_Sample/ra
      -- 
    ra_5409_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f32_f32_1529_inst_ack_0, ack => cp_elements(254)); -- 
    -- CP-element group 255 transition  input  bypass 
    -- predecessors 252 
    -- successors 256 
    -- members (7) 
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/MUL_f32_f32_1529_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/MUL_f32_f32_1529_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/MUL_f32_f32_1529_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/R_iNsTr_41_1532_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/R_iNsTr_41_1532_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/R_iNsTr_41_1532_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/R_iNsTr_41_1532_update_completed_
      -- 
    ca_5414_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f32_f32_1529_inst_ack_1, ack => cp_elements(255)); -- 
    -- CP-element group 256 join  transition  output  bypass 
    -- predecessors 255 258 
    -- successors 259 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/ADD_f32_f32_1534_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/ADD_f32_f32_1534_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/ADD_f32_f32_1534_Sample/rr
      -- 
    cp_element_group_256: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_256"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(255) & cp_elements(258);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(256), clk => clk, reset => reset); --
    end block;
    rr_5430_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(256), ack => ADD_f32_f32_1534_inst_req_0); -- 
    -- CP-element group 257 transition  output  bypass 
    -- predecessors 245 
    -- successors 260 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/ADD_f32_f32_1534_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/ADD_f32_f32_1534_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/ADD_f32_f32_1534_Update/cr
      -- 
    cp_elements(257) <= cp_elements(245);
    cr_5435_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(257), ack => ADD_f32_f32_1534_inst_req_1); -- 
    -- CP-element group 258 transition  bypass 
    -- predecessors 245 
    -- successors 256 
    -- members (4) 
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/R_theta_prevx_x0_1533_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/R_theta_prevx_x0_1533_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/R_theta_prevx_x0_1533_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/R_theta_prevx_x0_1533_update_completed_
      -- 
    cp_elements(258) <= cp_elements(245);
    -- CP-element group 259 transition  input  bypass 
    -- predecessors 256 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/ADD_f32_f32_1534_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/ADD_f32_f32_1534_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/ADD_f32_f32_1534_Sample/ra
      -- 
    ra_5431_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ADD_f32_f32_1534_inst_ack_0, ack => cp_elements(259)); -- 
    -- CP-element group 260 transition  input  bypass 
    -- predecessors 257 
    -- successors 280 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/ADD_f32_f32_1534_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/ADD_f32_f32_1534_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/ADD_f32_f32_1534_Update/ca
      -- 
    ca_5436_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ADD_f32_f32_1534_inst_ack_1, ack => cp_elements(260)); -- 
    -- CP-element group 261 transition  output  bypass 
    -- predecessors 245 
    -- successors 263 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/MUL_f32_f32_1540_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/MUL_f32_f32_1540_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/MUL_f32_f32_1540_Update/cr
      -- 
    cp_elements(261) <= cp_elements(245);
    cr_5453_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(261), ack => MUL_f32_f32_1540_inst_req_1); -- 
    -- CP-element group 262 transition  input  bypass 
    -- predecessors 251 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/MUL_f32_f32_1540_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/MUL_f32_f32_1540_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/MUL_f32_f32_1540_Sample/ra
      -- 
    ra_5449_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f32_f32_1540_inst_ack_0, ack => cp_elements(262)); -- 
    -- CP-element group 263 transition  input  output  bypass 
    -- predecessors 261 
    -- successors 265 
    -- members (10) 
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/MUL_f32_f32_1540_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/MUL_f32_f32_1540_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/MUL_f32_f32_1540_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/type_cast_1544_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/R_iNsTr_43_1543_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/R_iNsTr_43_1543_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/R_iNsTr_43_1543_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/R_iNsTr_43_1543_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/type_cast_1544_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/type_cast_1544_Sample/rr
      -- 
    ca_5454_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f32_f32_1540_inst_ack_1, ack => cp_elements(263)); -- 
    rr_5466_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(263), ack => type_cast_1544_inst_req_0); -- 
    -- CP-element group 264 transition  output  bypass 
    -- predecessors 245 
    -- successors 266 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/type_cast_1544_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/type_cast_1544_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/type_cast_1544_Update/cr
      -- 
    cp_elements(264) <= cp_elements(245);
    cr_5471_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(264), ack => type_cast_1544_inst_req_1); -- 
    -- CP-element group 265 transition  input  bypass 
    -- predecessors 263 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/type_cast_1544_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/type_cast_1544_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/type_cast_1544_Sample/ra
      -- 
    ra_5467_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1544_inst_ack_0, ack => cp_elements(265)); -- 
    -- CP-element group 266 transition  input  output  bypass 
    -- predecessors 264 
    -- successors 268 
    -- members (10) 
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/type_cast_1544_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/type_cast_1544_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/type_cast_1544_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/type_cast_1548_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/R_iNsTr_44_1547_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/R_iNsTr_44_1547_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/R_iNsTr_44_1547_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/R_iNsTr_44_1547_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/type_cast_1548_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/type_cast_1548_Sample/rr
      -- 
    ca_5472_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1544_inst_ack_1, ack => cp_elements(266)); -- 
    rr_5484_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(266), ack => type_cast_1548_inst_req_0); -- 
    -- CP-element group 267 transition  output  bypass 
    -- predecessors 245 
    -- successors 269 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/type_cast_1548_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/type_cast_1548_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/type_cast_1548_Update/cr
      -- 
    cp_elements(267) <= cp_elements(245);
    cr_5489_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(267), ack => type_cast_1548_inst_req_1); -- 
    -- CP-element group 268 transition  input  bypass 
    -- predecessors 266 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/type_cast_1548_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/type_cast_1548_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/type_cast_1548_Sample/ra
      -- 
    ra_5485_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1548_inst_ack_0, ack => cp_elements(268)); -- 
    -- CP-element group 269 transition  input  output  bypass 
    -- predecessors 267 
    -- successors 275 
    -- members (10) 
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/type_cast_1548_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/type_cast_1548_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/type_cast_1548_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/AND_u64_u64_1560_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/R_tmp15x_xix_xi_1557_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/R_tmp15x_xix_xi_1557_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/R_tmp15x_xix_xi_1557_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/R_tmp15x_xix_xi_1557_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/AND_u64_u64_1560_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/AND_u64_u64_1560_Sample/rr
      -- 
    ca_5490_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1548_inst_ack_1, ack => cp_elements(269)); -- 
    rr_5520_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(269), ack => AND_u64_u64_1560_inst_req_0); -- 
    -- CP-element group 270 transition  output  bypass 
    -- predecessors 245 
    -- successors 273 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/AND_u64_u64_1554_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/AND_u64_u64_1554_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/AND_u64_u64_1554_Update/cr
      -- 
    cp_elements(270) <= cp_elements(245);
    cr_5507_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(270), ack => AND_u64_u64_1554_inst_req_1); -- 
    -- CP-element group 271 transition  output  bypass 
    -- predecessors 245 
    -- successors 272 
    -- members (7) 
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/AND_u64_u64_1554_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/R_torque_refx_x0_1551_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/R_torque_refx_x0_1551_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/R_torque_refx_x0_1551_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/R_torque_refx_x0_1551_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/AND_u64_u64_1554_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/AND_u64_u64_1554_Sample/rr
      -- 
    cp_elements(271) <= cp_elements(245);
    rr_5502_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(271), ack => AND_u64_u64_1554_inst_req_0); -- 
    -- CP-element group 272 transition  input  bypass 
    -- predecessors 271 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/AND_u64_u64_1554_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/AND_u64_u64_1554_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/AND_u64_u64_1554_Sample/ra
      -- 
    ra_5503_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => AND_u64_u64_1554_inst_ack_0, ack => cp_elements(272)); -- 
    -- CP-element group 273 transition  input  output  bypass 
    -- predecessors 270 
    -- successors 278 
    -- members (10) 
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/AND_u64_u64_1554_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/AND_u64_u64_1554_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/AND_u64_u64_1554_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/EQ_u64_u1_1566_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/R_iNsTr_45_1563_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/R_iNsTr_45_1563_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/R_iNsTr_45_1563_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/R_iNsTr_45_1563_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/EQ_u64_u1_1566_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/EQ_u64_u1_1566_Sample/rr
      -- 
    ca_5508_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => AND_u64_u64_1554_inst_ack_1, ack => cp_elements(273)); -- 
    rr_5538_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(273), ack => EQ_u64_u1_1566_inst_req_0); -- 
    -- CP-element group 274 transition  output  bypass 
    -- predecessors 245 
    -- successors 276 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/AND_u64_u64_1560_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/AND_u64_u64_1560_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/AND_u64_u64_1560_Update/cr
      -- 
    cp_elements(274) <= cp_elements(245);
    cr_5525_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(274), ack => AND_u64_u64_1560_inst_req_1); -- 
    -- CP-element group 275 transition  input  bypass 
    -- predecessors 269 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/AND_u64_u64_1560_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/AND_u64_u64_1560_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/AND_u64_u64_1560_Sample/ra
      -- 
    ra_5521_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => AND_u64_u64_1560_inst_ack_0, ack => cp_elements(275)); -- 
    -- CP-element group 276 transition  input  bypass 
    -- predecessors 274 
    -- successors 280 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/AND_u64_u64_1560_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/AND_u64_u64_1560_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/AND_u64_u64_1560_Update/ca
      -- 
    ca_5526_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => AND_u64_u64_1560_inst_ack_1, ack => cp_elements(276)); -- 
    -- CP-element group 277 transition  output  bypass 
    -- predecessors 245 
    -- successors 279 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/EQ_u64_u1_1566_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/EQ_u64_u1_1566_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/EQ_u64_u1_1566_Update/cr
      -- 
    cp_elements(277) <= cp_elements(245);
    cr_5543_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(277), ack => EQ_u64_u1_1566_inst_req_1); -- 
    -- CP-element group 278 transition  input  bypass 
    -- predecessors 273 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/EQ_u64_u1_1566_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/EQ_u64_u1_1566_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/EQ_u64_u1_1566_Sample/ra
      -- 
    ra_5539_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => EQ_u64_u1_1566_inst_ack_0, ack => cp_elements(278)); -- 
    -- CP-element group 279 transition  input  bypass 
    -- predecessors 277 
    -- successors 280 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/EQ_u64_u1_1566_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/EQ_u64_u1_1566_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/EQ_u64_u1_1566_Update/ca
      -- 
    ca_5544_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => EQ_u64_u1_1566_inst_ack_1, ack => cp_elements(279)); -- 
    -- CP-element group 280 join  transition  bypass 
    -- predecessors 260 276 279 
    -- successors 12 
    -- members (1) 
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567/$exit
      -- 
    cp_element_group_280: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 0,2 => 0);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_280"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= cp_elements(260) & cp_elements(276) & cp_elements(279);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(280), clk => clk, reset => reset); --
    end block;
    -- CP-element group 281 transition  place  dead  bypass 
    -- predecessors 12 
    -- successors 13 
    -- members (8) 
      -- 	branch_block_stmt_1166/if_stmt_1568__exit__
      -- 	branch_block_stmt_1166/merge_stmt_1574__entry__
      -- 	branch_block_stmt_1166/if_stmt_1568_dead_link/$entry
      -- 	branch_block_stmt_1166/if_stmt_1568_dead_link/$exit
      -- 	branch_block_stmt_1166/if_stmt_1568_dead_link/dead_transition
      -- 	branch_block_stmt_1166/merge_stmt_1574_dead_link/$entry
      -- 	branch_block_stmt_1166/merge_stmt_1574_dead_link/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1574_dead_link/dead_transition
      -- 
    cp_elements(281) <= false;
    -- CP-element group 282 transition  output  bypass 
    -- predecessors 12 
    -- successors 283 
    -- members (3) 
      -- 	branch_block_stmt_1166/if_stmt_1568_eval_test/$entry
      -- 	branch_block_stmt_1166/if_stmt_1568_eval_test/$exit
      -- 	branch_block_stmt_1166/if_stmt_1568_eval_test/branch_req
      -- 
    cp_elements(282) <= cp_elements(12);
    branch_req_5552_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(282), ack => if_stmt_1568_branch_req_0); -- 
    -- CP-element group 283 branch  place  bypass 
    -- predecessors 282 
    -- successors 284 286 
    -- members (1) 
      -- 	branch_block_stmt_1166/R_iNsTr_47_1569_place
      -- 
    cp_elements(283) <= cp_elements(282);
    -- CP-element group 284 transition  bypass 
    -- predecessors 283 
    -- successors 285 
    -- members (1) 
      -- 	branch_block_stmt_1166/if_stmt_1568_if_link/$entry
      -- 
    cp_elements(284) <= cp_elements(283);
    -- CP-element group 285 fork  transition  place  input  bypass 
    -- predecessors 284 
    -- successors 811 812 
    -- members (8) 
      -- 	branch_block_stmt_1166/if_stmt_1568_if_link/$exit
      -- 	branch_block_stmt_1166/if_stmt_1568_if_link/if_choice_transition
      -- 	branch_block_stmt_1166/bb_17_bb_19
      -- 	branch_block_stmt_1166/bb_17_bb_19_PhiReq/$entry
      -- 	branch_block_stmt_1166/bb_17_bb_19_PhiReq/phi_stmt_1606/$entry
      -- 	branch_block_stmt_1166/bb_17_bb_19_PhiReq/phi_stmt_1606/phi_stmt_1606_sources/$entry
      -- 	branch_block_stmt_1166/bb_17_bb_19_PhiReq/phi_stmt_1606/phi_stmt_1606_sources/type_cast_1609/$entry
      -- 	branch_block_stmt_1166/bb_17_bb_19_PhiReq/phi_stmt_1606/phi_stmt_1606_sources/type_cast_1609/SplitProtocol/$entry
      -- 
    if_choice_transition_5557_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_1568_branch_ack_1, ack => cp_elements(285)); -- 
    -- CP-element group 286 transition  bypass 
    -- predecessors 283 
    -- successors 287 
    -- members (1) 
      -- 	branch_block_stmt_1166/if_stmt_1568_else_link/$entry
      -- 
    cp_elements(286) <= cp_elements(283);
    -- CP-element group 287 transition  place  input  bypass 
    -- predecessors 286 
    -- successors 13 
    -- members (9) 
      -- 	branch_block_stmt_1166/if_stmt_1568_else_link/$exit
      -- 	branch_block_stmt_1166/if_stmt_1568_else_link/else_choice_transition
      -- 	branch_block_stmt_1166/bb_17_bb_18
      -- 	branch_block_stmt_1166/merge_stmt_1574_PhiReqMerge
      -- 	branch_block_stmt_1166/bb_17_bb_18_PhiReq/$entry
      -- 	branch_block_stmt_1166/bb_17_bb_18_PhiReq/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1574_PhiAck/$entry
      -- 	branch_block_stmt_1166/merge_stmt_1574_PhiAck/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1574_PhiAck/dummy
      -- 
    else_choice_transition_5561_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_1568_branch_ack_0, ack => cp_elements(287)); -- 
    -- CP-element group 288 fork  transition  bypass 
    -- predecessors 13 
    -- successors 289 290 293 294 297 301 304 
    -- members (1) 
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/$entry
      -- 
    cp_elements(288) <= cp_elements(13);
    -- CP-element group 289 transition  output  bypass 
    -- predecessors 288 
    -- successors 292 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/AND_u64_u64_1579_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/AND_u64_u64_1579_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/AND_u64_u64_1579_Update/cr
      -- 
    cp_elements(289) <= cp_elements(288);
    cr_5583_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(289), ack => AND_u64_u64_1579_inst_req_1); -- 
    -- CP-element group 290 transition  output  bypass 
    -- predecessors 288 
    -- successors 291 
    -- members (7) 
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/AND_u64_u64_1579_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/R_tmp15x_xix_xi_1576_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/R_tmp15x_xix_xi_1576_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/R_tmp15x_xix_xi_1576_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/R_tmp15x_xix_xi_1576_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/AND_u64_u64_1579_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/AND_u64_u64_1579_Sample/rr
      -- 
    cp_elements(290) <= cp_elements(288);
    rr_5578_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(290), ack => AND_u64_u64_1579_inst_req_0); -- 
    -- CP-element group 291 transition  input  bypass 
    -- predecessors 290 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/AND_u64_u64_1579_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/AND_u64_u64_1579_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/AND_u64_u64_1579_Sample/ra
      -- 
    ra_5579_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => AND_u64_u64_1579_inst_ack_0, ack => cp_elements(291)); -- 
    -- CP-element group 292 transition  input  output  bypass 
    -- predecessors 289 
    -- successors 298 
    -- members (10) 
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/AND_u64_u64_1579_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/AND_u64_u64_1579_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/AND_u64_u64_1579_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/SUB_u64_u64_1591_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/R_iNsTr_72_1590_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/R_iNsTr_72_1590_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/R_iNsTr_72_1590_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/R_iNsTr_72_1590_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/SUB_u64_u64_1591_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/SUB_u64_u64_1591_Sample/rr
      -- 
    ca_5584_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => AND_u64_u64_1579_inst_ack_1, ack => cp_elements(292)); -- 
    rr_5614_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(292), ack => SUB_u64_u64_1591_inst_req_0); -- 
    -- CP-element group 293 transition  output  bypass 
    -- predecessors 288 
    -- successors 296 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/AND_u64_u64_1585_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/AND_u64_u64_1585_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/AND_u64_u64_1585_Update/cr
      -- 
    cp_elements(293) <= cp_elements(288);
    cr_5601_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(293), ack => AND_u64_u64_1585_inst_req_1); -- 
    -- CP-element group 294 transition  output  bypass 
    -- predecessors 288 
    -- successors 295 
    -- members (7) 
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/AND_u64_u64_1585_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/R_torque_refx_x0_1582_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/R_torque_refx_x0_1582_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/R_torque_refx_x0_1582_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/R_torque_refx_x0_1582_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/AND_u64_u64_1585_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/AND_u64_u64_1585_Sample/rr
      -- 
    cp_elements(294) <= cp_elements(288);
    rr_5596_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(294), ack => AND_u64_u64_1585_inst_req_0); -- 
    -- CP-element group 295 transition  input  bypass 
    -- predecessors 294 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/AND_u64_u64_1585_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/AND_u64_u64_1585_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/AND_u64_u64_1585_Sample/ra
      -- 
    ra_5597_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => AND_u64_u64_1585_inst_ack_0, ack => cp_elements(295)); -- 
    -- CP-element group 296 transition  input  bypass 
    -- predecessors 293 
    -- successors 300 
    -- members (7) 
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/AND_u64_u64_1585_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/AND_u64_u64_1585_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/AND_u64_u64_1585_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/R_tmp17x_xmaskx_xix_xi_1595_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/R_tmp17x_xmaskx_xix_xi_1595_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/R_tmp17x_xmaskx_xix_xi_1595_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/R_tmp17x_xmaskx_xix_xi_1595_update_completed_
      -- 
    ca_5602_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => AND_u64_u64_1585_inst_ack_1, ack => cp_elements(296)); -- 
    -- CP-element group 297 transition  output  bypass 
    -- predecessors 288 
    -- successors 299 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/SUB_u64_u64_1591_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/SUB_u64_u64_1591_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/SUB_u64_u64_1591_Update/cr
      -- 
    cp_elements(297) <= cp_elements(288);
    cr_5619_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(297), ack => SUB_u64_u64_1591_inst_req_1); -- 
    -- CP-element group 298 transition  input  bypass 
    -- predecessors 292 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/SUB_u64_u64_1591_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/SUB_u64_u64_1591_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/SUB_u64_u64_1591_Sample/ra
      -- 
    ra_5615_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => SUB_u64_u64_1591_inst_ack_0, ack => cp_elements(298)); -- 
    -- CP-element group 299 transition  input  bypass 
    -- predecessors 297 
    -- successors 300 
    -- members (7) 
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/SUB_u64_u64_1591_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/SUB_u64_u64_1591_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/SUB_u64_u64_1591_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/R_iNsTr_73_1594_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/R_iNsTr_73_1594_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/R_iNsTr_73_1594_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/R_iNsTr_73_1594_update_completed_
      -- 
    ca_5620_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => SUB_u64_u64_1591_inst_ack_1, ack => cp_elements(299)); -- 
    -- CP-element group 300 join  transition  output  bypass 
    -- predecessors 296 299 
    -- successors 302 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/ADD_u64_u64_1596_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/ADD_u64_u64_1596_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/ADD_u64_u64_1596_Sample/rr
      -- 
    cp_element_group_300: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_300"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(296) & cp_elements(299);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(300), clk => clk, reset => reset); --
    end block;
    rr_5636_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(300), ack => ADD_u64_u64_1596_inst_req_0); -- 
    -- CP-element group 301 transition  output  bypass 
    -- predecessors 288 
    -- successors 303 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/ADD_u64_u64_1596_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/ADD_u64_u64_1596_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/ADD_u64_u64_1596_Update/cr
      -- 
    cp_elements(301) <= cp_elements(288);
    cr_5641_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(301), ack => ADD_u64_u64_1596_inst_req_1); -- 
    -- CP-element group 302 transition  input  bypass 
    -- predecessors 300 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/ADD_u64_u64_1596_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/ADD_u64_u64_1596_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/ADD_u64_u64_1596_Sample/ra
      -- 
    ra_5637_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ADD_u64_u64_1596_inst_ack_0, ack => cp_elements(302)); -- 
    -- CP-element group 303 transition  input  output  bypass 
    -- predecessors 301 
    -- successors 305 
    -- members (10) 
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/ADD_u64_u64_1596_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/ADD_u64_u64_1596_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/ADD_u64_u64_1596_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/AND_u64_u64_1602_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/R_phitmpx_xix_xi_1599_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/R_phitmpx_xix_xi_1599_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/R_phitmpx_xix_xi_1599_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/R_phitmpx_xix_xi_1599_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/AND_u64_u64_1602_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/AND_u64_u64_1602_Sample/rr
      -- 
    ca_5642_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ADD_u64_u64_1596_inst_ack_1, ack => cp_elements(303)); -- 
    rr_5654_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(303), ack => AND_u64_u64_1602_inst_req_0); -- 
    -- CP-element group 304 transition  output  bypass 
    -- predecessors 288 
    -- successors 306 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/AND_u64_u64_1602_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/AND_u64_u64_1602_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/AND_u64_u64_1602_Update/cr
      -- 
    cp_elements(304) <= cp_elements(288);
    cr_5659_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(304), ack => AND_u64_u64_1602_inst_req_1); -- 
    -- CP-element group 305 transition  input  bypass 
    -- predecessors 303 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/AND_u64_u64_1602_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/AND_u64_u64_1602_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/AND_u64_u64_1602_Sample/ra
      -- 
    ra_5655_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => AND_u64_u64_1602_inst_ack_0, ack => cp_elements(305)); -- 
    -- CP-element group 306 fork  transition  place  input  bypass 
    -- predecessors 304 
    -- successors 814 816 
    -- members (11) 
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603__exit__
      -- 	branch_block_stmt_1166/bb_18_bb_19
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/AND_u64_u64_1602_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/AND_u64_u64_1602_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1580_to_assign_stmt_1603/AND_u64_u64_1602_Update/ca
      -- 	branch_block_stmt_1166/bb_18_bb_19_PhiReq/$entry
      -- 	branch_block_stmt_1166/bb_18_bb_19_PhiReq/phi_stmt_1606/$entry
      -- 	branch_block_stmt_1166/bb_18_bb_19_PhiReq/phi_stmt_1606/phi_stmt_1606_sources/$entry
      -- 	branch_block_stmt_1166/bb_18_bb_19_PhiReq/phi_stmt_1606/phi_stmt_1606_sources/type_cast_1609/$entry
      -- 	branch_block_stmt_1166/bb_18_bb_19_PhiReq/phi_stmt_1606/phi_stmt_1606_sources/type_cast_1609/SplitProtocol/$entry
      -- 
    ca_5660_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => AND_u64_u64_1602_inst_ack_1, ack => cp_elements(306)); -- 
    -- CP-element group 307 fork  transition  bypass 
    -- predecessors 821 
    -- successors 308 309 312 315 318 322 326 331 335 340 345 349 354 359 363 367 368 372 373 
    -- members (1) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/$entry
      -- 
    cp_elements(307) <= cp_elements(821);
    -- CP-element group 308 transition  output  bypass 
    -- predecessors 307 
    -- successors 311 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/OR_u64_u64_1618_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/OR_u64_u64_1618_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/OR_u64_u64_1618_Update/cr
      -- 
    cp_elements(308) <= cp_elements(307);
    cr_5680_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(308), ack => OR_u64_u64_1618_inst_req_1); -- 
    -- CP-element group 309 transition  output  bypass 
    -- predecessors 307 
    -- successors 310 
    -- members (7) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/OR_u64_u64_1618_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_tmp15x_xix_xi_1615_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_tmp15x_xix_xi_1615_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_tmp15x_xix_xi_1615_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_tmp15x_xix_xi_1615_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/OR_u64_u64_1618_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/OR_u64_u64_1618_Sample/rr
      -- 
    cp_elements(309) <= cp_elements(307);
    rr_5675_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(309), ack => OR_u64_u64_1618_inst_req_0); -- 
    -- CP-element group 310 transition  input  bypass 
    -- predecessors 309 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/OR_u64_u64_1618_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/OR_u64_u64_1618_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/OR_u64_u64_1618_Sample/ra
      -- 
    ra_5676_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => OR_u64_u64_1618_inst_ack_0, ack => cp_elements(310)); -- 
    -- CP-element group 311 transition  input  output  bypass 
    -- predecessors 308 
    -- successors 313 
    -- members (10) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/AND_u64_u64_1624_Sample/rr
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/OR_u64_u64_1618_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/OR_u64_u64_1618_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/OR_u64_u64_1618_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/AND_u64_u64_1624_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_57_1621_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_57_1621_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_57_1621_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_57_1621_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/AND_u64_u64_1624_Sample/$entry
      -- 
    ca_5681_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => OR_u64_u64_1618_inst_ack_1, ack => cp_elements(311)); -- 
    rr_5693_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(311), ack => AND_u64_u64_1624_inst_req_0); -- 
    -- CP-element group 312 transition  output  bypass 
    -- predecessors 307 
    -- successors 314 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/AND_u64_u64_1624_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/AND_u64_u64_1624_Update/cr
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/AND_u64_u64_1624_update_start_
      -- 
    cp_elements(312) <= cp_elements(307);
    cr_5698_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(312), ack => AND_u64_u64_1624_inst_req_1); -- 
    -- CP-element group 313 transition  input  bypass 
    -- predecessors 311 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/AND_u64_u64_1624_Sample/ra
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/AND_u64_u64_1624_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/AND_u64_u64_1624_sample_completed_
      -- 
    ra_5694_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => AND_u64_u64_1624_inst_ack_0, ack => cp_elements(313)); -- 
    -- CP-element group 314 transition  input  output  bypass 
    -- predecessors 312 
    -- successors 316 
    -- members (10) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/AND_u64_u64_1624_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/type_cast_1628_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/type_cast_1628_Sample/rr
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/AND_u64_u64_1624_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/type_cast_1628_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_58_1627_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_58_1627_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_58_1627_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_58_1627_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/AND_u64_u64_1624_update_completed_
      -- 
    ca_5699_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => AND_u64_u64_1624_inst_ack_1, ack => cp_elements(314)); -- 
    rr_5711_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(314), ack => type_cast_1628_inst_req_0); -- 
    -- CP-element group 315 transition  output  bypass 
    -- predecessors 307 
    -- successors 317 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/type_cast_1628_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/type_cast_1628_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/type_cast_1628_Update/cr
      -- 
    cp_elements(315) <= cp_elements(307);
    cr_5716_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(315), ack => type_cast_1628_inst_req_1); -- 
    -- CP-element group 316 transition  input  bypass 
    -- predecessors 314 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/type_cast_1628_Sample/ra
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/type_cast_1628_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/type_cast_1628_sample_completed_
      -- 
    ra_5712_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1628_inst_ack_0, ack => cp_elements(316)); -- 
    -- CP-element group 317 fork  transition  input  bypass 
    -- predecessors 315 
    -- successors 319 327 341 355 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/type_cast_1628_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/type_cast_1628_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/type_cast_1628_update_completed_
      -- 
    ca_5717_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1628_inst_ack_1, ack => cp_elements(317)); -- 
    -- CP-element group 318 transition  output  bypass 
    -- predecessors 307 
    -- successors 321 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1634_Update/cr
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1634_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1634_update_start_
      -- 
    cp_elements(318) <= cp_elements(307);
    cr_5734_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(318), ack => MUL_f64_f64_1634_inst_req_1); -- 
    -- CP-element group 319 transition  output  bypass 
    -- predecessors 317 
    -- successors 320 
    -- members (7) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1634_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1634_Sample/rr
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1634_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_tmp11x_xix_xi_1631_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_tmp11x_xix_xi_1631_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_tmp11x_xix_xi_1631_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_tmp11x_xix_xi_1631_sample_start_
      -- 
    cp_elements(319) <= cp_elements(317);
    rr_5729_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(319), ack => MUL_f64_f64_1634_inst_req_0); -- 
    -- CP-element group 320 transition  input  bypass 
    -- predecessors 319 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1634_Sample/ra
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1634_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1634_sample_completed_
      -- 
    ra_5730_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f64_f64_1634_inst_ack_0, ack => cp_elements(320)); -- 
    -- CP-element group 321 transition  input  output  bypass 
    -- predecessors 318 
    -- successors 323 
    -- members (10) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_59_1639_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_59_1639_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_59_1639_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_59_1639_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/SUB_f64_f64_1640_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/SUB_f64_f64_1640_Sample/rr
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/SUB_f64_f64_1640_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1634_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1634_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1634_update_completed_
      -- 
    ca_5735_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f64_f64_1634_inst_ack_1, ack => cp_elements(321)); -- 
    rr_5747_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(321), ack => SUB_f64_f64_1640_inst_req_0); -- 
    -- CP-element group 322 transition  output  bypass 
    -- predecessors 307 
    -- successors 324 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/SUB_f64_f64_1640_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/SUB_f64_f64_1640_Update/cr
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/SUB_f64_f64_1640_update_start_
      -- 
    cp_elements(322) <= cp_elements(307);
    cr_5752_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(322), ack => SUB_f64_f64_1640_inst_req_1); -- 
    -- CP-element group 323 transition  input  bypass 
    -- predecessors 321 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/SUB_f64_f64_1640_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/SUB_f64_f64_1640_Sample/ra
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/SUB_f64_f64_1640_sample_completed_
      -- 
    ra_5748_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => SUB_f64_f64_1640_inst_ack_0, ack => cp_elements(323)); -- 
    -- CP-element group 324 fork  transition  input  bypass 
    -- predecessors 322 
    -- successors 328 336 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/SUB_f64_f64_1640_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/SUB_f64_f64_1640_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/SUB_f64_f64_1640_Update/ca
      -- 
    ca_5753_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => SUB_f64_f64_1640_inst_ack_1, ack => cp_elements(324)); -- 
    -- CP-element group 325 join  transition  output  bypass 
    -- predecessors 327 328 
    -- successors 329 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1645_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1645_Sample/rr
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1645_Sample/$entry
      -- 
    cp_element_group_325: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_325"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(327) & cp_elements(328);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(325), clk => clk, reset => reset); --
    end block;
    rr_5769_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(325), ack => MUL_f64_f64_1645_inst_req_0); -- 
    -- CP-element group 326 transition  output  bypass 
    -- predecessors 307 
    -- successors 330 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1645_Update/cr
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1645_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1645_Update/$entry
      -- 
    cp_elements(326) <= cp_elements(307);
    cr_5774_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(326), ack => MUL_f64_f64_1645_inst_req_1); -- 
    -- CP-element group 327 transition  bypass 
    -- predecessors 317 
    -- successors 325 
    -- members (4) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_tmp11x_xix_xi_1643_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_tmp11x_xix_xi_1643_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_tmp11x_xix_xi_1643_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_tmp11x_xix_xi_1643_update_completed_
      -- 
    cp_elements(327) <= cp_elements(317);
    -- CP-element group 328 transition  bypass 
    -- predecessors 324 
    -- successors 325 
    -- members (4) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_60_1644_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_60_1644_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_60_1644_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_60_1644_sample_start_
      -- 
    cp_elements(328) <= cp_elements(324);
    -- CP-element group 329 transition  input  bypass 
    -- predecessors 325 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1645_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1645_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1645_Sample/ra
      -- 
    ra_5770_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f64_f64_1645_inst_ack_0, ack => cp_elements(329)); -- 
    -- CP-element group 330 transition  input  output  bypass 
    -- predecessors 326 
    -- successors 332 
    -- members (10) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_61_1650_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1645_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/SUB_f64_f64_1651_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1645_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1645_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_61_1650_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_61_1650_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_61_1650_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/SUB_f64_f64_1651_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/SUB_f64_f64_1651_Sample/rr
      -- 
    ca_5775_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f64_f64_1645_inst_ack_1, ack => cp_elements(330)); -- 
    rr_5787_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(330), ack => SUB_f64_f64_1651_inst_req_0); -- 
    -- CP-element group 331 transition  output  bypass 
    -- predecessors 307 
    -- successors 333 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/SUB_f64_f64_1651_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/SUB_f64_f64_1651_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/SUB_f64_f64_1651_Update/cr
      -- 
    cp_elements(331) <= cp_elements(307);
    cr_5792_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(331), ack => SUB_f64_f64_1651_inst_req_1); -- 
    -- CP-element group 332 transition  input  bypass 
    -- predecessors 330 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/SUB_f64_f64_1651_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/SUB_f64_f64_1651_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/SUB_f64_f64_1651_Sample/ra
      -- 
    ra_5788_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => SUB_f64_f64_1651_inst_ack_0, ack => cp_elements(332)); -- 
    -- CP-element group 333 transition  input  bypass 
    -- predecessors 331 
    -- successors 334 
    -- members (7) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/SUB_f64_f64_1651_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/SUB_f64_f64_1651_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/SUB_f64_f64_1651_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_62_1655_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_62_1655_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_62_1655_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_62_1655_update_completed_
      -- 
    ca_5793_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => SUB_f64_f64_1651_inst_ack_1, ack => cp_elements(333)); -- 
    -- CP-element group 334 join  transition  output  bypass 
    -- predecessors 333 336 
    -- successors 337 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1656_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1656_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1656_Sample/rr
      -- 
    cp_element_group_334: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_334"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(333) & cp_elements(336);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(334), clk => clk, reset => reset); --
    end block;
    rr_5809_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(334), ack => MUL_f64_f64_1656_inst_req_0); -- 
    -- CP-element group 335 transition  output  bypass 
    -- predecessors 307 
    -- successors 338 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1656_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1656_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1656_Update/cr
      -- 
    cp_elements(335) <= cp_elements(307);
    cr_5814_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(335), ack => MUL_f64_f64_1656_inst_req_1); -- 
    -- CP-element group 336 transition  bypass 
    -- predecessors 324 
    -- successors 334 
    -- members (4) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_60_1654_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_60_1654_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_60_1654_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_60_1654_update_completed_
      -- 
    cp_elements(336) <= cp_elements(324);
    -- CP-element group 337 transition  input  bypass 
    -- predecessors 334 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1656_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1656_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1656_Sample/ra
      -- 
    ra_5810_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f64_f64_1656_inst_ack_0, ack => cp_elements(337)); -- 
    -- CP-element group 338 fork  transition  input  bypass 
    -- predecessors 335 
    -- successors 342 350 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1656_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1656_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1656_Update/ca
      -- 
    ca_5815_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f64_f64_1656_inst_ack_1, ack => cp_elements(338)); -- 
    -- CP-element group 339 join  transition  output  bypass 
    -- predecessors 341 342 
    -- successors 343 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1661_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1661_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1661_Sample/rr
      -- 
    cp_element_group_339: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_339"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(341) & cp_elements(342);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(339), clk => clk, reset => reset); --
    end block;
    rr_5831_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(339), ack => MUL_f64_f64_1661_inst_req_0); -- 
    -- CP-element group 340 transition  output  bypass 
    -- predecessors 307 
    -- successors 344 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1661_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1661_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1661_Update/cr
      -- 
    cp_elements(340) <= cp_elements(307);
    cr_5836_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(340), ack => MUL_f64_f64_1661_inst_req_1); -- 
    -- CP-element group 341 transition  bypass 
    -- predecessors 317 
    -- successors 339 
    -- members (4) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_tmp11x_xix_xi_1659_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_tmp11x_xix_xi_1659_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_tmp11x_xix_xi_1659_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_tmp11x_xix_xi_1659_update_completed_
      -- 
    cp_elements(341) <= cp_elements(317);
    -- CP-element group 342 transition  bypass 
    -- predecessors 338 
    -- successors 339 
    -- members (4) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_63_1660_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_63_1660_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_63_1660_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_63_1660_update_completed_
      -- 
    cp_elements(342) <= cp_elements(338);
    -- CP-element group 343 transition  input  bypass 
    -- predecessors 339 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1661_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1661_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1661_Sample/ra
      -- 
    ra_5832_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f64_f64_1661_inst_ack_0, ack => cp_elements(343)); -- 
    -- CP-element group 344 transition  input  output  bypass 
    -- predecessors 340 
    -- successors 346 
    -- members (10) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1661_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1661_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1661_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/SUB_f64_f64_1667_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_64_1666_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_64_1666_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_64_1666_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_64_1666_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/SUB_f64_f64_1667_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/SUB_f64_f64_1667_Sample/rr
      -- 
    ca_5837_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f64_f64_1661_inst_ack_1, ack => cp_elements(344)); -- 
    rr_5849_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(344), ack => SUB_f64_f64_1667_inst_req_0); -- 
    -- CP-element group 345 transition  output  bypass 
    -- predecessors 307 
    -- successors 347 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/SUB_f64_f64_1667_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/SUB_f64_f64_1667_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/SUB_f64_f64_1667_Update/cr
      -- 
    cp_elements(345) <= cp_elements(307);
    cr_5854_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(345), ack => SUB_f64_f64_1667_inst_req_1); -- 
    -- CP-element group 346 transition  input  bypass 
    -- predecessors 344 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/SUB_f64_f64_1667_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/SUB_f64_f64_1667_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/SUB_f64_f64_1667_Sample/ra
      -- 
    ra_5850_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => SUB_f64_f64_1667_inst_ack_0, ack => cp_elements(346)); -- 
    -- CP-element group 347 transition  input  bypass 
    -- predecessors 345 
    -- successors 348 
    -- members (7) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/SUB_f64_f64_1667_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/SUB_f64_f64_1667_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/SUB_f64_f64_1667_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_65_1671_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_65_1671_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_65_1671_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_65_1671_update_completed_
      -- 
    ca_5855_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => SUB_f64_f64_1667_inst_ack_1, ack => cp_elements(347)); -- 
    -- CP-element group 348 join  transition  output  bypass 
    -- predecessors 347 350 
    -- successors 351 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1672_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1672_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1672_Sample/rr
      -- 
    cp_element_group_348: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_348"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(347) & cp_elements(350);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(348), clk => clk, reset => reset); --
    end block;
    rr_5871_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(348), ack => MUL_f64_f64_1672_inst_req_0); -- 
    -- CP-element group 349 transition  output  bypass 
    -- predecessors 307 
    -- successors 352 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1672_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1672_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1672_Update/cr
      -- 
    cp_elements(349) <= cp_elements(307);
    cr_5876_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(349), ack => MUL_f64_f64_1672_inst_req_1); -- 
    -- CP-element group 350 transition  bypass 
    -- predecessors 338 
    -- successors 348 
    -- members (4) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_63_1670_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_63_1670_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_63_1670_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_63_1670_update_completed_
      -- 
    cp_elements(350) <= cp_elements(338);
    -- CP-element group 351 transition  input  bypass 
    -- predecessors 348 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1672_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1672_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1672_Sample/ra
      -- 
    ra_5872_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f64_f64_1672_inst_ack_0, ack => cp_elements(351)); -- 
    -- CP-element group 352 fork  transition  input  bypass 
    -- predecessors 349 
    -- successors 356 364 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1672_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1672_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1672_Update/ca
      -- 
    ca_5877_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f64_f64_1672_inst_ack_1, ack => cp_elements(352)); -- 
    -- CP-element group 353 join  transition  output  bypass 
    -- predecessors 355 356 
    -- successors 357 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1677_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1677_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1677_Sample/rr
      -- 
    cp_element_group_353: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_353"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(355) & cp_elements(356);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(353), clk => clk, reset => reset); --
    end block;
    rr_5893_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(353), ack => MUL_f64_f64_1677_inst_req_0); -- 
    -- CP-element group 354 transition  output  bypass 
    -- predecessors 307 
    -- successors 358 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1677_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1677_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1677_Update/cr
      -- 
    cp_elements(354) <= cp_elements(307);
    cr_5898_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(354), ack => MUL_f64_f64_1677_inst_req_1); -- 
    -- CP-element group 355 transition  bypass 
    -- predecessors 317 
    -- successors 353 
    -- members (4) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_tmp11x_xix_xi_1675_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_tmp11x_xix_xi_1675_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_tmp11x_xix_xi_1675_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_tmp11x_xix_xi_1675_update_completed_
      -- 
    cp_elements(355) <= cp_elements(317);
    -- CP-element group 356 transition  bypass 
    -- predecessors 352 
    -- successors 353 
    -- members (4) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_66_1676_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_66_1676_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_66_1676_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_66_1676_update_completed_
      -- 
    cp_elements(356) <= cp_elements(352);
    -- CP-element group 357 transition  input  bypass 
    -- predecessors 353 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1677_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1677_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1677_Sample/ra
      -- 
    ra_5894_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f64_f64_1677_inst_ack_0, ack => cp_elements(357)); -- 
    -- CP-element group 358 transition  input  output  bypass 
    -- predecessors 354 
    -- successors 360 
    -- members (10) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1677_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1677_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1677_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/SUB_f64_f64_1683_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_67_1682_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_67_1682_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_67_1682_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_67_1682_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/SUB_f64_f64_1683_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/SUB_f64_f64_1683_Sample/rr
      -- 
    ca_5899_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f64_f64_1677_inst_ack_1, ack => cp_elements(358)); -- 
    rr_5911_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(358), ack => SUB_f64_f64_1683_inst_req_0); -- 
    -- CP-element group 359 transition  output  bypass 
    -- predecessors 307 
    -- successors 361 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/SUB_f64_f64_1683_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/SUB_f64_f64_1683_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/SUB_f64_f64_1683_Update/cr
      -- 
    cp_elements(359) <= cp_elements(307);
    cr_5916_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(359), ack => SUB_f64_f64_1683_inst_req_1); -- 
    -- CP-element group 360 transition  input  bypass 
    -- predecessors 358 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/SUB_f64_f64_1683_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/SUB_f64_f64_1683_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/SUB_f64_f64_1683_Sample/ra
      -- 
    ra_5912_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => SUB_f64_f64_1683_inst_ack_0, ack => cp_elements(360)); -- 
    -- CP-element group 361 transition  input  bypass 
    -- predecessors 359 
    -- successors 362 
    -- members (7) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/SUB_f64_f64_1683_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/SUB_f64_f64_1683_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/SUB_f64_f64_1683_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_68_1687_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_68_1687_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_68_1687_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_68_1687_update_completed_
      -- 
    ca_5917_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => SUB_f64_f64_1683_inst_ack_1, ack => cp_elements(361)); -- 
    -- CP-element group 362 join  transition  output  bypass 
    -- predecessors 361 364 
    -- successors 365 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1688_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1688_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1688_Sample/rr
      -- 
    cp_element_group_362: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_362"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(361) & cp_elements(364);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(362), clk => clk, reset => reset); --
    end block;
    rr_5933_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(362), ack => MUL_f64_f64_1688_inst_req_0); -- 
    -- CP-element group 363 transition  output  bypass 
    -- predecessors 307 
    -- successors 366 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1688_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1688_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1688_Update/cr
      -- 
    cp_elements(363) <= cp_elements(307);
    cr_5938_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(363), ack => MUL_f64_f64_1688_inst_req_1); -- 
    -- CP-element group 364 transition  bypass 
    -- predecessors 352 
    -- successors 362 
    -- members (4) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_66_1686_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_66_1686_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_66_1686_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_66_1686_update_completed_
      -- 
    cp_elements(364) <= cp_elements(352);
    -- CP-element group 365 transition  input  bypass 
    -- predecessors 362 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1688_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1688_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1688_Sample/ra
      -- 
    ra_5934_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f64_f64_1688_inst_ack_0, ack => cp_elements(365)); -- 
    -- CP-element group 366 transition  input  bypass 
    -- predecessors 363 
    -- successors 376 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1688_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1688_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/MUL_f64_f64_1688_Update/ca
      -- 
    ca_5939_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f64_f64_1688_inst_ack_1, ack => cp_elements(366)); -- 
    -- CP-element group 367 transition  output  bypass 
    -- predecessors 307 
    -- successors 370 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/EQ_u64_u1_1694_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/EQ_u64_u1_1694_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/EQ_u64_u1_1694_Update/cr
      -- 
    cp_elements(367) <= cp_elements(307);
    cr_5956_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(367), ack => EQ_u64_u1_1694_inst_req_1); -- 
    -- CP-element group 368 transition  output  bypass 
    -- predecessors 307 
    -- successors 369 
    -- members (7) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/EQ_u64_u1_1694_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_46_1691_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_46_1691_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_46_1691_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_46_1691_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/EQ_u64_u1_1694_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/EQ_u64_u1_1694_Sample/rr
      -- 
    cp_elements(368) <= cp_elements(307);
    rr_5951_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(368), ack => EQ_u64_u1_1694_inst_req_0); -- 
    -- CP-element group 369 transition  input  bypass 
    -- predecessors 368 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/EQ_u64_u1_1694_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/EQ_u64_u1_1694_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/EQ_u64_u1_1694_Sample/ra
      -- 
    ra_5952_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => EQ_u64_u1_1694_inst_ack_0, ack => cp_elements(369)); -- 
    -- CP-element group 370 transition  input  bypass 
    -- predecessors 367 
    -- successors 371 
    -- members (7) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/EQ_u64_u1_1694_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/EQ_u64_u1_1694_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/EQ_u64_u1_1694_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_70_1698_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_70_1698_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_70_1698_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_70_1698_update_completed_
      -- 
    ca_5957_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => EQ_u64_u1_1694_inst_ack_1, ack => cp_elements(370)); -- 
    -- CP-element group 371 join  transition  output  bypass 
    -- predecessors 370 373 
    -- successors 374 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/OR_u1_u1_1699_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/OR_u1_u1_1699_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/OR_u1_u1_1699_Sample/rr
      -- 
    cp_element_group_371: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_371"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(370) & cp_elements(373);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(371), clk => clk, reset => reset); --
    end block;
    rr_5973_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(371), ack => OR_u1_u1_1699_inst_req_0); -- 
    -- CP-element group 372 transition  output  bypass 
    -- predecessors 307 
    -- successors 375 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/OR_u1_u1_1699_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/OR_u1_u1_1699_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/OR_u1_u1_1699_Update/cr
      -- 
    cp_elements(372) <= cp_elements(307);
    cr_5978_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(372), ack => OR_u1_u1_1699_inst_req_1); -- 
    -- CP-element group 373 transition  bypass 
    -- predecessors 307 
    -- successors 371 
    -- members (4) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_47_1697_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_47_1697_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_47_1697_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/R_iNsTr_47_1697_update_completed_
      -- 
    cp_elements(373) <= cp_elements(307);
    -- CP-element group 374 transition  input  bypass 
    -- predecessors 371 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/OR_u1_u1_1699_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/OR_u1_u1_1699_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/OR_u1_u1_1699_Sample/ra
      -- 
    ra_5974_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => OR_u1_u1_1699_inst_ack_0, ack => cp_elements(374)); -- 
    -- CP-element group 375 transition  input  bypass 
    -- predecessors 372 
    -- successors 376 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/OR_u1_u1_1699_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/OR_u1_u1_1699_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/OR_u1_u1_1699_Update/ca
      -- 
    ca_5979_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => OR_u1_u1_1699_inst_ack_1, ack => cp_elements(375)); -- 
    -- CP-element group 376 join  transition  bypass 
    -- predecessors 366 375 
    -- successors 14 
    -- members (1) 
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700/$exit
      -- 
    cp_element_group_376: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_376"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(366) & cp_elements(375);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(376), clk => clk, reset => reset); --
    end block;
    -- CP-element group 377 transition  place  dead  bypass 
    -- predecessors 14 
    -- successors 15 
    -- members (8) 
      -- 	branch_block_stmt_1166/if_stmt_1701__exit__
      -- 	branch_block_stmt_1166/merge_stmt_1707__entry__
      -- 	branch_block_stmt_1166/if_stmt_1701_dead_link/$entry
      -- 	branch_block_stmt_1166/if_stmt_1701_dead_link/$exit
      -- 	branch_block_stmt_1166/if_stmt_1701_dead_link/dead_transition
      -- 	branch_block_stmt_1166/merge_stmt_1707_dead_link/$entry
      -- 	branch_block_stmt_1166/merge_stmt_1707_dead_link/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1707_dead_link/dead_transition
      -- 
    cp_elements(377) <= false;
    -- CP-element group 378 transition  output  bypass 
    -- predecessors 14 
    -- successors 379 
    -- members (3) 
      -- 	branch_block_stmt_1166/if_stmt_1701_eval_test/$entry
      -- 	branch_block_stmt_1166/if_stmt_1701_eval_test/$exit
      -- 	branch_block_stmt_1166/if_stmt_1701_eval_test/branch_req
      -- 
    cp_elements(378) <= cp_elements(14);
    branch_req_5987_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(378), ack => if_stmt_1701_branch_req_0); -- 
    -- CP-element group 379 branch  place  bypass 
    -- predecessors 378 
    -- successors 380 382 
    -- members (1) 
      -- 	branch_block_stmt_1166/R_orx_xcondx_xix_xi_1702_place
      -- 
    cp_elements(379) <= cp_elements(378);
    -- CP-element group 380 transition  bypass 
    -- predecessors 379 
    -- successors 381 
    -- members (1) 
      -- 	branch_block_stmt_1166/if_stmt_1701_if_link/$entry
      -- 
    cp_elements(380) <= cp_elements(379);
    -- CP-element group 381 fork  transition  place  input  bypass 
    -- predecessors 380 
    -- successors 822 823 
    -- members (8) 
      -- 	branch_block_stmt_1166/bb_19_iq_err_calcx_xexit
      -- 	branch_block_stmt_1166/if_stmt_1701_if_link/$exit
      -- 	branch_block_stmt_1166/if_stmt_1701_if_link/if_choice_transition
      -- 	branch_block_stmt_1166/bb_19_iq_err_calcx_xexit_PhiReq/$entry
      -- 	branch_block_stmt_1166/bb_19_iq_err_calcx_xexit_PhiReq/phi_stmt_1756/$entry
      -- 	branch_block_stmt_1166/bb_19_iq_err_calcx_xexit_PhiReq/phi_stmt_1756/phi_stmt_1756_sources/$entry
      -- 	branch_block_stmt_1166/bb_19_iq_err_calcx_xexit_PhiReq/phi_stmt_1756/phi_stmt_1756_sources/type_cast_1759/$entry
      -- 	branch_block_stmt_1166/bb_19_iq_err_calcx_xexit_PhiReq/phi_stmt_1756/phi_stmt_1756_sources/type_cast_1759/SplitProtocol/$entry
      -- 
    if_choice_transition_5992_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_1701_branch_ack_1, ack => cp_elements(381)); -- 
    -- CP-element group 382 transition  bypass 
    -- predecessors 379 
    -- successors 383 
    -- members (1) 
      -- 	branch_block_stmt_1166/if_stmt_1701_else_link/$entry
      -- 
    cp_elements(382) <= cp_elements(379);
    -- CP-element group 383 transition  place  input  bypass 
    -- predecessors 382 
    -- successors 15 
    -- members (9) 
      -- 	branch_block_stmt_1166/bb_19_bb_20
      -- 	branch_block_stmt_1166/if_stmt_1701_else_link/$exit
      -- 	branch_block_stmt_1166/if_stmt_1701_else_link/else_choice_transition
      -- 	branch_block_stmt_1166/merge_stmt_1707_PhiReqMerge
      -- 	branch_block_stmt_1166/bb_19_bb_20_PhiReq/$entry
      -- 	branch_block_stmt_1166/bb_19_bb_20_PhiReq/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1707_PhiAck/$entry
      -- 	branch_block_stmt_1166/merge_stmt_1707_PhiAck/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1707_PhiAck/dummy
      -- 
    else_choice_transition_5996_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_1701_branch_ack_0, ack => cp_elements(383)); -- 
    -- CP-element group 384 fork  transition  bypass 
    -- predecessors 15 
    -- successors 386 387 388 391 392 395 399 400 404 405 408 412 415 418 
    -- members (1) 
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/$entry
      -- 
    cp_elements(384) <= cp_elements(15);
    -- CP-element group 385 join  transition  output  bypass 
    -- predecessors 387 388 
    -- successors 389 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/MUL_f64_f64_1711_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/MUL_f64_f64_1711_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/MUL_f64_f64_1711_Sample/rr
      -- 
    cp_element_group_385: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_385"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(387) & cp_elements(388);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(385), clk => clk, reset => reset); --
    end block;
    rr_6017_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(385), ack => MUL_f64_f64_1711_inst_req_0); -- 
    -- CP-element group 386 transition  output  bypass 
    -- predecessors 384 
    -- successors 390 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/MUL_f64_f64_1711_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/MUL_f64_f64_1711_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/MUL_f64_f64_1711_Update/cr
      -- 
    cp_elements(386) <= cp_elements(384);
    cr_6022_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(386), ack => MUL_f64_f64_1711_inst_req_1); -- 
    -- CP-element group 387 transition  bypass 
    -- predecessors 384 
    -- successors 385 
    -- members (4) 
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/R_tmp11x_xix_xi_1709_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/R_tmp11x_xix_xi_1709_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/R_tmp11x_xix_xi_1709_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/R_tmp11x_xix_xi_1709_update_completed_
      -- 
    cp_elements(387) <= cp_elements(384);
    -- CP-element group 388 transition  bypass 
    -- predecessors 384 
    -- successors 385 
    -- members (4) 
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/R_iNsTr_69_1710_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/R_iNsTr_69_1710_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/R_iNsTr_69_1710_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/R_iNsTr_69_1710_update_completed_
      -- 
    cp_elements(388) <= cp_elements(384);
    -- CP-element group 389 transition  input  bypass 
    -- predecessors 385 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/MUL_f64_f64_1711_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/MUL_f64_f64_1711_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/MUL_f64_f64_1711_Sample/ra
      -- 
    ra_6018_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f64_f64_1711_inst_ack_0, ack => cp_elements(389)); -- 
    -- CP-element group 390 transition  input  output  bypass 
    -- predecessors 386 
    -- successors 396 
    -- members (10) 
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/MUL_f64_f64_1711_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/MUL_f64_f64_1711_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/MUL_f64_f64_1711_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/SUB_f64_f64_1723_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/R_iNsTr_94_1722_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/R_iNsTr_94_1722_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/R_iNsTr_94_1722_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/R_iNsTr_94_1722_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/SUB_f64_f64_1723_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/SUB_f64_f64_1723_Sample/rr
      -- 
    ca_6023_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f64_f64_1711_inst_ack_1, ack => cp_elements(390)); -- 
    rr_6053_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(390), ack => SUB_f64_f64_1723_inst_req_0); -- 
    -- CP-element group 391 transition  output  bypass 
    -- predecessors 384 
    -- successors 394 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/AND_u64_u64_1717_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/AND_u64_u64_1717_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/AND_u64_u64_1717_Update/cr
      -- 
    cp_elements(391) <= cp_elements(384);
    cr_6040_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(391), ack => AND_u64_u64_1717_inst_req_1); -- 
    -- CP-element group 392 transition  output  bypass 
    -- predecessors 384 
    -- successors 393 
    -- members (7) 
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/AND_u64_u64_1717_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/R_torque_refx_x0_1714_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/R_torque_refx_x0_1714_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/R_torque_refx_x0_1714_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/R_torque_refx_x0_1714_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/AND_u64_u64_1717_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/AND_u64_u64_1717_Sample/rr
      -- 
    cp_elements(392) <= cp_elements(384);
    rr_6035_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(392), ack => AND_u64_u64_1717_inst_req_0); -- 
    -- CP-element group 393 transition  input  bypass 
    -- predecessors 392 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/AND_u64_u64_1717_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/AND_u64_u64_1717_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/AND_u64_u64_1717_Sample/ra
      -- 
    ra_6036_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => AND_u64_u64_1717_inst_ack_0, ack => cp_elements(393)); -- 
    -- CP-element group 394 transition  input  bypass 
    -- predecessors 391 
    -- successors 398 
    -- members (7) 
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/AND_u64_u64_1717_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/AND_u64_u64_1717_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/AND_u64_u64_1717_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/R_iNsTr_95_1727_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/R_iNsTr_95_1727_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/R_iNsTr_95_1727_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/R_iNsTr_95_1727_update_completed_
      -- 
    ca_6041_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => AND_u64_u64_1717_inst_ack_1, ack => cp_elements(394)); -- 
    -- CP-element group 395 transition  output  bypass 
    -- predecessors 384 
    -- successors 397 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/SUB_f64_f64_1723_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/SUB_f64_f64_1723_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/SUB_f64_f64_1723_Update/cr
      -- 
    cp_elements(395) <= cp_elements(384);
    cr_6058_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(395), ack => SUB_f64_f64_1723_inst_req_1); -- 
    -- CP-element group 396 transition  input  bypass 
    -- predecessors 390 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/SUB_f64_f64_1723_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/SUB_f64_f64_1723_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/SUB_f64_f64_1723_Sample/ra
      -- 
    ra_6054_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => SUB_f64_f64_1723_inst_ack_0, ack => cp_elements(396)); -- 
    -- CP-element group 397 transition  input  bypass 
    -- predecessors 395 
    -- successors 403 
    -- members (7) 
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/SUB_f64_f64_1723_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/SUB_f64_f64_1723_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/SUB_f64_f64_1723_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/R_iNsTr_96_1732_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/R_iNsTr_96_1732_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/R_iNsTr_96_1732_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/R_iNsTr_96_1732_update_completed_
      -- 
    ca_6059_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => SUB_f64_f64_1723_inst_ack_1, ack => cp_elements(397)); -- 
    -- CP-element group 398 join  transition  output  bypass 
    -- predecessors 394 400 
    -- successors 401 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/OR_u64_u64_1728_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/OR_u64_u64_1728_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/OR_u64_u64_1728_Sample/rr
      -- 
    cp_element_group_398: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_398"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(394) & cp_elements(400);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(398), clk => clk, reset => reset); --
    end block;
    rr_6075_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(398), ack => OR_u64_u64_1728_inst_req_0); -- 
    -- CP-element group 399 transition  output  bypass 
    -- predecessors 384 
    -- successors 402 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/OR_u64_u64_1728_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/OR_u64_u64_1728_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/OR_u64_u64_1728_Update/cr
      -- 
    cp_elements(399) <= cp_elements(384);
    cr_6080_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(399), ack => OR_u64_u64_1728_inst_req_1); -- 
    -- CP-element group 400 transition  bypass 
    -- predecessors 384 
    -- successors 398 
    -- members (4) 
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/R_iNsTr_56_1726_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/R_iNsTr_56_1726_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/R_iNsTr_56_1726_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/R_iNsTr_56_1726_update_completed_
      -- 
    cp_elements(400) <= cp_elements(384);
    -- CP-element group 401 transition  input  bypass 
    -- predecessors 398 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/OR_u64_u64_1728_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/OR_u64_u64_1728_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/OR_u64_u64_1728_Sample/ra
      -- 
    ra_6076_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => OR_u64_u64_1728_inst_ack_0, ack => cp_elements(401)); -- 
    -- CP-element group 402 transition  input  output  bypass 
    -- predecessors 399 
    -- successors 409 
    -- members (10) 
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/OR_u64_u64_1728_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/OR_u64_u64_1728_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/OR_u64_u64_1728_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/type_cast_1737_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/R_iNsTr_97_1736_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/R_iNsTr_97_1736_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/R_iNsTr_97_1736_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/R_iNsTr_97_1736_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/type_cast_1737_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/type_cast_1737_Sample/rr
      -- 
    ca_6081_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => OR_u64_u64_1728_inst_ack_1, ack => cp_elements(402)); -- 
    rr_6115_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(402), ack => type_cast_1737_inst_req_0); -- 
    -- CP-element group 403 join  transition  output  bypass 
    -- predecessors 397 405 
    -- successors 406 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/MUL_f64_f64_1733_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/MUL_f64_f64_1733_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/MUL_f64_f64_1733_Sample/rr
      -- 
    cp_element_group_403: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_403"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(397) & cp_elements(405);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(403), clk => clk, reset => reset); --
    end block;
    rr_6097_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(403), ack => MUL_f64_f64_1733_inst_req_0); -- 
    -- CP-element group 404 transition  output  bypass 
    -- predecessors 384 
    -- successors 407 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/MUL_f64_f64_1733_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/MUL_f64_f64_1733_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/MUL_f64_f64_1733_Update/cr
      -- 
    cp_elements(404) <= cp_elements(384);
    cr_6102_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(404), ack => MUL_f64_f64_1733_inst_req_1); -- 
    -- CP-element group 405 transition  bypass 
    -- predecessors 384 
    -- successors 403 
    -- members (4) 
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/R_iNsTr_69_1731_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/R_iNsTr_69_1731_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/R_iNsTr_69_1731_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/R_iNsTr_69_1731_update_completed_
      -- 
    cp_elements(405) <= cp_elements(384);
    -- CP-element group 406 transition  input  bypass 
    -- predecessors 403 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/MUL_f64_f64_1733_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/MUL_f64_f64_1733_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/MUL_f64_f64_1733_Sample/ra
      -- 
    ra_6098_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f64_f64_1733_inst_ack_0, ack => cp_elements(406)); -- 
    -- CP-element group 407 transition  input  bypass 
    -- predecessors 404 
    -- successors 411 
    -- members (7) 
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/MUL_f64_f64_1733_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/MUL_f64_f64_1733_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/MUL_f64_f64_1733_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/R_iNsTr_98_1741_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/R_iNsTr_98_1741_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/R_iNsTr_98_1741_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/R_iNsTr_98_1741_update_completed_
      -- 
    ca_6103_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f64_f64_1733_inst_ack_1, ack => cp_elements(407)); -- 
    -- CP-element group 408 transition  output  bypass 
    -- predecessors 384 
    -- successors 410 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/type_cast_1737_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/type_cast_1737_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/type_cast_1737_Update/cr
      -- 
    cp_elements(408) <= cp_elements(384);
    cr_6120_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(408), ack => type_cast_1737_inst_req_1); -- 
    -- CP-element group 409 transition  input  bypass 
    -- predecessors 402 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/type_cast_1737_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/type_cast_1737_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/type_cast_1737_Sample/ra
      -- 
    ra_6116_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1737_inst_ack_0, ack => cp_elements(409)); -- 
    -- CP-element group 410 transition  input  bypass 
    -- predecessors 408 
    -- successors 411 
    -- members (7) 
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/type_cast_1737_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/type_cast_1737_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/type_cast_1737_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/R_tmp13x_xix_xi_1740_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/R_tmp13x_xix_xi_1740_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/R_tmp13x_xix_xi_1740_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/R_tmp13x_xix_xi_1740_update_completed_
      -- 
    ca_6121_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1737_inst_ack_1, ack => cp_elements(410)); -- 
    -- CP-element group 411 join  transition  output  bypass 
    -- predecessors 407 410 
    -- successors 413 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/MUL_f64_f64_1742_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/MUL_f64_f64_1742_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/MUL_f64_f64_1742_Sample/rr
      -- 
    cp_element_group_411: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_411"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(407) & cp_elements(410);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(411), clk => clk, reset => reset); --
    end block;
    rr_6137_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(411), ack => MUL_f64_f64_1742_inst_req_0); -- 
    -- CP-element group 412 transition  output  bypass 
    -- predecessors 384 
    -- successors 414 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/MUL_f64_f64_1742_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/MUL_f64_f64_1742_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/MUL_f64_f64_1742_Update/cr
      -- 
    cp_elements(412) <= cp_elements(384);
    cr_6142_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(412), ack => MUL_f64_f64_1742_inst_req_1); -- 
    -- CP-element group 413 transition  input  bypass 
    -- predecessors 411 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/MUL_f64_f64_1742_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/MUL_f64_f64_1742_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/MUL_f64_f64_1742_Sample/ra
      -- 
    ra_6138_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f64_f64_1742_inst_ack_0, ack => cp_elements(413)); -- 
    -- CP-element group 414 transition  input  output  bypass 
    -- predecessors 412 
    -- successors 416 
    -- members (10) 
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/MUL_f64_f64_1742_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/MUL_f64_f64_1742_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/MUL_f64_f64_1742_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/type_cast_1746_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/R_iNsTr_99_1745_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/R_iNsTr_99_1745_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/R_iNsTr_99_1745_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/R_iNsTr_99_1745_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/type_cast_1746_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/type_cast_1746_Sample/rr
      -- 
    ca_6143_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f64_f64_1742_inst_ack_1, ack => cp_elements(414)); -- 
    rr_6155_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(414), ack => type_cast_1746_inst_req_0); -- 
    -- CP-element group 415 transition  output  bypass 
    -- predecessors 384 
    -- successors 417 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/type_cast_1746_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/type_cast_1746_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/type_cast_1746_Update/cr
      -- 
    cp_elements(415) <= cp_elements(384);
    cr_6160_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(415), ack => type_cast_1746_inst_req_1); -- 
    -- CP-element group 416 transition  input  bypass 
    -- predecessors 414 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/type_cast_1746_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/type_cast_1746_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/type_cast_1746_Sample/ra
      -- 
    ra_6156_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1746_inst_ack_0, ack => cp_elements(416)); -- 
    -- CP-element group 417 transition  input  output  bypass 
    -- predecessors 415 
    -- successors 419 
    -- members (10) 
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/type_cast_1746_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/type_cast_1746_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/type_cast_1746_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/AND_u64_u64_1752_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/R_phitmp19x_xix_xi_1749_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/R_phitmp19x_xix_xi_1749_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/R_phitmp19x_xix_xi_1749_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/R_phitmp19x_xix_xi_1749_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/AND_u64_u64_1752_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/AND_u64_u64_1752_Sample/rr
      -- 
    ca_6161_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1746_inst_ack_1, ack => cp_elements(417)); -- 
    rr_6173_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(417), ack => AND_u64_u64_1752_inst_req_0); -- 
    -- CP-element group 418 transition  output  bypass 
    -- predecessors 384 
    -- successors 420 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/AND_u64_u64_1752_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/AND_u64_u64_1752_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/AND_u64_u64_1752_Update/cr
      -- 
    cp_elements(418) <= cp_elements(384);
    cr_6178_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(418), ack => AND_u64_u64_1752_inst_req_1); -- 
    -- CP-element group 419 transition  input  bypass 
    -- predecessors 417 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/AND_u64_u64_1752_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/AND_u64_u64_1752_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/AND_u64_u64_1752_Sample/ra
      -- 
    ra_6174_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => AND_u64_u64_1752_inst_ack_0, ack => cp_elements(419)); -- 
    -- CP-element group 420 fork  transition  place  input  bypass 
    -- predecessors 418 
    -- successors 825 827 
    -- members (11) 
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753__exit__
      -- 	branch_block_stmt_1166/bb_20_iq_err_calcx_xexit
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/AND_u64_u64_1752_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/AND_u64_u64_1752_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1712_to_assign_stmt_1753/AND_u64_u64_1752_Update/ca
      -- 	branch_block_stmt_1166/bb_20_iq_err_calcx_xexit_PhiReq/$entry
      -- 	branch_block_stmt_1166/bb_20_iq_err_calcx_xexit_PhiReq/phi_stmt_1756/$entry
      -- 	branch_block_stmt_1166/bb_20_iq_err_calcx_xexit_PhiReq/phi_stmt_1756/phi_stmt_1756_sources/$entry
      -- 	branch_block_stmt_1166/bb_20_iq_err_calcx_xexit_PhiReq/phi_stmt_1756/phi_stmt_1756_sources/type_cast_1759/$entry
      -- 	branch_block_stmt_1166/bb_20_iq_err_calcx_xexit_PhiReq/phi_stmt_1756/phi_stmt_1756_sources/type_cast_1759/SplitProtocol/$entry
      -- 
    ca_6179_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => AND_u64_u64_1752_inst_ack_1, ack => cp_elements(420)); -- 
    -- CP-element group 421 fork  transition  bypass 
    -- predecessors 832 
    -- successors 423 424 425 428 432 433 436 439 443 444 445 448 452 453 456 459 
    -- members (1) 
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/$entry
      -- 
    cp_elements(421) <= cp_elements(832);
    -- CP-element group 422 join  transition  output  bypass 
    -- predecessors 424 425 
    -- successors 426 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/XOR_u64_u64_1767_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/XOR_u64_u64_1767_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/XOR_u64_u64_1767_Sample/rr
      -- 
    cp_element_group_422: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_422"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(424) & cp_elements(425);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(422), clk => clk, reset => reset); --
    end block;
    rr_6198_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(422), ack => XOR_u64_u64_1767_inst_req_0); -- 
    -- CP-element group 423 transition  output  bypass 
    -- predecessors 421 
    -- successors 427 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/XOR_u64_u64_1767_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/XOR_u64_u64_1767_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/XOR_u64_u64_1767_Update/cr
      -- 
    cp_elements(423) <= cp_elements(421);
    cr_6203_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(423), ack => XOR_u64_u64_1767_inst_req_1); -- 
    -- CP-element group 424 transition  bypass 
    -- predecessors 421 
    -- successors 422 
    -- members (4) 
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_torque_refx_x0_1765_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_torque_refx_x0_1765_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_torque_refx_x0_1765_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_torque_refx_x0_1765_update_completed_
      -- 
    cp_elements(424) <= cp_elements(421);
    -- CP-element group 425 transition  bypass 
    -- predecessors 421 
    -- successors 422 
    -- members (4) 
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_tmp15x_xix_xi_1766_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_tmp15x_xix_xi_1766_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_tmp15x_xix_xi_1766_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_tmp15x_xix_xi_1766_update_completed_
      -- 
    cp_elements(425) <= cp_elements(421);
    -- CP-element group 426 transition  input  bypass 
    -- predecessors 422 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/XOR_u64_u64_1767_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/XOR_u64_u64_1767_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/XOR_u64_u64_1767_Sample/ra
      -- 
    ra_6199_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => XOR_u64_u64_1767_inst_ack_0, ack => cp_elements(426)); -- 
    -- CP-element group 427 transition  input  output  bypass 
    -- predecessors 423 
    -- successors 429 
    -- members (10) 
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/XOR_u64_u64_1767_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/XOR_u64_u64_1767_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/XOR_u64_u64_1767_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/AND_u64_u64_1773_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_iNsTr_84_1770_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_iNsTr_84_1770_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_iNsTr_84_1770_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_iNsTr_84_1770_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/AND_u64_u64_1773_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/AND_u64_u64_1773_Sample/rr
      -- 
    ca_6204_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => XOR_u64_u64_1767_inst_ack_1, ack => cp_elements(427)); -- 
    rr_6216_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(427), ack => AND_u64_u64_1773_inst_req_0); -- 
    -- CP-element group 428 transition  output  bypass 
    -- predecessors 421 
    -- successors 430 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/AND_u64_u64_1773_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/AND_u64_u64_1773_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/AND_u64_u64_1773_Update/cr
      -- 
    cp_elements(428) <= cp_elements(421);
    cr_6221_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(428), ack => AND_u64_u64_1773_inst_req_1); -- 
    -- CP-element group 429 transition  input  bypass 
    -- predecessors 427 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/AND_u64_u64_1773_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/AND_u64_u64_1773_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/AND_u64_u64_1773_Sample/ra
      -- 
    ra_6217_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => AND_u64_u64_1773_inst_ack_0, ack => cp_elements(429)); -- 
    -- CP-element group 430 transition  input  bypass 
    -- predecessors 428 
    -- successors 431 
    -- members (7) 
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/AND_u64_u64_1773_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/AND_u64_u64_1773_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/AND_u64_u64_1773_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_iNsTr_85_1777_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_iNsTr_85_1777_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_iNsTr_85_1777_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_iNsTr_85_1777_update_completed_
      -- 
    ca_6222_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => AND_u64_u64_1773_inst_ack_1, ack => cp_elements(430)); -- 
    -- CP-element group 431 join  transition  output  bypass 
    -- predecessors 430 433 
    -- successors 434 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/OR_u64_u64_1778_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/OR_u64_u64_1778_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/OR_u64_u64_1778_Sample/rr
      -- 
    cp_element_group_431: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_431"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(430) & cp_elements(433);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(431), clk => clk, reset => reset); --
    end block;
    rr_6238_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(431), ack => OR_u64_u64_1778_inst_req_0); -- 
    -- CP-element group 432 transition  output  bypass 
    -- predecessors 421 
    -- successors 435 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/OR_u64_u64_1778_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/OR_u64_u64_1778_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/OR_u64_u64_1778_Update/cr
      -- 
    cp_elements(432) <= cp_elements(421);
    cr_6243_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(432), ack => OR_u64_u64_1778_inst_req_1); -- 
    -- CP-element group 433 transition  bypass 
    -- predecessors 421 
    -- successors 431 
    -- members (4) 
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_iNsTr_83_1776_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_iNsTr_83_1776_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_iNsTr_83_1776_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_iNsTr_83_1776_update_completed_
      -- 
    cp_elements(433) <= cp_elements(421);
    -- CP-element group 434 transition  input  bypass 
    -- predecessors 431 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/OR_u64_u64_1778_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/OR_u64_u64_1778_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/OR_u64_u64_1778_Sample/ra
      -- 
    ra_6239_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => OR_u64_u64_1778_inst_ack_0, ack => cp_elements(434)); -- 
    -- CP-element group 435 transition  input  output  bypass 
    -- predecessors 432 
    -- successors 437 
    -- members (10) 
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/OR_u64_u64_1778_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/OR_u64_u64_1778_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/OR_u64_u64_1778_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/type_cast_1782_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_iNsTr_86_1781_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_iNsTr_86_1781_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_iNsTr_86_1781_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_iNsTr_86_1781_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/type_cast_1782_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/type_cast_1782_Sample/rr
      -- 
    ca_6244_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => OR_u64_u64_1778_inst_ack_1, ack => cp_elements(435)); -- 
    rr_6256_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(435), ack => type_cast_1782_inst_req_0); -- 
    -- CP-element group 436 transition  output  bypass 
    -- predecessors 421 
    -- successors 438 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/type_cast_1782_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/type_cast_1782_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/type_cast_1782_Update/cr
      -- 
    cp_elements(436) <= cp_elements(421);
    cr_6261_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(436), ack => type_cast_1782_inst_req_1); -- 
    -- CP-element group 437 transition  input  bypass 
    -- predecessors 435 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/type_cast_1782_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/type_cast_1782_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/type_cast_1782_Sample/ra
      -- 
    ra_6257_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1782_inst_ack_0, ack => cp_elements(437)); -- 
    -- CP-element group 438 transition  input  output  bypass 
    -- predecessors 436 
    -- successors 440 
    -- members (10) 
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/type_cast_1782_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/type_cast_1782_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/type_cast_1782_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/type_cast_1786_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_tmp4x_xix_xi_1785_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_tmp4x_xix_xi_1785_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_tmp4x_xix_xi_1785_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_tmp4x_xix_xi_1785_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/type_cast_1786_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/type_cast_1786_Sample/rr
      -- 
    ca_6262_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1782_inst_ack_1, ack => cp_elements(438)); -- 
    rr_6274_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(438), ack => type_cast_1786_inst_req_0); -- 
    -- CP-element group 439 transition  output  bypass 
    -- predecessors 421 
    -- successors 441 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/type_cast_1786_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/type_cast_1786_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/type_cast_1786_Update/cr
      -- 
    cp_elements(439) <= cp_elements(421);
    cr_6279_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(439), ack => type_cast_1786_inst_req_1); -- 
    -- CP-element group 440 transition  input  bypass 
    -- predecessors 438 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/type_cast_1786_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/type_cast_1786_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/type_cast_1786_Sample/ra
      -- 
    ra_6275_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1786_inst_ack_0, ack => cp_elements(440)); -- 
    -- CP-element group 441 transition  input  bypass 
    -- predecessors 439 
    -- successors 462 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/type_cast_1786_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/type_cast_1786_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/type_cast_1786_Update/ca
      -- 
    ca_6280_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1786_inst_ack_1, ack => cp_elements(441)); -- 
    -- CP-element group 442 join  transition  output  bypass 
    -- predecessors 444 445 
    -- successors 446 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/SUB_f32_f32_1791_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/SUB_f32_f32_1791_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/SUB_f32_f32_1791_Sample/rr
      -- 
    cp_element_group_442: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_442"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(444) & cp_elements(445);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(442), clk => clk, reset => reset); --
    end block;
    rr_6296_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(442), ack => SUB_f32_f32_1791_inst_req_0); -- 
    -- CP-element group 443 transition  output  bypass 
    -- predecessors 421 
    -- successors 447 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/SUB_f32_f32_1791_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/SUB_f32_f32_1791_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/SUB_f32_f32_1791_Update/cr
      -- 
    cp_elements(443) <= cp_elements(421);
    cr_6301_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(443), ack => SUB_f32_f32_1791_inst_req_1); -- 
    -- CP-element group 444 transition  bypass 
    -- predecessors 421 
    -- successors 442 
    -- members (4) 
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_flux_refx_x0_1789_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_flux_refx_x0_1789_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_flux_refx_x0_1789_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_flux_refx_x0_1789_update_completed_
      -- 
    cp_elements(444) <= cp_elements(421);
    -- CP-element group 445 transition  bypass 
    -- predecessors 421 
    -- successors 442 
    -- members (4) 
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_iNsTr_40_1790_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_iNsTr_40_1790_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_iNsTr_40_1790_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_iNsTr_40_1790_update_completed_
      -- 
    cp_elements(445) <= cp_elements(421);
    -- CP-element group 446 transition  input  bypass 
    -- predecessors 442 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/SUB_f32_f32_1791_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/SUB_f32_f32_1791_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/SUB_f32_f32_1791_Sample/ra
      -- 
    ra_6297_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => SUB_f32_f32_1791_inst_ack_0, ack => cp_elements(446)); -- 
    -- CP-element group 447 transition  input  output  bypass 
    -- predecessors 443 
    -- successors 449 
    -- members (10) 
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/SUB_f32_f32_1791_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/SUB_f32_f32_1791_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/SUB_f32_f32_1791_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/MUL_f32_f32_1797_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_iNsTr_88_1794_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_iNsTr_88_1794_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_iNsTr_88_1794_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_iNsTr_88_1794_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/MUL_f32_f32_1797_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/MUL_f32_f32_1797_Sample/rr
      -- 
    ca_6302_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => SUB_f32_f32_1791_inst_ack_1, ack => cp_elements(447)); -- 
    rr_6314_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(447), ack => MUL_f32_f32_1797_inst_req_0); -- 
    -- CP-element group 448 transition  output  bypass 
    -- predecessors 421 
    -- successors 450 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/MUL_f32_f32_1797_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/MUL_f32_f32_1797_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/MUL_f32_f32_1797_Update/cr
      -- 
    cp_elements(448) <= cp_elements(421);
    cr_6319_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(448), ack => MUL_f32_f32_1797_inst_req_1); -- 
    -- CP-element group 449 transition  input  bypass 
    -- predecessors 447 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/MUL_f32_f32_1797_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/MUL_f32_f32_1797_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/MUL_f32_f32_1797_Sample/ra
      -- 
    ra_6315_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f32_f32_1797_inst_ack_0, ack => cp_elements(449)); -- 
    -- CP-element group 450 transition  input  bypass 
    -- predecessors 448 
    -- successors 451 
    -- members (7) 
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/MUL_f32_f32_1797_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/MUL_f32_f32_1797_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/MUL_f32_f32_1797_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_iNsTr_89_1800_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_iNsTr_89_1800_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_iNsTr_89_1800_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_iNsTr_89_1800_update_completed_
      -- 
    ca_6320_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f32_f32_1797_inst_ack_1, ack => cp_elements(450)); -- 
    -- CP-element group 451 join  transition  output  bypass 
    -- predecessors 450 453 
    -- successors 454 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/ADD_f32_f32_1802_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/ADD_f32_f32_1802_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/ADD_f32_f32_1802_Sample/rr
      -- 
    cp_element_group_451: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_451"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(450) & cp_elements(453);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(451), clk => clk, reset => reset); --
    end block;
    rr_6336_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(451), ack => ADD_f32_f32_1802_inst_req_0); -- 
    -- CP-element group 452 transition  output  bypass 
    -- predecessors 421 
    -- successors 455 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/ADD_f32_f32_1802_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/ADD_f32_f32_1802_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/ADD_f32_f32_1802_Update/cr
      -- 
    cp_elements(452) <= cp_elements(421);
    cr_6341_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(452), ack => ADD_f32_f32_1802_inst_req_1); -- 
    -- CP-element group 453 transition  bypass 
    -- predecessors 421 
    -- successors 451 
    -- members (4) 
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_int_flux_err_temp_2x_x0_1801_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_int_flux_err_temp_2x_x0_1801_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_int_flux_err_temp_2x_x0_1801_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_int_flux_err_temp_2x_x0_1801_update_completed_
      -- 
    cp_elements(453) <= cp_elements(421);
    -- CP-element group 454 transition  input  bypass 
    -- predecessors 451 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/ADD_f32_f32_1802_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/ADD_f32_f32_1802_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/ADD_f32_f32_1802_Sample/ra
      -- 
    ra_6337_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ADD_f32_f32_1802_inst_ack_0, ack => cp_elements(454)); -- 
    -- CP-element group 455 transition  input  output  bypass 
    -- predecessors 452 
    -- successors 457 
    -- members (10) 
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/ADD_f32_f32_1802_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/ADD_f32_f32_1802_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/ADD_f32_f32_1802_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/MUL_f32_f32_1808_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_iNsTr_90_1805_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_iNsTr_90_1805_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_iNsTr_90_1805_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_iNsTr_90_1805_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/MUL_f32_f32_1808_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/MUL_f32_f32_1808_Sample/rr
      -- 
    ca_6342_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ADD_f32_f32_1802_inst_ack_1, ack => cp_elements(455)); -- 
    rr_6354_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(455), ack => MUL_f32_f32_1808_inst_req_0); -- 
    -- CP-element group 456 transition  output  bypass 
    -- predecessors 421 
    -- successors 458 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/MUL_f32_f32_1808_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/MUL_f32_f32_1808_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/MUL_f32_f32_1808_Update/cr
      -- 
    cp_elements(456) <= cp_elements(421);
    cr_6359_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(456), ack => MUL_f32_f32_1808_inst_req_1); -- 
    -- CP-element group 457 transition  input  bypass 
    -- predecessors 455 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/MUL_f32_f32_1808_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/MUL_f32_f32_1808_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/MUL_f32_f32_1808_Sample/ra
      -- 
    ra_6355_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f32_f32_1808_inst_ack_0, ack => cp_elements(457)); -- 
    -- CP-element group 458 transition  input  output  bypass 
    -- predecessors 456 
    -- successors 460 
    -- members (10) 
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/MUL_f32_f32_1808_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/MUL_f32_f32_1808_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/MUL_f32_f32_1808_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/SLT_f32_u1_1814_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_iNsTr_91_1811_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_iNsTr_91_1811_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_iNsTr_91_1811_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/R_iNsTr_91_1811_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/SLT_f32_u1_1814_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/SLT_f32_u1_1814_Sample/rr
      -- 
    ca_6360_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f32_f32_1808_inst_ack_1, ack => cp_elements(458)); -- 
    rr_6372_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(458), ack => SLT_f32_u1_1814_inst_req_0); -- 
    -- CP-element group 459 transition  output  bypass 
    -- predecessors 421 
    -- successors 461 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/SLT_f32_u1_1814_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/SLT_f32_u1_1814_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/SLT_f32_u1_1814_Update/cr
      -- 
    cp_elements(459) <= cp_elements(421);
    cr_6377_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(459), ack => SLT_f32_u1_1814_inst_req_1); -- 
    -- CP-element group 460 transition  input  bypass 
    -- predecessors 458 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/SLT_f32_u1_1814_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/SLT_f32_u1_1814_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/SLT_f32_u1_1814_Sample/ra
      -- 
    ra_6373_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => SLT_f32_u1_1814_inst_ack_0, ack => cp_elements(460)); -- 
    -- CP-element group 461 transition  input  bypass 
    -- predecessors 459 
    -- successors 462 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/SLT_f32_u1_1814_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/SLT_f32_u1_1814_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/SLT_f32_u1_1814_Update/ca
      -- 
    ca_6378_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => SLT_f32_u1_1814_inst_ack_1, ack => cp_elements(461)); -- 
    -- CP-element group 462 join  transition  bypass 
    -- predecessors 441 461 
    -- successors 16 
    -- members (1) 
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815/$exit
      -- 
    cp_element_group_462: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_462"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(441) & cp_elements(461);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(462), clk => clk, reset => reset); --
    end block;
    -- CP-element group 463 transition  place  dead  bypass 
    -- predecessors 16 
    -- successors 17 
    -- members (8) 
      -- 	branch_block_stmt_1166/if_stmt_1816__exit__
      -- 	branch_block_stmt_1166/merge_stmt_1822__entry__
      -- 	branch_block_stmt_1166/if_stmt_1816_dead_link/$entry
      -- 	branch_block_stmt_1166/if_stmt_1816_dead_link/$exit
      -- 	branch_block_stmt_1166/if_stmt_1816_dead_link/dead_transition
      -- 	branch_block_stmt_1166/merge_stmt_1822_dead_link/$entry
      -- 	branch_block_stmt_1166/merge_stmt_1822_dead_link/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1822_dead_link/dead_transition
      -- 
    cp_elements(463) <= false;
    -- CP-element group 464 transition  output  bypass 
    -- predecessors 16 
    -- successors 465 
    -- members (3) 
      -- 	branch_block_stmt_1166/if_stmt_1816_eval_test/$entry
      -- 	branch_block_stmt_1166/if_stmt_1816_eval_test/$exit
      -- 	branch_block_stmt_1166/if_stmt_1816_eval_test/branch_req
      -- 
    cp_elements(464) <= cp_elements(16);
    branch_req_6386_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(464), ack => if_stmt_1816_branch_req_0); -- 
    -- CP-element group 465 branch  place  bypass 
    -- predecessors 464 
    -- successors 466 468 
    -- members (1) 
      -- 	branch_block_stmt_1166/R_iNsTr_92_1817_place
      -- 
    cp_elements(465) <= cp_elements(464);
    -- CP-element group 466 transition  bypass 
    -- predecessors 465 
    -- successors 467 
    -- members (1) 
      -- 	branch_block_stmt_1166/if_stmt_1816_if_link/$entry
      -- 
    cp_elements(466) <= cp_elements(465);
    -- CP-element group 467 fork  transition  place  input  bypass 
    -- predecessors 466 
    -- successors 841 842 
    -- members (8) 
      -- 	branch_block_stmt_1166/if_stmt_1816_if_link/$exit
      -- 	branch_block_stmt_1166/if_stmt_1816_if_link/if_choice_transition
      -- 	branch_block_stmt_1166/iq_err_calcx_xexit_bb_24
      -- 	branch_block_stmt_1166/iq_err_calcx_xexit_bb_24_PhiReq/$entry
      -- 	branch_block_stmt_1166/iq_err_calcx_xexit_bb_24_PhiReq/phi_stmt_1838/$entry
      -- 	branch_block_stmt_1166/iq_err_calcx_xexit_bb_24_PhiReq/phi_stmt_1838/phi_stmt_1838_sources/$entry
      -- 	branch_block_stmt_1166/iq_err_calcx_xexit_bb_24_PhiReq/phi_stmt_1838/phi_stmt_1838_sources/type_cast_1841/$entry
      -- 	branch_block_stmt_1166/iq_err_calcx_xexit_bb_24_PhiReq/phi_stmt_1838/phi_stmt_1838_sources/type_cast_1841/SplitProtocol/$entry
      -- 
    if_choice_transition_6391_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_1816_branch_ack_1, ack => cp_elements(467)); -- 
    -- CP-element group 468 transition  bypass 
    -- predecessors 465 
    -- successors 469 
    -- members (1) 
      -- 	branch_block_stmt_1166/if_stmt_1816_else_link/$entry
      -- 
    cp_elements(468) <= cp_elements(465);
    -- CP-element group 469 transition  place  input  bypass 
    -- predecessors 468 
    -- successors 17 
    -- members (9) 
      -- 	branch_block_stmt_1166/if_stmt_1816_else_link/$exit
      -- 	branch_block_stmt_1166/if_stmt_1816_else_link/else_choice_transition
      -- 	branch_block_stmt_1166/iq_err_calcx_xexit_bb_22
      -- 	branch_block_stmt_1166/merge_stmt_1822_PhiReqMerge
      -- 	branch_block_stmt_1166/iq_err_calcx_xexit_bb_22_PhiReq/$entry
      -- 	branch_block_stmt_1166/iq_err_calcx_xexit_bb_22_PhiReq/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1822_PhiAck/$entry
      -- 	branch_block_stmt_1166/merge_stmt_1822_PhiAck/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1822_PhiAck/dummy
      -- 
    else_choice_transition_6395_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_1816_branch_ack_0, ack => cp_elements(469)); -- 
    -- CP-element group 470 fork  transition  bypass 
    -- predecessors 17 
    -- successors 471 472 
    -- members (1) 
      -- 	branch_block_stmt_1166/assign_stmt_1828/$entry
      -- 
    cp_elements(470) <= cp_elements(17);
    -- CP-element group 471 transition  output  bypass 
    -- predecessors 470 
    -- successors 474 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1828/SGT_f32_u1_1827_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1828/SGT_f32_u1_1827_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1828/SGT_f32_u1_1827_Update/cr
      -- 
    cp_elements(471) <= cp_elements(470);
    cr_6417_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(471), ack => SGT_f32_u1_1827_inst_req_1); -- 
    -- CP-element group 472 transition  output  bypass 
    -- predecessors 470 
    -- successors 473 
    -- members (7) 
      -- 	branch_block_stmt_1166/assign_stmt_1828/SGT_f32_u1_1827_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1828/R_iNsTr_91_1824_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1828/R_iNsTr_91_1824_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1828/R_iNsTr_91_1824_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1828/R_iNsTr_91_1824_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1828/SGT_f32_u1_1827_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1828/SGT_f32_u1_1827_Sample/rr
      -- 
    cp_elements(472) <= cp_elements(470);
    rr_6412_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(472), ack => SGT_f32_u1_1827_inst_req_0); -- 
    -- CP-element group 473 transition  input  bypass 
    -- predecessors 472 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1828/SGT_f32_u1_1827_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1828/SGT_f32_u1_1827_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1828/SGT_f32_u1_1827_Sample/ra
      -- 
    ra_6413_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => SGT_f32_u1_1827_inst_ack_0, ack => cp_elements(473)); -- 
    -- CP-element group 474 branch  transition  place  input  bypass 
    -- predecessors 471 
    -- successors 475 476 
    -- members (6) 
      -- 	branch_block_stmt_1166/assign_stmt_1828__exit__
      -- 	branch_block_stmt_1166/if_stmt_1829__entry__
      -- 	branch_block_stmt_1166/assign_stmt_1828/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1828/SGT_f32_u1_1827_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1828/SGT_f32_u1_1827_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1828/SGT_f32_u1_1827_Update/ca
      -- 
    ca_6418_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => SGT_f32_u1_1827_inst_ack_1, ack => cp_elements(474)); -- 
    -- CP-element group 475 transition  place  dead  bypass 
    -- predecessors 474 
    -- successors 18 
    -- members (8) 
      -- 	branch_block_stmt_1166/if_stmt_1829__exit__
      -- 	branch_block_stmt_1166/merge_stmt_1835__entry__
      -- 	branch_block_stmt_1166/if_stmt_1829_dead_link/$entry
      -- 	branch_block_stmt_1166/if_stmt_1829_dead_link/$exit
      -- 	branch_block_stmt_1166/if_stmt_1829_dead_link/dead_transition
      -- 	branch_block_stmt_1166/merge_stmt_1835_dead_link/$entry
      -- 	branch_block_stmt_1166/merge_stmt_1835_dead_link/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1835_dead_link/dead_transition
      -- 
    cp_elements(475) <= false;
    -- CP-element group 476 transition  output  bypass 
    -- predecessors 474 
    -- successors 477 
    -- members (3) 
      -- 	branch_block_stmt_1166/if_stmt_1829_eval_test/$entry
      -- 	branch_block_stmt_1166/if_stmt_1829_eval_test/$exit
      -- 	branch_block_stmt_1166/if_stmt_1829_eval_test/branch_req
      -- 
    cp_elements(476) <= cp_elements(474);
    branch_req_6426_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(476), ack => if_stmt_1829_branch_req_0); -- 
    -- CP-element group 477 branch  place  bypass 
    -- predecessors 476 
    -- successors 478 480 
    -- members (1) 
      -- 	branch_block_stmt_1166/R_iNsTr_105_1830_place
      -- 
    cp_elements(477) <= cp_elements(476);
    -- CP-element group 478 transition  bypass 
    -- predecessors 477 
    -- successors 479 
    -- members (1) 
      -- 	branch_block_stmt_1166/if_stmt_1829_if_link/$entry
      -- 
    cp_elements(478) <= cp_elements(477);
    -- CP-element group 479 fork  transition  place  input  bypass 
    -- predecessors 478 
    -- successors 833 834 
    -- members (8) 
      -- 	branch_block_stmt_1166/if_stmt_1829_if_link/$exit
      -- 	branch_block_stmt_1166/if_stmt_1829_if_link/if_choice_transition
      -- 	branch_block_stmt_1166/bb_22_bb_24
      -- 	branch_block_stmt_1166/bb_22_bb_24_PhiReq/$entry
      -- 	branch_block_stmt_1166/bb_22_bb_24_PhiReq/phi_stmt_1838/$entry
      -- 	branch_block_stmt_1166/bb_22_bb_24_PhiReq/phi_stmt_1838/phi_stmt_1838_sources/$entry
      -- 	branch_block_stmt_1166/bb_22_bb_24_PhiReq/phi_stmt_1838/phi_stmt_1838_sources/type_cast_1841/$entry
      -- 	branch_block_stmt_1166/bb_22_bb_24_PhiReq/phi_stmt_1838/phi_stmt_1838_sources/type_cast_1841/SplitProtocol/$entry
      -- 
    if_choice_transition_6431_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_1829_branch_ack_1, ack => cp_elements(479)); -- 
    -- CP-element group 480 transition  bypass 
    -- predecessors 477 
    -- successors 481 
    -- members (1) 
      -- 	branch_block_stmt_1166/if_stmt_1829_else_link/$entry
      -- 
    cp_elements(480) <= cp_elements(477);
    -- CP-element group 481 transition  place  input  bypass 
    -- predecessors 480 
    -- successors 18 
    -- members (9) 
      -- 	branch_block_stmt_1166/merge_stmt_1835_PhiReqMerge
      -- 	branch_block_stmt_1166/if_stmt_1829_else_link/$exit
      -- 	branch_block_stmt_1166/if_stmt_1829_else_link/else_choice_transition
      -- 	branch_block_stmt_1166/bb_22_bb_23
      -- 	branch_block_stmt_1166/bb_22_bb_23_PhiReq/$entry
      -- 	branch_block_stmt_1166/bb_22_bb_23_PhiReq/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1835_PhiAck/$entry
      -- 	branch_block_stmt_1166/merge_stmt_1835_PhiAck/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1835_PhiAck/dummy
      -- 
    else_choice_transition_6435_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_1829_branch_ack_0, ack => cp_elements(481)); -- 
    -- CP-element group 482 fork  transition  bypass 
    -- predecessors 846 
    -- successors 483 484 488 489 492 
    -- members (1) 
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/$entry
      -- 
    cp_elements(482) <= cp_elements(846);
    -- CP-element group 483 transition  output  bypass 
    -- predecessors 482 
    -- successors 486 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/MUL_f32_f32_1853_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/MUL_f32_f32_1853_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/MUL_f32_f32_1853_Update/cr
      -- 
    cp_elements(483) <= cp_elements(482);
    cr_6457_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(483), ack => MUL_f32_f32_1853_inst_req_1); -- 
    -- CP-element group 484 transition  output  bypass 
    -- predecessors 482 
    -- successors 485 
    -- members (7) 
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/MUL_f32_f32_1853_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/R_iNsTr_88_1850_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/R_iNsTr_88_1850_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/R_iNsTr_88_1850_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/R_iNsTr_88_1850_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/MUL_f32_f32_1853_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/MUL_f32_f32_1853_Sample/rr
      -- 
    cp_elements(484) <= cp_elements(482);
    rr_6452_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(484), ack => MUL_f32_f32_1853_inst_req_0); -- 
    -- CP-element group 485 transition  input  bypass 
    -- predecessors 484 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/MUL_f32_f32_1853_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/MUL_f32_f32_1853_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/MUL_f32_f32_1853_Sample/ra
      -- 
    ra_6453_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f32_f32_1853_inst_ack_0, ack => cp_elements(485)); -- 
    -- CP-element group 486 transition  input  bypass 
    -- predecessors 483 
    -- successors 487 
    -- members (7) 
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/R_iNsTr_101_1857_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/R_iNsTr_101_1857_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/R_iNsTr_101_1857_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/R_iNsTr_101_1857_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/MUL_f32_f32_1853_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/MUL_f32_f32_1853_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/MUL_f32_f32_1853_Update/ca
      -- 
    ca_6458_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f32_f32_1853_inst_ack_1, ack => cp_elements(486)); -- 
    -- CP-element group 487 join  transition  output  bypass 
    -- predecessors 486 489 
    -- successors 490 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/ADD_f32_f32_1858_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/ADD_f32_f32_1858_Sample/rr
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/ADD_f32_f32_1858_sample_start_
      -- 
    cp_element_group_487: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_487"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(486) & cp_elements(489);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(487), clk => clk, reset => reset); --
    end block;
    rr_6474_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(487), ack => ADD_f32_f32_1858_inst_req_0); -- 
    -- CP-element group 488 transition  output  bypass 
    -- predecessors 482 
    -- successors 491 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/ADD_f32_f32_1858_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/ADD_f32_f32_1858_Update/cr
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/ADD_f32_f32_1858_update_start_
      -- 
    cp_elements(488) <= cp_elements(482);
    cr_6479_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(488), ack => ADD_f32_f32_1858_inst_req_1); -- 
    -- CP-element group 489 transition  bypass 
    -- predecessors 482 
    -- successors 487 
    -- members (4) 
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/R_int_flux_errx_x0_1856_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/R_int_flux_errx_x0_1856_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/R_int_flux_errx_x0_1856_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/R_int_flux_errx_x0_1856_sample_start_
      -- 
    cp_elements(489) <= cp_elements(482);
    -- CP-element group 490 transition  input  bypass 
    -- predecessors 487 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/ADD_f32_f32_1858_Sample/ra
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/ADD_f32_f32_1858_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/ADD_f32_f32_1858_sample_completed_
      -- 
    ra_6475_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ADD_f32_f32_1858_inst_ack_0, ack => cp_elements(490)); -- 
    -- CP-element group 491 transition  input  output  bypass 
    -- predecessors 488 
    -- successors 493 
    -- members (10) 
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/ADD_f32_f32_1858_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/ADD_f32_f32_1858_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/SLT_f32_u1_1864_Sample/rr
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/SLT_f32_u1_1864_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/R_iNsTr_102_1861_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/R_iNsTr_102_1861_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/R_iNsTr_102_1861_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/R_iNsTr_102_1861_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/SLT_f32_u1_1864_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/ADD_f32_f32_1858_update_completed_
      -- 
    ca_6480_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ADD_f32_f32_1858_inst_ack_1, ack => cp_elements(491)); -- 
    rr_6492_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(491), ack => SLT_f32_u1_1864_inst_req_0); -- 
    -- CP-element group 492 transition  output  bypass 
    -- predecessors 482 
    -- successors 494 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/SLT_f32_u1_1864_Update/cr
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/SLT_f32_u1_1864_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/SLT_f32_u1_1864_update_start_
      -- 
    cp_elements(492) <= cp_elements(482);
    cr_6497_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(492), ack => SLT_f32_u1_1864_inst_req_1); -- 
    -- CP-element group 493 transition  input  bypass 
    -- predecessors 491 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/SLT_f32_u1_1864_Sample/ra
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/SLT_f32_u1_1864_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/SLT_f32_u1_1864_sample_completed_
      -- 
    ra_6493_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => SLT_f32_u1_1864_inst_ack_0, ack => cp_elements(493)); -- 
    -- CP-element group 494 branch  transition  place  input  bypass 
    -- predecessors 492 
    -- successors 495 496 
    -- members (6) 
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865__exit__
      -- 	branch_block_stmt_1166/if_stmt_1866__entry__
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/SLT_f32_u1_1864_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/SLT_f32_u1_1864_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/SLT_f32_u1_1864_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865/$exit
      -- 
    ca_6498_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => SLT_f32_u1_1864_inst_ack_1, ack => cp_elements(494)); -- 
    -- CP-element group 495 transition  place  dead  bypass 
    -- predecessors 494 
    -- successors 19 
    -- members (8) 
      -- 	branch_block_stmt_1166/if_stmt_1866__exit__
      -- 	branch_block_stmt_1166/merge_stmt_1872__entry__
      -- 	branch_block_stmt_1166/if_stmt_1866_dead_link/dead_transition
      -- 	branch_block_stmt_1166/if_stmt_1866_dead_link/$exit
      -- 	branch_block_stmt_1166/if_stmt_1866_dead_link/$entry
      -- 	branch_block_stmt_1166/merge_stmt_1872_dead_link/$entry
      -- 	branch_block_stmt_1166/merge_stmt_1872_dead_link/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1872_dead_link/dead_transition
      -- 
    cp_elements(495) <= false;
    -- CP-element group 496 transition  output  bypass 
    -- predecessors 494 
    -- successors 497 
    -- members (3) 
      -- 	branch_block_stmt_1166/if_stmt_1866_eval_test/$entry
      -- 	branch_block_stmt_1166/if_stmt_1866_eval_test/$exit
      -- 	branch_block_stmt_1166/if_stmt_1866_eval_test/branch_req
      -- 
    cp_elements(496) <= cp_elements(494);
    branch_req_6506_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(496), ack => if_stmt_1866_branch_req_0); -- 
    -- CP-element group 497 branch  place  bypass 
    -- predecessors 496 
    -- successors 498 500 
    -- members (1) 
      -- 	branch_block_stmt_1166/R_iNsTr_103_1867_place
      -- 
    cp_elements(497) <= cp_elements(496);
    -- CP-element group 498 transition  bypass 
    -- predecessors 497 
    -- successors 499 
    -- members (1) 
      -- 	branch_block_stmt_1166/if_stmt_1866_if_link/$entry
      -- 
    cp_elements(498) <= cp_elements(497);
    -- CP-element group 499 fork  transition  place  input  bypass 
    -- predecessors 498 
    -- successors 847 848 
    -- members (8) 
      -- 	branch_block_stmt_1166/if_stmt_1866_if_link/$exit
      -- 	branch_block_stmt_1166/if_stmt_1866_if_link/if_choice_transition
      -- 	branch_block_stmt_1166/bb_24_xx_xthread12
      -- 	branch_block_stmt_1166/bb_24_xx_xthread12_PhiReq/$entry
      -- 	branch_block_stmt_1166/bb_24_xx_xthread12_PhiReq/phi_stmt_1913/$entry
      -- 	branch_block_stmt_1166/bb_24_xx_xthread12_PhiReq/phi_stmt_1913/phi_stmt_1913_sources/$entry
      -- 	branch_block_stmt_1166/bb_24_xx_xthread12_PhiReq/phi_stmt_1913/phi_stmt_1913_sources/type_cast_1916/$entry
      -- 	branch_block_stmt_1166/bb_24_xx_xthread12_PhiReq/phi_stmt_1913/phi_stmt_1913_sources/type_cast_1916/SplitProtocol/$entry
      -- 
    if_choice_transition_6511_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_1866_branch_ack_1, ack => cp_elements(499)); -- 
    -- CP-element group 500 transition  bypass 
    -- predecessors 497 
    -- successors 501 
    -- members (1) 
      -- 	branch_block_stmt_1166/if_stmt_1866_else_link/$entry
      -- 
    cp_elements(500) <= cp_elements(497);
    -- CP-element group 501 transition  place  input  bypass 
    -- predecessors 500 
    -- successors 19 
    -- members (9) 
      -- 	branch_block_stmt_1166/if_stmt_1866_else_link/$exit
      -- 	branch_block_stmt_1166/if_stmt_1866_else_link/else_choice_transition
      -- 	branch_block_stmt_1166/merge_stmt_1872_PhiReqMerge
      -- 	branch_block_stmt_1166/bb_24_bb_25
      -- 	branch_block_stmt_1166/bb_24_bb_25_PhiReq/$entry
      -- 	branch_block_stmt_1166/bb_24_bb_25_PhiReq/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1872_PhiAck/$entry
      -- 	branch_block_stmt_1166/merge_stmt_1872_PhiAck/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1872_PhiAck/dummy
      -- 
    else_choice_transition_6515_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_1866_branch_ack_0, ack => cp_elements(501)); -- 
    -- CP-element group 502 fork  transition  bypass 
    -- predecessors 19 
    -- successors 503 504 
    -- members (1) 
      -- 	branch_block_stmt_1166/assign_stmt_1878/$entry
      -- 
    cp_elements(502) <= cp_elements(19);
    -- CP-element group 503 transition  output  bypass 
    -- predecessors 502 
    -- successors 506 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1878/SGT_f32_u1_1877_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1878/SGT_f32_u1_1877_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1878/SGT_f32_u1_1877_Update/cr
      -- 
    cp_elements(503) <= cp_elements(502);
    cr_6537_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(503), ack => SGT_f32_u1_1877_inst_req_1); -- 
    -- CP-element group 504 transition  output  bypass 
    -- predecessors 502 
    -- successors 505 
    -- members (7) 
      -- 	branch_block_stmt_1166/assign_stmt_1878/R_iNsTr_102_1874_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1878/SGT_f32_u1_1877_Sample/rr
      -- 	branch_block_stmt_1166/assign_stmt_1878/R_iNsTr_102_1874_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1878/SGT_f32_u1_1877_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1878/SGT_f32_u1_1877_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1878/R_iNsTr_102_1874_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1878/R_iNsTr_102_1874_sample_completed_
      -- 
    cp_elements(504) <= cp_elements(502);
    rr_6532_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(504), ack => SGT_f32_u1_1877_inst_req_0); -- 
    -- CP-element group 505 transition  input  bypass 
    -- predecessors 504 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1878/SGT_f32_u1_1877_Sample/ra
      -- 	branch_block_stmt_1166/assign_stmt_1878/SGT_f32_u1_1877_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1878/SGT_f32_u1_1877_sample_completed_
      -- 
    ra_6533_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => SGT_f32_u1_1877_inst_ack_0, ack => cp_elements(505)); -- 
    -- CP-element group 506 branch  transition  place  input  bypass 
    -- predecessors 503 
    -- successors 507 508 
    -- members (6) 
      -- 	branch_block_stmt_1166/assign_stmt_1878__exit__
      -- 	branch_block_stmt_1166/if_stmt_1879__entry__
      -- 	branch_block_stmt_1166/assign_stmt_1878/SGT_f32_u1_1877_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1878/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1878/SGT_f32_u1_1877_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1878/SGT_f32_u1_1877_Update/ca
      -- 
    ca_6538_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => SGT_f32_u1_1877_inst_ack_1, ack => cp_elements(506)); -- 
    -- CP-element group 507 transition  place  dead  bypass 
    -- predecessors 506 
    -- successors 20 
    -- members (8) 
      -- 	branch_block_stmt_1166/if_stmt_1879__exit__
      -- 	branch_block_stmt_1166/merge_stmt_1885__entry__
      -- 	branch_block_stmt_1166/if_stmt_1879_dead_link/dead_transition
      -- 	branch_block_stmt_1166/if_stmt_1879_dead_link/$exit
      -- 	branch_block_stmt_1166/if_stmt_1879_dead_link/$entry
      -- 	branch_block_stmt_1166/merge_stmt_1885_dead_link/$entry
      -- 	branch_block_stmt_1166/merge_stmt_1885_dead_link/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1885_dead_link/dead_transition
      -- 
    cp_elements(507) <= false;
    -- CP-element group 508 transition  output  bypass 
    -- predecessors 506 
    -- successors 509 
    -- members (3) 
      -- 	branch_block_stmt_1166/if_stmt_1879_eval_test/branch_req
      -- 	branch_block_stmt_1166/if_stmt_1879_eval_test/$exit
      -- 	branch_block_stmt_1166/if_stmt_1879_eval_test/$entry
      -- 
    cp_elements(508) <= cp_elements(506);
    branch_req_6546_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(508), ack => if_stmt_1879_branch_req_0); -- 
    -- CP-element group 509 branch  place  bypass 
    -- predecessors 508 
    -- successors 510 512 
    -- members (1) 
      -- 	branch_block_stmt_1166/R_iNsTr_110_1880_place
      -- 
    cp_elements(509) <= cp_elements(508);
    -- CP-element group 510 transition  bypass 
    -- predecessors 509 
    -- successors 511 
    -- members (1) 
      -- 	branch_block_stmt_1166/if_stmt_1879_if_link/$entry
      -- 
    cp_elements(510) <= cp_elements(509);
    -- CP-element group 511 fork  transition  place  input  bypass 
    -- predecessors 510 
    -- successors 850 851 
    -- members (8) 
      -- 	branch_block_stmt_1166/bb_25_xx_xthread12
      -- 	branch_block_stmt_1166/if_stmt_1879_if_link/if_choice_transition
      -- 	branch_block_stmt_1166/if_stmt_1879_if_link/$exit
      -- 	branch_block_stmt_1166/bb_25_xx_xthread12_PhiReq/$entry
      -- 	branch_block_stmt_1166/bb_25_xx_xthread12_PhiReq/phi_stmt_1913/$entry
      -- 	branch_block_stmt_1166/bb_25_xx_xthread12_PhiReq/phi_stmt_1913/phi_stmt_1913_sources/$entry
      -- 	branch_block_stmt_1166/bb_25_xx_xthread12_PhiReq/phi_stmt_1913/phi_stmt_1913_sources/type_cast_1916/$entry
      -- 	branch_block_stmt_1166/bb_25_xx_xthread12_PhiReq/phi_stmt_1913/phi_stmt_1913_sources/type_cast_1916/SplitProtocol/$entry
      -- 
    if_choice_transition_6551_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_1879_branch_ack_1, ack => cp_elements(511)); -- 
    -- CP-element group 512 transition  bypass 
    -- predecessors 509 
    -- successors 513 
    -- members (1) 
      -- 	branch_block_stmt_1166/if_stmt_1879_else_link/$entry
      -- 
    cp_elements(512) <= cp_elements(509);
    -- CP-element group 513 transition  place  input  bypass 
    -- predecessors 512 
    -- successors 20 
    -- members (9) 
      -- 	branch_block_stmt_1166/bb_25_bb_26
      -- 	branch_block_stmt_1166/merge_stmt_1885_PhiReqMerge
      -- 	branch_block_stmt_1166/if_stmt_1879_else_link/else_choice_transition
      -- 	branch_block_stmt_1166/if_stmt_1879_else_link/$exit
      -- 	branch_block_stmt_1166/bb_25_bb_26_PhiReq/$entry
      -- 	branch_block_stmt_1166/bb_25_bb_26_PhiReq/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1885_PhiAck/$entry
      -- 	branch_block_stmt_1166/merge_stmt_1885_PhiAck/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1885_PhiAck/dummy
      -- 
    else_choice_transition_6555_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_1879_branch_ack_0, ack => cp_elements(513)); -- 
    -- CP-element group 514 fork  transition  bypass 
    -- predecessors 20 
    -- successors 515 516 519 522 525 
    -- members (1) 
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/$entry
      -- 
    cp_elements(514) <= cp_elements(20);
    -- CP-element group 515 transition  output  bypass 
    -- predecessors 514 
    -- successors 518 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/type_cast_1888_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/type_cast_1888_Update/cr
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/type_cast_1888_Update/$entry
      -- 
    cp_elements(515) <= cp_elements(514);
    cr_6577_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(515), ack => type_cast_1888_inst_req_1); -- 
    -- CP-element group 516 transition  output  bypass 
    -- predecessors 514 
    -- successors 517 
    -- members (7) 
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/R_iNsTr_102_1887_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/R_iNsTr_102_1887_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/type_cast_1888_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/type_cast_1888_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/R_iNsTr_102_1887_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/R_iNsTr_102_1887_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/type_cast_1888_Sample/rr
      -- 
    cp_elements(516) <= cp_elements(514);
    rr_6572_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(516), ack => type_cast_1888_inst_req_0); -- 
    -- CP-element group 517 transition  input  bypass 
    -- predecessors 516 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/type_cast_1888_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/type_cast_1888_Sample/ra
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/type_cast_1888_Sample/$exit
      -- 
    ra_6573_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1888_inst_ack_0, ack => cp_elements(517)); -- 
    -- CP-element group 518 transition  input  output  bypass 
    -- predecessors 515 
    -- successors 520 
    -- members (10) 
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/type_cast_1888_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/type_cast_1892_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/R_phitmp_1891_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/type_cast_1892_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/type_cast_1888_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/R_phitmp_1891_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/type_cast_1892_Sample/rr
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/type_cast_1888_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/R_phitmp_1891_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/R_phitmp_1891_update_start_
      -- 
    ca_6578_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1888_inst_ack_1, ack => cp_elements(518)); -- 
    rr_6590_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(518), ack => type_cast_1892_inst_req_0); -- 
    -- CP-element group 519 transition  output  bypass 
    -- predecessors 514 
    -- successors 521 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/type_cast_1892_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/type_cast_1892_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/type_cast_1892_Update/cr
      -- 
    cp_elements(519) <= cp_elements(514);
    cr_6595_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(519), ack => type_cast_1892_inst_req_1); -- 
    -- CP-element group 520 transition  input  bypass 
    -- predecessors 518 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/type_cast_1892_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/type_cast_1892_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/type_cast_1892_Sample/ra
      -- 
    ra_6591_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1892_inst_ack_0, ack => cp_elements(520)); -- 
    -- CP-element group 521 transition  input  output  bypass 
    -- predecessors 519 
    -- successors 523 
    -- members (10) 
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/type_cast_1892_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/R_phitmp7_1895_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/type_cast_1892_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/R_phitmp7_1895_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/R_phitmp7_1895_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/AND_u64_u64_1898_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/type_cast_1892_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/R_phitmp7_1895_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/AND_u64_u64_1898_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/AND_u64_u64_1898_Sample/rr
      -- 
    ca_6596_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1892_inst_ack_1, ack => cp_elements(521)); -- 
    rr_6608_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(521), ack => AND_u64_u64_1898_inst_req_0); -- 
    -- CP-element group 522 transition  output  bypass 
    -- predecessors 514 
    -- successors 524 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/AND_u64_u64_1898_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/AND_u64_u64_1898_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/AND_u64_u64_1898_Update/cr
      -- 
    cp_elements(522) <= cp_elements(514);
    cr_6613_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(522), ack => AND_u64_u64_1898_inst_req_1); -- 
    -- CP-element group 523 transition  input  bypass 
    -- predecessors 521 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/AND_u64_u64_1898_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/AND_u64_u64_1898_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/AND_u64_u64_1898_Sample/ra
      -- 
    ra_6609_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => AND_u64_u64_1898_inst_ack_0, ack => cp_elements(523)); -- 
    -- CP-element group 524 transition  input  output  bypass 
    -- predecessors 522 
    -- successors 526 
    -- members (10) 
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/AND_u64_u64_1898_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/AND_u64_u64_1898_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/AND_u64_u64_1898_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/EQ_u64_u1_1904_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/R_iNsTr_126_1901_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/R_iNsTr_126_1901_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/R_iNsTr_126_1901_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/R_iNsTr_126_1901_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/EQ_u64_u1_1904_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/EQ_u64_u1_1904_Sample/rr
      -- 
    ca_6614_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => AND_u64_u64_1898_inst_ack_1, ack => cp_elements(524)); -- 
    rr_6626_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(524), ack => EQ_u64_u1_1904_inst_req_0); -- 
    -- CP-element group 525 transition  output  bypass 
    -- predecessors 514 
    -- successors 527 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/EQ_u64_u1_1904_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/EQ_u64_u1_1904_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/EQ_u64_u1_1904_Update/cr
      -- 
    cp_elements(525) <= cp_elements(514);
    cr_6631_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(525), ack => EQ_u64_u1_1904_inst_req_1); -- 
    -- CP-element group 526 transition  input  bypass 
    -- predecessors 524 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/EQ_u64_u1_1904_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/EQ_u64_u1_1904_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/EQ_u64_u1_1904_Sample/ra
      -- 
    ra_6627_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => EQ_u64_u1_1904_inst_ack_0, ack => cp_elements(526)); -- 
    -- CP-element group 527 branch  transition  place  input  bypass 
    -- predecessors 525 
    -- successors 528 529 
    -- members (6) 
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905__exit__
      -- 	branch_block_stmt_1166/if_stmt_1906__entry__
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/EQ_u64_u1_1904_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/EQ_u64_u1_1904_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1889_to_assign_stmt_1905/EQ_u64_u1_1904_Update/ca
      -- 
    ca_6632_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => EQ_u64_u1_1904_inst_ack_1, ack => cp_elements(527)); -- 
    -- CP-element group 528 transition  place  dead  bypass 
    -- predecessors 527 
    -- successors 21 
    -- members (8) 
      -- 	branch_block_stmt_1166/if_stmt_1906__exit__
      -- 	branch_block_stmt_1166/merge_stmt_1912__entry__
      -- 	branch_block_stmt_1166/if_stmt_1906_dead_link/$entry
      -- 	branch_block_stmt_1166/if_stmt_1906_dead_link/$exit
      -- 	branch_block_stmt_1166/if_stmt_1906_dead_link/dead_transition
      -- 	branch_block_stmt_1166/merge_stmt_1912_dead_link/$entry
      -- 	branch_block_stmt_1166/merge_stmt_1912_dead_link/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1912_dead_link/dead_transition
      -- 
    cp_elements(528) <= false;
    -- CP-element group 529 transition  output  bypass 
    -- predecessors 527 
    -- successors 530 
    -- members (3) 
      -- 	branch_block_stmt_1166/if_stmt_1906_eval_test/$entry
      -- 	branch_block_stmt_1166/if_stmt_1906_eval_test/$exit
      -- 	branch_block_stmt_1166/if_stmt_1906_eval_test/branch_req
      -- 
    cp_elements(529) <= cp_elements(527);
    branch_req_6640_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(529), ack => if_stmt_1906_branch_req_0); -- 
    -- CP-element group 530 branch  place  bypass 
    -- predecessors 529 
    -- successors 531 533 
    -- members (1) 
      -- 	branch_block_stmt_1166/R_iNsTr_127_1907_place
      -- 
    cp_elements(530) <= cp_elements(529);
    -- CP-element group 531 transition  bypass 
    -- predecessors 530 
    -- successors 532 
    -- members (1) 
      -- 	branch_block_stmt_1166/if_stmt_1906_if_link/$entry
      -- 
    cp_elements(531) <= cp_elements(530);
    -- CP-element group 532 transition  place  input  bypass 
    -- predecessors 531 
    -- successors 861 
    -- members (3) 
      -- 	branch_block_stmt_1166/bb_26_fdiv32x_xexit
      -- 	branch_block_stmt_1166/if_stmt_1906_if_link/$exit
      -- 	branch_block_stmt_1166/if_stmt_1906_if_link/if_choice_transition
      -- 
    if_choice_transition_6645_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_1906_branch_ack_1, ack => cp_elements(532)); -- 
    -- CP-element group 533 transition  bypass 
    -- predecessors 530 
    -- successors 534 
    -- members (1) 
      -- 	branch_block_stmt_1166/if_stmt_1906_else_link/$entry
      -- 
    cp_elements(533) <= cp_elements(530);
    -- CP-element group 534 fork  transition  place  input  bypass 
    -- predecessors 533 
    -- successors 853 855 
    -- members (8) 
      -- 	branch_block_stmt_1166/bb_26_xx_xthread12
      -- 	branch_block_stmt_1166/if_stmt_1906_else_link/$exit
      -- 	branch_block_stmt_1166/if_stmt_1906_else_link/else_choice_transition
      -- 	branch_block_stmt_1166/bb_26_xx_xthread12_PhiReq/$entry
      -- 	branch_block_stmt_1166/bb_26_xx_xthread12_PhiReq/phi_stmt_1913/$entry
      -- 	branch_block_stmt_1166/bb_26_xx_xthread12_PhiReq/phi_stmt_1913/phi_stmt_1913_sources/$entry
      -- 	branch_block_stmt_1166/bb_26_xx_xthread12_PhiReq/phi_stmt_1913/phi_stmt_1913_sources/type_cast_1916/$entry
      -- 	branch_block_stmt_1166/bb_26_xx_xthread12_PhiReq/phi_stmt_1913/phi_stmt_1913_sources/type_cast_1916/SplitProtocol/$entry
      -- 
    else_choice_transition_6649_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_1906_branch_ack_0, ack => cp_elements(534)); -- 
    -- CP-element group 535 fork  transition  bypass 
    -- predecessors 21 
    -- successors 536 537 540 543 546 549 
    -- members (1) 
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/$entry
      -- 
    cp_elements(535) <= cp_elements(21);
    -- CP-element group 536 transition  output  bypass 
    -- predecessors 535 
    -- successors 539 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/AND_u64_u64_1928_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/AND_u64_u64_1928_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/AND_u64_u64_1928_Update/cr
      -- 
    cp_elements(536) <= cp_elements(535);
    cr_6671_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(536), ack => AND_u64_u64_1928_inst_req_1); -- 
    -- CP-element group 537 transition  output  bypass 
    -- predecessors 535 
    -- successors 538 
    -- members (7) 
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/AND_u64_u64_1928_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/R_phitmp20x_xi15x_xin_1925_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/R_phitmp20x_xi15x_xin_1925_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/R_phitmp20x_xi15x_xin_1925_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/R_phitmp20x_xi15x_xin_1925_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/AND_u64_u64_1928_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/AND_u64_u64_1928_Sample/rr
      -- 
    cp_elements(537) <= cp_elements(535);
    rr_6666_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(537), ack => AND_u64_u64_1928_inst_req_0); -- 
    -- CP-element group 538 transition  input  bypass 
    -- predecessors 537 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/AND_u64_u64_1928_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/AND_u64_u64_1928_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/AND_u64_u64_1928_Sample/ra
      -- 
    ra_6667_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => AND_u64_u64_1928_inst_ack_0, ack => cp_elements(538)); -- 
    -- CP-element group 539 transition  input  output  bypass 
    -- predecessors 536 
    -- successors 541 
    -- members (10) 
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/AND_u64_u64_1928_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/AND_u64_u64_1928_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/AND_u64_u64_1928_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/type_cast_1932_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/R_iNsTr_107_1931_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/R_iNsTr_107_1931_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/R_iNsTr_107_1931_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/R_iNsTr_107_1931_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/type_cast_1932_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/type_cast_1932_Sample/rr
      -- 
    ca_6672_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => AND_u64_u64_1928_inst_ack_1, ack => cp_elements(539)); -- 
    rr_6684_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(539), ack => type_cast_1932_inst_req_0); -- 
    -- CP-element group 540 transition  output  bypass 
    -- predecessors 535 
    -- successors 542 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/type_cast_1932_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/type_cast_1932_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/type_cast_1932_Update/cr
      -- 
    cp_elements(540) <= cp_elements(535);
    cr_6689_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(540), ack => type_cast_1932_inst_req_1); -- 
    -- CP-element group 541 transition  input  bypass 
    -- predecessors 539 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/type_cast_1932_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/type_cast_1932_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/type_cast_1932_Sample/ra
      -- 
    ra_6685_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1932_inst_ack_0, ack => cp_elements(541)); -- 
    -- CP-element group 542 transition  input  output  bypass 
    -- predecessors 540 
    -- successors 544 
    -- members (10) 
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/type_cast_1932_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/type_cast_1932_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/type_cast_1932_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/MUL_f64_f64_1938_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/R_tmp13x_xi_1935_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/R_tmp13x_xi_1935_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/R_tmp13x_xi_1935_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/R_tmp13x_xi_1935_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/MUL_f64_f64_1938_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/MUL_f64_f64_1938_Sample/rr
      -- 
    ca_6690_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1932_inst_ack_1, ack => cp_elements(542)); -- 
    rr_6702_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(542), ack => MUL_f64_f64_1938_inst_req_0); -- 
    -- CP-element group 543 transition  output  bypass 
    -- predecessors 535 
    -- successors 545 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/MUL_f64_f64_1938_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/MUL_f64_f64_1938_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/MUL_f64_f64_1938_Update/cr
      -- 
    cp_elements(543) <= cp_elements(535);
    cr_6707_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(543), ack => MUL_f64_f64_1938_inst_req_1); -- 
    -- CP-element group 544 transition  input  bypass 
    -- predecessors 542 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/MUL_f64_f64_1938_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/MUL_f64_f64_1938_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/MUL_f64_f64_1938_Sample/ra
      -- 
    ra_6703_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f64_f64_1938_inst_ack_0, ack => cp_elements(544)); -- 
    -- CP-element group 545 transition  input  output  bypass 
    -- predecessors 543 
    -- successors 547 
    -- members (10) 
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/MUL_f64_f64_1938_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/MUL_f64_f64_1938_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/MUL_f64_f64_1938_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/type_cast_1942_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/R_iNsTr_108_1941_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/R_iNsTr_108_1941_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/R_iNsTr_108_1941_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/R_iNsTr_108_1941_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/type_cast_1942_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/type_cast_1942_Sample/rr
      -- 
    ca_6708_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f64_f64_1938_inst_ack_1, ack => cp_elements(545)); -- 
    rr_6720_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(545), ack => type_cast_1942_inst_req_0); -- 
    -- CP-element group 546 transition  output  bypass 
    -- predecessors 535 
    -- successors 548 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/type_cast_1942_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/type_cast_1942_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/type_cast_1942_Update/cr
      -- 
    cp_elements(546) <= cp_elements(535);
    cr_6725_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(546), ack => type_cast_1942_inst_req_1); -- 
    -- CP-element group 547 transition  input  bypass 
    -- predecessors 545 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/type_cast_1942_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/type_cast_1942_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/type_cast_1942_Sample/ra
      -- 
    ra_6721_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1942_inst_ack_0, ack => cp_elements(547)); -- 
    -- CP-element group 548 transition  input  output  bypass 
    -- predecessors 546 
    -- successors 550 
    -- members (10) 
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/type_cast_1942_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/type_cast_1942_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/type_cast_1942_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/AND_u64_u64_1948_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/R_phitmp19x_xi_1945_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/R_phitmp19x_xi_1945_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/R_phitmp19x_xi_1945_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/R_phitmp19x_xi_1945_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/AND_u64_u64_1948_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/AND_u64_u64_1948_Sample/rr
      -- 
    ca_6726_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1942_inst_ack_1, ack => cp_elements(548)); -- 
    rr_6738_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(548), ack => AND_u64_u64_1948_inst_req_0); -- 
    -- CP-element group 549 transition  output  bypass 
    -- predecessors 535 
    -- successors 551 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/AND_u64_u64_1948_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/AND_u64_u64_1948_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/AND_u64_u64_1948_Update/cr
      -- 
    cp_elements(549) <= cp_elements(535);
    cr_6743_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(549), ack => AND_u64_u64_1948_inst_req_1); -- 
    -- CP-element group 550 transition  input  bypass 
    -- predecessors 548 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/AND_u64_u64_1948_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/AND_u64_u64_1948_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/AND_u64_u64_1948_Sample/ra
      -- 
    ra_6739_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => AND_u64_u64_1948_inst_ack_0, ack => cp_elements(550)); -- 
    -- CP-element group 551 transition  place  input  bypass 
    -- predecessors 549 
    -- successors 879 
    -- members (6) 
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949__exit__
      -- 	branch_block_stmt_1166/xx_xthread12_fdiv32x_xexit
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/AND_u64_u64_1948_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/AND_u64_u64_1948_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1929_to_assign_stmt_1949/AND_u64_u64_1948_Update/ca
      -- 
    ca_6744_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => AND_u64_u64_1948_inst_ack_1, ack => cp_elements(551)); -- 
    -- CP-element group 552 fork  transition  bypass 
    -- predecessors 22 
    -- successors 553 554 558 559 562 565 
    -- members (1) 
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/$entry
      -- 
    cp_elements(552) <= cp_elements(22);
    -- CP-element group 553 transition  output  bypass 
    -- predecessors 552 
    -- successors 556 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/AND_u64_u64_1970_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/AND_u64_u64_1970_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/AND_u64_u64_1970_Update/cr
      -- 
    cp_elements(553) <= cp_elements(552);
    cr_6764_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(553), ack => AND_u64_u64_1970_inst_req_1); -- 
    -- CP-element group 554 transition  output  bypass 
    -- predecessors 552 
    -- successors 555 
    -- members (7) 
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/AND_u64_u64_1970_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/R_flux_addx_x0911_1967_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/R_flux_addx_x0911_1967_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/R_flux_addx_x0911_1967_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/R_flux_addx_x0911_1967_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/AND_u64_u64_1970_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/AND_u64_u64_1970_Sample/rr
      -- 
    cp_elements(554) <= cp_elements(552);
    rr_6759_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(554), ack => AND_u64_u64_1970_inst_req_0); -- 
    -- CP-element group 555 transition  input  bypass 
    -- predecessors 554 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/AND_u64_u64_1970_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/AND_u64_u64_1970_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/AND_u64_u64_1970_Sample/ra
      -- 
    ra_6760_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => AND_u64_u64_1970_inst_ack_0, ack => cp_elements(555)); -- 
    -- CP-element group 556 transition  input  bypass 
    -- predecessors 553 
    -- successors 557 
    -- members (7) 
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/AND_u64_u64_1970_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/AND_u64_u64_1970_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/AND_u64_u64_1970_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/R_iNsTr_114_1974_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/R_iNsTr_114_1974_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/R_iNsTr_114_1974_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/R_iNsTr_114_1974_update_completed_
      -- 
    ca_6765_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => AND_u64_u64_1970_inst_ack_1, ack => cp_elements(556)); -- 
    -- CP-element group 557 join  transition  output  bypass 
    -- predecessors 556 559 
    -- successors 560 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/OR_u64_u64_1975_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/OR_u64_u64_1975_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/OR_u64_u64_1975_Sample/rr
      -- 
    cp_element_group_557: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_557"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(556) & cp_elements(559);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(557), clk => clk, reset => reset); --
    end block;
    rr_6781_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(557), ack => OR_u64_u64_1975_inst_req_0); -- 
    -- CP-element group 558 transition  output  bypass 
    -- predecessors 552 
    -- successors 561 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/OR_u64_u64_1975_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/OR_u64_u64_1975_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/OR_u64_u64_1975_Update/cr
      -- 
    cp_elements(558) <= cp_elements(552);
    cr_6786_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(558), ack => OR_u64_u64_1975_inst_req_1); -- 
    -- CP-element group 559 transition  bypass 
    -- predecessors 552 
    -- successors 557 
    -- members (4) 
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/R_iNsTr_113_1973_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/R_iNsTr_113_1973_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/R_iNsTr_113_1973_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/R_iNsTr_113_1973_update_completed_
      -- 
    cp_elements(559) <= cp_elements(552);
    -- CP-element group 560 transition  input  bypass 
    -- predecessors 557 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/OR_u64_u64_1975_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/OR_u64_u64_1975_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/OR_u64_u64_1975_Sample/ra
      -- 
    ra_6782_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => OR_u64_u64_1975_inst_ack_0, ack => cp_elements(560)); -- 
    -- CP-element group 561 transition  input  output  bypass 
    -- predecessors 558 
    -- successors 563 
    -- members (10) 
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/OR_u64_u64_1975_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/OR_u64_u64_1975_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/OR_u64_u64_1975_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/type_cast_1979_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/R_iNsTr_115_1978_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/R_iNsTr_115_1978_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/R_iNsTr_115_1978_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/R_iNsTr_115_1978_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/type_cast_1979_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/type_cast_1979_Sample/rr
      -- 
    ca_6787_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => OR_u64_u64_1975_inst_ack_1, ack => cp_elements(561)); -- 
    rr_6799_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(561), ack => type_cast_1979_inst_req_0); -- 
    -- CP-element group 562 transition  output  bypass 
    -- predecessors 552 
    -- successors 564 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/type_cast_1979_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/type_cast_1979_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/type_cast_1979_Update/cr
      -- 
    cp_elements(562) <= cp_elements(552);
    cr_6804_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(562), ack => type_cast_1979_inst_req_1); -- 
    -- CP-element group 563 transition  input  bypass 
    -- predecessors 561 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/type_cast_1979_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/type_cast_1979_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/type_cast_1979_Sample/ra
      -- 
    ra_6800_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1979_inst_ack_0, ack => cp_elements(563)); -- 
    -- CP-element group 564 transition  input  output  bypass 
    -- predecessors 562 
    -- successors 566 
    -- members (10) 
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/type_cast_1979_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/type_cast_1979_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/type_cast_1979_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/type_cast_1983_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/R_tmp4x_xi_1982_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/R_tmp4x_xi_1982_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/R_tmp4x_xi_1982_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/R_tmp4x_xi_1982_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/type_cast_1983_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/type_cast_1983_Sample/rr
      -- 
    ca_6805_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1979_inst_ack_1, ack => cp_elements(564)); -- 
    rr_6817_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(564), ack => type_cast_1983_inst_req_0); -- 
    -- CP-element group 565 transition  output  bypass 
    -- predecessors 552 
    -- successors 567 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/type_cast_1983_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/type_cast_1983_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/type_cast_1983_Update/cr
      -- 
    cp_elements(565) <= cp_elements(552);
    cr_6822_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(565), ack => type_cast_1983_inst_req_1); -- 
    -- CP-element group 566 transition  input  bypass 
    -- predecessors 564 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/type_cast_1983_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/type_cast_1983_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/type_cast_1983_Sample/ra
      -- 
    ra_6818_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1983_inst_ack_0, ack => cp_elements(566)); -- 
    -- CP-element group 567 transition  place  input  bypass 
    -- predecessors 565 
    -- successors 568 
    -- members (6) 
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984__exit__
      -- 	branch_block_stmt_1166/assign_stmt_1987__entry__
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/type_cast_1983_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/type_cast_1983_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1971_to_assign_stmt_1984/type_cast_1983_Update/ca
      -- 
    ca_6823_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1983_inst_ack_1, ack => cp_elements(567)); -- 
    -- CP-element group 568 fork  transition  bypass 
    -- predecessors 567 
    -- successors 569 570 
    -- members (1) 
      -- 	branch_block_stmt_1166/assign_stmt_1987/$entry
      -- 
    cp_elements(568) <= cp_elements(567);
    -- CP-element group 569 transition  output  bypass 
    -- predecessors 568 
    -- successors 571 
    -- members (7) 
      -- 	branch_block_stmt_1166/assign_stmt_1987/R_iNsTr_116_1986_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1987/R_iNsTr_116_1986_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1987/R_iNsTr_116_1986_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1987/R_iNsTr_116_1986_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1987/WPIPE_out_data1_1985_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1987/WPIPE_out_data1_1985_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1987/WPIPE_out_data1_1985_Sample/req
      -- 
    cp_elements(569) <= cp_elements(568);
    req_6838_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(569), ack => WPIPE_out_data1_1985_inst_req_0); -- 
    -- CP-element group 570 transition  output  bypass 
    -- predecessors 568 
    -- successors 572 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1987/WPIPE_out_data1_1985_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1987/WPIPE_out_data1_1985_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1987/WPIPE_out_data1_1985_Update/req
      -- 
    cp_elements(570) <= cp_elements(568);
    req_6843_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(570), ack => WPIPE_out_data1_1985_inst_req_1); -- 
    -- CP-element group 571 transition  input  bypass 
    -- predecessors 569 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1987/WPIPE_out_data1_1985_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1987/WPIPE_out_data1_1985_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1987/WPIPE_out_data1_1985_Sample/ack
      -- 
    ack_6839_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_out_data1_1985_inst_ack_0, ack => cp_elements(571)); -- 
    -- CP-element group 572 transition  place  input  bypass 
    -- predecessors 570 
    -- successors 573 
    -- members (6) 
      -- 	branch_block_stmt_1166/assign_stmt_1987__exit__
      -- 	branch_block_stmt_1166/assign_stmt_1990__entry__
      -- 	branch_block_stmt_1166/assign_stmt_1987/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1987/WPIPE_out_data1_1985_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1987/WPIPE_out_data1_1985_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1987/WPIPE_out_data1_1985_Update/ack
      -- 
    ack_6844_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_out_data1_1985_inst_ack_1, ack => cp_elements(572)); -- 
    -- CP-element group 573 fork  transition  bypass 
    -- predecessors 572 
    -- successors 574 575 
    -- members (1) 
      -- 	branch_block_stmt_1166/assign_stmt_1990/$entry
      -- 
    cp_elements(573) <= cp_elements(572);
    -- CP-element group 574 transition  output  bypass 
    -- predecessors 573 
    -- successors 576 
    -- members (7) 
      -- 	branch_block_stmt_1166/assign_stmt_1990/R_iNsTr_87_1989_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1990/R_iNsTr_87_1989_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1990/R_iNsTr_87_1989_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1990/R_iNsTr_87_1989_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1990/WPIPE_out_data2_1988_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1990/WPIPE_out_data2_1988_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1990/WPIPE_out_data2_1988_Sample/req
      -- 
    cp_elements(574) <= cp_elements(573);
    req_6859_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(574), ack => WPIPE_out_data2_1988_inst_req_0); -- 
    -- CP-element group 575 transition  output  bypass 
    -- predecessors 573 
    -- successors 577 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1990/WPIPE_out_data2_1988_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1990/WPIPE_out_data2_1988_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1990/WPIPE_out_data2_1988_Update/req
      -- 
    cp_elements(575) <= cp_elements(573);
    req_6864_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(575), ack => WPIPE_out_data2_1988_inst_req_1); -- 
    -- CP-element group 576 transition  input  bypass 
    -- predecessors 574 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1990/WPIPE_out_data2_1988_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1990/WPIPE_out_data2_1988_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1990/WPIPE_out_data2_1988_Sample/ack
      -- 
    ack_6860_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_out_data2_1988_inst_ack_0, ack => cp_elements(576)); -- 
    -- CP-element group 577 transition  place  input  bypass 
    -- predecessors 575 
    -- successors 578 
    -- members (6) 
      -- 	branch_block_stmt_1166/assign_stmt_1990__exit__
      -- 	branch_block_stmt_1166/assign_stmt_1993__entry__
      -- 	branch_block_stmt_1166/assign_stmt_1990/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1990/WPIPE_out_data2_1988_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1990/WPIPE_out_data2_1988_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1990/WPIPE_out_data2_1988_Update/ack
      -- 
    ack_6865_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_out_data2_1988_inst_ack_1, ack => cp_elements(577)); -- 
    -- CP-element group 578 fork  transition  bypass 
    -- predecessors 577 
    -- successors 579 580 
    -- members (1) 
      -- 	branch_block_stmt_1166/assign_stmt_1993/$entry
      -- 
    cp_elements(578) <= cp_elements(577);
    -- CP-element group 579 transition  output  bypass 
    -- predecessors 578 
    -- successors 581 
    -- members (7) 
      -- 	branch_block_stmt_1166/assign_stmt_1993/R_iNsTr_42_1992_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1993/R_iNsTr_42_1992_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1993/R_iNsTr_42_1992_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1993/R_iNsTr_42_1992_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1993/WPIPE_out_data3_1991_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1993/WPIPE_out_data3_1991_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1993/WPIPE_out_data3_1991_Sample/req
      -- 
    cp_elements(579) <= cp_elements(578);
    req_6880_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(579), ack => WPIPE_out_data3_1991_inst_req_0); -- 
    -- CP-element group 580 transition  output  bypass 
    -- predecessors 578 
    -- successors 582 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1993/WPIPE_out_data3_1991_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1993/WPIPE_out_data3_1991_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1993/WPIPE_out_data3_1991_Update/req
      -- 
    cp_elements(580) <= cp_elements(578);
    req_6885_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(580), ack => WPIPE_out_data3_1991_inst_req_1); -- 
    -- CP-element group 581 transition  input  bypass 
    -- predecessors 579 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1993/WPIPE_out_data3_1991_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1993/WPIPE_out_data3_1991_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1993/WPIPE_out_data3_1991_Sample/ack
      -- 
    ack_6881_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_out_data3_1991_inst_ack_0, ack => cp_elements(581)); -- 
    -- CP-element group 582 transition  place  input  bypass 
    -- predecessors 580 
    -- successors 583 
    -- members (6) 
      -- 	branch_block_stmt_1166/assign_stmt_1993__exit__
      -- 	branch_block_stmt_1166/assign_stmt_1996__entry__
      -- 	branch_block_stmt_1166/assign_stmt_1993/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1993/WPIPE_out_data3_1991_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1993/WPIPE_out_data3_1991_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1993/WPIPE_out_data3_1991_Update/ack
      -- 
    ack_6886_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_out_data3_1991_inst_ack_1, ack => cp_elements(582)); -- 
    -- CP-element group 583 fork  transition  bypass 
    -- predecessors 582 
    -- successors 584 585 
    -- members (1) 
      -- 	branch_block_stmt_1166/assign_stmt_1996/$entry
      -- 
    cp_elements(583) <= cp_elements(582);
    -- CP-element group 584 transition  output  bypass 
    -- predecessors 583 
    -- successors 586 
    -- members (7) 
      -- 	branch_block_stmt_1166/assign_stmt_1996/R_iNsTr_40_1995_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1996/R_iNsTr_40_1995_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1996/R_iNsTr_40_1995_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1996/R_iNsTr_40_1995_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1996/WPIPE_out_data4_1994_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_1996/WPIPE_out_data4_1994_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1996/WPIPE_out_data4_1994_Sample/req
      -- 
    cp_elements(584) <= cp_elements(583);
    req_6901_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(584), ack => WPIPE_out_data4_1994_inst_req_0); -- 
    -- CP-element group 585 transition  output  bypass 
    -- predecessors 583 
    -- successors 587 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1996/WPIPE_out_data4_1994_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_1996/WPIPE_out_data4_1994_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_1996/WPIPE_out_data4_1994_Update/req
      -- 
    cp_elements(585) <= cp_elements(583);
    req_6906_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(585), ack => WPIPE_out_data4_1994_inst_req_1); -- 
    -- CP-element group 586 transition  input  bypass 
    -- predecessors 584 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_1996/WPIPE_out_data4_1994_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1996/WPIPE_out_data4_1994_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1996/WPIPE_out_data4_1994_Sample/ack
      -- 
    ack_6902_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_out_data4_1994_inst_ack_0, ack => cp_elements(586)); -- 
    -- CP-element group 587 transition  place  input  bypass 
    -- predecessors 585 
    -- successors 588 
    -- members (6) 
      -- 	branch_block_stmt_1166/assign_stmt_1996__exit__
      -- 	branch_block_stmt_1166/assign_stmt_2002_to_assign_stmt_2014__entry__
      -- 	branch_block_stmt_1166/assign_stmt_1996/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1996/WPIPE_out_data4_1994_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_1996/WPIPE_out_data4_1994_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_1996/WPIPE_out_data4_1994_Update/ack
      -- 
    ack_6907_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_out_data4_1994_inst_ack_1, ack => cp_elements(587)); -- 
    -- CP-element group 588 fork  transition  bypass 
    -- predecessors 587 
    -- successors 589 590 593 594 597 
    -- members (1) 
      -- 	branch_block_stmt_1166/assign_stmt_2002_to_assign_stmt_2014/$entry
      -- 
    cp_elements(588) <= cp_elements(587);
    -- CP-element group 589 transition  output  bypass 
    -- predecessors 588 
    -- successors 592 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_2002_to_assign_stmt_2014/MUL_f32_f32_2001_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_2002_to_assign_stmt_2014/MUL_f32_f32_2001_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_2002_to_assign_stmt_2014/MUL_f32_f32_2001_Update/cr
      -- 
    cp_elements(589) <= cp_elements(588);
    cr_6927_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(589), ack => MUL_f32_f32_2001_inst_req_1); -- 
    -- CP-element group 590 transition  output  bypass 
    -- predecessors 588 
    -- successors 591 
    -- members (7) 
      -- 	branch_block_stmt_1166/assign_stmt_2002_to_assign_stmt_2014/MUL_f32_f32_2001_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_2002_to_assign_stmt_2014/R_iNsTr_40_1998_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_2002_to_assign_stmt_2014/R_iNsTr_40_1998_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_2002_to_assign_stmt_2014/R_iNsTr_40_1998_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_2002_to_assign_stmt_2014/R_iNsTr_40_1998_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_2002_to_assign_stmt_2014/MUL_f32_f32_2001_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_2002_to_assign_stmt_2014/MUL_f32_f32_2001_Sample/rr
      -- 
    cp_elements(590) <= cp_elements(588);
    rr_6922_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(590), ack => MUL_f32_f32_2001_inst_req_0); -- 
    -- CP-element group 591 transition  input  bypass 
    -- predecessors 590 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_2002_to_assign_stmt_2014/MUL_f32_f32_2001_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_2002_to_assign_stmt_2014/MUL_f32_f32_2001_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_2002_to_assign_stmt_2014/MUL_f32_f32_2001_Sample/ra
      -- 
    ra_6923_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f32_f32_2001_inst_ack_0, ack => cp_elements(591)); -- 
    -- CP-element group 592 transition  input  bypass 
    -- predecessors 589 
    -- successors 600 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_2002_to_assign_stmt_2014/MUL_f32_f32_2001_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_2002_to_assign_stmt_2014/MUL_f32_f32_2001_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_2002_to_assign_stmt_2014/MUL_f32_f32_2001_Update/ca
      -- 
    ca_6928_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f32_f32_2001_inst_ack_1, ack => cp_elements(592)); -- 
    -- CP-element group 593 transition  output  bypass 
    -- predecessors 588 
    -- successors 596 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_2002_to_assign_stmt_2014/MUL_f32_f32_2007_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_2002_to_assign_stmt_2014/MUL_f32_f32_2007_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_2002_to_assign_stmt_2014/MUL_f32_f32_2007_Update/cr
      -- 
    cp_elements(593) <= cp_elements(588);
    cr_6945_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(593), ack => MUL_f32_f32_2007_inst_req_1); -- 
    -- CP-element group 594 transition  output  bypass 
    -- predecessors 588 
    -- successors 595 
    -- members (7) 
      -- 	branch_block_stmt_1166/assign_stmt_2002_to_assign_stmt_2014/MUL_f32_f32_2007_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_2002_to_assign_stmt_2014/R_iNsTr_2_2004_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_2002_to_assign_stmt_2014/R_iNsTr_2_2004_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_2002_to_assign_stmt_2014/R_iNsTr_2_2004_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_2002_to_assign_stmt_2014/R_iNsTr_2_2004_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_2002_to_assign_stmt_2014/MUL_f32_f32_2007_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_2002_to_assign_stmt_2014/MUL_f32_f32_2007_Sample/rr
      -- 
    cp_elements(594) <= cp_elements(588);
    rr_6940_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(594), ack => MUL_f32_f32_2007_inst_req_0); -- 
    -- CP-element group 595 transition  input  bypass 
    -- predecessors 594 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_2002_to_assign_stmt_2014/MUL_f32_f32_2007_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_2002_to_assign_stmt_2014/MUL_f32_f32_2007_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_2002_to_assign_stmt_2014/MUL_f32_f32_2007_Sample/ra
      -- 
    ra_6941_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f32_f32_2007_inst_ack_0, ack => cp_elements(595)); -- 
    -- CP-element group 596 transition  input  output  bypass 
    -- predecessors 593 
    -- successors 598 
    -- members (10) 
      -- 	branch_block_stmt_1166/assign_stmt_2002_to_assign_stmt_2014/MUL_f32_f32_2007_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_2002_to_assign_stmt_2014/MUL_f32_f32_2007_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_2002_to_assign_stmt_2014/MUL_f32_f32_2007_Update/ca
      -- 	branch_block_stmt_1166/assign_stmt_2002_to_assign_stmt_2014/MUL_f32_f32_2013_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_2002_to_assign_stmt_2014/R_phitmp2_2010_sample_start_
      -- 	branch_block_stmt_1166/assign_stmt_2002_to_assign_stmt_2014/R_phitmp2_2010_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_2002_to_assign_stmt_2014/R_phitmp2_2010_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_2002_to_assign_stmt_2014/R_phitmp2_2010_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_2002_to_assign_stmt_2014/MUL_f32_f32_2013_Sample/$entry
      -- 	branch_block_stmt_1166/assign_stmt_2002_to_assign_stmt_2014/MUL_f32_f32_2013_Sample/rr
      -- 
    ca_6946_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f32_f32_2007_inst_ack_1, ack => cp_elements(596)); -- 
    rr_6958_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(596), ack => MUL_f32_f32_2013_inst_req_0); -- 
    -- CP-element group 597 transition  output  bypass 
    -- predecessors 588 
    -- successors 599 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_2002_to_assign_stmt_2014/MUL_f32_f32_2013_update_start_
      -- 	branch_block_stmt_1166/assign_stmt_2002_to_assign_stmt_2014/MUL_f32_f32_2013_Update/$entry
      -- 	branch_block_stmt_1166/assign_stmt_2002_to_assign_stmt_2014/MUL_f32_f32_2013_Update/cr
      -- 
    cp_elements(597) <= cp_elements(588);
    cr_6963_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(597), ack => MUL_f32_f32_2013_inst_req_1); -- 
    -- CP-element group 598 transition  input  bypass 
    -- predecessors 596 
    -- successors 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_2002_to_assign_stmt_2014/MUL_f32_f32_2013_sample_completed_
      -- 	branch_block_stmt_1166/assign_stmt_2002_to_assign_stmt_2014/MUL_f32_f32_2013_Sample/$exit
      -- 	branch_block_stmt_1166/assign_stmt_2002_to_assign_stmt_2014/MUL_f32_f32_2013_Sample/ra
      -- 
    ra_6959_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f32_f32_2013_inst_ack_0, ack => cp_elements(598)); -- 
    -- CP-element group 599 transition  input  bypass 
    -- predecessors 597 
    -- successors 600 
    -- members (3) 
      -- 	branch_block_stmt_1166/assign_stmt_2002_to_assign_stmt_2014/MUL_f32_f32_2013_update_completed_
      -- 	branch_block_stmt_1166/assign_stmt_2002_to_assign_stmt_2014/MUL_f32_f32_2013_Update/$exit
      -- 	branch_block_stmt_1166/assign_stmt_2002_to_assign_stmt_2014/MUL_f32_f32_2013_Update/ca
      -- 
    ca_6964_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f32_f32_2013_inst_ack_1, ack => cp_elements(599)); -- 
    -- CP-element group 600 join  transition  bypass 
    -- predecessors 592 599 
    -- successors 23 
    -- members (1) 
      -- 	branch_block_stmt_1166/assign_stmt_2002_to_assign_stmt_2014/$exit
      -- 
    cp_element_group_600: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_600"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(592) & cp_elements(599);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(600), clk => clk, reset => reset); --
    end block;
    -- CP-element group 601 fork  transition  bypass 
    -- predecessors 0 
    -- successors 602 606 610 614 618 622 
    -- members (1) 
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/$entry
      -- 
    cp_elements(601) <= cp_elements(0);
    -- CP-element group 602 fork  transition  bypass 
    -- predecessors 601 
    -- successors 603 604 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1169/$entry
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1169/phi_stmt_1169_sources/$entry
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1169/phi_stmt_1169_sources/type_cast_1175/$entry
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1169/phi_stmt_1169_sources/type_cast_1175/SplitProtocol/$entry
      -- 
    cp_elements(602) <= cp_elements(601);
    -- CP-element group 603 transition  bypass 
    -- predecessors 602 
    -- successors 605 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1169/phi_stmt_1169_sources/type_cast_1175/SplitProtocol/Sample/$entry
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1169/phi_stmt_1169_sources/type_cast_1175/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1169/phi_stmt_1169_sources/type_cast_1175/SplitProtocol/Sample/rr
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1169/phi_stmt_1169_sources/type_cast_1175/SplitProtocol/Sample/ra
      -- 
    cp_elements(603) <= cp_elements(602);
    -- CP-element group 604 transition  bypass 
    -- predecessors 602 
    -- successors 605 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1169/phi_stmt_1169_sources/type_cast_1175/SplitProtocol/Update/$entry
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1169/phi_stmt_1169_sources/type_cast_1175/SplitProtocol/Update/$exit
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1169/phi_stmt_1169_sources/type_cast_1175/SplitProtocol/Update/cr
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1169/phi_stmt_1169_sources/type_cast_1175/SplitProtocol/Update/ca
      -- 
    cp_elements(604) <= cp_elements(602);
    -- CP-element group 605 join  transition  output  bypass 
    -- predecessors 603 604 
    -- successors 626 
    -- members (5) 
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1169/$exit
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1169/phi_stmt_1169_sources/$exit
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1169/phi_stmt_1169_sources/type_cast_1175/$exit
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1169/phi_stmt_1169_sources/type_cast_1175/SplitProtocol/$exit
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1169/phi_stmt_1169_req
      -- 
    cp_element_group_605: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_605"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(603) & cp_elements(604);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(605), clk => clk, reset => reset); --
    end block;
    phi_stmt_1169_req_6990_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(605), ack => phi_stmt_1169_req_0); -- 
    -- CP-element group 606 fork  transition  bypass 
    -- predecessors 601 
    -- successors 607 608 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1176/$entry
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1176/phi_stmt_1176_sources/$entry
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1176/phi_stmt_1176_sources/type_cast_1182/$entry
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1176/phi_stmt_1176_sources/type_cast_1182/SplitProtocol/$entry
      -- 
    cp_elements(606) <= cp_elements(601);
    -- CP-element group 607 transition  bypass 
    -- predecessors 606 
    -- successors 609 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1176/phi_stmt_1176_sources/type_cast_1182/SplitProtocol/Sample/$entry
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1176/phi_stmt_1176_sources/type_cast_1182/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1176/phi_stmt_1176_sources/type_cast_1182/SplitProtocol/Sample/rr
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1176/phi_stmt_1176_sources/type_cast_1182/SplitProtocol/Sample/ra
      -- 
    cp_elements(607) <= cp_elements(606);
    -- CP-element group 608 transition  bypass 
    -- predecessors 606 
    -- successors 609 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1176/phi_stmt_1176_sources/type_cast_1182/SplitProtocol/Update/$entry
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1176/phi_stmt_1176_sources/type_cast_1182/SplitProtocol/Update/$exit
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1176/phi_stmt_1176_sources/type_cast_1182/SplitProtocol/Update/cr
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1176/phi_stmt_1176_sources/type_cast_1182/SplitProtocol/Update/ca
      -- 
    cp_elements(608) <= cp_elements(606);
    -- CP-element group 609 join  transition  output  bypass 
    -- predecessors 607 608 
    -- successors 626 
    -- members (5) 
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1176/$exit
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1176/phi_stmt_1176_sources/$exit
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1176/phi_stmt_1176_sources/type_cast_1182/$exit
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1176/phi_stmt_1176_sources/type_cast_1182/SplitProtocol/$exit
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1176/phi_stmt_1176_req
      -- 
    cp_element_group_609: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_609"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(607) & cp_elements(608);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(609), clk => clk, reset => reset); --
    end block;
    phi_stmt_1176_req_7013_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(609), ack => phi_stmt_1176_req_0); -- 
    -- CP-element group 610 fork  transition  bypass 
    -- predecessors 601 
    -- successors 611 612 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1183/$entry
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1183/phi_stmt_1183_sources/$entry
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1183/phi_stmt_1183_sources/type_cast_1189/$entry
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1183/phi_stmt_1183_sources/type_cast_1189/SplitProtocol/$entry
      -- 
    cp_elements(610) <= cp_elements(601);
    -- CP-element group 611 transition  bypass 
    -- predecessors 610 
    -- successors 613 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1183/phi_stmt_1183_sources/type_cast_1189/SplitProtocol/Sample/$entry
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1183/phi_stmt_1183_sources/type_cast_1189/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1183/phi_stmt_1183_sources/type_cast_1189/SplitProtocol/Sample/rr
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1183/phi_stmt_1183_sources/type_cast_1189/SplitProtocol/Sample/ra
      -- 
    cp_elements(611) <= cp_elements(610);
    -- CP-element group 612 transition  bypass 
    -- predecessors 610 
    -- successors 613 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1183/phi_stmt_1183_sources/type_cast_1189/SplitProtocol/Update/$entry
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1183/phi_stmt_1183_sources/type_cast_1189/SplitProtocol/Update/$exit
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1183/phi_stmt_1183_sources/type_cast_1189/SplitProtocol/Update/cr
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1183/phi_stmt_1183_sources/type_cast_1189/SplitProtocol/Update/ca
      -- 
    cp_elements(612) <= cp_elements(610);
    -- CP-element group 613 join  transition  output  bypass 
    -- predecessors 611 612 
    -- successors 626 
    -- members (5) 
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1183/$exit
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1183/phi_stmt_1183_sources/$exit
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1183/phi_stmt_1183_sources/type_cast_1189/$exit
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1183/phi_stmt_1183_sources/type_cast_1189/SplitProtocol/$exit
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1183/phi_stmt_1183_req
      -- 
    cp_element_group_613: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_613"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(611) & cp_elements(612);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(613), clk => clk, reset => reset); --
    end block;
    phi_stmt_1183_req_7036_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(613), ack => phi_stmt_1183_req_0); -- 
    -- CP-element group 614 fork  transition  bypass 
    -- predecessors 601 
    -- successors 615 616 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1190/$entry
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1190/phi_stmt_1190_sources/$entry
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1190/phi_stmt_1190_sources/type_cast_1196/$entry
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1190/phi_stmt_1190_sources/type_cast_1196/SplitProtocol/$entry
      -- 
    cp_elements(614) <= cp_elements(601);
    -- CP-element group 615 transition  bypass 
    -- predecessors 614 
    -- successors 617 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1190/phi_stmt_1190_sources/type_cast_1196/SplitProtocol/Sample/$entry
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1190/phi_stmt_1190_sources/type_cast_1196/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1190/phi_stmt_1190_sources/type_cast_1196/SplitProtocol/Sample/rr
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1190/phi_stmt_1190_sources/type_cast_1196/SplitProtocol/Sample/ra
      -- 
    cp_elements(615) <= cp_elements(614);
    -- CP-element group 616 transition  bypass 
    -- predecessors 614 
    -- successors 617 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1190/phi_stmt_1190_sources/type_cast_1196/SplitProtocol/Update/$entry
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1190/phi_stmt_1190_sources/type_cast_1196/SplitProtocol/Update/$exit
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1190/phi_stmt_1190_sources/type_cast_1196/SplitProtocol/Update/cr
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1190/phi_stmt_1190_sources/type_cast_1196/SplitProtocol/Update/ca
      -- 
    cp_elements(616) <= cp_elements(614);
    -- CP-element group 617 join  transition  output  bypass 
    -- predecessors 615 616 
    -- successors 626 
    -- members (5) 
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1190/$exit
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1190/phi_stmt_1190_sources/$exit
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1190/phi_stmt_1190_sources/type_cast_1196/$exit
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1190/phi_stmt_1190_sources/type_cast_1196/SplitProtocol/$exit
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1190/phi_stmt_1190_req
      -- 
    cp_element_group_617: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_617"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(615) & cp_elements(616);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(617), clk => clk, reset => reset); --
    end block;
    phi_stmt_1190_req_7059_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(617), ack => phi_stmt_1190_req_0); -- 
    -- CP-element group 618 fork  transition  bypass 
    -- predecessors 601 
    -- successors 619 620 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1197/$entry
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1197/phi_stmt_1197_sources/$entry
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1197/phi_stmt_1197_sources/type_cast_1203/$entry
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1197/phi_stmt_1197_sources/type_cast_1203/SplitProtocol/$entry
      -- 
    cp_elements(618) <= cp_elements(601);
    -- CP-element group 619 transition  bypass 
    -- predecessors 618 
    -- successors 621 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1197/phi_stmt_1197_sources/type_cast_1203/SplitProtocol/Sample/$entry
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1197/phi_stmt_1197_sources/type_cast_1203/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1197/phi_stmt_1197_sources/type_cast_1203/SplitProtocol/Sample/rr
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1197/phi_stmt_1197_sources/type_cast_1203/SplitProtocol/Sample/ra
      -- 
    cp_elements(619) <= cp_elements(618);
    -- CP-element group 620 transition  bypass 
    -- predecessors 618 
    -- successors 621 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1197/phi_stmt_1197_sources/type_cast_1203/SplitProtocol/Update/$entry
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1197/phi_stmt_1197_sources/type_cast_1203/SplitProtocol/Update/$exit
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1197/phi_stmt_1197_sources/type_cast_1203/SplitProtocol/Update/cr
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1197/phi_stmt_1197_sources/type_cast_1203/SplitProtocol/Update/ca
      -- 
    cp_elements(620) <= cp_elements(618);
    -- CP-element group 621 join  transition  output  bypass 
    -- predecessors 619 620 
    -- successors 626 
    -- members (5) 
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1197/$exit
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1197/phi_stmt_1197_sources/$exit
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1197/phi_stmt_1197_sources/type_cast_1203/$exit
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1197/phi_stmt_1197_sources/type_cast_1203/SplitProtocol/$exit
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1197/phi_stmt_1197_req
      -- 
    cp_element_group_621: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_621"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(619) & cp_elements(620);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(621), clk => clk, reset => reset); --
    end block;
    phi_stmt_1197_req_7082_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(621), ack => phi_stmt_1197_req_0); -- 
    -- CP-element group 622 fork  transition  bypass 
    -- predecessors 601 
    -- successors 623 624 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1204/$entry
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1204/phi_stmt_1204_sources/$entry
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1204/phi_stmt_1204_sources/type_cast_1210/$entry
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1204/phi_stmt_1204_sources/type_cast_1210/SplitProtocol/$entry
      -- 
    cp_elements(622) <= cp_elements(601);
    -- CP-element group 623 transition  bypass 
    -- predecessors 622 
    -- successors 625 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1204/phi_stmt_1204_sources/type_cast_1210/SplitProtocol/Sample/$entry
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1204/phi_stmt_1204_sources/type_cast_1210/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1204/phi_stmt_1204_sources/type_cast_1210/SplitProtocol/Sample/rr
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1204/phi_stmt_1204_sources/type_cast_1210/SplitProtocol/Sample/ra
      -- 
    cp_elements(623) <= cp_elements(622);
    -- CP-element group 624 transition  bypass 
    -- predecessors 622 
    -- successors 625 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1204/phi_stmt_1204_sources/type_cast_1210/SplitProtocol/Update/$entry
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1204/phi_stmt_1204_sources/type_cast_1210/SplitProtocol/Update/$exit
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1204/phi_stmt_1204_sources/type_cast_1210/SplitProtocol/Update/cr
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1204/phi_stmt_1204_sources/type_cast_1210/SplitProtocol/Update/ca
      -- 
    cp_elements(624) <= cp_elements(622);
    -- CP-element group 625 join  transition  output  bypass 
    -- predecessors 623 624 
    -- successors 626 
    -- members (5) 
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1204/$exit
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1204/phi_stmt_1204_sources/$exit
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1204/phi_stmt_1204_sources/type_cast_1210/$exit
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1204/phi_stmt_1204_sources/type_cast_1210/SplitProtocol/$exit
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/phi_stmt_1204/phi_stmt_1204_req
      -- 
    cp_element_group_625: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_625"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(623) & cp_elements(624);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(625), clk => clk, reset => reset); --
    end block;
    phi_stmt_1204_req_7105_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(625), ack => phi_stmt_1204_req_0); -- 
    -- CP-element group 626 join  transition  bypass 
    -- predecessors 605 609 613 617 621 625 
    -- successors 665 
    -- members (1) 
      -- 	branch_block_stmt_1166/bb_0_bb_1_PhiReq/$exit
      -- 
    cp_element_group_626: block -- 
      constant place_capacities: IntegerArray(0 to 5) := (0 => 1,1 => 1,2 => 1,3 => 1,4 => 1,5 => 1);
      constant place_markings: IntegerArray(0 to 5)  := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0,5 => 0);
      constant place_delays: IntegerArray(0 to 5) := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0,5 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_626"; 
      signal preds: BooleanArray(1 to 6); -- 
    begin -- 
      preds <= cp_elements(605) & cp_elements(609) & cp_elements(613) & cp_elements(617) & cp_elements(621) & cp_elements(625);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(626), clk => clk, reset => reset); --
    end block;
    -- CP-element group 627 fork  transition  bypass 
    -- predecessors 23 
    -- successors 628 634 640 646 652 658 
    -- members (1) 
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/$entry
      -- 
    cp_elements(627) <= cp_elements(23);
    -- CP-element group 628 fork  transition  bypass 
    -- predecessors 627 
    -- successors 629 631 
    -- members (4) 
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1169/$entry
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1169/phi_stmt_1169_sources/$entry
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1169/phi_stmt_1169_sources/type_cast_1175/$entry
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1169/phi_stmt_1169_sources/type_cast_1175/SplitProtocol/$entry
      -- 
    cp_elements(628) <= cp_elements(627);
    -- CP-element group 629 transition  output  bypass 
    -- predecessors 628 
    -- successors 630 
    -- members (2) 
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1169/phi_stmt_1169_sources/type_cast_1175/SplitProtocol/Sample/$entry
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1169/phi_stmt_1169_sources/type_cast_1175/SplitProtocol/Sample/rr
      -- 
    cp_elements(629) <= cp_elements(628);
    rr_7124_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(629), ack => type_cast_1175_inst_req_0); -- 
    -- CP-element group 630 transition  input  bypass 
    -- predecessors 629 
    -- successors 633 
    -- members (2) 
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1169/phi_stmt_1169_sources/type_cast_1175/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1169/phi_stmt_1169_sources/type_cast_1175/SplitProtocol/Sample/ra
      -- 
    ra_7125_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1175_inst_ack_0, ack => cp_elements(630)); -- 
    -- CP-element group 631 transition  output  bypass 
    -- predecessors 628 
    -- successors 632 
    -- members (2) 
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1169/phi_stmt_1169_sources/type_cast_1175/SplitProtocol/Update/$entry
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1169/phi_stmt_1169_sources/type_cast_1175/SplitProtocol/Update/cr
      -- 
    cp_elements(631) <= cp_elements(628);
    cr_7129_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(631), ack => type_cast_1175_inst_req_1); -- 
    -- CP-element group 632 transition  input  bypass 
    -- predecessors 631 
    -- successors 633 
    -- members (2) 
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1169/phi_stmt_1169_sources/type_cast_1175/SplitProtocol/Update/$exit
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1169/phi_stmt_1169_sources/type_cast_1175/SplitProtocol/Update/ca
      -- 
    ca_7130_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1175_inst_ack_1, ack => cp_elements(632)); -- 
    -- CP-element group 633 join  transition  output  bypass 
    -- predecessors 630 632 
    -- successors 664 
    -- members (5) 
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1169/$exit
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1169/phi_stmt_1169_sources/$exit
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1169/phi_stmt_1169_sources/type_cast_1175/$exit
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1169/phi_stmt_1169_sources/type_cast_1175/SplitProtocol/$exit
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1169/phi_stmt_1169_req
      -- 
    cp_element_group_633: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_633"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(630) & cp_elements(632);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(633), clk => clk, reset => reset); --
    end block;
    phi_stmt_1169_req_7131_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(633), ack => phi_stmt_1169_req_1); -- 
    -- CP-element group 634 fork  transition  bypass 
    -- predecessors 627 
    -- successors 635 637 
    -- members (4) 
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1176/$entry
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1176/phi_stmt_1176_sources/$entry
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1176/phi_stmt_1176_sources/type_cast_1182/$entry
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1176/phi_stmt_1176_sources/type_cast_1182/SplitProtocol/$entry
      -- 
    cp_elements(634) <= cp_elements(627);
    -- CP-element group 635 transition  output  bypass 
    -- predecessors 634 
    -- successors 636 
    -- members (2) 
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1176/phi_stmt_1176_sources/type_cast_1182/SplitProtocol/Sample/$entry
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1176/phi_stmt_1176_sources/type_cast_1182/SplitProtocol/Sample/rr
      -- 
    cp_elements(635) <= cp_elements(634);
    rr_7147_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(635), ack => type_cast_1182_inst_req_0); -- 
    -- CP-element group 636 transition  input  bypass 
    -- predecessors 635 
    -- successors 639 
    -- members (2) 
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1176/phi_stmt_1176_sources/type_cast_1182/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1176/phi_stmt_1176_sources/type_cast_1182/SplitProtocol/Sample/ra
      -- 
    ra_7148_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1182_inst_ack_0, ack => cp_elements(636)); -- 
    -- CP-element group 637 transition  output  bypass 
    -- predecessors 634 
    -- successors 638 
    -- members (2) 
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1176/phi_stmt_1176_sources/type_cast_1182/SplitProtocol/Update/$entry
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1176/phi_stmt_1176_sources/type_cast_1182/SplitProtocol/Update/cr
      -- 
    cp_elements(637) <= cp_elements(634);
    cr_7152_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(637), ack => type_cast_1182_inst_req_1); -- 
    -- CP-element group 638 transition  input  bypass 
    -- predecessors 637 
    -- successors 639 
    -- members (2) 
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1176/phi_stmt_1176_sources/type_cast_1182/SplitProtocol/Update/$exit
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1176/phi_stmt_1176_sources/type_cast_1182/SplitProtocol/Update/ca
      -- 
    ca_7153_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1182_inst_ack_1, ack => cp_elements(638)); -- 
    -- CP-element group 639 join  transition  output  bypass 
    -- predecessors 636 638 
    -- successors 664 
    -- members (5) 
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1176/$exit
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1176/phi_stmt_1176_sources/$exit
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1176/phi_stmt_1176_sources/type_cast_1182/$exit
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1176/phi_stmt_1176_sources/type_cast_1182/SplitProtocol/$exit
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1176/phi_stmt_1176_req
      -- 
    cp_element_group_639: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_639"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(636) & cp_elements(638);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(639), clk => clk, reset => reset); --
    end block;
    phi_stmt_1176_req_7154_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(639), ack => phi_stmt_1176_req_1); -- 
    -- CP-element group 640 fork  transition  bypass 
    -- predecessors 627 
    -- successors 641 643 
    -- members (4) 
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1183/$entry
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1183/phi_stmt_1183_sources/$entry
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1183/phi_stmt_1183_sources/type_cast_1189/$entry
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1183/phi_stmt_1183_sources/type_cast_1189/SplitProtocol/$entry
      -- 
    cp_elements(640) <= cp_elements(627);
    -- CP-element group 641 transition  output  bypass 
    -- predecessors 640 
    -- successors 642 
    -- members (2) 
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1183/phi_stmt_1183_sources/type_cast_1189/SplitProtocol/Sample/$entry
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1183/phi_stmt_1183_sources/type_cast_1189/SplitProtocol/Sample/rr
      -- 
    cp_elements(641) <= cp_elements(640);
    rr_7170_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(641), ack => type_cast_1189_inst_req_0); -- 
    -- CP-element group 642 transition  input  bypass 
    -- predecessors 641 
    -- successors 645 
    -- members (2) 
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1183/phi_stmt_1183_sources/type_cast_1189/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1183/phi_stmt_1183_sources/type_cast_1189/SplitProtocol/Sample/ra
      -- 
    ra_7171_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1189_inst_ack_0, ack => cp_elements(642)); -- 
    -- CP-element group 643 transition  output  bypass 
    -- predecessors 640 
    -- successors 644 
    -- members (2) 
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1183/phi_stmt_1183_sources/type_cast_1189/SplitProtocol/Update/$entry
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1183/phi_stmt_1183_sources/type_cast_1189/SplitProtocol/Update/cr
      -- 
    cp_elements(643) <= cp_elements(640);
    cr_7175_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(643), ack => type_cast_1189_inst_req_1); -- 
    -- CP-element group 644 transition  input  bypass 
    -- predecessors 643 
    -- successors 645 
    -- members (2) 
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1183/phi_stmt_1183_sources/type_cast_1189/SplitProtocol/Update/$exit
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1183/phi_stmt_1183_sources/type_cast_1189/SplitProtocol/Update/ca
      -- 
    ca_7176_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1189_inst_ack_1, ack => cp_elements(644)); -- 
    -- CP-element group 645 join  transition  output  bypass 
    -- predecessors 642 644 
    -- successors 664 
    -- members (5) 
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1183/$exit
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1183/phi_stmt_1183_sources/$exit
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1183/phi_stmt_1183_sources/type_cast_1189/$exit
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1183/phi_stmt_1183_sources/type_cast_1189/SplitProtocol/$exit
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1183/phi_stmt_1183_req
      -- 
    cp_element_group_645: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_645"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(642) & cp_elements(644);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(645), clk => clk, reset => reset); --
    end block;
    phi_stmt_1183_req_7177_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(645), ack => phi_stmt_1183_req_1); -- 
    -- CP-element group 646 fork  transition  bypass 
    -- predecessors 627 
    -- successors 647 649 
    -- members (4) 
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1190/$entry
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1190/phi_stmt_1190_sources/$entry
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1190/phi_stmt_1190_sources/type_cast_1196/$entry
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1190/phi_stmt_1190_sources/type_cast_1196/SplitProtocol/$entry
      -- 
    cp_elements(646) <= cp_elements(627);
    -- CP-element group 647 transition  output  bypass 
    -- predecessors 646 
    -- successors 648 
    -- members (2) 
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1190/phi_stmt_1190_sources/type_cast_1196/SplitProtocol/Sample/$entry
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1190/phi_stmt_1190_sources/type_cast_1196/SplitProtocol/Sample/rr
      -- 
    cp_elements(647) <= cp_elements(646);
    rr_7193_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(647), ack => type_cast_1196_inst_req_0); -- 
    -- CP-element group 648 transition  input  bypass 
    -- predecessors 647 
    -- successors 651 
    -- members (2) 
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1190/phi_stmt_1190_sources/type_cast_1196/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1190/phi_stmt_1190_sources/type_cast_1196/SplitProtocol/Sample/ra
      -- 
    ra_7194_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1196_inst_ack_0, ack => cp_elements(648)); -- 
    -- CP-element group 649 transition  output  bypass 
    -- predecessors 646 
    -- successors 650 
    -- members (2) 
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1190/phi_stmt_1190_sources/type_cast_1196/SplitProtocol/Update/$entry
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1190/phi_stmt_1190_sources/type_cast_1196/SplitProtocol/Update/cr
      -- 
    cp_elements(649) <= cp_elements(646);
    cr_7198_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(649), ack => type_cast_1196_inst_req_1); -- 
    -- CP-element group 650 transition  input  bypass 
    -- predecessors 649 
    -- successors 651 
    -- members (2) 
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1190/phi_stmt_1190_sources/type_cast_1196/SplitProtocol/Update/$exit
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1190/phi_stmt_1190_sources/type_cast_1196/SplitProtocol/Update/ca
      -- 
    ca_7199_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1196_inst_ack_1, ack => cp_elements(650)); -- 
    -- CP-element group 651 join  transition  output  bypass 
    -- predecessors 648 650 
    -- successors 664 
    -- members (5) 
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1190/$exit
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1190/phi_stmt_1190_sources/$exit
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1190/phi_stmt_1190_sources/type_cast_1196/$exit
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1190/phi_stmt_1190_sources/type_cast_1196/SplitProtocol/$exit
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1190/phi_stmt_1190_req
      -- 
    cp_element_group_651: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_651"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(648) & cp_elements(650);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(651), clk => clk, reset => reset); --
    end block;
    phi_stmt_1190_req_7200_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(651), ack => phi_stmt_1190_req_1); -- 
    -- CP-element group 652 fork  transition  bypass 
    -- predecessors 627 
    -- successors 653 655 
    -- members (4) 
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1197/$entry
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1197/phi_stmt_1197_sources/$entry
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1197/phi_stmt_1197_sources/type_cast_1203/$entry
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1197/phi_stmt_1197_sources/type_cast_1203/SplitProtocol/$entry
      -- 
    cp_elements(652) <= cp_elements(627);
    -- CP-element group 653 transition  output  bypass 
    -- predecessors 652 
    -- successors 654 
    -- members (2) 
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1197/phi_stmt_1197_sources/type_cast_1203/SplitProtocol/Sample/$entry
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1197/phi_stmt_1197_sources/type_cast_1203/SplitProtocol/Sample/rr
      -- 
    cp_elements(653) <= cp_elements(652);
    rr_7216_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(653), ack => type_cast_1203_inst_req_0); -- 
    -- CP-element group 654 transition  input  bypass 
    -- predecessors 653 
    -- successors 657 
    -- members (2) 
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1197/phi_stmt_1197_sources/type_cast_1203/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1197/phi_stmt_1197_sources/type_cast_1203/SplitProtocol/Sample/ra
      -- 
    ra_7217_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1203_inst_ack_0, ack => cp_elements(654)); -- 
    -- CP-element group 655 transition  output  bypass 
    -- predecessors 652 
    -- successors 656 
    -- members (2) 
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1197/phi_stmt_1197_sources/type_cast_1203/SplitProtocol/Update/$entry
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1197/phi_stmt_1197_sources/type_cast_1203/SplitProtocol/Update/cr
      -- 
    cp_elements(655) <= cp_elements(652);
    cr_7221_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(655), ack => type_cast_1203_inst_req_1); -- 
    -- CP-element group 656 transition  input  bypass 
    -- predecessors 655 
    -- successors 657 
    -- members (2) 
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1197/phi_stmt_1197_sources/type_cast_1203/SplitProtocol/Update/$exit
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1197/phi_stmt_1197_sources/type_cast_1203/SplitProtocol/Update/ca
      -- 
    ca_7222_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1203_inst_ack_1, ack => cp_elements(656)); -- 
    -- CP-element group 657 join  transition  output  bypass 
    -- predecessors 654 656 
    -- successors 664 
    -- members (5) 
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1197/$exit
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1197/phi_stmt_1197_sources/$exit
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1197/phi_stmt_1197_sources/type_cast_1203/$exit
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1197/phi_stmt_1197_sources/type_cast_1203/SplitProtocol/$exit
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1197/phi_stmt_1197_req
      -- 
    cp_element_group_657: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_657"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(654) & cp_elements(656);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(657), clk => clk, reset => reset); --
    end block;
    phi_stmt_1197_req_7223_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(657), ack => phi_stmt_1197_req_1); -- 
    -- CP-element group 658 fork  transition  bypass 
    -- predecessors 627 
    -- successors 659 661 
    -- members (4) 
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1204/$entry
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1204/phi_stmt_1204_sources/$entry
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1204/phi_stmt_1204_sources/type_cast_1210/$entry
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1204/phi_stmt_1204_sources/type_cast_1210/SplitProtocol/$entry
      -- 
    cp_elements(658) <= cp_elements(627);
    -- CP-element group 659 transition  output  bypass 
    -- predecessors 658 
    -- successors 660 
    -- members (2) 
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1204/phi_stmt_1204_sources/type_cast_1210/SplitProtocol/Sample/$entry
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1204/phi_stmt_1204_sources/type_cast_1210/SplitProtocol/Sample/rr
      -- 
    cp_elements(659) <= cp_elements(658);
    rr_7239_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(659), ack => type_cast_1210_inst_req_0); -- 
    -- CP-element group 660 transition  input  bypass 
    -- predecessors 659 
    -- successors 663 
    -- members (2) 
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1204/phi_stmt_1204_sources/type_cast_1210/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1204/phi_stmt_1204_sources/type_cast_1210/SplitProtocol/Sample/ra
      -- 
    ra_7240_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1210_inst_ack_0, ack => cp_elements(660)); -- 
    -- CP-element group 661 transition  output  bypass 
    -- predecessors 658 
    -- successors 662 
    -- members (2) 
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1204/phi_stmt_1204_sources/type_cast_1210/SplitProtocol/Update/$entry
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1204/phi_stmt_1204_sources/type_cast_1210/SplitProtocol/Update/cr
      -- 
    cp_elements(661) <= cp_elements(658);
    cr_7244_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(661), ack => type_cast_1210_inst_req_1); -- 
    -- CP-element group 662 transition  input  bypass 
    -- predecessors 661 
    -- successors 663 
    -- members (2) 
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1204/phi_stmt_1204_sources/type_cast_1210/SplitProtocol/Update/$exit
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1204/phi_stmt_1204_sources/type_cast_1210/SplitProtocol/Update/ca
      -- 
    ca_7245_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1210_inst_ack_1, ack => cp_elements(662)); -- 
    -- CP-element group 663 join  transition  output  bypass 
    -- predecessors 660 662 
    -- successors 664 
    -- members (5) 
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1204/$exit
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1204/phi_stmt_1204_sources/$exit
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1204/phi_stmt_1204_sources/type_cast_1210/$exit
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1204/phi_stmt_1204_sources/type_cast_1210/SplitProtocol/$exit
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/phi_stmt_1204/phi_stmt_1204_req
      -- 
    cp_element_group_663: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_663"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(660) & cp_elements(662);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(663), clk => clk, reset => reset); --
    end block;
    phi_stmt_1204_req_7246_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(663), ack => phi_stmt_1204_req_1); -- 
    -- CP-element group 664 join  transition  bypass 
    -- predecessors 633 639 645 651 657 663 
    -- successors 665 
    -- members (1) 
      -- 	branch_block_stmt_1166/fdiv32x_xexit_bb_1_PhiReq/$exit
      -- 
    cp_element_group_664: block -- 
      constant place_capacities: IntegerArray(0 to 5) := (0 => 1,1 => 1,2 => 1,3 => 1,4 => 1,5 => 1);
      constant place_markings: IntegerArray(0 to 5)  := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0,5 => 0);
      constant place_delays: IntegerArray(0 to 5) := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0,5 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_664"; 
      signal preds: BooleanArray(1 to 6); -- 
    begin -- 
      preds <= cp_elements(633) & cp_elements(639) & cp_elements(645) & cp_elements(651) & cp_elements(657) & cp_elements(663);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(664), clk => clk, reset => reset); --
    end block;
    -- CP-element group 665 merge  place  bypass 
    -- predecessors 626 664 
    -- successors 666 
    -- members (1) 
      -- 	branch_block_stmt_1166/merge_stmt_1168_PhiReqMerge
      -- 
    cp_elements(665) <= OrReduce(cp_elements(626) & cp_elements(664));
    -- CP-element group 666 fork  transition  bypass 
    -- predecessors 665 
    -- successors 667 668 669 670 671 672 
    -- members (1) 
      -- 	branch_block_stmt_1166/merge_stmt_1168_PhiAck/$entry
      -- 
    cp_elements(666) <= cp_elements(665);
    -- CP-element group 667 transition  input  bypass 
    -- predecessors 666 
    -- successors 673 
    -- members (1) 
      -- 	branch_block_stmt_1166/merge_stmt_1168_PhiAck/phi_stmt_1169_ack
      -- 
    phi_stmt_1169_ack_7251_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => phi_stmt_1169_ack_0, ack => cp_elements(667)); -- 
    -- CP-element group 668 transition  input  bypass 
    -- predecessors 666 
    -- successors 673 
    -- members (1) 
      -- 	branch_block_stmt_1166/merge_stmt_1168_PhiAck/phi_stmt_1176_ack
      -- 
    phi_stmt_1176_ack_7252_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => phi_stmt_1176_ack_0, ack => cp_elements(668)); -- 
    -- CP-element group 669 transition  input  bypass 
    -- predecessors 666 
    -- successors 673 
    -- members (1) 
      -- 	branch_block_stmt_1166/merge_stmt_1168_PhiAck/phi_stmt_1183_ack
      -- 
    phi_stmt_1183_ack_7253_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => phi_stmt_1183_ack_0, ack => cp_elements(669)); -- 
    -- CP-element group 670 transition  input  bypass 
    -- predecessors 666 
    -- successors 673 
    -- members (1) 
      -- 	branch_block_stmt_1166/merge_stmt_1168_PhiAck/phi_stmt_1190_ack
      -- 
    phi_stmt_1190_ack_7254_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => phi_stmt_1190_ack_0, ack => cp_elements(670)); -- 
    -- CP-element group 671 transition  input  bypass 
    -- predecessors 666 
    -- successors 673 
    -- members (1) 
      -- 	branch_block_stmt_1166/merge_stmt_1168_PhiAck/phi_stmt_1197_ack
      -- 
    phi_stmt_1197_ack_7255_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => phi_stmt_1197_ack_0, ack => cp_elements(671)); -- 
    -- CP-element group 672 transition  input  bypass 
    -- predecessors 666 
    -- successors 673 
    -- members (1) 
      -- 	branch_block_stmt_1166/merge_stmt_1168_PhiAck/phi_stmt_1204_ack
      -- 
    phi_stmt_1204_ack_7256_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => phi_stmt_1204_ack_0, ack => cp_elements(672)); -- 
    -- CP-element group 673 join  transition  bypass 
    -- predecessors 667 668 669 670 671 672 
    -- successors 2 
    -- members (1) 
      -- 	branch_block_stmt_1166/merge_stmt_1168_PhiAck/$exit
      -- 
    cp_element_group_673: block -- 
      constant place_capacities: IntegerArray(0 to 5) := (0 => 1,1 => 1,2 => 1,3 => 1,4 => 1,5 => 1);
      constant place_markings: IntegerArray(0 to 5)  := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0,5 => 0);
      constant place_delays: IntegerArray(0 to 5) := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0,5 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_673"; 
      signal preds: BooleanArray(1 to 6); -- 
    begin -- 
      preds <= cp_elements(667) & cp_elements(668) & cp_elements(669) & cp_elements(670) & cp_elements(671) & cp_elements(672);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(673), clk => clk, reset => reset); --
    end block;
    -- CP-element group 674 fork  transition  bypass 
    -- predecessors 67 
    -- successors 675 677 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_2_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1270/$entry
      -- 	branch_block_stmt_1166/bb_2_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1270/SplitProtocol/$entry
      -- 
    cp_elements(674) <= cp_elements(67);
    -- CP-element group 675 transition  output  bypass 
    -- predecessors 674 
    -- successors 676 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_2_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1270/SplitProtocol/Sample/$entry
      -- 	branch_block_stmt_1166/bb_2_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1270/SplitProtocol/Sample/rr
      -- 
    cp_elements(675) <= cp_elements(674);
    rr_7307_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(675), ack => type_cast_1270_inst_req_0); -- 
    -- CP-element group 676 transition  input  bypass 
    -- predecessors 675 
    -- successors 679 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_2_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1270/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/bb_2_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1270/SplitProtocol/Sample/ra
      -- 
    ra_7308_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1270_inst_ack_0, ack => cp_elements(676)); -- 
    -- CP-element group 677 transition  output  bypass 
    -- predecessors 674 
    -- successors 678 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_2_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1270/SplitProtocol/Update/$entry
      -- 	branch_block_stmt_1166/bb_2_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1270/SplitProtocol/Update/cr
      -- 
    cp_elements(677) <= cp_elements(674);
    cr_7312_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(677), ack => type_cast_1270_inst_req_1); -- 
    -- CP-element group 678 transition  input  bypass 
    -- predecessors 677 
    -- successors 679 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_2_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1270/SplitProtocol/Update/$exit
      -- 	branch_block_stmt_1166/bb_2_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1270/SplitProtocol/Update/ca
      -- 
    ca_7313_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1270_inst_ack_1, ack => cp_elements(678)); -- 
    -- CP-element group 679 join  transition  bypass 
    -- predecessors 676 678 
    -- successors 688 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_2_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1270/$exit
      -- 	branch_block_stmt_1166/bb_2_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1270/SplitProtocol/$exit
      -- 
    cp_element_group_679: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_679"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(676) & cp_elements(678);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(679), clk => clk, reset => reset); --
    end block;
    -- CP-element group 680 fork  transition  bypass 
    -- predecessors 67 
    -- successors 681 682 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_2_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1272/$entry
      -- 	branch_block_stmt_1166/bb_2_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1272/SplitProtocol/$entry
      -- 
    cp_elements(680) <= cp_elements(67);
    -- CP-element group 681 transition  bypass 
    -- predecessors 680 
    -- successors 683 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_2_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1272/SplitProtocol/Sample/$entry
      -- 	branch_block_stmt_1166/bb_2_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1272/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/bb_2_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1272/SplitProtocol/Sample/rr
      -- 	branch_block_stmt_1166/bb_2_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1272/SplitProtocol/Sample/ra
      -- 
    cp_elements(681) <= cp_elements(680);
    -- CP-element group 682 transition  bypass 
    -- predecessors 680 
    -- successors 683 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_2_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1272/SplitProtocol/Update/$entry
      -- 	branch_block_stmt_1166/bb_2_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1272/SplitProtocol/Update/$exit
      -- 	branch_block_stmt_1166/bb_2_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1272/SplitProtocol/Update/cr
      -- 	branch_block_stmt_1166/bb_2_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1272/SplitProtocol/Update/ca
      -- 
    cp_elements(682) <= cp_elements(680);
    -- CP-element group 683 join  transition  bypass 
    -- predecessors 681 682 
    -- successors 688 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_2_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1272/$exit
      -- 	branch_block_stmt_1166/bb_2_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1272/SplitProtocol/$exit
      -- 
    cp_element_group_683: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_683"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(681) & cp_elements(682);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(683), clk => clk, reset => reset); --
    end block;
    -- CP-element group 684 fork  transition  bypass 
    -- predecessors 67 
    -- successors 685 686 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_2_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1274/$entry
      -- 	branch_block_stmt_1166/bb_2_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1274/SplitProtocol/$entry
      -- 
    cp_elements(684) <= cp_elements(67);
    -- CP-element group 685 transition  bypass 
    -- predecessors 684 
    -- successors 687 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_2_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1274/SplitProtocol/Sample/$entry
      -- 	branch_block_stmt_1166/bb_2_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1274/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/bb_2_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1274/SplitProtocol/Sample/rr
      -- 	branch_block_stmt_1166/bb_2_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1274/SplitProtocol/Sample/ra
      -- 
    cp_elements(685) <= cp_elements(684);
    -- CP-element group 686 transition  bypass 
    -- predecessors 684 
    -- successors 687 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_2_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1274/SplitProtocol/Update/$entry
      -- 	branch_block_stmt_1166/bb_2_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1274/SplitProtocol/Update/$exit
      -- 	branch_block_stmt_1166/bb_2_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1274/SplitProtocol/Update/cr
      -- 	branch_block_stmt_1166/bb_2_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1274/SplitProtocol/Update/ca
      -- 
    cp_elements(686) <= cp_elements(684);
    -- CP-element group 687 join  transition  bypass 
    -- predecessors 685 686 
    -- successors 688 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_2_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1274/$exit
      -- 	branch_block_stmt_1166/bb_2_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1274/SplitProtocol/$exit
      -- 
    cp_element_group_687: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_687"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(685) & cp_elements(686);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(687), clk => clk, reset => reset); --
    end block;
    -- CP-element group 688 join  transition  output  bypass 
    -- predecessors 679 683 687 
    -- successors 719 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_2_bb_5_PhiReq/$exit
      -- 	branch_block_stmt_1166/bb_2_bb_5_PhiReq/phi_stmt_1267/$exit
      -- 	branch_block_stmt_1166/bb_2_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/$exit
      -- 	branch_block_stmt_1166/bb_2_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_req
      -- 
    cp_element_group_688: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 0,2 => 0);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_688"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= cp_elements(679) & cp_elements(683) & cp_elements(687);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(688), clk => clk, reset => reset); --
    end block;
    phi_stmt_1267_req_7346_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(688), ack => phi_stmt_1267_req_0); -- 
    -- CP-element group 689 fork  transition  bypass 
    -- predecessors 81 
    -- successors 690 691 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_3_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1270/$entry
      -- 	branch_block_stmt_1166/bb_3_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1270/SplitProtocol/$entry
      -- 
    cp_elements(689) <= cp_elements(81);
    -- CP-element group 690 transition  bypass 
    -- predecessors 689 
    -- successors 692 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_3_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1270/SplitProtocol/Sample/$entry
      -- 	branch_block_stmt_1166/bb_3_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1270/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/bb_3_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1270/SplitProtocol/Sample/rr
      -- 	branch_block_stmt_1166/bb_3_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1270/SplitProtocol/Sample/ra
      -- 
    cp_elements(690) <= cp_elements(689);
    -- CP-element group 691 transition  bypass 
    -- predecessors 689 
    -- successors 692 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_3_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1270/SplitProtocol/Update/$entry
      -- 	branch_block_stmt_1166/bb_3_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1270/SplitProtocol/Update/$exit
      -- 	branch_block_stmt_1166/bb_3_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1270/SplitProtocol/Update/cr
      -- 	branch_block_stmt_1166/bb_3_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1270/SplitProtocol/Update/ca
      -- 
    cp_elements(691) <= cp_elements(689);
    -- CP-element group 692 join  transition  bypass 
    -- predecessors 690 691 
    -- successors 703 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_3_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1270/$exit
      -- 	branch_block_stmt_1166/bb_3_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1270/SplitProtocol/$exit
      -- 
    cp_element_group_692: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_692"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(690) & cp_elements(691);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(692), clk => clk, reset => reset); --
    end block;
    -- CP-element group 693 fork  transition  bypass 
    -- predecessors 81 
    -- successors 694 695 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_3_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1272/$entry
      -- 	branch_block_stmt_1166/bb_3_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1272/SplitProtocol/$entry
      -- 
    cp_elements(693) <= cp_elements(81);
    -- CP-element group 694 transition  bypass 
    -- predecessors 693 
    -- successors 696 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_3_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1272/SplitProtocol/Sample/$entry
      -- 	branch_block_stmt_1166/bb_3_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1272/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/bb_3_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1272/SplitProtocol/Sample/rr
      -- 	branch_block_stmt_1166/bb_3_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1272/SplitProtocol/Sample/ra
      -- 
    cp_elements(694) <= cp_elements(693);
    -- CP-element group 695 transition  bypass 
    -- predecessors 693 
    -- successors 696 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_3_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1272/SplitProtocol/Update/$entry
      -- 	branch_block_stmt_1166/bb_3_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1272/SplitProtocol/Update/$exit
      -- 	branch_block_stmt_1166/bb_3_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1272/SplitProtocol/Update/cr
      -- 	branch_block_stmt_1166/bb_3_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1272/SplitProtocol/Update/ca
      -- 
    cp_elements(695) <= cp_elements(693);
    -- CP-element group 696 join  transition  bypass 
    -- predecessors 694 695 
    -- successors 703 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_3_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1272/$exit
      -- 	branch_block_stmt_1166/bb_3_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1272/SplitProtocol/$exit
      -- 
    cp_element_group_696: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_696"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(694) & cp_elements(695);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(696), clk => clk, reset => reset); --
    end block;
    -- CP-element group 697 fork  transition  bypass 
    -- predecessors 81 
    -- successors 698 700 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_3_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1274/$entry
      -- 	branch_block_stmt_1166/bb_3_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1274/SplitProtocol/$entry
      -- 
    cp_elements(697) <= cp_elements(81);
    -- CP-element group 698 transition  output  bypass 
    -- predecessors 697 
    -- successors 699 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_3_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1274/SplitProtocol/Sample/$entry
      -- 	branch_block_stmt_1166/bb_3_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1274/SplitProtocol/Sample/rr
      -- 
    cp_elements(698) <= cp_elements(697);
    rr_7397_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(698), ack => type_cast_1274_inst_req_0); -- 
    -- CP-element group 699 transition  input  bypass 
    -- predecessors 698 
    -- successors 702 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_3_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1274/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/bb_3_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1274/SplitProtocol/Sample/ra
      -- 
    ra_7398_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1274_inst_ack_0, ack => cp_elements(699)); -- 
    -- CP-element group 700 transition  output  bypass 
    -- predecessors 697 
    -- successors 701 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_3_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1274/SplitProtocol/Update/$entry
      -- 	branch_block_stmt_1166/bb_3_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1274/SplitProtocol/Update/cr
      -- 
    cp_elements(700) <= cp_elements(697);
    cr_7402_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(700), ack => type_cast_1274_inst_req_1); -- 
    -- CP-element group 701 transition  input  bypass 
    -- predecessors 700 
    -- successors 702 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_3_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1274/SplitProtocol/Update/$exit
      -- 	branch_block_stmt_1166/bb_3_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1274/SplitProtocol/Update/ca
      -- 
    ca_7403_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1274_inst_ack_1, ack => cp_elements(701)); -- 
    -- CP-element group 702 join  transition  bypass 
    -- predecessors 699 701 
    -- successors 703 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_3_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1274/$exit
      -- 	branch_block_stmt_1166/bb_3_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1274/SplitProtocol/$exit
      -- 
    cp_element_group_702: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_702"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(699) & cp_elements(701);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(702), clk => clk, reset => reset); --
    end block;
    -- CP-element group 703 join  transition  output  bypass 
    -- predecessors 692 696 702 
    -- successors 719 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_3_bb_5_PhiReq/$exit
      -- 	branch_block_stmt_1166/bb_3_bb_5_PhiReq/phi_stmt_1267/$exit
      -- 	branch_block_stmt_1166/bb_3_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/$exit
      -- 	branch_block_stmt_1166/bb_3_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_req
      -- 
    cp_element_group_703: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 0,2 => 0);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_703"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= cp_elements(692) & cp_elements(696) & cp_elements(702);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(703), clk => clk, reset => reset); --
    end block;
    phi_stmt_1267_req_7404_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(703), ack => phi_stmt_1267_req_2); -- 
    -- CP-element group 704 fork  transition  bypass 
    -- predecessors 86 
    -- successors 705 706 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_4_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1270/$entry
      -- 	branch_block_stmt_1166/bb_4_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1270/SplitProtocol/$entry
      -- 
    cp_elements(704) <= cp_elements(86);
    -- CP-element group 705 transition  bypass 
    -- predecessors 704 
    -- successors 707 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_4_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1270/SplitProtocol/Sample/$entry
      -- 	branch_block_stmt_1166/bb_4_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1270/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/bb_4_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1270/SplitProtocol/Sample/rr
      -- 	branch_block_stmt_1166/bb_4_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1270/SplitProtocol/Sample/ra
      -- 
    cp_elements(705) <= cp_elements(704);
    -- CP-element group 706 transition  bypass 
    -- predecessors 704 
    -- successors 707 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_4_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1270/SplitProtocol/Update/$entry
      -- 	branch_block_stmt_1166/bb_4_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1270/SplitProtocol/Update/$exit
      -- 	branch_block_stmt_1166/bb_4_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1270/SplitProtocol/Update/cr
      -- 	branch_block_stmt_1166/bb_4_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1270/SplitProtocol/Update/ca
      -- 
    cp_elements(706) <= cp_elements(704);
    -- CP-element group 707 join  transition  bypass 
    -- predecessors 705 706 
    -- successors 718 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_4_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1270/$exit
      -- 	branch_block_stmt_1166/bb_4_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1270/SplitProtocol/$exit
      -- 
    cp_element_group_707: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_707"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(705) & cp_elements(706);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(707), clk => clk, reset => reset); --
    end block;
    -- CP-element group 708 fork  transition  bypass 
    -- predecessors 86 
    -- successors 709 711 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_4_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1272/$entry
      -- 	branch_block_stmt_1166/bb_4_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1272/SplitProtocol/$entry
      -- 
    cp_elements(708) <= cp_elements(86);
    -- CP-element group 709 transition  output  bypass 
    -- predecessors 708 
    -- successors 710 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_4_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1272/SplitProtocol/Sample/$entry
      -- 	branch_block_stmt_1166/bb_4_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1272/SplitProtocol/Sample/rr
      -- 
    cp_elements(709) <= cp_elements(708);
    rr_7439_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(709), ack => type_cast_1272_inst_req_0); -- 
    -- CP-element group 710 transition  input  bypass 
    -- predecessors 709 
    -- successors 713 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_4_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1272/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/bb_4_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1272/SplitProtocol/Sample/ra
      -- 
    ra_7440_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1272_inst_ack_0, ack => cp_elements(710)); -- 
    -- CP-element group 711 transition  output  bypass 
    -- predecessors 708 
    -- successors 712 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_4_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1272/SplitProtocol/Update/$entry
      -- 	branch_block_stmt_1166/bb_4_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1272/SplitProtocol/Update/cr
      -- 
    cp_elements(711) <= cp_elements(708);
    cr_7444_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(711), ack => type_cast_1272_inst_req_1); -- 
    -- CP-element group 712 transition  input  bypass 
    -- predecessors 711 
    -- successors 713 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_4_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1272/SplitProtocol/Update/$exit
      -- 	branch_block_stmt_1166/bb_4_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1272/SplitProtocol/Update/ca
      -- 
    ca_7445_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1272_inst_ack_1, ack => cp_elements(712)); -- 
    -- CP-element group 713 join  transition  bypass 
    -- predecessors 710 712 
    -- successors 718 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_4_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1272/$exit
      -- 	branch_block_stmt_1166/bb_4_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1272/SplitProtocol/$exit
      -- 
    cp_element_group_713: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_713"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(710) & cp_elements(712);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(713), clk => clk, reset => reset); --
    end block;
    -- CP-element group 714 fork  transition  bypass 
    -- predecessors 86 
    -- successors 715 716 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_4_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1274/$entry
      -- 	branch_block_stmt_1166/bb_4_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1274/SplitProtocol/$entry
      -- 
    cp_elements(714) <= cp_elements(86);
    -- CP-element group 715 transition  bypass 
    -- predecessors 714 
    -- successors 717 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_4_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1274/SplitProtocol/Sample/$entry
      -- 	branch_block_stmt_1166/bb_4_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1274/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/bb_4_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1274/SplitProtocol/Sample/rr
      -- 	branch_block_stmt_1166/bb_4_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1274/SplitProtocol/Sample/ra
      -- 
    cp_elements(715) <= cp_elements(714);
    -- CP-element group 716 transition  bypass 
    -- predecessors 714 
    -- successors 717 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_4_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1274/SplitProtocol/Update/$entry
      -- 	branch_block_stmt_1166/bb_4_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1274/SplitProtocol/Update/$exit
      -- 	branch_block_stmt_1166/bb_4_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1274/SplitProtocol/Update/cr
      -- 	branch_block_stmt_1166/bb_4_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1274/SplitProtocol/Update/ca
      -- 
    cp_elements(716) <= cp_elements(714);
    -- CP-element group 717 join  transition  bypass 
    -- predecessors 715 716 
    -- successors 718 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_4_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1274/$exit
      -- 	branch_block_stmt_1166/bb_4_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/type_cast_1274/SplitProtocol/$exit
      -- 
    cp_element_group_717: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_717"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(715) & cp_elements(716);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(717), clk => clk, reset => reset); --
    end block;
    -- CP-element group 718 join  transition  output  bypass 
    -- predecessors 707 713 717 
    -- successors 719 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_4_bb_5_PhiReq/$exit
      -- 	branch_block_stmt_1166/bb_4_bb_5_PhiReq/phi_stmt_1267/$exit
      -- 	branch_block_stmt_1166/bb_4_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_sources/$exit
      -- 	branch_block_stmt_1166/bb_4_bb_5_PhiReq/phi_stmt_1267/phi_stmt_1267_req
      -- 
    cp_element_group_718: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 0,2 => 0);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_718"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= cp_elements(707) & cp_elements(713) & cp_elements(717);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(718), clk => clk, reset => reset); --
    end block;
    phi_stmt_1267_req_7462_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(718), ack => phi_stmt_1267_req_1); -- 
    -- CP-element group 719 merge  place  bypass 
    -- predecessors 688 703 718 
    -- successors 720 
    -- members (1) 
      -- 	branch_block_stmt_1166/merge_stmt_1266_PhiReqMerge
      -- 
    cp_elements(719) <= OrReduce(cp_elements(688) & cp_elements(703) & cp_elements(718));
    -- CP-element group 720 transition  bypass 
    -- predecessors 719 
    -- successors 721 
    -- members (1) 
      -- 	branch_block_stmt_1166/merge_stmt_1266_PhiAck/$entry
      -- 
    cp_elements(720) <= cp_elements(719);
    -- CP-element group 721 transition  place  input  bypass 
    -- predecessors 720 
    -- successors 87 
    -- members (4) 
      -- 	branch_block_stmt_1166/merge_stmt_1266__exit__
      -- 	branch_block_stmt_1166/assign_stmt_1280_to_assign_stmt_1307__entry__
      -- 	branch_block_stmt_1166/merge_stmt_1266_PhiAck/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1266_PhiAck/phi_stmt_1267_ack
      -- 
    phi_stmt_1267_ack_7467_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => phi_stmt_1267_ack_0, ack => cp_elements(721)); -- 
    -- CP-element group 722 transition  bypass 
    -- predecessors 115 
    -- successors 724 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_5_bb_8_PhiReq/phi_stmt_1330/phi_stmt_1330_sources/type_cast_1333/SplitProtocol/Sample/ra
      -- 	branch_block_stmt_1166/bb_5_bb_8_PhiReq/phi_stmt_1330/phi_stmt_1330_sources/type_cast_1333/SplitProtocol/Sample/rr
      -- 	branch_block_stmt_1166/bb_5_bb_8_PhiReq/phi_stmt_1330/phi_stmt_1330_sources/type_cast_1333/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/bb_5_bb_8_PhiReq/phi_stmt_1330/phi_stmt_1330_sources/type_cast_1333/SplitProtocol/Sample/$entry
      -- 
    cp_elements(722) <= cp_elements(115);
    -- CP-element group 723 transition  bypass 
    -- predecessors 115 
    -- successors 724 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_5_bb_8_PhiReq/phi_stmt_1330/phi_stmt_1330_sources/type_cast_1333/SplitProtocol/Update/ca
      -- 	branch_block_stmt_1166/bb_5_bb_8_PhiReq/phi_stmt_1330/phi_stmt_1330_sources/type_cast_1333/SplitProtocol/Update/cr
      -- 	branch_block_stmt_1166/bb_5_bb_8_PhiReq/phi_stmt_1330/phi_stmt_1330_sources/type_cast_1333/SplitProtocol/Update/$exit
      -- 	branch_block_stmt_1166/bb_5_bb_8_PhiReq/phi_stmt_1330/phi_stmt_1330_sources/type_cast_1333/SplitProtocol/Update/$entry
      -- 
    cp_elements(723) <= cp_elements(115);
    -- CP-element group 724 join  transition  output  bypass 
    -- predecessors 722 723 
    -- successors 733 
    -- members (6) 
      -- 	branch_block_stmt_1166/bb_5_bb_8_PhiReq/phi_stmt_1330/phi_stmt_1330_req
      -- 	branch_block_stmt_1166/bb_5_bb_8_PhiReq/phi_stmt_1330/phi_stmt_1330_sources/type_cast_1333/SplitProtocol/$exit
      -- 	branch_block_stmt_1166/bb_5_bb_8_PhiReq/phi_stmt_1330/phi_stmt_1330_sources/type_cast_1333/$exit
      -- 	branch_block_stmt_1166/bb_5_bb_8_PhiReq/$exit
      -- 	branch_block_stmt_1166/bb_5_bb_8_PhiReq/phi_stmt_1330/$exit
      -- 	branch_block_stmt_1166/bb_5_bb_8_PhiReq/phi_stmt_1330/phi_stmt_1330_sources/$exit
      -- 
    cp_element_group_724: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_724"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(722) & cp_elements(723);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(724), clk => clk, reset => reset); --
    end block;
    phi_stmt_1330_req_7517_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(724), ack => phi_stmt_1330_req_1); -- 
    -- CP-element group 725 transition  bypass 
    -- predecessors 127 
    -- successors 727 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_6_bb_8_PhiReq/phi_stmt_1330/phi_stmt_1330_sources/type_cast_1333/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/bb_6_bb_8_PhiReq/phi_stmt_1330/phi_stmt_1330_sources/type_cast_1333/SplitProtocol/Sample/$entry
      -- 	branch_block_stmt_1166/bb_6_bb_8_PhiReq/phi_stmt_1330/phi_stmt_1330_sources/type_cast_1333/SplitProtocol/Sample/rr
      -- 	branch_block_stmt_1166/bb_6_bb_8_PhiReq/phi_stmt_1330/phi_stmt_1330_sources/type_cast_1333/SplitProtocol/Sample/ra
      -- 
    cp_elements(725) <= cp_elements(127);
    -- CP-element group 726 transition  bypass 
    -- predecessors 127 
    -- successors 727 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_6_bb_8_PhiReq/phi_stmt_1330/phi_stmt_1330_sources/type_cast_1333/SplitProtocol/Update/$entry
      -- 	branch_block_stmt_1166/bb_6_bb_8_PhiReq/phi_stmt_1330/phi_stmt_1330_sources/type_cast_1333/SplitProtocol/Update/ca
      -- 	branch_block_stmt_1166/bb_6_bb_8_PhiReq/phi_stmt_1330/phi_stmt_1330_sources/type_cast_1333/SplitProtocol/Update/cr
      -- 	branch_block_stmt_1166/bb_6_bb_8_PhiReq/phi_stmt_1330/phi_stmt_1330_sources/type_cast_1333/SplitProtocol/Update/$exit
      -- 
    cp_elements(726) <= cp_elements(127);
    -- CP-element group 727 join  transition  output  bypass 
    -- predecessors 725 726 
    -- successors 733 
    -- members (6) 
      -- 	branch_block_stmt_1166/bb_6_bb_8_PhiReq/phi_stmt_1330/$exit
      -- 	branch_block_stmt_1166/bb_6_bb_8_PhiReq/phi_stmt_1330/phi_stmt_1330_sources/type_cast_1333/$exit
      -- 	branch_block_stmt_1166/bb_6_bb_8_PhiReq/phi_stmt_1330/phi_stmt_1330_sources/$exit
      -- 	branch_block_stmt_1166/bb_6_bb_8_PhiReq/phi_stmt_1330/phi_stmt_1330_sources/type_cast_1333/SplitProtocol/$exit
      -- 	branch_block_stmt_1166/bb_6_bb_8_PhiReq/$exit
      -- 	branch_block_stmt_1166/bb_6_bb_8_PhiReq/phi_stmt_1330/phi_stmt_1330_req
      -- 
    cp_element_group_727: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_727"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(725) & cp_elements(726);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(727), clk => clk, reset => reset); --
    end block;
    phi_stmt_1330_req_7543_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(727), ack => phi_stmt_1330_req_2); -- 
    -- CP-element group 728 transition  output  bypass 
    -- predecessors 6 
    -- successors 729 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_7_bb_8_PhiReq/phi_stmt_1330/phi_stmt_1330_sources/type_cast_1333/SplitProtocol/Sample/rr
      -- 	branch_block_stmt_1166/bb_7_bb_8_PhiReq/phi_stmt_1330/phi_stmt_1330_sources/type_cast_1333/SplitProtocol/Sample/$entry
      -- 
    cp_elements(728) <= cp_elements(6);
    rr_7562_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(728), ack => type_cast_1333_inst_req_0); -- 
    -- CP-element group 729 transition  input  bypass 
    -- predecessors 728 
    -- successors 732 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_7_bb_8_PhiReq/phi_stmt_1330/phi_stmt_1330_sources/type_cast_1333/SplitProtocol/Sample/ra
      -- 	branch_block_stmt_1166/bb_7_bb_8_PhiReq/phi_stmt_1330/phi_stmt_1330_sources/type_cast_1333/SplitProtocol/Sample/$exit
      -- 
    ra_7563_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1333_inst_ack_0, ack => cp_elements(729)); -- 
    -- CP-element group 730 transition  output  bypass 
    -- predecessors 6 
    -- successors 731 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_7_bb_8_PhiReq/phi_stmt_1330/phi_stmt_1330_sources/type_cast_1333/SplitProtocol/Update/cr
      -- 	branch_block_stmt_1166/bb_7_bb_8_PhiReq/phi_stmt_1330/phi_stmt_1330_sources/type_cast_1333/SplitProtocol/Update/$entry
      -- 
    cp_elements(730) <= cp_elements(6);
    cr_7567_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(730), ack => type_cast_1333_inst_req_1); -- 
    -- CP-element group 731 transition  input  bypass 
    -- predecessors 730 
    -- successors 732 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_7_bb_8_PhiReq/phi_stmt_1330/phi_stmt_1330_sources/type_cast_1333/SplitProtocol/Update/ca
      -- 	branch_block_stmt_1166/bb_7_bb_8_PhiReq/phi_stmt_1330/phi_stmt_1330_sources/type_cast_1333/SplitProtocol/Update/$exit
      -- 
    ca_7568_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1333_inst_ack_1, ack => cp_elements(731)); -- 
    -- CP-element group 732 join  transition  output  bypass 
    -- predecessors 729 731 
    -- successors 733 
    -- members (6) 
      -- 	branch_block_stmt_1166/bb_7_bb_8_PhiReq/phi_stmt_1330/phi_stmt_1330_req
      -- 	branch_block_stmt_1166/bb_7_bb_8_PhiReq/phi_stmt_1330/phi_stmt_1330_sources/type_cast_1333/SplitProtocol/$exit
      -- 	branch_block_stmt_1166/bb_7_bb_8_PhiReq/phi_stmt_1330/phi_stmt_1330_sources/type_cast_1333/$exit
      -- 	branch_block_stmt_1166/bb_7_bb_8_PhiReq/phi_stmt_1330/phi_stmt_1330_sources/$exit
      -- 	branch_block_stmt_1166/bb_7_bb_8_PhiReq/phi_stmt_1330/$exit
      -- 	branch_block_stmt_1166/bb_7_bb_8_PhiReq/$exit
      -- 
    cp_element_group_732: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_732"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(729) & cp_elements(731);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(732), clk => clk, reset => reset); --
    end block;
    phi_stmt_1330_req_7569_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(732), ack => phi_stmt_1330_req_0); -- 
    -- CP-element group 733 merge  place  bypass 
    -- predecessors 724 727 732 
    -- successors 734 
    -- members (1) 
      -- 	branch_block_stmt_1166/merge_stmt_1329_PhiReqMerge
      -- 
    cp_elements(733) <= OrReduce(cp_elements(724) & cp_elements(727) & cp_elements(732));
    -- CP-element group 734 transition  bypass 
    -- predecessors 733 
    -- successors 735 
    -- members (1) 
      -- 	branch_block_stmt_1166/merge_stmt_1329_PhiAck/$entry
      -- 
    cp_elements(734) <= cp_elements(733);
    -- CP-element group 735 transition  place  input  bypass 
    -- predecessors 734 
    -- successors 130 
    -- members (4) 
      -- 	branch_block_stmt_1166/merge_stmt_1329__exit__
      -- 	branch_block_stmt_1166/assign_stmt_1346_to_assign_stmt_1357__entry__
      -- 	branch_block_stmt_1166/merge_stmt_1329_PhiAck/phi_stmt_1330_ack
      -- 	branch_block_stmt_1166/merge_stmt_1329_PhiAck/$exit
      -- 
    phi_stmt_1330_ack_7574_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => phi_stmt_1330_ack_0, ack => cp_elements(735)); -- 
    -- CP-element group 736 transition  output  bypass 
    -- predecessors 172 
    -- successors 737 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_10_bb_11_PhiReq/phi_stmt_1394/phi_stmt_1394_sources/type_cast_1397/SplitProtocol/Sample/rr
      -- 	branch_block_stmt_1166/bb_10_bb_11_PhiReq/phi_stmt_1394/phi_stmt_1394_sources/type_cast_1397/SplitProtocol/Sample/$entry
      -- 
    cp_elements(736) <= cp_elements(172);
    rr_7617_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(736), ack => type_cast_1397_inst_req_0); -- 
    -- CP-element group 737 transition  input  bypass 
    -- predecessors 736 
    -- successors 740 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_10_bb_11_PhiReq/phi_stmt_1394/phi_stmt_1394_sources/type_cast_1397/SplitProtocol/Sample/ra
      -- 	branch_block_stmt_1166/bb_10_bb_11_PhiReq/phi_stmt_1394/phi_stmt_1394_sources/type_cast_1397/SplitProtocol/Sample/$exit
      -- 
    ra_7618_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1397_inst_ack_0, ack => cp_elements(737)); -- 
    -- CP-element group 738 transition  output  bypass 
    -- predecessors 172 
    -- successors 739 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_10_bb_11_PhiReq/phi_stmt_1394/phi_stmt_1394_sources/type_cast_1397/SplitProtocol/Update/cr
      -- 	branch_block_stmt_1166/bb_10_bb_11_PhiReq/phi_stmt_1394/phi_stmt_1394_sources/type_cast_1397/SplitProtocol/Update/$entry
      -- 
    cp_elements(738) <= cp_elements(172);
    cr_7622_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(738), ack => type_cast_1397_inst_req_1); -- 
    -- CP-element group 739 transition  input  bypass 
    -- predecessors 738 
    -- successors 740 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_10_bb_11_PhiReq/phi_stmt_1394/phi_stmt_1394_sources/type_cast_1397/SplitProtocol/Update/ca
      -- 	branch_block_stmt_1166/bb_10_bb_11_PhiReq/phi_stmt_1394/phi_stmt_1394_sources/type_cast_1397/SplitProtocol/Update/$exit
      -- 
    ca_7623_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1397_inst_ack_1, ack => cp_elements(739)); -- 
    -- CP-element group 740 join  transition  output  bypass 
    -- predecessors 737 739 
    -- successors 747 
    -- members (6) 
      -- 	branch_block_stmt_1166/bb_10_bb_11_PhiReq/phi_stmt_1394/phi_stmt_1394_req
      -- 	branch_block_stmt_1166/bb_10_bb_11_PhiReq/phi_stmt_1394/phi_stmt_1394_sources/type_cast_1397/SplitProtocol/$exit
      -- 	branch_block_stmt_1166/bb_10_bb_11_PhiReq/phi_stmt_1394/phi_stmt_1394_sources/type_cast_1397/$exit
      -- 	branch_block_stmt_1166/bb_10_bb_11_PhiReq/phi_stmt_1394/phi_stmt_1394_sources/$exit
      -- 	branch_block_stmt_1166/bb_10_bb_11_PhiReq/phi_stmt_1394/$exit
      -- 	branch_block_stmt_1166/bb_10_bb_11_PhiReq/$exit
      -- 
    cp_element_group_740: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_740"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(737) & cp_elements(739);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(740), clk => clk, reset => reset); --
    end block;
    phi_stmt_1394_req_7624_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(740), ack => phi_stmt_1394_req_0); -- 
    -- CP-element group 741 transition  bypass 
    -- predecessors 147 
    -- successors 743 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_8_bb_11_PhiReq/phi_stmt_1394/phi_stmt_1394_sources/type_cast_1397/SplitProtocol/Sample/ra
      -- 	branch_block_stmt_1166/bb_8_bb_11_PhiReq/phi_stmt_1394/phi_stmt_1394_sources/type_cast_1397/SplitProtocol/Sample/rr
      -- 	branch_block_stmt_1166/bb_8_bb_11_PhiReq/phi_stmt_1394/phi_stmt_1394_sources/type_cast_1397/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/bb_8_bb_11_PhiReq/phi_stmt_1394/phi_stmt_1394_sources/type_cast_1397/SplitProtocol/Sample/$entry
      -- 
    cp_elements(741) <= cp_elements(147);
    -- CP-element group 742 transition  bypass 
    -- predecessors 147 
    -- successors 743 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_8_bb_11_PhiReq/phi_stmt_1394/phi_stmt_1394_sources/type_cast_1397/SplitProtocol/Update/ca
      -- 	branch_block_stmt_1166/bb_8_bb_11_PhiReq/phi_stmt_1394/phi_stmt_1394_sources/type_cast_1397/SplitProtocol/Update/cr
      -- 	branch_block_stmt_1166/bb_8_bb_11_PhiReq/phi_stmt_1394/phi_stmt_1394_sources/type_cast_1397/SplitProtocol/Update/$exit
      -- 	branch_block_stmt_1166/bb_8_bb_11_PhiReq/phi_stmt_1394/phi_stmt_1394_sources/type_cast_1397/SplitProtocol/Update/$entry
      -- 
    cp_elements(742) <= cp_elements(147);
    -- CP-element group 743 join  transition  output  bypass 
    -- predecessors 741 742 
    -- successors 747 
    -- members (6) 
      -- 	branch_block_stmt_1166/bb_8_bb_11_PhiReq/phi_stmt_1394/phi_stmt_1394_req
      -- 	branch_block_stmt_1166/bb_8_bb_11_PhiReq/phi_stmt_1394/phi_stmt_1394_sources/type_cast_1397/SplitProtocol/$exit
      -- 	branch_block_stmt_1166/bb_8_bb_11_PhiReq/phi_stmt_1394/phi_stmt_1394_sources/type_cast_1397/$exit
      -- 	branch_block_stmt_1166/bb_8_bb_11_PhiReq/phi_stmt_1394/phi_stmt_1394_sources/$exit
      -- 	branch_block_stmt_1166/bb_8_bb_11_PhiReq/phi_stmt_1394/$exit
      -- 	branch_block_stmt_1166/bb_8_bb_11_PhiReq/$exit
      -- 
    cp_element_group_743: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_743"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(741) & cp_elements(742);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(743), clk => clk, reset => reset); --
    end block;
    phi_stmt_1394_req_7650_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(743), ack => phi_stmt_1394_req_1); -- 
    -- CP-element group 744 transition  bypass 
    -- predecessors 159 
    -- successors 746 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_9_bb_11_PhiReq/phi_stmt_1394/phi_stmt_1394_sources/type_cast_1397/SplitProtocol/Sample/$entry
      -- 	branch_block_stmt_1166/bb_9_bb_11_PhiReq/phi_stmt_1394/phi_stmt_1394_sources/type_cast_1397/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/bb_9_bb_11_PhiReq/phi_stmt_1394/phi_stmt_1394_sources/type_cast_1397/SplitProtocol/Sample/rr
      -- 	branch_block_stmt_1166/bb_9_bb_11_PhiReq/phi_stmt_1394/phi_stmt_1394_sources/type_cast_1397/SplitProtocol/Sample/ra
      -- 
    cp_elements(744) <= cp_elements(159);
    -- CP-element group 745 transition  bypass 
    -- predecessors 159 
    -- successors 746 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_9_bb_11_PhiReq/phi_stmt_1394/phi_stmt_1394_sources/type_cast_1397/SplitProtocol/Update/cr
      -- 	branch_block_stmt_1166/bb_9_bb_11_PhiReq/phi_stmt_1394/phi_stmt_1394_sources/type_cast_1397/SplitProtocol/Update/ca
      -- 	branch_block_stmt_1166/bb_9_bb_11_PhiReq/phi_stmt_1394/phi_stmt_1394_sources/type_cast_1397/SplitProtocol/Update/$exit
      -- 	branch_block_stmt_1166/bb_9_bb_11_PhiReq/phi_stmt_1394/phi_stmt_1394_sources/type_cast_1397/SplitProtocol/Update/$entry
      -- 
    cp_elements(745) <= cp_elements(159);
    -- CP-element group 746 join  transition  output  bypass 
    -- predecessors 744 745 
    -- successors 747 
    -- members (6) 
      -- 	branch_block_stmt_1166/bb_9_bb_11_PhiReq/$exit
      -- 	branch_block_stmt_1166/bb_9_bb_11_PhiReq/phi_stmt_1394/$exit
      -- 	branch_block_stmt_1166/bb_9_bb_11_PhiReq/phi_stmt_1394/phi_stmt_1394_sources/$exit
      -- 	branch_block_stmt_1166/bb_9_bb_11_PhiReq/phi_stmt_1394/phi_stmt_1394_sources/type_cast_1397/$exit
      -- 	branch_block_stmt_1166/bb_9_bb_11_PhiReq/phi_stmt_1394/phi_stmt_1394_req
      -- 	branch_block_stmt_1166/bb_9_bb_11_PhiReq/phi_stmt_1394/phi_stmt_1394_sources/type_cast_1397/SplitProtocol/$exit
      -- 
    cp_element_group_746: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_746"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(744) & cp_elements(745);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(746), clk => clk, reset => reset); --
    end block;
    phi_stmt_1394_req_7676_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(746), ack => phi_stmt_1394_req_2); -- 
    -- CP-element group 747 merge  place  bypass 
    -- predecessors 740 743 746 
    -- successors 748 
    -- members (1) 
      -- 	branch_block_stmt_1166/merge_stmt_1393_PhiReqMerge
      -- 
    cp_elements(747) <= OrReduce(cp_elements(740) & cp_elements(743) & cp_elements(746));
    -- CP-element group 748 transition  bypass 
    -- predecessors 747 
    -- successors 749 
    -- members (1) 
      -- 	branch_block_stmt_1166/merge_stmt_1393_PhiAck/$entry
      -- 
    cp_elements(748) <= cp_elements(747);
    -- CP-element group 749 transition  place  input  bypass 
    -- predecessors 748 
    -- successors 173 
    -- members (4) 
      -- 	branch_block_stmt_1166/merge_stmt_1393__exit__
      -- 	branch_block_stmt_1166/assign_stmt_1408_to_assign_stmt_1414__entry__
      -- 	branch_block_stmt_1166/merge_stmt_1393_PhiAck/phi_stmt_1394_ack
      -- 	branch_block_stmt_1166/merge_stmt_1393_PhiAck/$exit
      -- 
    phi_stmt_1394_ack_7681_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => phi_stmt_1394_ack_0, ack => cp_elements(749)); -- 
    -- CP-element group 750 fork  transition  bypass 
    -- predecessors 187 
    -- successors 751 752 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_11_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1511/$entry
      -- 	branch_block_stmt_1166/bb_11_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1511/SplitProtocol/$entry
      -- 
    cp_elements(750) <= cp_elements(187);
    -- CP-element group 751 transition  bypass 
    -- predecessors 750 
    -- successors 753 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_11_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1511/SplitProtocol/Sample/$entry
      -- 	branch_block_stmt_1166/bb_11_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1511/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/bb_11_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1511/SplitProtocol/Sample/rr
      -- 	branch_block_stmt_1166/bb_11_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1511/SplitProtocol/Sample/ra
      -- 
    cp_elements(751) <= cp_elements(750);
    -- CP-element group 752 transition  bypass 
    -- predecessors 750 
    -- successors 753 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_11_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1511/SplitProtocol/Update/$entry
      -- 	branch_block_stmt_1166/bb_11_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1511/SplitProtocol/Update/$exit
      -- 	branch_block_stmt_1166/bb_11_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1511/SplitProtocol/Update/cr
      -- 	branch_block_stmt_1166/bb_11_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1511/SplitProtocol/Update/ca
      -- 
    cp_elements(752) <= cp_elements(750);
    -- CP-element group 753 join  transition  bypass 
    -- predecessors 751 752 
    -- successors 762 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_11_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1511/$exit
      -- 	branch_block_stmt_1166/bb_11_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1511/SplitProtocol/$exit
      -- 
    cp_element_group_753: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_753"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(751) & cp_elements(752);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(753), clk => clk, reset => reset); --
    end block;
    -- CP-element group 754 fork  transition  bypass 
    -- predecessors 187 
    -- successors 755 756 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_11_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1513/$entry
      -- 	branch_block_stmt_1166/bb_11_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1513/SplitProtocol/$entry
      -- 
    cp_elements(754) <= cp_elements(187);
    -- CP-element group 755 transition  bypass 
    -- predecessors 754 
    -- successors 757 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_11_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1513/SplitProtocol/Sample/$entry
      -- 	branch_block_stmt_1166/bb_11_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1513/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/bb_11_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1513/SplitProtocol/Sample/rr
      -- 	branch_block_stmt_1166/bb_11_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1513/SplitProtocol/Sample/ra
      -- 
    cp_elements(755) <= cp_elements(754);
    -- CP-element group 756 transition  bypass 
    -- predecessors 754 
    -- successors 757 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_11_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1513/SplitProtocol/Update/$entry
      -- 	branch_block_stmt_1166/bb_11_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1513/SplitProtocol/Update/$exit
      -- 	branch_block_stmt_1166/bb_11_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1513/SplitProtocol/Update/cr
      -- 	branch_block_stmt_1166/bb_11_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1513/SplitProtocol/Update/ca
      -- 
    cp_elements(756) <= cp_elements(754);
    -- CP-element group 757 join  transition  bypass 
    -- predecessors 755 756 
    -- successors 762 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_11_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1513/$exit
      -- 	branch_block_stmt_1166/bb_11_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1513/SplitProtocol/$exit
      -- 
    cp_element_group_757: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_757"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(755) & cp_elements(756);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(757), clk => clk, reset => reset); --
    end block;
    -- CP-element group 758 fork  transition  bypass 
    -- predecessors 187 
    -- successors 759 760 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_11_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1515/$entry
      -- 	branch_block_stmt_1166/bb_11_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1515/SplitProtocol/$entry
      -- 
    cp_elements(758) <= cp_elements(187);
    -- CP-element group 759 transition  bypass 
    -- predecessors 758 
    -- successors 761 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_11_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1515/SplitProtocol/Sample/$entry
      -- 	branch_block_stmt_1166/bb_11_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1515/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/bb_11_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1515/SplitProtocol/Sample/rr
      -- 	branch_block_stmt_1166/bb_11_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1515/SplitProtocol/Sample/ra
      -- 
    cp_elements(759) <= cp_elements(758);
    -- CP-element group 760 transition  bypass 
    -- predecessors 758 
    -- successors 761 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_11_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1515/SplitProtocol/Update/$entry
      -- 	branch_block_stmt_1166/bb_11_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1515/SplitProtocol/Update/$exit
      -- 	branch_block_stmt_1166/bb_11_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1515/SplitProtocol/Update/cr
      -- 	branch_block_stmt_1166/bb_11_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1515/SplitProtocol/Update/ca
      -- 
    cp_elements(760) <= cp_elements(758);
    -- CP-element group 761 join  transition  bypass 
    -- predecessors 759 760 
    -- successors 762 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_11_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1515/$exit
      -- 	branch_block_stmt_1166/bb_11_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1515/SplitProtocol/$exit
      -- 
    cp_element_group_761: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_761"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(759) & cp_elements(760);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(761), clk => clk, reset => reset); --
    end block;
    -- CP-element group 762 join  transition  output  bypass 
    -- predecessors 753 757 761 
    -- successors 808 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_11_bb_17_PhiReq/$exit
      -- 	branch_block_stmt_1166/bb_11_bb_17_PhiReq/phi_stmt_1508/$exit
      -- 	branch_block_stmt_1166/bb_11_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/$exit
      -- 	branch_block_stmt_1166/bb_11_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_req
      -- 
    cp_element_group_762: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 0,2 => 0);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_762"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= cp_elements(753) & cp_elements(757) & cp_elements(761);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(762), clk => clk, reset => reset); --
    end block;
    phi_stmt_1508_req_7791_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(762), ack => phi_stmt_1508_req_3); -- 
    -- CP-element group 763 fork  transition  bypass 
    -- predecessors 210 
    -- successors 764 766 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_13_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1511/$entry
      -- 	branch_block_stmt_1166/bb_13_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1511/SplitProtocol/$entry
      -- 
    cp_elements(763) <= cp_elements(210);
    -- CP-element group 764 transition  output  bypass 
    -- predecessors 763 
    -- successors 765 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_13_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1511/SplitProtocol/Sample/$entry
      -- 	branch_block_stmt_1166/bb_13_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1511/SplitProtocol/Sample/rr
      -- 
    cp_elements(764) <= cp_elements(763);
    rr_7810_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(764), ack => type_cast_1511_inst_req_0); -- 
    -- CP-element group 765 transition  input  bypass 
    -- predecessors 764 
    -- successors 768 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_13_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1511/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/bb_13_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1511/SplitProtocol/Sample/ra
      -- 
    ra_7811_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1511_inst_ack_0, ack => cp_elements(765)); -- 
    -- CP-element group 766 transition  output  bypass 
    -- predecessors 763 
    -- successors 767 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_13_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1511/SplitProtocol/Update/$entry
      -- 	branch_block_stmt_1166/bb_13_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1511/SplitProtocol/Update/cr
      -- 
    cp_elements(766) <= cp_elements(763);
    cr_7815_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(766), ack => type_cast_1511_inst_req_1); -- 
    -- CP-element group 767 transition  input  bypass 
    -- predecessors 766 
    -- successors 768 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_13_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1511/SplitProtocol/Update/$exit
      -- 	branch_block_stmt_1166/bb_13_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1511/SplitProtocol/Update/ca
      -- 
    ca_7816_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1511_inst_ack_1, ack => cp_elements(767)); -- 
    -- CP-element group 768 join  transition  bypass 
    -- predecessors 765 767 
    -- successors 777 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_13_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1511/$exit
      -- 	branch_block_stmt_1166/bb_13_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1511/SplitProtocol/$exit
      -- 
    cp_element_group_768: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_768"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(765) & cp_elements(767);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(768), clk => clk, reset => reset); --
    end block;
    -- CP-element group 769 fork  transition  bypass 
    -- predecessors 210 
    -- successors 770 771 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_13_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1513/$entry
      -- 	branch_block_stmt_1166/bb_13_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1513/SplitProtocol/$entry
      -- 
    cp_elements(769) <= cp_elements(210);
    -- CP-element group 770 transition  bypass 
    -- predecessors 769 
    -- successors 772 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_13_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1513/SplitProtocol/Sample/$entry
      -- 	branch_block_stmt_1166/bb_13_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1513/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/bb_13_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1513/SplitProtocol/Sample/rr
      -- 	branch_block_stmt_1166/bb_13_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1513/SplitProtocol/Sample/ra
      -- 
    cp_elements(770) <= cp_elements(769);
    -- CP-element group 771 transition  bypass 
    -- predecessors 769 
    -- successors 772 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_13_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1513/SplitProtocol/Update/$entry
      -- 	branch_block_stmt_1166/bb_13_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1513/SplitProtocol/Update/$exit
      -- 	branch_block_stmt_1166/bb_13_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1513/SplitProtocol/Update/cr
      -- 	branch_block_stmt_1166/bb_13_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1513/SplitProtocol/Update/ca
      -- 
    cp_elements(771) <= cp_elements(769);
    -- CP-element group 772 join  transition  bypass 
    -- predecessors 770 771 
    -- successors 777 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_13_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1513/$exit
      -- 	branch_block_stmt_1166/bb_13_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1513/SplitProtocol/$exit
      -- 
    cp_element_group_772: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_772"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(770) & cp_elements(771);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(772), clk => clk, reset => reset); --
    end block;
    -- CP-element group 773 fork  transition  bypass 
    -- predecessors 210 
    -- successors 774 775 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_13_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1515/$entry
      -- 	branch_block_stmt_1166/bb_13_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1515/SplitProtocol/$entry
      -- 
    cp_elements(773) <= cp_elements(210);
    -- CP-element group 774 transition  bypass 
    -- predecessors 773 
    -- successors 776 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_13_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1515/SplitProtocol/Sample/$entry
      -- 	branch_block_stmt_1166/bb_13_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1515/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/bb_13_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1515/SplitProtocol/Sample/rr
      -- 	branch_block_stmt_1166/bb_13_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1515/SplitProtocol/Sample/ra
      -- 
    cp_elements(774) <= cp_elements(773);
    -- CP-element group 775 transition  bypass 
    -- predecessors 773 
    -- successors 776 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_13_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1515/SplitProtocol/Update/$entry
      -- 	branch_block_stmt_1166/bb_13_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1515/SplitProtocol/Update/$exit
      -- 	branch_block_stmt_1166/bb_13_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1515/SplitProtocol/Update/cr
      -- 	branch_block_stmt_1166/bb_13_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1515/SplitProtocol/Update/ca
      -- 
    cp_elements(775) <= cp_elements(773);
    -- CP-element group 776 join  transition  bypass 
    -- predecessors 774 775 
    -- successors 777 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_13_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1515/$exit
      -- 	branch_block_stmt_1166/bb_13_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1515/SplitProtocol/$exit
      -- 
    cp_element_group_776: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_776"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(774) & cp_elements(775);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(776), clk => clk, reset => reset); --
    end block;
    -- CP-element group 777 join  transition  output  bypass 
    -- predecessors 768 772 776 
    -- successors 808 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_13_bb_17_PhiReq/$exit
      -- 	branch_block_stmt_1166/bb_13_bb_17_PhiReq/phi_stmt_1508/$exit
      -- 	branch_block_stmt_1166/bb_13_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/$exit
      -- 	branch_block_stmt_1166/bb_13_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_req
      -- 
    cp_element_group_777: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 0,2 => 0);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_777"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= cp_elements(768) & cp_elements(772) & cp_elements(776);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(777), clk => clk, reset => reset); --
    end block;
    phi_stmt_1508_req_7849_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(777), ack => phi_stmt_1508_req_0); -- 
    -- CP-element group 778 fork  transition  bypass 
    -- predecessors 233 
    -- successors 779 780 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_15_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1511/$entry
      -- 	branch_block_stmt_1166/bb_15_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1511/SplitProtocol/$entry
      -- 
    cp_elements(778) <= cp_elements(233);
    -- CP-element group 779 transition  bypass 
    -- predecessors 778 
    -- successors 781 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_15_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1511/SplitProtocol/Sample/$entry
      -- 	branch_block_stmt_1166/bb_15_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1511/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/bb_15_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1511/SplitProtocol/Sample/rr
      -- 	branch_block_stmt_1166/bb_15_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1511/SplitProtocol/Sample/ra
      -- 
    cp_elements(779) <= cp_elements(778);
    -- CP-element group 780 transition  bypass 
    -- predecessors 778 
    -- successors 781 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_15_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1511/SplitProtocol/Update/$entry
      -- 	branch_block_stmt_1166/bb_15_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1511/SplitProtocol/Update/$exit
      -- 	branch_block_stmt_1166/bb_15_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1511/SplitProtocol/Update/cr
      -- 	branch_block_stmt_1166/bb_15_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1511/SplitProtocol/Update/ca
      -- 
    cp_elements(780) <= cp_elements(778);
    -- CP-element group 781 join  transition  bypass 
    -- predecessors 779 780 
    -- successors 792 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_15_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1511/$exit
      -- 	branch_block_stmt_1166/bb_15_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1511/SplitProtocol/$exit
      -- 
    cp_element_group_781: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_781"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(779) & cp_elements(780);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(781), clk => clk, reset => reset); --
    end block;
    -- CP-element group 782 fork  transition  bypass 
    -- predecessors 233 
    -- successors 783 785 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_15_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1513/$entry
      -- 	branch_block_stmt_1166/bb_15_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1513/SplitProtocol/$entry
      -- 
    cp_elements(782) <= cp_elements(233);
    -- CP-element group 783 transition  output  bypass 
    -- predecessors 782 
    -- successors 784 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_15_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1513/SplitProtocol/Sample/$entry
      -- 	branch_block_stmt_1166/bb_15_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1513/SplitProtocol/Sample/rr
      -- 
    cp_elements(783) <= cp_elements(782);
    rr_7884_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(783), ack => type_cast_1513_inst_req_0); -- 
    -- CP-element group 784 transition  input  bypass 
    -- predecessors 783 
    -- successors 787 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_15_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1513/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/bb_15_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1513/SplitProtocol/Sample/ra
      -- 
    ra_7885_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1513_inst_ack_0, ack => cp_elements(784)); -- 
    -- CP-element group 785 transition  output  bypass 
    -- predecessors 782 
    -- successors 786 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_15_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1513/SplitProtocol/Update/$entry
      -- 	branch_block_stmt_1166/bb_15_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1513/SplitProtocol/Update/cr
      -- 
    cp_elements(785) <= cp_elements(782);
    cr_7889_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(785), ack => type_cast_1513_inst_req_1); -- 
    -- CP-element group 786 transition  input  bypass 
    -- predecessors 785 
    -- successors 787 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_15_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1513/SplitProtocol/Update/$exit
      -- 	branch_block_stmt_1166/bb_15_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1513/SplitProtocol/Update/ca
      -- 
    ca_7890_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1513_inst_ack_1, ack => cp_elements(786)); -- 
    -- CP-element group 787 join  transition  bypass 
    -- predecessors 784 786 
    -- successors 792 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_15_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1513/$exit
      -- 	branch_block_stmt_1166/bb_15_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1513/SplitProtocol/$exit
      -- 
    cp_element_group_787: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_787"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(784) & cp_elements(786);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(787), clk => clk, reset => reset); --
    end block;
    -- CP-element group 788 fork  transition  bypass 
    -- predecessors 233 
    -- successors 789 790 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_15_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1515/$entry
      -- 	branch_block_stmt_1166/bb_15_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1515/SplitProtocol/$entry
      -- 
    cp_elements(788) <= cp_elements(233);
    -- CP-element group 789 transition  bypass 
    -- predecessors 788 
    -- successors 791 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_15_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1515/SplitProtocol/Sample/$entry
      -- 	branch_block_stmt_1166/bb_15_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1515/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/bb_15_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1515/SplitProtocol/Sample/rr
      -- 	branch_block_stmt_1166/bb_15_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1515/SplitProtocol/Sample/ra
      -- 
    cp_elements(789) <= cp_elements(788);
    -- CP-element group 790 transition  bypass 
    -- predecessors 788 
    -- successors 791 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_15_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1515/SplitProtocol/Update/$entry
      -- 	branch_block_stmt_1166/bb_15_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1515/SplitProtocol/Update/$exit
      -- 	branch_block_stmt_1166/bb_15_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1515/SplitProtocol/Update/cr
      -- 	branch_block_stmt_1166/bb_15_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1515/SplitProtocol/Update/ca
      -- 
    cp_elements(790) <= cp_elements(788);
    -- CP-element group 791 join  transition  bypass 
    -- predecessors 789 790 
    -- successors 792 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_15_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1515/$exit
      -- 	branch_block_stmt_1166/bb_15_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1515/SplitProtocol/$exit
      -- 
    cp_element_group_791: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_791"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(789) & cp_elements(790);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(791), clk => clk, reset => reset); --
    end block;
    -- CP-element group 792 join  transition  output  bypass 
    -- predecessors 781 787 791 
    -- successors 808 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_15_bb_17_PhiReq/$exit
      -- 	branch_block_stmt_1166/bb_15_bb_17_PhiReq/phi_stmt_1508/$exit
      -- 	branch_block_stmt_1166/bb_15_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/$exit
      -- 	branch_block_stmt_1166/bb_15_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_req
      -- 
    cp_element_group_792: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 0,2 => 0);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_792"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= cp_elements(781) & cp_elements(787) & cp_elements(791);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(792), clk => clk, reset => reset); --
    end block;
    phi_stmt_1508_req_7907_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(792), ack => phi_stmt_1508_req_1); -- 
    -- CP-element group 793 fork  transition  bypass 
    -- predecessors 244 
    -- successors 794 795 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_16_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1511/$entry
      -- 	branch_block_stmt_1166/bb_16_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1511/SplitProtocol/$entry
      -- 
    cp_elements(793) <= cp_elements(244);
    -- CP-element group 794 transition  bypass 
    -- predecessors 793 
    -- successors 796 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_16_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1511/SplitProtocol/Sample/$entry
      -- 	branch_block_stmt_1166/bb_16_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1511/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/bb_16_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1511/SplitProtocol/Sample/rr
      -- 	branch_block_stmt_1166/bb_16_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1511/SplitProtocol/Sample/ra
      -- 
    cp_elements(794) <= cp_elements(793);
    -- CP-element group 795 transition  bypass 
    -- predecessors 793 
    -- successors 796 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_16_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1511/SplitProtocol/Update/$entry
      -- 	branch_block_stmt_1166/bb_16_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1511/SplitProtocol/Update/$exit
      -- 	branch_block_stmt_1166/bb_16_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1511/SplitProtocol/Update/cr
      -- 	branch_block_stmt_1166/bb_16_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1511/SplitProtocol/Update/ca
      -- 
    cp_elements(795) <= cp_elements(793);
    -- CP-element group 796 join  transition  bypass 
    -- predecessors 794 795 
    -- successors 807 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_16_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1511/$exit
      -- 	branch_block_stmt_1166/bb_16_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1511/SplitProtocol/$exit
      -- 
    cp_element_group_796: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_796"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(794) & cp_elements(795);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(796), clk => clk, reset => reset); --
    end block;
    -- CP-element group 797 fork  transition  bypass 
    -- predecessors 244 
    -- successors 798 799 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_16_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1513/$entry
      -- 	branch_block_stmt_1166/bb_16_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1513/SplitProtocol/$entry
      -- 
    cp_elements(797) <= cp_elements(244);
    -- CP-element group 798 transition  bypass 
    -- predecessors 797 
    -- successors 800 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_16_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1513/SplitProtocol/Sample/$entry
      -- 	branch_block_stmt_1166/bb_16_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1513/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/bb_16_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1513/SplitProtocol/Sample/rr
      -- 	branch_block_stmt_1166/bb_16_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1513/SplitProtocol/Sample/ra
      -- 
    cp_elements(798) <= cp_elements(797);
    -- CP-element group 799 transition  bypass 
    -- predecessors 797 
    -- successors 800 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_16_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1513/SplitProtocol/Update/$entry
      -- 	branch_block_stmt_1166/bb_16_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1513/SplitProtocol/Update/$exit
      -- 	branch_block_stmt_1166/bb_16_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1513/SplitProtocol/Update/cr
      -- 	branch_block_stmt_1166/bb_16_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1513/SplitProtocol/Update/ca
      -- 
    cp_elements(799) <= cp_elements(797);
    -- CP-element group 800 join  transition  bypass 
    -- predecessors 798 799 
    -- successors 807 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_16_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1513/$exit
      -- 	branch_block_stmt_1166/bb_16_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1513/SplitProtocol/$exit
      -- 
    cp_element_group_800: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_800"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(798) & cp_elements(799);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(800), clk => clk, reset => reset); --
    end block;
    -- CP-element group 801 fork  transition  bypass 
    -- predecessors 244 
    -- successors 802 804 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_16_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1515/$entry
      -- 	branch_block_stmt_1166/bb_16_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1515/SplitProtocol/$entry
      -- 
    cp_elements(801) <= cp_elements(244);
    -- CP-element group 802 transition  output  bypass 
    -- predecessors 801 
    -- successors 803 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_16_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1515/SplitProtocol/Sample/$entry
      -- 	branch_block_stmt_1166/bb_16_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1515/SplitProtocol/Sample/rr
      -- 
    cp_elements(802) <= cp_elements(801);
    rr_7958_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(802), ack => type_cast_1515_inst_req_0); -- 
    -- CP-element group 803 transition  input  bypass 
    -- predecessors 802 
    -- successors 806 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_16_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1515/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/bb_16_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1515/SplitProtocol/Sample/ra
      -- 
    ra_7959_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1515_inst_ack_0, ack => cp_elements(803)); -- 
    -- CP-element group 804 transition  output  bypass 
    -- predecessors 801 
    -- successors 805 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_16_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1515/SplitProtocol/Update/$entry
      -- 	branch_block_stmt_1166/bb_16_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1515/SplitProtocol/Update/cr
      -- 
    cp_elements(804) <= cp_elements(801);
    cr_7963_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(804), ack => type_cast_1515_inst_req_1); -- 
    -- CP-element group 805 transition  input  bypass 
    -- predecessors 804 
    -- successors 806 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_16_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1515/SplitProtocol/Update/$exit
      -- 	branch_block_stmt_1166/bb_16_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1515/SplitProtocol/Update/ca
      -- 
    ca_7964_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1515_inst_ack_1, ack => cp_elements(805)); -- 
    -- CP-element group 806 join  transition  bypass 
    -- predecessors 803 805 
    -- successors 807 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_16_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1515/$exit
      -- 	branch_block_stmt_1166/bb_16_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/type_cast_1515/SplitProtocol/$exit
      -- 
    cp_element_group_806: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_806"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(803) & cp_elements(805);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(806), clk => clk, reset => reset); --
    end block;
    -- CP-element group 807 join  transition  output  bypass 
    -- predecessors 796 800 806 
    -- successors 808 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_16_bb_17_PhiReq/$exit
      -- 	branch_block_stmt_1166/bb_16_bb_17_PhiReq/phi_stmt_1508/$exit
      -- 	branch_block_stmt_1166/bb_16_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_sources/$exit
      -- 	branch_block_stmt_1166/bb_16_bb_17_PhiReq/phi_stmt_1508/phi_stmt_1508_req
      -- 
    cp_element_group_807: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 0,2 => 0);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_807"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= cp_elements(796) & cp_elements(800) & cp_elements(806);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(807), clk => clk, reset => reset); --
    end block;
    phi_stmt_1508_req_7965_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(807), ack => phi_stmt_1508_req_2); -- 
    -- CP-element group 808 merge  place  bypass 
    -- predecessors 762 777 792 807 
    -- successors 809 
    -- members (1) 
      -- 	branch_block_stmt_1166/merge_stmt_1507_PhiReqMerge
      -- 
    cp_elements(808) <= OrReduce(cp_elements(762) & cp_elements(777) & cp_elements(792) & cp_elements(807));
    -- CP-element group 809 transition  bypass 
    -- predecessors 808 
    -- successors 810 
    -- members (1) 
      -- 	branch_block_stmt_1166/merge_stmt_1507_PhiAck/$entry
      -- 
    cp_elements(809) <= cp_elements(808);
    -- CP-element group 810 transition  place  input  bypass 
    -- predecessors 809 
    -- successors 245 
    -- members (4) 
      -- 	branch_block_stmt_1166/merge_stmt_1507__exit__
      -- 	branch_block_stmt_1166/assign_stmt_1524_to_assign_stmt_1567__entry__
      -- 	branch_block_stmt_1166/merge_stmt_1507_PhiAck/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1507_PhiAck/phi_stmt_1508_ack
      -- 
    phi_stmt_1508_ack_7970_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => phi_stmt_1508_ack_0, ack => cp_elements(810)); -- 
    -- CP-element group 811 transition  bypass 
    -- predecessors 285 
    -- successors 813 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_17_bb_19_PhiReq/phi_stmt_1606/phi_stmt_1606_sources/type_cast_1609/SplitProtocol/Sample/$entry
      -- 	branch_block_stmt_1166/bb_17_bb_19_PhiReq/phi_stmt_1606/phi_stmt_1606_sources/type_cast_1609/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/bb_17_bb_19_PhiReq/phi_stmt_1606/phi_stmt_1606_sources/type_cast_1609/SplitProtocol/Sample/rr
      -- 	branch_block_stmt_1166/bb_17_bb_19_PhiReq/phi_stmt_1606/phi_stmt_1606_sources/type_cast_1609/SplitProtocol/Sample/ra
      -- 
    cp_elements(811) <= cp_elements(285);
    -- CP-element group 812 transition  bypass 
    -- predecessors 285 
    -- successors 813 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_17_bb_19_PhiReq/phi_stmt_1606/phi_stmt_1606_sources/type_cast_1609/SplitProtocol/Update/$entry
      -- 	branch_block_stmt_1166/bb_17_bb_19_PhiReq/phi_stmt_1606/phi_stmt_1606_sources/type_cast_1609/SplitProtocol/Update/$exit
      -- 	branch_block_stmt_1166/bb_17_bb_19_PhiReq/phi_stmt_1606/phi_stmt_1606_sources/type_cast_1609/SplitProtocol/Update/cr
      -- 	branch_block_stmt_1166/bb_17_bb_19_PhiReq/phi_stmt_1606/phi_stmt_1606_sources/type_cast_1609/SplitProtocol/Update/ca
      -- 
    cp_elements(812) <= cp_elements(285);
    -- CP-element group 813 join  transition  output  bypass 
    -- predecessors 811 812 
    -- successors 819 
    -- members (6) 
      -- 	branch_block_stmt_1166/bb_17_bb_19_PhiReq/$exit
      -- 	branch_block_stmt_1166/bb_17_bb_19_PhiReq/phi_stmt_1606/$exit
      -- 	branch_block_stmt_1166/bb_17_bb_19_PhiReq/phi_stmt_1606/phi_stmt_1606_sources/$exit
      -- 	branch_block_stmt_1166/bb_17_bb_19_PhiReq/phi_stmt_1606/phi_stmt_1606_sources/type_cast_1609/$exit
      -- 	branch_block_stmt_1166/bb_17_bb_19_PhiReq/phi_stmt_1606/phi_stmt_1606_sources/type_cast_1609/SplitProtocol/$exit
      -- 	branch_block_stmt_1166/bb_17_bb_19_PhiReq/phi_stmt_1606/phi_stmt_1606_req
      -- 
    cp_element_group_813: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_813"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(811) & cp_elements(812);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(813), clk => clk, reset => reset); --
    end block;
    phi_stmt_1606_req_8008_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(813), ack => phi_stmt_1606_req_1); -- 
    -- CP-element group 814 transition  output  bypass 
    -- predecessors 306 
    -- successors 815 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_18_bb_19_PhiReq/phi_stmt_1606/phi_stmt_1606_sources/type_cast_1609/SplitProtocol/Sample/$entry
      -- 	branch_block_stmt_1166/bb_18_bb_19_PhiReq/phi_stmt_1606/phi_stmt_1606_sources/type_cast_1609/SplitProtocol/Sample/rr
      -- 
    cp_elements(814) <= cp_elements(306);
    rr_8027_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(814), ack => type_cast_1609_inst_req_0); -- 
    -- CP-element group 815 transition  input  bypass 
    -- predecessors 814 
    -- successors 818 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_18_bb_19_PhiReq/phi_stmt_1606/phi_stmt_1606_sources/type_cast_1609/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/bb_18_bb_19_PhiReq/phi_stmt_1606/phi_stmt_1606_sources/type_cast_1609/SplitProtocol/Sample/ra
      -- 
    ra_8028_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1609_inst_ack_0, ack => cp_elements(815)); -- 
    -- CP-element group 816 transition  output  bypass 
    -- predecessors 306 
    -- successors 817 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_18_bb_19_PhiReq/phi_stmt_1606/phi_stmt_1606_sources/type_cast_1609/SplitProtocol/Update/$entry
      -- 	branch_block_stmt_1166/bb_18_bb_19_PhiReq/phi_stmt_1606/phi_stmt_1606_sources/type_cast_1609/SplitProtocol/Update/cr
      -- 
    cp_elements(816) <= cp_elements(306);
    cr_8032_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(816), ack => type_cast_1609_inst_req_1); -- 
    -- CP-element group 817 transition  input  bypass 
    -- predecessors 816 
    -- successors 818 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_18_bb_19_PhiReq/phi_stmt_1606/phi_stmt_1606_sources/type_cast_1609/SplitProtocol/Update/$exit
      -- 	branch_block_stmt_1166/bb_18_bb_19_PhiReq/phi_stmt_1606/phi_stmt_1606_sources/type_cast_1609/SplitProtocol/Update/ca
      -- 
    ca_8033_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1609_inst_ack_1, ack => cp_elements(817)); -- 
    -- CP-element group 818 join  transition  output  bypass 
    -- predecessors 815 817 
    -- successors 819 
    -- members (6) 
      -- 	branch_block_stmt_1166/bb_18_bb_19_PhiReq/$exit
      -- 	branch_block_stmt_1166/bb_18_bb_19_PhiReq/phi_stmt_1606/$exit
      -- 	branch_block_stmt_1166/bb_18_bb_19_PhiReq/phi_stmt_1606/phi_stmt_1606_sources/$exit
      -- 	branch_block_stmt_1166/bb_18_bb_19_PhiReq/phi_stmt_1606/phi_stmt_1606_sources/type_cast_1609/$exit
      -- 	branch_block_stmt_1166/bb_18_bb_19_PhiReq/phi_stmt_1606/phi_stmt_1606_sources/type_cast_1609/SplitProtocol/$exit
      -- 	branch_block_stmt_1166/bb_18_bb_19_PhiReq/phi_stmt_1606/phi_stmt_1606_req
      -- 
    cp_element_group_818: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_818"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(815) & cp_elements(817);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(818), clk => clk, reset => reset); --
    end block;
    phi_stmt_1606_req_8034_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(818), ack => phi_stmt_1606_req_0); -- 
    -- CP-element group 819 merge  place  bypass 
    -- predecessors 813 818 
    -- successors 820 
    -- members (1) 
      -- 	branch_block_stmt_1166/merge_stmt_1605_PhiReqMerge
      -- 
    cp_elements(819) <= OrReduce(cp_elements(813) & cp_elements(818));
    -- CP-element group 820 transition  bypass 
    -- predecessors 819 
    -- successors 821 
    -- members (1) 
      -- 	branch_block_stmt_1166/merge_stmt_1605_PhiAck/$entry
      -- 
    cp_elements(820) <= cp_elements(819);
    -- CP-element group 821 transition  place  input  bypass 
    -- predecessors 820 
    -- successors 307 
    -- members (4) 
      -- 	branch_block_stmt_1166/merge_stmt_1605__exit__
      -- 	branch_block_stmt_1166/assign_stmt_1619_to_assign_stmt_1700__entry__
      -- 	branch_block_stmt_1166/merge_stmt_1605_PhiAck/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1605_PhiAck/phi_stmt_1606_ack
      -- 
    phi_stmt_1606_ack_8039_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => phi_stmt_1606_ack_0, ack => cp_elements(821)); -- 
    -- CP-element group 822 transition  bypass 
    -- predecessors 381 
    -- successors 824 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_19_iq_err_calcx_xexit_PhiReq/phi_stmt_1756/phi_stmt_1756_sources/type_cast_1759/SplitProtocol/Sample/$entry
      -- 	branch_block_stmt_1166/bb_19_iq_err_calcx_xexit_PhiReq/phi_stmt_1756/phi_stmt_1756_sources/type_cast_1759/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/bb_19_iq_err_calcx_xexit_PhiReq/phi_stmt_1756/phi_stmt_1756_sources/type_cast_1759/SplitProtocol/Sample/rr
      -- 	branch_block_stmt_1166/bb_19_iq_err_calcx_xexit_PhiReq/phi_stmt_1756/phi_stmt_1756_sources/type_cast_1759/SplitProtocol/Sample/ra
      -- 
    cp_elements(822) <= cp_elements(381);
    -- CP-element group 823 transition  bypass 
    -- predecessors 381 
    -- successors 824 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_19_iq_err_calcx_xexit_PhiReq/phi_stmt_1756/phi_stmt_1756_sources/type_cast_1759/SplitProtocol/Update/$entry
      -- 	branch_block_stmt_1166/bb_19_iq_err_calcx_xexit_PhiReq/phi_stmt_1756/phi_stmt_1756_sources/type_cast_1759/SplitProtocol/Update/$exit
      -- 	branch_block_stmt_1166/bb_19_iq_err_calcx_xexit_PhiReq/phi_stmt_1756/phi_stmt_1756_sources/type_cast_1759/SplitProtocol/Update/cr
      -- 	branch_block_stmt_1166/bb_19_iq_err_calcx_xexit_PhiReq/phi_stmt_1756/phi_stmt_1756_sources/type_cast_1759/SplitProtocol/Update/ca
      -- 
    cp_elements(823) <= cp_elements(381);
    -- CP-element group 824 join  transition  output  bypass 
    -- predecessors 822 823 
    -- successors 830 
    -- members (6) 
      -- 	branch_block_stmt_1166/bb_19_iq_err_calcx_xexit_PhiReq/$exit
      -- 	branch_block_stmt_1166/bb_19_iq_err_calcx_xexit_PhiReq/phi_stmt_1756/$exit
      -- 	branch_block_stmt_1166/bb_19_iq_err_calcx_xexit_PhiReq/phi_stmt_1756/phi_stmt_1756_sources/$exit
      -- 	branch_block_stmt_1166/bb_19_iq_err_calcx_xexit_PhiReq/phi_stmt_1756/phi_stmt_1756_sources/type_cast_1759/$exit
      -- 	branch_block_stmt_1166/bb_19_iq_err_calcx_xexit_PhiReq/phi_stmt_1756/phi_stmt_1756_sources/type_cast_1759/SplitProtocol/$exit
      -- 	branch_block_stmt_1166/bb_19_iq_err_calcx_xexit_PhiReq/phi_stmt_1756/phi_stmt_1756_req
      -- 
    cp_element_group_824: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_824"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(822) & cp_elements(823);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(824), clk => clk, reset => reset); --
    end block;
    phi_stmt_1756_req_8077_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(824), ack => phi_stmt_1756_req_1); -- 
    -- CP-element group 825 transition  output  bypass 
    -- predecessors 420 
    -- successors 826 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_20_iq_err_calcx_xexit_PhiReq/phi_stmt_1756/phi_stmt_1756_sources/type_cast_1759/SplitProtocol/Sample/$entry
      -- 	branch_block_stmt_1166/bb_20_iq_err_calcx_xexit_PhiReq/phi_stmt_1756/phi_stmt_1756_sources/type_cast_1759/SplitProtocol/Sample/rr
      -- 
    cp_elements(825) <= cp_elements(420);
    rr_8096_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(825), ack => type_cast_1759_inst_req_0); -- 
    -- CP-element group 826 transition  input  bypass 
    -- predecessors 825 
    -- successors 829 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_20_iq_err_calcx_xexit_PhiReq/phi_stmt_1756/phi_stmt_1756_sources/type_cast_1759/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/bb_20_iq_err_calcx_xexit_PhiReq/phi_stmt_1756/phi_stmt_1756_sources/type_cast_1759/SplitProtocol/Sample/ra
      -- 
    ra_8097_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1759_inst_ack_0, ack => cp_elements(826)); -- 
    -- CP-element group 827 transition  output  bypass 
    -- predecessors 420 
    -- successors 828 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_20_iq_err_calcx_xexit_PhiReq/phi_stmt_1756/phi_stmt_1756_sources/type_cast_1759/SplitProtocol/Update/$entry
      -- 	branch_block_stmt_1166/bb_20_iq_err_calcx_xexit_PhiReq/phi_stmt_1756/phi_stmt_1756_sources/type_cast_1759/SplitProtocol/Update/cr
      -- 
    cp_elements(827) <= cp_elements(420);
    cr_8101_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(827), ack => type_cast_1759_inst_req_1); -- 
    -- CP-element group 828 transition  input  bypass 
    -- predecessors 827 
    -- successors 829 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_20_iq_err_calcx_xexit_PhiReq/phi_stmt_1756/phi_stmt_1756_sources/type_cast_1759/SplitProtocol/Update/$exit
      -- 	branch_block_stmt_1166/bb_20_iq_err_calcx_xexit_PhiReq/phi_stmt_1756/phi_stmt_1756_sources/type_cast_1759/SplitProtocol/Update/ca
      -- 
    ca_8102_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1759_inst_ack_1, ack => cp_elements(828)); -- 
    -- CP-element group 829 join  transition  output  bypass 
    -- predecessors 826 828 
    -- successors 830 
    -- members (6) 
      -- 	branch_block_stmt_1166/bb_20_iq_err_calcx_xexit_PhiReq/$exit
      -- 	branch_block_stmt_1166/bb_20_iq_err_calcx_xexit_PhiReq/phi_stmt_1756/$exit
      -- 	branch_block_stmt_1166/bb_20_iq_err_calcx_xexit_PhiReq/phi_stmt_1756/phi_stmt_1756_sources/$exit
      -- 	branch_block_stmt_1166/bb_20_iq_err_calcx_xexit_PhiReq/phi_stmt_1756/phi_stmt_1756_sources/type_cast_1759/$exit
      -- 	branch_block_stmt_1166/bb_20_iq_err_calcx_xexit_PhiReq/phi_stmt_1756/phi_stmt_1756_sources/type_cast_1759/SplitProtocol/$exit
      -- 	branch_block_stmt_1166/bb_20_iq_err_calcx_xexit_PhiReq/phi_stmt_1756/phi_stmt_1756_req
      -- 
    cp_element_group_829: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_829"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(826) & cp_elements(828);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(829), clk => clk, reset => reset); --
    end block;
    phi_stmt_1756_req_8103_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(829), ack => phi_stmt_1756_req_0); -- 
    -- CP-element group 830 merge  place  bypass 
    -- predecessors 824 829 
    -- successors 831 
    -- members (1) 
      -- 	branch_block_stmt_1166/merge_stmt_1755_PhiReqMerge
      -- 
    cp_elements(830) <= OrReduce(cp_elements(824) & cp_elements(829));
    -- CP-element group 831 transition  bypass 
    -- predecessors 830 
    -- successors 832 
    -- members (1) 
      -- 	branch_block_stmt_1166/merge_stmt_1755_PhiAck/$entry
      -- 
    cp_elements(831) <= cp_elements(830);
    -- CP-element group 832 transition  place  input  bypass 
    -- predecessors 831 
    -- successors 421 
    -- members (4) 
      -- 	branch_block_stmt_1166/merge_stmt_1755__exit__
      -- 	branch_block_stmt_1166/assign_stmt_1768_to_assign_stmt_1815__entry__
      -- 	branch_block_stmt_1166/merge_stmt_1755_PhiAck/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1755_PhiAck/phi_stmt_1756_ack
      -- 
    phi_stmt_1756_ack_8108_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => phi_stmt_1756_ack_0, ack => cp_elements(832)); -- 
    -- CP-element group 833 transition  bypass 
    -- predecessors 479 
    -- successors 835 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_22_bb_24_PhiReq/phi_stmt_1838/phi_stmt_1838_sources/type_cast_1841/SplitProtocol/Sample/$entry
      -- 	branch_block_stmt_1166/bb_22_bb_24_PhiReq/phi_stmt_1838/phi_stmt_1838_sources/type_cast_1841/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/bb_22_bb_24_PhiReq/phi_stmt_1838/phi_stmt_1838_sources/type_cast_1841/SplitProtocol/Sample/rr
      -- 	branch_block_stmt_1166/bb_22_bb_24_PhiReq/phi_stmt_1838/phi_stmt_1838_sources/type_cast_1841/SplitProtocol/Sample/ra
      -- 
    cp_elements(833) <= cp_elements(479);
    -- CP-element group 834 transition  bypass 
    -- predecessors 479 
    -- successors 835 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_22_bb_24_PhiReq/phi_stmt_1838/phi_stmt_1838_sources/type_cast_1841/SplitProtocol/Update/$entry
      -- 	branch_block_stmt_1166/bb_22_bb_24_PhiReq/phi_stmt_1838/phi_stmt_1838_sources/type_cast_1841/SplitProtocol/Update/$exit
      -- 	branch_block_stmt_1166/bb_22_bb_24_PhiReq/phi_stmt_1838/phi_stmt_1838_sources/type_cast_1841/SplitProtocol/Update/cr
      -- 	branch_block_stmt_1166/bb_22_bb_24_PhiReq/phi_stmt_1838/phi_stmt_1838_sources/type_cast_1841/SplitProtocol/Update/ca
      -- 
    cp_elements(834) <= cp_elements(479);
    -- CP-element group 835 join  transition  output  bypass 
    -- predecessors 833 834 
    -- successors 844 
    -- members (6) 
      -- 	branch_block_stmt_1166/bb_22_bb_24_PhiReq/$exit
      -- 	branch_block_stmt_1166/bb_22_bb_24_PhiReq/phi_stmt_1838/$exit
      -- 	branch_block_stmt_1166/bb_22_bb_24_PhiReq/phi_stmt_1838/phi_stmt_1838_sources/$exit
      -- 	branch_block_stmt_1166/bb_22_bb_24_PhiReq/phi_stmt_1838/phi_stmt_1838_sources/type_cast_1841/$exit
      -- 	branch_block_stmt_1166/bb_22_bb_24_PhiReq/phi_stmt_1838/phi_stmt_1838_sources/type_cast_1841/SplitProtocol/$exit
      -- 	branch_block_stmt_1166/bb_22_bb_24_PhiReq/phi_stmt_1838/phi_stmt_1838_req
      -- 
    cp_element_group_835: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_835"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(833) & cp_elements(834);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(835), clk => clk, reset => reset); --
    end block;
    phi_stmt_1838_req_8158_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(835), ack => phi_stmt_1838_req_2); -- 
    -- CP-element group 836 transition  output  bypass 
    -- predecessors 18 
    -- successors 837 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_23_bb_24_PhiReq/phi_stmt_1838/phi_stmt_1838_sources/type_cast_1841/SplitProtocol/Sample/$entry
      -- 	branch_block_stmt_1166/bb_23_bb_24_PhiReq/phi_stmt_1838/phi_stmt_1838_sources/type_cast_1841/SplitProtocol/Sample/rr
      -- 
    cp_elements(836) <= cp_elements(18);
    rr_8177_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(836), ack => type_cast_1841_inst_req_0); -- 
    -- CP-element group 837 transition  input  bypass 
    -- predecessors 836 
    -- successors 840 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_23_bb_24_PhiReq/phi_stmt_1838/phi_stmt_1838_sources/type_cast_1841/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/bb_23_bb_24_PhiReq/phi_stmt_1838/phi_stmt_1838_sources/type_cast_1841/SplitProtocol/Sample/ra
      -- 
    ra_8178_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1841_inst_ack_0, ack => cp_elements(837)); -- 
    -- CP-element group 838 transition  output  bypass 
    -- predecessors 18 
    -- successors 839 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_23_bb_24_PhiReq/phi_stmt_1838/phi_stmt_1838_sources/type_cast_1841/SplitProtocol/Update/$entry
      -- 	branch_block_stmt_1166/bb_23_bb_24_PhiReq/phi_stmt_1838/phi_stmt_1838_sources/type_cast_1841/SplitProtocol/Update/cr
      -- 
    cp_elements(838) <= cp_elements(18);
    cr_8182_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(838), ack => type_cast_1841_inst_req_1); -- 
    -- CP-element group 839 transition  input  bypass 
    -- predecessors 838 
    -- successors 840 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_23_bb_24_PhiReq/phi_stmt_1838/phi_stmt_1838_sources/type_cast_1841/SplitProtocol/Update/$exit
      -- 	branch_block_stmt_1166/bb_23_bb_24_PhiReq/phi_stmt_1838/phi_stmt_1838_sources/type_cast_1841/SplitProtocol/Update/ca
      -- 
    ca_8183_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1841_inst_ack_1, ack => cp_elements(839)); -- 
    -- CP-element group 840 join  transition  output  bypass 
    -- predecessors 837 839 
    -- successors 844 
    -- members (6) 
      -- 	branch_block_stmt_1166/bb_23_bb_24_PhiReq/$exit
      -- 	branch_block_stmt_1166/bb_23_bb_24_PhiReq/phi_stmt_1838/$exit
      -- 	branch_block_stmt_1166/bb_23_bb_24_PhiReq/phi_stmt_1838/phi_stmt_1838_sources/$exit
      -- 	branch_block_stmt_1166/bb_23_bb_24_PhiReq/phi_stmt_1838/phi_stmt_1838_sources/type_cast_1841/$exit
      -- 	branch_block_stmt_1166/bb_23_bb_24_PhiReq/phi_stmt_1838/phi_stmt_1838_sources/type_cast_1841/SplitProtocol/$exit
      -- 	branch_block_stmt_1166/bb_23_bb_24_PhiReq/phi_stmt_1838/phi_stmt_1838_req
      -- 
    cp_element_group_840: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_840"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(837) & cp_elements(839);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(840), clk => clk, reset => reset); --
    end block;
    phi_stmt_1838_req_8184_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(840), ack => phi_stmt_1838_req_0); -- 
    -- CP-element group 841 transition  bypass 
    -- predecessors 467 
    -- successors 843 
    -- members (4) 
      -- 	branch_block_stmt_1166/iq_err_calcx_xexit_bb_24_PhiReq/phi_stmt_1838/phi_stmt_1838_sources/type_cast_1841/SplitProtocol/Sample/$entry
      -- 	branch_block_stmt_1166/iq_err_calcx_xexit_bb_24_PhiReq/phi_stmt_1838/phi_stmt_1838_sources/type_cast_1841/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/iq_err_calcx_xexit_bb_24_PhiReq/phi_stmt_1838/phi_stmt_1838_sources/type_cast_1841/SplitProtocol/Sample/rr
      -- 	branch_block_stmt_1166/iq_err_calcx_xexit_bb_24_PhiReq/phi_stmt_1838/phi_stmt_1838_sources/type_cast_1841/SplitProtocol/Sample/ra
      -- 
    cp_elements(841) <= cp_elements(467);
    -- CP-element group 842 transition  bypass 
    -- predecessors 467 
    -- successors 843 
    -- members (4) 
      -- 	branch_block_stmt_1166/iq_err_calcx_xexit_bb_24_PhiReq/phi_stmt_1838/phi_stmt_1838_sources/type_cast_1841/SplitProtocol/Update/$entry
      -- 	branch_block_stmt_1166/iq_err_calcx_xexit_bb_24_PhiReq/phi_stmt_1838/phi_stmt_1838_sources/type_cast_1841/SplitProtocol/Update/$exit
      -- 	branch_block_stmt_1166/iq_err_calcx_xexit_bb_24_PhiReq/phi_stmt_1838/phi_stmt_1838_sources/type_cast_1841/SplitProtocol/Update/cr
      -- 	branch_block_stmt_1166/iq_err_calcx_xexit_bb_24_PhiReq/phi_stmt_1838/phi_stmt_1838_sources/type_cast_1841/SplitProtocol/Update/ca
      -- 
    cp_elements(842) <= cp_elements(467);
    -- CP-element group 843 join  transition  output  bypass 
    -- predecessors 841 842 
    -- successors 844 
    -- members (6) 
      -- 	branch_block_stmt_1166/iq_err_calcx_xexit_bb_24_PhiReq/$exit
      -- 	branch_block_stmt_1166/iq_err_calcx_xexit_bb_24_PhiReq/phi_stmt_1838/$exit
      -- 	branch_block_stmt_1166/iq_err_calcx_xexit_bb_24_PhiReq/phi_stmt_1838/phi_stmt_1838_sources/$exit
      -- 	branch_block_stmt_1166/iq_err_calcx_xexit_bb_24_PhiReq/phi_stmt_1838/phi_stmt_1838_sources/type_cast_1841/$exit
      -- 	branch_block_stmt_1166/iq_err_calcx_xexit_bb_24_PhiReq/phi_stmt_1838/phi_stmt_1838_sources/type_cast_1841/SplitProtocol/$exit
      -- 	branch_block_stmt_1166/iq_err_calcx_xexit_bb_24_PhiReq/phi_stmt_1838/phi_stmt_1838_req
      -- 
    cp_element_group_843: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_843"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(841) & cp_elements(842);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(843), clk => clk, reset => reset); --
    end block;
    phi_stmt_1838_req_8210_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(843), ack => phi_stmt_1838_req_1); -- 
    -- CP-element group 844 merge  place  bypass 
    -- predecessors 835 840 843 
    -- successors 845 
    -- members (1) 
      -- 	branch_block_stmt_1166/merge_stmt_1837_PhiReqMerge
      -- 
    cp_elements(844) <= OrReduce(cp_elements(835) & cp_elements(840) & cp_elements(843));
    -- CP-element group 845 transition  bypass 
    -- predecessors 844 
    -- successors 846 
    -- members (1) 
      -- 	branch_block_stmt_1166/merge_stmt_1837_PhiAck/$entry
      -- 
    cp_elements(845) <= cp_elements(844);
    -- CP-element group 846 transition  place  input  bypass 
    -- predecessors 845 
    -- successors 482 
    -- members (4) 
      -- 	branch_block_stmt_1166/merge_stmt_1837__exit__
      -- 	branch_block_stmt_1166/assign_stmt_1854_to_assign_stmt_1865__entry__
      -- 	branch_block_stmt_1166/merge_stmt_1837_PhiAck/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1837_PhiAck/phi_stmt_1838_ack
      -- 
    phi_stmt_1838_ack_8215_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => phi_stmt_1838_ack_0, ack => cp_elements(846)); -- 
    -- CP-element group 847 transition  bypass 
    -- predecessors 499 
    -- successors 849 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_24_xx_xthread12_PhiReq/phi_stmt_1913/phi_stmt_1913_sources/type_cast_1916/SplitProtocol/Sample/$entry
      -- 	branch_block_stmt_1166/bb_24_xx_xthread12_PhiReq/phi_stmt_1913/phi_stmt_1913_sources/type_cast_1916/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/bb_24_xx_xthread12_PhiReq/phi_stmt_1913/phi_stmt_1913_sources/type_cast_1916/SplitProtocol/Sample/rr
      -- 	branch_block_stmt_1166/bb_24_xx_xthread12_PhiReq/phi_stmt_1913/phi_stmt_1913_sources/type_cast_1916/SplitProtocol/Sample/ra
      -- 
    cp_elements(847) <= cp_elements(499);
    -- CP-element group 848 transition  bypass 
    -- predecessors 499 
    -- successors 849 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_24_xx_xthread12_PhiReq/phi_stmt_1913/phi_stmt_1913_sources/type_cast_1916/SplitProtocol/Update/$entry
      -- 	branch_block_stmt_1166/bb_24_xx_xthread12_PhiReq/phi_stmt_1913/phi_stmt_1913_sources/type_cast_1916/SplitProtocol/Update/$exit
      -- 	branch_block_stmt_1166/bb_24_xx_xthread12_PhiReq/phi_stmt_1913/phi_stmt_1913_sources/type_cast_1916/SplitProtocol/Update/cr
      -- 	branch_block_stmt_1166/bb_24_xx_xthread12_PhiReq/phi_stmt_1913/phi_stmt_1913_sources/type_cast_1916/SplitProtocol/Update/ca
      -- 
    cp_elements(848) <= cp_elements(499);
    -- CP-element group 849 join  transition  output  bypass 
    -- predecessors 847 848 
    -- successors 858 
    -- members (6) 
      -- 	branch_block_stmt_1166/bb_24_xx_xthread12_PhiReq/$exit
      -- 	branch_block_stmt_1166/bb_24_xx_xthread12_PhiReq/phi_stmt_1913/$exit
      -- 	branch_block_stmt_1166/bb_24_xx_xthread12_PhiReq/phi_stmt_1913/phi_stmt_1913_sources/$exit
      -- 	branch_block_stmt_1166/bb_24_xx_xthread12_PhiReq/phi_stmt_1913/phi_stmt_1913_sources/type_cast_1916/$exit
      -- 	branch_block_stmt_1166/bb_24_xx_xthread12_PhiReq/phi_stmt_1913/phi_stmt_1913_sources/type_cast_1916/SplitProtocol/$exit
      -- 	branch_block_stmt_1166/bb_24_xx_xthread12_PhiReq/phi_stmt_1913/phi_stmt_1913_req
      -- 
    cp_element_group_849: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_849"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(847) & cp_elements(848);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(849), clk => clk, reset => reset); --
    end block;
    phi_stmt_1913_req_8269_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(849), ack => phi_stmt_1913_req_1); -- 
    -- CP-element group 850 transition  bypass 
    -- predecessors 511 
    -- successors 852 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_25_xx_xthread12_PhiReq/phi_stmt_1913/phi_stmt_1913_sources/type_cast_1916/SplitProtocol/Sample/$entry
      -- 	branch_block_stmt_1166/bb_25_xx_xthread12_PhiReq/phi_stmt_1913/phi_stmt_1913_sources/type_cast_1916/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/bb_25_xx_xthread12_PhiReq/phi_stmt_1913/phi_stmt_1913_sources/type_cast_1916/SplitProtocol/Sample/rr
      -- 	branch_block_stmt_1166/bb_25_xx_xthread12_PhiReq/phi_stmt_1913/phi_stmt_1913_sources/type_cast_1916/SplitProtocol/Sample/ra
      -- 
    cp_elements(850) <= cp_elements(511);
    -- CP-element group 851 transition  bypass 
    -- predecessors 511 
    -- successors 852 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_25_xx_xthread12_PhiReq/phi_stmt_1913/phi_stmt_1913_sources/type_cast_1916/SplitProtocol/Update/$entry
      -- 	branch_block_stmt_1166/bb_25_xx_xthread12_PhiReq/phi_stmt_1913/phi_stmt_1913_sources/type_cast_1916/SplitProtocol/Update/$exit
      -- 	branch_block_stmt_1166/bb_25_xx_xthread12_PhiReq/phi_stmt_1913/phi_stmt_1913_sources/type_cast_1916/SplitProtocol/Update/cr
      -- 	branch_block_stmt_1166/bb_25_xx_xthread12_PhiReq/phi_stmt_1913/phi_stmt_1913_sources/type_cast_1916/SplitProtocol/Update/ca
      -- 
    cp_elements(851) <= cp_elements(511);
    -- CP-element group 852 join  transition  output  bypass 
    -- predecessors 850 851 
    -- successors 858 
    -- members (6) 
      -- 	branch_block_stmt_1166/bb_25_xx_xthread12_PhiReq/$exit
      -- 	branch_block_stmt_1166/bb_25_xx_xthread12_PhiReq/phi_stmt_1913/$exit
      -- 	branch_block_stmt_1166/bb_25_xx_xthread12_PhiReq/phi_stmt_1913/phi_stmt_1913_sources/$exit
      -- 	branch_block_stmt_1166/bb_25_xx_xthread12_PhiReq/phi_stmt_1913/phi_stmt_1913_sources/type_cast_1916/$exit
      -- 	branch_block_stmt_1166/bb_25_xx_xthread12_PhiReq/phi_stmt_1913/phi_stmt_1913_sources/type_cast_1916/SplitProtocol/$exit
      -- 	branch_block_stmt_1166/bb_25_xx_xthread12_PhiReq/phi_stmt_1913/phi_stmt_1913_req
      -- 
    cp_element_group_852: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_852"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(850) & cp_elements(851);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(852), clk => clk, reset => reset); --
    end block;
    phi_stmt_1913_req_8295_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(852), ack => phi_stmt_1913_req_2); -- 
    -- CP-element group 853 transition  output  bypass 
    -- predecessors 534 
    -- successors 854 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_26_xx_xthread12_PhiReq/phi_stmt_1913/phi_stmt_1913_sources/type_cast_1916/SplitProtocol/Sample/$entry
      -- 	branch_block_stmt_1166/bb_26_xx_xthread12_PhiReq/phi_stmt_1913/phi_stmt_1913_sources/type_cast_1916/SplitProtocol/Sample/rr
      -- 
    cp_elements(853) <= cp_elements(534);
    rr_8314_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(853), ack => type_cast_1916_inst_req_0); -- 
    -- CP-element group 854 transition  input  bypass 
    -- predecessors 853 
    -- successors 857 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_26_xx_xthread12_PhiReq/phi_stmt_1913/phi_stmt_1913_sources/type_cast_1916/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/bb_26_xx_xthread12_PhiReq/phi_stmt_1913/phi_stmt_1913_sources/type_cast_1916/SplitProtocol/Sample/ra
      -- 
    ra_8315_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1916_inst_ack_0, ack => cp_elements(854)); -- 
    -- CP-element group 855 transition  output  bypass 
    -- predecessors 534 
    -- successors 856 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_26_xx_xthread12_PhiReq/phi_stmt_1913/phi_stmt_1913_sources/type_cast_1916/SplitProtocol/Update/$entry
      -- 	branch_block_stmt_1166/bb_26_xx_xthread12_PhiReq/phi_stmt_1913/phi_stmt_1913_sources/type_cast_1916/SplitProtocol/Update/cr
      -- 
    cp_elements(855) <= cp_elements(534);
    cr_8319_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(855), ack => type_cast_1916_inst_req_1); -- 
    -- CP-element group 856 transition  input  bypass 
    -- predecessors 855 
    -- successors 857 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_26_xx_xthread12_PhiReq/phi_stmt_1913/phi_stmt_1913_sources/type_cast_1916/SplitProtocol/Update/$exit
      -- 	branch_block_stmt_1166/bb_26_xx_xthread12_PhiReq/phi_stmt_1913/phi_stmt_1913_sources/type_cast_1916/SplitProtocol/Update/ca
      -- 
    ca_8320_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1916_inst_ack_1, ack => cp_elements(856)); -- 
    -- CP-element group 857 join  transition  output  bypass 
    -- predecessors 854 856 
    -- successors 858 
    -- members (6) 
      -- 	branch_block_stmt_1166/bb_26_xx_xthread12_PhiReq/$exit
      -- 	branch_block_stmt_1166/bb_26_xx_xthread12_PhiReq/phi_stmt_1913/$exit
      -- 	branch_block_stmt_1166/bb_26_xx_xthread12_PhiReq/phi_stmt_1913/phi_stmt_1913_sources/$exit
      -- 	branch_block_stmt_1166/bb_26_xx_xthread12_PhiReq/phi_stmt_1913/phi_stmt_1913_sources/type_cast_1916/$exit
      -- 	branch_block_stmt_1166/bb_26_xx_xthread12_PhiReq/phi_stmt_1913/phi_stmt_1913_sources/type_cast_1916/SplitProtocol/$exit
      -- 	branch_block_stmt_1166/bb_26_xx_xthread12_PhiReq/phi_stmt_1913/phi_stmt_1913_req
      -- 
    cp_element_group_857: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_857"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(854) & cp_elements(856);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(857), clk => clk, reset => reset); --
    end block;
    phi_stmt_1913_req_8321_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(857), ack => phi_stmt_1913_req_0); -- 
    -- CP-element group 858 merge  place  bypass 
    -- predecessors 849 852 857 
    -- successors 859 
    -- members (1) 
      -- 	branch_block_stmt_1166/merge_stmt_1912_PhiReqMerge
      -- 
    cp_elements(858) <= OrReduce(cp_elements(849) & cp_elements(852) & cp_elements(857));
    -- CP-element group 859 transition  bypass 
    -- predecessors 858 
    -- successors 860 
    -- members (1) 
      -- 	branch_block_stmt_1166/merge_stmt_1912_PhiAck/$entry
      -- 
    cp_elements(859) <= cp_elements(858);
    -- CP-element group 860 transition  input  bypass 
    -- predecessors 859 
    -- successors 21 
    -- members (2) 
      -- 	branch_block_stmt_1166/merge_stmt_1912_PhiAck/$exit
      -- 	branch_block_stmt_1166/merge_stmt_1912_PhiAck/phi_stmt_1913_ack
      -- 
    phi_stmt_1913_ack_8326_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => phi_stmt_1913_ack_0, ack => cp_elements(860)); -- 
    -- CP-element group 861 fork  transition  bypass 
    -- predecessors 532 
    -- successors 862 874 
    -- members (1) 
      -- 	branch_block_stmt_1166/bb_26_fdiv32x_xexit_PhiReq/$entry
      -- 
    cp_elements(861) <= cp_elements(532);
    -- CP-element group 862 fork  transition  bypass 
    -- predecessors 861 
    -- successors 863 867 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_26_fdiv32x_xexit_PhiReq/phi_stmt_1952/$entry
      -- 	branch_block_stmt_1166/bb_26_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_sources/$entry
      -- 
    cp_elements(862) <= cp_elements(861);
    -- CP-element group 863 fork  transition  bypass 
    -- predecessors 862 
    -- successors 864 865 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_26_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_sources/type_cast_1955/$entry
      -- 	branch_block_stmt_1166/bb_26_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_sources/type_cast_1955/SplitProtocol/$entry
      -- 
    cp_elements(863) <= cp_elements(862);
    -- CP-element group 864 transition  bypass 
    -- predecessors 863 
    -- successors 866 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_26_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_sources/type_cast_1955/SplitProtocol/Sample/$entry
      -- 	branch_block_stmt_1166/bb_26_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_sources/type_cast_1955/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/bb_26_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_sources/type_cast_1955/SplitProtocol/Sample/rr
      -- 	branch_block_stmt_1166/bb_26_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_sources/type_cast_1955/SplitProtocol/Sample/ra
      -- 
    cp_elements(864) <= cp_elements(863);
    -- CP-element group 865 transition  bypass 
    -- predecessors 863 
    -- successors 866 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_26_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_sources/type_cast_1955/SplitProtocol/Update/$entry
      -- 	branch_block_stmt_1166/bb_26_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_sources/type_cast_1955/SplitProtocol/Update/$exit
      -- 	branch_block_stmt_1166/bb_26_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_sources/type_cast_1955/SplitProtocol/Update/cr
      -- 	branch_block_stmt_1166/bb_26_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_sources/type_cast_1955/SplitProtocol/Update/ca
      -- 
    cp_elements(865) <= cp_elements(863);
    -- CP-element group 866 join  transition  bypass 
    -- predecessors 864 865 
    -- successors 873 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_26_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_sources/type_cast_1955/$exit
      -- 	branch_block_stmt_1166/bb_26_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_sources/type_cast_1955/SplitProtocol/$exit
      -- 
    cp_element_group_866: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_866"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(864) & cp_elements(865);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(866), clk => clk, reset => reset); --
    end block;
    -- CP-element group 867 fork  transition  bypass 
    -- predecessors 862 
    -- successors 868 870 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_26_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_sources/type_cast_1957/$entry
      -- 	branch_block_stmt_1166/bb_26_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_sources/type_cast_1957/SplitProtocol/$entry
      -- 
    cp_elements(867) <= cp_elements(862);
    -- CP-element group 868 transition  output  bypass 
    -- predecessors 867 
    -- successors 869 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_26_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_sources/type_cast_1957/SplitProtocol/Sample/$entry
      -- 	branch_block_stmt_1166/bb_26_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_sources/type_cast_1957/SplitProtocol/Sample/rr
      -- 
    cp_elements(868) <= cp_elements(867);
    rr_8361_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(868), ack => type_cast_1957_inst_req_0); -- 
    -- CP-element group 869 transition  input  bypass 
    -- predecessors 868 
    -- successors 872 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_26_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_sources/type_cast_1957/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/bb_26_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_sources/type_cast_1957/SplitProtocol/Sample/ra
      -- 
    ra_8362_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1957_inst_ack_0, ack => cp_elements(869)); -- 
    -- CP-element group 870 transition  output  bypass 
    -- predecessors 867 
    -- successors 871 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_26_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_sources/type_cast_1957/SplitProtocol/Update/$entry
      -- 	branch_block_stmt_1166/bb_26_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_sources/type_cast_1957/SplitProtocol/Update/cr
      -- 
    cp_elements(870) <= cp_elements(867);
    cr_8366_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(870), ack => type_cast_1957_inst_req_1); -- 
    -- CP-element group 871 transition  input  bypass 
    -- predecessors 870 
    -- successors 872 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_26_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_sources/type_cast_1957/SplitProtocol/Update/$exit
      -- 	branch_block_stmt_1166/bb_26_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_sources/type_cast_1957/SplitProtocol/Update/ca
      -- 
    ca_8367_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1957_inst_ack_1, ack => cp_elements(871)); -- 
    -- CP-element group 872 join  transition  bypass 
    -- predecessors 869 871 
    -- successors 873 
    -- members (2) 
      -- 	branch_block_stmt_1166/bb_26_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_sources/type_cast_1957/$exit
      -- 	branch_block_stmt_1166/bb_26_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_sources/type_cast_1957/SplitProtocol/$exit
      -- 
    cp_element_group_872: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_872"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(869) & cp_elements(871);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(872), clk => clk, reset => reset); --
    end block;
    -- CP-element group 873 join  transition  output  bypass 
    -- predecessors 866 872 
    -- successors 878 
    -- members (3) 
      -- 	branch_block_stmt_1166/bb_26_fdiv32x_xexit_PhiReq/phi_stmt_1952/$exit
      -- 	branch_block_stmt_1166/bb_26_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_sources/$exit
      -- 	branch_block_stmt_1166/bb_26_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_req
      -- 
    cp_element_group_873: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_873"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(866) & cp_elements(872);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(873), clk => clk, reset => reset); --
    end block;
    phi_stmt_1952_req_8368_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(873), ack => phi_stmt_1952_req_1); -- 
    -- CP-element group 874 fork  transition  bypass 
    -- predecessors 861 
    -- successors 875 876 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_26_fdiv32x_xexit_PhiReq/phi_stmt_1958/$entry
      -- 	branch_block_stmt_1166/bb_26_fdiv32x_xexit_PhiReq/phi_stmt_1958/phi_stmt_1958_sources/$entry
      -- 	branch_block_stmt_1166/bb_26_fdiv32x_xexit_PhiReq/phi_stmt_1958/phi_stmt_1958_sources/type_cast_1961/$entry
      -- 	branch_block_stmt_1166/bb_26_fdiv32x_xexit_PhiReq/phi_stmt_1958/phi_stmt_1958_sources/type_cast_1961/SplitProtocol/$entry
      -- 
    cp_elements(874) <= cp_elements(861);
    -- CP-element group 875 transition  bypass 
    -- predecessors 874 
    -- successors 877 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_26_fdiv32x_xexit_PhiReq/phi_stmt_1958/phi_stmt_1958_sources/type_cast_1961/SplitProtocol/Sample/$entry
      -- 	branch_block_stmt_1166/bb_26_fdiv32x_xexit_PhiReq/phi_stmt_1958/phi_stmt_1958_sources/type_cast_1961/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/bb_26_fdiv32x_xexit_PhiReq/phi_stmt_1958/phi_stmt_1958_sources/type_cast_1961/SplitProtocol/Sample/rr
      -- 	branch_block_stmt_1166/bb_26_fdiv32x_xexit_PhiReq/phi_stmt_1958/phi_stmt_1958_sources/type_cast_1961/SplitProtocol/Sample/ra
      -- 
    cp_elements(875) <= cp_elements(874);
    -- CP-element group 876 transition  bypass 
    -- predecessors 874 
    -- successors 877 
    -- members (4) 
      -- 	branch_block_stmt_1166/bb_26_fdiv32x_xexit_PhiReq/phi_stmt_1958/phi_stmt_1958_sources/type_cast_1961/SplitProtocol/Update/$entry
      -- 	branch_block_stmt_1166/bb_26_fdiv32x_xexit_PhiReq/phi_stmt_1958/phi_stmt_1958_sources/type_cast_1961/SplitProtocol/Update/$exit
      -- 	branch_block_stmt_1166/bb_26_fdiv32x_xexit_PhiReq/phi_stmt_1958/phi_stmt_1958_sources/type_cast_1961/SplitProtocol/Update/cr
      -- 	branch_block_stmt_1166/bb_26_fdiv32x_xexit_PhiReq/phi_stmt_1958/phi_stmt_1958_sources/type_cast_1961/SplitProtocol/Update/ca
      -- 
    cp_elements(876) <= cp_elements(874);
    -- CP-element group 877 join  transition  output  bypass 
    -- predecessors 875 876 
    -- successors 878 
    -- members (5) 
      -- 	branch_block_stmt_1166/bb_26_fdiv32x_xexit_PhiReq/phi_stmt_1958/$exit
      -- 	branch_block_stmt_1166/bb_26_fdiv32x_xexit_PhiReq/phi_stmt_1958/phi_stmt_1958_sources/$exit
      -- 	branch_block_stmt_1166/bb_26_fdiv32x_xexit_PhiReq/phi_stmt_1958/phi_stmt_1958_sources/type_cast_1961/$exit
      -- 	branch_block_stmt_1166/bb_26_fdiv32x_xexit_PhiReq/phi_stmt_1958/phi_stmt_1958_sources/type_cast_1961/SplitProtocol/$exit
      -- 	branch_block_stmt_1166/bb_26_fdiv32x_xexit_PhiReq/phi_stmt_1958/phi_stmt_1958_req
      -- 
    cp_element_group_877: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_877"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(875) & cp_elements(876);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(877), clk => clk, reset => reset); --
    end block;
    phi_stmt_1958_req_8391_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(877), ack => phi_stmt_1958_req_1); -- 
    -- CP-element group 878 join  transition  bypass 
    -- predecessors 873 877 
    -- successors 899 
    -- members (1) 
      -- 	branch_block_stmt_1166/bb_26_fdiv32x_xexit_PhiReq/$exit
      -- 
    cp_element_group_878: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_878"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(873) & cp_elements(877);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(878), clk => clk, reset => reset); --
    end block;
    -- CP-element group 879 fork  transition  bypass 
    -- predecessors 551 
    -- successors 880 892 
    -- members (1) 
      -- 	branch_block_stmt_1166/xx_xthread12_fdiv32x_xexit_PhiReq/$entry
      -- 
    cp_elements(879) <= cp_elements(551);
    -- CP-element group 880 fork  transition  bypass 
    -- predecessors 879 
    -- successors 881 887 
    -- members (2) 
      -- 	branch_block_stmt_1166/xx_xthread12_fdiv32x_xexit_PhiReq/phi_stmt_1952/$entry
      -- 	branch_block_stmt_1166/xx_xthread12_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_sources/$entry
      -- 
    cp_elements(880) <= cp_elements(879);
    -- CP-element group 881 fork  transition  bypass 
    -- predecessors 880 
    -- successors 882 884 
    -- members (2) 
      -- 	branch_block_stmt_1166/xx_xthread12_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_sources/type_cast_1955/$entry
      -- 	branch_block_stmt_1166/xx_xthread12_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_sources/type_cast_1955/SplitProtocol/$entry
      -- 
    cp_elements(881) <= cp_elements(880);
    -- CP-element group 882 transition  output  bypass 
    -- predecessors 881 
    -- successors 883 
    -- members (2) 
      -- 	branch_block_stmt_1166/xx_xthread12_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_sources/type_cast_1955/SplitProtocol/Sample/$entry
      -- 	branch_block_stmt_1166/xx_xthread12_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_sources/type_cast_1955/SplitProtocol/Sample/rr
      -- 
    cp_elements(882) <= cp_elements(881);
    rr_8410_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(882), ack => type_cast_1955_inst_req_0); -- 
    -- CP-element group 883 transition  input  bypass 
    -- predecessors 882 
    -- successors 886 
    -- members (2) 
      -- 	branch_block_stmt_1166/xx_xthread12_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_sources/type_cast_1955/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/xx_xthread12_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_sources/type_cast_1955/SplitProtocol/Sample/ra
      -- 
    ra_8411_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1955_inst_ack_0, ack => cp_elements(883)); -- 
    -- CP-element group 884 transition  output  bypass 
    -- predecessors 881 
    -- successors 885 
    -- members (2) 
      -- 	branch_block_stmt_1166/xx_xthread12_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_sources/type_cast_1955/SplitProtocol/Update/$entry
      -- 	branch_block_stmt_1166/xx_xthread12_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_sources/type_cast_1955/SplitProtocol/Update/cr
      -- 
    cp_elements(884) <= cp_elements(881);
    cr_8415_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(884), ack => type_cast_1955_inst_req_1); -- 
    -- CP-element group 885 transition  input  bypass 
    -- predecessors 884 
    -- successors 886 
    -- members (2) 
      -- 	branch_block_stmt_1166/xx_xthread12_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_sources/type_cast_1955/SplitProtocol/Update/$exit
      -- 	branch_block_stmt_1166/xx_xthread12_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_sources/type_cast_1955/SplitProtocol/Update/ca
      -- 
    ca_8416_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1955_inst_ack_1, ack => cp_elements(885)); -- 
    -- CP-element group 886 join  transition  bypass 
    -- predecessors 883 885 
    -- successors 891 
    -- members (2) 
      -- 	branch_block_stmt_1166/xx_xthread12_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_sources/type_cast_1955/$exit
      -- 	branch_block_stmt_1166/xx_xthread12_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_sources/type_cast_1955/SplitProtocol/$exit
      -- 
    cp_element_group_886: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_886"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(883) & cp_elements(885);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(886), clk => clk, reset => reset); --
    end block;
    -- CP-element group 887 fork  transition  bypass 
    -- predecessors 880 
    -- successors 888 889 
    -- members (2) 
      -- 	branch_block_stmt_1166/xx_xthread12_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_sources/type_cast_1957/$entry
      -- 	branch_block_stmt_1166/xx_xthread12_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_sources/type_cast_1957/SplitProtocol/$entry
      -- 
    cp_elements(887) <= cp_elements(880);
    -- CP-element group 888 transition  bypass 
    -- predecessors 887 
    -- successors 890 
    -- members (4) 
      -- 	branch_block_stmt_1166/xx_xthread12_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_sources/type_cast_1957/SplitProtocol/Sample/$entry
      -- 	branch_block_stmt_1166/xx_xthread12_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_sources/type_cast_1957/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/xx_xthread12_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_sources/type_cast_1957/SplitProtocol/Sample/rr
      -- 	branch_block_stmt_1166/xx_xthread12_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_sources/type_cast_1957/SplitProtocol/Sample/ra
      -- 
    cp_elements(888) <= cp_elements(887);
    -- CP-element group 889 transition  bypass 
    -- predecessors 887 
    -- successors 890 
    -- members (4) 
      -- 	branch_block_stmt_1166/xx_xthread12_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_sources/type_cast_1957/SplitProtocol/Update/$entry
      -- 	branch_block_stmt_1166/xx_xthread12_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_sources/type_cast_1957/SplitProtocol/Update/$exit
      -- 	branch_block_stmt_1166/xx_xthread12_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_sources/type_cast_1957/SplitProtocol/Update/cr
      -- 	branch_block_stmt_1166/xx_xthread12_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_sources/type_cast_1957/SplitProtocol/Update/ca
      -- 
    cp_elements(889) <= cp_elements(887);
    -- CP-element group 890 join  transition  bypass 
    -- predecessors 888 889 
    -- successors 891 
    -- members (2) 
      -- 	branch_block_stmt_1166/xx_xthread12_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_sources/type_cast_1957/$exit
      -- 	branch_block_stmt_1166/xx_xthread12_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_sources/type_cast_1957/SplitProtocol/$exit
      -- 
    cp_element_group_890: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_890"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(888) & cp_elements(889);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(890), clk => clk, reset => reset); --
    end block;
    -- CP-element group 891 join  transition  output  bypass 
    -- predecessors 886 890 
    -- successors 898 
    -- members (3) 
      -- 	branch_block_stmt_1166/xx_xthread12_fdiv32x_xexit_PhiReq/phi_stmt_1952/$exit
      -- 	branch_block_stmt_1166/xx_xthread12_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_sources/$exit
      -- 	branch_block_stmt_1166/xx_xthread12_fdiv32x_xexit_PhiReq/phi_stmt_1952/phi_stmt_1952_req
      -- 
    cp_element_group_891: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_891"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(886) & cp_elements(890);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(891), clk => clk, reset => reset); --
    end block;
    phi_stmt_1952_req_8433_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(891), ack => phi_stmt_1952_req_0); -- 
    -- CP-element group 892 fork  transition  bypass 
    -- predecessors 879 
    -- successors 893 895 
    -- members (4) 
      -- 	branch_block_stmt_1166/xx_xthread12_fdiv32x_xexit_PhiReq/phi_stmt_1958/$entry
      -- 	branch_block_stmt_1166/xx_xthread12_fdiv32x_xexit_PhiReq/phi_stmt_1958/phi_stmt_1958_sources/$entry
      -- 	branch_block_stmt_1166/xx_xthread12_fdiv32x_xexit_PhiReq/phi_stmt_1958/phi_stmt_1958_sources/type_cast_1961/$entry
      -- 	branch_block_stmt_1166/xx_xthread12_fdiv32x_xexit_PhiReq/phi_stmt_1958/phi_stmt_1958_sources/type_cast_1961/SplitProtocol/$entry
      -- 
    cp_elements(892) <= cp_elements(879);
    -- CP-element group 893 transition  output  bypass 
    -- predecessors 892 
    -- successors 894 
    -- members (2) 
      -- 	branch_block_stmt_1166/xx_xthread12_fdiv32x_xexit_PhiReq/phi_stmt_1958/phi_stmt_1958_sources/type_cast_1961/SplitProtocol/Sample/$entry
      -- 	branch_block_stmt_1166/xx_xthread12_fdiv32x_xexit_PhiReq/phi_stmt_1958/phi_stmt_1958_sources/type_cast_1961/SplitProtocol/Sample/rr
      -- 
    cp_elements(893) <= cp_elements(892);
    rr_8449_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(893), ack => type_cast_1961_inst_req_0); -- 
    -- CP-element group 894 transition  input  bypass 
    -- predecessors 893 
    -- successors 897 
    -- members (2) 
      -- 	branch_block_stmt_1166/xx_xthread12_fdiv32x_xexit_PhiReq/phi_stmt_1958/phi_stmt_1958_sources/type_cast_1961/SplitProtocol/Sample/$exit
      -- 	branch_block_stmt_1166/xx_xthread12_fdiv32x_xexit_PhiReq/phi_stmt_1958/phi_stmt_1958_sources/type_cast_1961/SplitProtocol/Sample/ra
      -- 
    ra_8450_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1961_inst_ack_0, ack => cp_elements(894)); -- 
    -- CP-element group 895 transition  output  bypass 
    -- predecessors 892 
    -- successors 896 
    -- members (2) 
      -- 	branch_block_stmt_1166/xx_xthread12_fdiv32x_xexit_PhiReq/phi_stmt_1958/phi_stmt_1958_sources/type_cast_1961/SplitProtocol/Update/$entry
      -- 	branch_block_stmt_1166/xx_xthread12_fdiv32x_xexit_PhiReq/phi_stmt_1958/phi_stmt_1958_sources/type_cast_1961/SplitProtocol/Update/cr
      -- 
    cp_elements(895) <= cp_elements(892);
    cr_8454_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(895), ack => type_cast_1961_inst_req_1); -- 
    -- CP-element group 896 transition  input  bypass 
    -- predecessors 895 
    -- successors 897 
    -- members (2) 
      -- 	branch_block_stmt_1166/xx_xthread12_fdiv32x_xexit_PhiReq/phi_stmt_1958/phi_stmt_1958_sources/type_cast_1961/SplitProtocol/Update/$exit
      -- 	branch_block_stmt_1166/xx_xthread12_fdiv32x_xexit_PhiReq/phi_stmt_1958/phi_stmt_1958_sources/type_cast_1961/SplitProtocol/Update/ca
      -- 
    ca_8455_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_1961_inst_ack_1, ack => cp_elements(896)); -- 
    -- CP-element group 897 join  transition  output  bypass 
    -- predecessors 894 896 
    -- successors 898 
    -- members (5) 
      -- 	branch_block_stmt_1166/xx_xthread12_fdiv32x_xexit_PhiReq/phi_stmt_1958/$exit
      -- 	branch_block_stmt_1166/xx_xthread12_fdiv32x_xexit_PhiReq/phi_stmt_1958/phi_stmt_1958_sources/$exit
      -- 	branch_block_stmt_1166/xx_xthread12_fdiv32x_xexit_PhiReq/phi_stmt_1958/phi_stmt_1958_sources/type_cast_1961/$exit
      -- 	branch_block_stmt_1166/xx_xthread12_fdiv32x_xexit_PhiReq/phi_stmt_1958/phi_stmt_1958_sources/type_cast_1961/SplitProtocol/$exit
      -- 	branch_block_stmt_1166/xx_xthread12_fdiv32x_xexit_PhiReq/phi_stmt_1958/phi_stmt_1958_req
      -- 
    cp_element_group_897: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_897"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(894) & cp_elements(896);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(897), clk => clk, reset => reset); --
    end block;
    phi_stmt_1958_req_8456_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(897), ack => phi_stmt_1958_req_0); -- 
    -- CP-element group 898 join  transition  bypass 
    -- predecessors 891 897 
    -- successors 899 
    -- members (1) 
      -- 	branch_block_stmt_1166/xx_xthread12_fdiv32x_xexit_PhiReq/$exit
      -- 
    cp_element_group_898: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_898"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(891) & cp_elements(897);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(898), clk => clk, reset => reset); --
    end block;
    -- CP-element group 899 merge  place  bypass 
    -- predecessors 878 898 
    -- successors 900 
    -- members (1) 
      -- 	branch_block_stmt_1166/merge_stmt_1951_PhiReqMerge
      -- 
    cp_elements(899) <= OrReduce(cp_elements(878) & cp_elements(898));
    -- CP-element group 900 fork  transition  bypass 
    -- predecessors 899 
    -- successors 901 902 
    -- members (1) 
      -- 	branch_block_stmt_1166/merge_stmt_1951_PhiAck/$entry
      -- 
    cp_elements(900) <= cp_elements(899);
    -- CP-element group 901 transition  input  bypass 
    -- predecessors 900 
    -- successors 903 
    -- members (1) 
      -- 	branch_block_stmt_1166/merge_stmt_1951_PhiAck/phi_stmt_1952_ack
      -- 
    phi_stmt_1952_ack_8461_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => phi_stmt_1952_ack_0, ack => cp_elements(901)); -- 
    -- CP-element group 902 transition  input  bypass 
    -- predecessors 900 
    -- successors 903 
    -- members (1) 
      -- 	branch_block_stmt_1166/merge_stmt_1951_PhiAck/phi_stmt_1958_ack
      -- 
    phi_stmt_1958_ack_8462_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => phi_stmt_1958_ack_0, ack => cp_elements(902)); -- 
    -- CP-element group 903 join  transition  bypass 
    -- predecessors 901 902 
    -- successors 22 
    -- members (1) 
      -- 	branch_block_stmt_1166/merge_stmt_1951_PhiAck/$exit
      -- 
    cp_element_group_903: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 20) := "cp_element_group_903"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= cp_elements(901) & cp_elements(902);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => cp_elements(903), clk => clk, reset => reset); --
    end block;
    --  hookup: inputs to control-path 
    -- hookup: output from control-path 
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal flux_addx_x0911_1952 : std_logic_vector(63 downto 0);
    signal flux_refx_x0_1508 : std_logic_vector(31 downto 0);
    signal flux_rotor_prevx_x0_1176 : std_logic_vector(31 downto 0);
    signal iNsTr_101_1854 : std_logic_vector(31 downto 0);
    signal iNsTr_102_1859 : std_logic_vector(31 downto 0);
    signal iNsTr_103_1865 : std_logic_vector(0 downto 0);
    signal iNsTr_105_1828 : std_logic_vector(0 downto 0);
    signal iNsTr_107_1929 : std_logic_vector(63 downto 0);
    signal iNsTr_108_1939 : std_logic_vector(63 downto 0);
    signal iNsTr_10_1226 : std_logic_vector(31 downto 0);
    signal iNsTr_110_1878 : std_logic_vector(0 downto 0);
    signal iNsTr_113_1958 : std_logic_vector(63 downto 0);
    signal iNsTr_114_1971 : std_logic_vector(63 downto 0);
    signal iNsTr_115_1976 : std_logic_vector(63 downto 0);
    signal iNsTr_116_1984 : std_logic_vector(31 downto 0);
    signal iNsTr_11_1231 : std_logic_vector(0 downto 0);
    signal iNsTr_126_1899 : std_logic_vector(63 downto 0);
    signal iNsTr_127_1905 : std_logic_vector(0 downto 0);
    signal iNsTr_13_1244 : std_logic_vector(31 downto 0);
    signal iNsTr_15_1251 : std_logic_vector(0 downto 0);
    signal iNsTr_17_1280 : std_logic_vector(31 downto 0);
    signal iNsTr_18_1286 : std_logic_vector(31 downto 0);
    signal iNsTr_19_1291 : std_logic_vector(31 downto 0);
    signal iNsTr_20_1297 : std_logic_vector(31 downto 0);
    signal iNsTr_21_1301 : std_logic_vector(63 downto 0);
    signal iNsTr_22_1307 : std_logic_vector(0 downto 0);
    signal iNsTr_24_1264 : std_logic_vector(31 downto 0);
    signal iNsTr_26_1346 : std_logic_vector(31 downto 0);
    signal iNsTr_27_1351 : std_logic_vector(31 downto 0);
    signal iNsTr_28_1357 : std_logic_vector(0 downto 0);
    signal iNsTr_2_1214 : std_logic_vector(31 downto 0);
    signal iNsTr_30_1320 : std_logic_vector(0 downto 0);
    signal iNsTr_32_1408 : std_logic_vector(63 downto 0);
    signal iNsTr_33_1414 : std_logic_vector(0 downto 0);
    signal iNsTr_35_1370 : std_logic_vector(0 downto 0);
    signal iNsTr_38_1427 : std_logic_vector(0 downto 0);
    signal iNsTr_40_1524 : std_logic_vector(31 downto 0);
    signal iNsTr_41_1530 : std_logic_vector(31 downto 0);
    signal iNsTr_42_1535 : std_logic_vector(31 downto 0);
    signal iNsTr_43_1541 : std_logic_vector(31 downto 0);
    signal iNsTr_44_1545 : std_logic_vector(63 downto 0);
    signal iNsTr_45_1555 : std_logic_vector(63 downto 0);
    signal iNsTr_46_1561 : std_logic_vector(63 downto 0);
    signal iNsTr_47_1567 : std_logic_vector(0 downto 0);
    signal iNsTr_4_1217 : std_logic_vector(31 downto 0);
    signal iNsTr_50_1460 : std_logic_vector(0 downto 0);
    signal iNsTr_52_1440 : std_logic_vector(31 downto 0);
    signal iNsTr_53_1446 : std_logic_vector(31 downto 0);
    signal iNsTr_54_1452 : std_logic_vector(31 downto 0);
    signal iNsTr_56_1606 : std_logic_vector(63 downto 0);
    signal iNsTr_57_1619 : std_logic_vector(63 downto 0);
    signal iNsTr_58_1625 : std_logic_vector(63 downto 0);
    signal iNsTr_59_1635 : std_logic_vector(63 downto 0);
    signal iNsTr_60_1641 : std_logic_vector(63 downto 0);
    signal iNsTr_61_1646 : std_logic_vector(63 downto 0);
    signal iNsTr_62_1652 : std_logic_vector(63 downto 0);
    signal iNsTr_63_1657 : std_logic_vector(63 downto 0);
    signal iNsTr_64_1662 : std_logic_vector(63 downto 0);
    signal iNsTr_65_1668 : std_logic_vector(63 downto 0);
    signal iNsTr_66_1673 : std_logic_vector(63 downto 0);
    signal iNsTr_67_1678 : std_logic_vector(63 downto 0);
    signal iNsTr_68_1684 : std_logic_vector(63 downto 0);
    signal iNsTr_69_1689 : std_logic_vector(63 downto 0);
    signal iNsTr_6_1220 : std_logic_vector(31 downto 0);
    signal iNsTr_70_1695 : std_logic_vector(0 downto 0);
    signal iNsTr_72_1580 : std_logic_vector(63 downto 0);
    signal iNsTr_73_1592 : std_logic_vector(63 downto 0);
    signal iNsTr_75_1493 : std_logic_vector(31 downto 0);
    signal iNsTr_76_1499 : std_logic_vector(31 downto 0);
    signal iNsTr_77_1505 : std_logic_vector(31 downto 0);
    signal iNsTr_79_1473 : std_logic_vector(31 downto 0);
    signal iNsTr_80_1479 : std_logic_vector(31 downto 0);
    signal iNsTr_81_1485 : std_logic_vector(31 downto 0);
    signal iNsTr_83_1756 : std_logic_vector(63 downto 0);
    signal iNsTr_84_1768 : std_logic_vector(63 downto 0);
    signal iNsTr_85_1774 : std_logic_vector(63 downto 0);
    signal iNsTr_86_1779 : std_logic_vector(63 downto 0);
    signal iNsTr_87_1787 : std_logic_vector(31 downto 0);
    signal iNsTr_88_1792 : std_logic_vector(31 downto 0);
    signal iNsTr_89_1798 : std_logic_vector(31 downto 0);
    signal iNsTr_8_1223 : std_logic_vector(31 downto 0);
    signal iNsTr_90_1803 : std_logic_vector(31 downto 0);
    signal iNsTr_91_1809 : std_logic_vector(31 downto 0);
    signal iNsTr_92_1815 : std_logic_vector(0 downto 0);
    signal iNsTr_94_1712 : std_logic_vector(63 downto 0);
    signal iNsTr_95_1718 : std_logic_vector(63 downto 0);
    signal iNsTr_96_1724 : std_logic_vector(63 downto 0);
    signal iNsTr_97_1729 : std_logic_vector(63 downto 0);
    signal iNsTr_98_1734 : std_logic_vector(63 downto 0);
    signal iNsTr_99_1743 : std_logic_vector(63 downto 0);
    signal id_prevx_x0_1197 : std_logic_vector(31 downto 0);
    signal int_flux_err_temp_2x_x0_1190 : std_logic_vector(31 downto 0);
    signal int_flux_errx_x0_1838 : std_logic_vector(31 downto 0);
    signal int_speed_err_temp_2x_x0_1183 : std_logic_vector(31 downto 0);
    signal int_speed_errx_x0_1330 : std_logic_vector(31 downto 0);
    signal orx_xcondx_xix_xi_1700 : std_logic_vector(0 downto 0);
    signal phitmp19x_xi_1943 : std_logic_vector(63 downto 0);
    signal phitmp19x_xix_xi_1747 : std_logic_vector(63 downto 0);
    signal phitmp1_2002 : std_logic_vector(31 downto 0);
    signal phitmp20x_xi15x_xin_1913 : std_logic_vector(63 downto 0);
    signal phitmp20x_xix_xi_1603 : std_logic_vector(63 downto 0);
    signal phitmp21x_xi_1949 : std_logic_vector(63 downto 0);
    signal phitmp21x_xix_xi_1753 : std_logic_vector(63 downto 0);
    signal phitmp2_2008 : std_logic_vector(31 downto 0);
    signal phitmp3_2014 : std_logic_vector(31 downto 0);
    signal phitmp4_1383 : std_logic_vector(31 downto 0);
    signal phitmp5_1387 : std_logic_vector(63 downto 0);
    signal phitmp6_1391 : std_logic_vector(63 downto 0);
    signal phitmp7_1893 : std_logic_vector(63 downto 0);
    signal phitmp_1889 : std_logic_vector(63 downto 0);
    signal phitmpx_xix_xi_1597 : std_logic_vector(63 downto 0);
    signal speed_refx_x0_1267 : std_logic_vector(31 downto 0);
    signal speed_refx_x1_1204 : std_logic_vector(31 downto 0);
    signal theta_prevx_x0_1169 : std_logic_vector(31 downto 0);
    signal tmp11x_xix_xi_1629 : std_logic_vector(63 downto 0);
    signal tmp13x_xi_1933 : std_logic_vector(63 downto 0);
    signal tmp13x_xix_xi_1738 : std_logic_vector(63 downto 0);
    signal tmp15x_xix_xi_1549 : std_logic_vector(63 downto 0);
    signal tmp17x_xmaskx_xix_xi_1586 : std_logic_vector(63 downto 0);
    signal tmp4x_xi_1980 : std_logic_vector(63 downto 0);
    signal tmp4x_xix_xi_1783 : std_logic_vector(63 downto 0);
    signal torque_refx_x0_1394 : std_logic_vector(63 downto 0);
    signal type_cast_1173_wire_constant : std_logic_vector(31 downto 0);
    signal type_cast_1175_wire : std_logic_vector(31 downto 0);
    signal type_cast_1180_wire_constant : std_logic_vector(31 downto 0);
    signal type_cast_1182_wire : std_logic_vector(31 downto 0);
    signal type_cast_1187_wire_constant : std_logic_vector(31 downto 0);
    signal type_cast_1189_wire : std_logic_vector(31 downto 0);
    signal type_cast_1194_wire_constant : std_logic_vector(31 downto 0);
    signal type_cast_1196_wire : std_logic_vector(31 downto 0);
    signal type_cast_1201_wire_constant : std_logic_vector(31 downto 0);
    signal type_cast_1203_wire : std_logic_vector(31 downto 0);
    signal type_cast_1208_wire_constant : std_logic_vector(31 downto 0);
    signal type_cast_1210_wire : std_logic_vector(31 downto 0);
    signal type_cast_1242_wire_constant : std_logic_vector(31 downto 0);
    signal type_cast_1262_wire_constant : std_logic_vector(31 downto 0);
    signal type_cast_1270_wire : std_logic_vector(31 downto 0);
    signal type_cast_1272_wire : std_logic_vector(31 downto 0);
    signal type_cast_1274_wire : std_logic_vector(31 downto 0);
    signal type_cast_1284_wire_constant : std_logic_vector(31 downto 0);
    signal type_cast_1295_wire_constant : std_logic_vector(31 downto 0);
    signal type_cast_1305_wire_constant : std_logic_vector(63 downto 0);
    signal type_cast_1318_wire_constant : std_logic_vector(63 downto 0);
    signal type_cast_1333_wire : std_logic_vector(31 downto 0);
    signal type_cast_1336_wire_constant : std_logic_vector(31 downto 0);
    signal type_cast_1339_wire_constant : std_logic_vector(31 downto 0);
    signal type_cast_1344_wire_constant : std_logic_vector(31 downto 0);
    signal type_cast_1355_wire_constant : std_logic_vector(31 downto 0);
    signal type_cast_1368_wire_constant : std_logic_vector(31 downto 0);
    signal type_cast_1381_wire_constant : std_logic_vector(31 downto 0);
    signal type_cast_1397_wire : std_logic_vector(63 downto 0);
    signal type_cast_1400_wire_constant : std_logic_vector(63 downto 0);
    signal type_cast_1403_wire_constant : std_logic_vector(63 downto 0);
    signal type_cast_1412_wire_constant : std_logic_vector(63 downto 0);
    signal type_cast_1425_wire_constant : std_logic_vector(63 downto 0);
    signal type_cast_1438_wire_constant : std_logic_vector(31 downto 0);
    signal type_cast_1444_wire_constant : std_logic_vector(31 downto 0);
    signal type_cast_1450_wire_constant : std_logic_vector(31 downto 0);
    signal type_cast_1458_wire_constant : std_logic_vector(63 downto 0);
    signal type_cast_1471_wire_constant : std_logic_vector(31 downto 0);
    signal type_cast_1477_wire_constant : std_logic_vector(31 downto 0);
    signal type_cast_1483_wire_constant : std_logic_vector(31 downto 0);
    signal type_cast_1491_wire_constant : std_logic_vector(31 downto 0);
    signal type_cast_1497_wire_constant : std_logic_vector(31 downto 0);
    signal type_cast_1503_wire_constant : std_logic_vector(31 downto 0);
    signal type_cast_1511_wire : std_logic_vector(31 downto 0);
    signal type_cast_1513_wire : std_logic_vector(31 downto 0);
    signal type_cast_1515_wire : std_logic_vector(31 downto 0);
    signal type_cast_1518_wire_constant : std_logic_vector(31 downto 0);
    signal type_cast_1528_wire_constant : std_logic_vector(31 downto 0);
    signal type_cast_1539_wire_constant : std_logic_vector(31 downto 0);
    signal type_cast_1553_wire_constant : std_logic_vector(63 downto 0);
    signal type_cast_1559_wire_constant : std_logic_vector(63 downto 0);
    signal type_cast_1565_wire_constant : std_logic_vector(63 downto 0);
    signal type_cast_1578_wire_constant : std_logic_vector(63 downto 0);
    signal type_cast_1584_wire_constant : std_logic_vector(63 downto 0);
    signal type_cast_1589_wire_constant : std_logic_vector(63 downto 0);
    signal type_cast_1601_wire_constant : std_logic_vector(63 downto 0);
    signal type_cast_1609_wire : std_logic_vector(63 downto 0);
    signal type_cast_1612_wire_constant : std_logic_vector(63 downto 0);
    signal type_cast_1617_wire_constant : std_logic_vector(63 downto 0);
    signal type_cast_1623_wire_constant : std_logic_vector(63 downto 0);
    signal type_cast_1633_wire_constant : std_logic_vector(63 downto 0);
    signal type_cast_1638_wire_constant : std_logic_vector(63 downto 0);
    signal type_cast_1649_wire_constant : std_logic_vector(63 downto 0);
    signal type_cast_1665_wire_constant : std_logic_vector(63 downto 0);
    signal type_cast_1681_wire_constant : std_logic_vector(63 downto 0);
    signal type_cast_1693_wire_constant : std_logic_vector(63 downto 0);
    signal type_cast_1716_wire_constant : std_logic_vector(63 downto 0);
    signal type_cast_1721_wire_constant : std_logic_vector(63 downto 0);
    signal type_cast_1751_wire_constant : std_logic_vector(63 downto 0);
    signal type_cast_1759_wire : std_logic_vector(63 downto 0);
    signal type_cast_1762_wire_constant : std_logic_vector(63 downto 0);
    signal type_cast_1772_wire_constant : std_logic_vector(63 downto 0);
    signal type_cast_1796_wire_constant : std_logic_vector(31 downto 0);
    signal type_cast_1807_wire_constant : std_logic_vector(31 downto 0);
    signal type_cast_1813_wire_constant : std_logic_vector(31 downto 0);
    signal type_cast_1826_wire_constant : std_logic_vector(31 downto 0);
    signal type_cast_1841_wire : std_logic_vector(31 downto 0);
    signal type_cast_1844_wire_constant : std_logic_vector(31 downto 0);
    signal type_cast_1847_wire_constant : std_logic_vector(31 downto 0);
    signal type_cast_1852_wire_constant : std_logic_vector(31 downto 0);
    signal type_cast_1863_wire_constant : std_logic_vector(31 downto 0);
    signal type_cast_1876_wire_constant : std_logic_vector(31 downto 0);
    signal type_cast_1897_wire_constant : std_logic_vector(63 downto 0);
    signal type_cast_1903_wire_constant : std_logic_vector(63 downto 0);
    signal type_cast_1916_wire : std_logic_vector(63 downto 0);
    signal type_cast_1919_wire_constant : std_logic_vector(63 downto 0);
    signal type_cast_1922_wire_constant : std_logic_vector(63 downto 0);
    signal type_cast_1927_wire_constant : std_logic_vector(63 downto 0);
    signal type_cast_1937_wire_constant : std_logic_vector(63 downto 0);
    signal type_cast_1947_wire_constant : std_logic_vector(63 downto 0);
    signal type_cast_1955_wire : std_logic_vector(63 downto 0);
    signal type_cast_1957_wire : std_logic_vector(63 downto 0);
    signal type_cast_1961_wire : std_logic_vector(63 downto 0);
    signal type_cast_1964_wire_constant : std_logic_vector(63 downto 0);
    signal type_cast_1969_wire_constant : std_logic_vector(63 downto 0);
    signal type_cast_2000_wire_constant : std_logic_vector(31 downto 0);
    signal type_cast_2006_wire_constant : std_logic_vector(31 downto 0);
    signal type_cast_2012_wire_constant : std_logic_vector(31 downto 0);
    -- 
  begin -- 
    type_cast_1173_wire_constant <= "00000000000000000000000000000000";
    type_cast_1180_wire_constant <= "00000000000000000000000000000000";
    type_cast_1187_wire_constant <= "00000000000000000000000000000000";
    type_cast_1194_wire_constant <= "00000000000000000000000000000000";
    type_cast_1201_wire_constant <= "00000000000000000000000000000000";
    type_cast_1208_wire_constant <= "01000100101011110000000000000000";
    type_cast_1242_wire_constant <= "01000000101000000000000000000000";
    type_cast_1262_wire_constant <= "11000000101000000000000000000000";
    type_cast_1284_wire_constant <= "00111000010100011011011100010111";
    type_cast_1295_wire_constant <= "01000001001000000000000000000000";
    type_cast_1305_wire_constant <= "1100000000110100000000000000000000000000000000000000000000000000";
    type_cast_1318_wire_constant <= "0100000000110100000000000000000000000000000000000000000000000000";
    type_cast_1336_wire_constant <= "11000001101000000000000000000000";
    type_cast_1339_wire_constant <= "01000001101000000000000000000000";
    type_cast_1344_wire_constant <= "01000000101000000000000000000000";
    type_cast_1355_wire_constant <= "11000010001000000000000000000000";
    type_cast_1368_wire_constant <= "01000010001000000000000000000000";
    type_cast_1381_wire_constant <= "01000000010101110111110011101110";
    type_cast_1400_wire_constant <= "1100000001100000110101011100001010100000000000000000000000000000";
    type_cast_1403_wire_constant <= "0100000001100000110101011100001010100000000000000000000000000000";
    type_cast_1412_wire_constant <= "0100000010011111010000000000000000000000000000000000000000000000";
    type_cast_1425_wire_constant <= "0100000010100011100010000000000000000000000000000000000000000000";
    type_cast_1438_wire_constant <= "10111001010100011011011100010111";
    type_cast_1444_wire_constant <= "00111111101100110011001100110011";
    type_cast_1450_wire_constant <= "00111110100110011001100110011010";
    type_cast_1458_wire_constant <= "0100000010100111011100000000000000000000000000000000000000000000";
    type_cast_1471_wire_constant <= "10111001101111001011111001100010";
    type_cast_1477_wire_constant <= "00111111111001100110011001100110";
    type_cast_1483_wire_constant <= "00111110100110011001100110011010";
    type_cast_1491_wire_constant <= "10111001110111000011001101110010";
    type_cast_1497_wire_constant <= "00111111111111010111000010100100";
    type_cast_1503_wire_constant <= "00111110100110011001100110011010";
    type_cast_1518_wire_constant <= "00111110100110011001100110011010";
    type_cast_1528_wire_constant <= "00111000010100011011011100010111";
    type_cast_1539_wire_constant <= "01000001000110110111000101110110";
    type_cast_1553_wire_constant <= "0111111111111111111111111111111111111111111111111111111111111111";
    type_cast_1559_wire_constant <= "0111111111111111111111111111111111111111111111111111111111111111";
    type_cast_1565_wire_constant <= "0000000000000000000000000000000000000000000000000000000000000000";
    type_cast_1578_wire_constant <= "0111111111110000000000000000000000000000000000000000000000000000";
    type_cast_1584_wire_constant <= "0111111111110000000000000000000000000000000000000000000000000000";
    type_cast_1589_wire_constant <= "0011111111100000000000000000000000000000000000000000000000000000";
    type_cast_1601_wire_constant <= "0111111111110000000000000000000000000000000000000000000000000000";
    type_cast_1612_wire_constant <= "0000000000000000000000000000000000000000000000000000000000000000";
    type_cast_1617_wire_constant <= "0011111111100000000000000000000000000000000000000000000000000000";
    type_cast_1623_wire_constant <= "0011111111101111111111111111111111111111111111111111111111111111";
    type_cast_1633_wire_constant <= "0011111111111110000111100001111000101101111010000111000010010111";
    type_cast_1638_wire_constant <= "0100000000000110100101101001011001011111010100100111010111101111";
    type_cast_1649_wire_constant <= "0100000000000000000000000000000000000000000000000000000000000000";
    type_cast_1665_wire_constant <= "0100000000000000000000000000000000000000000000000000000000000000";
    type_cast_1681_wire_constant <= "0100000000000000000000000000000000000000000000000000000000000000";
    type_cast_1693_wire_constant <= "0000000000000000000000000000000000000000000000000000000000000000";
    type_cast_1716_wire_constant <= "0000000000001111111111111111111111111111111111111111111111111111";
    type_cast_1721_wire_constant <= "0100000000000000000000000000000000000000000000000000000000000000";
    type_cast_1751_wire_constant <= "0111111111111111111111111111111111111111111111111111111111111111";
    type_cast_1762_wire_constant <= "0000000000000000000000000000000000000000000000000000000000000000";
    type_cast_1772_wire_constant <= "1000000000000000000000000000000000000000000000000000000000000000";
    type_cast_1796_wire_constant <= "00111000010100011011011100010111";
    type_cast_1807_wire_constant <= "01000001110010000000000000000000";
    type_cast_1813_wire_constant <= "10111111100000000000000000000000";
    type_cast_1826_wire_constant <= "00111111100000000000000000000000";
    type_cast_1844_wire_constant <= "10111111100000000000000000000000";
    type_cast_1847_wire_constant <= "00111111100000000000000000000000";
    type_cast_1852_wire_constant <= "01000010100000100000000000000000";
    type_cast_1863_wire_constant <= "11000000000000000000000000000000";
    type_cast_1876_wire_constant <= "01000000000000000000000000000000";
    type_cast_1897_wire_constant <= "0111111111111111111111111111111111111111111111111111111111111111";
    type_cast_1903_wire_constant <= "0000000000000000000000000000000000000000000000000000000000000000";
    type_cast_1919_wire_constant <= "1100000000000000000000000000000000000000000000000000000000000000";
    type_cast_1922_wire_constant <= "0100000000000000000000000000000000000000000000000000000000000000";
    type_cast_1927_wire_constant <= "0111111111111111111111111111111111111111111111111111111111111111";
    type_cast_1937_wire_constant <= "0011111111110011110000110100101000000001101010111101000110101011";
    type_cast_1947_wire_constant <= "0111111111111111111111111111111111111111111111111111111111111111";
    type_cast_1964_wire_constant <= "0000000000000000000000000000000000000000000000000000000000000000";
    type_cast_1969_wire_constant <= "1000000000000000000000000000000000000000000000000000000000000000";
    type_cast_2000_wire_constant <= "00111111011111111101111100111011";
    type_cast_2006_wire_constant <= "00111111010011110100000111110010";
    type_cast_2012_wire_constant <= "00111010000000110001001001101111";
    phi_stmt_1169: Block -- phi operator 
      signal idata: std_logic_vector(63 downto 0);
      signal req: BooleanArray(1 downto 0);
      --
    begin -- 
      idata <= type_cast_1173_wire_constant & type_cast_1175_wire;
      req <= phi_stmt_1169_req_0 & phi_stmt_1169_req_1;
      phi: PhiBase -- 
        generic map( -- 
          num_reqs => 2,
          data_width => 32) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_1169_ack_0,
          idata => idata,
          odata => theta_prevx_x0_1169,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_1169
    phi_stmt_1176: Block -- phi operator 
      signal idata: std_logic_vector(63 downto 0);
      signal req: BooleanArray(1 downto 0);
      --
    begin -- 
      idata <= type_cast_1180_wire_constant & type_cast_1182_wire;
      req <= phi_stmt_1176_req_0 & phi_stmt_1176_req_1;
      phi: PhiBase -- 
        generic map( -- 
          num_reqs => 2,
          data_width => 32) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_1176_ack_0,
          idata => idata,
          odata => flux_rotor_prevx_x0_1176,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_1176
    phi_stmt_1183: Block -- phi operator 
      signal idata: std_logic_vector(63 downto 0);
      signal req: BooleanArray(1 downto 0);
      --
    begin -- 
      idata <= type_cast_1187_wire_constant & type_cast_1189_wire;
      req <= phi_stmt_1183_req_0 & phi_stmt_1183_req_1;
      phi: PhiBase -- 
        generic map( -- 
          num_reqs => 2,
          data_width => 32) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_1183_ack_0,
          idata => idata,
          odata => int_speed_err_temp_2x_x0_1183,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_1183
    phi_stmt_1190: Block -- phi operator 
      signal idata: std_logic_vector(63 downto 0);
      signal req: BooleanArray(1 downto 0);
      --
    begin -- 
      idata <= type_cast_1194_wire_constant & type_cast_1196_wire;
      req <= phi_stmt_1190_req_0 & phi_stmt_1190_req_1;
      phi: PhiBase -- 
        generic map( -- 
          num_reqs => 2,
          data_width => 32) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_1190_ack_0,
          idata => idata,
          odata => int_flux_err_temp_2x_x0_1190,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_1190
    phi_stmt_1197: Block -- phi operator 
      signal idata: std_logic_vector(63 downto 0);
      signal req: BooleanArray(1 downto 0);
      --
    begin -- 
      idata <= type_cast_1201_wire_constant & type_cast_1203_wire;
      req <= phi_stmt_1197_req_0 & phi_stmt_1197_req_1;
      phi: PhiBase -- 
        generic map( -- 
          num_reqs => 2,
          data_width => 32) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_1197_ack_0,
          idata => idata,
          odata => id_prevx_x0_1197,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_1197
    phi_stmt_1204: Block -- phi operator 
      signal idata: std_logic_vector(63 downto 0);
      signal req: BooleanArray(1 downto 0);
      --
    begin -- 
      idata <= type_cast_1208_wire_constant & type_cast_1210_wire;
      req <= phi_stmt_1204_req_0 & phi_stmt_1204_req_1;
      phi: PhiBase -- 
        generic map( -- 
          num_reqs => 2,
          data_width => 32) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_1204_ack_0,
          idata => idata,
          odata => speed_refx_x1_1204,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_1204
    phi_stmt_1267: Block -- phi operator 
      signal idata: std_logic_vector(95 downto 0);
      signal req: BooleanArray(2 downto 0);
      --
    begin -- 
      idata <= type_cast_1270_wire & type_cast_1272_wire & type_cast_1274_wire;
      req <= phi_stmt_1267_req_0 & phi_stmt_1267_req_1 & phi_stmt_1267_req_2;
      phi: PhiBase -- 
        generic map( -- 
          num_reqs => 3,
          data_width => 32) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_1267_ack_0,
          idata => idata,
          odata => speed_refx_x0_1267,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_1267
    phi_stmt_1330: Block -- phi operator 
      signal idata: std_logic_vector(95 downto 0);
      signal req: BooleanArray(2 downto 0);
      --
    begin -- 
      idata <= type_cast_1333_wire & type_cast_1336_wire_constant & type_cast_1339_wire_constant;
      req <= phi_stmt_1330_req_0 & phi_stmt_1330_req_1 & phi_stmt_1330_req_2;
      phi: PhiBase -- 
        generic map( -- 
          num_reqs => 3,
          data_width => 32) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_1330_ack_0,
          idata => idata,
          odata => int_speed_errx_x0_1330,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_1330
    phi_stmt_1394: Block -- phi operator 
      signal idata: std_logic_vector(191 downto 0);
      signal req: BooleanArray(2 downto 0);
      --
    begin -- 
      idata <= type_cast_1397_wire & type_cast_1400_wire_constant & type_cast_1403_wire_constant;
      req <= phi_stmt_1394_req_0 & phi_stmt_1394_req_1 & phi_stmt_1394_req_2;
      phi: PhiBase -- 
        generic map( -- 
          num_reqs => 3,
          data_width => 64) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_1394_ack_0,
          idata => idata,
          odata => torque_refx_x0_1394,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_1394
    phi_stmt_1508: Block -- phi operator 
      signal idata: std_logic_vector(127 downto 0);
      signal req: BooleanArray(3 downto 0);
      --
    begin -- 
      idata <= type_cast_1511_wire & type_cast_1513_wire & type_cast_1515_wire & type_cast_1518_wire_constant;
      req <= phi_stmt_1508_req_0 & phi_stmt_1508_req_1 & phi_stmt_1508_req_2 & phi_stmt_1508_req_3;
      phi: PhiBase -- 
        generic map( -- 
          num_reqs => 4,
          data_width => 32) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_1508_ack_0,
          idata => idata,
          odata => flux_refx_x0_1508,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_1508
    phi_stmt_1606: Block -- phi operator 
      signal idata: std_logic_vector(127 downto 0);
      signal req: BooleanArray(1 downto 0);
      --
    begin -- 
      idata <= type_cast_1609_wire & type_cast_1612_wire_constant;
      req <= phi_stmt_1606_req_0 & phi_stmt_1606_req_1;
      phi: PhiBase -- 
        generic map( -- 
          num_reqs => 2,
          data_width => 64) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_1606_ack_0,
          idata => idata,
          odata => iNsTr_56_1606,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_1606
    phi_stmt_1756: Block -- phi operator 
      signal idata: std_logic_vector(127 downto 0);
      signal req: BooleanArray(1 downto 0);
      --
    begin -- 
      idata <= type_cast_1759_wire & type_cast_1762_wire_constant;
      req <= phi_stmt_1756_req_0 & phi_stmt_1756_req_1;
      phi: PhiBase -- 
        generic map( -- 
          num_reqs => 2,
          data_width => 64) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_1756_ack_0,
          idata => idata,
          odata => iNsTr_83_1756,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_1756
    phi_stmt_1838: Block -- phi operator 
      signal idata: std_logic_vector(95 downto 0);
      signal req: BooleanArray(2 downto 0);
      --
    begin -- 
      idata <= type_cast_1841_wire & type_cast_1844_wire_constant & type_cast_1847_wire_constant;
      req <= phi_stmt_1838_req_0 & phi_stmt_1838_req_1 & phi_stmt_1838_req_2;
      phi: PhiBase -- 
        generic map( -- 
          num_reqs => 3,
          data_width => 32) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_1838_ack_0,
          idata => idata,
          odata => int_flux_errx_x0_1838,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_1838
    phi_stmt_1913: Block -- phi operator 
      signal idata: std_logic_vector(191 downto 0);
      signal req: BooleanArray(2 downto 0);
      --
    begin -- 
      idata <= type_cast_1916_wire & type_cast_1919_wire_constant & type_cast_1922_wire_constant;
      req <= phi_stmt_1913_req_0 & phi_stmt_1913_req_1 & phi_stmt_1913_req_2;
      phi: PhiBase -- 
        generic map( -- 
          num_reqs => 3,
          data_width => 64) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_1913_ack_0,
          idata => idata,
          odata => phitmp20x_xi15x_xin_1913,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_1913
    phi_stmt_1952: Block -- phi operator 
      signal idata: std_logic_vector(127 downto 0);
      signal req: BooleanArray(1 downto 0);
      --
    begin -- 
      idata <= type_cast_1955_wire & type_cast_1957_wire;
      req <= phi_stmt_1952_req_0 & phi_stmt_1952_req_1;
      phi: PhiBase -- 
        generic map( -- 
          num_reqs => 2,
          data_width => 64) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_1952_ack_0,
          idata => idata,
          odata => flux_addx_x0911_1952,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_1952
    phi_stmt_1958: Block -- phi operator 
      signal idata: std_logic_vector(127 downto 0);
      signal req: BooleanArray(1 downto 0);
      --
    begin -- 
      idata <= type_cast_1961_wire & type_cast_1964_wire_constant;
      req <= phi_stmt_1958_req_0 & phi_stmt_1958_req_1;
      phi: PhiBase -- 
        generic map( -- 
          num_reqs => 2,
          data_width => 64) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_1958_ack_0,
          idata => idata,
          odata => iNsTr_113_1958,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_1958
    type_cast_1175_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= type_cast_1175_inst_req_0;
      type_cast_1175_inst_ack_0<= wack(0);
      rreq(0) <= type_cast_1175_inst_req_1;
      type_cast_1175_inst_ack_1<= rack(0);
      type_cast_1175_inst : InterlockBuffer generic map ( -- 
        name => "type_cast_1175_inst",
        buffer_size => 1,
        in_data_width => 32,
        out_data_width => 32
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => iNsTr_42_1535,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => type_cast_1175_wire,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    type_cast_1182_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= type_cast_1182_inst_req_0;
      type_cast_1182_inst_ack_0<= wack(0);
      rreq(0) <= type_cast_1182_inst_req_1;
      type_cast_1182_inst_ack_1<= rack(0);
      type_cast_1182_inst : InterlockBuffer generic map ( -- 
        name => "type_cast_1182_inst",
        buffer_size => 1,
        in_data_width => 32,
        out_data_width => 32
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => phitmp1_2002,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => type_cast_1182_wire,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    type_cast_1189_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= type_cast_1189_inst_req_0;
      type_cast_1189_inst_ack_0<= wack(0);
      rreq(0) <= type_cast_1189_inst_req_1;
      type_cast_1189_inst_ack_1<= rack(0);
      type_cast_1189_inst : InterlockBuffer generic map ( -- 
        name => "type_cast_1189_inst",
        buffer_size => 1,
        in_data_width => 32,
        out_data_width => 32
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => iNsTr_19_1291,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => type_cast_1189_wire,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    type_cast_1196_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= type_cast_1196_inst_req_0;
      type_cast_1196_inst_ack_0<= wack(0);
      rreq(0) <= type_cast_1196_inst_req_1;
      type_cast_1196_inst_ack_1<= rack(0);
      type_cast_1196_inst : InterlockBuffer generic map ( -- 
        name => "type_cast_1196_inst",
        buffer_size => 1,
        in_data_width => 32,
        out_data_width => 32
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => iNsTr_90_1803,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => type_cast_1196_wire,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    type_cast_1203_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= type_cast_1203_inst_req_0;
      type_cast_1203_inst_ack_0<= wack(0);
      rreq(0) <= type_cast_1203_inst_req_1;
      type_cast_1203_inst_ack_1<= rack(0);
      type_cast_1203_inst : InterlockBuffer generic map ( -- 
        name => "type_cast_1203_inst",
        buffer_size => 1,
        in_data_width => 32,
        out_data_width => 32
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => phitmp3_2014,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => type_cast_1203_wire,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    type_cast_1210_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= type_cast_1210_inst_req_0;
      type_cast_1210_inst_ack_0<= wack(0);
      rreq(0) <= type_cast_1210_inst_req_1;
      type_cast_1210_inst_ack_1<= rack(0);
      type_cast_1210_inst : InterlockBuffer generic map ( -- 
        name => "type_cast_1210_inst",
        buffer_size => 1,
        in_data_width => 32,
        out_data_width => 32
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => speed_refx_x0_1267,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => type_cast_1210_wire,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    type_cast_1270_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= type_cast_1270_inst_req_0;
      type_cast_1270_inst_ack_0<= wack(0);
      rreq(0) <= type_cast_1270_inst_req_1;
      type_cast_1270_inst_ack_1<= rack(0);
      type_cast_1270_inst : InterlockBuffer generic map ( -- 
        name => "type_cast_1270_inst",
        buffer_size => 1,
        in_data_width => 32,
        out_data_width => 32
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => iNsTr_13_1244,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => type_cast_1270_wire,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    type_cast_1272_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= type_cast_1272_inst_req_0;
      type_cast_1272_inst_ack_0<= wack(0);
      rreq(0) <= type_cast_1272_inst_req_1;
      type_cast_1272_inst_ack_1<= rack(0);
      type_cast_1272_inst : InterlockBuffer generic map ( -- 
        name => "type_cast_1272_inst",
        buffer_size => 1,
        in_data_width => 32,
        out_data_width => 32
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => iNsTr_24_1264,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => type_cast_1272_wire,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    type_cast_1274_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= type_cast_1274_inst_req_0;
      type_cast_1274_inst_ack_0<= wack(0);
      rreq(0) <= type_cast_1274_inst_req_1;
      type_cast_1274_inst_ack_1<= rack(0);
      type_cast_1274_inst : InterlockBuffer generic map ( -- 
        name => "type_cast_1274_inst",
        buffer_size => 1,
        in_data_width => 32,
        out_data_width => 32
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => speed_refx_x1_1204,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => type_cast_1274_wire,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    type_cast_1333_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= type_cast_1333_inst_req_0;
      type_cast_1333_inst_ack_0<= wack(0);
      rreq(0) <= type_cast_1333_inst_req_1;
      type_cast_1333_inst_ack_1<= rack(0);
      type_cast_1333_inst : InterlockBuffer generic map ( -- 
        name => "type_cast_1333_inst",
        buffer_size => 1,
        in_data_width => 32,
        out_data_width => 32
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => iNsTr_20_1297,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => type_cast_1333_wire,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    type_cast_1390_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= type_cast_1390_inst_req_0;
      type_cast_1390_inst_ack_0<= wack(0);
      rreq(0) <= type_cast_1390_inst_req_1;
      type_cast_1390_inst_ack_1<= rack(0);
      type_cast_1390_inst : InterlockBuffer generic map ( -- 
        name => "type_cast_1390_inst",
        buffer_size => 1,
        in_data_width => 64,
        out_data_width => 64
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => phitmp5_1387,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => phitmp6_1391,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    type_cast_1397_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= type_cast_1397_inst_req_0;
      type_cast_1397_inst_ack_0<= wack(0);
      rreq(0) <= type_cast_1397_inst_req_1;
      type_cast_1397_inst_ack_1<= rack(0);
      type_cast_1397_inst : InterlockBuffer generic map ( -- 
        name => "type_cast_1397_inst",
        buffer_size => 1,
        in_data_width => 64,
        out_data_width => 64
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => phitmp6_1391,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => type_cast_1397_wire,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    type_cast_1511_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= type_cast_1511_inst_req_0;
      type_cast_1511_inst_ack_0<= wack(0);
      rreq(0) <= type_cast_1511_inst_req_1;
      type_cast_1511_inst_ack_1<= rack(0);
      type_cast_1511_inst : InterlockBuffer generic map ( -- 
        name => "type_cast_1511_inst",
        buffer_size => 1,
        in_data_width => 32,
        out_data_width => 32
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => iNsTr_54_1452,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => type_cast_1511_wire,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    type_cast_1513_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= type_cast_1513_inst_req_0;
      type_cast_1513_inst_ack_0<= wack(0);
      rreq(0) <= type_cast_1513_inst_req_1;
      type_cast_1513_inst_ack_1<= rack(0);
      type_cast_1513_inst : InterlockBuffer generic map ( -- 
        name => "type_cast_1513_inst",
        buffer_size => 1,
        in_data_width => 32,
        out_data_width => 32
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => iNsTr_81_1485,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => type_cast_1513_wire,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    type_cast_1515_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= type_cast_1515_inst_req_0;
      type_cast_1515_inst_ack_0<= wack(0);
      rreq(0) <= type_cast_1515_inst_req_1;
      type_cast_1515_inst_ack_1<= rack(0);
      type_cast_1515_inst : InterlockBuffer generic map ( -- 
        name => "type_cast_1515_inst",
        buffer_size => 1,
        in_data_width => 32,
        out_data_width => 32
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => iNsTr_77_1505,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => type_cast_1515_wire,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    type_cast_1548_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= type_cast_1548_inst_req_0;
      type_cast_1548_inst_ack_0<= wack(0);
      rreq(0) <= type_cast_1548_inst_req_1;
      type_cast_1548_inst_ack_1<= rack(0);
      type_cast_1548_inst : InterlockBuffer generic map ( -- 
        name => "type_cast_1548_inst",
        buffer_size => 1,
        in_data_width => 64,
        out_data_width => 64
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => iNsTr_44_1545,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => tmp15x_xix_xi_1549,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    type_cast_1609_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= type_cast_1609_inst_req_0;
      type_cast_1609_inst_ack_0<= wack(0);
      rreq(0) <= type_cast_1609_inst_req_1;
      type_cast_1609_inst_ack_1<= rack(0);
      type_cast_1609_inst : InterlockBuffer generic map ( -- 
        name => "type_cast_1609_inst",
        buffer_size => 1,
        in_data_width => 64,
        out_data_width => 64
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => phitmp20x_xix_xi_1603,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => type_cast_1609_wire,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    type_cast_1628_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= type_cast_1628_inst_req_0;
      type_cast_1628_inst_ack_0<= wack(0);
      rreq(0) <= type_cast_1628_inst_req_1;
      type_cast_1628_inst_ack_1<= rack(0);
      type_cast_1628_inst : InterlockBuffer generic map ( -- 
        name => "type_cast_1628_inst",
        buffer_size => 1,
        in_data_width => 64,
        out_data_width => 64
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => iNsTr_58_1625,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => tmp11x_xix_xi_1629,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    type_cast_1737_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= type_cast_1737_inst_req_0;
      type_cast_1737_inst_ack_0<= wack(0);
      rreq(0) <= type_cast_1737_inst_req_1;
      type_cast_1737_inst_ack_1<= rack(0);
      type_cast_1737_inst : InterlockBuffer generic map ( -- 
        name => "type_cast_1737_inst",
        buffer_size => 1,
        in_data_width => 64,
        out_data_width => 64
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => iNsTr_97_1729,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => tmp13x_xix_xi_1738,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    type_cast_1746_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= type_cast_1746_inst_req_0;
      type_cast_1746_inst_ack_0<= wack(0);
      rreq(0) <= type_cast_1746_inst_req_1;
      type_cast_1746_inst_ack_1<= rack(0);
      type_cast_1746_inst : InterlockBuffer generic map ( -- 
        name => "type_cast_1746_inst",
        buffer_size => 1,
        in_data_width => 64,
        out_data_width => 64
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => iNsTr_99_1743,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => phitmp19x_xix_xi_1747,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    type_cast_1759_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= type_cast_1759_inst_req_0;
      type_cast_1759_inst_ack_0<= wack(0);
      rreq(0) <= type_cast_1759_inst_req_1;
      type_cast_1759_inst_ack_1<= rack(0);
      type_cast_1759_inst : InterlockBuffer generic map ( -- 
        name => "type_cast_1759_inst",
        buffer_size => 1,
        in_data_width => 64,
        out_data_width => 64
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => phitmp21x_xix_xi_1753,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => type_cast_1759_wire,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    type_cast_1782_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= type_cast_1782_inst_req_0;
      type_cast_1782_inst_ack_0<= wack(0);
      rreq(0) <= type_cast_1782_inst_req_1;
      type_cast_1782_inst_ack_1<= rack(0);
      type_cast_1782_inst : InterlockBuffer generic map ( -- 
        name => "type_cast_1782_inst",
        buffer_size => 1,
        in_data_width => 64,
        out_data_width => 64
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => iNsTr_86_1779,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => tmp4x_xix_xi_1783,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    type_cast_1841_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= type_cast_1841_inst_req_0;
      type_cast_1841_inst_ack_0<= wack(0);
      rreq(0) <= type_cast_1841_inst_req_1;
      type_cast_1841_inst_ack_1<= rack(0);
      type_cast_1841_inst : InterlockBuffer generic map ( -- 
        name => "type_cast_1841_inst",
        buffer_size => 1,
        in_data_width => 32,
        out_data_width => 32
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => iNsTr_91_1809,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => type_cast_1841_wire,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    type_cast_1892_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= type_cast_1892_inst_req_0;
      type_cast_1892_inst_ack_0<= wack(0);
      rreq(0) <= type_cast_1892_inst_req_1;
      type_cast_1892_inst_ack_1<= rack(0);
      type_cast_1892_inst : InterlockBuffer generic map ( -- 
        name => "type_cast_1892_inst",
        buffer_size => 1,
        in_data_width => 64,
        out_data_width => 64
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => phitmp_1889,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => phitmp7_1893,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    type_cast_1916_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= type_cast_1916_inst_req_0;
      type_cast_1916_inst_ack_0<= wack(0);
      rreq(0) <= type_cast_1916_inst_req_1;
      type_cast_1916_inst_ack_1<= rack(0);
      type_cast_1916_inst : InterlockBuffer generic map ( -- 
        name => "type_cast_1916_inst",
        buffer_size => 1,
        in_data_width => 64,
        out_data_width => 64
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => phitmp7_1893,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => type_cast_1916_wire,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    type_cast_1932_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= type_cast_1932_inst_req_0;
      type_cast_1932_inst_ack_0<= wack(0);
      rreq(0) <= type_cast_1932_inst_req_1;
      type_cast_1932_inst_ack_1<= rack(0);
      type_cast_1932_inst : InterlockBuffer generic map ( -- 
        name => "type_cast_1932_inst",
        buffer_size => 1,
        in_data_width => 64,
        out_data_width => 64
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => iNsTr_107_1929,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => tmp13x_xi_1933,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    type_cast_1942_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= type_cast_1942_inst_req_0;
      type_cast_1942_inst_ack_0<= wack(0);
      rreq(0) <= type_cast_1942_inst_req_1;
      type_cast_1942_inst_ack_1<= rack(0);
      type_cast_1942_inst : InterlockBuffer generic map ( -- 
        name => "type_cast_1942_inst",
        buffer_size => 1,
        in_data_width => 64,
        out_data_width => 64
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => iNsTr_108_1939,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => phitmp19x_xi_1943,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    type_cast_1955_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= type_cast_1955_inst_req_0;
      type_cast_1955_inst_ack_0<= wack(0);
      rreq(0) <= type_cast_1955_inst_req_1;
      type_cast_1955_inst_ack_1<= rack(0);
      type_cast_1955_inst : InterlockBuffer generic map ( -- 
        name => "type_cast_1955_inst",
        buffer_size => 1,
        in_data_width => 64,
        out_data_width => 64
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => phitmp20x_xi15x_xin_1913,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => type_cast_1955_wire,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    type_cast_1957_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= type_cast_1957_inst_req_0;
      type_cast_1957_inst_ack_0<= wack(0);
      rreq(0) <= type_cast_1957_inst_req_1;
      type_cast_1957_inst_ack_1<= rack(0);
      type_cast_1957_inst : InterlockBuffer generic map ( -- 
        name => "type_cast_1957_inst",
        buffer_size => 1,
        in_data_width => 64,
        out_data_width => 64
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => phitmp7_1893,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => type_cast_1957_wire,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    type_cast_1961_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= type_cast_1961_inst_req_0;
      type_cast_1961_inst_ack_0<= wack(0);
      rreq(0) <= type_cast_1961_inst_req_1;
      type_cast_1961_inst_ack_1<= rack(0);
      type_cast_1961_inst : InterlockBuffer generic map ( -- 
        name => "type_cast_1961_inst",
        buffer_size => 1,
        in_data_width => 64,
        out_data_width => 64
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => phitmp21x_xi_1949,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => type_cast_1961_wire,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    type_cast_1979_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= type_cast_1979_inst_req_0;
      type_cast_1979_inst_ack_0<= wack(0);
      rreq(0) <= type_cast_1979_inst_req_1;
      type_cast_1979_inst_ack_1<= rack(0);
      type_cast_1979_inst : InterlockBuffer generic map ( -- 
        name => "type_cast_1979_inst",
        buffer_size => 1,
        in_data_width => 64,
        out_data_width => 64
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => iNsTr_115_1976,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => tmp4x_xi_1980,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    if_stmt_1232_branch: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= iNsTr_11_1231;
      branch_instance: BranchBase -- 
        generic map( condition_width => 1)
        port map( -- 
          condition => condition_sig,
          req => if_stmt_1232_branch_req_0,
          ack0 => if_stmt_1232_branch_ack_0,
          ack1 => if_stmt_1232_branch_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    if_stmt_1252_branch: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= iNsTr_15_1251;
      branch_instance: BranchBase -- 
        generic map( condition_width => 1)
        port map( -- 
          condition => condition_sig,
          req => if_stmt_1252_branch_req_0,
          ack0 => if_stmt_1252_branch_ack_0,
          ack1 => if_stmt_1252_branch_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    if_stmt_1308_branch: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= iNsTr_22_1307;
      branch_instance: BranchBase -- 
        generic map( condition_width => 1)
        port map( -- 
          condition => condition_sig,
          req => if_stmt_1308_branch_req_0,
          ack0 => if_stmt_1308_branch_ack_0,
          ack1 => if_stmt_1308_branch_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    if_stmt_1321_branch: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= iNsTr_30_1320;
      branch_instance: BranchBase -- 
        generic map( condition_width => 1)
        port map( -- 
          condition => condition_sig,
          req => if_stmt_1321_branch_req_0,
          ack0 => if_stmt_1321_branch_ack_0,
          ack1 => if_stmt_1321_branch_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    if_stmt_1358_branch: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= iNsTr_28_1357;
      branch_instance: BranchBase -- 
        generic map( condition_width => 1)
        port map( -- 
          condition => condition_sig,
          req => if_stmt_1358_branch_req_0,
          ack0 => if_stmt_1358_branch_ack_0,
          ack1 => if_stmt_1358_branch_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    if_stmt_1371_branch: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= iNsTr_35_1370;
      branch_instance: BranchBase -- 
        generic map( condition_width => 1)
        port map( -- 
          condition => condition_sig,
          req => if_stmt_1371_branch_req_0,
          ack0 => if_stmt_1371_branch_ack_0,
          ack1 => if_stmt_1371_branch_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    if_stmt_1415_branch: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= iNsTr_33_1414;
      branch_instance: BranchBase -- 
        generic map( condition_width => 1)
        port map( -- 
          condition => condition_sig,
          req => if_stmt_1415_branch_req_0,
          ack0 => if_stmt_1415_branch_ack_0,
          ack1 => if_stmt_1415_branch_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    if_stmt_1428_branch: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= iNsTr_38_1427;
      branch_instance: BranchBase -- 
        generic map( condition_width => 1)
        port map( -- 
          condition => condition_sig,
          req => if_stmt_1428_branch_req_0,
          ack0 => if_stmt_1428_branch_ack_0,
          ack1 => if_stmt_1428_branch_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    if_stmt_1461_branch: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= iNsTr_50_1460;
      branch_instance: BranchBase -- 
        generic map( condition_width => 1)
        port map( -- 
          condition => condition_sig,
          req => if_stmt_1461_branch_req_0,
          ack0 => if_stmt_1461_branch_ack_0,
          ack1 => if_stmt_1461_branch_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    if_stmt_1568_branch: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= iNsTr_47_1567;
      branch_instance: BranchBase -- 
        generic map( condition_width => 1)
        port map( -- 
          condition => condition_sig,
          req => if_stmt_1568_branch_req_0,
          ack0 => if_stmt_1568_branch_ack_0,
          ack1 => if_stmt_1568_branch_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    if_stmt_1701_branch: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= orx_xcondx_xix_xi_1700;
      branch_instance: BranchBase -- 
        generic map( condition_width => 1)
        port map( -- 
          condition => condition_sig,
          req => if_stmt_1701_branch_req_0,
          ack0 => if_stmt_1701_branch_ack_0,
          ack1 => if_stmt_1701_branch_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    if_stmt_1816_branch: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= iNsTr_92_1815;
      branch_instance: BranchBase -- 
        generic map( condition_width => 1)
        port map( -- 
          condition => condition_sig,
          req => if_stmt_1816_branch_req_0,
          ack0 => if_stmt_1816_branch_ack_0,
          ack1 => if_stmt_1816_branch_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    if_stmt_1829_branch: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= iNsTr_105_1828;
      branch_instance: BranchBase -- 
        generic map( condition_width => 1)
        port map( -- 
          condition => condition_sig,
          req => if_stmt_1829_branch_req_0,
          ack0 => if_stmt_1829_branch_ack_0,
          ack1 => if_stmt_1829_branch_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    if_stmt_1866_branch: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= iNsTr_103_1865;
      branch_instance: BranchBase -- 
        generic map( condition_width => 1)
        port map( -- 
          condition => condition_sig,
          req => if_stmt_1866_branch_req_0,
          ack0 => if_stmt_1866_branch_ack_0,
          ack1 => if_stmt_1866_branch_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    if_stmt_1879_branch: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= iNsTr_110_1878;
      branch_instance: BranchBase -- 
        generic map( condition_width => 1)
        port map( -- 
          condition => condition_sig,
          req => if_stmt_1879_branch_req_0,
          ack0 => if_stmt_1879_branch_ack_0,
          ack1 => if_stmt_1879_branch_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    if_stmt_1906_branch: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= iNsTr_127_1905;
      branch_instance: BranchBase -- 
        generic map( condition_width => 1)
        port map( -- 
          condition => condition_sig,
          req => if_stmt_1906_branch_req_0,
          ack0 => if_stmt_1906_branch_ack_0,
          ack1 => if_stmt_1906_branch_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    -- shared split operator group (0) : ADD_f32_f32_1534_inst ADD_f32_f32_1445_inst ADD_f32_f32_1802_inst ADD_f32_f32_1478_inst ADD_f32_f32_1498_inst ADD_f32_f32_1523_inst ADD_f32_f32_1350_inst ADD_f32_f32_1290_inst ADD_f32_f32_1263_inst ADD_f32_f32_1243_inst ADD_f32_f32_1858_inst 
    ApFloatAdd_group_0: Block -- 
      signal data_in: std_logic_vector(703 downto 0);
      signal data_out: std_logic_vector(351 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 10 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 10 downto 0);
      signal reqL_unregulated, ackL_unregulated : BooleanArray( 10 downto 0);
      signal guard_vector : std_logic_vector( 10 downto 0);
      constant inBUFs : IntegerArray(10 downto 0) := (10 => 1, 9 => 1, 8 => 1, 7 => 1, 6 => 1, 5 => 1, 4 => 1, 3 => 1, 2 => 1, 1 => 1, 0 => 1);
      constant outBUFs : IntegerArray(10 downto 0) := (10 => 1, 9 => 1, 8 => 1, 7 => 1, 6 => 1, 5 => 1, 4 => 1, 3 => 1, 2 => 1, 1 => 1, 0 => 1);
      constant guardFlags : BooleanArray(10 downto 0) := (0 => false, 1 => false, 2 => false, 3 => false, 4 => false, 5 => false, 6 => false, 7 => false, 8 => false, 9 => false, 10 => false);
      constant guardBuffering: IntegerArray(10 downto 0)  := (0 => 1, 1 => 1, 2 => 1, 3 => 1, 4 => 1, 5 => 1, 6 => 1, 7 => 1, 8 => 1, 9 => 1, 10 => 1);
      -- 
    begin -- 
      data_in <= iNsTr_41_1530 & theta_prevx_x0_1169 & iNsTr_52_1440 & type_cast_1444_wire_constant & iNsTr_89_1798 & int_flux_err_temp_2x_x0_1190 & iNsTr_79_1473 & type_cast_1477_wire_constant & iNsTr_75_1493 & type_cast_1497_wire_constant & id_prevx_x0_1197 & flux_rotor_prevx_x0_1176 & int_speed_errx_x0_1330 & iNsTr_26_1346 & iNsTr_18_1286 & int_speed_err_temp_2x_x0_1183 & speed_refx_x1_1204 & type_cast_1262_wire_constant & speed_refx_x1_1204 & type_cast_1242_wire_constant & int_flux_errx_x0_1838 & iNsTr_101_1854;
      iNsTr_42_1535 <= data_out(351 downto 320);
      iNsTr_53_1446 <= data_out(319 downto 288);
      iNsTr_90_1803 <= data_out(287 downto 256);
      iNsTr_80_1479 <= data_out(255 downto 224);
      iNsTr_76_1499 <= data_out(223 downto 192);
      iNsTr_40_1524 <= data_out(191 downto 160);
      iNsTr_27_1351 <= data_out(159 downto 128);
      iNsTr_19_1291 <= data_out(127 downto 96);
      iNsTr_24_1264 <= data_out(95 downto 64);
      iNsTr_13_1244 <= data_out(63 downto 32);
      iNsTr_102_1859 <= data_out(31 downto 0);
      guard_vector(0)  <=  '1';
      guard_vector(1)  <=  '1';
      guard_vector(2)  <=  '1';
      guard_vector(3)  <=  '1';
      guard_vector(4)  <=  '1';
      guard_vector(5)  <=  '1';
      guard_vector(6)  <=  '1';
      guard_vector(7)  <=  '1';
      guard_vector(8)  <=  '1';
      guard_vector(9)  <=  '1';
      guard_vector(10)  <=  '1';
      reqL_unguarded(10) <= ADD_f32_f32_1534_inst_req_0;
      reqL_unguarded(9) <= ADD_f32_f32_1445_inst_req_0;
      reqL_unguarded(8) <= ADD_f32_f32_1802_inst_req_0;
      reqL_unguarded(7) <= ADD_f32_f32_1478_inst_req_0;
      reqL_unguarded(6) <= ADD_f32_f32_1498_inst_req_0;
      reqL_unguarded(5) <= ADD_f32_f32_1523_inst_req_0;
      reqL_unguarded(4) <= ADD_f32_f32_1350_inst_req_0;
      reqL_unguarded(3) <= ADD_f32_f32_1290_inst_req_0;
      reqL_unguarded(2) <= ADD_f32_f32_1263_inst_req_0;
      reqL_unguarded(1) <= ADD_f32_f32_1243_inst_req_0;
      reqL_unguarded(0) <= ADD_f32_f32_1858_inst_req_0;
      ADD_f32_f32_1534_inst_ack_0 <= ackL_unguarded(10);
      ADD_f32_f32_1445_inst_ack_0 <= ackL_unguarded(9);
      ADD_f32_f32_1802_inst_ack_0 <= ackL_unguarded(8);
      ADD_f32_f32_1478_inst_ack_0 <= ackL_unguarded(7);
      ADD_f32_f32_1498_inst_ack_0 <= ackL_unguarded(6);
      ADD_f32_f32_1523_inst_ack_0 <= ackL_unguarded(5);
      ADD_f32_f32_1350_inst_ack_0 <= ackL_unguarded(4);
      ADD_f32_f32_1290_inst_ack_0 <= ackL_unguarded(3);
      ADD_f32_f32_1263_inst_ack_0 <= ackL_unguarded(2);
      ADD_f32_f32_1243_inst_ack_0 <= ackL_unguarded(1);
      ADD_f32_f32_1858_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(10) <= ADD_f32_f32_1534_inst_req_1;
      reqR_unguarded(9) <= ADD_f32_f32_1445_inst_req_1;
      reqR_unguarded(8) <= ADD_f32_f32_1802_inst_req_1;
      reqR_unguarded(7) <= ADD_f32_f32_1478_inst_req_1;
      reqR_unguarded(6) <= ADD_f32_f32_1498_inst_req_1;
      reqR_unguarded(5) <= ADD_f32_f32_1523_inst_req_1;
      reqR_unguarded(4) <= ADD_f32_f32_1350_inst_req_1;
      reqR_unguarded(3) <= ADD_f32_f32_1290_inst_req_1;
      reqR_unguarded(2) <= ADD_f32_f32_1263_inst_req_1;
      reqR_unguarded(1) <= ADD_f32_f32_1243_inst_req_1;
      reqR_unguarded(0) <= ADD_f32_f32_1858_inst_req_1;
      ADD_f32_f32_1534_inst_ack_1 <= ackR_unguarded(10);
      ADD_f32_f32_1445_inst_ack_1 <= ackR_unguarded(9);
      ADD_f32_f32_1802_inst_ack_1 <= ackR_unguarded(8);
      ADD_f32_f32_1478_inst_ack_1 <= ackR_unguarded(7);
      ADD_f32_f32_1498_inst_ack_1 <= ackR_unguarded(6);
      ADD_f32_f32_1523_inst_ack_1 <= ackR_unguarded(5);
      ADD_f32_f32_1350_inst_ack_1 <= ackR_unguarded(4);
      ADD_f32_f32_1290_inst_ack_1 <= ackR_unguarded(3);
      ADD_f32_f32_1263_inst_ack_1 <= ackR_unguarded(2);
      ADD_f32_f32_1243_inst_ack_1 <= ackR_unguarded(1);
      ADD_f32_f32_1858_inst_ack_1 <= ackR_unguarded(0);
      ApFloatAdd_group_0_accessRegulator_0: access_regulator_base generic map (name => "ApFloatAdd_group_0_accessRegulator_0", num_slots => 1) -- 
        port map (req => reqL_unregulated(0), -- 
          ack => ackL_unregulated(0),
          regulated_req => reqL(0),
          regulated_ack => ackL(0),
          release_req => reqR(0),
          release_ack => ackR(0),
          clk => clk, reset => reset); -- 
      ApFloatAdd_group_0_accessRegulator_1: access_regulator_base generic map (name => "ApFloatAdd_group_0_accessRegulator_1", num_slots => 1) -- 
        port map (req => reqL_unregulated(1), -- 
          ack => ackL_unregulated(1),
          regulated_req => reqL(1),
          regulated_ack => ackL(1),
          release_req => reqR(1),
          release_ack => ackR(1),
          clk => clk, reset => reset); -- 
      ApFloatAdd_group_0_accessRegulator_2: access_regulator_base generic map (name => "ApFloatAdd_group_0_accessRegulator_2", num_slots => 1) -- 
        port map (req => reqL_unregulated(2), -- 
          ack => ackL_unregulated(2),
          regulated_req => reqL(2),
          regulated_ack => ackL(2),
          release_req => reqR(2),
          release_ack => ackR(2),
          clk => clk, reset => reset); -- 
      ApFloatAdd_group_0_accessRegulator_3: access_regulator_base generic map (name => "ApFloatAdd_group_0_accessRegulator_3", num_slots => 1) -- 
        port map (req => reqL_unregulated(3), -- 
          ack => ackL_unregulated(3),
          regulated_req => reqL(3),
          regulated_ack => ackL(3),
          release_req => reqR(3),
          release_ack => ackR(3),
          clk => clk, reset => reset); -- 
      ApFloatAdd_group_0_accessRegulator_4: access_regulator_base generic map (name => "ApFloatAdd_group_0_accessRegulator_4", num_slots => 1) -- 
        port map (req => reqL_unregulated(4), -- 
          ack => ackL_unregulated(4),
          regulated_req => reqL(4),
          regulated_ack => ackL(4),
          release_req => reqR(4),
          release_ack => ackR(4),
          clk => clk, reset => reset); -- 
      ApFloatAdd_group_0_accessRegulator_5: access_regulator_base generic map (name => "ApFloatAdd_group_0_accessRegulator_5", num_slots => 1) -- 
        port map (req => reqL_unregulated(5), -- 
          ack => ackL_unregulated(5),
          regulated_req => reqL(5),
          regulated_ack => ackL(5),
          release_req => reqR(5),
          release_ack => ackR(5),
          clk => clk, reset => reset); -- 
      ApFloatAdd_group_0_accessRegulator_6: access_regulator_base generic map (name => "ApFloatAdd_group_0_accessRegulator_6", num_slots => 1) -- 
        port map (req => reqL_unregulated(6), -- 
          ack => ackL_unregulated(6),
          regulated_req => reqL(6),
          regulated_ack => ackL(6),
          release_req => reqR(6),
          release_ack => ackR(6),
          clk => clk, reset => reset); -- 
      ApFloatAdd_group_0_accessRegulator_7: access_regulator_base generic map (name => "ApFloatAdd_group_0_accessRegulator_7", num_slots => 1) -- 
        port map (req => reqL_unregulated(7), -- 
          ack => ackL_unregulated(7),
          regulated_req => reqL(7),
          regulated_ack => ackL(7),
          release_req => reqR(7),
          release_ack => ackR(7),
          clk => clk, reset => reset); -- 
      ApFloatAdd_group_0_accessRegulator_8: access_regulator_base generic map (name => "ApFloatAdd_group_0_accessRegulator_8", num_slots => 1) -- 
        port map (req => reqL_unregulated(8), -- 
          ack => ackL_unregulated(8),
          regulated_req => reqL(8),
          regulated_ack => ackL(8),
          release_req => reqR(8),
          release_ack => ackR(8),
          clk => clk, reset => reset); -- 
      ApFloatAdd_group_0_accessRegulator_9: access_regulator_base generic map (name => "ApFloatAdd_group_0_accessRegulator_9", num_slots => 1) -- 
        port map (req => reqL_unregulated(9), -- 
          ack => ackL_unregulated(9),
          regulated_req => reqL(9),
          regulated_ack => ackL(9),
          release_req => reqR(9),
          release_ack => ackR(9),
          clk => clk, reset => reset); -- 
      ApFloatAdd_group_0_accessRegulator_10: access_regulator_base generic map (name => "ApFloatAdd_group_0_accessRegulator_10", num_slots => 1) -- 
        port map (req => reqL_unregulated(10), -- 
          ack => ackL_unregulated(10),
          regulated_req => reqL(10),
          regulated_ack => ackL(10),
          release_req => reqR(10),
          release_ack => ackR(10),
          clk => clk, reset => reset); -- 
      gI: SplitGuardInterface generic map(nreqs => 11, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL_unregulated,
        sa_in => ackL_unregulated,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      PipedFpOp: PipelinedFPOperator -- 
        generic map( -- 
          name => "ApFloatAdd_group_0",
          operator_id => "ApFloatAdd",
          exponent_width => 8,
          fraction_width => 23, 
          no_arbitration => false,
          num_reqs => 11,
          use_input_buffering => true,
          detailed_buffering_per_input => inBUFs,
          detailed_buffering_per_output => outBUFs -- 
        )
        port map ( reqL => reqL , ackL => ackL, reqR => reqR, ackR => ackR, dataL => data_in, dataR => data_out, clk => clk, reset => reset); -- 
      -- 
    end Block; -- split operator group 0
    -- shared split operator group (1) : ADD_u64_u64_1596_inst 
    ApIntAdd_group_1: Block -- 
      signal data_in: std_logic_vector(127 downto 0);
      signal data_out: std_logic_vector(63 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      data_in <= iNsTr_73_1592 & tmp17x_xmaskx_xix_xi_1586;
      phitmpx_xix_xi_1597 <= data_out(63 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= ADD_u64_u64_1596_inst_req_0;
      ADD_u64_u64_1596_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= ADD_u64_u64_1596_inst_req_1;
      ADD_u64_u64_1596_inst_ack_1 <= ackR_unguarded(0);
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApIntAdd",
          name => "ApIntAdd_group_1",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 64,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 64, 
          num_inputs    => 2,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 64,
          constant_operand => "0",
          constant_width => 1,
          buffering  => 1,
          flow_through => false,
          use_constant  => false
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 1
    -- shared split operator group (2) : AND_u64_u64_1554_inst 
    ApIntAnd_group_2: Block -- 
      signal data_in: std_logic_vector(63 downto 0);
      signal data_out: std_logic_vector(63 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      data_in <= torque_refx_x0_1394;
      iNsTr_45_1555 <= data_out(63 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= AND_u64_u64_1554_inst_req_0;
      AND_u64_u64_1554_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= AND_u64_u64_1554_inst_req_1;
      AND_u64_u64_1554_inst_ack_1 <= ackR_unguarded(0);
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApIntAnd",
          name => "ApIntAnd_group_2",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 64,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 64,
          constant_operand => "0111111111111111111111111111111111111111111111111111111111111111",
          constant_width => 64,
          buffering  => 1,
          flow_through => false,
          use_constant  => true
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 2
    -- shared split operator group (3) : AND_u64_u64_1560_inst 
    ApIntAnd_group_3: Block -- 
      signal data_in: std_logic_vector(63 downto 0);
      signal data_out: std_logic_vector(63 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      data_in <= tmp15x_xix_xi_1549;
      iNsTr_46_1561 <= data_out(63 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= AND_u64_u64_1560_inst_req_0;
      AND_u64_u64_1560_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= AND_u64_u64_1560_inst_req_1;
      AND_u64_u64_1560_inst_ack_1 <= ackR_unguarded(0);
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApIntAnd",
          name => "ApIntAnd_group_3",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 64,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 64,
          constant_operand => "0111111111111111111111111111111111111111111111111111111111111111",
          constant_width => 64,
          buffering  => 1,
          flow_through => false,
          use_constant  => true
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 3
    -- shared split operator group (4) : AND_u64_u64_1579_inst 
    ApIntAnd_group_4: Block -- 
      signal data_in: std_logic_vector(63 downto 0);
      signal data_out: std_logic_vector(63 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      data_in <= tmp15x_xix_xi_1549;
      iNsTr_72_1580 <= data_out(63 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= AND_u64_u64_1579_inst_req_0;
      AND_u64_u64_1579_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= AND_u64_u64_1579_inst_req_1;
      AND_u64_u64_1579_inst_ack_1 <= ackR_unguarded(0);
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApIntAnd",
          name => "ApIntAnd_group_4",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 64,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 64,
          constant_operand => "0111111111110000000000000000000000000000000000000000000000000000",
          constant_width => 64,
          buffering  => 1,
          flow_through => false,
          use_constant  => true
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 4
    -- shared split operator group (5) : AND_u64_u64_1585_inst 
    ApIntAnd_group_5: Block -- 
      signal data_in: std_logic_vector(63 downto 0);
      signal data_out: std_logic_vector(63 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      data_in <= torque_refx_x0_1394;
      tmp17x_xmaskx_xix_xi_1586 <= data_out(63 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= AND_u64_u64_1585_inst_req_0;
      AND_u64_u64_1585_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= AND_u64_u64_1585_inst_req_1;
      AND_u64_u64_1585_inst_ack_1 <= ackR_unguarded(0);
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApIntAnd",
          name => "ApIntAnd_group_5",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 64,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 64,
          constant_operand => "0111111111110000000000000000000000000000000000000000000000000000",
          constant_width => 64,
          buffering  => 1,
          flow_through => false,
          use_constant  => true
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 5
    -- shared split operator group (6) : AND_u64_u64_1602_inst 
    ApIntAnd_group_6: Block -- 
      signal data_in: std_logic_vector(63 downto 0);
      signal data_out: std_logic_vector(63 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      data_in <= phitmpx_xix_xi_1597;
      phitmp20x_xix_xi_1603 <= data_out(63 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= AND_u64_u64_1602_inst_req_0;
      AND_u64_u64_1602_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= AND_u64_u64_1602_inst_req_1;
      AND_u64_u64_1602_inst_ack_1 <= ackR_unguarded(0);
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApIntAnd",
          name => "ApIntAnd_group_6",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 64,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 64,
          constant_operand => "0111111111110000000000000000000000000000000000000000000000000000",
          constant_width => 64,
          buffering  => 1,
          flow_through => false,
          use_constant  => true
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 6
    -- shared split operator group (7) : AND_u64_u64_1624_inst 
    ApIntAnd_group_7: Block -- 
      signal data_in: std_logic_vector(63 downto 0);
      signal data_out: std_logic_vector(63 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      data_in <= iNsTr_57_1619;
      iNsTr_58_1625 <= data_out(63 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= AND_u64_u64_1624_inst_req_0;
      AND_u64_u64_1624_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= AND_u64_u64_1624_inst_req_1;
      AND_u64_u64_1624_inst_ack_1 <= ackR_unguarded(0);
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApIntAnd",
          name => "ApIntAnd_group_7",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 64,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 64,
          constant_operand => "0011111111101111111111111111111111111111111111111111111111111111",
          constant_width => 64,
          buffering  => 1,
          flow_through => false,
          use_constant  => true
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 7
    -- shared split operator group (8) : AND_u64_u64_1717_inst 
    ApIntAnd_group_8: Block -- 
      signal data_in: std_logic_vector(63 downto 0);
      signal data_out: std_logic_vector(63 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      data_in <= torque_refx_x0_1394;
      iNsTr_95_1718 <= data_out(63 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= AND_u64_u64_1717_inst_req_0;
      AND_u64_u64_1717_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= AND_u64_u64_1717_inst_req_1;
      AND_u64_u64_1717_inst_ack_1 <= ackR_unguarded(0);
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApIntAnd",
          name => "ApIntAnd_group_8",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 64,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 64,
          constant_operand => "0000000000001111111111111111111111111111111111111111111111111111",
          constant_width => 64,
          buffering  => 1,
          flow_through => false,
          use_constant  => true
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 8
    -- shared split operator group (9) : AND_u64_u64_1752_inst 
    ApIntAnd_group_9: Block -- 
      signal data_in: std_logic_vector(63 downto 0);
      signal data_out: std_logic_vector(63 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      data_in <= phitmp19x_xix_xi_1747;
      phitmp21x_xix_xi_1753 <= data_out(63 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= AND_u64_u64_1752_inst_req_0;
      AND_u64_u64_1752_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= AND_u64_u64_1752_inst_req_1;
      AND_u64_u64_1752_inst_ack_1 <= ackR_unguarded(0);
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApIntAnd",
          name => "ApIntAnd_group_9",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 64,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 64,
          constant_operand => "0111111111111111111111111111111111111111111111111111111111111111",
          constant_width => 64,
          buffering  => 1,
          flow_through => false,
          use_constant  => true
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 9
    -- shared split operator group (10) : AND_u64_u64_1773_inst 
    ApIntAnd_group_10: Block -- 
      signal data_in: std_logic_vector(63 downto 0);
      signal data_out: std_logic_vector(63 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      data_in <= iNsTr_84_1768;
      iNsTr_85_1774 <= data_out(63 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= AND_u64_u64_1773_inst_req_0;
      AND_u64_u64_1773_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= AND_u64_u64_1773_inst_req_1;
      AND_u64_u64_1773_inst_ack_1 <= ackR_unguarded(0);
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApIntAnd",
          name => "ApIntAnd_group_10",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 64,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 64,
          constant_operand => "1000000000000000000000000000000000000000000000000000000000000000",
          constant_width => 64,
          buffering  => 1,
          flow_through => false,
          use_constant  => true
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 10
    -- shared split operator group (11) : AND_u64_u64_1898_inst 
    ApIntAnd_group_11: Block -- 
      signal data_in: std_logic_vector(63 downto 0);
      signal data_out: std_logic_vector(63 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      data_in <= phitmp7_1893;
      iNsTr_126_1899 <= data_out(63 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= AND_u64_u64_1898_inst_req_0;
      AND_u64_u64_1898_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= AND_u64_u64_1898_inst_req_1;
      AND_u64_u64_1898_inst_ack_1 <= ackR_unguarded(0);
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApIntAnd",
          name => "ApIntAnd_group_11",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 64,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 64,
          constant_operand => "0111111111111111111111111111111111111111111111111111111111111111",
          constant_width => 64,
          buffering  => 1,
          flow_through => false,
          use_constant  => true
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 11
    -- shared split operator group (12) : AND_u64_u64_1928_inst 
    ApIntAnd_group_12: Block -- 
      signal data_in: std_logic_vector(63 downto 0);
      signal data_out: std_logic_vector(63 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      data_in <= phitmp20x_xi15x_xin_1913;
      iNsTr_107_1929 <= data_out(63 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= AND_u64_u64_1928_inst_req_0;
      AND_u64_u64_1928_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= AND_u64_u64_1928_inst_req_1;
      AND_u64_u64_1928_inst_ack_1 <= ackR_unguarded(0);
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApIntAnd",
          name => "ApIntAnd_group_12",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 64,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 64,
          constant_operand => "0111111111111111111111111111111111111111111111111111111111111111",
          constant_width => 64,
          buffering  => 1,
          flow_through => false,
          use_constant  => true
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 12
    -- shared split operator group (13) : AND_u64_u64_1948_inst 
    ApIntAnd_group_13: Block -- 
      signal data_in: std_logic_vector(63 downto 0);
      signal data_out: std_logic_vector(63 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      data_in <= phitmp19x_xi_1943;
      phitmp21x_xi_1949 <= data_out(63 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= AND_u64_u64_1948_inst_req_0;
      AND_u64_u64_1948_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= AND_u64_u64_1948_inst_req_1;
      AND_u64_u64_1948_inst_ack_1 <= ackR_unguarded(0);
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApIntAnd",
          name => "ApIntAnd_group_13",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 64,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 64,
          constant_operand => "0111111111111111111111111111111111111111111111111111111111111111",
          constant_width => 64,
          buffering  => 1,
          flow_through => false,
          use_constant  => true
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 13
    -- shared split operator group (14) : AND_u64_u64_1970_inst 
    ApIntAnd_group_14: Block -- 
      signal data_in: std_logic_vector(63 downto 0);
      signal data_out: std_logic_vector(63 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      data_in <= flux_addx_x0911_1952;
      iNsTr_114_1971 <= data_out(63 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= AND_u64_u64_1970_inst_req_0;
      AND_u64_u64_1970_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= AND_u64_u64_1970_inst_req_1;
      AND_u64_u64_1970_inst_ack_1 <= ackR_unguarded(0);
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApIntAnd",
          name => "ApIntAnd_group_14",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 64,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 64,
          constant_operand => "1000000000000000000000000000000000000000000000000000000000000000",
          constant_width => 64,
          buffering  => 1,
          flow_through => false,
          use_constant  => true
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 14
    -- shared split operator group (15) : EQ_u64_u1_1566_inst 
    ApIntEq_group_15: Block -- 
      signal data_in: std_logic_vector(63 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      data_in <= iNsTr_45_1555;
      iNsTr_47_1567 <= data_out(0 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= EQ_u64_u1_1566_inst_req_0;
      EQ_u64_u1_1566_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= EQ_u64_u1_1566_inst_req_1;
      EQ_u64_u1_1566_inst_ack_1 <= ackR_unguarded(0);
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApIntEq",
          name => "ApIntEq_group_15",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 64,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 1,
          constant_operand => "0000000000000000000000000000000000000000000000000000000000000000",
          constant_width => 64,
          buffering  => 1,
          flow_through => false,
          use_constant  => true
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 15
    -- shared split operator group (16) : EQ_u64_u1_1694_inst 
    ApIntEq_group_16: Block -- 
      signal data_in: std_logic_vector(63 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      data_in <= iNsTr_46_1561;
      iNsTr_70_1695 <= data_out(0 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= EQ_u64_u1_1694_inst_req_0;
      EQ_u64_u1_1694_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= EQ_u64_u1_1694_inst_req_1;
      EQ_u64_u1_1694_inst_ack_1 <= ackR_unguarded(0);
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApIntEq",
          name => "ApIntEq_group_16",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 64,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 1,
          constant_operand => "0000000000000000000000000000000000000000000000000000000000000000",
          constant_width => 64,
          buffering  => 1,
          flow_through => false,
          use_constant  => true
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 16
    -- shared split operator group (17) : EQ_u64_u1_1904_inst 
    ApIntEq_group_17: Block -- 
      signal data_in: std_logic_vector(63 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      data_in <= iNsTr_126_1899;
      iNsTr_127_1905 <= data_out(0 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= EQ_u64_u1_1904_inst_req_0;
      EQ_u64_u1_1904_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= EQ_u64_u1_1904_inst_req_1;
      EQ_u64_u1_1904_inst_ack_1 <= ackR_unguarded(0);
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApIntEq",
          name => "ApIntEq_group_17",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 64,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 1,
          constant_operand => "0000000000000000000000000000000000000000000000000000000000000000",
          constant_width => 64,
          buffering  => 1,
          flow_through => false,
          use_constant  => true
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 17
    -- shared split operator group (18) : MUL_f32_f32_1540_inst MUL_f32_f32_1439_inst MUL_f32_f32_1797_inst MUL_f32_f32_1451_inst MUL_f32_f32_1808_inst MUL_f32_f32_1472_inst MUL_f32_f32_1484_inst MUL_f32_f32_1492_inst MUL_f32_f32_1853_inst MUL_f32_f32_1504_inst MUL_f32_f32_1529_inst MUL_f32_f32_1382_inst MUL_f32_f32_1345_inst MUL_f32_f32_1296_inst MUL_f32_f32_1285_inst MUL_f32_f32_2013_inst MUL_f32_f32_2007_inst MUL_f32_f32_2001_inst 
    ApFloatMul_group_18: Block -- 
      signal data_in: std_logic_vector(1151 downto 0);
      signal data_out: std_logic_vector(575 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 17 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 17 downto 0);
      signal reqL_unregulated, ackL_unregulated : BooleanArray( 17 downto 0);
      signal guard_vector : std_logic_vector( 17 downto 0);
      constant inBUFs : IntegerArray(17 downto 0) := (17 => 1, 16 => 1, 15 => 1, 14 => 1, 13 => 1, 12 => 1, 11 => 1, 10 => 1, 9 => 1, 8 => 1, 7 => 1, 6 => 1, 5 => 1, 4 => 1, 3 => 1, 2 => 1, 1 => 1, 0 => 1);
      constant outBUFs : IntegerArray(17 downto 0) := (17 => 1, 16 => 1, 15 => 1, 14 => 1, 13 => 1, 12 => 1, 11 => 1, 10 => 1, 9 => 1, 8 => 1, 7 => 1, 6 => 1, 5 => 1, 4 => 1, 3 => 1, 2 => 1, 1 => 1, 0 => 1);
      constant guardFlags : BooleanArray(17 downto 0) := (0 => false, 1 => false, 2 => false, 3 => false, 4 => false, 5 => false, 6 => false, 7 => false, 8 => false, 9 => false, 10 => false, 11 => false, 12 => false, 13 => false, 14 => false, 15 => false, 16 => false, 17 => false);
      constant guardBuffering: IntegerArray(17 downto 0)  := (0 => 1, 1 => 1, 2 => 1, 3 => 1, 4 => 1, 5 => 1, 6 => 1, 7 => 1, 8 => 1, 9 => 1, 10 => 1, 11 => 1, 12 => 1, 13 => 1, 14 => 1, 15 => 1, 16 => 1, 17 => 1);
      -- 
    begin -- 
      data_in <= iNsTr_40_1524 & type_cast_1539_wire_constant & speed_refx_x0_1267 & type_cast_1438_wire_constant & iNsTr_88_1792 & type_cast_1796_wire_constant & iNsTr_53_1446 & type_cast_1450_wire_constant & iNsTr_90_1803 & type_cast_1807_wire_constant & speed_refx_x0_1267 & type_cast_1471_wire_constant & iNsTr_80_1479 & type_cast_1483_wire_constant & speed_refx_x0_1267 & type_cast_1491_wire_constant & iNsTr_88_1792 & type_cast_1852_wire_constant & iNsTr_76_1499 & type_cast_1503_wire_constant & iNsTr_10_1226 & type_cast_1528_wire_constant & iNsTr_27_1351 & type_cast_1381_wire_constant & iNsTr_17_1280 & type_cast_1344_wire_constant & iNsTr_19_1291 & type_cast_1295_wire_constant & iNsTr_17_1280 & type_cast_1284_wire_constant & phitmp2_2008 & type_cast_2012_wire_constant & iNsTr_2_1214 & type_cast_2006_wire_constant & iNsTr_40_1524 & type_cast_2000_wire_constant;
      iNsTr_43_1541 <= data_out(575 downto 544);
      iNsTr_52_1440 <= data_out(543 downto 512);
      iNsTr_89_1798 <= data_out(511 downto 480);
      iNsTr_54_1452 <= data_out(479 downto 448);
      iNsTr_91_1809 <= data_out(447 downto 416);
      iNsTr_79_1473 <= data_out(415 downto 384);
      iNsTr_81_1485 <= data_out(383 downto 352);
      iNsTr_75_1493 <= data_out(351 downto 320);
      iNsTr_101_1854 <= data_out(319 downto 288);
      iNsTr_77_1505 <= data_out(287 downto 256);
      iNsTr_41_1530 <= data_out(255 downto 224);
      phitmp4_1383 <= data_out(223 downto 192);
      iNsTr_26_1346 <= data_out(191 downto 160);
      iNsTr_20_1297 <= data_out(159 downto 128);
      iNsTr_18_1286 <= data_out(127 downto 96);
      phitmp3_2014 <= data_out(95 downto 64);
      phitmp2_2008 <= data_out(63 downto 32);
      phitmp1_2002 <= data_out(31 downto 0);
      guard_vector(0)  <=  '1';
      guard_vector(1)  <=  '1';
      guard_vector(2)  <=  '1';
      guard_vector(3)  <=  '1';
      guard_vector(4)  <=  '1';
      guard_vector(5)  <=  '1';
      guard_vector(6)  <=  '1';
      guard_vector(7)  <=  '1';
      guard_vector(8)  <=  '1';
      guard_vector(9)  <=  '1';
      guard_vector(10)  <=  '1';
      guard_vector(11)  <=  '1';
      guard_vector(12)  <=  '1';
      guard_vector(13)  <=  '1';
      guard_vector(14)  <=  '1';
      guard_vector(15)  <=  '1';
      guard_vector(16)  <=  '1';
      guard_vector(17)  <=  '1';
      reqL_unguarded(17) <= MUL_f32_f32_1540_inst_req_0;
      reqL_unguarded(16) <= MUL_f32_f32_1439_inst_req_0;
      reqL_unguarded(15) <= MUL_f32_f32_1797_inst_req_0;
      reqL_unguarded(14) <= MUL_f32_f32_1451_inst_req_0;
      reqL_unguarded(13) <= MUL_f32_f32_1808_inst_req_0;
      reqL_unguarded(12) <= MUL_f32_f32_1472_inst_req_0;
      reqL_unguarded(11) <= MUL_f32_f32_1484_inst_req_0;
      reqL_unguarded(10) <= MUL_f32_f32_1492_inst_req_0;
      reqL_unguarded(9) <= MUL_f32_f32_1853_inst_req_0;
      reqL_unguarded(8) <= MUL_f32_f32_1504_inst_req_0;
      reqL_unguarded(7) <= MUL_f32_f32_1529_inst_req_0;
      reqL_unguarded(6) <= MUL_f32_f32_1382_inst_req_0;
      reqL_unguarded(5) <= MUL_f32_f32_1345_inst_req_0;
      reqL_unguarded(4) <= MUL_f32_f32_1296_inst_req_0;
      reqL_unguarded(3) <= MUL_f32_f32_1285_inst_req_0;
      reqL_unguarded(2) <= MUL_f32_f32_2013_inst_req_0;
      reqL_unguarded(1) <= MUL_f32_f32_2007_inst_req_0;
      reqL_unguarded(0) <= MUL_f32_f32_2001_inst_req_0;
      MUL_f32_f32_1540_inst_ack_0 <= ackL_unguarded(17);
      MUL_f32_f32_1439_inst_ack_0 <= ackL_unguarded(16);
      MUL_f32_f32_1797_inst_ack_0 <= ackL_unguarded(15);
      MUL_f32_f32_1451_inst_ack_0 <= ackL_unguarded(14);
      MUL_f32_f32_1808_inst_ack_0 <= ackL_unguarded(13);
      MUL_f32_f32_1472_inst_ack_0 <= ackL_unguarded(12);
      MUL_f32_f32_1484_inst_ack_0 <= ackL_unguarded(11);
      MUL_f32_f32_1492_inst_ack_0 <= ackL_unguarded(10);
      MUL_f32_f32_1853_inst_ack_0 <= ackL_unguarded(9);
      MUL_f32_f32_1504_inst_ack_0 <= ackL_unguarded(8);
      MUL_f32_f32_1529_inst_ack_0 <= ackL_unguarded(7);
      MUL_f32_f32_1382_inst_ack_0 <= ackL_unguarded(6);
      MUL_f32_f32_1345_inst_ack_0 <= ackL_unguarded(5);
      MUL_f32_f32_1296_inst_ack_0 <= ackL_unguarded(4);
      MUL_f32_f32_1285_inst_ack_0 <= ackL_unguarded(3);
      MUL_f32_f32_2013_inst_ack_0 <= ackL_unguarded(2);
      MUL_f32_f32_2007_inst_ack_0 <= ackL_unguarded(1);
      MUL_f32_f32_2001_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(17) <= MUL_f32_f32_1540_inst_req_1;
      reqR_unguarded(16) <= MUL_f32_f32_1439_inst_req_1;
      reqR_unguarded(15) <= MUL_f32_f32_1797_inst_req_1;
      reqR_unguarded(14) <= MUL_f32_f32_1451_inst_req_1;
      reqR_unguarded(13) <= MUL_f32_f32_1808_inst_req_1;
      reqR_unguarded(12) <= MUL_f32_f32_1472_inst_req_1;
      reqR_unguarded(11) <= MUL_f32_f32_1484_inst_req_1;
      reqR_unguarded(10) <= MUL_f32_f32_1492_inst_req_1;
      reqR_unguarded(9) <= MUL_f32_f32_1853_inst_req_1;
      reqR_unguarded(8) <= MUL_f32_f32_1504_inst_req_1;
      reqR_unguarded(7) <= MUL_f32_f32_1529_inst_req_1;
      reqR_unguarded(6) <= MUL_f32_f32_1382_inst_req_1;
      reqR_unguarded(5) <= MUL_f32_f32_1345_inst_req_1;
      reqR_unguarded(4) <= MUL_f32_f32_1296_inst_req_1;
      reqR_unguarded(3) <= MUL_f32_f32_1285_inst_req_1;
      reqR_unguarded(2) <= MUL_f32_f32_2013_inst_req_1;
      reqR_unguarded(1) <= MUL_f32_f32_2007_inst_req_1;
      reqR_unguarded(0) <= MUL_f32_f32_2001_inst_req_1;
      MUL_f32_f32_1540_inst_ack_1 <= ackR_unguarded(17);
      MUL_f32_f32_1439_inst_ack_1 <= ackR_unguarded(16);
      MUL_f32_f32_1797_inst_ack_1 <= ackR_unguarded(15);
      MUL_f32_f32_1451_inst_ack_1 <= ackR_unguarded(14);
      MUL_f32_f32_1808_inst_ack_1 <= ackR_unguarded(13);
      MUL_f32_f32_1472_inst_ack_1 <= ackR_unguarded(12);
      MUL_f32_f32_1484_inst_ack_1 <= ackR_unguarded(11);
      MUL_f32_f32_1492_inst_ack_1 <= ackR_unguarded(10);
      MUL_f32_f32_1853_inst_ack_1 <= ackR_unguarded(9);
      MUL_f32_f32_1504_inst_ack_1 <= ackR_unguarded(8);
      MUL_f32_f32_1529_inst_ack_1 <= ackR_unguarded(7);
      MUL_f32_f32_1382_inst_ack_1 <= ackR_unguarded(6);
      MUL_f32_f32_1345_inst_ack_1 <= ackR_unguarded(5);
      MUL_f32_f32_1296_inst_ack_1 <= ackR_unguarded(4);
      MUL_f32_f32_1285_inst_ack_1 <= ackR_unguarded(3);
      MUL_f32_f32_2013_inst_ack_1 <= ackR_unguarded(2);
      MUL_f32_f32_2007_inst_ack_1 <= ackR_unguarded(1);
      MUL_f32_f32_2001_inst_ack_1 <= ackR_unguarded(0);
      ApFloatMul_group_18_accessRegulator_0: access_regulator_base generic map (name => "ApFloatMul_group_18_accessRegulator_0", num_slots => 1) -- 
        port map (req => reqL_unregulated(0), -- 
          ack => ackL_unregulated(0),
          regulated_req => reqL(0),
          regulated_ack => ackL(0),
          release_req => reqR(0),
          release_ack => ackR(0),
          clk => clk, reset => reset); -- 
      ApFloatMul_group_18_accessRegulator_1: access_regulator_base generic map (name => "ApFloatMul_group_18_accessRegulator_1", num_slots => 1) -- 
        port map (req => reqL_unregulated(1), -- 
          ack => ackL_unregulated(1),
          regulated_req => reqL(1),
          regulated_ack => ackL(1),
          release_req => reqR(1),
          release_ack => ackR(1),
          clk => clk, reset => reset); -- 
      ApFloatMul_group_18_accessRegulator_2: access_regulator_base generic map (name => "ApFloatMul_group_18_accessRegulator_2", num_slots => 1) -- 
        port map (req => reqL_unregulated(2), -- 
          ack => ackL_unregulated(2),
          regulated_req => reqL(2),
          regulated_ack => ackL(2),
          release_req => reqR(2),
          release_ack => ackR(2),
          clk => clk, reset => reset); -- 
      ApFloatMul_group_18_accessRegulator_3: access_regulator_base generic map (name => "ApFloatMul_group_18_accessRegulator_3", num_slots => 1) -- 
        port map (req => reqL_unregulated(3), -- 
          ack => ackL_unregulated(3),
          regulated_req => reqL(3),
          regulated_ack => ackL(3),
          release_req => reqR(3),
          release_ack => ackR(3),
          clk => clk, reset => reset); -- 
      ApFloatMul_group_18_accessRegulator_4: access_regulator_base generic map (name => "ApFloatMul_group_18_accessRegulator_4", num_slots => 1) -- 
        port map (req => reqL_unregulated(4), -- 
          ack => ackL_unregulated(4),
          regulated_req => reqL(4),
          regulated_ack => ackL(4),
          release_req => reqR(4),
          release_ack => ackR(4),
          clk => clk, reset => reset); -- 
      ApFloatMul_group_18_accessRegulator_5: access_regulator_base generic map (name => "ApFloatMul_group_18_accessRegulator_5", num_slots => 1) -- 
        port map (req => reqL_unregulated(5), -- 
          ack => ackL_unregulated(5),
          regulated_req => reqL(5),
          regulated_ack => ackL(5),
          release_req => reqR(5),
          release_ack => ackR(5),
          clk => clk, reset => reset); -- 
      ApFloatMul_group_18_accessRegulator_6: access_regulator_base generic map (name => "ApFloatMul_group_18_accessRegulator_6", num_slots => 1) -- 
        port map (req => reqL_unregulated(6), -- 
          ack => ackL_unregulated(6),
          regulated_req => reqL(6),
          regulated_ack => ackL(6),
          release_req => reqR(6),
          release_ack => ackR(6),
          clk => clk, reset => reset); -- 
      ApFloatMul_group_18_accessRegulator_7: access_regulator_base generic map (name => "ApFloatMul_group_18_accessRegulator_7", num_slots => 1) -- 
        port map (req => reqL_unregulated(7), -- 
          ack => ackL_unregulated(7),
          regulated_req => reqL(7),
          regulated_ack => ackL(7),
          release_req => reqR(7),
          release_ack => ackR(7),
          clk => clk, reset => reset); -- 
      ApFloatMul_group_18_accessRegulator_8: access_regulator_base generic map (name => "ApFloatMul_group_18_accessRegulator_8", num_slots => 1) -- 
        port map (req => reqL_unregulated(8), -- 
          ack => ackL_unregulated(8),
          regulated_req => reqL(8),
          regulated_ack => ackL(8),
          release_req => reqR(8),
          release_ack => ackR(8),
          clk => clk, reset => reset); -- 
      ApFloatMul_group_18_accessRegulator_9: access_regulator_base generic map (name => "ApFloatMul_group_18_accessRegulator_9", num_slots => 1) -- 
        port map (req => reqL_unregulated(9), -- 
          ack => ackL_unregulated(9),
          regulated_req => reqL(9),
          regulated_ack => ackL(9),
          release_req => reqR(9),
          release_ack => ackR(9),
          clk => clk, reset => reset); -- 
      ApFloatMul_group_18_accessRegulator_10: access_regulator_base generic map (name => "ApFloatMul_group_18_accessRegulator_10", num_slots => 1) -- 
        port map (req => reqL_unregulated(10), -- 
          ack => ackL_unregulated(10),
          regulated_req => reqL(10),
          regulated_ack => ackL(10),
          release_req => reqR(10),
          release_ack => ackR(10),
          clk => clk, reset => reset); -- 
      ApFloatMul_group_18_accessRegulator_11: access_regulator_base generic map (name => "ApFloatMul_group_18_accessRegulator_11", num_slots => 1) -- 
        port map (req => reqL_unregulated(11), -- 
          ack => ackL_unregulated(11),
          regulated_req => reqL(11),
          regulated_ack => ackL(11),
          release_req => reqR(11),
          release_ack => ackR(11),
          clk => clk, reset => reset); -- 
      ApFloatMul_group_18_accessRegulator_12: access_regulator_base generic map (name => "ApFloatMul_group_18_accessRegulator_12", num_slots => 1) -- 
        port map (req => reqL_unregulated(12), -- 
          ack => ackL_unregulated(12),
          regulated_req => reqL(12),
          regulated_ack => ackL(12),
          release_req => reqR(12),
          release_ack => ackR(12),
          clk => clk, reset => reset); -- 
      ApFloatMul_group_18_accessRegulator_13: access_regulator_base generic map (name => "ApFloatMul_group_18_accessRegulator_13", num_slots => 1) -- 
        port map (req => reqL_unregulated(13), -- 
          ack => ackL_unregulated(13),
          regulated_req => reqL(13),
          regulated_ack => ackL(13),
          release_req => reqR(13),
          release_ack => ackR(13),
          clk => clk, reset => reset); -- 
      ApFloatMul_group_18_accessRegulator_14: access_regulator_base generic map (name => "ApFloatMul_group_18_accessRegulator_14", num_slots => 1) -- 
        port map (req => reqL_unregulated(14), -- 
          ack => ackL_unregulated(14),
          regulated_req => reqL(14),
          regulated_ack => ackL(14),
          release_req => reqR(14),
          release_ack => ackR(14),
          clk => clk, reset => reset); -- 
      ApFloatMul_group_18_accessRegulator_15: access_regulator_base generic map (name => "ApFloatMul_group_18_accessRegulator_15", num_slots => 1) -- 
        port map (req => reqL_unregulated(15), -- 
          ack => ackL_unregulated(15),
          regulated_req => reqL(15),
          regulated_ack => ackL(15),
          release_req => reqR(15),
          release_ack => ackR(15),
          clk => clk, reset => reset); -- 
      ApFloatMul_group_18_accessRegulator_16: access_regulator_base generic map (name => "ApFloatMul_group_18_accessRegulator_16", num_slots => 1) -- 
        port map (req => reqL_unregulated(16), -- 
          ack => ackL_unregulated(16),
          regulated_req => reqL(16),
          regulated_ack => ackL(16),
          release_req => reqR(16),
          release_ack => ackR(16),
          clk => clk, reset => reset); -- 
      ApFloatMul_group_18_accessRegulator_17: access_regulator_base generic map (name => "ApFloatMul_group_18_accessRegulator_17", num_slots => 1) -- 
        port map (req => reqL_unregulated(17), -- 
          ack => ackL_unregulated(17),
          regulated_req => reqL(17),
          regulated_ack => ackL(17),
          release_req => reqR(17),
          release_ack => ackR(17),
          clk => clk, reset => reset); -- 
      gI: SplitGuardInterface generic map(nreqs => 18, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL_unregulated,
        sa_in => ackL_unregulated,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      PipedFpOp: PipelinedFPOperator -- 
        generic map( -- 
          name => "ApFloatMul_group_18",
          operator_id => "ApFloatMul",
          exponent_width => 8,
          fraction_width => 23, 
          no_arbitration => false,
          num_reqs => 18,
          use_input_buffering => true,
          detailed_buffering_per_input => inBUFs,
          detailed_buffering_per_output => outBUFs -- 
        )
        port map ( reqL => reqL , ackL => ackL, reqR => reqR, ackR => ackR, dataL => data_in, dataR => data_out, clk => clk, reset => reset); -- 
      -- 
    end Block; -- split operator group 18
    -- shared split operator group (19) : MUL_f64_f64_1688_inst MUL_f64_f64_1733_inst MUL_f64_f64_1677_inst MUL_f64_f64_1672_inst MUL_f64_f64_1711_inst MUL_f64_f64_1661_inst MUL_f64_f64_1656_inst MUL_f64_f64_1742_inst MUL_f64_f64_1634_inst MUL_f64_f64_1938_inst MUL_f64_f64_1645_inst 
    ApFloatMul_group_19: Block -- 
      signal data_in: std_logic_vector(1407 downto 0);
      signal data_out: std_logic_vector(703 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 10 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 10 downto 0);
      signal reqL_unregulated, ackL_unregulated : BooleanArray( 10 downto 0);
      signal guard_vector : std_logic_vector( 10 downto 0);
      constant inBUFs : IntegerArray(10 downto 0) := (10 => 1, 9 => 1, 8 => 1, 7 => 1, 6 => 1, 5 => 1, 4 => 1, 3 => 1, 2 => 1, 1 => 1, 0 => 1);
      constant outBUFs : IntegerArray(10 downto 0) := (10 => 1, 9 => 1, 8 => 1, 7 => 1, 6 => 1, 5 => 1, 4 => 1, 3 => 1, 2 => 1, 1 => 1, 0 => 1);
      constant guardFlags : BooleanArray(10 downto 0) := (0 => false, 1 => false, 2 => false, 3 => false, 4 => false, 5 => false, 6 => false, 7 => false, 8 => false, 9 => false, 10 => false);
      constant guardBuffering: IntegerArray(10 downto 0)  := (0 => 1, 1 => 1, 2 => 1, 3 => 1, 4 => 1, 5 => 1, 6 => 1, 7 => 1, 8 => 1, 9 => 1, 10 => 1);
      -- 
    begin -- 
      data_in <= iNsTr_66_1673 & iNsTr_68_1684 & iNsTr_69_1689 & iNsTr_96_1724 & tmp11x_xix_xi_1629 & iNsTr_66_1673 & iNsTr_63_1657 & iNsTr_65_1668 & tmp11x_xix_xi_1629 & iNsTr_69_1689 & tmp11x_xix_xi_1629 & iNsTr_63_1657 & iNsTr_60_1641 & iNsTr_62_1652 & tmp13x_xix_xi_1738 & iNsTr_98_1734 & tmp11x_xix_xi_1629 & type_cast_1633_wire_constant & tmp13x_xi_1933 & type_cast_1937_wire_constant & tmp11x_xix_xi_1629 & iNsTr_60_1641;
      iNsTr_69_1689 <= data_out(703 downto 640);
      iNsTr_98_1734 <= data_out(639 downto 576);
      iNsTr_67_1678 <= data_out(575 downto 512);
      iNsTr_66_1673 <= data_out(511 downto 448);
      iNsTr_94_1712 <= data_out(447 downto 384);
      iNsTr_64_1662 <= data_out(383 downto 320);
      iNsTr_63_1657 <= data_out(319 downto 256);
      iNsTr_99_1743 <= data_out(255 downto 192);
      iNsTr_59_1635 <= data_out(191 downto 128);
      iNsTr_108_1939 <= data_out(127 downto 64);
      iNsTr_61_1646 <= data_out(63 downto 0);
      guard_vector(0)  <=  '1';
      guard_vector(1)  <=  '1';
      guard_vector(2)  <=  '1';
      guard_vector(3)  <=  '1';
      guard_vector(4)  <=  '1';
      guard_vector(5)  <=  '1';
      guard_vector(6)  <=  '1';
      guard_vector(7)  <=  '1';
      guard_vector(8)  <=  '1';
      guard_vector(9)  <=  '1';
      guard_vector(10)  <=  '1';
      reqL_unguarded(10) <= MUL_f64_f64_1688_inst_req_0;
      reqL_unguarded(9) <= MUL_f64_f64_1733_inst_req_0;
      reqL_unguarded(8) <= MUL_f64_f64_1677_inst_req_0;
      reqL_unguarded(7) <= MUL_f64_f64_1672_inst_req_0;
      reqL_unguarded(6) <= MUL_f64_f64_1711_inst_req_0;
      reqL_unguarded(5) <= MUL_f64_f64_1661_inst_req_0;
      reqL_unguarded(4) <= MUL_f64_f64_1656_inst_req_0;
      reqL_unguarded(3) <= MUL_f64_f64_1742_inst_req_0;
      reqL_unguarded(2) <= MUL_f64_f64_1634_inst_req_0;
      reqL_unguarded(1) <= MUL_f64_f64_1938_inst_req_0;
      reqL_unguarded(0) <= MUL_f64_f64_1645_inst_req_0;
      MUL_f64_f64_1688_inst_ack_0 <= ackL_unguarded(10);
      MUL_f64_f64_1733_inst_ack_0 <= ackL_unguarded(9);
      MUL_f64_f64_1677_inst_ack_0 <= ackL_unguarded(8);
      MUL_f64_f64_1672_inst_ack_0 <= ackL_unguarded(7);
      MUL_f64_f64_1711_inst_ack_0 <= ackL_unguarded(6);
      MUL_f64_f64_1661_inst_ack_0 <= ackL_unguarded(5);
      MUL_f64_f64_1656_inst_ack_0 <= ackL_unguarded(4);
      MUL_f64_f64_1742_inst_ack_0 <= ackL_unguarded(3);
      MUL_f64_f64_1634_inst_ack_0 <= ackL_unguarded(2);
      MUL_f64_f64_1938_inst_ack_0 <= ackL_unguarded(1);
      MUL_f64_f64_1645_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(10) <= MUL_f64_f64_1688_inst_req_1;
      reqR_unguarded(9) <= MUL_f64_f64_1733_inst_req_1;
      reqR_unguarded(8) <= MUL_f64_f64_1677_inst_req_1;
      reqR_unguarded(7) <= MUL_f64_f64_1672_inst_req_1;
      reqR_unguarded(6) <= MUL_f64_f64_1711_inst_req_1;
      reqR_unguarded(5) <= MUL_f64_f64_1661_inst_req_1;
      reqR_unguarded(4) <= MUL_f64_f64_1656_inst_req_1;
      reqR_unguarded(3) <= MUL_f64_f64_1742_inst_req_1;
      reqR_unguarded(2) <= MUL_f64_f64_1634_inst_req_1;
      reqR_unguarded(1) <= MUL_f64_f64_1938_inst_req_1;
      reqR_unguarded(0) <= MUL_f64_f64_1645_inst_req_1;
      MUL_f64_f64_1688_inst_ack_1 <= ackR_unguarded(10);
      MUL_f64_f64_1733_inst_ack_1 <= ackR_unguarded(9);
      MUL_f64_f64_1677_inst_ack_1 <= ackR_unguarded(8);
      MUL_f64_f64_1672_inst_ack_1 <= ackR_unguarded(7);
      MUL_f64_f64_1711_inst_ack_1 <= ackR_unguarded(6);
      MUL_f64_f64_1661_inst_ack_1 <= ackR_unguarded(5);
      MUL_f64_f64_1656_inst_ack_1 <= ackR_unguarded(4);
      MUL_f64_f64_1742_inst_ack_1 <= ackR_unguarded(3);
      MUL_f64_f64_1634_inst_ack_1 <= ackR_unguarded(2);
      MUL_f64_f64_1938_inst_ack_1 <= ackR_unguarded(1);
      MUL_f64_f64_1645_inst_ack_1 <= ackR_unguarded(0);
      ApFloatMul_group_19_accessRegulator_0: access_regulator_base generic map (name => "ApFloatMul_group_19_accessRegulator_0", num_slots => 1) -- 
        port map (req => reqL_unregulated(0), -- 
          ack => ackL_unregulated(0),
          regulated_req => reqL(0),
          regulated_ack => ackL(0),
          release_req => reqR(0),
          release_ack => ackR(0),
          clk => clk, reset => reset); -- 
      ApFloatMul_group_19_accessRegulator_1: access_regulator_base generic map (name => "ApFloatMul_group_19_accessRegulator_1", num_slots => 1) -- 
        port map (req => reqL_unregulated(1), -- 
          ack => ackL_unregulated(1),
          regulated_req => reqL(1),
          regulated_ack => ackL(1),
          release_req => reqR(1),
          release_ack => ackR(1),
          clk => clk, reset => reset); -- 
      ApFloatMul_group_19_accessRegulator_2: access_regulator_base generic map (name => "ApFloatMul_group_19_accessRegulator_2", num_slots => 1) -- 
        port map (req => reqL_unregulated(2), -- 
          ack => ackL_unregulated(2),
          regulated_req => reqL(2),
          regulated_ack => ackL(2),
          release_req => reqR(2),
          release_ack => ackR(2),
          clk => clk, reset => reset); -- 
      ApFloatMul_group_19_accessRegulator_3: access_regulator_base generic map (name => "ApFloatMul_group_19_accessRegulator_3", num_slots => 1) -- 
        port map (req => reqL_unregulated(3), -- 
          ack => ackL_unregulated(3),
          regulated_req => reqL(3),
          regulated_ack => ackL(3),
          release_req => reqR(3),
          release_ack => ackR(3),
          clk => clk, reset => reset); -- 
      ApFloatMul_group_19_accessRegulator_4: access_regulator_base generic map (name => "ApFloatMul_group_19_accessRegulator_4", num_slots => 1) -- 
        port map (req => reqL_unregulated(4), -- 
          ack => ackL_unregulated(4),
          regulated_req => reqL(4),
          regulated_ack => ackL(4),
          release_req => reqR(4),
          release_ack => ackR(4),
          clk => clk, reset => reset); -- 
      ApFloatMul_group_19_accessRegulator_5: access_regulator_base generic map (name => "ApFloatMul_group_19_accessRegulator_5", num_slots => 1) -- 
        port map (req => reqL_unregulated(5), -- 
          ack => ackL_unregulated(5),
          regulated_req => reqL(5),
          regulated_ack => ackL(5),
          release_req => reqR(5),
          release_ack => ackR(5),
          clk => clk, reset => reset); -- 
      ApFloatMul_group_19_accessRegulator_6: access_regulator_base generic map (name => "ApFloatMul_group_19_accessRegulator_6", num_slots => 1) -- 
        port map (req => reqL_unregulated(6), -- 
          ack => ackL_unregulated(6),
          regulated_req => reqL(6),
          regulated_ack => ackL(6),
          release_req => reqR(6),
          release_ack => ackR(6),
          clk => clk, reset => reset); -- 
      ApFloatMul_group_19_accessRegulator_7: access_regulator_base generic map (name => "ApFloatMul_group_19_accessRegulator_7", num_slots => 1) -- 
        port map (req => reqL_unregulated(7), -- 
          ack => ackL_unregulated(7),
          regulated_req => reqL(7),
          regulated_ack => ackL(7),
          release_req => reqR(7),
          release_ack => ackR(7),
          clk => clk, reset => reset); -- 
      ApFloatMul_group_19_accessRegulator_8: access_regulator_base generic map (name => "ApFloatMul_group_19_accessRegulator_8", num_slots => 1) -- 
        port map (req => reqL_unregulated(8), -- 
          ack => ackL_unregulated(8),
          regulated_req => reqL(8),
          regulated_ack => ackL(8),
          release_req => reqR(8),
          release_ack => ackR(8),
          clk => clk, reset => reset); -- 
      ApFloatMul_group_19_accessRegulator_9: access_regulator_base generic map (name => "ApFloatMul_group_19_accessRegulator_9", num_slots => 1) -- 
        port map (req => reqL_unregulated(9), -- 
          ack => ackL_unregulated(9),
          regulated_req => reqL(9),
          regulated_ack => ackL(9),
          release_req => reqR(9),
          release_ack => ackR(9),
          clk => clk, reset => reset); -- 
      ApFloatMul_group_19_accessRegulator_10: access_regulator_base generic map (name => "ApFloatMul_group_19_accessRegulator_10", num_slots => 1) -- 
        port map (req => reqL_unregulated(10), -- 
          ack => ackL_unregulated(10),
          regulated_req => reqL(10),
          regulated_ack => ackL(10),
          release_req => reqR(10),
          release_ack => ackR(10),
          clk => clk, reset => reset); -- 
      gI: SplitGuardInterface generic map(nreqs => 11, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL_unregulated,
        sa_in => ackL_unregulated,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      PipedFpOp: PipelinedFPOperator -- 
        generic map( -- 
          name => "ApFloatMul_group_19",
          operator_id => "ApFloatMul",
          exponent_width => 11,
          fraction_width => 52, 
          no_arbitration => false,
          num_reqs => 11,
          use_input_buffering => true,
          detailed_buffering_per_input => inBUFs,
          detailed_buffering_per_output => outBUFs -- 
        )
        port map ( reqL => reqL , ackL => ackL, reqR => reqR, ackR => ackR, dataL => data_in, dataR => data_out, clk => clk, reset => reset); -- 
      -- 
    end Block; -- split operator group 19
    -- shared split operator group (20) : OR_u1_u1_1699_inst 
    ApIntOr_group_20: Block -- 
      signal data_in: std_logic_vector(1 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      data_in <= iNsTr_47_1567 & iNsTr_70_1695;
      orx_xcondx_xix_xi_1700 <= data_out(0 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= OR_u1_u1_1699_inst_req_0;
      OR_u1_u1_1699_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= OR_u1_u1_1699_inst_req_1;
      OR_u1_u1_1699_inst_ack_1 <= ackR_unguarded(0);
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApIntOr",
          name => "ApIntOr_group_20",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 1,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 1, 
          num_inputs    => 2,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 1,
          constant_operand => "0",
          constant_width => 1,
          buffering  => 1,
          flow_through => false,
          use_constant  => false
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 20
    -- shared split operator group (21) : OR_u64_u64_1618_inst 
    ApIntOr_group_21: Block -- 
      signal data_in: std_logic_vector(63 downto 0);
      signal data_out: std_logic_vector(63 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      data_in <= tmp15x_xix_xi_1549;
      iNsTr_57_1619 <= data_out(63 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= OR_u64_u64_1618_inst_req_0;
      OR_u64_u64_1618_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= OR_u64_u64_1618_inst_req_1;
      OR_u64_u64_1618_inst_ack_1 <= ackR_unguarded(0);
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApIntOr",
          name => "ApIntOr_group_21",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 64,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 64,
          constant_operand => "0011111111100000000000000000000000000000000000000000000000000000",
          constant_width => 64,
          buffering  => 1,
          flow_through => false,
          use_constant  => true
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 21
    -- shared split operator group (22) : OR_u64_u64_1728_inst 
    ApIntOr_group_22: Block -- 
      signal data_in: std_logic_vector(127 downto 0);
      signal data_out: std_logic_vector(63 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      data_in <= iNsTr_56_1606 & iNsTr_95_1718;
      iNsTr_97_1729 <= data_out(63 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= OR_u64_u64_1728_inst_req_0;
      OR_u64_u64_1728_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= OR_u64_u64_1728_inst_req_1;
      OR_u64_u64_1728_inst_ack_1 <= ackR_unguarded(0);
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApIntOr",
          name => "ApIntOr_group_22",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 64,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 64, 
          num_inputs    => 2,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 64,
          constant_operand => "0",
          constant_width => 1,
          buffering  => 1,
          flow_through => false,
          use_constant  => false
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 22
    -- shared split operator group (23) : OR_u64_u64_1778_inst 
    ApIntOr_group_23: Block -- 
      signal data_in: std_logic_vector(127 downto 0);
      signal data_out: std_logic_vector(63 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      data_in <= iNsTr_83_1756 & iNsTr_85_1774;
      iNsTr_86_1779 <= data_out(63 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= OR_u64_u64_1778_inst_req_0;
      OR_u64_u64_1778_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= OR_u64_u64_1778_inst_req_1;
      OR_u64_u64_1778_inst_ack_1 <= ackR_unguarded(0);
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApIntOr",
          name => "ApIntOr_group_23",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 64,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 64, 
          num_inputs    => 2,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 64,
          constant_operand => "0",
          constant_width => 1,
          buffering  => 1,
          flow_through => false,
          use_constant  => false
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 23
    -- shared split operator group (24) : OR_u64_u64_1975_inst 
    ApIntOr_group_24: Block -- 
      signal data_in: std_logic_vector(127 downto 0);
      signal data_out: std_logic_vector(63 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      data_in <= iNsTr_113_1958 & iNsTr_114_1971;
      iNsTr_115_1976 <= data_out(63 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= OR_u64_u64_1975_inst_req_0;
      OR_u64_u64_1975_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= OR_u64_u64_1975_inst_req_1;
      OR_u64_u64_1975_inst_ack_1 <= ackR_unguarded(0);
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApIntOr",
          name => "ApIntOr_group_24",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 64,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 64, 
          num_inputs    => 2,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 64,
          constant_operand => "0",
          constant_width => 1,
          buffering  => 1,
          flow_through => false,
          use_constant  => false
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 24
    -- shared split operator group (25) : SGT_f32_u1_1250_inst 
    ApFloatUgt_group_25: Block -- 
      signal data_in: std_logic_vector(63 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      data_in <= speed_refx_x1_1204 & iNsTr_8_1223;
      iNsTr_15_1251 <= data_out(0 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= SGT_f32_u1_1250_inst_req_0;
      SGT_f32_u1_1250_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= SGT_f32_u1_1250_inst_req_1;
      SGT_f32_u1_1250_inst_ack_1 <= ackR_unguarded(0);
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApFloatUgt",
          name => "ApFloatUgt_group_25",
          input1_is_int => false, 
          input1_characteristic_width => 8, 
          input1_mantissa_width    => 23, 
          iwidth_1  => 32,
          input2_is_int => false, 
          input2_characteristic_width => 8, 
          input2_mantissa_width => 23, 
          iwidth_2      => 32, 
          num_inputs    => 2,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 1,
          constant_operand => "0",
          constant_width => 1,
          buffering  => 1,
          flow_through => false,
          use_constant  => false
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 25
    -- shared split operator group (26) : SGT_f32_u1_1369_inst 
    ApFloatUgt_group_26: Block -- 
      signal data_in: std_logic_vector(31 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      data_in <= iNsTr_27_1351;
      iNsTr_35_1370 <= data_out(0 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= SGT_f32_u1_1369_inst_req_0;
      SGT_f32_u1_1369_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= SGT_f32_u1_1369_inst_req_1;
      SGT_f32_u1_1369_inst_ack_1 <= ackR_unguarded(0);
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApFloatUgt",
          name => "ApFloatUgt_group_26",
          input1_is_int => false, 
          input1_characteristic_width => 8, 
          input1_mantissa_width    => 23, 
          iwidth_1  => 32,
          input2_is_int => false, 
          input2_characteristic_width => 8, 
          input2_mantissa_width => 23, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 1,
          constant_operand => "01000010001000000000000000000000",
          constant_width => 32,
          buffering  => 1,
          flow_through => false,
          use_constant  => true
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 26
    -- shared split operator group (27) : SGT_f32_u1_1827_inst 
    ApFloatUgt_group_27: Block -- 
      signal data_in: std_logic_vector(31 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      data_in <= iNsTr_91_1809;
      iNsTr_105_1828 <= data_out(0 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= SGT_f32_u1_1827_inst_req_0;
      SGT_f32_u1_1827_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= SGT_f32_u1_1827_inst_req_1;
      SGT_f32_u1_1827_inst_ack_1 <= ackR_unguarded(0);
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApFloatUgt",
          name => "ApFloatUgt_group_27",
          input1_is_int => false, 
          input1_characteristic_width => 8, 
          input1_mantissa_width    => 23, 
          iwidth_1  => 32,
          input2_is_int => false, 
          input2_characteristic_width => 8, 
          input2_mantissa_width => 23, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 1,
          constant_operand => "00111111100000000000000000000000",
          constant_width => 32,
          buffering  => 1,
          flow_through => false,
          use_constant  => true
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 27
    -- shared split operator group (28) : SGT_f32_u1_1877_inst 
    ApFloatUgt_group_28: Block -- 
      signal data_in: std_logic_vector(31 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      data_in <= iNsTr_102_1859;
      iNsTr_110_1878 <= data_out(0 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= SGT_f32_u1_1877_inst_req_0;
      SGT_f32_u1_1877_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= SGT_f32_u1_1877_inst_req_1;
      SGT_f32_u1_1877_inst_ack_1 <= ackR_unguarded(0);
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApFloatUgt",
          name => "ApFloatUgt_group_28",
          input1_is_int => false, 
          input1_characteristic_width => 8, 
          input1_mantissa_width    => 23, 
          iwidth_1  => 32,
          input2_is_int => false, 
          input2_characteristic_width => 8, 
          input2_mantissa_width => 23, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 1,
          constant_operand => "01000000000000000000000000000000",
          constant_width => 32,
          buffering  => 1,
          flow_through => false,
          use_constant  => true
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 28
    -- shared split operator group (29) : SGT_f64_u1_1319_inst 
    ApFloatUgt_group_29: Block -- 
      signal data_in: std_logic_vector(63 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      data_in <= iNsTr_21_1301;
      iNsTr_30_1320 <= data_out(0 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= SGT_f64_u1_1319_inst_req_0;
      SGT_f64_u1_1319_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= SGT_f64_u1_1319_inst_req_1;
      SGT_f64_u1_1319_inst_ack_1 <= ackR_unguarded(0);
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApFloatUgt",
          name => "ApFloatUgt_group_29",
          input1_is_int => false, 
          input1_characteristic_width => 11, 
          input1_mantissa_width    => 52, 
          iwidth_1  => 64,
          input2_is_int => false, 
          input2_characteristic_width => 11, 
          input2_mantissa_width => 52, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 1,
          constant_operand => "0100000000110100000000000000000000000000000000000000000000000000",
          constant_width => 64,
          buffering  => 1,
          flow_through => false,
          use_constant  => true
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 29
    -- shared split operator group (30) : SGT_f64_u1_1413_inst 
    ApFloatUgt_group_30: Block -- 
      signal data_in: std_logic_vector(63 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      data_in <= iNsTr_32_1408;
      iNsTr_33_1414 <= data_out(0 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= SGT_f64_u1_1413_inst_req_0;
      SGT_f64_u1_1413_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= SGT_f64_u1_1413_inst_req_1;
      SGT_f64_u1_1413_inst_ack_1 <= ackR_unguarded(0);
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApFloatUgt",
          name => "ApFloatUgt_group_30",
          input1_is_int => false, 
          input1_characteristic_width => 11, 
          input1_mantissa_width    => 52, 
          iwidth_1  => 64,
          input2_is_int => false, 
          input2_characteristic_width => 11, 
          input2_mantissa_width => 52, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 1,
          constant_operand => "0100000010011111010000000000000000000000000000000000000000000000",
          constant_width => 64,
          buffering  => 1,
          flow_through => false,
          use_constant  => true
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 30
    -- shared split operator group (31) : SGT_f64_u1_1426_inst 
    ApFloatUgt_group_31: Block -- 
      signal data_in: std_logic_vector(63 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      data_in <= iNsTr_32_1408;
      iNsTr_38_1427 <= data_out(0 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= SGT_f64_u1_1426_inst_req_0;
      SGT_f64_u1_1426_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= SGT_f64_u1_1426_inst_req_1;
      SGT_f64_u1_1426_inst_ack_1 <= ackR_unguarded(0);
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApFloatUgt",
          name => "ApFloatUgt_group_31",
          input1_is_int => false, 
          input1_characteristic_width => 11, 
          input1_mantissa_width    => 52, 
          iwidth_1  => 64,
          input2_is_int => false, 
          input2_characteristic_width => 11, 
          input2_mantissa_width => 52, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 1,
          constant_operand => "0100000010100011100010000000000000000000000000000000000000000000",
          constant_width => 64,
          buffering  => 1,
          flow_through => false,
          use_constant  => true
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 31
    -- shared split operator group (32) : SGT_f64_u1_1459_inst 
    ApFloatUgt_group_32: Block -- 
      signal data_in: std_logic_vector(63 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      data_in <= iNsTr_32_1408;
      iNsTr_50_1460 <= data_out(0 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= SGT_f64_u1_1459_inst_req_0;
      SGT_f64_u1_1459_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= SGT_f64_u1_1459_inst_req_1;
      SGT_f64_u1_1459_inst_ack_1 <= ackR_unguarded(0);
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApFloatUgt",
          name => "ApFloatUgt_group_32",
          input1_is_int => false, 
          input1_characteristic_width => 11, 
          input1_mantissa_width    => 52, 
          iwidth_1  => 64,
          input2_is_int => false, 
          input2_characteristic_width => 11, 
          input2_mantissa_width => 52, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 1,
          constant_operand => "0100000010100111011100000000000000000000000000000000000000000000",
          constant_width => 64,
          buffering  => 1,
          flow_through => false,
          use_constant  => true
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 32
    -- shared split operator group (33) : SLT_f32_u1_1230_inst 
    ApFloatUlt_group_33: Block -- 
      signal data_in: std_logic_vector(63 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      data_in <= speed_refx_x1_1204 & iNsTr_8_1223;
      iNsTr_11_1231 <= data_out(0 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= SLT_f32_u1_1230_inst_req_0;
      SLT_f32_u1_1230_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= SLT_f32_u1_1230_inst_req_1;
      SLT_f32_u1_1230_inst_ack_1 <= ackR_unguarded(0);
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApFloatUlt",
          name => "ApFloatUlt_group_33",
          input1_is_int => false, 
          input1_characteristic_width => 8, 
          input1_mantissa_width    => 23, 
          iwidth_1  => 32,
          input2_is_int => false, 
          input2_characteristic_width => 8, 
          input2_mantissa_width => 23, 
          iwidth_2      => 32, 
          num_inputs    => 2,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 1,
          constant_operand => "0",
          constant_width => 1,
          buffering  => 1,
          flow_through => false,
          use_constant  => false
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 33
    -- shared split operator group (34) : SLT_f32_u1_1356_inst 
    ApFloatUlt_group_34: Block -- 
      signal data_in: std_logic_vector(31 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      data_in <= iNsTr_27_1351;
      iNsTr_28_1357 <= data_out(0 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= SLT_f32_u1_1356_inst_req_0;
      SLT_f32_u1_1356_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= SLT_f32_u1_1356_inst_req_1;
      SLT_f32_u1_1356_inst_ack_1 <= ackR_unguarded(0);
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApFloatUlt",
          name => "ApFloatUlt_group_34",
          input1_is_int => false, 
          input1_characteristic_width => 8, 
          input1_mantissa_width    => 23, 
          iwidth_1  => 32,
          input2_is_int => false, 
          input2_characteristic_width => 8, 
          input2_mantissa_width => 23, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 1,
          constant_operand => "11000010001000000000000000000000",
          constant_width => 32,
          buffering  => 1,
          flow_through => false,
          use_constant  => true
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 34
    -- shared split operator group (35) : SLT_f32_u1_1814_inst 
    ApFloatUlt_group_35: Block -- 
      signal data_in: std_logic_vector(31 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      data_in <= iNsTr_91_1809;
      iNsTr_92_1815 <= data_out(0 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= SLT_f32_u1_1814_inst_req_0;
      SLT_f32_u1_1814_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= SLT_f32_u1_1814_inst_req_1;
      SLT_f32_u1_1814_inst_ack_1 <= ackR_unguarded(0);
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApFloatUlt",
          name => "ApFloatUlt_group_35",
          input1_is_int => false, 
          input1_characteristic_width => 8, 
          input1_mantissa_width    => 23, 
          iwidth_1  => 32,
          input2_is_int => false, 
          input2_characteristic_width => 8, 
          input2_mantissa_width => 23, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 1,
          constant_operand => "10111111100000000000000000000000",
          constant_width => 32,
          buffering  => 1,
          flow_through => false,
          use_constant  => true
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 35
    -- shared split operator group (36) : SLT_f32_u1_1864_inst 
    ApFloatUlt_group_36: Block -- 
      signal data_in: std_logic_vector(31 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      data_in <= iNsTr_102_1859;
      iNsTr_103_1865 <= data_out(0 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= SLT_f32_u1_1864_inst_req_0;
      SLT_f32_u1_1864_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= SLT_f32_u1_1864_inst_req_1;
      SLT_f32_u1_1864_inst_ack_1 <= ackR_unguarded(0);
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApFloatUlt",
          name => "ApFloatUlt_group_36",
          input1_is_int => false, 
          input1_characteristic_width => 8, 
          input1_mantissa_width    => 23, 
          iwidth_1  => 32,
          input2_is_int => false, 
          input2_characteristic_width => 8, 
          input2_mantissa_width => 23, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 1,
          constant_operand => "11000000000000000000000000000000",
          constant_width => 32,
          buffering  => 1,
          flow_through => false,
          use_constant  => true
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 36
    -- shared split operator group (37) : SLT_f64_u1_1306_inst 
    ApFloatUlt_group_37: Block -- 
      signal data_in: std_logic_vector(63 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      data_in <= iNsTr_21_1301;
      iNsTr_22_1307 <= data_out(0 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= SLT_f64_u1_1306_inst_req_0;
      SLT_f64_u1_1306_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= SLT_f64_u1_1306_inst_req_1;
      SLT_f64_u1_1306_inst_ack_1 <= ackR_unguarded(0);
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApFloatUlt",
          name => "ApFloatUlt_group_37",
          input1_is_int => false, 
          input1_characteristic_width => 11, 
          input1_mantissa_width    => 52, 
          iwidth_1  => 64,
          input2_is_int => false, 
          input2_characteristic_width => 11, 
          input2_mantissa_width => 52, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 1,
          constant_operand => "1100000000110100000000000000000000000000000000000000000000000000",
          constant_width => 64,
          buffering  => 1,
          flow_through => false,
          use_constant  => true
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 37
    -- shared split operator group (38) : SUB_f32_f32_1791_inst SUB_f32_f32_1279_inst 
    ApFloatSub_group_38: Block -- 
      signal data_in: std_logic_vector(127 downto 0);
      signal data_out: std_logic_vector(63 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 1 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 1 downto 0);
      signal reqL_unregulated, ackL_unregulated : BooleanArray( 1 downto 0);
      signal guard_vector : std_logic_vector( 1 downto 0);
      constant inBUFs : IntegerArray(1 downto 0) := (1 => 1, 0 => 1);
      constant outBUFs : IntegerArray(1 downto 0) := (1 => 1, 0 => 1);
      constant guardFlags : BooleanArray(1 downto 0) := (0 => false, 1 => false);
      constant guardBuffering: IntegerArray(1 downto 0)  := (0 => 1, 1 => 1);
      -- 
    begin -- 
      data_in <= flux_refx_x0_1508 & iNsTr_40_1524 & speed_refx_x0_1267 & iNsTr_6_1220;
      iNsTr_88_1792 <= data_out(63 downto 32);
      iNsTr_17_1280 <= data_out(31 downto 0);
      guard_vector(0)  <=  '1';
      guard_vector(1)  <=  '1';
      reqL_unguarded(1) <= SUB_f32_f32_1791_inst_req_0;
      reqL_unguarded(0) <= SUB_f32_f32_1279_inst_req_0;
      SUB_f32_f32_1791_inst_ack_0 <= ackL_unguarded(1);
      SUB_f32_f32_1279_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(1) <= SUB_f32_f32_1791_inst_req_1;
      reqR_unguarded(0) <= SUB_f32_f32_1279_inst_req_1;
      SUB_f32_f32_1791_inst_ack_1 <= ackR_unguarded(1);
      SUB_f32_f32_1279_inst_ack_1 <= ackR_unguarded(0);
      ApFloatSub_group_38_accessRegulator_0: access_regulator_base generic map (name => "ApFloatSub_group_38_accessRegulator_0", num_slots => 1) -- 
        port map (req => reqL_unregulated(0), -- 
          ack => ackL_unregulated(0),
          regulated_req => reqL(0),
          regulated_ack => ackL(0),
          release_req => reqR(0),
          release_ack => ackR(0),
          clk => clk, reset => reset); -- 
      ApFloatSub_group_38_accessRegulator_1: access_regulator_base generic map (name => "ApFloatSub_group_38_accessRegulator_1", num_slots => 1) -- 
        port map (req => reqL_unregulated(1), -- 
          ack => ackL_unregulated(1),
          regulated_req => reqL(1),
          regulated_ack => ackL(1),
          release_req => reqR(1),
          release_ack => ackR(1),
          clk => clk, reset => reset); -- 
      gI: SplitGuardInterface generic map(nreqs => 2, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL_unregulated,
        sa_in => ackL_unregulated,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      PipedFpOp: PipelinedFPOperator -- 
        generic map( -- 
          name => "ApFloatSub_group_38",
          operator_id => "ApFloatSub",
          exponent_width => 8,
          fraction_width => 23, 
          no_arbitration => false,
          num_reqs => 2,
          use_input_buffering => true,
          detailed_buffering_per_input => inBUFs,
          detailed_buffering_per_output => outBUFs -- 
        )
        port map ( reqL => reqL , ackL => ackL, reqR => reqR, ackR => ackR, dataL => data_in, dataR => data_out, clk => clk, reset => reset); -- 
      -- 
    end Block; -- split operator group 38
    -- shared split operator group (39) : SUB_f64_f64_1667_inst SUB_f64_f64_1651_inst SUB_f64_f64_1683_inst SUB_f64_f64_1723_inst SUB_f64_f64_1640_inst 
    ApFloatSub_group_39: Block -- 
      signal data_in: std_logic_vector(639 downto 0);
      signal data_out: std_logic_vector(319 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 4 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 4 downto 0);
      signal reqL_unregulated, ackL_unregulated : BooleanArray( 4 downto 0);
      signal guard_vector : std_logic_vector( 4 downto 0);
      constant inBUFs : IntegerArray(4 downto 0) := (4 => 1, 3 => 1, 2 => 1, 1 => 1, 0 => 1);
      constant outBUFs : IntegerArray(4 downto 0) := (4 => 1, 3 => 1, 2 => 1, 1 => 1, 0 => 1);
      constant guardFlags : BooleanArray(4 downto 0) := (0 => false, 1 => false, 2 => false, 3 => false, 4 => false);
      constant guardBuffering: IntegerArray(4 downto 0)  := (0 => 1, 1 => 1, 2 => 1, 3 => 1, 4 => 1);
      -- 
    begin -- 
      data_in <= type_cast_1665_wire_constant & iNsTr_64_1662 & type_cast_1649_wire_constant & iNsTr_61_1646 & type_cast_1681_wire_constant & iNsTr_67_1678 & type_cast_1721_wire_constant & iNsTr_94_1712 & type_cast_1638_wire_constant & iNsTr_59_1635;
      iNsTr_65_1668 <= data_out(319 downto 256);
      iNsTr_62_1652 <= data_out(255 downto 192);
      iNsTr_68_1684 <= data_out(191 downto 128);
      iNsTr_96_1724 <= data_out(127 downto 64);
      iNsTr_60_1641 <= data_out(63 downto 0);
      guard_vector(0)  <=  '1';
      guard_vector(1)  <=  '1';
      guard_vector(2)  <=  '1';
      guard_vector(3)  <=  '1';
      guard_vector(4)  <=  '1';
      reqL_unguarded(4) <= SUB_f64_f64_1667_inst_req_0;
      reqL_unguarded(3) <= SUB_f64_f64_1651_inst_req_0;
      reqL_unguarded(2) <= SUB_f64_f64_1683_inst_req_0;
      reqL_unguarded(1) <= SUB_f64_f64_1723_inst_req_0;
      reqL_unguarded(0) <= SUB_f64_f64_1640_inst_req_0;
      SUB_f64_f64_1667_inst_ack_0 <= ackL_unguarded(4);
      SUB_f64_f64_1651_inst_ack_0 <= ackL_unguarded(3);
      SUB_f64_f64_1683_inst_ack_0 <= ackL_unguarded(2);
      SUB_f64_f64_1723_inst_ack_0 <= ackL_unguarded(1);
      SUB_f64_f64_1640_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(4) <= SUB_f64_f64_1667_inst_req_1;
      reqR_unguarded(3) <= SUB_f64_f64_1651_inst_req_1;
      reqR_unguarded(2) <= SUB_f64_f64_1683_inst_req_1;
      reqR_unguarded(1) <= SUB_f64_f64_1723_inst_req_1;
      reqR_unguarded(0) <= SUB_f64_f64_1640_inst_req_1;
      SUB_f64_f64_1667_inst_ack_1 <= ackR_unguarded(4);
      SUB_f64_f64_1651_inst_ack_1 <= ackR_unguarded(3);
      SUB_f64_f64_1683_inst_ack_1 <= ackR_unguarded(2);
      SUB_f64_f64_1723_inst_ack_1 <= ackR_unguarded(1);
      SUB_f64_f64_1640_inst_ack_1 <= ackR_unguarded(0);
      ApFloatSub_group_39_accessRegulator_0: access_regulator_base generic map (name => "ApFloatSub_group_39_accessRegulator_0", num_slots => 1) -- 
        port map (req => reqL_unregulated(0), -- 
          ack => ackL_unregulated(0),
          regulated_req => reqL(0),
          regulated_ack => ackL(0),
          release_req => reqR(0),
          release_ack => ackR(0),
          clk => clk, reset => reset); -- 
      ApFloatSub_group_39_accessRegulator_1: access_regulator_base generic map (name => "ApFloatSub_group_39_accessRegulator_1", num_slots => 1) -- 
        port map (req => reqL_unregulated(1), -- 
          ack => ackL_unregulated(1),
          regulated_req => reqL(1),
          regulated_ack => ackL(1),
          release_req => reqR(1),
          release_ack => ackR(1),
          clk => clk, reset => reset); -- 
      ApFloatSub_group_39_accessRegulator_2: access_regulator_base generic map (name => "ApFloatSub_group_39_accessRegulator_2", num_slots => 1) -- 
        port map (req => reqL_unregulated(2), -- 
          ack => ackL_unregulated(2),
          regulated_req => reqL(2),
          regulated_ack => ackL(2),
          release_req => reqR(2),
          release_ack => ackR(2),
          clk => clk, reset => reset); -- 
      ApFloatSub_group_39_accessRegulator_3: access_regulator_base generic map (name => "ApFloatSub_group_39_accessRegulator_3", num_slots => 1) -- 
        port map (req => reqL_unregulated(3), -- 
          ack => ackL_unregulated(3),
          regulated_req => reqL(3),
          regulated_ack => ackL(3),
          release_req => reqR(3),
          release_ack => ackR(3),
          clk => clk, reset => reset); -- 
      ApFloatSub_group_39_accessRegulator_4: access_regulator_base generic map (name => "ApFloatSub_group_39_accessRegulator_4", num_slots => 1) -- 
        port map (req => reqL_unregulated(4), -- 
          ack => ackL_unregulated(4),
          regulated_req => reqL(4),
          regulated_ack => ackL(4),
          release_req => reqR(4),
          release_ack => ackR(4),
          clk => clk, reset => reset); -- 
      gI: SplitGuardInterface generic map(nreqs => 5, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL_unregulated,
        sa_in => ackL_unregulated,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      PipedFpOp: PipelinedFPOperator -- 
        generic map( -- 
          name => "ApFloatSub_group_39",
          operator_id => "ApFloatSub",
          exponent_width => 11,
          fraction_width => 52, 
          no_arbitration => false,
          num_reqs => 5,
          use_input_buffering => true,
          detailed_buffering_per_input => inBUFs,
          detailed_buffering_per_output => outBUFs -- 
        )
        port map ( reqL => reqL , ackL => ackL, reqR => reqR, ackR => ackR, dataL => data_in, dataR => data_out, clk => clk, reset => reset); -- 
      -- 
    end Block; -- split operator group 39
    -- shared split operator group (40) : SUB_u64_u64_1591_inst 
    ApIntSub_group_40: Block -- 
      signal data_in: std_logic_vector(127 downto 0);
      signal data_out: std_logic_vector(63 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      data_in <= type_cast_1589_wire_constant & iNsTr_72_1580;
      iNsTr_73_1592 <= data_out(63 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= SUB_u64_u64_1591_inst_req_0;
      SUB_u64_u64_1591_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= SUB_u64_u64_1591_inst_req_1;
      SUB_u64_u64_1591_inst_ack_1 <= ackR_unguarded(0);
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApIntSub",
          name => "ApIntSub_group_40",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 64,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 64, 
          num_inputs    => 2,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 64,
          constant_operand => "0",
          constant_width => 1,
          buffering  => 1,
          flow_through => false,
          use_constant  => false
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 40
    -- shared split operator group (41) : XOR_u64_u64_1767_inst 
    ApIntXor_group_41: Block -- 
      signal data_in: std_logic_vector(127 downto 0);
      signal data_out: std_logic_vector(63 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      data_in <= torque_refx_x0_1394 & tmp15x_xix_xi_1549;
      iNsTr_84_1768 <= data_out(63 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= XOR_u64_u64_1767_inst_req_0;
      XOR_u64_u64_1767_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= XOR_u64_u64_1767_inst_req_1;
      XOR_u64_u64_1767_inst_ack_1 <= ackR_unguarded(0);
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApIntXor",
          name => "ApIntXor_group_41",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 64,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 64, 
          num_inputs    => 2,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 64,
          constant_operand => "0",
          constant_width => 1,
          buffering  => 1,
          flow_through => false,
          use_constant  => false
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 41
    -- shared split operator group (42) : type_cast_1300_inst 
    ApFloatResize_group_42: Block -- 
      signal data_in: std_logic_vector(31 downto 0);
      signal data_out: std_logic_vector(63 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      data_in <= iNsTr_20_1297;
      iNsTr_21_1301 <= data_out(63 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= type_cast_1300_inst_req_0;
      type_cast_1300_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= type_cast_1300_inst_req_1;
      type_cast_1300_inst_ack_1 <= ackR_unguarded(0);
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApFloatResize",
          name => "ApFloatResize_group_42",
          input1_is_int => false, 
          input1_characteristic_width => 8, 
          input1_mantissa_width    => 23, 
          iwidth_1  => 32,
          input2_is_int => false, 
          input2_characteristic_width => 8, 
          input2_mantissa_width => 23, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => false,
          output_characteristic_width  => 11, 
          output_mantissa_width => 52, 
          owidth => 64,
          constant_operand => "0",
          constant_width => 1,
          buffering  => 1,
          flow_through => false,
          use_constant  => false
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 42
    -- shared split operator group (43) : type_cast_1386_inst 
    ApFloatResize_group_43: Block -- 
      signal data_in: std_logic_vector(31 downto 0);
      signal data_out: std_logic_vector(63 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      data_in <= phitmp4_1383;
      phitmp5_1387 <= data_out(63 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= type_cast_1386_inst_req_0;
      type_cast_1386_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= type_cast_1386_inst_req_1;
      type_cast_1386_inst_ack_1 <= ackR_unguarded(0);
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApFloatResize",
          name => "ApFloatResize_group_43",
          input1_is_int => false, 
          input1_characteristic_width => 8, 
          input1_mantissa_width    => 23, 
          iwidth_1  => 32,
          input2_is_int => false, 
          input2_characteristic_width => 8, 
          input2_mantissa_width => 23, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => false,
          output_characteristic_width  => 11, 
          output_mantissa_width => 52, 
          owidth => 64,
          constant_operand => "0",
          constant_width => 1,
          buffering  => 1,
          flow_through => false,
          use_constant  => false
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 43
    -- shared split operator group (44) : type_cast_1407_inst 
    ApFloatResize_group_44: Block -- 
      signal data_in: std_logic_vector(31 downto 0);
      signal data_out: std_logic_vector(63 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      data_in <= speed_refx_x0_1267;
      iNsTr_32_1408 <= data_out(63 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= type_cast_1407_inst_req_0;
      type_cast_1407_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= type_cast_1407_inst_req_1;
      type_cast_1407_inst_ack_1 <= ackR_unguarded(0);
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApFloatResize",
          name => "ApFloatResize_group_44",
          input1_is_int => false, 
          input1_characteristic_width => 8, 
          input1_mantissa_width    => 23, 
          iwidth_1  => 32,
          input2_is_int => false, 
          input2_characteristic_width => 8, 
          input2_mantissa_width => 23, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => false,
          output_characteristic_width  => 11, 
          output_mantissa_width => 52, 
          owidth => 64,
          constant_operand => "0",
          constant_width => 1,
          buffering  => 1,
          flow_through => false,
          use_constant  => false
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 44
    -- shared split operator group (45) : type_cast_1544_inst 
    ApFloatResize_group_45: Block -- 
      signal data_in: std_logic_vector(31 downto 0);
      signal data_out: std_logic_vector(63 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      data_in <= iNsTr_43_1541;
      iNsTr_44_1545 <= data_out(63 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= type_cast_1544_inst_req_0;
      type_cast_1544_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= type_cast_1544_inst_req_1;
      type_cast_1544_inst_ack_1 <= ackR_unguarded(0);
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApFloatResize",
          name => "ApFloatResize_group_45",
          input1_is_int => false, 
          input1_characteristic_width => 8, 
          input1_mantissa_width    => 23, 
          iwidth_1  => 32,
          input2_is_int => false, 
          input2_characteristic_width => 8, 
          input2_mantissa_width => 23, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => false,
          output_characteristic_width  => 11, 
          output_mantissa_width => 52, 
          owidth => 64,
          constant_operand => "0",
          constant_width => 1,
          buffering  => 1,
          flow_through => false,
          use_constant  => false
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 45
    -- shared split operator group (46) : type_cast_1786_inst 
    ApFloatResize_group_46: Block -- 
      signal data_in: std_logic_vector(63 downto 0);
      signal data_out: std_logic_vector(31 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      data_in <= tmp4x_xix_xi_1783;
      iNsTr_87_1787 <= data_out(31 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= type_cast_1786_inst_req_0;
      type_cast_1786_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= type_cast_1786_inst_req_1;
      type_cast_1786_inst_ack_1 <= ackR_unguarded(0);
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApFloatResize",
          name => "ApFloatResize_group_46",
          input1_is_int => false, 
          input1_characteristic_width => 11, 
          input1_mantissa_width    => 52, 
          iwidth_1  => 64,
          input2_is_int => false, 
          input2_characteristic_width => 11, 
          input2_mantissa_width => 52, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => false,
          output_characteristic_width  => 8, 
          output_mantissa_width => 23, 
          owidth => 32,
          constant_operand => "0",
          constant_width => 1,
          buffering  => 1,
          flow_through => false,
          use_constant  => false
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 46
    -- shared split operator group (47) : type_cast_1888_inst 
    ApFloatResize_group_47: Block -- 
      signal data_in: std_logic_vector(31 downto 0);
      signal data_out: std_logic_vector(63 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      data_in <= iNsTr_102_1859;
      phitmp_1889 <= data_out(63 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= type_cast_1888_inst_req_0;
      type_cast_1888_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= type_cast_1888_inst_req_1;
      type_cast_1888_inst_ack_1 <= ackR_unguarded(0);
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApFloatResize",
          name => "ApFloatResize_group_47",
          input1_is_int => false, 
          input1_characteristic_width => 8, 
          input1_mantissa_width    => 23, 
          iwidth_1  => 32,
          input2_is_int => false, 
          input2_characteristic_width => 8, 
          input2_mantissa_width => 23, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => false,
          output_characteristic_width  => 11, 
          output_mantissa_width => 52, 
          owidth => 64,
          constant_operand => "0",
          constant_width => 1,
          buffering  => 1,
          flow_through => false,
          use_constant  => false
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 47
    -- shared split operator group (48) : type_cast_1983_inst 
    ApFloatResize_group_48: Block -- 
      signal data_in: std_logic_vector(63 downto 0);
      signal data_out: std_logic_vector(31 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      data_in <= tmp4x_xi_1980;
      iNsTr_116_1984 <= data_out(31 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= type_cast_1983_inst_req_0;
      type_cast_1983_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= type_cast_1983_inst_req_1;
      type_cast_1983_inst_ack_1 <= ackR_unguarded(0);
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApFloatResize",
          name => "ApFloatResize_group_48",
          input1_is_int => false, 
          input1_characteristic_width => 11, 
          input1_mantissa_width    => 52, 
          iwidth_1  => 64,
          input2_is_int => false, 
          input2_characteristic_width => 11, 
          input2_mantissa_width => 52, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => false,
          output_characteristic_width  => 8, 
          output_mantissa_width => 23, 
          owidth => 32,
          constant_operand => "0",
          constant_width => 1,
          buffering  => 1,
          flow_through => false,
          use_constant  => false
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 48
    -- shared inport operator group (0) : RPIPE_in_data1_1213_inst 
    InportGroup0: Block -- 
      signal data_out: std_logic_vector(31 downto 0);
      signal reqL, ackL, reqR, ackR : BooleanArray( 0 downto 0);
      signal reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      reqL_unguarded(0) <= RPIPE_in_data1_1213_inst_req_0;
      RPIPE_in_data1_1213_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= RPIPE_in_data1_1213_inst_req_1;
      RPIPE_in_data1_1213_inst_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      iNsTr_2_1214 <= data_out(31 downto 0);
      in_data1_read_0: InputPortFullRate -- 
        generic map ( name => "in_data1_read_0", data_width => 32,  num_reqs => 1,  output_buffering => outBUFs,   no_arbitration => false)
        port map (-- 
          sample_req => reqL , 
          sample_ack => ackL, 
          update_req => reqR, 
          update_ack => ackR, 
          data => data_out, 
          oreq => in_data1_pipe_read_req(0),
          oack => in_data1_pipe_read_ack(0),
          odata => in_data1_pipe_read_data(31 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- inport group 0
    -- shared inport operator group (1) : RPIPE_in_data2_1216_inst 
    InportGroup1: Block -- 
      signal data_out: std_logic_vector(31 downto 0);
      signal reqL, ackL, reqR, ackR : BooleanArray( 0 downto 0);
      signal reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      reqL_unguarded(0) <= RPIPE_in_data2_1216_inst_req_0;
      RPIPE_in_data2_1216_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= RPIPE_in_data2_1216_inst_req_1;
      RPIPE_in_data2_1216_inst_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      iNsTr_4_1217 <= data_out(31 downto 0);
      in_data2_read_1: InputPortFullRate -- 
        generic map ( name => "in_data2_read_1", data_width => 32,  num_reqs => 1,  output_buffering => outBUFs,   no_arbitration => false)
        port map (-- 
          sample_req => reqL , 
          sample_ack => ackL, 
          update_req => reqR, 
          update_ack => ackR, 
          data => data_out, 
          oreq => in_data2_pipe_read_req(0),
          oack => in_data2_pipe_read_ack(0),
          odata => in_data2_pipe_read_data(31 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- inport group 1
    -- shared inport operator group (2) : RPIPE_in_data3_1219_inst 
    InportGroup2: Block -- 
      signal data_out: std_logic_vector(31 downto 0);
      signal reqL, ackL, reqR, ackR : BooleanArray( 0 downto 0);
      signal reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      reqL_unguarded(0) <= RPIPE_in_data3_1219_inst_req_0;
      RPIPE_in_data3_1219_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= RPIPE_in_data3_1219_inst_req_1;
      RPIPE_in_data3_1219_inst_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      iNsTr_6_1220 <= data_out(31 downto 0);
      in_data3_read_2: InputPortFullRate -- 
        generic map ( name => "in_data3_read_2", data_width => 32,  num_reqs => 1,  output_buffering => outBUFs,   no_arbitration => false)
        port map (-- 
          sample_req => reqL , 
          sample_ack => ackL, 
          update_req => reqR, 
          update_ack => ackR, 
          data => data_out, 
          oreq => in_data3_pipe_read_req(0),
          oack => in_data3_pipe_read_ack(0),
          odata => in_data3_pipe_read_data(31 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- inport group 2
    -- shared inport operator group (3) : RPIPE_in_data4_1222_inst 
    InportGroup3: Block -- 
      signal data_out: std_logic_vector(31 downto 0);
      signal reqL, ackL, reqR, ackR : BooleanArray( 0 downto 0);
      signal reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      reqL_unguarded(0) <= RPIPE_in_data4_1222_inst_req_0;
      RPIPE_in_data4_1222_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= RPIPE_in_data4_1222_inst_req_1;
      RPIPE_in_data4_1222_inst_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      iNsTr_8_1223 <= data_out(31 downto 0);
      in_data4_read_3: InputPortFullRate -- 
        generic map ( name => "in_data4_read_3", data_width => 32,  num_reqs => 1,  output_buffering => outBUFs,   no_arbitration => false)
        port map (-- 
          sample_req => reqL , 
          sample_ack => ackL, 
          update_req => reqR, 
          update_ack => ackR, 
          data => data_out, 
          oreq => in_data4_pipe_read_req(0),
          oack => in_data4_pipe_read_ack(0),
          odata => in_data4_pipe_read_data(31 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- inport group 3
    -- shared inport operator group (4) : RPIPE_in_data5_1225_inst 
    InportGroup4: Block -- 
      signal data_out: std_logic_vector(31 downto 0);
      signal reqL, ackL, reqR, ackR : BooleanArray( 0 downto 0);
      signal reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      reqL_unguarded(0) <= RPIPE_in_data5_1225_inst_req_0;
      RPIPE_in_data5_1225_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= RPIPE_in_data5_1225_inst_req_1;
      RPIPE_in_data5_1225_inst_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      iNsTr_10_1226 <= data_out(31 downto 0);
      in_data5_read_4: InputPortFullRate -- 
        generic map ( name => "in_data5_read_4", data_width => 32,  num_reqs => 1,  output_buffering => outBUFs,   no_arbitration => false)
        port map (-- 
          sample_req => reqL , 
          sample_ack => ackL, 
          update_req => reqR, 
          update_ack => ackR, 
          data => data_out, 
          oreq => in_data5_pipe_read_req(0),
          oack => in_data5_pipe_read_ack(0),
          odata => in_data5_pipe_read_data(31 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- inport group 4
    -- shared outport operator group (0) : WPIPE_out_data1_1985_inst 
    OutportGroup0: Block -- 
      signal data_in: std_logic_vector(31 downto 0);
      signal sample_req, sample_ack : BooleanArray( 0 downto 0);
      signal update_req, update_ack : BooleanArray( 0 downto 0);
      signal sample_req_unguarded, sample_ack_unguarded : BooleanArray( 0 downto 0);
      signal update_req_unguarded, update_ack_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      sample_req_unguarded(0) <= WPIPE_out_data1_1985_inst_req_0;
      WPIPE_out_data1_1985_inst_ack_0 <= sample_ack_unguarded(0);
      update_req_unguarded(0) <= WPIPE_out_data1_1985_inst_req_1;
      WPIPE_out_data1_1985_inst_ack_1 <= update_ack_unguarded(0);
      guard_vector(0)  <=  '1';
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => sample_req_unguarded,
        sr_out => sample_req,
        sa_in => sample_ack,
        sa_out => sample_ack_unguarded,
        cr_in => update_req_unguarded,
        cr_out => update_req,
        ca_in => update_ack,
        ca_out => update_ack_unguarded,
        guards => guard_vector); -- 
      data_in <= iNsTr_116_1984;
      out_data1_write_0: OutputPortFullRate -- 
        generic map ( name => "out_data1", data_width => 32, num_reqs => 1, input_buffering => inBUFs, no_arbitration => false)
        port map (--
          sample_req => sample_req , 
          sample_ack => sample_ack , 
          update_req => update_req , 
          update_ack => update_ack , 
          data => data_in, 
          oreq => out_data1_pipe_write_req(0),
          oack => out_data1_pipe_write_ack(0),
          odata => out_data1_pipe_write_data(31 downto 0),
          clk => clk, reset => reset -- 
        );-- 
      -- 
    end Block; -- outport group 0
    -- shared outport operator group (1) : WPIPE_out_data2_1988_inst 
    OutportGroup1: Block -- 
      signal data_in: std_logic_vector(31 downto 0);
      signal sample_req, sample_ack : BooleanArray( 0 downto 0);
      signal update_req, update_ack : BooleanArray( 0 downto 0);
      signal sample_req_unguarded, sample_ack_unguarded : BooleanArray( 0 downto 0);
      signal update_req_unguarded, update_ack_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      sample_req_unguarded(0) <= WPIPE_out_data2_1988_inst_req_0;
      WPIPE_out_data2_1988_inst_ack_0 <= sample_ack_unguarded(0);
      update_req_unguarded(0) <= WPIPE_out_data2_1988_inst_req_1;
      WPIPE_out_data2_1988_inst_ack_1 <= update_ack_unguarded(0);
      guard_vector(0)  <=  '1';
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => sample_req_unguarded,
        sr_out => sample_req,
        sa_in => sample_ack,
        sa_out => sample_ack_unguarded,
        cr_in => update_req_unguarded,
        cr_out => update_req,
        ca_in => update_ack,
        ca_out => update_ack_unguarded,
        guards => guard_vector); -- 
      data_in <= iNsTr_87_1787;
      out_data2_write_1: OutputPortFullRate -- 
        generic map ( name => "out_data2", data_width => 32, num_reqs => 1, input_buffering => inBUFs, no_arbitration => false)
        port map (--
          sample_req => sample_req , 
          sample_ack => sample_ack , 
          update_req => update_req , 
          update_ack => update_ack , 
          data => data_in, 
          oreq => out_data2_pipe_write_req(0),
          oack => out_data2_pipe_write_ack(0),
          odata => out_data2_pipe_write_data(31 downto 0),
          clk => clk, reset => reset -- 
        );-- 
      -- 
    end Block; -- outport group 1
    -- shared outport operator group (2) : WPIPE_out_data3_1991_inst 
    OutportGroup2: Block -- 
      signal data_in: std_logic_vector(31 downto 0);
      signal sample_req, sample_ack : BooleanArray( 0 downto 0);
      signal update_req, update_ack : BooleanArray( 0 downto 0);
      signal sample_req_unguarded, sample_ack_unguarded : BooleanArray( 0 downto 0);
      signal update_req_unguarded, update_ack_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      sample_req_unguarded(0) <= WPIPE_out_data3_1991_inst_req_0;
      WPIPE_out_data3_1991_inst_ack_0 <= sample_ack_unguarded(0);
      update_req_unguarded(0) <= WPIPE_out_data3_1991_inst_req_1;
      WPIPE_out_data3_1991_inst_ack_1 <= update_ack_unguarded(0);
      guard_vector(0)  <=  '1';
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => sample_req_unguarded,
        sr_out => sample_req,
        sa_in => sample_ack,
        sa_out => sample_ack_unguarded,
        cr_in => update_req_unguarded,
        cr_out => update_req,
        ca_in => update_ack,
        ca_out => update_ack_unguarded,
        guards => guard_vector); -- 
      data_in <= iNsTr_42_1535;
      out_data3_write_2: OutputPortFullRate -- 
        generic map ( name => "out_data3", data_width => 32, num_reqs => 1, input_buffering => inBUFs, no_arbitration => false)
        port map (--
          sample_req => sample_req , 
          sample_ack => sample_ack , 
          update_req => update_req , 
          update_ack => update_ack , 
          data => data_in, 
          oreq => out_data3_pipe_write_req(0),
          oack => out_data3_pipe_write_ack(0),
          odata => out_data3_pipe_write_data(31 downto 0),
          clk => clk, reset => reset -- 
        );-- 
      -- 
    end Block; -- outport group 2
    -- shared outport operator group (3) : WPIPE_out_data4_1994_inst 
    OutportGroup3: Block -- 
      signal data_in: std_logic_vector(31 downto 0);
      signal sample_req, sample_ack : BooleanArray( 0 downto 0);
      signal update_req, update_ack : BooleanArray( 0 downto 0);
      signal sample_req_unguarded, sample_ack_unguarded : BooleanArray( 0 downto 0);
      signal update_req_unguarded, update_ack_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      sample_req_unguarded(0) <= WPIPE_out_data4_1994_inst_req_0;
      WPIPE_out_data4_1994_inst_ack_0 <= sample_ack_unguarded(0);
      update_req_unguarded(0) <= WPIPE_out_data4_1994_inst_req_1;
      WPIPE_out_data4_1994_inst_ack_1 <= update_ack_unguarded(0);
      guard_vector(0)  <=  '1';
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => sample_req_unguarded,
        sr_out => sample_req,
        sa_in => sample_ack,
        sa_out => sample_ack_unguarded,
        cr_in => update_req_unguarded,
        cr_out => update_req,
        ca_in => update_ack,
        ca_out => update_ack_unguarded,
        guards => guard_vector); -- 
      data_in <= iNsTr_40_1524;
      out_data4_write_3: OutputPortFullRate -- 
        generic map ( name => "out_data4", data_width => 32, num_reqs => 1, input_buffering => inBUFs, no_arbitration => false)
        port map (--
          sample_req => sample_req , 
          sample_ack => sample_ack , 
          update_req => update_req , 
          update_ack => update_ack , 
          data => data_in, 
          oreq => out_data4_pipe_write_req(0),
          oack => out_data4_pipe_write_ack(0),
          odata => out_data4_pipe_write_data(31 downto 0),
          clk => clk, reset => reset -- 
        );-- 
      -- 
    end Block; -- outport group 3
    -- 
  end Block; -- data_path
  -- 
end Default;
library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.memory_subsystem_package.all;
use ahir.types.all;
use ahir.subprograms.all;
use ahir.components.all;
use ahir.basecomponents.all;
use ahir.operatorpackage.all;
use ahir.utilities.all;
use ahir.functionLibraryComponents.all;
library work;
use work.ahir_system_global_package.all;
entity ahir_system is  -- system 
  port (-- 
    clk : in std_logic;
    reset : in std_logic;
    in_data1_pipe_write_data: in std_logic_vector(31 downto 0);
    in_data1_pipe_write_req : in std_logic_vector(0 downto 0);
    in_data1_pipe_write_ack : out std_logic_vector(0 downto 0);
    in_data2_pipe_write_data: in std_logic_vector(31 downto 0);
    in_data2_pipe_write_req : in std_logic_vector(0 downto 0);
    in_data2_pipe_write_ack : out std_logic_vector(0 downto 0);
    in_data3_pipe_write_data: in std_logic_vector(31 downto 0);
    in_data3_pipe_write_req : in std_logic_vector(0 downto 0);
    in_data3_pipe_write_ack : out std_logic_vector(0 downto 0);
    in_data4_pipe_write_data: in std_logic_vector(31 downto 0);
    in_data4_pipe_write_req : in std_logic_vector(0 downto 0);
    in_data4_pipe_write_ack : out std_logic_vector(0 downto 0);
    in_data5_pipe_write_data: in std_logic_vector(31 downto 0);
    in_data5_pipe_write_req : in std_logic_vector(0 downto 0);
    in_data5_pipe_write_ack : out std_logic_vector(0 downto 0);
    out_data1_pipe_read_data: out std_logic_vector(31 downto 0);
    out_data1_pipe_read_req : in std_logic_vector(0 downto 0);
    out_data1_pipe_read_ack : out std_logic_vector(0 downto 0);
    out_data2_pipe_read_data: out std_logic_vector(31 downto 0);
    out_data2_pipe_read_req : in std_logic_vector(0 downto 0);
    out_data2_pipe_read_ack : out std_logic_vector(0 downto 0);
    out_data3_pipe_read_data: out std_logic_vector(31 downto 0);
    out_data3_pipe_read_req : in std_logic_vector(0 downto 0);
    out_data3_pipe_read_ack : out std_logic_vector(0 downto 0);
    out_data4_pipe_read_data: out std_logic_vector(31 downto 0);
    out_data4_pipe_read_req : in std_logic_vector(0 downto 0);
    out_data4_pipe_read_ack : out std_logic_vector(0 downto 0)); -- 
  -- 
end entity; 
architecture Default of ahir_system is -- system-architecture 
  -- declarations related to module vector_control_daemon
  component vector_control_daemon is -- 
    generic (tag_length : integer); 
    port ( -- 
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic;
      in_data1_pipe_read_req : out  std_logic_vector(0 downto 0);
      in_data1_pipe_read_ack : in   std_logic_vector(0 downto 0);
      in_data1_pipe_read_data : in   std_logic_vector(31 downto 0);
      in_data4_pipe_read_req : out  std_logic_vector(0 downto 0);
      in_data4_pipe_read_ack : in   std_logic_vector(0 downto 0);
      in_data4_pipe_read_data : in   std_logic_vector(31 downto 0);
      in_data2_pipe_read_req : out  std_logic_vector(0 downto 0);
      in_data2_pipe_read_ack : in   std_logic_vector(0 downto 0);
      in_data2_pipe_read_data : in   std_logic_vector(31 downto 0);
      in_data3_pipe_read_req : out  std_logic_vector(0 downto 0);
      in_data3_pipe_read_ack : in   std_logic_vector(0 downto 0);
      in_data3_pipe_read_data : in   std_logic_vector(31 downto 0);
      in_data5_pipe_read_req : out  std_logic_vector(0 downto 0);
      in_data5_pipe_read_ack : in   std_logic_vector(0 downto 0);
      in_data5_pipe_read_data : in   std_logic_vector(31 downto 0);
      out_data3_pipe_write_req : out  std_logic_vector(0 downto 0);
      out_data3_pipe_write_ack : in   std_logic_vector(0 downto 0);
      out_data3_pipe_write_data : out  std_logic_vector(31 downto 0);
      out_data4_pipe_write_req : out  std_logic_vector(0 downto 0);
      out_data4_pipe_write_ack : in   std_logic_vector(0 downto 0);
      out_data4_pipe_write_data : out  std_logic_vector(31 downto 0);
      out_data1_pipe_write_req : out  std_logic_vector(0 downto 0);
      out_data1_pipe_write_ack : in   std_logic_vector(0 downto 0);
      out_data1_pipe_write_data : out  std_logic_vector(31 downto 0);
      out_data2_pipe_write_req : out  std_logic_vector(0 downto 0);
      out_data2_pipe_write_ack : in   std_logic_vector(0 downto 0);
      out_data2_pipe_write_data : out  std_logic_vector(31 downto 0);
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) -- 
    );
    -- 
  end component;
  -- argument signals for module vector_control_daemon
  signal vector_control_daemon_tag_in    : std_logic_vector(1 downto 0) := (others => '0');
  signal vector_control_daemon_tag_out   : std_logic_vector(1 downto 0);
  signal vector_control_daemon_start_req : std_logic;
  signal vector_control_daemon_start_ack : std_logic;
  signal vector_control_daemon_fin_req   : std_logic;
  signal vector_control_daemon_fin_ack : std_logic;
  -- aggregate signals for read from pipe in_data1
  signal in_data1_pipe_read_data: std_logic_vector(31 downto 0);
  signal in_data1_pipe_read_req: std_logic_vector(0 downto 0);
  signal in_data1_pipe_read_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for read from pipe in_data2
  signal in_data2_pipe_read_data: std_logic_vector(31 downto 0);
  signal in_data2_pipe_read_req: std_logic_vector(0 downto 0);
  signal in_data2_pipe_read_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for read from pipe in_data3
  signal in_data3_pipe_read_data: std_logic_vector(31 downto 0);
  signal in_data3_pipe_read_req: std_logic_vector(0 downto 0);
  signal in_data3_pipe_read_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for read from pipe in_data4
  signal in_data4_pipe_read_data: std_logic_vector(31 downto 0);
  signal in_data4_pipe_read_req: std_logic_vector(0 downto 0);
  signal in_data4_pipe_read_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for read from pipe in_data5
  signal in_data5_pipe_read_data: std_logic_vector(31 downto 0);
  signal in_data5_pipe_read_req: std_logic_vector(0 downto 0);
  signal in_data5_pipe_read_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for write to pipe out_data1
  signal out_data1_pipe_write_data: std_logic_vector(31 downto 0);
  signal out_data1_pipe_write_req: std_logic_vector(0 downto 0);
  signal out_data1_pipe_write_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for write to pipe out_data2
  signal out_data2_pipe_write_data: std_logic_vector(31 downto 0);
  signal out_data2_pipe_write_req: std_logic_vector(0 downto 0);
  signal out_data2_pipe_write_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for write to pipe out_data3
  signal out_data3_pipe_write_data: std_logic_vector(31 downto 0);
  signal out_data3_pipe_write_req: std_logic_vector(0 downto 0);
  signal out_data3_pipe_write_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for write to pipe out_data4
  signal out_data4_pipe_write_data: std_logic_vector(31 downto 0);
  signal out_data4_pipe_write_req: std_logic_vector(0 downto 0);
  signal out_data4_pipe_write_ack: std_logic_vector(0 downto 0);
  -- 
begin -- 
  -- module vector_control_daemon
  vector_control_daemon_instance:vector_control_daemon-- 
    generic map(tag_length => 2)
    port map(-- 
      start_req => vector_control_daemon_start_req,
      start_ack => vector_control_daemon_start_ack,
      fin_req => vector_control_daemon_fin_req,
      fin_ack => vector_control_daemon_fin_ack,
      clk => clk,
      reset => reset,
      in_data1_pipe_read_req => in_data1_pipe_read_req(0 downto 0),
      in_data1_pipe_read_ack => in_data1_pipe_read_ack(0 downto 0),
      in_data1_pipe_read_data => in_data1_pipe_read_data(31 downto 0),
      in_data4_pipe_read_req => in_data4_pipe_read_req(0 downto 0),
      in_data4_pipe_read_ack => in_data4_pipe_read_ack(0 downto 0),
      in_data4_pipe_read_data => in_data4_pipe_read_data(31 downto 0),
      in_data2_pipe_read_req => in_data2_pipe_read_req(0 downto 0),
      in_data2_pipe_read_ack => in_data2_pipe_read_ack(0 downto 0),
      in_data2_pipe_read_data => in_data2_pipe_read_data(31 downto 0),
      in_data3_pipe_read_req => in_data3_pipe_read_req(0 downto 0),
      in_data3_pipe_read_ack => in_data3_pipe_read_ack(0 downto 0),
      in_data3_pipe_read_data => in_data3_pipe_read_data(31 downto 0),
      in_data5_pipe_read_req => in_data5_pipe_read_req(0 downto 0),
      in_data5_pipe_read_ack => in_data5_pipe_read_ack(0 downto 0),
      in_data5_pipe_read_data => in_data5_pipe_read_data(31 downto 0),
      out_data3_pipe_write_req => out_data3_pipe_write_req(0 downto 0),
      out_data3_pipe_write_ack => out_data3_pipe_write_ack(0 downto 0),
      out_data3_pipe_write_data => out_data3_pipe_write_data(31 downto 0),
      out_data4_pipe_write_req => out_data4_pipe_write_req(0 downto 0),
      out_data4_pipe_write_ack => out_data4_pipe_write_ack(0 downto 0),
      out_data4_pipe_write_data => out_data4_pipe_write_data(31 downto 0),
      out_data1_pipe_write_req => out_data1_pipe_write_req(0 downto 0),
      out_data1_pipe_write_ack => out_data1_pipe_write_ack(0 downto 0),
      out_data1_pipe_write_data => out_data1_pipe_write_data(31 downto 0),
      out_data2_pipe_write_req => out_data2_pipe_write_req(0 downto 0),
      out_data2_pipe_write_ack => out_data2_pipe_write_ack(0 downto 0),
      out_data2_pipe_write_data => out_data2_pipe_write_data(31 downto 0),
      tag_in => vector_control_daemon_tag_in,
      tag_out => vector_control_daemon_tag_out-- 
    ); -- 
  -- module will be run forever 
  vector_control_daemon_tag_in <= (others => '0');
  vector_control_daemon_auto_run: auto_run generic map(use_delay => true)  port map(clk => clk, reset => reset, start_req => vector_control_daemon_start_req, start_ack => vector_control_daemon_start_ack,  fin_req => vector_control_daemon_fin_req,  fin_ack => vector_control_daemon_fin_ack);
  in_data1_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe in_data1",
      num_reads => 1,
      num_writes => 1,
      data_width => 32,
      lifo_mode => false,
      depth => 1 --
    )
    port map( -- 
      read_req => in_data1_pipe_read_req,
      read_ack => in_data1_pipe_read_ack,
      read_data => in_data1_pipe_read_data,
      write_req => in_data1_pipe_write_req,
      write_ack => in_data1_pipe_write_ack,
      write_data => in_data1_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  in_data2_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe in_data2",
      num_reads => 1,
      num_writes => 1,
      data_width => 32,
      lifo_mode => false,
      depth => 1 --
    )
    port map( -- 
      read_req => in_data2_pipe_read_req,
      read_ack => in_data2_pipe_read_ack,
      read_data => in_data2_pipe_read_data,
      write_req => in_data2_pipe_write_req,
      write_ack => in_data2_pipe_write_ack,
      write_data => in_data2_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  in_data3_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe in_data3",
      num_reads => 1,
      num_writes => 1,
      data_width => 32,
      lifo_mode => false,
      depth => 1 --
    )
    port map( -- 
      read_req => in_data3_pipe_read_req,
      read_ack => in_data3_pipe_read_ack,
      read_data => in_data3_pipe_read_data,
      write_req => in_data3_pipe_write_req,
      write_ack => in_data3_pipe_write_ack,
      write_data => in_data3_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  in_data4_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe in_data4",
      num_reads => 1,
      num_writes => 1,
      data_width => 32,
      lifo_mode => false,
      depth => 1 --
    )
    port map( -- 
      read_req => in_data4_pipe_read_req,
      read_ack => in_data4_pipe_read_ack,
      read_data => in_data4_pipe_read_data,
      write_req => in_data4_pipe_write_req,
      write_ack => in_data4_pipe_write_ack,
      write_data => in_data4_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  in_data5_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe in_data5",
      num_reads => 1,
      num_writes => 1,
      data_width => 32,
      lifo_mode => false,
      depth => 1 --
    )
    port map( -- 
      read_req => in_data5_pipe_read_req,
      read_ack => in_data5_pipe_read_ack,
      read_data => in_data5_pipe_read_data,
      write_req => in_data5_pipe_write_req,
      write_ack => in_data5_pipe_write_ack,
      write_data => in_data5_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  out_data1_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe out_data1",
      num_reads => 1,
      num_writes => 1,
      data_width => 32,
      lifo_mode => false,
      depth => 1 --
    )
    port map( -- 
      read_req => out_data1_pipe_read_req,
      read_ack => out_data1_pipe_read_ack,
      read_data => out_data1_pipe_read_data,
      write_req => out_data1_pipe_write_req,
      write_ack => out_data1_pipe_write_ack,
      write_data => out_data1_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  out_data2_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe out_data2",
      num_reads => 1,
      num_writes => 1,
      data_width => 32,
      lifo_mode => false,
      depth => 1 --
    )
    port map( -- 
      read_req => out_data2_pipe_read_req,
      read_ack => out_data2_pipe_read_ack,
      read_data => out_data2_pipe_read_data,
      write_req => out_data2_pipe_write_req,
      write_ack => out_data2_pipe_write_ack,
      write_data => out_data2_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  out_data3_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe out_data3",
      num_reads => 1,
      num_writes => 1,
      data_width => 32,
      lifo_mode => false,
      depth => 1 --
    )
    port map( -- 
      read_req => out_data3_pipe_read_req,
      read_ack => out_data3_pipe_read_ack,
      read_data => out_data3_pipe_read_data,
      write_req => out_data3_pipe_write_req,
      write_ack => out_data3_pipe_write_ack,
      write_data => out_data3_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  out_data4_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe out_data4",
      num_reads => 1,
      num_writes => 1,
      data_width => 32,
      lifo_mode => false,
      depth => 1 --
    )
    port map( -- 
      read_req => out_data4_pipe_read_req,
      read_ack => out_data4_pipe_read_ack,
      read_data => out_data4_pipe_read_data,
      write_req => out_data4_pipe_write_req,
      write_ack => out_data4_pipe_write_ack,
      write_data => out_data4_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  -- 
end Default;
