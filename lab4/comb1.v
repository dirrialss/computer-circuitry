module comb1_Siukalo(x3,x2,x1,f4);
  input x3,x2,x1;
  output f4;
  assign f4=(~x3&~x2&x1)|(~x3&x2&x1)|(x3&~x2&x1)|(x3&x2&x1);
endmodule
