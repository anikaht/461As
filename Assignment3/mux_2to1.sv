primitive mux_2to1(out, a, b, sel);
    output out;
    input a, b, sel;

    table
        0  ?   0   : 0;  
        1  ?   0   : 1;  
        ?  0   1   : 0;  
        ?  1   1   : 1;  
        0  ?   x   : x;  
        1  ?   x   : x;  

    endtable
endprimitive
