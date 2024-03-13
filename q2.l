/* Initialization Section */
%{
    #include <stdio.h>
%}


/* Define states */
%s q1 q2 q3 DEAD


/* Defining Rules */
%%
<INITIAL>1 BEGIN q1;
<INITIAL>0 BEGIN q3;
<INITIAL>[^01\n] BEGIN DEAD;
<INITIAL>\n BEGIN INITIAL; {printf("Accepted\n");}

<q1>1 BEGIN INITIAL;
<q1>0 BEGIN q2;
<q1>[^01\n] BEGIN DEAD;
<q1>\n BEGIN INITIAL; {printf("Rejected\n");}

<q2>1 BEGIN q3;
<q2>0 BEGIN q1;
<q2>[^01\n] BEGIN DEAD;
<q2>\n BEGIN INITIAL; {printf("Accepted\n");}

<q3>1 BEGIN q2;
<q3>0 BEGIN INITIAL;
<q3>[^01\n] BEGIN DEAD;
<q3>\n BEGIN INITIAL; {printf("Rejected\n");}

<DEAD>[^\n] BEGIN DEAD;
<DEAD>\n BEGIN INITIAL; {printf("Invalid Input\n");}
%%

int yywrap(){
    return 1;
}

/* Main function */
int main(){
    printf("Enter Your Desired Input:\n (Press ctrl+d after input to get results) \n");
    yylex();
    return 0;
}