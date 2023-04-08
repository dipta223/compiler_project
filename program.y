 %{
#include <stdio.h>
#include<stdlib.h>
#include<string.h>
#include<math.h>
extern FILE *yyin,*yyout;
int i,f=0;
typedef struct variable {
			char *str;
	    		int n;
			}array;
array store[1000];
void variable (array *p, char *s, int n);
void valassig (char *s, int n);
int count = 1,cnt = 1,sw=0;
int q=0,prev=0;
float fl;
 %}



%union 
{
	int number;
        char *string;
}

%token <string> VAR STR
%type <number> exp assig else_if if_statement 
%type <string> param 
%token <number> NUM
%token MAIN IF ELSE ELIF TO FOR INT DOUBLE FLOAT CHAR DO WHILE HEADER ID VD LN TAN SIN COS UP UM GT GE LT LE MIN PLUS MUL DIV AND OR NOT EQ NQ CASE DEFAULT STRNG SHOW INPUT SWITCH STRNGG PRIME RET FACTORIAL GCD TUT FUNC
%nonassoc ELSE
%left '<' '>'
%left '+' '-'
%left '*' '/'

%%

program:headers comments functions MAIN '{' statements '}' { printf("Compilation Completed Successfully!!")} ;

headers: headers HEADER {  printf("Header Library Declared Here\n");  }
	| HEADER {  printf("Header LIbrary Declared Here\n");  }
	
	;
comments : comments comment
		|comment
		;
statements:
        statements statement
        | statement;

statement:
	if_statement {
			printf("\n===>The Value Of IF-ELSE Condition is:::  %d",$1);
	}
	|comment
	| assig 
	| for_statement 
	| function_call 
	| while_statement 
	|declaration 
	|switch_statement 
	| in  
	| out 
	| dec
	|retn
	| PRIME '(' exp ')' '!' {
									
										int n, i, fg = 0;

										if ($3 == 1) 
									    {
									      printf("1 is neither a prime nor a composite number\n");
									    }
									    else {
									    for(i = 2; i < $3; ++i)
									    {
									        // condition for nonprime number
									        if($3%i == 0)
									        {
									            fg = 1;
									            break;
									        }
									    }
									    }
									    
									    
									        if (fg == 0)
									          printf("%d is a prime number\n", $3);
									        else
									          printf("%d is not a prime number\n", $3);
									   
									    
								 }
	 | FACTORIAL '(' exp ')''!' {
									int a=1 ,i;
										for(i=1;i<=$3;i++)
										{
											a=a*i;
										}
										
									printf("Factorial  of %d is %d\n",$3,a); 
								 }	

	;






in: INPUT '(' varr ')' '!'  { printf(" was read from console \n ");}
;

varr : varr ',' VAR { printf(" , (%s) variable  ",$3);}
	|VAR  { printf(" (%s) variable ",$1);}
	|
	;




out :SHOW '<' vuu '>' '!' { printf(" was displayed\n");}
;

vuu: vuu varr str
	|varr str
	;

str : str STR { printf(" %s  ",$2);}
	|STR  { printf(" %s  ",$1);}
	|
		;


retn : RET NUM '!'
| RET VAR '!'
;
comment: TUT cnt {printf("This is a COMMENT\n")};

cnt: cnt STRNG
	|STRNG
	;


functions:functions function|
			function;
function:
	head tail { 
            printf("\n===> Function Ends Successfully\n\n"); 
            }
	| 
	;

head:
    type VAR '(' param ')' {
    if(check($2))
						{
							printf("\nERROR: (%s) Used Before \n", $2 );
						
						}
						else
						{
							printf("This Function Name With  Parameter \n");
							variable(&store[count],$2, count);
							q=1;
							count++;
							
						}
    
    }
    |type VAR '(' ')' {
     if(check($2))
					{
							printf("\nERROR: (%s) Used Before \n", $2 );
						
						}
						else
						{
							printf("This Function Name Without  Parameter \n");
							variable(&store[count],$2, count);
							q=1;
							count++;
							
						}
    
    }

;


param:
		| parameter ',' param
		| parameter  

;

parameter :
            type VAR
            ;

function_call:
       FUNC VAR '(' call_param ')' '!' { 
        				if(check($2)){ printf("\n===>Function is Called Here \n");}
        				else {printf("===>Function Not Defined \n");}
        }
     
call_param :
        call_param VAR
		{
		
			if(check($2)){
					
					printf("\n(%s) parameter ",$2);
					
				
			}else{
					printf("ERROR: (%s) Variable Not DEclared   ",$2); 
					
					}
		}
	 | 
 ;


for_statement:
            FOR VAR ':' exp TO exp '{' FOR VAR ':' exp TO exp '{' '}' '}'  {
             printf("\n==>For Loop Works SUccessfully\n");
             }

            { 
            
            int i,j; 
            for(i=$4;i<=$6;i++)
            {
		for(j=$11;j<=$13;j++)
		{
			printf("%d ",j);
		}
		printf("\n");
            }
            }

while_statement:
            WHILE '(' VAR  GE NUM ')' DO '{' '}'
             {	
		printf("inside while loop\n");
		for(int i=6 ;i<=$5;i++)
		{
			printf("%d\n",i); 
		}
             }


switch_statement: SWITCH ':' '{' cases '}'
	{
		sw=0;
		printf("==>Switch Ends Here");
	};
	

cases: cases case
		| case
		;

case: CASE exp '~' assign {
							if($2)
							{
								printf("  Value In SWITCH CASE\n" ); 
								sw++;
							}
						}

	| DEFAULT '~' assign { if(sw == 0)
							{
								printf("Value In DEFAULT CASE\n");
								sw=0;
							}
						}
	;



if_statement:
            IF  exp  '{' if_statement '}' else_if  {
            		if($2 ) {
						$$=$4;
						}

					else
					{
					$$=$6;
					}	
						
				}
           
            |IF  exp  '{' if_statement '}'
            {
            		if($2) {
						$$=$4;
						}
				}
			|exp
            ;

else_if:
         ELIF exp '{' if_statement '}' else_if {
        
        	if($2) {
						$$ =$4;
						}
			else{
					$$=$6;
			}
        }
        |ELSE '{' if_statement '}' {
       
        	$$=$3;
        }  
        | ELIF exp '{' if_statement '}'{
        
        	$$=$4;
        }
        ;




tail:
    statement ';'
    | '{' statements '}' ;




exp:
    NUM    {$$=$1;}
    |VAR { 
		 int i = 1;
		 char *name = store[i].str;
		    while (name) {
			        if (strcmp(name, $1) == 0){
						$$=store[i].n;
						break;
				            }
					name = store[++i].str;
				}

}
    |exp PLUS exp {
    		$$=$1+$3;
    		}
    |exp MIN exp {$$=$1-$3;}
    |exp MUL exp {$$=$1*$3;}
    |exp DIV exp {if($3)
    {
        $$=$1/$3;
        } else
            {
            $$=0;
            printf("\nInvalid Syntax");
            }}
    |exp LT exp {$$=$1 < $3;}
    |exp GT exp {$$=$1 > $3;}
    |'(' exp ')' {$$=$2;}
    |exp UP { 
    						$$=$1 + 1; 
    		}
    |exp UM { $$=$1- 1; }
    |exp GE exp {$$=$1 >= $3;}
    |exp LE exp {$$=$1 >= $3;}
    |exp AND exp {$$=$1 && $3;}
    |exp OR exp {$$=$1 || $3;}
    |NOT exp {$$=!$2;}
    |exp EQ exp {$$=$1==$3;}
    |exp NQ exp {$$=$1!=$3;}
	| SIN '(' exp ')' { fl=sin($3 * 3.14 / 180); printf(" Sine value of %d is %.5g\n",$3,fl); }
	| COS '(' exp ')' { fl=cos($3 * 3.14 / 180); printf(" Cos value of %d is %.5g\n",$3,fl); }
	| TAN '(' exp ')' { fl=tan($3 *3.14 / 180); printf(" Tan value of %d is %.5g\n",$3,fl); }
	| LN '(' exp ')' { fl=log($3); printf(" ln value of %d is %.5g\n",$3,fl); }	
	| exp '^' exp	{
										$$ = pow($1,$3);
									    
											}
	| GCD '(' exp ',' exp ')' {

								int i,n1,n2,gcd;
								n1=$3;
								n2=$5;
						       for(i=1; i <= n1 && i <= n2; ++i)
    							{
        
        							if(n1%i==0 && n2%i==0)
            							gcd = i;
    							}
    							printf("G.C.D of %d and %d is %d", n1, n2, gcd);


	}
    ;




 assign :assign assig 
 		| assig
assig:
    VAR '=' exp '!'{
			if(check($1)){
					
					valassig ($1,$3);
					printf("\nValue of the Variable (%s)= %d\t\n",$1,$3);
					
				
			}else{
					printf("\n(%s) Variable Not DEclared\n",$1); 
					}
		
		}
		| VAR '('  VAR  ')' '!' {
					if(check($1)){
					    printf("\nValue of the Variable (%s)= %s\t",$1,$3);
					
					}
					else{
					printf("\n(%s) Variable Not DEclared\n",$1); 
					}
		}
            ;
		

type:
    INT |
    CHAR|
    FLOAT|
    DOUBLE
    ;



dec: type var1 '!'
;

var1: var1 ',' v1
	|v1
	;

v1 : VAR '=' exp {
				if(check($1)){
					

					printf("\n(%s) Variable  DEclared Before \n",$1);
					
					
				
			}else{ 
					valassig ($1,$3);
					printf("\nValue of the Variable (%s)= %d\t\n",$1,$3);
					}
					}

;

declaration: type VAR1 '!'{	
} ;
VAR1  : VAR1 ',' VAR	{ 

						if(check($3))
						{
							printf("\nERROR:Multiple Declaration Of (%s) \n", $3 );
						
						}
						else
						{
							printf("(%s) Variable Declared\n",$3);
							variable(&store[count],$3, count);
							q=1;
							count++;
							
						}
					}

     |VAR		{

						if(check($1))
						{
							printf("\nERROR:Multiple Declaration Of (%s) \n", $1 );
						}
						else
						{
							printf("(%s) Variable Declared\n",$1);
							variable(&store[count],$1, count);
							count++;

							
						}
			}
     ;
%%

    void variable(array *p, char *s, int n)
				{
				  p->str = s;
				  p->n = n;
				}
   void valassig(char *s, int num)
				{
				    int i = 1;
				    char *name = store[i].str;
				    while (name) {
				        if (strcmp(name, s) == 0){
					store[i].n=num;
						break;
				            }
					name = store[++i].str;
				}
			}

				int check(char *key)
				{
				
				    int i = 1;
				    char *name = store[i].str;
				    while (name) {
				        if (strcmp(name, key) == 0){

				            return i;}

				        name = store[++i].str;
					

				    }
				    return 0;
				}

				

int main()
{
    yyin=freopen("in.txt","r",stdin);
	yyout=freopen("out.txt","w",stdout);

    yyparse();

    fclose(yyin);
 	fclose(yyout);
    return 0;
}
void yyerror(char *s)
{
    printf("%s\n",s);
}
int yywrap()
{
    return 1;
}
