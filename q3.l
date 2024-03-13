/* Initialization Section */
%{
    #include <stdio.h>
%}


/* Define states */
%s q1 DEAD

/* Defining Rules */
%%
<INITIAL>b BEGIN q1;
<INITIAL>a BEGIN INITIAL;
<INITIAL>[^ab\n] BEGIN DEAD;
<INITIAL>\n BEGIN INITIAL; {printf("Rejected\n");}

<q1>b BEGIN INITIAL;
<q1>a BEGIN q1;
<q1>[^ab\n] BEGIN DEAD;
<q1>\n BEGIN INITIAL; {printf("Accepted\n");}

<DEAD>[^\n] BEGIN DEAD;
<DEAD>\n BEGIN INITIAL; {printf("Invalid\n");}
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