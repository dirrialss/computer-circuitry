library verilog;
use verilog.vl_types.all;
entity multiplexer_8to1 is
    port(
        A               : in     vl_logic_vector(2 downto 0);
        D0              : in     vl_logic;
        D1              : in     vl_logic;
        D2              : in     vl_logic;
        D3              : in     vl_logic;
        D4              : in     vl_logic;
        D5              : in     vl_logic;
        D6              : in     vl_logic;
        D7              : in     vl_logic;
        EN              : in     vl_logic;
        Q               : out    vl_logic
    );
end multiplexer_8to1;
