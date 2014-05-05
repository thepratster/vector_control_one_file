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
library GhdlLink;
use GhdlLink.Utility_Package.all;
use GhdlLink.Vhpi_Foreign.all;
entity ahir_system_Test_Bench is -- 
  -- 
end entity;
architecture VhpiLink of ahir_system_Test_Bench is -- 
  component ahir_system is -- 
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
  end component;
  signal clk: std_logic := '0';
  signal reset: std_logic := '1';
  signal vector_control_daemon_tag_in: std_logic_vector(1 downto 0);
  signal vector_control_daemon_tag_out: std_logic_vector(1 downto 0);
  signal vector_control_daemon_start_req : std_logic := '0';
  signal vector_control_daemon_start_ack : std_logic := '0';
  signal vector_control_daemon_fin_req   : std_logic := '0';
  signal vector_control_daemon_fin_ack   : std_logic := '0';
  -- write to pipe in_data1
  signal in_data1_pipe_write_data: std_logic_vector(31 downto 0);
  signal in_data1_pipe_write_req : std_logic_vector(0 downto 0) := (others => '0');
  signal in_data1_pipe_write_ack : std_logic_vector(0 downto 0);
  -- write to pipe in_data2
  signal in_data2_pipe_write_data: std_logic_vector(31 downto 0);
  signal in_data2_pipe_write_req : std_logic_vector(0 downto 0) := (others => '0');
  signal in_data2_pipe_write_ack : std_logic_vector(0 downto 0);
  -- write to pipe in_data3
  signal in_data3_pipe_write_data: std_logic_vector(31 downto 0);
  signal in_data3_pipe_write_req : std_logic_vector(0 downto 0) := (others => '0');
  signal in_data3_pipe_write_ack : std_logic_vector(0 downto 0);
  -- write to pipe in_data4
  signal in_data4_pipe_write_data: std_logic_vector(31 downto 0);
  signal in_data4_pipe_write_req : std_logic_vector(0 downto 0) := (others => '0');
  signal in_data4_pipe_write_ack : std_logic_vector(0 downto 0);
  -- write to pipe in_data5
  signal in_data5_pipe_write_data: std_logic_vector(31 downto 0);
  signal in_data5_pipe_write_req : std_logic_vector(0 downto 0) := (others => '0');
  signal in_data5_pipe_write_ack : std_logic_vector(0 downto 0);
  -- read from pipe out_data1
  signal out_data1_pipe_read_data: std_logic_vector(31 downto 0);
  signal out_data1_pipe_read_req : std_logic_vector(0 downto 0) := (others => '0');
  signal out_data1_pipe_read_ack : std_logic_vector(0 downto 0);
  -- read from pipe out_data2
  signal out_data2_pipe_read_data: std_logic_vector(31 downto 0);
  signal out_data2_pipe_read_req : std_logic_vector(0 downto 0) := (others => '0');
  signal out_data2_pipe_read_ack : std_logic_vector(0 downto 0);
  -- read from pipe out_data3
  signal out_data3_pipe_read_data: std_logic_vector(31 downto 0);
  signal out_data3_pipe_read_req : std_logic_vector(0 downto 0) := (others => '0');
  signal out_data3_pipe_read_ack : std_logic_vector(0 downto 0);
  -- read from pipe out_data4
  signal out_data4_pipe_read_data: std_logic_vector(31 downto 0);
  signal out_data4_pipe_read_req : std_logic_vector(0 downto 0) := (others => '0');
  signal out_data4_pipe_read_ack : std_logic_vector(0 downto 0);
  -- 
begin --
  -- clock/reset generation 
  clk <= not clk after 5 ns;
  process
  begin --
    Vhpi_Initialize;
    wait until clk = '1';
    reset <= '0';
    while true loop --
      wait until clk = '0';
      Vhpi_Listen;
      Vhpi_Send;
      --
    end loop;
    wait;
    --
  end process;
  -- connect all the top-level modules to Vhpi
  process
  variable val_string, obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("in_data1 req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      in_data1_pipe_write_req <= Unpack_String(val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("in_data1 0");
      Vhpi_Get_Port_Value(obj_ref,val_string,32);
      in_data1_pipe_write_data <= Unpack_String(val_string,32);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("in_data1 ack");
      val_string := Pack_SLV_To_Vhpi_String(in_data1_pipe_write_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      -- 
    end loop;
    --
  end process;
  process
  variable val_string, obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("in_data2 req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      in_data2_pipe_write_req <= Unpack_String(val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("in_data2 0");
      Vhpi_Get_Port_Value(obj_ref,val_string,32);
      in_data2_pipe_write_data <= Unpack_String(val_string,32);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("in_data2 ack");
      val_string := Pack_SLV_To_Vhpi_String(in_data2_pipe_write_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      -- 
    end loop;
    --
  end process;
  process
  variable val_string, obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("in_data3 req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      in_data3_pipe_write_req <= Unpack_String(val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("in_data3 0");
      Vhpi_Get_Port_Value(obj_ref,val_string,32);
      in_data3_pipe_write_data <= Unpack_String(val_string,32);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("in_data3 ack");
      val_string := Pack_SLV_To_Vhpi_String(in_data3_pipe_write_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      -- 
    end loop;
    --
  end process;
  process
  variable val_string, obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("in_data4 req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      in_data4_pipe_write_req <= Unpack_String(val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("in_data4 0");
      Vhpi_Get_Port_Value(obj_ref,val_string,32);
      in_data4_pipe_write_data <= Unpack_String(val_string,32);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("in_data4 ack");
      val_string := Pack_SLV_To_Vhpi_String(in_data4_pipe_write_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      -- 
    end loop;
    --
  end process;
  process
  variable val_string, obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("in_data5 req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      in_data5_pipe_write_req <= Unpack_String(val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("in_data5 0");
      Vhpi_Get_Port_Value(obj_ref,val_string,32);
      in_data5_pipe_write_data <= Unpack_String(val_string,32);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("in_data5 ack");
      val_string := Pack_SLV_To_Vhpi_String(in_data5_pipe_write_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      -- 
    end loop;
    --
  end process;
  process
  variable val_string, obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("out_data1 req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      out_data1_pipe_read_req <= Unpack_String(val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("out_data1 ack");
      val_string := Pack_SLV_To_Vhpi_String(out_data1_pipe_read_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("out_data1 0");
      val_string := Pack_SLV_To_Vhpi_String(out_data1_pipe_read_data);
      Vhpi_Set_Port_Value(obj_ref,val_string,32);
      -- 
    end loop;
    --
  end process;
  process
  variable val_string, obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("out_data2 req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      out_data2_pipe_read_req <= Unpack_String(val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("out_data2 ack");
      val_string := Pack_SLV_To_Vhpi_String(out_data2_pipe_read_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("out_data2 0");
      val_string := Pack_SLV_To_Vhpi_String(out_data2_pipe_read_data);
      Vhpi_Set_Port_Value(obj_ref,val_string,32);
      -- 
    end loop;
    --
  end process;
  process
  variable val_string, obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("out_data3 req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      out_data3_pipe_read_req <= Unpack_String(val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("out_data3 ack");
      val_string := Pack_SLV_To_Vhpi_String(out_data3_pipe_read_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("out_data3 0");
      val_string := Pack_SLV_To_Vhpi_String(out_data3_pipe_read_data);
      Vhpi_Set_Port_Value(obj_ref,val_string,32);
      -- 
    end loop;
    --
  end process;
  process
  variable val_string, obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("out_data4 req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      out_data4_pipe_read_req <= Unpack_String(val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("out_data4 ack");
      val_string := Pack_SLV_To_Vhpi_String(out_data4_pipe_read_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("out_data4 0");
      val_string := Pack_SLV_To_Vhpi_String(out_data4_pipe_read_data);
      Vhpi_Set_Port_Value(obj_ref,val_string,32);
      -- 
    end loop;
    --
  end process;
  ahir_system_instance: ahir_system -- 
    port map ( -- 
      clk => clk,
      reset => reset,
      in_data1_pipe_write_data  => in_data1_pipe_write_data, 
      in_data1_pipe_write_req  => in_data1_pipe_write_req, 
      in_data1_pipe_write_ack  => in_data1_pipe_write_ack,
      in_data2_pipe_write_data  => in_data2_pipe_write_data, 
      in_data2_pipe_write_req  => in_data2_pipe_write_req, 
      in_data2_pipe_write_ack  => in_data2_pipe_write_ack,
      in_data3_pipe_write_data  => in_data3_pipe_write_data, 
      in_data3_pipe_write_req  => in_data3_pipe_write_req, 
      in_data3_pipe_write_ack  => in_data3_pipe_write_ack,
      in_data4_pipe_write_data  => in_data4_pipe_write_data, 
      in_data4_pipe_write_req  => in_data4_pipe_write_req, 
      in_data4_pipe_write_ack  => in_data4_pipe_write_ack,
      in_data5_pipe_write_data  => in_data5_pipe_write_data, 
      in_data5_pipe_write_req  => in_data5_pipe_write_req, 
      in_data5_pipe_write_ack  => in_data5_pipe_write_ack,
      out_data1_pipe_read_data  => out_data1_pipe_read_data, 
      out_data1_pipe_read_req  => out_data1_pipe_read_req, 
      out_data1_pipe_read_ack  => out_data1_pipe_read_ack ,
      out_data2_pipe_read_data  => out_data2_pipe_read_data, 
      out_data2_pipe_read_req  => out_data2_pipe_read_req, 
      out_data2_pipe_read_ack  => out_data2_pipe_read_ack ,
      out_data3_pipe_read_data  => out_data3_pipe_read_data, 
      out_data3_pipe_read_req  => out_data3_pipe_read_req, 
      out_data3_pipe_read_ack  => out_data3_pipe_read_ack ,
      out_data4_pipe_read_data  => out_data4_pipe_read_data, 
      out_data4_pipe_read_req  => out_data4_pipe_read_req, 
      out_data4_pipe_read_ack  => out_data4_pipe_read_ack ); -- 
  -- 
end VhpiLink;
