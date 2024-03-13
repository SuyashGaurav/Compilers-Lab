/* Initialization Section */
%{
    #include <stdio.h>
    int no_of_words = 0, no_of_special_char = 0, no_of_lines = 0, no_of_spaces = 0, no_of_tabs = 0;
%}

/* Defining Rules */
%%
([a-zA-Z0-9])* {no_of_words++;}
([\n]) {no_of_lines++;}
[ ] {no_of_spaces++;}
([\t]) {no_of_tabs++;}
. {no_of_special_char++;}
%%

int yywrap(){
    return 1;
}

/* Main function */
int main()
{
    printf("Enter Your Desired Input:\n (Press ctrl+d after input to get results) \n");
    yylex();
    printf("Number of Words: %d\n", no_of_words);
    printf("Number of Special Characters: %d\n", no_of_special_char);
    printf("Number of Lines: %d\n", no_of_lines);
    printf("Number of Spaces: %d\n", no_of_spaces);
    printf("Number of Tabs: %d\n", no_of_tabs);
    return 0;
}