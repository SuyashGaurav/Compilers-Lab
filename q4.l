/* Initialization Section */
%{
    #include <stdio.h>
%}


/* Define states */
%s q1 q2 q3 DEAD


%%
<INITIAL>b BEGIN q1;
<INITIAL>a BEGIN q3;
<INITIAL>[^ab\n] BEGIN DEAD;
<INITIAL>\n BEGIN INITIAL; {printf("Rejected\n");}

<q1>b BEGIN q1;
<q1>a BEGIN q2;
<q1>[^ab\n] BEGIN DEAD;
<q1>\n BEGIN INITIAL; {printf("Rejected\n");}

<q2>b BEGIN q1;
<q2>a BEGIN q2;
<q2>[^ab\n] BEGIN DEAD;
<q2>\n BEGIN INITIAL; {printf("Accepted\n");}

<q3>b BEGIN q3;
<q3>a BEGIN q3;
<q3>[^ab\n] BEGIN DEAD;
<q3>\n BEGIN INITIAL; {printf("Rejected\n");}

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